/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesSubsetRebuildTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckTypesSubsetRebuildTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckTypesSubsetRebuildTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckTypesSubsetRebuildTerm.
  liveRel is HostModuleCheckTypesSubsetRebuildTerm.lean.
  This wrap is HostModuleCheckTypesSubsetRebuildTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKTYPESSUBSETREBUILDTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKTYPESSUBSETREBUILDTERM,
  slake-typecheck-hostmodulechecktypessubsetrebuildterm,
  slakeTypecheckHostModuleCheckTypesSubsetRebuildTermReady,
  kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource,
  PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesSubsetRebuildTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckTypesSubsetRebuildTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKTYPESSUBSETREBUILDTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKTYPESSUBSETREBUILDTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesSubsetRebuildTerm : String :=
  "slake-typecheck-hostmodulechecktypessubsetrebuildterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckTypesSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm.liveHostModuleCheckTypesSubsetRebuildTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesSubsetRebuildTermReady,
    kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource. -/
def slakeTypecheckHostModuleCheckTypesSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm.hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesSubsetRebuildTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesSubsetRebuildTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckTypesSubsetRebuildTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesSubsetRebuildTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesSubsetRebuildTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesSubsetRebuildTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckTypesSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesSubsetRebuildTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckTypesSubsetRebuildTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm.main args
