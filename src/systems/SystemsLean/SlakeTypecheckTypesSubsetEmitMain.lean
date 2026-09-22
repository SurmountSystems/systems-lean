/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesSubsetEmitMain.
  Short role: named driver for just slake-typecheck-typessubsetemitmain.
  Ready is HostFrontLiveTypesSubsetEmitMain parse plus HostKernel.kernelCheck
  of live TypesSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.TypesSubsetEmitMain.
  Not mill 34 remill. Not occupancy name 50. Not FullHost.
  This wrap is not GraphSubsetEmitMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckTypesSubsetEmitMain is not a prefix):
  SlakeTypecheckTypesSubsetEmitMain
  HOST-SLAKE-TYPECHECK-TYPES-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_TYPES_SUBSET_EMIT_MAIN_V0
  slake-typecheck-typessubsetemitmain
  PARSE-LIVE-TYPES-SUBSET-EMIT-MAIN
  TYPES-SUBSET-EMIT-MAIN
  HOST-TYPES-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-typessubsetemitmain,
  slakeTypecheckTypesSubsetEmitMainReady,
  kernelCheckLiveTypesSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckTypesSubsetEmitMain
  Checkable writer: just slake-typecheck-typessubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveTypesSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPES_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.TypesSubsetEmitMain. -/
def justRecipeSlakeTypecheckTypesSubsetEmitMain : String :=
  "slake-typecheck-typessubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveTypesSubsetEmitMain.liveTypesSubsetEmitMainRel

/-- Ready names HostFrontLiveTypesSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckTypesSubsetEmitMainReady,
    kernelCheckLiveTypesSubsetEmitMainSource. -/
def slakeTypecheckTypesSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveTypesSubsetEmitMain.hostFrontLiveTypesSubsetEmitMainReady

/-- Honesty: this command is not lake build of TypesSubsetEmitMain. -/
def slakeTypecheckTypesSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesSubsetEmitMain.lean.
    Ready is HostFrontLiveTypesSubsetEmitMain.hostFrontLiveTypesSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveTypesSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveTypesSubsetEmitMainRel}"
  unless (!slakeTypecheckTypesSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypesSubsetEmitMain.main args
