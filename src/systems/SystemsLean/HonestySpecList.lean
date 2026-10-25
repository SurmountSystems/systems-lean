/-
  Module: SystemsLean.HonestySpecList
  Draft parser for one list of structure literals.
  The header is `def planApplyBodySpecs : List ComposeSsotSpec := [`.
  Each element is `{ base := "...", token := "...", headerBlock := "...",
  bodyBlock := "...", role := "..." }`.
  A field value that is a string is stored as a string.
  A field value that is not a string is not stored.
  The list is not stored as Bool true.
  A basename string is not a claim that a file is present.
  Parsing stops after the closing bracket.
  The next def is not parsed.
  The layer names freestandingCapableComposeReadOneSsot.
  Not wired. Not compiled in this slice.
  Does not call Lean.Elab.processCommands.
  Does not infer a type for the list.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront

namespace SystemsLean.HonestySpecList

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip isIdent unquote parseFuel
  isLetter isDigit isWs isIdentChar)

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens for this list. `:=` is one token. `{`, `}`, and `,` are tokens.
    A string keeps its characters, including `.` and `-`.
    An unclosed string is none. An unknown character keeps tokens so far. -/
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
  | ':' :: ':' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("::" :: acc)
  | '=' :: '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("=>" :: acc)
  | '=' :: '=' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("==" :: acc)
  | '&' :: '&' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("&&" :: acc)
  | '+' :: '+' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("++" :: acc)
  | '|' :: '|' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("||" :: acc)
  | '|' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("|" :: acc)
  | '-' :: '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("->" :: acc)
  | '<' :: '-' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("<-" :: acc)
  | '!' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("!" :: acc)
  | '>' :: rest, TMode.norm, acc =>
    tok rest TMode.norm (">" :: acc)
  | '[' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("[" :: acc)
  | ']' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("]" :: acc)
  | '{' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("{" :: acc)
  | '}' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("}" :: acc)
  | ',' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("," :: acc)
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
    else if isDigit c then
      tok rest TMode.norm (String.mk [c] :: acc)
    else
      some acc.reverse
  | ':' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (":=" :: emitId acc cur)
  | ':' :: ':' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("::" :: emitId acc cur)
  | '=' :: '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("=>" :: emitId acc cur)
  | '=' :: '=' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("==" :: emitId acc cur)
  | '&' :: '&' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("&&" :: emitId acc cur)
  | '+' :: '+' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("++" :: emitId acc cur)
  | '|' :: '|' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("||" :: emitId acc cur)
  | '|' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("|" :: emitId acc cur)
  | '-' :: '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("->" :: emitId acc cur)
  | '<' :: '-' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("<-" :: emitId acc cur)
  | '!' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("!" :: emitId acc cur)
  | '>' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm (">" :: emitId acc cur)
  | '[' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("[" :: emitId acc cur)
  | ']' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("]" :: emitId acc cur)
  | '{' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("{" :: emitId acc cur)
  | '}' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("}" :: emitId acc cur)
  | ',' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("," :: emitId acc cur)
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
      some (emitId acc cur).reverse

/-- When the next form is `def name`, the layer names `name`. -/
def stopName (ts : List String) : String :=
  match ts with
  | "def" :: name :: _ =>
    if isIdent name then name else "def"
  | t :: _ => t
  | [] => "def"

inductive SpecParse where
  | skip
  | bad
  | got (cmd : Cmd) (rest : List String)

def specFieldNames : List String :=
  ["base", "token", "headerBlock", "bodyBlock", "role"]

/-- A later field needs a comma. The last field does not. -/
def takeComma (more : List String) (ts : List String) :
    Option (List String) :=
  match more, ts with
  | [], rest => some rest
  | _ :: _, "," :: rest => some rest
  | _, _ => none

