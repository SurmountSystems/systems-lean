/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OwnershipClaimed.
  Short role: named driver for just slake-typecheck-ownershipclaimed.
  Ready is HostFrontLiveOwnershipClaimed parse plus HostKernel.kernelCheck
  of live OwnershipClaimed.lean, not := true, not lake build
  SystemsLean.OwnershipClaimed.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so OwnershipClaimed drivers are not prefix hits):
  SlakeTypecheckOwnershipClaimed
  HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED
  SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_V0
  PARSE-LIVE-OWNERSHIP-CLAIMED
  OWNERSHIP-CLAIMED
  slake-typecheck-ownershipclaimed
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-ownershipclaimed,
  slakeTypecheckOwnershipClaimedReady,
  kernelCheckLiveOwnershipClaimedSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOwnershipClaimed
  Checkable writer: just slake-typecheck-ownershipclaimed
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveOwnershipClaimed

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED"

/-- Named just recipe. Not lake build SystemsLean.OwnershipClaimed. -/
def justRecipeSlakeTypecheckOwnershipClaimed : String :=
  "slake-typecheck-ownershipclaimed"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOwnershipClaimedRel : String :=
  SystemsLean.HostFrontLiveOwnershipClaimed.liveOwnershipClaimedRel

/-- Ready names HostFrontLiveOwnershipClaimed parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOwnershipClaimedReady,
    kernelCheckLiveOwnershipClaimedSource. -/
def slakeTypecheckOwnershipClaimedReady : Bool :=
  SystemsLean.HostFrontLiveOwnershipClaimed.hostFrontLiveOwnershipClaimedReady

/-- Honesty: this command is not lake build of OwnershipClaimed. -/
def slakeTypecheckOwnershipClaimedDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOwnershipClaimedFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOwnershipClaimedOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OwnershipClaimed.lean.
    Ready is HostFrontLiveOwnershipClaimed.hostFrontLiveOwnershipClaimedReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOwnershipClaimed.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOwnershipClaimed} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOwnershipClaimed.liveRel}"
  IO.println s!"  host={hostId} file={liveOwnershipClaimedRel}"
  unless (!slakeTypecheckOwnershipClaimedFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOwnershipClaimedOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOwnershipClaimed.main args
