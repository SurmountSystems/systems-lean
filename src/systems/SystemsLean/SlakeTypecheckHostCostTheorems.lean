/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCostTheorems.
  Short role: named driver for just slake-typecheck-hostcosttheorems.
  Ready is HostFrontLiveHostCostTheorems parse plus HostKernel.kernelCheck
  of live HostCostTheorems.lean, not := true, not lake build
  SystemsLean.HostCostTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so HostCost drivers are not prefix hits):
  SlakeTypecheckHostCostTheorems
  HOST-SLAKE-TYPECHECK-HOST-COST-THEOREMS
  SLAKE_TYPECHECK_HOST_COST_THEOREMS_V0
  PARSE-LIVE-HOST-COST-THEOREMS
  HOST-COST-THEOREMS
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostcosttheorems,
  slakeTypecheckHostCostTheoremsReady,
  kernelCheckLiveHostCostTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostCostTheorems
  Checkable writer: just slake-typecheck-hostcosttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostCostTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_COST_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-COST-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostCostTheorems. -/
def justRecipeSlakeTypecheckHostCostTheorems : String :=
  "slake-typecheck-hostcosttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostCostTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostCostTheorems.liveHostCostTheoremsRel

/-- Ready names HostFrontLiveHostCostTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostCostTheoremsReady,
    kernelCheckLiveHostCostTheoremsSource. -/
def slakeTypecheckHostCostTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostCostTheorems.hostFrontLiveHostCostTheoremsReady

/-- Honesty: this command is not lake build of HostCostTheorems. -/
def slakeTypecheckHostCostTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostCostTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostCostTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCostTheorems.lean.
    Ready is HostFrontLiveHostCostTheorems.hostFrontLiveHostCostTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostCostTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostCostTheorems} =="
  IO.println s!"  host={hostId} file={liveHostCostTheoremsRel}"
  unless (!slakeTypecheckHostCostTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostCostTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostCostTheorems.main args
