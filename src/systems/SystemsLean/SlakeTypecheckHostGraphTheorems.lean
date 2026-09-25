/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostGraphTheorems.
  Short role: named driver for lean --run of HostGraphTheorems.lean.
  Ready is HostFrontLiveHostGraphTheorems parse plus HostKernel.kernelCheck of
  live HostGraphTheorems.lean, not := true, not lake build
  SystemsLean.HostGraphTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-GRAPH-THEOREMS,
  SLAKE_TYPECHECK_HOST_GRAPH_THEOREMS_V0, slake-typecheck-hostgraphtheorems,
  slakeTypecheckHostGraphTheoremsReady, kernelCheckLiveHostGraphTheoremsSource,
  PARSE-LIVE-HOST-GRAPH-THEOREMS.
  Module: SystemsLean.SlakeTypecheckHostGraphTheorems
  Checkable writer: lean --run SlakeTypecheckHostGraphTheorems (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostGraphTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-GRAPH-THEOREMS"

/-- Named recipe. Not lake build SystemsLean.HostGraphTheorems. -/
def justRecipeSlakeTypecheckHostGraphTheorems : String :=
  "slake-typecheck-hostgraphtheorems"

/-- Live file relative to repo root. -/
def liveHostGraphTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostGraphTheorems.liveHostGraphTheoremsRel

/-- Ready names HostFrontLiveHostGraphTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostGraphTheoremsReady,
    kernelCheckLiveHostGraphTheoremsSource. -/
def slakeTypecheckHostGraphTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostGraphTheorems.hostFrontLiveHostGraphTheoremsReady

/-- Honesty: this command is not lake build of HostGraphTheorems. -/
def slakeTypecheckHostGraphTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostGraphTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostGraphTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostGraphTheorems.lean.
    Ready is HostFrontLiveHostGraphTheorems.hostFrontLiveHostGraphTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostGraphTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostGraphTheorems} =="
  IO.println s!"  host={hostId} file={liveHostGraphTheoremsRel}"
  unless (!slakeTypecheckHostGraphTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostGraphTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostGraphTheorems.main args
