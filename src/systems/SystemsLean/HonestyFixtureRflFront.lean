/-
  Module: SystemsLean.HonestyFixtureRflFront
  Fixture shape: imports, a namespace, opens, one Nat literal,
  a structure literal, an Option def, a non-literal Bool,
  lone Bool false defs, set_option maxRecDepth, theorems by
  decide including `= true`, theorems by native_decide, a
  `/\` theorem proved by And.intro, and examples by decide,
  by native_decide, or `:= rfl`, including a string rfl.
  A structure literal, an Option match, a non-literal Bool,
  set_option, and an unreduced rfl are skipped.
  A reduced example `name = false := rfl` is emitted as
  named Prop. A `= true` theorem is not emitted as Bool true.
  The namespace is the one written in the file.
  The file name is not hardcoded.
  A false Bool stays false. Bool true is not a stand-in.
  A lone Bool true def is none. def main is none.
  A namespace file with no import is none.
  Every emitted def has a type.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyNatClaimFront
import SystemsLean.HonestyStrCatFront

namespace SystemsLean.HonestyFixtureRflFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode parseDotted parseFuel isIdent)
open SystemsLean.HonestyNatClaimFront (
  top bump skipTop skipBinders takeImports takeOpens importCmds
  tryRfl RflTry natOf walkFuel)
open SystemsLean.HonestyStrCatFront (tok tokFuel TMode)

def hasTok (ts : List String) (t : String) : Bool :=
  match ts with
  | [] => false
  | h :: rest => h == t || hasTok rest t
termination_by ts

def hasPair (ts : List String) (a b : String) : Bool :=
  match ts with
  | [] => false
  | x :: rest =>
    let hit :=
      match rest with
      | y :: _ => x == a && y == b
      | [] => false
    hit || hasPair rest a b
termination_by ts

def isStrTok (t : String) : Bool :=
  match t.toList with
  | '"' :: _ => true
  | _ => false

def hasStr (ts : List String) : Bool :=
  match ts with
  | [] => false
  | t :: rest => isStrTok t || hasStr rest
termination_by ts

def typeIs (ty : List String) (t : String) : Bool :=
  match ty with
  | [one] => one == t
  | _ => false

def loneTrue (rest : List String) : Bool :=
  match rest with
  | [] => true
  | t :: _ => top t

def startsBrace : List String -> Bool
  | "{" :: _ => true
  | _ => false

def startsAndIntro : List String -> Bool
  | "And" :: "." :: "intro" :: _ => true
  | _ => false

def exName (ts : List String) : String :=
  match ts with
  | t :: _ => if isIdent t then "ex_" ++ t else "ex_rfl"
  | [] => "ex_rfl"

structure St where
  cmds : List Cmd
  env : List (Prod String Term)
  sawNat : Bool
  sawOther : Bool
  sawFalse : Bool
  sawRfl : Bool
  sawDecide : Bool
  sawNative : Bool
  sawStruct : Bool
  sawOption : Bool
  sawConj : Bool
  sawStrRfl : Bool
  sawEqTrue : Bool
  sawSetOpt : Bool

def emptySt : St :=
  {
    cmds := []
    env := []
    sawNat := false
    sawOther := false
    sawFalse := false
    sawRfl := false
    sawDecide := false
    sawNative := false
    sawStruct := false
    sawOption := false
    sawConj := false
    sawStrRfl := false
    sawEqTrue := false
    sawSetOpt := false
  }

def ready (st : St) : Bool :=
  st.sawNat && st.sawOther && st.sawFalse && st.sawRfl
    && st.sawDecide && st.sawNative && st.sawStruct
    && st.sawOption && st.sawConj && st.sawStrRfl
    && st.sawEqTrue && st.sawSetOpt && !st.cmds.isEmpty

def seeOpt (fuel : Nat) (d : Nat) (saw : Bool) (ts : List String) :
    Option (Prod Bool (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => if d == 0 then some (saw, []) else none
  | Nat.succ k, t :: rest =>
    if d == 0 && top t then some (saw, t :: rest)
    else seeOpt k (bump d t) (saw || (t == "maxRecDepth")) rest
termination_by fuel

def takeStmt (fuel : Nat) (d : Nat) (acc : List String)
    (ts : List String) : Option (Prod (List String) (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => none
  | Nat.succ k, ":=" :: rest =>
    if d == 0 then some (acc.reverse, rest)
    else takeStmt k d (":=" :: acc) rest
  | Nat.succ k, t :: rest =>
    if d == 0 && top t then none
    else takeStmt k (bump d t) (t :: acc) rest
termination_by fuel

def emitNat (st : St) (nm : String) (k : Nat) (rest : List String) :
    Prod St (List String) :=
  let body := Term.litNat k
  let cmd := Cmd.def_ (n nm) (some HostType.nat) body
  ({
    st with
    cmds := st.cmds ++ [cmd],
    env := (nm, body) :: st.env,
    sawNat := true
  }, rest)

def emitFalse (st : St) (nm : String) (rest : List String) :
    Prod St (List String) :=
  let body := Term.litBool false
  let cmd := Cmd.def_ (n nm) (some HostType.bool) body
  ({
    st with
    cmds := st.cmds ++ [cmd],
    env := (nm, body) :: st.env,
    sawFalse := true
  }, rest)

def markOther (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match skipTop walkFuel 0 ts with
  | some rest => some ({ st with sawOther := true }, rest)
  | none => none

def skipPlain (st : St) (ty body : List String) :
    Option (Prod St (List String)) :=
  match skipTop walkFuel 0 body with
  | none => none
  | some rest =>
    some ({
      st with
      sawOption := st.sawOption || hasTok ty "Option",
      sawStruct := st.sawStruct || startsBrace body
    }, rest)

def parseNatBody (st : St) (nm : String) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | [] => none
  | tok :: rest =>
    match natOf tok with
    | some k =>
      match rest with
      | t :: _ =>
        if top t then some (emitNat st nm k rest)
        else skipPlain st [] ts
      | [] => some (emitNat st nm k [])
    | none => skipPlain st [] ts

def parseBoolBody (st : St) (nm : String) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | [] => none
  | "true" :: rest =>
    if loneTrue rest then none else markOther st ts
  | "false" :: rest =>
    if loneTrue rest then some (emitFalse st nm rest)
    else markOther st ts
  | _ => markOther st ts

def parseBody (st : St) (nm : String) (ty body : List String) :
    Option (Prod St (List String)) :=
  if typeIs ty "Nat" then parseNatBody st nm body
  else if typeIs ty "Bool" then parseBoolBody st nm body
  else skipPlain st ty body

def parseDef (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match parseDotted parseFuel ts with
  | none => none
  | some (nm, rest) =>
    match skipBinders walkFuel rest with
    | some (":" :: restTy) =>
      match takeStmt walkFuel 0 [] restTy with
      | some (ty, body) => parseBody st nm ty body
      | none => none
    | _ => none

def noteDecide (st : St) (stmt : List String) : St :=
  {
    st with
    sawDecide := true,
    sawEqTrue := st.sawEqTrue || hasPair stmt "=" "true"
  }

def noteNative (st : St) (stmt : List String) : St :=
  {
    st with
    sawDecide := true,
    sawNative := true,
    sawEqTrue := st.sawEqTrue || hasPair stmt "=" "true"
  }

def noteStr (st : St) : St :=
  { st with sawStrRfl := true }

def armConj (st : St) (stmt proof : List String) : St :=
  let slash := hasTok stmt "/" && hasTok stmt "\\"
  let intro := startsAndIntro proof
  { st with sawConj := st.sawConj || (slash && intro) }

/-- Reduced `:= rfl` is emitted. `= true` is not a Bool def. -/
def parseClaim (st : St) (nm : String) (ts : List String) :
    Option (Prod St (List String)) :=
  match tryRfl st.env nm ts with
  | RflTry.emit cmd rest =>
    some ({
      st with
      cmds := st.cmds ++ [cmd],
      sawRfl := true
    }, rest)
  | RflTry.mismatch => none
  | RflTry.other =>
    match takeStmt walkFuel 0 [] ts with
    | none => none
    | some (stmt, proof) =>
      match proof with
      | "by" :: "decide" :: rest =>
        some (noteDecide st stmt, rest)
      | "by" :: "native_decide" :: rest =>
        some (noteNative st stmt, rest)
      | "rfl" :: rest =>
        if hasStr stmt then some (noteStr st, rest)
        else some (st, rest)
      | _ =>
        match skipTop walkFuel 0 proof with
        | some rest => some (armConj st stmt proof, rest)
        | none => none

def parseThm (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | name :: rest =>
    if isIdent name then
      match skipBinders walkFuel rest with
      | some (":" :: rest2) => parseClaim st name rest2
      | _ => none
    else
      none
  | [] => none

def parseExample (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match ts with
  | ":" :: rest => parseClaim st (exName rest) rest
  | _ => none

def parseItems (fuel : Nat) (st : St) (ts : List String) :
    Option (Prod St (List String)) :=
  match fuel, ts with
  | 0, _ => none
  | _, [] => some (st, [])
  | _, "end" :: _ => some (st, ts)
  | Nat.succ k, "set_option" :: rest =>
    match seeOpt walkFuel 0 false rest with
    | some (saw, rest2) =>
      let st2 := { st with sawSetOpt := st.sawSetOpt || saw }
      parseItems k st2 rest2
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

def finish (ns : String) (imps : List String) (opens : List Cmd)
    (st : St) (ts : List String) : Option Module :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) =>
      if nm == ns && rest2.isEmpty && ready st && !opens.isEmpty then
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

def parseHonestyFixtureRflText (src : String) :
    Option SystemsLean.HostTerm.Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

end SystemsLean.HonestyFixtureRflFront
