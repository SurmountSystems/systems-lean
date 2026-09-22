/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.IrProgramTheorems.
  Short role: named driver for just slake-typecheck-irprogramtheorems.
  Ready is HostFrontLiveIrProgramTheorems parse plus HostKernel.kernelCheck of live
  IrProgramTheorems.lean, not := true, not lake build SystemsLean.IrProgramTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IR-PROGRAM-THEOREMS,
  SLAKE_TYPECHECK_IR_PROGRAM_THEOREMS_V0, slake-typecheck-irprogramtheorems,
  slakeTypecheckIrProgramTheoremsReady, kernelCheckLiveIrProgramTheoremsSource,
  PARSE-LIVE-IR-PROGRAM-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckIrProgramTheorems
  Checkable writer: just slake-typecheck-irprogramtheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveIrProgramTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IR_PROGRAM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IR-PROGRAM-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.IrProgramTheorems. -/
def justRecipeSlakeTypecheckIrProgramTheorems : String :=
  "slake-typecheck-irprogramtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrProgramTheoremsRel : String :=
  SystemsLean.HostFrontLiveIrProgramTheorems.liveIrProgramTheoremsRel

/-- Ready names HostFrontLiveIrProgramTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckIrProgramTheoremsReady,
    kernelCheckLiveIrProgramTheoremsSource. -/
def slakeTypecheckIrProgramTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveIrProgramTheorems.hostFrontLiveIrProgramTheoremsReady

/-- Honesty: this command is not lake build of IrProgramTheorems. -/
def slakeTypecheckIrProgramTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckIrProgramTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckIrProgramTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live IrProgramTheorems.lean.
    Ready is HostFrontLiveIrProgramTheorems.hostFrontLiveIrProgramTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveIrProgramTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckIrProgramTheorems} =="
  IO.println s!"  host={hostId} file={liveIrProgramTheoremsRel}"
  unless (!slakeTypecheckIrProgramTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckIrProgramTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveIrProgramTheorems.main args
