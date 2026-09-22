/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OwnershipClaimedMain.
  Short role: named driver for just slake-typecheck-ownershipclaimedmain.
  Ready is HostFrontLiveHostOwnershipClaimedMain parse plus HostKernel.kernelCheck
  of live OwnershipClaimedMain.lean, not := true, not lake build
  SystemsLean.OwnershipClaimedMain.
  Not mill 19 remill (just nineteenth-host-tool). Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckOwnershipClaimed is not a prefix):
  SlakeTypecheckOwnershipClaimedMain
  HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED-MAIN
  SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_MAIN_V0
  slake-typecheck-ownershipclaimedmain
  PARSE-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN
  OWNERSHIP-CLAIMED-MAIN
  HOST-OWNERSHIP-CLAIMED-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-ownershipclaimedmain,
  slakeTypecheckOwnershipClaimedMainReady,
  kernelCheckLiveHostOwnershipClaimedMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOwnershipClaimedMain
  Checkable writer: just slake-typecheck-ownershipclaimedmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostOwnershipClaimedMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED-MAIN"

/-- Named just recipe. Not lake build SystemsLean.OwnershipClaimedMain. -/
def justRecipeSlakeTypecheckOwnershipClaimedMain : String :=
  "slake-typecheck-ownershipclaimedmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostOwnershipClaimedMainRel : String :=
  SystemsLean.HostFrontLiveHostOwnershipClaimedMain.liveHostOwnershipClaimedMainRel

/-- Ready names HostFrontLiveHostOwnershipClaimedMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOwnershipClaimedMainReady,
    kernelCheckLiveHostOwnershipClaimedMainSource. -/
def slakeTypecheckOwnershipClaimedMainReady : Bool :=
  SystemsLean.HostFrontLiveHostOwnershipClaimedMain.hostFrontLiveHostOwnershipClaimedMainReady

/-- Honesty: this command is not lake build of OwnershipClaimedMain. -/
def slakeTypecheckOwnershipClaimedMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOwnershipClaimedMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOwnershipClaimedMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OwnershipClaimedMain.lean.
    Ready is HostFrontLiveHostOwnershipClaimedMain.hostFrontLiveHostOwnershipClaimedMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostOwnershipClaimedMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOwnershipClaimedMain} =="
  IO.println s!"  host={hostId} file={liveHostOwnershipClaimedMainRel}"
  unless (!slakeTypecheckOwnershipClaimedMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOwnershipClaimedMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostOwnershipClaimedMain.main args
