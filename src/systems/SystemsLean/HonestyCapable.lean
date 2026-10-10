/-
  Module: SystemsLean.HonestyCapable
  Front for the Capable string, Bool, and String-field structure dialect.
  The namespace is the one written, not a fixed SystemsLean.Capable.
  String defs, Bool true, and Bool false.
  `structure Name where` then one or more `field : String` and `deriving Repr`.
  A field whose type is not String is none.
  A later def that is not `name : String` or `name : Bool` is not consumed.
  The first token of that def is the stop token.
  This front does not parse `let rec` or `System.FilePath`.
  A chain may use `(name == "literal")`, `(name == true)`,
  `(name == false)`, a bare true Bool, and prefix `!` on a false Bool.
  The stored value has to match. false is not accepted as true.
  Two IO defs are only the statements in that file: println lines,
  `if productPathFreestandingCapableOk then` one println
  `else` eprintln and `throw (IO.userError ...)`,
  and `main` with `pure 0` on the try path and `pure 1` on the catch
  path after eprintln of `{e}`.
  An interpolation hole must name a def parsed from this file.
  `{e}` is only the catch line. A catch that drops the error is none.
  This is not a general `do` parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelReduce
import SystemsLean.HonestyFront
import SystemsLean.HonestyDecide
import SystemsLean.HonestyBound

namespace SystemsLean.HonestyCapable

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyDecide
open SystemsLean.HonestyFront (strip isIdent unquote parseDotted parseFuel
  isLetter isDigit isWs isIdentChar)
open SystemsLean.HonestyBound

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens for this dialect. `==`, `&&`, `:=`, and `=>` stay one token.
    A lone `=` or `&` is none. `>` is one token. An unknown character
    returns the tokens already read and drops that character.
    An unclosed string is none. -/
def tok : List Char -> TMode -> List String -> Option (List String)
  | [], TMode.norm, acc => some acc.reverse
  | [], TMode.id cur, acc => some (emitId acc cur).reverse
  | [], TMode.str _, _ => none
  | '"' :: rest, TMode.str cur, acc =>
    tok rest TMode.norm (emitStr acc cur)
  | c :: rest, TMode.str cur, acc =>
    tok rest (TMode.str (c :: cur)) acc
  | ':' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":=" :: acc)
  | '=' :: '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("=>" :: acc)
  | '=' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("==" :: acc)
  | '&' :: '&' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("&&" :: acc)
  | '=' :: _, TMode.norm, _ => none
  | '&' :: _, TMode.norm, _ => none
  | '!' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("!" :: acc)
  | ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":" :: acc)
  | '(' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("(" :: acc)
  | ')' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (")" :: acc)
  | '.' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("." :: acc)
  | '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (">" :: acc)
  | '"' :: rest, TMode.norm, acc =>
    tok rest (TMode.str []) acc
  | c :: rest, TMode.norm, acc =>
    if isWs c then tok rest TMode.norm acc
    else if isLetter c || c == '_' then
      tok rest (TMode.id [c]) acc
    else if isDigit c then
      tok rest TMode.norm (String.mk [c] :: acc)
    else
      some acc.reverse
  | ':' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":=" :: emitId acc cur)
  | '=' :: '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("=>" :: emitId acc cur)
  | '=' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("==" :: emitId acc cur)
  | '&' :: '&' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("&&" :: emitId acc cur)
  | '=' :: _, TMode.id _, _ => none
  | '&' :: _, TMode.id _, _ => none
  | '!' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("!" :: emitId acc cur)
  | ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":" :: emitId acc cur)
  | '(' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("(" :: emitId acc cur)
  | ')' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (")" :: emitId acc cur)
  | '.' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("." :: emitId acc cur)
  | '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (">" :: emitId acc cur)
  | c :: rest, TMode.id cur, acc =>
    if isIdentChar c then
      tok rest (TMode.id (c :: cur)) acc
    else if isWs c then
      tok rest TMode.norm (emitId acc cur)
    else
      some (emitId acc cur).reverse

structure CapEnv where
  strs : List (Prod String String)
  bools : List (Prod String Bool)
  defs : DefEnv

def emptyEnv : CapEnv := { strs := [], bools := [], defs := [] }

def lookupStr : List (Prod String String) -> String -> Option String
  | [], _ => none
  | (nm, s) :: rest, name =>
    if nm == name then some s else lookupStr rest name

