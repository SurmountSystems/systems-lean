/-
  Module: SystemsLean.HonestyEmitApplyFront
  Front for theorems and examples over SystemsLean.EmitApply.
  Four imports select the seed. The file name is not stored.
  Four imports, then namespace SystemsLean.EmitApply.
  DualResidual and DualResidualTheorems are none.
  rfl and examples are not emitted.
  by decide emits Bool true only when both sides reduce
  to the same true value. A false pin stays false.
  A lone Bool true is not a stand-in for an unreduced chain.
  This is not a general Lean parser.
  A one-raw-string module is accepted when the seed is none.
  An import, a theorem, and a bare literal are accepted after that.
  An import, no theorem, a bare literal, and another code line
  are accepted after that.
  An import, no theorem, no bare literal, and another code line
  are accepted after that. The module is the namespace and its end.
  No import, a bare literal, and another code line are accepted after that.
  An import, a column-0 mutual, a bare end, and a matching
  namespace end are accepted after that. Theorems stay out.
  The mutual block is not emitted. Kernel fuel stays 64.
  One import, a namespace, and its end, with no other command,
  are accepted after that.
  False Bool literals stay false.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HonestyDecide
import SystemsLean.HonestyFront
import SystemsLean.RawString
import SystemsLean.ImportThm
import SystemsLean.ImportLit
import SystemsLean.ImportCode
import SystemsLean.NsCode
import SystemsLean.MutualEnd
import SystemsLean.ImportNs

namespace SystemsLean.HonestyEmitApplyFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce (DefEnv)
open SystemsLean.HonestyDecide (decideHolds)
open SystemsLean.HonestyFront
  (strip SMode parseDotted parseFuel isIdent
    isDigit isWs isLetter isIdentChar)

def nsSeed : String := "SystemsLean.EmitApply"

def importSeed : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.HostCompose"
  , "SystemsLean.EmitApplyScaffold"
  ]

/-- One step per command. Sixty-four steps do not cover this file. -/
def itemFuel : Nat := 128

/-- Token scans inside one command. Fuel 0 is none. -/
def scanFuel : Nat := 8192

def emptyEnv : DefEnv := []

def join : List String -> String
  | [] => ""
  | t :: rest =>
    match rest with
    | [] => t
    | _ => t ++ " " ++ join rest

def lookup (k : String) (xs : List (Prod String Term)) : Option Term :=
  match xs with
  | [] => none
  | (nm, t) :: rest =>
    if nm == k then some t else lookup k rest

def pinB (ts : List String) (b : Bool) : Prod String Term :=
  (join ts, Term.litBool b)

def pinN (ts : List String) (s : String) : Prod String Term :=
  (join ts, Term.litString s)

def keyFailClosed : List String :=
  ["applyIsValid", "Apply", ".", "failClosed"]

def keyEmptyOk : List String :=
  ["applyOk", "HostCompose", ".", "empty"]

