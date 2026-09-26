/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckErasureSubsetRebuildTerm.
  Short role: named driver for lean --run of
  HostModuleCheckErasureSubsetRebuildTerm.lean.
  Ready is HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckErasureSubsetRebuildTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckErasureSubsetRebuildTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckErasureSubsetRebuildTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURESUBSETREBUILDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKERASURESUBSETREBUILDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKERASURESUBSETREBUILDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckerasuresubsetrebuildterm,
  slakeTypecheckHostModuleCheckErasureSubsetRebuildTermReady,
  kernelCheckLiveHostModuleCheckErasureSubsetRebuildTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckErasureSubsetRebuildTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKERASURESUBSETREBUILDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURESUBSETREBUILDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckErasureSubsetRebuildTerm : String :=
  "slake-typecheck-hostmodulecheckerasuresubsetrebuildterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckErasureSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm.liveHostModuleCheckErasureSubsetRebuildTermRel

/-- Ready names HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckErasureSubsetRebuildTermReady,
    kernelCheckLiveHostModuleCheckErasureSubsetRebuildTermSource. -/
def slakeTypecheckHostModuleCheckErasureSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm.hostFrontLiveHostModuleCheckErasureSubsetRebuildTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckErasureSubsetRebuildTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckErasureSubsetRebuildTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckErasureSubsetRebuildTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckErasureSubsetRebuildTerm.lean.
    Ready is hostFrontLiveHostModuleCheckErasureSubsetRebuildTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckErasureSubsetRebuildTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckErasureSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckErasureSubsetRebuildTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetRebuildTerm.main args
