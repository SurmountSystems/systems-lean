/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckParityProgramTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckParityProgramTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckParityProgramTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckParityProgramTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckParityProgramTerm.
  liveRel is HostModuleCheckParityProgramTerm.lean.
  This wrap is HostModuleCheckParityProgramTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYPROGRAMTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPARITYPROGRAMTERM,
  slake-typecheck-hostmodulecheckparityprogramterm,
  slakeTypecheckHostModuleCheckParityProgramTermReady,
  kernelCheckLiveHostModuleCheckParityProgramTermSource,
  PARSE-LIVE-HOSTMODULECHECKPARITYPROGRAMTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityProgramTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckParityProgramTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPARITYPROGRAMTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYPROGRAMTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckParityProgramTerm :
    String :=
  "slake-typecheck-hostmodulecheckparityprogramterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityProgramTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm.liveHostModuleCheckParityProgramTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckParityProgramTermReady,
    kernelCheckLiveHostModuleCheckParityProgramTermSource. -/
def slakeTypecheckHostModuleCheckParityProgramTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm.hostFrontLiveHostModuleCheckParityProgramTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckParityProgramTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityProgramTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckParityProgramTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityProgramTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckParityProgramTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckParityProgramTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckParityProgramTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckParityProgramTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityProgramTermRel}"
  unless (!slakeTypecheckHostModuleCheckParityProgramTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityProgramTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityProgramTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckParityProgramTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm.main args
