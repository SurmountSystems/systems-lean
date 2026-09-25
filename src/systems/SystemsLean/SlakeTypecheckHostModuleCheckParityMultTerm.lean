/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckParityMultTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckParityMultTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckParityMultTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckParityMultTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckParityMultTerm.
  liveRel is HostModuleCheckParityMultTerm.lean.
  This wrap is HostModuleCheckParityMultTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYMULTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPARITYMULTTERM,
  slake-typecheck-hostmodulecheckparitymultterm,
  slakeTypecheckHostModuleCheckParityMultTermReady,
  kernelCheckLiveHostModuleCheckParityMultTermSource,
  PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityMultTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckParityMultTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityMultTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPARITYMULTTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYMULTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckParityMultTerm :
    String :=
  "slake-typecheck-hostmodulecheckparitymultterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityMultTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTerm.liveHostModuleCheckParityMultTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckParityMultTermReady,
    kernelCheckLiveHostModuleCheckParityMultTermSource. -/
def slakeTypecheckHostModuleCheckParityMultTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTerm.hostFrontLiveHostModuleCheckParityMultTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckParityMultTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityMultTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckParityMultTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityMultTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckParityMultTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckParityMultTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckParityMultTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckParityMultTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityMultTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityMultTermRel}"
  unless (!slakeTypecheckHostModuleCheckParityMultTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityMultTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityMultTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckParityMultTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTerm.main args
