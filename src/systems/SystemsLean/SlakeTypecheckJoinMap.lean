/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.JoinMap.
  Short role: named driver for just slake-typecheck-joinmap.
  Ready is HostFrontLiveJoinMap parse plus HostKernel.kernelCheck of live
  JoinMap.lean, not := true, not lake build SystemsLean.JoinMap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-JOINMAP,
  SLAKE_TYPECHECK_JOINMAP_V0, slake-typecheck-joinmap,
  slakeTypecheckJoinMapReady, kernelCheckLiveJoinMapSource,
  PARSE-LIVE-JOINMAP, SKELETON.
  Module: SystemsLean.SlakeTypecheckJoinMap
  Checkable writer: just slake-typecheck-joinmap (lean --run; no mill;
  no lake).
-/

import SystemsLean.HostFrontLiveJoinMap

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_JOINMAP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-JOINMAP"

/-- Named just recipe. Not lake build SystemsLean.JoinMap. -/
def justRecipeSlakeTypecheckJoinMap : String :=
  "slake-typecheck-joinmap"

/-- Live file relative to repo root. Dual-pin path. -/
def liveJoinMapRel : String :=
  SystemsLean.HostFrontLiveJoinMap.liveJoinMapRel

/-- Ready names HostFrontLiveJoinMap parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckJoinMapReady,
    kernelCheckLiveJoinMapSource. -/
def slakeTypecheckJoinMapReady : Bool :=
  SystemsLean.HostFrontLiveJoinMap.hostFrontLiveJoinMapReady

/-- Honesty: this command is not lake build of JoinMap. -/
def slakeTypecheckJoinMapDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckJoinMapFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckJoinMapOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live JoinMap.lean.
    Ready is HostFrontLiveJoinMap.hostFrontLiveJoinMapReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveJoinMap.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckJoinMap} =="
  IO.println s!"  host={hostId} file={liveJoinMapRel}"
  unless (!slakeTypecheckJoinMapFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckJoinMapOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveJoinMap.main args
