/-
  Module: SystemsLean.HonestyRequire
  One IO Unit def that fails closed when a path is missing.
  The binders are System.FilePath and String. The body is `do` and `unless`.
  A missing path is the error arm. It is not stored as present.
  `planApplyBodySpecs` is not parsed.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyBound
import SystemsLean.HonestyLetRec
import SystemsLean.HonestyCompose

namespace SystemsLean.HonestyRequire

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (isIdent isLetter isDigit isWs isIdentChar)
open SystemsLean.HonestyBound
open SystemsLean.HonestyLetRec (TMode)

export SystemsLean.HonestyLetRec (TMode)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Same tokens as HonestyLetRec, plus `<-`. A lone `<` still drops the rest. -/
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
  | '[' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("[" :: acc)
  | ']' :: rest, TMode.norm, acc =>
    tok rest TMode.norm ("]" :: acc)
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
  | '[' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("[" :: emitId acc cur)
  | ']' :: rest, TMode.id cur, acc =>
    tok rest TMode.norm ("]" :: emitId acc cur)
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

/-- The unless failure. There is no constructor for a present file. -/
inductive CheckedPath where
  | absent (label : String)

/-- pathExists true yields no error. The false arm is userError missing. -/
def toTerm (path : String) (act : CheckedPath) : Term :=
  match act with
  | CheckedPath.absent _ =>
    Term.ite
      (Term.proj (Term.var (n path)) (n "pathExists"))
      Term.none_
      (Term.some_
        (Term.app (Term.const (n "IO.userError")) (Term.litString "missing")))

def qMiss (label : String) : String :=
  "\"missing {" ++ label ++ "}\""

def qErr (label path : String) : String :=
  "\"error: missing {" ++ label ++ "}: {" ++ path ++ "}\""

def bodyToks (path label : String) : List String :=
  [ "unless", "(", "<-", path, ".", "pathExists", ")", "do"
  , "IO", ".", "eprintln", "s", "!", qErr label path
  , "throw", "(", "IO", ".", "userError", "s", "!", qMiss label
  , ")" ]

def takeAll : List String -> List String -> Option (List String)
  | [], rest => some rest
  | w :: ws, t :: rest => if w == t then takeAll ws rest else none
  | _ :: _, [] => none

def stopName (ts : List String) : String :=
  SystemsLean.HonestyLetRec.stopName ts

/-- `def name (path : System.FilePath) (label : String) : IO Unit := do`
    then `unless`. Another header is skip. A matching header without
    `unless` is bad. -/
def parseRequire (ts : List String) : Bound :=
  match ts with
  | "def" :: name :: "(" :: p :: ":" :: "System" :: "." :: "FilePath"
      :: ")" :: "(" :: lab :: ":" :: "String" :: ")"
      :: ":" :: "IO" :: "Unit" :: ":=" :: "do" :: rest =>
    if isIdent name && isIdent p && isIdent lab then
      match takeAll (bodyToks p lab) rest with
      | some rest2 =>
        let cmd :=
          Cmd.defBind (n name)
            [ (n p, HostType.named (n "System.FilePath"))
            , (n lab, HostType.string) ]
            (HostType.named (n "IO.Unit"))
            (toTerm p (CheckedPath.absent lab))
        Bound.got cmd rest2
      | none => Bound.bad
    else
      Bound.bad
  | _ => Bound.skip

/-- Let rec and the Bool if first. This FilePath def next.
    Compose IO only after both of those skip. -/
def parseBinderDef (ts : List String) : Bound :=
  match SystemsLean.HonestyLetRec.parseBinderDef ts with
  | Bound.skip =>
    match parseRequire ts with
    | Bound.skip => SystemsLean.HonestyCompose.parseIo ts
    | other => other
  | other => other

end SystemsLean.HonestyRequire
