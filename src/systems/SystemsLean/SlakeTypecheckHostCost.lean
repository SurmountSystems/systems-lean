/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCost.
  Short role: named driver for just slake-typecheck-hostcost.
  Ready is HostFrontLiveHostCost parse plus HostKernel.kernelCheck
  of live HostCost.lean, not := true, not lake build
  SystemsLean.HostCost.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostCost is not a prefix):
  SlakeTypecheckHostCost
  HOST-SLAKE-TYPECHECK-HOST-COST
  SLAKE_TYPECHECK_HOST_COST_V0
  PARSE-LIVE-HOST-COST
  slake-typecheck-hostcost
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostcost,
  slakeTypecheckHostCostReady,
  kernelCheckLiveHostCostSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostCost
  Checkable writer: just slake-typecheck-hostcost
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostCost

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_COST_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-COST"

/-- Named just recipe. Not lake build SystemsLean.HostCost. -/
def justRecipeSlakeTypecheckHostCost : String :=
  "slake-typecheck-hostcost"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostCostRel : String :=
  SystemsLean.HostFrontLiveHostCost.liveHostCostRel

/-- Ready names HostFrontLiveHostCost parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostCostReady,
    kernelCheckLiveHostCostSource. -/
def slakeTypecheckHostCostReady : Bool :=
  SystemsLean.HostFrontLiveHostCost.hostFrontLiveHostCostReady

/-- Honesty: this command is not lake build of HostCost. -/
def slakeTypecheckHostCostDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostCostFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostCostOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCost.lean.
    Ready is HostFrontLiveHostCost.hostFrontLiveHostCostReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostCost.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostCost} =="
  IO.println s!"  host={hostId} file={liveHostCostRel}"
  unless (!slakeTypecheckHostCostFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostCostOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostCost.main args
