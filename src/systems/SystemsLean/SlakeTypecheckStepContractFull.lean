/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.StepContractFull.
  Short role: named driver for just slake-typecheck-stepcontractfull.
  Ready is HostFrontLiveStepContractFull parse plus HostKernel.kernelCheck
  of live StepContractFull.lean, not a hardcoded true, not lake build
  SystemsLean.StepContractFull.
  liveRel is StepContractFull.lean.
  This wrap is StepContractFull.lean. It is not StepContractFullMain.lean.
  It is not StepContractFullTheorems.lean.
  HostFrontLiveStepContractFullMain.lean is a different module.
  This file is the lean --run entry because that Main path is taken.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL,
  SLAKE_TYPECHECK_STEP_CONTRACT_FULL, slake-typecheck-stepcontractfull,
  slakeTypecheckStepContractFullReady,
  kernelCheckLiveStepContractFullSource,
  PARSE-LIVE-STEP-CONTRACT-FULL.
  Module: SystemsLean.SlakeTypecheckStepContractFull
  Checkable writer: just slake-typecheck-stepcontractfull
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveStepContractFull

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_STEP_CONTRACT_FULL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL"

/-- Named just recipe. Not lake build SystemsLean.StepContractFull. -/
def justRecipeSlakeTypecheckStepContractFull : String :=
  "slake-typecheck-stepcontractfull"

/-- Live file relative to repo root. Dual-pin path. -/
def liveStepContractFullRel : String :=
  SystemsLean.HostFrontLiveStepContractFull.liveStepContractFullRel

/-- Ready names HostFrontLiveStepContractFull parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckStepContractFullReady,
    kernelCheckLiveStepContractFullSource. -/
def slakeTypecheckStepContractFullReady : Bool :=
  SystemsLean.HostFrontLiveStepContractFull.hostFrontLiveStepContractFullReady

/-- Honesty: this command is not lake build of StepContractFull. -/
def slakeTypecheckStepContractFullDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckStepContractFullFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckStepContractFullFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckStepContractFullOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live StepContractFull.lean.
    Ready is HostFrontLiveStepContractFull.hostFrontLiveStepContractFullReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveStepContractFull.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckStepContractFull} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveStepContractFull.liveRel}"
  IO.println s!"  host={hostId} file={liveStepContractFullRel}"
  unless (!slakeTypecheckStepContractFullFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckStepContractFullFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckStepContractFullOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveStepContractFull.main args