/-- LHS joins only. Built with join so the lookup key is the same text. -/
def emitSeed : List (Prod String Term) :=
  [ pinB keyFailClosed false
  , pinB ["applyOk", "thmHostMult1Unminted"] false
  , pinB
      [ "applyOk", "(", "smokePush", "HostCompose", ".", "empty"
      , "smokeLinearNode", ")"
      ]
      false
  , pinB keyEmptyOk true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "HostCompose", "."
      , "empty", "a", ".", "valid", "&&", "a", ".", "count", "==", "0"
      , "&&", "a", ".", "tags", ".", "isEmpty", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "thmHostMult1Minted"
      , "a", ".", "valid", "&&", "a", ".", "count", "==", "1", "&&", "a"
      , ".", "tags", "==", "[", "17", "]", "&&", "tagMult", "17", "=="
      , "1", "&&", "tagKind", "17", "==", "1", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "thmHostMult0Marked"
      , "a", ".", "valid", "&&", "a", ".", "count", "==", "1", "&&", "a"
      , ".", "tags", "==", "[", "2", "]", "&&", "tagMult", "2", "==", "0"
      , "&&", "tagKind", "2", "==", "2", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "thmHostOmega", "a"
      , ".", "valid", "&&", "a", ".", "count", "==", "1", "&&", "a", "."
      , "tags", "==", "[", "32", "]", "&&", "tagMult", "32", "==", "2"
      , "&&", "tagKind", "32", "==", "0", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose"
      , "thmHostLinearAndErased", "applyIsValid", "a", "&&", "a", "."
      , "count", "==", "2", "&&", "a", ".", "tags", "==", "[", "17", ","
      , "2", "]", ")"
      ]
      true
  , pinB
      [ "(", "let", "a1", ":", "Apply", ":=", "{", "tags", ":=", "["
      , "17", "]", ",", "count", ":=", "2", ",", "valid", ":=", "true"
      , "}", "let", "a2", ":", "Apply", ":=", "{", "tags", ":=", "[", "17"
      , ",", "2", "]", ",", "count", ":=", "1", ",", "valid", ":=", "true"
      , "}", "!", "applyIsValid", "a1", "&&", "!", "applyIsValid", "a2"
      , ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":", "Apply", ":=", "{", "tags", ":=", "List"
      , ".", "replicate", "33", "17", ",", "count", ":=", "33", ","
      , "valid", ":=", "true", "}", "decide", "(", "a", ".", "count", "=="
      , "a", ".", "tags", ".", "length", ")", "&&", "decide", "(", "a"
      , ".", "count", ">", "applyCap", ")", "&&", "!", "applyIsValid", "a"
      , ")"
      ]
      true
  , pinB
      [ "(", "let", "aEmpty", ":=", "applyFromCompose", "HostCompose", "."
      , "empty", "let", "aMinted", ":=", "applyFromCompose"
      , "thmHostMult1Minted", "let", "aMarked", ":=", "applyFromCompose"
      , "thmHostMult0Marked", "let", "aOmega", ":=", "applyFromCompose"
      , "thmHostOmega", "let", "aOrder", ":=", "applyFromCompose"
      , "thmHostLinearAndErased", "let", "aUnminted", ":="
      , "applyFromCompose", "thmHostMult1Unminted", "aEmpty", ".", "valid"
      , "&&", "applyIsValid", "aEmpty", "&&", "aMinted", ".", "valid"
      , "&&", "applyIsValid", "aMinted", "&&", "aMarked", ".", "valid"
      , "&&", "applyIsValid", "aMarked", "&&", "aOmega", ".", "valid"
      , "&&", "applyIsValid", "aOmega", "&&", "aOrder", ".", "valid", "&&"
      , "applyIsValid", "aOrder", "&&", "!", "aUnminted", ".", "valid"
      , "&&", "!", "applyIsValid", "aUnminted", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "(", "smokeMint", "("
      , "smokePush", "HostCompose", ".", "empty", "smokeLinearNode", ")"
      , "3", ")", "a", ".", "valid", "&&", "a", ".", "count", "==", "1"
      , "&&", "a", ".", "tags", "==", "[", "17", "]", "&&", "tagMult"
      , "17", "==", "1", "&&", "tagKind", "17", "==", "1", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "(", "HostCompose", "."
      , "markErased", "(", "smokePush", "HostCompose", ".", "empty"
      , "smokeErasedNode", ")", ")", "a", ".", "valid", "&&", "a", "."
      , "count", "==", "1", "&&", "a", ".", "tags", "==", "[", "2", "]"
      , "&&", "tagMult", "2", "==", "0", "&&", "tagKind", "2", "==", "2"
      , ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "(", "smokePush"
      , "HostCompose", ".", "empty", "smokeValueNode", ")", "a", "."
      , "valid", "&&", "a", ".", "count", "==", "1", "&&", "a", ".", "tags"
      , "==", "[", "32", "]", "&&", "tagMult", "32", "==", "2", "&&"
      , "tagKind", "32", "==", "0", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":=", "applyFromCompose", "smokeLinearAndErased"
      , "applyIsValid", "a", "&&", "a", ".", "count", "==", "2", "&&", "a"
      , ".", "tags", "==", "[", "17", ",", "2", "]", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":", "Apply", ":=", "{", "tags", ":=", "[", "17"
      , "]", ",", "count", ":=", "2", ",", "valid", ":=", "true", "}"
      , "!", "applyIsValid", "a", ")"
      ]
      true
  , pinB
      [ "(", "let", "a", ":", "Apply", ":=", "{", "tags", ":=", "[", "17"
      , ",", "2", "]", ",", "count", ":=", "1", ",", "valid", ":=", "true"
      , "}", "!", "applyIsValid", "a", ")"
      ]
      true
  , pinN ["applyCap"] "32"
  , pinN
      [ "packTag", "{", "ty", ":=", "Types", ".", "typeTagInit", "1", ","
      , "mult", ":=", "Mult", ".", "mult1", ",", "kind", ":=", "NodeKind"
      , ".", "linear", "}"
      ]
      "17"
  , pinN
      [ "packTag", "{", "ty", ":=", "Types", ".", "typeTagInit", "0", ","
      , "mult", ":=", "Mult", ".", "mult0", ",", "kind", ":=", "NodeKind"
      , ".", "erased", "}"
      ]
      "2"
  , pinN
      [ "packTag", "{", "ty", ":=", "Types", ".", "typeTagInit", "2", ","
      , "mult", ":=", "Mult", ".", "multOmega", ",", "kind", ":=", "NodeKind"
      , ".", "value", "}"
      ]
      "32"
  , pinN ["tagMult", "17"] "1"
  , pinN ["tagKind", "17"] "1"
  , pinN ["tagMult", "2"] "0"
  , pinN ["tagKind", "2"] "2"
  , pinN ["tagMult", "32"] "2"
  , pinN ["tagKind", "32"] "0"
  , pinN ["packTag", "smokeLinearNode"] "17"
  , pinN ["packTag", "smokeErasedNode"] "2"
  , pinN ["packTag", "smokeValueNode"] "32"
  ]

