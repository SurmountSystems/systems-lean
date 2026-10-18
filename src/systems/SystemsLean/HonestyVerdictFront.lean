/-
  Module: SystemsLean.HonestyVerdictFront
  Imports, then a namespace, string literal pins, one Bool def whose
  body is not the literal true or false, one Bool-field structure,
  and one fail-closed record of that structure whose fields are false.
  Theorems may be rfl of a pin, rfl that does not reduce, or by decide.
  Examples are by decide. Private defs are skipped, not emitted.
  The namespace is the one written. The file name is not hardcoded.
  A false Bool stays false. Bool true is not a stand-in.
  The non-literal Bool def is not emitted as Bool true.
  The fail-closed record is not emitted as Bool true.
  A namespace file with no import is none.
  A String-field structure is none. A literal Bool true def is none.
  A miss of this shape tries the tactic form.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.TacticForm

namespace SystemsLean.HonestyVerdictFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode parseDotted parseFuel isIdent
  isIdentChar isLetter isDigit isWs unquote)

def tokFuel : Nat := 200000

def walkFuel : Nat := 8192

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

inductive TMode where
  | norm
  | id (cur : List Char)
  | num (cur : List Char)
  | str (cur : List Char)

/-- Tokens for this surface. `:=`, `=>`, `==`, and `&&` stay one token.
    `\` stays a token so `/\` does not drop the rest of the file.
    An unknown character is none. This is not HonestyFront.tok. -/
def tok (fuel : Nat) (cs : List Char) (mode : TMode) (acc : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs, mode with
    | [], TMode.norm => some acc.reverse
    | [], TMode.id cur => some (emitId acc cur).reverse
    | [], TMode.num cur => some (emitId acc cur).reverse
    | [], TMode.str _ => none
    | '"' :: rest, TMode.str cur =>
      tok k rest TMode.norm (emitStr acc cur)
    | c :: rest, TMode.str cur =>
      tok k rest (TMode.str (c :: cur)) acc
    | ':' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm (":=" :: acc)
    | ':' :: ':' :: rest, TMode.norm =>
      tok k rest TMode.norm ("::" :: acc)
    | '=' :: '>' :: rest, TMode.norm =>
      tok k rest TMode.norm ("=>" :: acc)
    | '=' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm ("==" :: acc)
    | '=' :: rest, TMode.norm =>
      tok k rest TMode.norm ("=" :: acc)
    | '&' :: '&' :: rest, TMode.norm =>
      tok k rest TMode.norm ("&&" :: acc)
    | '+' :: '+' :: rest, TMode.norm =>
      tok k rest TMode.norm ("++" :: acc)
    | '+' :: rest, TMode.norm =>
      tok k rest TMode.norm ("+" :: acc)
    | '|' :: '|' :: rest, TMode.norm =>
      tok k rest TMode.norm ("||" :: acc)
    | '|' :: rest, TMode.norm =>
      tok k rest TMode.norm ("|" :: acc)
    | '-' :: '>' :: rest, TMode.norm =>
      tok k rest TMode.norm ("->" :: acc)
    | '<' :: '-' :: rest, TMode.norm =>
      tok k rest TMode.norm ("<-" :: acc)
    | '-' :: rest, TMode.norm =>
      tok k rest TMode.norm ("-" :: acc)
    | '!' :: rest, TMode.norm =>
      tok k rest TMode.norm ("!" :: acc)
    | '>' :: rest, TMode.norm =>
      tok k rest TMode.norm (">" :: acc)
    | '/' :: rest, TMode.norm =>
      tok k rest TMode.norm ("/" :: acc)
    | '\\' :: rest, TMode.norm =>
      tok k rest TMode.norm ("\\" :: acc)
    | '[' :: rest, TMode.norm =>
      tok k rest TMode.norm ("[" :: acc)
    | ']' :: rest, TMode.norm =>
      tok k rest TMode.norm ("]" :: acc)
    | '{' :: rest, TMode.norm =>
      tok k rest TMode.norm ("{" :: acc)
    | '}' :: rest, TMode.norm =>
      tok k rest TMode.norm ("}" :: acc)
    | ',' :: rest, TMode.norm =>
      tok k rest TMode.norm ("," :: acc)
    | ':' :: rest, TMode.norm =>
      tok k rest TMode.norm (":" :: acc)
    | '(' :: rest, TMode.norm =>
      tok k rest TMode.norm ("(" :: acc)
    | ')' :: rest, TMode.norm =>
      tok k rest TMode.norm (")" :: acc)
    | '.' :: rest, TMode.norm =>
      tok k rest TMode.norm ("." :: acc)
    | '"' :: rest, TMode.norm =>
      tok k rest (TMode.str []) acc
    | c :: rest, TMode.norm =>
      if isWs c then tok k rest TMode.norm acc
      else if isLetter c || c == '_' then
        tok k rest (TMode.id [c]) acc
      else if isDigit c then
        tok k rest (TMode.num [c]) acc
      else
        none
    | c :: rest, TMode.id cur =>
      if isIdentChar c then tok k rest (TMode.id (c :: cur)) acc
      else tok k (c :: rest) TMode.norm (emitId acc cur)
    | c :: rest, TMode.num cur =>
      if isDigit c then tok k rest (TMode.num (c :: cur)) acc
      else tok k (c :: rest) TMode.norm (emitId acc cur)
termination_by fuel

def top : String -> Bool
  | "def" => true
  | "theorem" => true
  | "example" => true
  | "structure" => true
  | "end" => true
  | "private" => true
  | "import" => true
  | "namespace" => true
  | "open" => true
  | _ => false

def bump (d : Nat) (t : String) : Nat :=
  if t == "(" || t == "{" || t == "[" then d + 1
  else if t == ")" || t == "}" || t == "]" then
    match d with
    | 0 => 0
    | Nat.succ j => j
  else
    d

def skipTop (fuel : Nat) (d : Nat) (ts : List String) :
    Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => if d == 0 then some [] else none
  | Nat.succ k, t :: rest =>
    if d == 0 && top t then some (t :: rest)
    else skipTop k (bump d t) rest
termination_by fuel

def untilAssign (fuel : Nat) (d : Nat) (ts : List String) :
    Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => none
  | Nat.succ k, ":=" :: rest =>
    if d == 0 then some rest else untilAssign k d rest
  | Nat.succ k, t :: rest =>
    if d == 0 && top t then none
    else untilAssign k (bump d t) rest
termination_by fuel

def skipClose (fuel : Nat) (d : Nat) (ts : List String) :
    Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => none
  | Nat.succ k, t :: rest =>
    let d2 := bump d t
    if d2 == 0 then some rest else skipClose k d2 rest
termination_by fuel

def skipBinders (fuel : Nat) (ts : List String) : Option (List String) :=
  match fuel, ts with
  | 0, _ => none
  | Nat.succ k, "(" :: rest =>
    match skipClose k 1 rest with
    | some rest2 => skipBinders k rest2
    | none => none
  | _, _ => some ts
termination_by fuel

def takeImports (fuel : Nat) (acc : List String) (ts : List String) :
    Option (Prod (List String) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | Nat.succ k, "import" :: rest =>
    match parseDotted parseFuel rest with
    | some (imp, rest2) => takeImports k (imp :: acc) rest2
    | none => none
  | _, _ =>
    if acc.isEmpty then none else some (acc.reverse, ts)
termination_by fuel

def importCmds : List String -> List Cmd
  | [] => []
  | imp :: rest => Cmd.importModule (n imp) :: importCmds rest

def takeNames (fuel : Nat) (acc : List Name) (ts : List String) :
    Option (Prod (List Name) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, ")" :: rest =>
    if acc.isEmpty then none else some (acc.reverse, rest)
  | Nat.succ k, t :: rest =>
    if isIdent t then takeNames k (n t :: acc) rest else none
  | _, [] => none
termination_by fuel

def takeOpens (fuel : Nat) (acc : List Cmd) (ts : List String) :
    Option (Prod (List Cmd) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | Nat.succ k, "open" :: rest =>
    match parseDotted parseFuel rest with
    | some (_, "(" :: rest2) =>
      match takeNames k [] rest2 with
      | some (ns, rest3) =>
        takeOpens k (Cmd.openNs ns :: acc) rest3
      | none => none
    | _ => none
  | _, _ => some (acc.reverse, ts)
termination_by fuel

structure St where
  cmds : List Cmd
  env : List (Prod String Term)
  sawString : Bool
  sawConj : Bool
  sawStruct : Bool
  sawFalse : Bool
  sawRfl : Bool
  sawDecide : Bool
  structNm : String

def emptySt : St :=
  {
    cmds := []
    env := []
    sawString := false
    sawConj := false
    sawStruct := false
    sawFalse := false
    sawRfl := false
    sawDecide := false
    structNm := ""
  }

def lookup (env : List (Prod String Term)) (name : String) : Option Term :=
  match env with
  | [] => none
  | (nm, t) :: rest =>
    if nm == name then some t else lookup rest name

def unfold (fuel : Nat) (env : List (Prod String Term)) (t : Term) : Term :=
  match fuel, t with
  | 0, _ => t
  | Nat.succ k, Term.var x =>
    match lookup env x.raw with
    | some body => unfold k env body
    | none => t
  | Nat.succ k, Term.const x =>
    match lookup env x.raw with
    | some body => unfold k env body
    | none => t
  | _, _ => t
termination_by fuel

def sameVal (a b : Term) : Bool :=
  match a, b with
  | Term.litBool x, Term.litBool y => x == y
  | Term.litString x, Term.litString y => x == y
  | _, _ => false

def parseAtom (ts : List String) : Option (Prod Term (List String)) :=
  match ts with
  | "false" :: rest => some (Term.litBool false, rest)
  | "true" :: rest => some (Term.litBool true, rest)
  | tok :: rest =>
    match unquote tok with
    | some s => some (Term.litString s, rest)
    | none =>
      if isIdent tok then some (Term.var (n tok), rest) else none
  | [] => none

def rflCmd (nm : String) (lhs rhs : Term) : Cmd :=
  let eqt := Term.app (Term.app (Term.const (n "Eq")) lhs) rhs
  let body := Term.app (Term.const (n "rfl")) eqt
  Cmd.def_ (n nm) (some (HostType.named (n "Prop"))) body

inductive RflTry where
  | emit (cmd : Cmd) (rest : List String)
  | mismatch
  | other

def tryRfl (env : List (Prod String Term)) (nm : String)
    (ts : List String) : RflTry :=
  match parseAtom ts with
  | some (lhs, "=" :: rest) =>
    match parseAtom rest with
    | some (rhs, ":=" :: "rfl" :: rest2) =>
      let l := unfold parseFuel env lhs
      let r := unfold parseFuel env rhs
      if sameVal l r then .emit (rflCmd nm l r) rest2 else .mismatch
    | _ => .other
  | _ => .other

inductive Flat where
  | ok (rest : List String)
  | flipped
  | other

def flatFalse (fuel : Nat) (saw : Bool) (ts : List String) : Flat :=
  match fuel, ts with
  | 0, _ => .other
  | _, [] => .other
  | _, "}" :: rest => if saw then .ok rest else .other
  | Nat.succ k, "," :: rest => flatFalse k saw rest
  | Nat.succ k, name :: ":=" :: "false" :: rest =>
    if isIdent name then flatFalse k true rest else .other
  | _, _ :: ":=" :: "true" :: _ => .flipped
  | _, _ => .other
termination_by fuel

def takeFields (fuel : Nat) (acc : List FieldDecl) (ts : List String) :
    Option (Prod (List FieldDecl) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, "deriving" :: rest =>
    if acc.isEmpty then none else some (acc.reverse, rest)
  | Nat.succ k, t :: ":" :: "Bool" :: rest =>
    if isIdent t then
      let f : FieldDecl := { name := n t, ty := HostType.bool }
      takeFields k (f :: acc) rest
    else
      none
  | _, _ => none
termination_by fuel

def takeDeriving (fuel : Nat) (acc : List Name) (ts : List String) :
    Option (Prod (List Name) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => some (acc.reverse, [])
  | Nat.succ k, t :: rest =>
    if top t then some (acc.reverse, t :: rest)
    else if t == "," then takeDeriving k acc rest
    else if isIdent t then takeDeriving k (n t :: acc) rest
    else none
termination_by fuel

def parseStruct (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  if st.sawStruct then
    none
  else
    match ts with
    | "structure" :: name :: "where" :: rest =>
      if isIdent name then
        match takeFields walkFuel [] rest with
        | some (fs, rest2) =>
          match takeDeriving walkFuel [] rest2 with
          | some (ders, rest3) =>
            let cmd := Cmd.structure_ (n name) fs ders
            some ({
              st with
              cmds := st.cmds ++ [cmd],
              sawStruct := true,
              structNm := name
            }, rest3)
          | none => none
        | none => none
      else
        none
    | _ => none

def afterSkip (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match skipTop walkFuel 0 ts with
  | some rest => some (st, rest)
  | none => none

def markConj (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match skipTop walkFuel 0 ts with
  | some rest => some ({ st with sawConj := true }, rest)
  | none => none

def markFalse (st : St) (rest : List String) :
    Option (Prod St (List String)) :=
  some ({ st with sawFalse := true }, rest)

def parseBoolBody (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | "true" :: rest =>
    match rest with
    | t :: _ => if top t then none else markConj st ts
    | [] => none
  | "false" :: rest =>
    match rest with
    | t :: _ => if top t then some (st, rest) else markConj st ts
    | [] => some (st, [])
  | _ => markConj st ts

def parseStringBody (st : St) (nm : String) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | tok :: rest =>
    match unquote tok with
    | some s =>
      match rest with
      | t :: _ =>
        if top t then
          let body := Term.litString s
          let cmd := Cmd.def_ (n nm) (some HostType.string) body
          some ({
            st with
            cmds := st.cmds ++ [cmd],
            env := (nm, body) :: st.env,
            sawString := true
          }, rest)
        else
          afterSkip st ts
      | [] =>
        let body := Term.litString s
        let cmd := Cmd.def_ (n nm) (some HostType.string) body
        some ({
          st with
          cmds := st.cmds ++ [cmd],
          env := (nm, body) :: st.env,
          sawString := true
        }, [])
    | none => afterSkip st ts
  | [] => none

def parseRecord (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | "{" :: rest =>
    match flatFalse walkFuel false rest with
    | .ok rest2 => markFalse st rest2
    | .flipped => none
    | .other => afterSkip st ts
  | _ => afterSkip st ts

def parseBody (st : St) (nm ty : String) (ts : List String) :
    Option (Prod St (List String)) :=
  if ty == "String" then parseStringBody st nm ts
  else if ty == "Bool" then parseBoolBody st ts
  else if ty != "" && ty == st.structNm then parseRecord st ts
  else afterSkip st ts

def parseDef (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match parseDotted parseFuel ts with
  | none => none
  | some (nm, rest) =>
    match skipBinders walkFuel rest with
    | none => none
    | some (":" :: restTy) =>
      match parseDotted parseFuel restTy with
      | some (ty, ":=" :: rest3) => parseBody st nm ty rest3
      | _ =>
        match untilAssign walkFuel 0 restTy with
        | some rest3 => afterSkip st rest3
        | none => none
    | _ => none

def parseThm (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | name :: rest =>
    if isIdent name then
      match skipBinders walkFuel rest with
      | some (":" :: rest2) =>
        match tryRfl st.env name rest2 with
        | .emit cmd rest3 =>
          some ({
            st with
            cmds := st.cmds ++ [cmd],
            sawRfl := true
          }, rest3)
        | .mismatch => none
        | .other =>
          match untilAssign walkFuel 0 rest2 with
          | some ("rfl" :: rest3) => some (st, rest3)
          | some ("by" :: "decide" :: rest3) =>
            some ({ st with sawDecide := true }, rest3)
          | some rest3 => afterSkip st rest3
          | none => none
      | _ => none
    else
      none
  | [] => none

def parseExample (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match untilAssign walkFuel 0 ts with
  | some ("by" :: "decide" :: rest) =>
    some ({ st with sawDecide := true }, rest)
  | _ => none

def parseItems (fuel : Nat) (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => some (st, [])
  | _, "end" :: _ => some (st, ts)
  | Nat.succ k, "structure" :: _ =>
    match parseStruct st ts with
    | some (st2, rest) => parseItems k st2 rest
    | none => none
  | Nat.succ k, "private" :: "def" :: "main" :: _ => none
  | Nat.succ k, "private" :: "def" :: rest =>
    match afterSkip st rest with
    | some (st2, rest2) => parseItems k st2 rest2
    | none => none
  | Nat.succ k, "def" :: "main" :: _ => none
  | Nat.succ k, "def" :: rest =>
    match parseDef st rest with
    | some (st2, rest2) => parseItems k st2 rest2
    | none => none
  | Nat.succ k, "theorem" :: rest =>
    match parseThm st rest with
    | some (st2, rest2) => parseItems k st2 rest2
    | none => none
  | Nat.succ k, "example" :: rest =>
    match parseExample st rest with
    | some (st2, rest2) => parseItems k st2 rest2
    | none => none
  | _, _ => none
termination_by fuel

def ready (st : St) : Bool :=
  st.sawString && st.sawConj && st.sawStruct && st.sawFalse
    && st.sawRfl && st.sawDecide && !st.cmds.isEmpty

def finish (ns : String) (imps : List String) (opens : List Cmd) (st : St)
    (ts : List String) : Option Module :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) =>
      if nm == ns && rest2.isEmpty && ready st then
        let cmds :=
          importCmds imps ++ [Cmd.namespace (n ns)] ++ opens
            ++ st.cmds ++ [Cmd.endNamespace (n ns)]
        some { name := n ns, commands := cmds }
      else
        none
    | none => none
  | _ => none

def parseToks (ts : List String) : Option Module :=
  match takeImports walkFuel [] ts with
  | none => none
  | some (imps, rest) =>
    match rest with
    | "namespace" :: nsRest =>
      match parseDotted parseFuel nsRest with
      | none => none
      | some (ns, rest2) =>
        match takeOpens walkFuel [] rest2 with
        | none => none
        | some (opens, rest3) =>
          match parseItems walkFuel emptySt rest3 with
          | none => none
          | some (st, rest4) => finish ns imps opens st rest4
    | _ => none

def parseHonestyVerdictText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none =>
    SystemsLean.TacticForm.parseTacticForm src
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none =>
      SystemsLean.TacticForm.parseTacticForm src
    | some ts =>
      match parseToks ts with
      | some m => some m
      | none =>
        SystemsLean.TacticForm.parseTacticForm src

def tacticFallbackSome : Bool :=
  match parseHonestyVerdictText (
      "import SystemsLean.HostTerm\n"
        ++ "namespace SystemsLean.Toy\n"
        ++ "theorem t : true = true := by decide\n"
        ++ "end SystemsLean.Toy\n") with
  | some m => m.name.raw == "SystemsLean.Toy"
  | none => false

def namespaceMisses : Bool :=
  match parseHonestyVerdictText "namespace SystemsLean.Toy\n" with
  | none => true
  | some _ => false

end SystemsLean.HonestyVerdictFront
