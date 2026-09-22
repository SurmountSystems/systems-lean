/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityProgram.
  Short role: named driver for just slake-typecheck-parityprogram.
  Ready is HostFrontLiveParityProgram parse plus HostKernel.kernelCheck
  of live ParityProgram.lean, not a hardcoded true, not lake build
  SystemsLean.ParityProgram.
  liveRel is ParityProgram.lean.
  This wrap is ParityProgram.lean. It is not ParityProgramTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-PROGRAM,
  SLAKE_TYPECHECK_PARITY_PROGRAM, slake-typecheck-parityprogram,
  slakeTypecheckParityProgramReady,
  kernelCheckLiveParityProgramSource,
  PARSE-LIVE-PARITY-PROGRAM.
  Module: SystemsLean.SlakeTypecheckParityProgram
  Checkable writer: just slake-typecheck-parityprogram
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityProgram

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_PROGRAM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-PROGRAM"

/-- Named just recipe. Not lake build SystemsLean.ParityProgram. -/
def justRecipeSlakeTypecheckParityProgram : String :=
  "slake-typecheck-parityprogram"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityProgramRel : String :=
  SystemsLean.HostFrontLiveParityProgram.liveParityProgramRel

/-- Ready names HostFrontLiveParityProgram parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityProgramReady,
    kernelCheckLiveParityProgramSource. -/
def slakeTypecheckParityProgramReady : Bool :=
  SystemsLean.HostFrontLiveParityProgram.hostFrontLiveParityProgramReady

/-- Honesty: this command is not lake build of ParityProgram. -/
def slakeTypecheckParityProgramDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityProgramFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityProgramFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityProgramOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityProgram.lean.
    Ready is HostFrontLiveParityProgram.hostFrontLiveParityProgramReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityProgram.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityProgram} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityProgram.liveRel}"
  IO.println s!"  host={hostId} file={liveParityProgramRel}"
  unless (!slakeTypecheckParityProgramFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityProgramFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityProgramOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityProgram.main args
