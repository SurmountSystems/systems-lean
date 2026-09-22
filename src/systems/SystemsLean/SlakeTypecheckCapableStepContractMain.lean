/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableStepContractMain.
  Short role: named driver for just slake-typecheck-capablestepcontractmain.
  Ready is HostFrontLiveCapableStepContractMain parse plus HostKernel.kernelCheck
  of live CapableStepContractMain.lean, not := true, not lake build
  SystemsLean.CapableStepContractMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableStepContractMain is not a prefix):
  SlakeTypecheckCapableStepContractMain
  HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT-MAIN
  SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT_MAIN_V0
  slake-typecheck-capablestepcontractmain
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-MAIN
  CAPABLE-STEP-CONTRACT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablestepcontractmain,
  slakeTypecheckCapableStepContractMainReady,
  kernelCheckLiveCapableStepContractMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableStepContractMain
  Checkable writer: just slake-typecheck-capablestepcontractmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableStepContractMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_STEP_CONTRACT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-STEP-CONTRACT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableStepContractMain. -/
def justRecipeSlakeTypecheckCapableStepContractMain : String :=
  "slake-typecheck-capablestepcontractmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableStepContractMainRel : String :=
  SystemsLean.HostFrontLiveCapableStepContractMain.liveCapableStepContractMainRel

/-- Ready names HostFrontLiveCapableStepContractMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableStepContractMainReady,
    kernelCheckLiveCapableStepContractMainSource. -/
def slakeTypecheckCapableStepContractMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableStepContractMain.hostFrontLiveCapableStepContractMainReady

/-- Honesty: this command is not lake build of CapableStepContractMain. -/
def slakeTypecheckCapableStepContractMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableStepContractMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableStepContractMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableStepContractMain.lean.
    Ready is HostFrontLiveCapableStepContractMain.hostFrontLiveCapableStepContractMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableStepContractMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableStepContractMain} =="
  IO.println s!"  host={hostId} file={liveCapableStepContractMainRel}"
  unless (!slakeTypecheckCapableStepContractMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableStepContractMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableStepContractMain.main args
