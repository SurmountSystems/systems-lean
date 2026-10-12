/-
  Module: SystemsLean.HonestyEmitScafFront
  Front for the zero-import emit apply scaffold.
  After strip, the first token is namespace, not import.
  Any import list is none. EmitApply.lean is none.
  The namespace is SystemsLean.EmitApply.
  One `++` outside strings selects the scaffold join.
  emitApplyReady is the unreduced && chain, not a lone true.
  theorem emitApplyReady_true is held only when the claim
  is emitApplyReady = true proved by `by decide`.
  Examples proved by `by decide` are seen and not emitted.
  The file name is not stored. A path string is not a key.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront

namespace SystemsLean.HonestyEmitScafFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce (DefEnv)
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent
    isDigit isWs isLetter isIdentChar)

def nsSeed : String := "SystemsLean.EmitApply"

/-- One step per command. -/
def itemFuel : Nat := 128

/-- Token scans inside one command. Fuel 0 is none. -/
def scanFuel : Nat := 8192

def emptyEnv : DefEnv := []

/-- Literals only. A lone Bool is not this chain. -/
def seedHolds : Bool :=
  decideHolds emptyEnv
      (Term.litString "SLAKE_SELF_HOST_EMIT_APPLY_V0")
      (Term.litString "SLAKE_SELF_HOST_EMIT_APPLY_V0")
    && decideHolds emptyEnv
      (Term.litString "HOST-EMIT-APPLY")
      (Term.litString "HOST-EMIT-APPLY")
    && decideHolds emptyEnv
      (Term.litString "SELF-HOST-EMIT-APPLY")
      (Term.litString "SELF-HOST-EMIT-APPLY")
    && decideHolds emptyEnv
      (Term.litBool true) (Term.litBool true)
    && !decideHolds emptyEnv
      (Term.litBool true) (Term.litBool false)

structure Walk where
  sawPlusPlus : Bool
  sawExample : Bool
  sawReadyChain : Bool
  sawThm : Bool
  cmds : List Cmd

def emptyWalk : Walk :=
  { sawPlusPlus := false
    sawExample := false
    sawReadyChain := false
    sawThm := false
    cmds := [] }

def emitHeld : Cmd :=
  Cmd.def_ (n "emitApplyReady_true") (some HostType.bool)
    (Term.litBool true)

inductive TokMode where
  | norm
  | id (cur : List Char)
  | num (cur : List Char)
  | str (cur : List Char)

/-- An identifier or number is the reversed character list. -/
def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitNum (acc : List String) (cur : List Char) : List String :=
  emitId acc cur

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Own tokenizer. Not HonestyFront.tok.
    `++` is one token in norm, id, and num, before a lone `+`.
    A lone `=` is a token. A lone `&` is none. Digits stay one number.
    String mode keeps an escaped quote. Strip leaves `\"` in the body.
    Every recursive call is on `rest`. -/
