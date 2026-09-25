/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckParityLinearTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckParityLinearTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckParityLinearTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckParityLinearTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckParityLinearTerm.
  liveRel is HostModuleCheckParityLinearTerm.lean.
  This wrap is HostModuleCheckParityLinearTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYLINEARTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPARITYLINEARTERM,
  slake-typecheck-hostmodulecheckparitylinearterm,
  slakeTypecheckHostModuleCheckParityLinearTermReady,
  kernelCheckLiveHostModuleCheckParityLinearTermSource,
  PARSE-LIVE-HOSTMODULECHECKPARITYLINEARTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityLinearTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckParityLinearTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityLinearTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPARITYLINEARTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYLINEARTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckParityLinearTerm :
    String :=
  "slake-typecheck-hostmodulecheckparitylinearterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityLinearTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTerm.liveHostModuleCheckParityLinearTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckParityLinearTermReady,
    kernelCheckLiveHostModuleCheckParityLinearTermSource. -/
def slakeTypecheckHostModuleCheckParityLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTerm.hostFrontLiveHostModuleCheckParityLinearTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckParityLinearTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityLinearTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckParityLinearTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityLinearTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckParityLinearTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckParityLinearTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckParityLinearTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckParityLinearTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityLinearTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityLinearTermRel}"
  unless (!slakeTypecheckHostModuleCheckParityLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityLinearTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckParityLinearTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTerm.main args
