/-
  Module: SystemsLean.LongLiteral
  A namespace of more than 62 string and Bool literal defs, and no import.
  Returns that namespace with at most 62 of those defs.
  False Bool defs stay false and come first, then true, then strings.
  A shorter file, an import, or any other form is none.
  Reading every def needs a larger HostKernel fuel. This file does not
  change that fuel. Does not call Lean.Elab.processCommands.
  Does not store the module file name.
  slakeOwnsPackageTypecheck stays false. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.LongLiteral

open SystemsLean.HostTerm

def litCap : Nat := 62

def minDefs : Nat := 63

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

/-- Tokens for literal defs only. `:=` is one token.
    `=`, `&`, `(`, `)`, and other punctuation are none. -/
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
  | '=' :: _, TMode.norm, _ => none
  | '&' :: _, TMode.norm, _ => none
  | '(' :: _, TMode.norm, _ => none
  | ')' :: _, TMode.norm, _ => none
  | ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (":" :: acc)
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
  | '=' :: _, TMode.id _, _ => none
  | '&' :: _, TMode.id _, _ => none
  | '(' :: _, TMode.id _, _ => none
  | ')' :: _, TMode.id _, _ => none
  | ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":" :: emitId acc cur)
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

structure Acc where
  falses : List Cmd
  trues : List Cmd
  strs : List Cmd
  count : Nat

def emptyAcc : Acc :=
  { falses := [], trues := [], strs := [], count := 0 }

def addFalse (a : Acc) (c : Cmd) : Acc :=
  { a with falses := c :: a.falses, count := a.count + 1 }

def addTrue (a : Acc) (c : Cmd) : Acc :=
  { a with trues := c :: a.trues, count := a.count + 1 }

def addStr (a : Acc) (c : Cmd) : Acc :=
  { a with strs := c :: a.strs, count := a.count + 1 }

def boolCmd (name : String) (b : Bool) : Cmd :=
  Cmd.def_ (n name) (some HostType.bool) (Term.litBool b)

def strCmd (name s : String) : Cmd :=
  Cmd.def_ (n name) (some HostType.string) (Term.litString s)

/-- Only `def name : String := "lit"` and `def name : Bool := true|false`. -/
def parseLits (acc : Acc) (ts : List String) :
    Option (Prod Acc (List String)) :=
  match ts with
  | "def" :: name :: ":" :: "String" :: ":=" :: lit :: rest =>
    if isIdent name then
      match unquote lit with
      | some s => parseLits (addStr acc (strCmd name s)) rest
      | none => none
    else
      none
  | "def" :: name :: ":" :: "Bool" :: ":=" :: "false" :: rest =>
    if isIdent name then
      parseLits (addFalse acc (boolCmd name false)) rest
    else
      none
  | "def" :: name :: ":" :: "Bool" :: ":=" :: "true" :: rest =>
    if isIdent name then
      parseLits (addTrue acc (boolCmd name true)) rest
    else
      none
  | "end" :: _ => some (acc, ts)
  | _ => none

def finish (ns : String) (a : Acc) (ts : List String) : Option Module :=
  if a.count < minDefs then
    none
  else
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && rest2.isEmpty then
          let ordered :=
            a.falses.reverse ++ a.trues.reverse ++ a.strs.reverse
          let picked := ordered.take litCap
          let cmds :=
            Cmd.namespace (n ns) :: picked ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m && picked.length == litCap then
            some m
          else
            none
        else
          none
      | none => none
    | _ => none

/-- Parse this shape. none means not a long literal namespace. -/
def parseLongLiteral (src : String) : Option Module :=
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
          match parseLits emptyAcc rest2 with
          | none => none
          | some (acc, rest3) => finish ns acc rest3
      | _ => none

def repeatStr (k : Nat) : String :=
  match k with
  | 0 => ""
  | Nat.succ n =>
    s!"def s{n} : String := \"x\"\n" ++ repeatStr n
termination_by k

def longSrc : String :=
  "namespace SystemsLean.BellLong\n" ++
  "def keep : Bool := false\n" ++
  repeatStr minDefs ++
  "end SystemsLean.BellLong\n"

def hasFalseKeep : List Cmd -> Bool
  | [] => false
  | Cmd.def_ nm (some HostType.bool) (Term.litBool false) :: _ =>
    nm.raw == "keep"
  | _ :: rest => hasFalseKeep rest

/-- The false pin is still false, and the module stays inside fuel. -/
def longKeepsFalse : Bool :=
  match parseLongLiteral longSrc with
  | some m =>
    hasFalseKeep m.commands && m.commands.length == litCap + 2
  | none => false

def shortSrc : String :=
  "namespace SystemsLean.BellLong\n" ++
  "def keep : Bool := false\n" ++
  "end SystemsLean.BellLong\n"

def shortRejects : Bool :=
  match parseLongLiteral shortSrc with
  | none => true
  | some _ => false

def importSrc : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.BellLong\n" ++
  "def keep : Bool := false\n" ++
  repeatStr minDefs ++
  "end SystemsLean.BellLong\n"

def importRejects : Bool :=
  match parseLongLiteral importSrc with
  | none => true
  | some _ => false

def funSrc : String :=
  "namespace SystemsLean.BellLong\n" ++
  "def f (x : Nat) : Nat := x\n" ++
  "end SystemsLean.BellLong\n"

def funRejects : Bool :=
  match parseLongLiteral funSrc with
  | none => true
  | some _ => false

end SystemsLean.LongLiteral
