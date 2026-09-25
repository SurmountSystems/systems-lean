/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckAcceptsLater.
  Short role: named driver for lean --run of
  HostModuleCheckAcceptsLater.lean.
  Ready is HostFrontLiveHostModuleCheckAcceptsLater parse plus
  HostKernel.kernelCheck of live HostModuleCheckAcceptsLater.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckAcceptsLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckAcceptsLater
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSLATER
  SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSLATER_V0
  PARSE-LIVE-HOSTMODULECHECKACCEPTSLATER
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckacceptslater,
  slakeTypecheckHostModuleCheckAcceptsLaterReady,
  kernelCheckLiveHostModuleCheckAcceptsLaterSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckAcceptsLater
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSLATER_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSLATER"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckAcceptsLater.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckAcceptsLater : String :=
  "slake-typecheck-hostmodulecheckacceptslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater.liveHostModuleCheckAcceptsLaterRel

/-- Ready names HostFrontLiveHostModuleCheckAcceptsLater parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckAcceptsLaterReady,
    kernelCheckLiveHostModuleCheckAcceptsLaterSource. -/
def slakeTypecheckHostModuleCheckAcceptsLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater.hostFrontLiveHostModuleCheckAcceptsLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckAcceptsLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckAcceptsLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckAcceptsLaterOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckAcceptsLater.lean.
    Ready is hostFrontLiveHostModuleCheckAcceptsLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckAcceptsLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckAcceptsLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsLaterRel}"
  unless (!slakeTypecheckHostModuleCheckAcceptsLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckAcceptsLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckAcceptsLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsLater.main args
