/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PerformClaimedTheorems.
  Short role: named driver for just slake-typecheck-performclaimedtheorems.
  Ready is HostFrontLivePerformClaimedTheorems parse plus HostKernel.kernelCheck
  of live PerformClaimedTheorems.lean, not := true, not lake build
  SystemsLean.PerformClaimedTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  SlakeTypecheckPerformClaimedTheorems
  HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED-THEOREMS
  SLAKE_TYPECHECK_PERFORM_CLAIMED_THEOREMS_V0
  slake-typecheck-performclaimedtheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckPerformClaimedTheoremsReady,
  kernelCheckLivePerformClaimedTheoremsSource,
  PARSE-LIVE-PERFORM-CLAIMED-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckPerformClaimedTheorems
  Checkable writer: just slake-typecheck-performclaimedtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePerformClaimedTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PERFORM_CLAIMED_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.PerformClaimedTheorems. -/
def justRecipeSlakeTypecheckPerformClaimedTheorems : String :=
  "slake-typecheck-performclaimedtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformClaimedTheoremsRel : String :=
  SystemsLean.HostFrontLivePerformClaimedTheorems.livePerformClaimedTheoremsRel

/-- Ready names HostFrontLivePerformClaimedTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckPerformClaimedTheoremsReady,
    kernelCheckLivePerformClaimedTheoremsSource. -/
def slakeTypecheckPerformClaimedTheoremsReady : Bool :=
  SystemsLean.HostFrontLivePerformClaimedTheorems.hostFrontLivePerformClaimedTheoremsReady

/-- Honesty: this command is not lake build of PerformClaimedTheorems. -/
def slakeTypecheckPerformClaimedTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformClaimedTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformClaimedTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PerformClaimedTheorems.lean.
    Ready is HostFrontLivePerformClaimedTheorems.hostFrontLivePerformClaimedTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLivePerformClaimedTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformClaimedTheorems} =="
  IO.println s!"  host={hostId} file={livePerformClaimedTheoremsRel}"
  unless (!slakeTypecheckPerformClaimedTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformClaimedTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePerformClaimedTheorems.main args