/-- Five string fields, in source order. A non-string value is none. -/
def parseFields (fuel : Nat) (want : List String)
    (acc : List (Prod Name Term)) (ts : List String) :
    Option (Prod (List (Prod Name Term)) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match want with
    | [] =>
      match ts with
      | "}" :: rest => some (acc.reverse, rest)
      | _ => none
    | w :: ws =>
      match ts with
      | name :: ":=" :: lit :: rest =>
        if name == w then
          match unquote lit with
          | some s =>
            match takeComma ws rest with
            | some rest2 =>
              parseFields k ws
                ((n name, Term.litString s) :: acc) rest2
            | none => none
          | none => none
        else
          none
      | _ => none
termination_by fuel

def parseSpec (ts : List String) : Option (Prod Term (List String)) :=
  match ts with
  | "{" :: rest =>
    match parseFields parseFuel specFieldNames [] rest with
    | some (fs, rest2) => some (Term.structLit fs, rest2)
    | none => none
  | _ => none

/-- One or more specs. No empty list and no trailing comma. -/
def parseSpecs (fuel : Nat) (acc : List Term) (ts : List String) :
    Option (Prod (List Term) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parseSpec ts with
    | some (spec, "]" :: rest) =>
      some ((spec :: acc).reverse, rest)
    | some (spec, "," :: rest) =>
      parseSpecs k (spec :: acc) rest
    | _ => none
termination_by fuel

def nilTerm : Term :=
  Term.const (n "List.nil")

def consTerm (head tail : Term) : Term :=
  Term.app (Term.app (Term.const (n "List.cons")) head) tail

def listTerm (specs : List Term) : Term :=
  specs.foldr consTerm nilTerm

def specCmd (body : Term) : Cmd :=
  Cmd.def_ (n "planApplyBodySpecs")
    (some (HostType.named (n "List ComposeSsotSpec")))
    body

/-- The written header, then the list. Another def is skip.
    The same name with another body is bad, not Bool true. -/
def parseSpecList (ts : List String) : SpecParse :=
  match ts with
  | "def" :: "planApplyBodySpecs" :: ":" :: "List"
      :: "ComposeSsotSpec" :: ":=" :: "[" :: rest =>
    match parseSpecs parseFuel [] rest with
    | none => SpecParse.bad
    | some (specs, rest2) =>
      SpecParse.got (specCmd (listTerm specs)) rest2
  | "def" :: "planApplyBodySpecs" :: _ => SpecParse.bad
  | _ => SpecParse.skip

def walk (src : String) : SpecParse :=
  match strip src.toList HonestyFront.SMode.code [] with
  | none => SpecParse.bad
  | some kept =>
    match tok kept TMode.norm [] with
    | none => SpecParse.bad
    | some ts => parseSpecList ts

/-- Def name still unparsed after a good list. -/
def stoppedToken (src : String) : Option String :=
  match walk src with
  | SpecParse.got _ rest => some (stopName rest)
  | _ => none

/-- First token still unparsed after a good list. -/
def restHead (src : String) : Option String :=
  match walk src with
  | SpecParse.got _ (t :: _) => some t
  | _ => none

def specListToy : String :=
  "def planApplyBodySpecs : List ComposeSsotSpec := [\n" ++
  "{ base := \"host_emit_plan.ssot.txt\"," ++
  " token := \"HOST-EMIT-PLAN\"," ++
  " headerBlock := \"PLAN_C_HEADER\"," ++
  " bodyBlock := \"PLAN_C_BODY\"," ++
  " role := \"plan\" },\n" ++
  "{ base := \"host_emit_apply.ssot.txt\"," ++
  " token := \"HOST-EMIT-APPLY\"," ++
  " headerBlock := \"APPLY_C_HEADER\"," ++
  " bodyBlock := \"APPLY_C_BODY\"," ++
  " role := \"apply\" },\n" ++
  "{ base := \"host_emit_body_fragment.ssot.txt\"," ++
  " token := \"HOST-EMIT-BODY\"," ++
  " headerBlock := \"BODY_C_HEADER\"," ++
  " bodyBlock := \"BODY_C_BODY\"," ++
  " role := \"body\" }\n" ++
  "]\n" ++
  "/-- next def is not this list -/\n" ++
  "def freestandingCapableComposeReadOneSsot" ++
  " (path : System.FilePath) : IO String := do\n"

def specBoolToy : String :=
  "def planApplyBodySpecs : List ComposeSsotSpec := [\n" ++
  "{ base := true, token := \"T\"," ++
  " headerBlock := \"H\", bodyBlock := \"B\"," ++
  " role := \"plan\" }\n" ++
  "]\n"

def quotedTrueToy : String :=
  "def planApplyBodySpecs : List ComposeSsotSpec := [\n" ++
  "{ base := \"true\", token := \"T\"," ++
  " headerBlock := \"H\", bodyBlock := \"B\"," ++
  " role := \"plan\" }\n" ++
  "]\n"

def wantNames : List Name :=
  [n "base", n "token", n "headerBlock", n "bodyBlock", n "role"]

def fieldNames : List (Prod Name Term) -> List Name
  | [] => []
  | (nm, _) :: rest => nm :: fieldNames rest

def fieldsAreStrings : List (Prod Name Term) -> Bool
  | [] => true
  | (_, Term.litString _) :: rest => fieldsAreStrings rest
  | _ => false

def specOk : Term -> Bool
  | Term.structLit fs =>
    fieldNames fs == wantNames && fieldsAreStrings fs
  | _ => false

def tailOk : Term -> Bool
  | Term.const c => c.raw == "List.nil"
  | Term.app (Term.app (Term.const c) h) t =>
    c.raw == "List.cons" && specOk h && tailOk t
  | _ => false

/-- At least one cons. A bare nil is not this list. -/
def listOk : Term -> Bool
  | Term.app (Term.app (Term.const c) h) t =>
    c.raw == "List.cons" && specOk h && tailOk t
  | _ => false

def specsCmdOk (cmd : Cmd) : Bool :=
  match cmd with
  | Cmd.def_ name (some (HostType.named ty)) body =>
    name.raw == "planApplyBodySpecs"
      && ty.raw == "List ComposeSsotSpec"
      && listOk body
  | _ => false

/-- The three plan/apply/body specs. The next token is def. -/
def specListRestIsDef : Bool :=
  match restHead specListToy, walk specListToy with
  | some "def", SpecParse.got cmd _ => specsCmdOk cmd
  | _, _ => false

/-- Stop name after the list. Not the keyword def. -/
def specListStops : Bool :=
  stoppedToken specListToy
    == some "freestandingCapableComposeReadOneSsot"

/-- A bare true field is not stored. -/
def specBoolRejects : Bool :=
  match walk specBoolToy with
  | SpecParse.bad => true
  | _ => false

def headSpec : Term -> Option Term
  | Term.app (Term.app (Term.const _) h) _ => some h
  | _ => none

def baseText : Term -> Option String
  | Term.structLit ((nm, Term.litString s) :: _) =>
    if nm.raw == "base" then some s else none
  | _ => none

/-- The characters true inside quotes stay a string. -/
def quotedTrueIsString : Bool :=
  match walk quotedTrueToy with
  | SpecParse.got cmd _ =>
    match cmd with
    | Cmd.def_ _ _ body =>
      match headSpec body with
      | some spec =>
        match baseText spec with
        | some "true" => specOk spec
        | _ => false
      | none => false
    | _ => false
  | _ => false

end SystemsLean.HonestySpecList
