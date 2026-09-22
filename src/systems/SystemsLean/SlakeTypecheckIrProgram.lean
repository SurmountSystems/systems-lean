/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.IrProgram.
  Short role: named driver for just slake-typecheck-irprogram.
  Ready is HostFrontLiveIrProgram parse plus HostKernel.kernelCheck of live
  IrProgram.lean, not := true, not lake build SystemsLean.IrProgram.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IRPROGRAM,
  SLAKE_TYPECHECK_IRPROGRAM_V0, slake-typecheck-irprogram, slakeTypecheckIrProgramReady,
  kernelCheckLiveIrProgramSource, PARSE-LIVE-IR-PROGRAM, SKELETON.
  Module: SystemsLean.SlakeTypecheckIrProgram
  Checkable writer: just slake-typecheck-irprogram (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveIrProgram

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IRPROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IRPROGRAM"

/-- Named just recipe. Not lake build SystemsLean.IrProgram. -/
def justRecipeSlakeTypecheckIrProgram : String := "slake-typecheck-irprogram"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrProgramRel : String := SystemsLean.HostFrontLiveIrProgram.liveIrProgramRel

/-- Ready names HostFrontLiveIrProgram parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckIrProgramReady, kernelCheckLiveIrProgramSource. -/
def slakeTypecheckIrProgramReady : Bool :=
  SystemsLean.HostFrontLiveIrProgram.hostFrontLiveIrProgramReady

/-- Honesty: this command is not lake build of IrProgram. -/
def slakeTypecheckIrProgramDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckIrProgramFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckIrProgramOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live IrProgram.lean.
    Ready is HostFrontLiveIrProgram.hostFrontLiveIrProgramReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveIrProgram.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckIrProgram} =="
  IO.println s!"  host={hostId} file={liveIrProgramRel}"
  unless (!slakeTypecheckIrProgramFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckIrProgramOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveIrProgram.main args

