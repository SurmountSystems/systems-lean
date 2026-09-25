/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckComposeSubsetRebuildTerm.
  Short role: named driver for lean --run of
  HostModuleCheckComposeSubsetRebuildTerm.lean.
  Ready is HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckComposeSubsetRebuildTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckComposeSubsetRebuildTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckComposeSubsetRebuildTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcomposesubsetrebuildterm,
  slakeTypecheckHostModuleCheckComposeSubsetRebuildTermReady,
  kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckComposeSubsetRebuildTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckComposeSubsetRebuildTerm : String :=
  "slake-typecheck-hostmodulecheckcomposesubsetrebuildterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckComposeSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.liveHostModuleCheckComposeSubsetRebuildTermRel

/-- Ready names HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckComposeSubsetRebuildTermReady,
    kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource. -/
def slakeTypecheckHostModuleCheckComposeSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckComposeSubsetRebuildTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckComposeSubsetRebuildTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckComposeSubsetRebuildTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckComposeSubsetRebuildTerm.lean.
    Ready is hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckComposeSubsetRebuildTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckComposeSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckComposeSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckComposeSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckComposeSubsetRebuildTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.main args
