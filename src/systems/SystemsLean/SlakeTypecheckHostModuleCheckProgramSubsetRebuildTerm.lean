/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProgramSubsetRebuildTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProgramSubsetRebuildTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProgramSubsetRebuildTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProgramSubsetRebuildTerm.
  liveRel is HostModuleCheckProgramSubsetRebuildTerm.lean.
  This wrap is HostModuleCheckProgramSubsetRebuildTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROGRAMSUBSETREBUILDTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPROGRAMSUBSETREBUILDTERM,
  slake-typecheck-hostmodulecheckprogramsubsetrebuildterm,
  slakeTypecheckHostModuleCheckProgramSubsetRebuildTermReady,
  kernelCheckLiveHostModuleCheckProgramSubsetRebuildTermSource,
  PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETREBUILDTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProgramSubsetRebuildTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProgramSubsetRebuildTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPROGRAMSUBSETREBUILDTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPROGRAMSUBSETREBUILDTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProgramSubsetRebuildTerm :
    String :=
  "slake-typecheck-hostmodulecheckprogramsubsetrebuildterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProgramSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm.liveHostModuleCheckProgramSubsetRebuildTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProgramSubsetRebuildTermReady,
    kernelCheckLiveHostModuleCheckProgramSubsetRebuildTermSource. -/
def slakeTypecheckHostModuleCheckProgramSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm.hostFrontLiveHostModuleCheckProgramSubsetRebuildTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProgramSubsetRebuildTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProgramSubsetRebuildTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProgramSubsetRebuildTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProgramSubsetRebuildTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProgramSubsetRebuildTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProgramSubsetRebuildTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProgramSubsetRebuildTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProgramSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckProgramSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProgramSubsetRebuildTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProgramSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProgramSubsetRebuildTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetRebuildTerm.main args
