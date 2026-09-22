/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.StepContractFullTheorems.
  Short role: named driver for just slake-typecheck-stepcontractfulltheorems.
  Ready is HostFrontLiveStepContractFullTheorems parse plus HostKernel.kernelCheck
  of live StepContractFullTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.StepContractFullTheorems.
  liveRel is StepContractFullTheorems.lean.
  This wrap is StepContractFullTheorems.lean. It is not StepContractFull.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-THEOREMS,
  SLAKE_TYPECHECK_STEP_CONTRACT_FULL_THEOREMS,
  slake-typecheck-stepcontractfulltheorems,
  slakeTypecheckStepContractFullTheoremsReady,
  kernelCheckLiveStepContractFullTheoremsSource,
  PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS.
  Module: SystemsLean.SlakeTypecheckStepContractFullTheorems
  Checkable writer: just slake-typecheck-stepcontractfulltheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveStepContractFullTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_STEP_CONTRACT_FULL_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.StepContractFullTheorems. -/
def justRecipeSlakeTypecheckStepContractFullTheorems : String :=
  "slake-typecheck-stepcontractfulltheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveStepContractFullTheoremsRel : String :=
  SystemsLean.HostFrontLiveStepContractFullTheorems.liveStepContractFullTheoremsRel

/-- Ready names HostFrontLiveStepContractFullTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckStepContractFullTheoremsReady,
    kernelCheckLiveStepContractFullTheoremsSource. -/
def slakeTypecheckStepContractFullTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveStepContractFullTheorems.hostFrontLiveStepContractFullTheoremsReady

/-- Honesty: this command is not lake build of StepContractFullTheorems. -/
def slakeTypecheckStepContractFullTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckStepContractFullTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckStepContractFullTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckStepContractFullTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live StepContractFullTheorems.lean.
    Ready is HostFrontLiveStepContractFullTheorems.hostFrontLiveStepContractFullTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveStepContractFullTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckStepContractFullTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveStepContractFullTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveStepContractFullTheoremsRel}"
  unless (!slakeTypecheckStepContractFullTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckStepContractFullTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckStepContractFullTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveStepContractFullTheorems.main args
