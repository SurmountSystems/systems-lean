/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCheckers.
  Short role: named driver for lean --run of
  HostModuleCheckCheckers.lean.
  Ready is HostFrontLiveHostModuleCheckCheckers parse plus
  HostKernel.kernelCheck of live HostModuleCheckCheckers.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCheckers.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCheckers
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERS
  SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERS_V0
  PARSE-LIVE-HOSTMODULECHECKCHECKERS
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcheckers,
  slakeTypecheckHostModuleCheckCheckersReady,
  kernelCheckLiveHostModuleCheckCheckersSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCheckers
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCheckers

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERS"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCheckers.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCheckers : String :=
  "slake-typecheck-hostmodulecheckcheckers"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCheckersRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckers.liveHostModuleCheckCheckersRel

/-- Ready names HostFrontLiveHostModuleCheckCheckers parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCheckersReady,
    kernelCheckLiveHostModuleCheckCheckersSource. -/
def slakeTypecheckHostModuleCheckCheckersReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckers.hostFrontLiveHostModuleCheckCheckersReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCheckersDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCheckersFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCheckersOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCheckers.lean.
    Ready is hostFrontLiveHostModuleCheckCheckersReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCheckers.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCheckers} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCheckers.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCheckersRel}"
  unless (!slakeTypecheckHostModuleCheckCheckersFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCheckersOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCheckersDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCheckers.main args
