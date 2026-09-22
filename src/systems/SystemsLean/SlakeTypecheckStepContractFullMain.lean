/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.StepContractFullMain.
  Short role: named driver for just slake-typecheck-stepcontractfullmain.
  Ready is HostFrontLiveStepContractFullMain parse plus HostKernel.kernelCheck
  of live StepContractFullMain.lean, not := true, not lake build
  SystemsLean.StepContractFullMain.
  Not mill 20 remill (just twentieth-host-tool / inventory row 24).
  Not occupancy name 50. Not FullHost.
  This wrap parses StepContractFullMain.lean only. Do not wrap StepContractFull.lean.
  Short name is free because HostFrontLiveStepContractFull (library wrap) does not exist.
  Do not mint HostFrontLiveHostStepContractFullMain.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckStepContractFullMain is not a prefix):
  SlakeTypecheckStepContractFullMain
  HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-MAIN
  SLAKE_TYPECHECK_STEP_CONTRACT_FULL_MAIN_V0
  slake-typecheck-stepcontractfullmain
  PARSE-LIVE-STEP-CONTRACT-FULL-MAIN
  STEP-CONTRACT-FULL-MAIN
  HOST-STEP-CONTRACT-FULL-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-stepcontractfullmain,
  slakeTypecheckStepContractFullMainReady,
  kernelCheckLiveStepContractFullMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckStepContractFullMain
  Checkable writer: just slake-typecheck-stepcontractfullmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveStepContractFullMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_STEP_CONTRACT_FULL_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-MAIN"

/-- Named just recipe. Not lake build SystemsLean.StepContractFullMain. -/
def justRecipeSlakeTypecheckStepContractFullMain : String :=
  "slake-typecheck-stepcontractfullmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveStepContractFullMainRel : String :=
  SystemsLean.HostFrontLiveStepContractFullMain.liveStepContractFullMainRel

/-- Ready names HostFrontLiveStepContractFullMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckStepContractFullMainReady,
    kernelCheckLiveStepContractFullMainSource. -/
def slakeTypecheckStepContractFullMainReady : Bool :=
  SystemsLean.HostFrontLiveStepContractFullMain.hostFrontLiveStepContractFullMainReady

/-- Honesty: this command is not lake build of StepContractFullMain. -/
def slakeTypecheckStepContractFullMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckStepContractFullMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckStepContractFullMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live StepContractFullMain.lean.
    Ready is HostFrontLiveStepContractFullMain.hostFrontLiveStepContractFullMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveStepContractFullMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckStepContractFullMain} =="
  IO.println s!"  host={hostId} file={liveStepContractFullMainRel}"
  unless (!slakeTypecheckStepContractFullMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckStepContractFullMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveStepContractFullMain.main args
