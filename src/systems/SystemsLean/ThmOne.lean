/-
  Module: SystemsLean.ThmOne
  Shape: one import. The namespace equals that import and matches end.
  A theorem and an example. No String def, def main, or same-line Bool false.
  Held imports stay none so a rejected seed is not accepted here.
  The file name is not stored. Theorems are not emitted.
  none on every other shape.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.LiveTriple

namespace SystemsLean.ThmOne

open SystemsLean.HostTerm
open SystemsLean.LiveTriple

def heldImport (s : String) : Bool :=
  s == "SystemsLean.DualEqWriteParity"
    || s == "SystemsLean.DualEqWriteCapableGap"
    || s == "SystemsLean.DualEqWriteClosePath"
    || s == "SystemsLean.DualResidual"
    || s == "SystemsLean.Capable"
    || s == "SystemsLean.CapableRead"
    || s == "SystemsLean.CapableRegenerate"
    || s == "SystemsLean.CapableStepContract"
    || s == "SystemsLean.CapableFullBar"
    || s == "SystemsLean.CapableWriteHcLoad"
    || s == "SystemsLean.Mult"
    || s == "SystemsLean.EmitApply"
    || s == "SystemsLean.EmitApplyScaffold"

def sole (xs : List String) : String :=
  match xs with
  | a :: [] => a
  | _ => ""

def thmOk (sc : TopScan) : Bool :=
  match sc.imps with
  | imp :: [] =>
    sc.ns == imp && !heldImport imp
      && sc.sawThm && sc.sawEx
      && !sc.sawStr && !sc.sawMain && !sc.sawF
      && sc.sawEnd && sc.endNs == sc.ns && sc.ns != ""
      && sc.closed
  | _ => false

/-- One import, namespace equal to it, theorem and example. -/
def parseThmOne (src : String) : Option Module :=
  let sc := scanTop src
  if thmOk sc then
    let imp := sole sc.imps
    modOf sc.ns [impCmd imp, nsCmd sc.ns, endCmd sc.ns]
  else
    none

def thmToy : String :=
  "import SystemsLean.OfficialPath\n"
  ++ "namespace SystemsLean.OfficialPath\n"
  ++ "theorem stageId_eq : True := by trivial\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.OfficialPath\n"

def thmRejectToy : String :=
  "import SystemsLean.DualEqWriteParity\n"
  ++ "namespace SystemsLean.DualEqWriteParity\n"
  ++ "theorem pin_false : True := by trivial\n"
  ++ "example : True := by trivial\n"
  ++ "end SystemsLean.DualEqWriteParity\n"

def thmOneAccepts : Bool :=
  match parseThmOne thmToy with
  | some m => isWellFormed m && m.commands.length == 3
  | none => false

def thmOneRejectsHeld : Bool :=
  match parseThmOne thmRejectToy with
  | none => true
  | some _ => false

end SystemsLean.ThmOne
