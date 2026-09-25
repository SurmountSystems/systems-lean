/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckDriverIO.
  Short role: named driver for lean --run of
  HostModuleCheckDriverIO.lean.
  Ready is HostFrontLiveHostModuleCheckDriverIO parse plus
  HostKernel.kernelCheck of live HostModuleCheckDriverIO.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckDriverIO.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckDriverIO
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDRIVERIO
  SLAKE_TYPECHECK_HOSTMODULECHECKDRIVERIO_V0
  PARSE-LIVE-HOSTMODULECHECKDRIVERIO
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckdriverio,
  slakeTypecheckHostModuleCheckDriverIOReady,
  kernelCheckLiveHostModuleCheckDriverIOSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckDriverIO
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckDriverIO

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKDRIVERIO_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDRIVERIO"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckDriverIO.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckDriverIO : String :=
  "slake-typecheck-hostmodulecheckdriverio"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckDriverIORel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckDriverIO.liveHostModuleCheckDriverIORel

/-- Ready names HostFrontLiveHostModuleCheckDriverIO parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckDriverIOReady,
    kernelCheckLiveHostModuleCheckDriverIOSource. -/
def slakeTypecheckHostModuleCheckDriverIOReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckDriverIO.hostFrontLiveHostModuleCheckDriverIOReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckDriverIODoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckDriverIOFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckDriverIOOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckDriverIO.lean.
    Ready is hostFrontLiveHostModuleCheckDriverIOReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckDriverIO.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckDriverIO} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckDriverIO.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckDriverIORel}"
  unless (!slakeTypecheckHostModuleCheckDriverIOFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckDriverIOOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckDriverIODoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckDriverIO.main args