def tok : List Char -> TokMode -> List String -> Option (List String)
  | [], TokMode.norm, acc => some acc.reverse
  | [], TokMode.id cur, acc => some (emitId acc cur).reverse
  | [], TokMode.num cur, acc => some (emitNum acc cur).reverse
  | [], TokMode.str _, _ => none
  | '\\' :: c :: rest, TokMode.str cur, acc =>
    tok rest (TokMode.str (c :: '\\' :: cur)) acc
  | '"' :: rest, TokMode.str cur, acc =>
    tok rest TokMode.norm (emitStr acc cur)
  | c :: rest, TokMode.str cur, acc =>
    tok rest (TokMode.str (c :: cur)) acc
  | ':' :: '=' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm (":=" :: acc)
  | '=' :: '=' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("==" :: acc)
  | '&' :: '&' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("&&" :: acc)
  | '-' :: '>' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("->" :: acc)
  | '=' :: '>' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("=>" :: acc)
  | '<' :: '=' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("<=" :: acc)
  | '=' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("=" :: acc)
  | ':' :: rest, TokMode.norm, acc => tok rest TokMode.norm (":" :: acc)
  | '.' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("." :: acc)
  | '+' :: '+' :: rest, TokMode.norm, acc =>
    tok rest TokMode.norm ("++" :: acc)
  | '+' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("+" :: acc)
  | '*' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("*" :: acc)
  | '/' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("/" :: acc)
  | '%' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("%" :: acc)
  | '!' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("!" :: acc)
  | '<' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("<" :: acc)
  | '>' :: rest, TokMode.norm, acc => tok rest TokMode.norm (">" :: acc)
  | '|' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("|" :: acc)
  | ',' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("," :: acc)
  | '(' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("(" :: acc)
  | ')' :: rest, TokMode.norm, acc => tok rest TokMode.norm (")" :: acc)
  | '[' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("[" :: acc)
  | ']' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("]" :: acc)
  | '{' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("{" :: acc)
  | '}' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("}" :: acc)
  | '-' :: rest, TokMode.norm, acc => tok rest TokMode.norm ("-" :: acc)
  | '"' :: rest, TokMode.norm, acc => tok rest (TokMode.str []) acc
  | '&' :: _, TokMode.norm, _ => none
  | c :: rest, TokMode.norm, acc =>
    if isWs c then tok rest TokMode.norm acc
    else if isDigit c then tok rest (TokMode.num [c]) acc
    else if isLetter c || c == '_' then
      tok rest (TokMode.id [c]) acc
    else none
  | ':' :: '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (":=" :: emitId acc cur)
  | '=' :: '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("==" :: emitId acc cur)
  | '&' :: '&' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("&&" :: emitId acc cur)
  | '-' :: '>' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("->" :: emitId acc cur)
  | '=' :: '>' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("=>" :: emitId acc cur)
  | '<' :: '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("<=" :: emitId acc cur)
  | '=' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("=" :: emitId acc cur)
  | ':' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (":" :: emitId acc cur)
  | '.' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("." :: emitId acc cur)
  | '+' :: '+' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("++" :: emitId acc cur)
  | '+' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("+" :: emitId acc cur)
  | '*' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("*" :: emitId acc cur)
  | '/' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("/" :: emitId acc cur)
  | '%' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("%" :: emitId acc cur)
  | '!' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("!" :: emitId acc cur)
  | '<' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("<" :: emitId acc cur)
  | '>' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (">" :: emitId acc cur)
  | '|' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("|" :: emitId acc cur)
  | ',' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("," :: emitId acc cur)
  | '(' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("(" :: emitId acc cur)
  | ')' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm (")" :: emitId acc cur)
  | '[' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("[" :: emitId acc cur)
  | ']' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("]" :: emitId acc cur)
  | '{' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("{" :: emitId acc cur)
  | '}' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("}" :: emitId acc cur)
  | '-' :: rest, TokMode.id cur, acc =>
    tok rest TokMode.norm ("-" :: emitId acc cur)
  | '"' :: rest, TokMode.id cur, acc =>
    tok rest (TokMode.str []) (emitId acc cur)
  | '&' :: _, TokMode.id _, _ => none
  | c :: rest, TokMode.id cur, acc =>
    if isIdentChar c then tok rest (TokMode.id (c :: cur)) acc
    else if isWs c then tok rest TokMode.norm (emitId acc cur)
    else none
  | ':' :: '=' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm (":=" :: emitNum acc cur)
  | '=' :: '=' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("==" :: emitNum acc cur)
  | '&' :: '&' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("&&" :: emitNum acc cur)
  | '-' :: '>' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("->" :: emitNum acc cur)
  | '=' :: '>' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("=>" :: emitNum acc cur)
  | '<' :: '=' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("<=" :: emitNum acc cur)
  | '=' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("=" :: emitNum acc cur)
  | ':' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm (":" :: emitNum acc cur)
  | '.' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("." :: emitNum acc cur)
  | '+' :: '+' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("++" :: emitNum acc cur)
  | '+' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("+" :: emitNum acc cur)
  | '*' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("*" :: emitNum acc cur)
  | '/' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("/" :: emitNum acc cur)
  | '%' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("%" :: emitNum acc cur)
  | '!' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("!" :: emitNum acc cur)
  | '<' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("<" :: emitNum acc cur)
  | '>' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm (">" :: emitNum acc cur)
  | '|' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("|" :: emitNum acc cur)
  | ',' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("," :: emitNum acc cur)
  | '(' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("(" :: emitNum acc cur)
  | ')' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm (")" :: emitNum acc cur)
  | '[' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("[" :: emitNum acc cur)
  | ']' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("]" :: emitNum acc cur)
  | '{' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("{" :: emitNum acc cur)
  | '}' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("}" :: emitNum acc cur)
  | '-' :: rest, TokMode.num cur, acc =>
    tok rest TokMode.norm ("-" :: emitNum acc cur)
  | '"' :: rest, TokMode.num cur, acc =>
    tok rest (TokMode.str []) (emitNum acc cur)
  | '&' :: _, TokMode.num _, _ => none
  | c :: rest, TokMode.num cur, acc =>
    if isDigit c then tok rest (TokMode.num (c :: cur)) acc
    else if isWs c then tok rest TokMode.norm (emitNum acc cur)
    else none