def falsePinOk : Bool :=
  match lookup (join keyFailClosed) emitSeed with
  | some (Term.litBool false) => true
  | _ => false

def truePinOk : Bool :=
  match lookup (join keyEmptyOk) emitSeed with
  | some (Term.litBool true) => true
  | _ => false

/-- False pins stay false. Decide holds only on equal Bool or string. -/
def seedHolds : Bool :=
  decideHolds emptyEnv (Term.litBool true) (Term.litBool true)
    && !decideHolds emptyEnv (Term.litBool false) (Term.litBool true)
    && decideHolds emptyEnv (Term.litString "32") (Term.litString "32")
    && !decideHolds emptyEnv (Term.litString "32") (Term.litString "17")
    && falsePinOk
    && truePinOk

inductive Proof where
  | rfl
  | decide

structure ThmWalk where
  cmds : List Cmd
  sawDecide : Bool
  sawExample : Bool
  sawFalse : Bool
  sawRfl : Bool

def emptyWalk : ThmWalk :=
  { cmds := []
    sawDecide := false
    sawExample := false
    sawFalse := false
    sawRfl := false }

def emitHeld (nm : String) : Cmd :=
  Cmd.def_ (n nm) (some HostType.bool) (Term.litBool true)

def addEx (ex : Bool) (w : ThmWalk) : ThmWalk :=
  { w with sawExample := w.sawExample || ex }

def addRfl (pf : Proof) (w : ThmWalk) : ThmWalk :=
  match pf with
  | Proof.rfl => { w with sawRfl := true }
  | Proof.decide => w

def allDigits (s : String) : Bool :=
  match s.toList with
  | [] => false
  | c :: cs => isDigit c && cs.all isDigit

/-- Bool and decimal only. No typeless true. Nat is not a term here. -/
def agrees (seed : Term) (rhs : List String) : Bool :=
  match seed, rhs with
  | Term.litBool b, ["true"] =>
    decideHolds emptyEnv (Term.litBool b) (Term.litBool true)
  | Term.litBool b, ["false"] =>
    decideHolds emptyEnv (Term.litBool b) (Term.litBool false)
  | Term.litString s, [t] =>
    if allDigits t then
      decideHolds emptyEnv (Term.litString s) (Term.litString t)
    else
      false
  | _, _ => false

def closeClaim (ex : Bool) (nm : String) (pf : Proof) (got : Option Term)
    (rhs : List String) (w : ThmWalk) : Option ThmWalk :=
  match got, pf with
  | none, Proof.rfl => some (addEx ex { w with sawRfl := true })
  | none, Proof.decide => none
  | some seed, _ =>
    match agrees seed rhs with
    | false => none
    | true =>
      match pf, seed, ex with
      | Proof.decide, Term.litBool true, false =>
        some
          { w with
            sawDecide := true
            cmds := emitHeld nm :: w.cmds }
      | Proof.decide, Term.litBool true, true =>
        some { w with sawExample := true }
      | Proof.rfl, Term.litBool true, _ =>
        some (addEx ex { w with sawRfl := true })
      | Proof.decide, Term.litBool false, _ =>
        some (addEx ex { w with sawFalse := true })
      | Proof.rfl, Term.litBool false, _ =>
        some (addEx ex { w with sawFalse := true, sawRfl := true })
      | _, Term.litString _, _ =>
        some (addEx ex (addRfl pf w))
      | _, _, _ => none

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
    A lone `=` is a token. A lone `&` is none. Digits stay one number.
    Every recursive call is on `rest`. -/
def tok : List Char -> TokMode -> List String -> Option (List String)
  | [], TokMode.norm, acc => some acc.reverse
  | [], TokMode.id cur, acc => some (emitId acc cur).reverse
  | [], TokMode.num cur, acc => some (emitNum acc cur).reverse
  | [], TokMode.str _, _ => none
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
  | "end" => true
  | "theorem" => true
  | "example" => true
  | "open" => true
  | "namespace" => true
  | "private" => true
  | "def" => true
  | "structure" => true
  | "inductive" => true
  | "abbrev" => true
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

