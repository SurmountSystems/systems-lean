/-
  Module: SystemsLean.HonestyLetRec
  One Option String def whose body is a let rec.
  The result is Option String, not a constant true.
  The stored term is the go search, not a bare newline.
  A missing block is none. A closed block is the joined lines.
  `let rec` is parsed here. System.FilePath is not.
  A missing let rec on this header is not this def.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyBound

namespace SystemsLean.HonestyLetRec

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (isIdent isLetter isDigit isWs isIdentChar parseFuel)
open SystemsLean.HonestyBound

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- Tokens. `==`, `&&`, `:=`, `=>`, `++`, `||`, `::`, and `->` are one
    token. `>` and `|` are one token. A lone `=` or `&` is none.
    An unknown character returns the tokens already read.
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

/-- When the next form is `def name`, the layer names `name`. -/
def stopName (ts : List String) : String :=
  match ts with
  | "def" :: name :: _ =>
    if isIdent name then name else "def"
  | t :: _ => t
  | [] => "def"

def qHash : String := "\"# \""
def qBegin : String := "\"_BEGIN\""
def qEnd : String := "\"_END\""
def qNl : String := "\"\\n\""

def someNl : List String :=
  [ "some", "(", "String", ".", "intercalate", qNl, "acc", "."
  , "reverse", "++", qNl, ")" ]

def bodyToks (b1 b2 : String) : List String :=
  [ "let", "beginMark", ":=", qHash, "++", b2, "++", qBegin
  , "let", "endMark", ":=", qHash, "++", b2, "++", qEnd
  , "let", "rec", "go", "(", "grab", ":", "Bool", ")"
  , "(", "acc", ":", "List", "String", ")", ":"
  , "List", "String", "->", "Option", "String"
  , "|", "[", "]", "=>"
  , "if", "grab", "||", "acc", ".", "isEmpty", "then", "none"
  , "else" ] ++ someNl ++
  [ "|", "line", "::", "rest", "=>"
  , "if", "!", "grab", "&&", "line", "==", "beginMark"
  , "then", "go", "true", "acc", "rest"
  , "else", "if", "grab", "&&", "line", "==", "endMark", "then"
  ] ++ someNl ++
  [ "else", "if", "grab", "then", "go", "true"
  , "(", "line", "::", "acc", ")", "rest"
  , "else", "go", "false", "acc", "rest"
  , "go", "false", "[", "]"
  , "(", b1, ".", "splitOn", qNl, ")" ]

def takeAll : List String -> List String -> Option (List String)
  | [], rest => some rest
  | w :: ws, t :: rest => if w == t then takeAll ws rest else none
  | _ :: _, [] => none

def termCall (fn : String) (args : List Term) : Term :=
  args.foldl (fun acc arg => Term.app acc arg) (Term.const (n fn))

def beginMark (name : String) : Term :=
  termCall "++"
    [ termCall "++" [Term.litString "# ", Term.var (n name)]
    , Term.litString "_BEGIN" ]

def endMark (name : String) : Term :=
  termCall "++"
    [ termCall "++" [Term.litString "# ", Term.var (n name)]
    , Term.litString "_END" ]

/-- Grabbed lines joined by a newline. Not the newline literal alone. -/
def joinedAcc : Term :=
  termCall "++"
    [ termCall "intercalate"
        [Term.litString "\n", termCall "reverse" [Term.var (n "acc")]]
    , Term.litString "\n" ]

def someJoined : Term :=
  Term.some_ joinedAcc

/-- No begin mark, or a begin mark with no end mark. -/
def emptyStep : Term :=
  Term.ite
    (termCall "||"
      [Term.var (n "grab"), termCall "isEmpty" [Term.var (n "acc")]])
    Term.none_
    someJoined

def goCall (grab acc rest : Term) : Term :=
  termCall "go" [grab, acc, rest]

/-- Start at the begin mark, stop at the end mark, keep lines while grabbing. -/
def lineStep (name : String) : Term :=
  Term.ite
    (termCall "&&"
      [ termCall "!" [Term.var (n "grab")]
      , termCall "==" [Term.var (n "line"), beginMark name] ])
    (goCall (Term.const (n "true")) (Term.var (n "acc")) (Term.var (n "rest")))
    (Term.ite
      (termCall "&&"
        [ Term.var (n "grab")
        , termCall "==" [Term.var (n "line"), endMark name] ])
      someJoined
      (Term.ite (Term.var (n "grab"))
        (goCall (Term.const (n "true"))
          (termCall "::" [Term.var (n "line"), Term.var (n "acc")])
          (Term.var (n "rest")))
        (goCall (Term.const (n "false"))
          (Term.var (n "acc")) (Term.var (n "rest")))))

/-- Nil is missing or unclosed. Cons is the line search.
    Pat has no cons payload, so `line` and `rest` are named in the body.
    The scrutinee `lines` is the list argument. There is no lambda in Term. -/
def goStep (name : String) : Term :=
  Term.match_ (Term.var (n "lines"))
    [ (Pat.ctor0 (n "nil"), emptyStep)
    , (Pat.ctor0 (n "cons"), lineStep name) ]

/-- `go false [] (content.splitOn "\n")`. The function is `goStep`.
    This stores the search. It does not run it. -/
def ssotBody (content name : String) : Term :=
  Term.app
    (Term.app
      (Term.app (goStep name) (Term.const (n "false")))
      (Term.const (n "nil")))
    (termCall "splitOn" [Term.var (n content), Term.litString "\n"])

/-- `def name (a b : String) : Option String :=` the let rec above.
    Another header is skip. A matching header with another body is bad. -/
def parseLetRec (ts : List String) : Bound :=
  match ts with
  | "def" :: name :: "(" :: rest =>
    if !isIdent name then
      Bound.bad
    else
      match parseIdents parseFuel [] rest with
      | some ([b1, b2], rest2) =>
        match rest2 with
        | ":" :: "Option" :: "String" :: ":=" :: rest3 =>
          match takeAll (bodyToks b1 b2) rest3 with
          | some rest4 =>
            let cmd :=
              Cmd.defBind (n name) (asBinders [b1, b2])
                (HostType.option HostType.string) (ssotBody b1 b2)
            Bound.got cmd rest4
          | none => Bound.bad
        | _ => Bound.skip
      | _ => Bound.skip
  | _ => Bound.skip

/-- Bool if first. The let rec only when that if does not apply. -/
def parseBinderDef (ts : List String) : Bound :=
  match parseBoundBool ts with
  | Bound.skip => parseLetRec ts
  | other => other

end SystemsLean.HonestyLetRec
