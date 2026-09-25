/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckErasureSubsetEmitTerm.
  Short role: named driver for lean --run of
  HostModuleCheckErasureSubsetEmitTerm.lean.
  Ready is HostFrontLiveHostModuleCheckErasureSubsetEmitTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckErasureSubsetEmitTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckErasureSubsetEmitTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckErasureSubsetEmitTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURESUBSETEMITTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKERASURESUBSETEMITTERM_V0
  PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckerasuresubsetemitterm,
  slakeTypecheckHostModuleCheckErasureSubsetEmitTermReady,
  kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckErasureSubsetEmitTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKERASURESUBSETEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURESUBSETEMITTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckErasureSubsetEmitTerm : String :=
  "slake-typecheck-hostmodulecheckerasuresubsetemitterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckErasureSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.liveHostModuleCheckErasureSubsetEmitTermRel

/-- Ready names HostFrontLiveHostModuleCheckErasureSubsetEmitTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckErasureSubsetEmitTermReady,
    kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource. -/
def slakeTypecheckHostModuleCheckErasureSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckErasureSubsetEmitTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckErasureSubsetEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckErasureSubsetEmitTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckErasureSubsetEmitTerm.lean.
    Ready is hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckErasureSubsetEmitTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckErasureSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckErasureSubsetEmitTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.main args
