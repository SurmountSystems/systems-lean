/-
  Module: SystemsLean.HonestyFront
  Front for a namespace of string defs and Bool defs.
  No import is required. The file may start with a namespace.
  A string def is `def name : String := "literal"`.
  A Bool def is `def name : Bool := true`, or a chain of
  `(name == "literal")` and bare Bool names joined by `&&`.
  The literal must be the string that name's def stored.
  A different literal is none. This is not a general Lean parser.
  `&&` lowers to `if c then t else false`, which the kernel
  already checks as Bool. More than 62 literal defs are handed to
  BellerophonLongLiteral, which keeps at most 62. A false Bool stays
  false. Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.BellerophonLongLiteral

namespace SystemsLean.HonestyFront

open SystemsLean.HostTerm

def parseFuel : Nat := 1024

def isLetter (c : Char) : Bool :=
  ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

def isDigit (c : Char) : Bool :=
  '0' <= c && c <= '9'

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\n' || c == '\t' || c == '\r'

def isIdentChar (c : Char) : Bool :=
  isLetter c || isDigit c || c == '_' || c == '?' || c == '\''

inductive SMode where
  | code
  | line
  | blk (dash : Bool)
  | str
  | esc

/-- Strip line comments and non-nested block comments. Strings stay. -/
def strip : List Char -> SMode -> List Char -> Option (List Char)
  | [], SMode.code, out => some out.reverse
  | [], SMode.line, out => some out.reverse
  | [], SMode.blk _, _ => none
  | [], SMode.str, _ => none
  | [], SMode.esc, _ => none
  | '\n' :: rest, SMode.line, out =>
    strip rest SMode.code ('\n' :: out)
  | _ :: rest, SMode.line, out =>
    strip rest SMode.line out
  | '/' :: rest, SMode.blk true, out =>
    strip rest SMode.code out
  | '-' :: rest, SMode.blk true, out =>
    strip rest (SMode.blk true) out
  | _ :: rest, SMode.blk true, out =>
    strip rest (SMode.blk false) out
  | '-' :: rest, SMode.blk false, out =>
    strip rest (SMode.blk true) out
  | _ :: rest, SMode.blk false, out =>
    strip rest (SMode.blk false) out
  | c :: rest, SMode.esc, out =>
    strip rest SMode.str (c :: '\\' :: out)
  | '\\' :: rest, SMode.str, out =>
    strip rest SMode.esc out
  | '"' :: rest, SMode.str, out =>
    strip rest SMode.code ('"' :: out)
  | c :: rest, SMode.str, out =>
    strip rest SMode.str (c :: out)
  | '-' :: '-' :: rest, SMode.code, out =>
    strip rest SMode.line out
  | '/' :: '-' :: rest, SMode.code, out =>
    strip rest (SMode.blk false) out
  | '"' :: rest, SMode.code, out =>
    strip rest SMode.str ('"' :: out)
  | c :: rest, SMode.code, out =>
    strip rest SMode.code (c :: out)

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens for this surface. `==` and `&&` are one token each.
    A lone `=` or `&` is none. Other punctuation is none. -/
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
  | '=' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("==" :: acc)
  | '&' :: '&' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("&&" :: acc)
  | '=' :: _, TMode.norm, _ => none
  | '&' :: _, TMode.norm, _ => none
  | ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":" :: acc)
  | '(' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("(" :: acc)
  | ')' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (")" :: acc)
  | '.' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("." :: acc)
  | '"' :: rest, TMode.norm, acc =>
    tok rest (TMode.str []) acc
  | c :: rest, TMode.norm, acc =>
    if isWs c then tok rest TMode.norm acc
    else if isLetter c || c == '_' then
      tok rest (TMode.id [c]) acc
    else
      none
  | ':' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":=" :: emitId acc cur)
  | '=' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("==" :: emitId acc cur)
  | '&' :: '&' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("&&" :: emitId acc cur)
  | '=' :: _, TMode.id _, _ => none
  | '&' :: _, TMode.id _, _ => none
  | ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":" :: emitId acc cur)
  | '(' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("(" :: emitId acc cur)
  | ')' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (")" :: emitId acc cur)
  | '.' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("." :: emitId acc cur)
  | c :: rest, TMode.id cur, acc =>
    if isIdentChar c then
      tok rest (TMode.id (c :: cur)) acc
    else if isWs c then
      tok rest TMode.norm (emitId acc cur)
    else
      none