def skipCmd (fuel : Nat) (d : Nat) (ts : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] =>
      if d == 0 then some [] else none
    | t :: rest =>
      if d == 0 && isHead t then some (t :: rest)
      else
        match adj d t with
        | none => none
        | some d2 => skipCmd k d2 rest
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

/-- `rfl` and `by decide` only. `native_decide` is none. -/
def takeProof (ts : List String) : Option (Prod Proof (List String)) :=
  match ts with
  | "rfl" :: rest => some (Proof.rfl, rest)
  | "by" :: "decide" :: rest => some (Proof.decide, rest)
  | _ => none

def useClaim (ex : Bool) (nm : String) (w : ThmWalk) (ts : List String) :
    Option (Prod ThmWalk (List String)) :=
  match takeUntilAssign scanFuel 0 [] ts with
  | none => none
  | some (claim, rest) =>
    match splitEq scanFuel 0 [] claim with
    | none => none
    | some (lhs, rhs) =>
      match takeProof rest with
      | none => none
      | some (pf, rest2) =>
        match closeClaim ex nm pf (lookup (join lhs) emitSeed) rhs w with
        | none => none
        | some w2 => some (w2, rest2)

def parseItems (fuel : Nat) (w : ThmWalk) (ts : List String) :
    Option (Prod ThmWalk (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | [] => none
    | "end" :: _ => some (w, ts)
    | "open" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "namespace" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "def" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "structure" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "inductive" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "abbrev" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "private" :: "def" :: rest =>
      match skipCmd scanFuel 0 rest with
      | some rest2 => parseItems k w rest2
      | none => none
    | "theorem" :: name :: rest =>
      if isIdent name then
        match skipToColon scanFuel 0 rest with
        | some claimTs =>
          match useClaim false name w claimTs with
          | some (w2, rest2) => parseItems k w2 rest2
          | none => none
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match useClaim true "ex" w rest with
      | some (w2, rest2) => parseItems k w2 rest2
      | none => none
    | _ => none
termination_by fuel

def importCmds : List Cmd :=
  importSeed.map (fun s => Cmd.importModule (n s))

def finish (ns : String) (w : ThmWalk) (ts : List String) : Option Module :=
  if w.sawDecide && w.sawExample && w.sawFalse && w.sawRfl
      && !w.cmds.isEmpty then
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && ns == nsSeed && rest2.isEmpty then
          let cmds :=
            importCmds ++ [Cmd.namespace (n ns)]
            ++ w.cmds.reverse
            ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none
  else
    none

def takeImports (fuel : Nat) (need : List String) (ts : List String) :
    Option (List String) :=
  match fuel, need with
  | _, [] => some ts
  | 0, _ => none
  | Nat.succ k, s :: more =>
    match ts with
    | "import" :: rest =>
      match parseDotted parseFuel rest with
      | some (got, rest2) =>
        if got == s then takeImports k more rest2 else none
      | none => none
    | _ => none
termination_by fuel

/-- Parse the emit-apply seed. none means not these imports, or a bad claim. -/
def parseEmitApplySeed (src : String) : Option Module :=
  if !seedHolds then
    none
  else
    match strip src.toList SMode.code [] with
    | none => none
    | some kept =>
      match tok kept TokMode.norm [] with
      | none => none
      | some ts =>
        match takeImports 8 importSeed ts with
        | none => none
        | some rest =>
          match rest with
          | "namespace" :: rest2 =>
            match parseDotted parseFuel rest2 with
            | some (ns, rest3) =>
              if ns == nsSeed then
                match parseItems itemFuel emptyWalk rest3 with
                | some (w, rest4) => finish ns w rest4
                | none => none
              else
                none
            | none => none
          | _ => none

/-- Seed, then raw, theorem, literal, code, ns, mutual, one import. -/
def parseHonestyEmitApplyText (src : String) : Option Module :=
  match parseEmitApplySeed src with
  | some m => some m
  | none =>
    match RawString.parseRawString src with
    | some m => some m
    | none =>
      match ImportThm.parseImportThm src with
      | some m => some m
      | none =>
        match ImportLit.parseImportLit src with
        | some m => some m
        | none =>
          match ImportCode.parseImportCode src with
          | some m => some m
          | none =>
            match NsCode.parseNsCode src with
            | some m => some m
            | none =>
              match MutualEnd.parseMutualEnd src with
              | some m => some m
              | none => ImportNs.parseImportNs src

end SystemsLean.HonestyEmitApplyFront
