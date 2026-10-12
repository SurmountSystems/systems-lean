/-
  Module: SystemsLean.HonestyBoolExFront
  Example surface with Bool claims and no Nat literal def.
  Imports, then a namespace, at least one Bool def whose body is the
  literal false, and one Bool def whose body is not a lone literal.
  At least one example. A Nat literal def is none.
  A def may take a binder. The binder is not emitted.
  An example is by decide, by native_decide, or rfl. Examples are not
  emitted. A theorem `= true` is by decide or by native_decide. It is
  not emitted as Bool true. A theorem may take a binder and end in rfl.
  That rfl is not emitted. set_option is skipped.
  `/\` and And.intro are consumed and not emitted.
  The namespace is the one written. The file name is not hardcoded.
  A false Bool stays false. Bool true is not a stand-in.
  A lone Bool true def is none. The false Bool is emitted as false.
  A namespace file with no import is none. def main is none.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyNatClaimFront
import SystemsLean.HonestyStrCatFront

namespace SystemsLean.HonestyBoolExFront

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (strip SMode parseDotted parseFuel)
open SystemsLean.HonestyNatClaimFront
  (takeImports takeOpens parseItems emptySt walkFuel importCmds St)
open SystemsLean.HonestyStrCatFront (tok tokFuel TMode)

def sawExample (ts : List String) : Bool :=
  match ts with
  | [] => false
  | "example" :: _ => true
  | _ :: rest => sawExample rest
termination_by ts

def shapeReady (st : St) : Bool :=
  st.sawOther && st.sawFalse && st.sawDecide && !st.sawNat
    && !st.cmds.isEmpty

def finish (ns : String) (imps : List String) (opens : List Cmd)
    (st : St) (ts : List String) : Option Module :=
  match ts with
  | "end" :: rest =>
    match parseDotted parseFuel rest with
    | some (nm, rest2) =>
      if nm == ns && rest2.isEmpty && shapeReady st then
        let cmds :=
          importCmds imps ++ [Cmd.namespace (n ns)] ++ opens
            ++ st.cmds ++ [Cmd.endNamespace (n ns)]
        some { name := n ns, commands := cmds }
      else
        none
    | none => none
  | _ => none

def parseToks (ts : List String) : Option Module :=
  match sawExample ts with
  | false => none
  | true =>
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
            | some (st, rest4) =>
              finish ns imps opens st rest4
      | _ => none

def parseHonestyBoolExText (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

end SystemsLean.HonestyBoolExFront