def lookupBool : List (Prod String Bool) -> String -> Option Bool
  | [], _ => none
  | (nm, b) :: rest, name =>
    if nm == name then some b else lookupBool rest name

def known (env : CapEnv) (name : String) : Bool :=
  match lookupStr env.strs name with
  | some _ => true
  | none =>
    match lookupBool env.bools name with
    | some _ => true
    | none => false

def addStr (env : CapEnv) (name s : String) : CapEnv :=
  let body := Term.litString s
  { env with
    strs := (name, s) :: env.strs
    defs := (name, { binder := "", body := body }) :: env.defs }

def addBool (env : CapEnv) (name : String) (value : Bool) (body : Term) :
    CapEnv :=
  { env with
    bools := (name, value) :: env.bools
    defs := (name, { binder := "", body := body }) :: env.defs }

def reducesTrue (env : CapEnv) (body : Term) : Bool :=
  match decideReduce decideFuel env.defs body with
  | Term.litBool true => true
  | _ => false

def notTerm (name : String) : Term :=
  Term.ite (Term.var (n name)) (Term.litBool false) (Term.litBool true)

/-- One chain atom. A compare has to match the stored value.
    Prefix `!` is only a true atom when that Bool is false. -/
def parseAtom (env : CapEnv) (ts : List String) :
    Option (Prod Term (List String)) :=
  match ts with
  | "!" :: name :: rest =>
    if isIdent name then
      match lookupBool env.bools name with
      | some false => some (notTerm name, rest)
      | _ => none
    else
      none
  | "(" :: name :: "==" :: "true" :: ")" :: rest =>
    if isIdent name && lookupBool env.bools name == some true then
      some (Term.decideEq (Term.var (n name)) (Term.litBool true), rest)
    else
      none
  | "(" :: name :: "==" :: "false" :: ")" :: rest =>
    if isIdent name && lookupBool env.bools name == some false then
      some (Term.decideEq (Term.var (n name)) (Term.litBool false), rest)
    else
      none
  | "(" :: name :: "==" :: lit :: ")" :: rest =>
    if isIdent name then
      match unquote lit, lookupStr env.strs name with
      | some s, some want =>
        if s == want then
          some (Term.decideEq (Term.var (n name)) (Term.litString s), rest)
        else
          none
      | _, _ => none
    else
      none
  | name :: rest =>
    if isIdent name && lookupBool env.bools name == some true then
      some (Term.var (n name), rest)
    else
      none
  | _ => none

def parseChain (fuel : Nat) (env : CapEnv) (acc : Term) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "&&" :: rest =>
      match parseAtom env rest with
      | some (right, rest2) =>
        let acc2 := Term.ite acc right (Term.litBool false)
        parseChain k env acc2 rest2
      | none => none
    | _ => some (acc, ts)
termination_by fuel

def parseBoolBody (env : CapEnv) (ts : List String) :
    Option (Prod Term (List String)) :=
  match ts with
  | "true" :: "&&" :: _ => none
  | "false" :: "&&" :: _ => none
  | "true" :: rest => some (Term.litBool true, rest)
  | "false" :: rest => some (Term.litBool false, rest)
  | _ =>
    match parseAtom env ts with
    | none => none
    | some (atom, rest) => parseChain parseFuel env atom rest

def strNames : List (Prod String String) -> List String
  | [] => []
  | (nm, _) :: rest => nm :: strNames rest

def boolNames : List (Prod String Bool) -> List String
  | [] => []
  | (nm, _) :: rest => nm :: boolNames rest

def allowNames (env : CapEnv) : List String :=
  strNames env.strs ++ boolNames env.bools

def mem : List String -> String -> Bool
  | [], _ => false
  | y :: ys, s => y == s || mem ys s

inductive HoleMode where
  | text
  | hole (acc : List Char)

/-- `{name}` holes. A hole must be one ident in `allow`. -/
def holesOk (allow : List String) (cs : List Char) (mode : HoleMode) : Bool :=
  match cs, mode with
  | [], HoleMode.text => true
  | [], HoleMode.hole _ => false
  | '{' :: _, HoleMode.hole _ => false
  | '}' :: rest, HoleMode.hole acc =>
    mem allow (String.mk acc.reverse) && holesOk allow rest HoleMode.text
  | c :: rest, HoleMode.hole acc =>
    if isIdentChar c then
      holesOk allow rest (HoleMode.hole (c :: acc))
    else
      false
  | '{' :: rest, HoleMode.text =>
    holesOk allow rest (HoleMode.hole [])
  | '}' :: _, HoleMode.text => false
  | _ :: rest, HoleMode.text => holesOk allow rest HoleMode.text

