/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProbeWireTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProbeWireTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProbeWireTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProbeWireTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProbeWireTerm.
  liveRel is HostModuleCheckProbeWireTerm.lean.
  This wrap is HostModuleCheckProbeWireTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROBEWIRETERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPROBEWIRETERM,
  slake-typecheck-hostmodulecheckprobewireterm,
  slakeTypecheckHostModuleCheckProbeWireTermReady,
  kernelCheckLiveHostModuleCheckProbeWireTermSource,
  PARSE-LIVE-HOSTMODULECHECKPROBEWIRETERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProbeWireTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProbeWireTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPROBEWIRETERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROBEWIRETERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProbeWireTerm :
    String :=
  "slake-typecheck-hostmodulecheckprobewireterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProbeWireTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm.liveHostModuleCheckProbeWireTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProbeWireTermReady,
    kernelCheckLiveHostModuleCheckProbeWireTermSource. -/
def slakeTypecheckHostModuleCheckProbeWireTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm.hostFrontLiveHostModuleCheckProbeWireTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProbeWireTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProbeWireTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProbeWireTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProbeWireTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProbeWireTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProbeWireTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProbeWireTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProbeWireTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProbeWireTermRel}"
  unless (!slakeTypecheckHostModuleCheckProbeWireTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProbeWireTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProbeWireTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProbeWireTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm.main args
