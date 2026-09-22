/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OwnershipClaimedTheorems.
  Short role: named driver for just slake-typecheck-ownershipclaimedtheorems.
  Ready is HostFrontLiveOwnershipClaimedTheorems parse plus HostKernel.kernelCheck
  of live OwnershipClaimedTheorems.lean, not := true, not lake build
  SystemsLean.OwnershipClaimedTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so HostFrontLiveOwnershipClaimed is not a prefix):
  SlakeTypecheckOwnershipClaimedTheorems
  HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED-THEOREMS
  SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_THEOREMS_V0
  PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS
  OWNERSHIP-CLAIMED-THEOREMS
  liveRel
  OwnershipClaimedTheorems.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-ownershipclaimedtheorems,
  slakeTypecheckOwnershipClaimedTheoremsReady,
  kernelCheckLiveOwnershipClaimedTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOwnershipClaimedTheorems
  Checkable writer: just slake-typecheck-ownershipclaimedtheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveOwnershipClaimedTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.OwnershipClaimedTheorems. -/
def justRecipeSlakeTypecheckOwnershipClaimedTheorems : String :=
  "slake-typecheck-ownershipclaimedtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOwnershipClaimedTheoremsRel : String :=
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems.liveOwnershipClaimedTheoremsRel

/-- Live basename. Greppable: liveRel. Must be OwnershipClaimedTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems.liveRel

/-- Ready names HostFrontLiveOwnershipClaimedTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOwnershipClaimedTheoremsReady,
    kernelCheckLiveOwnershipClaimedTheoremsSource. -/
def slakeTypecheckOwnershipClaimedTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems.hostFrontLiveOwnershipClaimedTheoremsReady

/-- Honesty: this command is not lake build of OwnershipClaimedTheorems. -/
def slakeTypecheckOwnershipClaimedTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOwnershipClaimedTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOwnershipClaimedTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OwnershipClaimedTheorems.lean.
    Ready is HostFrontLiveOwnershipClaimedTheorems.hostFrontLiveOwnershipClaimedTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOwnershipClaimedTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOwnershipClaimedTheorems} =="
  IO.println s!"  host={hostId} file={liveOwnershipClaimedTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckOwnershipClaimedTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOwnershipClaimedTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems.main args
