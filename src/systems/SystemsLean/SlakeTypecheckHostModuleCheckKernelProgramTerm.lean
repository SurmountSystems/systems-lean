/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckKernelProgramTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckKernelProgramTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckKernelProgramTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckKernelProgramTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckKernelProgramTerm.
  liveRel is HostModuleCheckKernelProgramTerm.lean.
  This wrap is HostModuleCheckKernelProgramTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKKERNELPROGRAMTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKKERNELPROGRAMTERM,
  slake-typecheck-hostmodulecheckkernelprogramterm,
  slakeTypecheckHostModuleCheckKernelProgramTermReady,
  kernelCheckLiveHostModuleCheckKernelProgramTermSource,
  PARSE-LIVE-HOSTMODULECHECKKERNELPROGRAMTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelProgramTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckKernelProgramTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKKERNELPROGRAMTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKKERNELPROGRAMTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckKernelProgramTerm : String :=
  "slake-typecheck-hostmodulecheckkernelprogramterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckKernelProgramTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm.liveHostModuleCheckKernelProgramTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckKernelProgramTermReady,
    kernelCheckLiveHostModuleCheckKernelProgramTermSource. -/
def slakeTypecheckHostModuleCheckKernelProgramTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm.hostFrontLiveHostModuleCheckKernelProgramTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckKernelProgramTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckKernelProgramTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckKernelProgramTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckKernelProgramTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckKernelProgramTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckKernelProgramTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelProgramTermRel}"
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckKernelProgramTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm.main args
