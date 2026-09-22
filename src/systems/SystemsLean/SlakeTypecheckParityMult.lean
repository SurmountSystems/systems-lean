/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityMult.
  Short role: named driver for just slake-typecheck-paritymult.
  Ready is HostFrontLiveParityMult parse plus HostKernel.kernelCheck
  of live ParityMult.lean, not a hardcoded true, not lake build
  SystemsLean.ParityMult.
  liveRel is ParityMult.lean.
  This wrap is ParityMult.lean. It is not ParityMultTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-MULT,
  SLAKE_TYPECHECK_PARITY_MULT, slake-typecheck-paritymult,
  slakeTypecheckParityMultReady,
  kernelCheckLiveParityMultSource,
  PARSE-LIVE-PARITY-MULT.
  Module: SystemsLean.SlakeTypecheckParityMult
  Checkable writer: just slake-typecheck-paritymult
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityMult

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_MULT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-MULT"

/-- Named just recipe. Not lake build SystemsLean.ParityMult. -/
def justRecipeSlakeTypecheckParityMult : String :=
  "slake-typecheck-paritymult"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityMultRel : String :=
  SystemsLean.HostFrontLiveParityMult.liveParityMultRel

/-- Ready names HostFrontLiveParityMult parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityMultReady,
    kernelCheckLiveParityMultSource. -/
def slakeTypecheckParityMultReady : Bool :=
  SystemsLean.HostFrontLiveParityMult.hostFrontLiveParityMultReady

/-- Honesty: this command is not lake build of ParityMult. -/
def slakeTypecheckParityMultDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityMultFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityMultFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityMultOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityMult.lean.
    Ready is HostFrontLiveParityMult.hostFrontLiveParityMultReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityMult.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityMult} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityMult.liveRel}"
  IO.println s!"  host={hostId} file={liveParityMultRel}"
  unless (!slakeTypecheckParityMultFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityMultFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityMultOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityMult.main args
