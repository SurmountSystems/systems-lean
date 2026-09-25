/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SubsetFrontMain.
  Short role: named driver for just slake-typecheck-subsetfrontmain.
  Ready is HostFrontLiveSubsetFrontMainSource parse plus HostKernel.kernelCheck
  of live SubsetFrontMain.lean, not a hardcoded true, not lake build
  SystemsLean.SubsetFrontMain.
  liveRel is SubsetFrontMain.lean.
  This wrap is SubsetFrontMain.lean. It is not SubsetFront.lean.
  The checker accepts the Main source. The forwarder only calls the neighbor.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SUBSET-FRONT-MAIN,
  SLAKE_TYPECHECK_SUBSET_FRONT_MAIN_V0,
  slake-typecheck-subsetfrontmain,
  slakeTypecheckSubsetFrontMainReady,
  kernelCheckLiveSubsetFrontMainSource,
  PARSE-LIVE-SUBSET-FRONT-MAIN.
  Module: SystemsLean.SlakeTypecheckSubsetFrontMain
  Checkable writer: just slake-typecheck-subsetfrontmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSubsetFrontMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SUBSET_FRONT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SUBSET-FRONT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.SubsetFrontMain. -/
def justRecipeSlakeTypecheckSubsetFrontMain : String :=
  "slake-typecheck-subsetfrontmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveSubsetFrontMainRel : String :=
  SystemsLean.HostFrontLiveSubsetFrontMainSource.liveRel

/-- Ready names HostFrontLiveSubsetFrontMainSource parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSubsetFrontMainReady,
    kernelCheckLiveSubsetFrontMainSource. -/
def slakeTypecheckSubsetFrontMainReady : Bool :=
  SystemsLean.HostFrontLiveSubsetFrontMainSource.hostFrontLiveSubsetFrontMainReady

/-- Honesty: this command is not lake build of SubsetFrontMain. -/
def slakeTypecheckSubsetFrontMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSubsetFrontMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSubsetFrontMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SubsetFrontMain.lean.
    Ready is HostFrontLiveSubsetFrontMainSource.hostFrontLiveSubsetFrontMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSubsetFrontMainSource.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSubsetFrontMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSubsetFrontMainSource.liveRel}"
  IO.println s!"  host={hostId} file={liveSubsetFrontMainRel}"
  unless (!slakeTypecheckSubsetFrontMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSubsetFrontMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSubsetFrontMainSource.main args
