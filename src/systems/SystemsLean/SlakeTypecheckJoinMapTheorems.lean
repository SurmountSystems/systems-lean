/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.JoinMapTheorems.
  Short role: named driver for just slake-typecheck-joinmaptheorems.
  Ready is HostFrontLiveJoinMapTheorems parse plus HostKernel.kernelCheck
  of live JoinMapTheorems.lean, not := true, not lake build
  SystemsLean.JoinMapTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-JOIN-MAP-THEOREMS,
  SLAKE_TYPECHECK_JOIN_MAP_THEOREMS_V0, slake-typecheck-joinmaptheorems,
  slakeTypecheckJoinMapTheoremsReady,
  kernelCheckLiveJoinMapTheoremsSource,
  PARSE-LIVE-JOIN-MAP-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckJoinMapTheorems
  Checkable writer: just slake-typecheck-joinmaptheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveJoinMapTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_JOIN_MAP_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-JOIN-MAP-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.JoinMapTheorems. -/
def justRecipeSlakeTypecheckJoinMapTheorems : String :=
  "slake-typecheck-joinmaptheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveJoinMapTheoremsRel : String :=
  SystemsLean.HostFrontLiveJoinMapTheorems.liveJoinMapTheoremsRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveJoinMapTheorems.liveRel

/-- Ready names HostFrontLiveJoinMapTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckJoinMapTheoremsReady,
    kernelCheckLiveJoinMapTheoremsSource. -/
def slakeTypecheckJoinMapTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveJoinMapTheorems.hostFrontLiveJoinMapTheoremsReady

/-- Honesty: this command is not lake build of JoinMapTheorems. -/
def slakeTypecheckJoinMapTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckJoinMapTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckJoinMapTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live JoinMapTheorems.lean.
    Ready is HostFrontLiveJoinMapTheorems.hostFrontLiveJoinMapTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveJoinMapTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckJoinMapTheorems} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveJoinMapTheoremsRel}"
  unless (liveRel == "JoinMapTheorems.lean") do
    IO.eprintln "error: liveRel must be JoinMapTheorems.lean"
    return 1
  unless (!slakeTypecheckJoinMapTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckJoinMapTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveJoinMapTheorems.main args
