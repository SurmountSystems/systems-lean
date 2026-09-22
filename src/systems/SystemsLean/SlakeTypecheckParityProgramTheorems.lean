/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityProgramTheorems.
  Short role: named driver for just slake-typecheck-parityprogramtheorems.
  Ready is HostFrontLiveParityProgramTheorems parse plus HostKernel.kernelCheck
  of live ParityProgramTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.ParityProgramTheorems.
  liveRel is ParityProgramTheorems.lean.
  This wrap is ParityProgramTheorems.lean. It is not ParityProgram.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-PROGRAM-THEOREMS,
  SLAKE_TYPECHECK_PARITY_PROGRAM_THEOREMS, slake-typecheck-parityprogramtheorems,
  slakeTypecheckParityProgramTheoremsReady,
  kernelCheckLiveParityProgramTheoremsSource,
  PARSE-LIVE-PARITY-PROGRAM-THEOREMS.
  Module: SystemsLean.SlakeTypecheckParityProgramTheorems
  Checkable writer: just slake-typecheck-parityprogramtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityProgramTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_PROGRAM_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-PROGRAM-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ParityProgramTheorems. -/
def justRecipeSlakeTypecheckParityProgramTheorems : String :=
  "slake-typecheck-parityprogramtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityProgramTheoremsRel : String :=
  SystemsLean.HostFrontLiveParityProgramTheorems.liveParityProgramTheoremsRel

/-- Ready names HostFrontLiveParityProgramTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityProgramTheoremsReady,
    kernelCheckLiveParityProgramTheoremsSource. -/
def slakeTypecheckParityProgramTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveParityProgramTheorems.hostFrontLiveParityProgramTheoremsReady

/-- Honesty: this command is not lake build of ParityProgramTheorems. -/
def slakeTypecheckParityProgramTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityProgramTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityProgramTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityProgramTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityProgramTheorems.lean.
    Ready is HostFrontLiveParityProgramTheorems.hostFrontLiveParityProgramTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityProgramTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityProgramTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityProgramTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveParityProgramTheoremsRel}"
  unless (!slakeTypecheckParityProgramTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityProgramTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityProgramTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityProgramTheorems.main args