def parseArg (allow : List String) (ts : List String) :
    Option (List String) :=
  match ts with
  | "s" :: "!" :: lit :: rest =>
    match unquote lit with
    | some s =>
      if holesOk allow s.toList HoleMode.text then some rest else none
    | none => none
  | lit :: rest =>
    match unquote lit with
    | some s =>
      if holesOk [] s.toList HoleMode.text then some rest else none
    | none => none
  | _ => none

def parsePrintln (allow : List String) (ts : List String) :
    Option (List String) :=
  match ts with
  | "IO" :: "." :: "println" :: rest => parseArg allow rest
  | _ => none

def parsePrints (fuel : Nat) (allow : List String) (nprints : Nat)
    (ts : List String) : Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parsePrintln allow ts with
    | some rest => parsePrints k allow (nprints + 1) rest
    | none => if nprints > 0 then some ts else none
termination_by fuel

/-- Then-branch is one println. Else is eprintln and throw.
    Anything else, including a catch that only returns, is none. -/
def parseIf (allow : List String) (ts : List String) :
    Option (List String) :=
  match ts with
  | "if" :: "productPathFreestandingCapableOk" :: "then" :: rest =>
    match parsePrintln allow rest with
    | none => none
    | some rest2 =>
      match rest2 with
      | "else" :: "IO" :: "." :: "eprintln" :: rest3 =>
        match parseArg allow rest3 with
        | none => none
        | some rest4 =>
          match rest4 with
          | "throw" :: "(" :: "IO" :: "." :: "userError" :: lit :: ")" :: rest5 =>
            match unquote lit with
            | some s =>
              if holesOk [] s.toList HoleMode.text then some rest5 else none
            | none => none
          | _ => none
      | _ => none
  | _ => none

inductive Try where
  | skip
  | bad
  | got (rest : List String)

/-- `printGapMeasure` that is not the written IO shape is bad.
    Any other next token is skip, so a sibling can stop there. -/
def parseGap (env : CapEnv) (ts : List String) : Try :=
  match ts with
  | "def" :: "printGapMeasure" :: ":" :: "IO" :: "Unit" :: ":=" :: "do" :: rest =>
    if lookupBool env.bools "productPathFreestandingCapableOk" == some true then
      match parsePrints parseFuel (allowNames env) 0 rest with
      | none => Try.bad
      | some rest2 =>
        match parseIf (allowNames env) rest2 with
        | some rest3 => Try.got rest3
        | none => Try.bad
    else
      Try.bad
  | _ => Try.skip

def catchArg : String := "\"{e}\""

/-- Ok path exits 0. Catch path prints `{e}` and exits 1. -/
def parseMain (ts : List String) : Option (List String) :=
  match ts with
  | "def" :: "main" :: "(" :: "_args" :: ":" :: "List" :: "String" :: ")"
      :: ":" :: "IO" :: "UInt32" :: ":=" :: "do" :: "try"
      :: "printGapMeasure" :: "pure" :: "0" :: "catch" :: "e" :: "=>"
      :: "IO" :: "." :: "eprintln" :: "s" :: "!" :: lit
      :: "pure" :: "1" :: rest =>
    if lit == catchArg then some rest else none
  | _ => none

def gapCmd : Cmd :=
  Cmd.def_ (n "printGapMeasure") (some HostType.bool) (Term.litBool true)

/-- Then-branch is the ok exit. Else-branch is the catch exit. -/
def mainCmd : Cmd :=
  Cmd.def_ (n "main") (some HostType.nat)
    (Term.ite (Term.litBool true) (Term.litNat 0) (Term.litNat 1))

