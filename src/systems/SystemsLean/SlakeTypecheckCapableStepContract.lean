/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableStepContract.
  Short role: named driver for just slake-typecheck-capablestepcontract.
  Ready is HostFrontLiveCapableStepContract parse plus HostKernel.kernelCheck
  of live CapableStepContract.lean, not a hardcoded true, not lake build
  SystemsLean.CapableStepContract.
  liveRel is CapableStepContract.lean.
  This wrap is CapableStepContract.lean. It is not CapableStepContractTheorems.lean.
  It is not CapableStepContractMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT,
  SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT, slake-typecheck-capablestepcontract,
  slakeTypecheckCapableStepContractReady,
  kernelCheckLiveCapableStepContractSource,
  PARSE-LIVE-CAPABLE-STEP-CONTRACT.
  Module: SystemsLean.SlakeTypecheckCapableStepContract
  Checkable writer: just slake-typecheck-capablestepcontract
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableStepContract

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT"

/-- Named just recipe. Not lake build SystemsLean.CapableStepContract. -/
def justRecipeSlakeTypecheckCapableStepContract : String :=
  "slake-typecheck-capablestepcontract"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableStepContractRel : String :=
  SystemsLean.HostFrontLiveCapableStepContract.liveCapableStepContractRel

/-- Ready names HostFrontLiveCapableStepContract parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableStepContractReady,
    kernelCheckLiveCapableStepContractSource. -/
def slakeTypecheckCapableStepContractReady : Bool :=
  SystemsLean.HostFrontLiveCapableStepContract.hostFrontLiveCapableStepContractReady

/-- Honesty: this command is not lake build of CapableStepContract. -/
def slakeTypecheckCapableStepContractDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableStepContractFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableStepContractFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableStepContractOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableStepContract.lean.
    Ready is HostFrontLiveCapableStepContract.hostFrontLiveCapableStepContractReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableStepContract.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableStepContract} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableStepContract.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableStepContractRel}"
  unless (!slakeTypecheckCapableStepContractFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableStepContractFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableStepContractOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableStepContract.main args
