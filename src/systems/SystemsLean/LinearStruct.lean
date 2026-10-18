/-
  Module: SystemsLean.LinearStruct
  Shape: import SystemsLean.Mult, namespace SystemsLean.LinearUseFail,
  and a structure. No theorem, example, or Bool literal.
  The file name is not stored. none on every other shape.
  The structure is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.LinearStruct

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def linearNs : String := "SystemsLean.LinearUseFail"

def structOk (sc : TopScan) : Bool :=
  match sc.imps with
  | imp :: [] =>
    imp == "SystemsLean.Mult" && sc.ns == linearNs && sc.sawStruct
      && !sc.sawThm && !sc.sawEx && !sc.sawF && !sc.sawT
      && !sc.sawMain && closedNs sc
  | _ => false

/-- Mult import and a structure. The structure is not emitted. -/
def parseLinearStruct (src : String) : Option Module :=
  let sc := scanTop src
  if structOk sc then
    modOf sc.ns
      [impCmd "SystemsLean.Mult", nsCmd sc.ns, endCmd sc.ns]
  else
    none

def structToy : String :=
  "import SystemsLean.Mult\n"
  ++ "namespace SystemsLean.LinearUseFail\n"
  ++ "structure Use where\n"
  ++ "  x : Nat\n"
  ++ "end SystemsLean.LinearUseFail\n"

def structRejectToy : String :=
  "import SystemsLean.OfficialPath\n"
  ++ "namespace SystemsLean.LinearUseFail\n"
  ++ "structure Use where\n"
  ++ "  x : Nat\n"
  ++ "end SystemsLean.LinearUseFail\n"

def linearStructAccepts : Bool :=
  match parseLinearStruct structToy with
  | some m => isWellFormed m && !hasLitBool false m.commands
  | none => false

def linearStructRejectsOther : Bool :=
  match parseLinearStruct structRejectToy with
  | none => true
  | some _ => false

end SystemsLean.LinearStruct
