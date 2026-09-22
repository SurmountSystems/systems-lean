/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostGraphTheorems.
  Short role: named driver for just slake-typecheck-graphtheorems.
  Ready is HostFrontLiveGraphTheorems parse plus HostKernel.kernelCheck of live
  HostGraphTheorems.lean, not := true, not lake build SystemsLean.HostGraphTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GRAPH-THEOREMS,
  SLAKE_TYPECHECK_GRAPH_THEOREMS_V0, slake-typecheck-graphtheorems,
  slakeTypecheckGraphTheoremsReady, kernelCheckLiveGraphTheoremsSource,
  PARSE-LIVE-GRAPH-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckGraphTheorems
  Checkable writer: just slake-typecheck-graphtheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveGraphTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostGraphTheorems. -/
def justRecipeSlakeTypecheckGraphTheorems : String :=
  "slake-typecheck-graphtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphTheoremsRel : String :=
  SystemsLean.HostFrontLiveGraphTheorems.liveGraphTheoremsRel

/-- Ready names HostFrontLiveGraphTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckGraphTheoremsReady,
    kernelCheckLiveGraphTheoremsSource. -/
def slakeTypecheckGraphTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveGraphTheorems.hostFrontLiveGraphTheoremsReady

/-- Honesty: this command is not lake build of HostGraphTheorems. -/
def slakeTypecheckGraphTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostGraphTheorems.lean.
    Ready is hostFrontLiveGraphTheoremsReady (parse plus HostKernel.kernelCheck),
    not := true. Evaluated inside HostFrontLiveGraphTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphTheorems} =="
  IO.println s!"  host={hostId} file={liveGraphTheoremsRel}"
  unless (!slakeTypecheckGraphTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraphTheorems.main args