def isIdent (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs =>
    (isLetter c || c == '_') && cs.all isIdentChar

def unquote (s : String) : Option String :=
  match s.toList with
  | '"' :: rest =>
    match rest.reverse with
    | '"' :: body => some (String.mk body.reverse)
    | _ => none
  | _ => none

def lookupStr (xs : List (Prod String String)) (name : String) :
    Option String :=
  match xs with
  | [] => none
  | (nm, s) :: rest =>
    if nm == name then some s else lookupStr rest name

def hasBool (xs : List String) (name : String) : Bool :=
  match xs with
  | [] => false
  | nm :: rest => nm == name || hasBool rest name

def known (strs : List (Prod String String)) (bools : List String)
    (name : String) : Bool :=
  match lookupStr strs name with
  | some _ => true
  | none => hasBool bools name

/-- One chain atom. A parenthesized compare must use the stored literal.
    A bare name must already be a Bool def. -/
def parseAtom (fuel : Nat) (strs : List (Prod String String))
    (bools : List String) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ _ =>
    match ts with
    | "(" :: name :: "==" :: lit :: ")" :: rest =>
      if isIdent name then
        match unquote lit, lookupStr strs name with
        | some s, some want =>
          if s == want then
            some (Term.decideEq (Term.var (n name)) (Term.litString s), rest)
          else
            none
        | _, _ => none
      else
        none
    | name :: rest =>
      if isIdent name && hasBool bools name then
        some (Term.var (n name), rest)
      else
        none
    | _ => none

/-- Left-nested `&&`. Each step is `if left then right else false`. -/
def parseChain (fuel : Nat) (strs : List (Prod String String))
    (bools : List String) (acc : Term) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "&&" :: rest =>
      match parseAtom k strs bools rest with
      | some (right, rest2) =>
        let acc2 := Term.ite acc right (Term.litBool false)
        parseChain k strs bools acc2 rest2
      | none => none
    | _ => some (acc, ts)
termination_by fuel

def parseBoolBody (fuel : Nat) (strs : List (Prod String String))
    (bools : List String) (ts : List String) :
    Option (Prod Term (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "true" :: "&&" :: _ => none
    | "true" :: rest => some (Term.litBool true, rest)
    | _ =>
      match parseAtom k strs bools ts with
      | none => none
      | some (atom, rest) => parseChain k strs bools atom rest

def parseDef (fuel : Nat) (strs : List (Prod String String))
    (bools : List String) (ts : List String) :
    Option (Prod Cmd (Prod (List (Prod String String))
      (Prod (List String) (List String)))) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
      if isIdent name && !known strs bools name then
        match unquote lit with
        | some s =>
          let cmd :=
            Cmd.def_ (n name) (some HostType.string) (Term.litString s)
          some (cmd, (name, s) :: strs, bools, rest)
        | none => none
      else
        none
    | "def" :: name :: ":" :: "Bool" :: ":=" :: rest =>
      if isIdent name && !known strs bools name then
        match parseBoolBody k strs bools rest with
        | some (body, rest2) =>
          let cmd :=
            Cmd.def_ (n name) (some HostType.bool) body
          some (cmd, strs, name :: bools, rest2)
        | none => none
      else
        none
    | _ => none

def parseDefs (fuel : Nat) (strs : List (Prod String String))
    (bools : List String) (acc : List Cmd) (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "def" :: _ =>
      match parseDef k strs bools ts with
      | some (cmd, strs2, bools2, rest) =>
        parseDefs k strs2 bools2 (cmd :: acc) rest
      | none => none
    | "end" :: _ => some (acc.reverse, ts)
    | _ => none
termination_by fuel

def parseDots (fuel : Nat) (acc : String) (ts : List String) :
    Option (Prod String (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "." :: t :: rest =>
      if isIdent t then parseDots k (acc ++ "." ++ t) rest else none
    | _ => some (acc, ts)
termination_by fuel

def parseDotted (fuel : Nat) (ts : List String) :
    Option (Prod String (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | t :: rest =>
      if isIdent t then parseDots k t rest else none
    | [] => none

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

/-- Parse this surface. none means not this front, or a bad literal. -/
def parseHonestyText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok kept TMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "namespace" :: rest =>
        match parseDotted parseFuel rest with
        | none => none
        | some (ns, rest2) =>
          match parseDefs parseFuel [] [] [] rest2 with
          | none => none
          | some (defs, rest3) =>
            if defs.length >= BellerophonLongLiteral.minDefs then
              BellerophonLongLiteral.parseLongLiteral src
            else
              finish ns defs rest3
      | _ => none

def honestyToy : String :=
  "namespace SystemsLean.HonestyToy\n" ++
  "def a : String := \"A\"\n" ++
  "def b : Bool := true\n" ++
  "def ok : Bool := (a == \"A\") && b\n" ++
  "end SystemsLean.HonestyToy\n"

def honestyToyAccepts : Bool :=
  match parseHonestyText honestyToy with
  | some _ => true
  | none => false

def honestyWrongLit : String :=
  "namespace SystemsLean.HonestyToy\n" ++
  "def a : String := \"A\"\n" ++
  "def ok : Bool := (a == \"B\")\n" ++
  "end SystemsLean.HonestyToy\n"

/-- A compare against a different literal is not this front. -/
def honestyWrongLitRejects : Bool :=
  match parseHonestyText honestyWrongLit with
  | none => true
  | some _ => false

end SystemsLean.HonestyFront
