/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PerformClaimedMain.
  Short role: named driver for just slake-typecheck-performclaimedmain.
  Ready is HostFrontLiveHostPerformClaimedMain parse plus HostKernel.kernelCheck
  of live PerformClaimedMain.lean, not := true, not lake build
  SystemsLean.PerformClaimedMain.
  Not mill 18 remill (just eighteenth-host-tool / inventory row 22).
  Not occupancy name 50. Not FullHost.
  This wrap parses PerformClaimedMain.lean only. Do not wrap PerformClaimed.lean.
  Do not steal HostFrontLivePerformClaimedMain (library companion).
  Do not wrap OfficialPathMain. Do not wrap OfficialRetireMain.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckPerformClaimedMain is not a prefix):
  SlakeTypecheckPerformClaimedMain
  HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED-MAIN
  SLAKE_TYPECHECK_PERFORM_CLAIMED_MAIN_V0
  slake-typecheck-performclaimedmain
  PARSE-LIVE-PERFORM-CLAIMED-MAIN
  PERFORM-CLAIMED-MAIN
  HOST-PERFORM-CLAIMED-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-performclaimedmain,
  slakeTypecheckPerformClaimedMainReady,
  kernelCheckLivePerformClaimedMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckPerformClaimedMain
  Checkable writer: just slake-typecheck-performclaimedmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostPerformClaimedMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PERFORM_CLAIMED_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PERFORM-CLAIMED-MAIN"

/-- Named just recipe. Not lake build SystemsLean.PerformClaimedMain. -/
def justRecipeSlakeTypecheckPerformClaimedMain : String :=
  "slake-typecheck-performclaimedmain"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformClaimedMainRel : String :=
  SystemsLean.HostFrontLiveHostPerformClaimedMain.livePerformClaimedMainRel

/-- Ready names HostFrontLiveHostPerformClaimedMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckPerformClaimedMainReady,
    kernelCheckLivePerformClaimedMainSource. -/
def slakeTypecheckPerformClaimedMainReady : Bool :=
  SystemsLean.HostFrontLiveHostPerformClaimedMain.hostFrontLivePerformClaimedMainReady

/-- Honesty: this command is not lake build of PerformClaimedMain. -/
def slakeTypecheckPerformClaimedMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformClaimedMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformClaimedMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PerformClaimedMain.lean.
    Ready is HostFrontLiveHostPerformClaimedMain.hostFrontLivePerformClaimedMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostPerformClaimedMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformClaimedMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostPerformClaimedMain.liveRel}"
  IO.println s!"  host={hostId} file={livePerformClaimedMainRel}"
  unless (!slakeTypecheckPerformClaimedMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformClaimedMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostPerformClaimedMain.main args