def parseDef (env : CapEnv) (ts : List String) :
    Option (Prod Cmd (Prod CapEnv (List String))) :=
  match ts with
  | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
    if isIdent name && !known env name then
      match unquote lit with
      | some s =>
        let body := Term.litString s
        let cmd := Cmd.def_ (n name) (some HostType.string) body
        some (cmd, addStr env name s, rest)
      | none => none
    else
      none
  | "def" :: name :: ":" :: "Bool" :: ":=" :: rest =>
    if isIdent name && !known env name then
      match parseBoolBody env rest with
      | some (body, rest2) =>
        match body with
        | Term.litBool false =>
          let cmd := Cmd.def_ (n name) (some HostType.bool) body
          some (cmd, addBool env name false body, rest2)
        | _ =>
          if reducesTrue env body then
            let cmd := Cmd.def_ (n name) (some HostType.bool) body
            some (cmd, addBool env name true body, rest2)
          else
            none
      | none => none
    else
      none
  | _ => none

def parseDefs (fuel : Nat) (env : CapEnv) (acc : List Cmd) (ts : List String) :
    Option (Prod (List Cmd) (Prod CapEnv (List String))) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: _ :: ":" :: "String" :: _ =>
      match parseDef env ts with
      | some (cmd, env2, rest) => parseDefs k env2 (cmd :: acc) rest
      | none => none
    | "def" :: _ :: ":" :: "Bool" :: _ =>
      match parseDef env ts with
      | some (cmd, env2, rest) => parseDefs k env2 (cmd :: acc) rest
      | none => none
    | _ => some (acc.reverse, env, ts)
termination_by fuel

