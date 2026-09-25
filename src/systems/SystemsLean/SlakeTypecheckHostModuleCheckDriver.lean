/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckDriver.
  Short role: named driver for lean --run of
  HostModuleCheckDriver.lean.
  Ready is HostFrontLiveHostModuleCheckDriver parse plus
  HostKernel.kernelCheck of live HostModuleCheckDriver.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckDriver.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckDriver
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDRIVER
  SLAKE_TYPECHECK_HOSTMODULECHECKDRIVER_V0
  PARSE-LIVE-HOSTMODULECHECKDRIVER
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckdriver,
  slakeTypecheckHostModuleCheckDriverReady,
  kernelCheckLiveHostModuleCheckDriverSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckDriver
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckDriver

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKDRIVER_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDRIVER"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckDriver.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckDriver : String :=
  "slake-typecheck-hostmodulecheckdriver"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckDriverRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckDriver.liveHostModuleCheckDriverRel

/-- Ready names HostFrontLiveHostModuleCheckDriver parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckDriverReady,
    kernelCheckLiveHostModuleCheckDriverSource. -/
def slakeTypecheckHostModuleCheckDriverReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckDriver.hostFrontLiveHostModuleCheckDriverReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckDriverDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckDriverFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckDriverOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckDriver.lean.
    Ready is hostFrontLiveHostModuleCheckDriverReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckDriver.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckDriver} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckDriver.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckDriverRel}"
  unless (!slakeTypecheckHostModuleCheckDriverFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckDriverOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckDriverDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckDriver.main args
