/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckMultTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckMultTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckMultTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckMultTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckMultTerm.
  liveRel is HostModuleCheckMultTerm.lean.
  This wrap is HostModuleCheckMultTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKMULTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKMULTTERM,
  slake-typecheck-hostmodulecheckmultterm,
  slakeTypecheckHostModuleCheckMultTermReady,
  kernelCheckLiveHostModuleCheckMultTermSource,
  PARSE-LIVE-HOSTMODULECHECKMULTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckMultTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKMULTTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKMULTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckMultTerm : String :=
  "slake-typecheck-hostmodulecheckmultterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckMultTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultTerm.liveHostModuleCheckMultTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckMultTermReady,
    kernelCheckLiveHostModuleCheckMultTermSource. -/
def slakeTypecheckHostModuleCheckMultTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultTerm.hostFrontLiveHostModuleCheckMultTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckMultTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckMultTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckMultTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckMultTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckMultTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckMultTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultTermRel}"
  unless (!slakeTypecheckHostModuleCheckMultTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckMultTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultTerm.main args
