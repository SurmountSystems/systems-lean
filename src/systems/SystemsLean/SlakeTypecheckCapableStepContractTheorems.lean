/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.CapableStepContractTheorems.
  Short role: named driver for just slake-typecheck-capablestepcontracttheorems.
  Ready is HostFrontLiveCapableStepContractTheorems parse plus
  HostKernel.kernelCheck of live CapableStepContractTheorems.lean, not a
  hardcoded true, not lake build SystemsLean.CapableStepContractTheorems.
  liveRel is CapableStepContractTheorems.lean.
  This wrap is CapableStepContractTheorems.lean. It is not
  CapableStepContract.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT_THEOREMS,
  slake-typecheck-capablestepcontracttheorems,
  slakeTypecheckCapableStepContractTheoremsReady,
  kernelCheckLiveCapableStepContractTheoremsSource,
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableStepContractTheorems
  Checkable writer: just slake-typecheck-capablestepcontracttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableStepContractTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.CapableStepContractTheorems. -/
def justRecipeSlakeTypecheckCapableStepContractTheorems : String :=
  "slake-typecheck-capablestepcontracttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableStepContractTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableStepContractTheorems.liveCapableStepContractTheoremsRel

/-- Ready names HostFrontLiveCapableStepContractTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableStepContractTheoremsReady,
    kernelCheckLiveCapableStepContractTheoremsSource. -/
def slakeTypecheckCapableStepContractTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableStepContractTheorems.hostFrontLiveCapableStepContractTheoremsReady

/-- Honesty: this command is not lake build of CapableStepContractTheorems. -/
def slakeTypecheckCapableStepContractTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableStepContractTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableStepContractTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableStepContractTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableStepContractTheorems.lean.
    Ready is HostFrontLiveCapableStepContractTheorems.hostFrontLiveCapableStepContractTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableStepContractTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableStepContractTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableStepContractTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableStepContractTheoremsRel}"
  unless (!slakeTypecheckCapableStepContractTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableStepContractTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableStepContractTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableStepContractTheorems.main args
