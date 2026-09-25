/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PerformClaimed.
  Short role: named driver for just slake-typecheck-performclaimed.
  Ready is HostFrontLivePerformClaimed parse plus HostKernel.kernelCheck
  of live PerformClaimed.lean, not := true, not lake build
  SystemsLean.PerformClaimed.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckPerformClaimed is not a prefix):
  SlakeTypecheckPerformClaimed
  HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED
  SLAKE_TYPECHECK_PERFORM_CLAIMED_V0
  PARSE-LIVE-PERFORM-CLAIMED
  slake-typecheck-performclaimed
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-performclaimed,
  slakeTypecheckPerformClaimedReady,
  kernelCheckLivePerformClaimedSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckPerformClaimed
  Checkable writer: just slake-typecheck-performclaimed
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLivePerformClaimed

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PERFORM_CLAIMED_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED"

/-- Named just recipe. Not lake build SystemsLean.PerformClaimed. -/
def justRecipeSlakeTypecheckPerformClaimed : String :=
  "slake-typecheck-performclaimed"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformClaimedRel : String :=
  SystemsLean.HostFrontLivePerformClaimed.livePerformClaimedRel

/-- Ready names HostFrontLivePerformClaimed parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckPerformClaimedReady,
    kernelCheckLivePerformClaimedSource. -/
def slakeTypecheckPerformClaimedReady : Bool :=
  SystemsLean.HostFrontLivePerformClaimed.hostFrontLivePerformClaimedReady

/-- Honesty: this command is not lake build of PerformClaimed. -/
def slakeTypecheckPerformClaimedDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformClaimedFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformClaimedOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PerformClaimed.lean.
    Ready is HostFrontLivePerformClaimed.hostFrontLivePerformClaimedReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLivePerformClaimed.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformClaimed} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLivePerformClaimed.liveRel}"
  IO.println s!"  host={hostId} file={livePerformClaimedRel}"
  unless (!slakeTypecheckPerformClaimedFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformClaimedOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePerformClaimed.main args