/-- Fields are `name : String` until `deriving Repr`. Another type is none. -/
def parseFields (fuel : Nat) (acc : List FieldDecl) (ts : List String) :
    Option (Prod (List FieldDecl) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "deriving" :: "Repr" :: rest =>
      if acc.isEmpty then none else some (acc.reverse, rest)
    | name :: ":" :: "String" :: rest =>
      if isIdent name then
        let f : FieldDecl := { name := n name, ty := HostType.string }
        parseFields k (f :: acc) rest
      else
        none
    | _ => none
termination_by fuel

def parseStruct (ts : List String) : Option (Prod Cmd (List String)) :=
  match ts with
  | "structure" :: name :: "where" :: rest =>
    if isIdent name then
      match parseFields parseFuel [] rest with
      | some (fields, rest2) =>
        some (Cmd.structure_ (n name) fields [n "Repr"], rest2)
      | none => none
    else
      none
  | _ => none

def finish (ns : String) (defs : List Cmd) (ts : List String) :
    Option Module :=
  if defs.isEmpty then
    none
  else
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && rest2.isEmpty then
          let cmds :=
            Cmd.namespace (n ns) :: defs ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none

inductive CapOut where
  | miss
  | stop (tok : String)
  | ok (m : Module)

/-- Gap tail, `end`, or the first token still unparsed. -/
def closeRest (ns : String) (defs : List Cmd) (env : CapEnv)
    (ts : List String) : CapOut :=
  match parseGap env ts with
  | Try.bad => CapOut.miss
  | Try.got rest4 =>
    match parseMain rest4 with
    | none => CapOut.miss
    | some rest5 =>
      match finish ns (defs ++ [gapCmd, mainCmd]) rest5 with
      | some m => CapOut.ok m
      | none => CapOut.miss
  | Try.skip =>
    match ts with
    | "end" :: _ =>
      match finish ns defs ts with
      | some m => CapOut.ok m
      | none => CapOut.miss
    | t :: _ =>
      if defs.isEmpty then CapOut.miss else CapOut.stop t
    | [] => CapOut.miss

/-- After the simple defs: a String structure, a binder Bool if,
    the Capable IO tail, or `end`. Anything else stops on its first token.
    A bad accepted form is miss, not a stop token. -/
def takeForms (fuel : Nat) (ns : String) (defs : List Cmd) (env : CapEnv)
    (ts : List String) : CapOut :=
  match fuel with
  | 0 => CapOut.miss
  | Nat.succ k =>
    match ts with
    | "structure" :: _ =>
      match parseStruct ts with
      | none => CapOut.miss
      | some (cmd, rest) =>
        match parseDefs parseFuel env [] rest with
        | none => CapOut.miss
        | some (more, env2, rest2) =>
          takeForms k ns (defs ++ [cmd] ++ more) env2 rest2
    | "def" :: _ :: "(" :: _ =>
      match parseBoundBool ts with
      | Bound.bad => CapOut.miss
      | Bound.skip => closeRest ns defs env ts
      | Bound.got cmd rest =>
        match parseDefs parseFuel env [] rest with
        | none => CapOut.miss
        | some (more, env2, rest2) =>
          takeForms k ns (defs ++ [cmd] ++ more) env2 rest2
    | _ =>
      closeRest ns defs env ts
termination_by fuel

def walk (src : String) : CapOut :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => CapOut.miss
  | some kept =>
    match tok kept TMode.norm [] with
    | none => CapOut.miss
    | some ts =>
      match ts with
      | "namespace" :: rest =>
        match parseDotted parseFuel rest with
        | none => CapOut.miss
        | some (ns, rest2) =>
          match parseDefs parseFuel emptyEnv [] rest2 with
          | none => CapOut.miss
          | some (defs, env, rest3) =>
            takeForms parseFuel ns defs env rest3
      | _ => CapOut.miss

/-- Parse this dialect. none means miss or a named stop, or a bad statement. -/
def parseCapableText (src : String) : Option Module :=
  match walk src with
  | CapOut.ok m => some m
  | _ => none

/-- First token not consumed, when a prefix of this dialect parsed. -/
def stoppedToken (src : String) : Option String :=
  match walk src with
  | CapOut.stop t => some t
  | _ => none

def capableToy : String :=
  "namespace SystemsLean.Capable\n" ++
  "def stageId : String := \"S\"\n" ++
  "def productPathFreestandingCapableFullPerform : Bool := false\n" ++
  "def productPathFreestandingCapableInstallOnly : Bool := true\n" ++
  "def productPathFreestandingCapableOk : Bool :=\n" ++
  "  (stageId == \"S\") &&\n" ++
  "  (productPathFreestandingCapableInstallOnly == true) &&\n" ++
  "  (productPathFreestandingCapableFullPerform == false)\n" ++
  "def ready : Bool :=\n" ++
  "  productPathFreestandingCapableOk &&\n" ++
  "  productPathFreestandingCapableInstallOnly &&\n" ++
  "  !productPathFreestandingCapableFullPerform\n" ++
  "def printGapMeasure : IO Unit := do\n" ++
  "  IO.println s!\"== {stageId} ==\"\n" ++
  "  if productPathFreestandingCapableOk then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln s!\"error: {stageId}\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printGapMeasure\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    IO.eprintln s!\"{e}\"\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Capable\n"

def capableToyAccepts : Bool :=
  match parseCapableText capableToy with
  | some _ => true
  | none => false

def capableFalseToy : String :=
  "namespace SystemsLean.Capable\n" ++
  "def productPathFreestandingCapableFullPerform : Bool := false\n" ++
  "def productPathFreestandingCapableOk : Bool :=\n" ++
  "  (productPathFreestandingCapableFullPerform == true)\n" ++
  "def printGapMeasure : IO Unit := do\n" ++
  "  IO.println \"x\"\n" ++
  "  if productPathFreestandingCapableOk then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln \"error\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printGapMeasure\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    IO.eprintln s!\"{e}\"\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Capable\n"

/-- `== true` on a false Bool is not accepted. -/
def capableFalseRejects : Bool :=
  match parseCapableText capableFalseToy with
  | some _ => false
  | none => true

def capableDropToy : String :=
  "namespace SystemsLean.Capable\n" ++
  "def productPathFreestandingCapableOk : Bool := true\n" ++
  "def printGapMeasure : IO Unit := do\n" ++
  "  IO.println \"x\"\n" ++
  "  if productPathFreestandingCapableOk then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln \"error\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printGapMeasure\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Capable\n"

/-- A catch that does not print the error is not accepted. -/
def capableDropRejects : Bool :=
  match parseCapableText capableDropToy with
  | some _ => false
  | none => true

def capableHoleToy : String :=
  "namespace SystemsLean.Capable\n" ++
  "def productPathFreestandingCapableOk : Bool := true\n" ++
  "def printGapMeasure : IO Unit := do\n" ++
  "  IO.println s!\"{missing}\"\n" ++
  "  if productPathFreestandingCapableOk then\n" ++
  "    IO.println \"GREEN\"\n" ++
  "  else\n" ++
  "    IO.eprintln \"error\"\n" ++
  "    throw (IO.userError \"ok false\")\n" ++
  "def main (_args : List String) : IO UInt32 := do\n" ++
  "  try\n" ++
  "    printGapMeasure\n" ++
  "    pure 0\n" ++
  "  catch e =>\n" ++
  "    IO.eprintln s!\"{e}\"\n" ++
  "    pure 1\n" ++
  "end SystemsLean.Capable\n"

/-- An interpolation that is not a def in this file is not accepted. -/
def capableHoleRejects : Bool :=
  match parseCapableText capableHoleToy with
  | some _ => false
  | none => true

/-- A false equation is miss, not a stop token. -/
def capableFalseNoStop : Bool :=
  match stoppedToken capableFalseToy with
  | none => true
  | some _ => false

/-- A bad gap body is miss, not a stop token. -/
def capableDropNoStop : Bool :=
  match stoppedToken capableDropToy with
  | none => true
  | some _ => false

def capableHoleNoStop : Bool :=
  match stoppedToken capableHoleToy with
  | none => true
  | some _ => false

def capableStructToy : String :=
  "namespace SystemsLean.StructToy\n" ++
  "def stageId : String := \"S\"\n" ++
  "def flag : Bool := false\n" ++
  "structure ComposeSsotSpec where\n" ++
  "  base : String\n" ++
  "  token : String\n" ++
  "  deriving Repr\n" ++
  "end SystemsLean.StructToy\n"

/-- Another namespace with a String structure and `end` is this dialect. -/
def capableStructAccepts : Bool :=
  match parseCapableText capableStructToy with
  | some _ => true
  | none => false

def capableBadFieldToy : String :=
  "namespace SystemsLean.StructToy\n" ++
  "def stageId : String := \"S\"\n" ++
  "structure ComposeSsotSpec where\n" ++
  "  base : Nat\n" ++
  "  deriving Repr\n" ++
  "end SystemsLean.StructToy\n"

/-- A structure field whose type is not String is not accepted. -/
def capableBadFieldRejects : Bool :=
  match parseCapableText capableBadFieldToy with
  | some _ => false
  | none => true

def capableBadFieldNoStop : Bool :=
  match stoppedToken capableBadFieldToy with
  | none => true
  | some _ => false

def capableStopToy : String :=
  "namespace SystemsLean.CapableCompose\n" ++
  "def stageId : String := \"S\"\n" ++
  "def flag : Bool := false\n" ++
  "structure ComposeSsotSpec where\n" ++
  "  base : String\n" ++
  "  deriving Repr\n" ++
  "def ssotBlock (content name : String) : Option String :=\n" ++
  "end SystemsLean.CapableCompose\n"

/-- `def ssotBlock` is not this Bool if. The first token is def. -/
def capableStopToken : Bool :=
  match stoppedToken capableStopToy, parseCapableText capableStopToy with
  | some "def", none => true
  | _, _ => false

def capableGtToy : String :=
  "namespace SystemsLean.ContainsToy\n" ++
  "def flag : Bool := false\n" ++
  "def containsStr (s needle : String) : Bool :=\n" ++
  "  if needle.isEmpty then false\n" ++
  "  else (s.splitOn needle).length > 1\n" ++
  "end SystemsLean.ContainsToy\n"

/-- The binder if, including `>`, is accepted. false stays false. -/
def capableGtAccepts : Bool :=
  match parseCapableText capableGtToy with
  | some _ => true
  | none => false

def capableGtStopToy : String :=
  "namespace SystemsLean.CapableCompose\n" ++
  "def containsStr (s needle : String) : Bool :=\n" ++
  "  if needle.isEmpty then false\n" ++
  "  else (s.splitOn needle).length > 1\n" ++
  "def ssotBlock (content name : String) : Option String :=\n" ++
  "end SystemsLean.CapableCompose\n"

/-- After containsStr, the next def is the first unparsed token. -/
def capableGtStops : Bool :=
  match stoppedToken capableGtStopToy, parseCapableText capableGtStopToy with
  | some "def", none => true
  | _, _ => false

def capableNoGtToy : String :=
  "namespace SystemsLean.ContainsToy\n" ++
  "def containsStr (s needle : String) : Bool :=\n" ++
  "  if needle.isEmpty then false\n" ++
  "  else (s.splitOn needle).length 1\n" ++
  "end SystemsLean.ContainsToy\n"

/-- A binder Bool def with no `>` token is miss. -/
def capableNoGtRejects : Bool :=
  match parseCapableText capableNoGtToy, stoppedToken capableNoGtToy with
  | none, none => true
  | _, _ => false

end SystemsLean.HonestyCapable
