/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostComplete.
  Short role: named driver for just slake-typecheck-selfhostcomplete.
  Ready is HostFrontLiveSelfHostComplete parse plus HostKernel.kernelCheck
  of live SelfHostComplete.lean, not := true, not lake build
  SystemsLean.SelfHostComplete.
  Not mill 69 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SelfHostComplete drivers are not prefix hits):
  SlakeTypecheckSelfHostComplete
  HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE
  SLAKE_TYPECHECK_SELF_HOST_COMPLETE_V0
  PARSE-LIVE-SELF-HOST-COMPLETE
  SELF-HOST-COMPLETE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-selfhostcomplete,
  slakeTypecheckSelfHostCompleteReady,
  kernelCheckLiveSelfHostCompleteSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfHostComplete
  Checkable writer: just slake-typecheck-selfhostcomplete
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfHostComplete

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_COMPLETE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-COMPLETE"

/-- Named just recipe. Not lake build SystemsLean.SelfHostComplete. -/
def justRecipeSlakeTypecheckSelfHostComplete : String :=
  "slake-typecheck-selfhostcomplete"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostCompleteRel : String :=
  SystemsLean.HostFrontLiveSelfHostComplete.liveSelfHostCompleteRel

/-- Ready names HostFrontLiveSelfHostComplete parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfHostCompleteReady,
    kernelCheckLiveSelfHostCompleteSource. -/
def slakeTypecheckSelfHostCompleteReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostComplete.hostFrontLiveSelfHostCompleteReady

/-- Honesty: this command is not lake build of SelfHostComplete. -/
def slakeTypecheckSelfHostCompleteDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostCompleteFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostCompleteOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostComplete.lean.
    Ready is HostFrontLiveSelfHostComplete.hostFrontLiveSelfHostCompleteReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfHostComplete.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostComplete} =="
  IO.println s!"  host={hostId} file={liveSelfHostCompleteRel}"
  unless (!slakeTypecheckSelfHostCompleteFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostCompleteOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostComplete.main args