def isHead : String -> Bool
  | "def" => true
  | "theorem" => true
  | "example" => true
  | "namespace" => true
  | "end" => true
  | "private" => true
  | "structure" => true
  | "inductive" => true
  | "abbrev" => true
  | "set_option" => true
  | _ => false

/-- `(` `[` `{` increase. A closer under zero is none. -/
def adj (d : Nat) (t : String) : Option Nat :=
  if t == "(" || t == "[" || t == "{" then
    some (d + 1)
  else if t == ")" || t == "]" || t == "}" then
    match d with
    | 0 => none
    | Nat.succ j => some j
  else
    some d

/-- Walk to the next head at depth 0. A `++` token sets the flag. -/
def skipScan (fuel : Nat) (d : Nat) (pp : Bool) (ts : List String) :
    Option (Prod Bool (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] =>
      if d == 0 then some (pp, []) else none
    | t :: rest =>
      if d == 0 && isHead t then some (pp, t :: rest)
      else if t == "++" then skipScan k d true rest
      else
        match adj d t with
        | none => none
        | some d2 => skipScan k d2 pp rest
termination_by fuel

/-- Binders run until `:` at depth 0. A colon in `(hc : Host)` stays. -/
def skipToColon (fuel : Nat) (d : Nat) (ts : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | ":" :: rest =>
      if d == 0 then some rest else skipToColon k d rest
    | t :: rest =>
      match adj d t with
      | none => none
      | some d2 => skipToColon k d2 rest
termination_by fuel

/-- Claim tokens stop at `:=` at depth 0. An inner `:=` stays. -/
def takeUntilAssign (fuel : Nat) (d : Nat) (acc : List String)
    (ts : List String) : Option (Prod (List String) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | ":=" :: rest =>
      if d == 0 then some (acc.reverse, rest)
      else takeUntilAssign k d (":=" :: acc) rest
    | t :: rest =>
      match adj d t with
      | none => none
      | some d2 => takeUntilAssign k d2 (t :: acc) rest
termination_by fuel

/-- Split on a lone `=` at depth 0. `==` is not that split. -/
def splitEq (fuel : Nat) (d : Nat) (acc : List String) (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | "=" :: rest =>
      if d == 0 then some (acc.reverse, rest)
      else splitEq k d ("=" :: acc) rest
    | t :: rest =>
      match adj d t with
      | none => none
      | some d2 => splitEq k d2 (t :: acc) rest
termination_by fuel

def hasPP (ts : List String) : Bool :=
  match ts with
  | [] => false
  | "++" :: _ => true
  | _ :: rest => hasPP rest

def markPP (w : Walk) (claim : List String) : Walk :=
  { w with sawPlusPlus := w.sawPlusPlus || hasPP claim }

/-- The unreduced chain. A lone `true` is not this body. -/
def isReadyBody (ts : List String) : Option (List String) :=
  match ts with
  | "emitApplySurfaceOk" :: "&&" :: rest =>
    match rest with
    | "applyHeaderHonestyOk" :: "&&" :: rest2 =>
      match rest2 with
      | "applyBodyHonestyOk" :: rest3 => some rest3
      | _ => none
    | _ => none
  | _ => none

def takeReady (ts : List String) : Option (List String) :=
  match ts with
  | ":" :: "Bool" :: ":=" :: rest =>
    match isReadyBody rest with
    | some rest2 =>
      match rest2 with
      | h :: _ =>
        if isHead h then some rest2 else none
      | [] => none
    | none => none
  | _ => none

/-- Held only when the decided Bool is true. False is not litBool true. -/
def useThm (w : Walk) (ts : List String) :
    Option (Prod Walk (List String)) :=
  match skipToColon scanFuel 0 ts with
  | none => none
  | some afterColon =>
    match takeUntilAssign scanFuel 0 [] afterColon with
    | none => none
    | some (claim, rest) =>
      match splitEq scanFuel 0 [] claim with
      | none => none
      | some (lhs, rhs) =>
        match rest with
        | "by" :: "decide" :: rest2 =>
          let w2 := markPP w claim
          match lhs, rhs with
          | ["emitApplyReady"], ["true"] =>
            if decideHolds emptyEnv (Term.litBool true)
                (Term.litBool true) && !w.sawThm then
              some
                ({ w2 with sawThm := true, cmds := [emitHeld] }, rest2)
            else
              none
          | ["emitApplyReady"], ["false"] =>
            -- Decided false. Do not store litBool true.
            if decideHolds emptyEnv (Term.litBool false)
                (Term.litBool true) then
              none
            else
              some (w2, rest2)
          | _, _ => none
        | _ => none

/-- An example proved by `by decide` is seen and is not emitted. -/
def useExample (w : Walk) (ts : List String) :
    Option (Prod Walk (List String)) :=
  match takeUntilAssign scanFuel 0 [] ts with
  | none => none
  | some (claim, rest) =>
    match rest with
    | "by" :: "decide" :: rest2 =>
      some ({ markPP w claim with sawExample := true }, rest2)
    | _ => none

/-- Skip ordinary commands. `++` is recorded. The ready def is special.
    The alias `emitApplyOk` is not emitted. -/
def parseItems (fuel : Nat) (w : Walk) (ts : List String) :
    Option (Prod Walk (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | "end" :: _ => some (w, ts)
    | "def" :: "emitApplyReady" :: rest =>
      match takeReady rest with
      | some rest2 =>
        parseItems k { w with sawReadyChain := true } rest2
      | none => none
    | "def" :: rest =>
      match skipScan scanFuel 0 w.sawPlusPlus rest with
      | some (pp, rest2) =>
        parseItems k { w with sawPlusPlus := pp } rest2
      | none => none
    | "theorem" :: name :: rest =>
      if name == "emitApplyReady_true" && isIdent name then
        match useThm w rest with
        | some (w2, rest2) => parseItems k w2 rest2
        | none => none
      else if isIdent name then
        match skipScan scanFuel 0 w.sawPlusPlus (name :: rest) with
        | some (pp, rest2) =>
          parseItems k { w with sawPlusPlus := pp } rest2
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match useExample w rest with
      | some (w2, rest2) => parseItems k w2 rest2
      | none => none
    | t :: rest =>
      if isHead t then
        match skipScan scanFuel 0 w.sawPlusPlus rest with
        | some (pp, rest2) =>
          parseItems k { w with sawPlusPlus := pp } rest2
        | none => none
      else
        none
termination_by fuel

def finish (ns : String) (w : Walk) (ts : List String) : Option Module :=
  if w.sawPlusPlus && w.sawExample && w.sawReadyChain && w.sawThm
      && !w.cmds.isEmpty && ns == nsSeed then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && rest2.isEmpty then
          let cmds :=
            [Cmd.namespace (n ns)] ++ w.cmds
              ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none
  else
    none

/-- Parse this surface. none means an import, a lone true, or a bad claim. -/
def parseHonestyEmitScafText (src : String) : Option Module :=
  if !seedHolds then
    none
  else
    match strip src.toList SMode.code [] with
    | none => none
    | some kept =>
      match tok kept TokMode.norm [] with
      | none => none
      | some ts =>
        match ts with
        | "namespace" :: rest =>
          match parseDotted parseFuel rest with
          | some (ns, rest2) =>
            if ns == nsSeed then
              match parseItems itemFuel emptyWalk rest2 with
              | some (w, rest3) => finish ns w rest3
              | none => none
            else
              none
          | none => none
        | _ => none

def scafToySrc : String :=
  "namespace SystemsLean.EmitApply\n"
    ++ "def piece : String := \"a\" ++ \"b\"\n"
    ++ "def emitApplyReady : Bool := "
    ++ "emitApplySurfaceOk && applyHeaderHonestyOk"
    ++ " && applyBodyHonestyOk\n"
    ++ "def emitApplyOk : Bool := emitApplyReady\n"
    ++ "set_option maxRecDepth 32768\n"
    ++ "set_option maxHeartbeats 800000\n"
    ++ "example : emitApplyReady = true := by decide\n"
    ++ "theorem emitApplyReady_true : "
    ++ "emitApplyReady = true := by decide\n"
    ++ "end SystemsLean.EmitApply\n"

/-- Four imports. The scaffold selector is absent. -/
def scafImportSrc : String :=
  "import SystemsLean.Mult\n"
    ++ "import SystemsLean.Types\n"
    ++ "import SystemsLean.HostCompose\n"
    ++ "import SystemsLean.EmitApplyScaffold\n"
    ++ "namespace SystemsLean.EmitApply\n"
    ++ "end SystemsLean.EmitApply\n"

/-- A lone Bool true is not the unreduced chain. -/
def scafLoneSrc : String :=
  "namespace SystemsLean.EmitApply\n"
    ++ "def emitApplyReady : Bool := true\n"
    ++ "theorem emitApplyReady_true : "
    ++ "emitApplyReady = true := by decide\n"
    ++ "end SystemsLean.EmitApply\n"

/-- The false claim must not be stored as litBool true. -/
def scafFalseSrc : String :=
  "namespace SystemsLean.EmitApply\n"
    ++ "def piece : String := \"a\" ++ \"b\"\n"
    ++ "def emitApplyReady : Bool := "
    ++ "emitApplySurfaceOk && applyHeaderHonestyOk"
    ++ " && applyBodyHonestyOk\n"
    ++ "example : emitApplyReady = true := by decide\n"
    ++ "theorem emitApplyReady_true : "
    ++ "emitApplyReady = false := by decide\n"
    ++ "end SystemsLean.EmitApply\n"

def cmdIsHeld (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ nm (some HostType.bool) (Term.litBool true) =>
    nm.raw == "emitApplyReady_true"
  | _ => false

def anyHeldTrue (cs : List Cmd) : Bool :=
  match cs with
  | [] => false
  | c :: rest =>
    if cmdIsHeld c then true else anyHeldTrue rest

/-- Namespace, one held bool def, end. No import. isWellFormed. -/
def scafToyShape : Bool :=
  match parseHonestyEmitScafText scafToySrc with
  | some m =>
    match m.commands with
    | Cmd.namespace ns :: c :: Cmd.endNamespace en :: [] =>
      ns.raw == nsSeed && en.raw == nsSeed && cmdIsHeld c
        && isWellFormed m && seedHolds && m.name.raw == nsSeed
    | _ => false
  | none => false

/-- The four-import EmitApply head is none. -/
def scafImportNone : Bool :=
  match parseHonestyEmitScafText scafImportSrc with
  | none => true
  | some _ => false

/-- `def emitApplyReady : Bool := true` with no && chain is none. -/
def scafLoneNone : Bool :=
  match parseHonestyEmitScafText scafLoneSrc with
  | none => true
  | some _ => false

/-- `emitApplyReady = false` is not emitted as litBool true. -/
def scafFalseShape : Bool :=
  match parseHonestyEmitScafText scafFalseSrc with
  | none => true
  | some m =>
    match anyHeldTrue m.commands with
    | true => false
    | false => true

end SystemsLean.HonestyEmitScafFront
