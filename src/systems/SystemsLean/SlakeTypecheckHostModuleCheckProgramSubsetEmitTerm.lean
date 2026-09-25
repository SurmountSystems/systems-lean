/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProgramSubsetEmitTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProgramSubsetEmitTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProgramSubsetEmitTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProgramSubsetEmitTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProgramSubsetEmitTerm.
  liveRel is HostModuleCheckProgramSubsetEmitTerm.lean.
  This wrap is HostModuleCheckProgramSubsetEmitTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROGRAMSUBSETEMITTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPROGRAMSUBSETEMITTERM,
  slake-typecheck-hostmodulecheckprogramsubsetemitterm,
  slakeTypecheckHostModuleCheckProgramSubsetEmitTermReady,
  kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource,
  PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProgramSubsetEmitTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProgramSubsetEmitTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPROGRAMSUBSETEMITTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROGRAMSUBSETEMITTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProgramSubsetEmitTerm :
    String :=
  "slake-typecheck-hostmodulecheckprogramsubsetemitterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProgramSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm.liveHostModuleCheckProgramSubsetEmitTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProgramSubsetEmitTermReady,
    kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource. -/
def slakeTypecheckHostModuleCheckProgramSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm.hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProgramSubsetEmitTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProgramSubsetEmitTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProgramSubsetEmitTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProgramSubsetEmitTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProgramSubsetEmitTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProgramSubsetEmitTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProgramSubsetEmitTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProgramSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckProgramSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProgramSubsetEmitTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProgramSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProgramSubsetEmitTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm.main args
