/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCheckersLater.
  Short role: named driver for lean --run of
  HostModuleCheckCheckersLater.lean.
  Ready is HostFrontLiveHostModuleCheckCheckersLater parse plus
  HostKernel.kernelCheck of live HostModuleCheckCheckersLater.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCheckersLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCheckersLater
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSLATER
  SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSLATER_V0
  PARSE-LIVE-HOSTMODULECHECKCHECKERSLATER
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcheckerslater,
  slakeTypecheckHostModuleCheckCheckersLaterReady,
  kernelCheckLiveHostModuleCheckCheckersLaterSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCheckersLater
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCheckersLater

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSLATER_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSLATER"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCheckersLater.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCheckersLater : String :=
  "slake-typecheck-hostmodulecheckcheckerslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCheckersLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLater.liveHostModuleCheckCheckersLaterRel

/-- Ready names HostFrontLiveHostModuleCheckCheckersLater parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCheckersLaterReady,
    kernelCheckLiveHostModuleCheckCheckersLaterSource. -/
def slakeTypecheckHostModuleCheckCheckersLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLater.hostFrontLiveHostModuleCheckCheckersLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCheckersLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCheckersLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCheckersLaterOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCheckersLater.lean.
    Ready is hostFrontLiveHostModuleCheckCheckersLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCheckersLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCheckersLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCheckersLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCheckersLaterRel}"
  unless (!slakeTypecheckHostModuleCheckCheckersLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCheckersLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCheckersLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLater.main args
