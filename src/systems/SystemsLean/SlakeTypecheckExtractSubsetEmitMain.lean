/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ExtractSubsetEmitMain.
  Short role: named driver for just slake-typecheck-extractsubsetemitmain.
  Ready is HostFrontLiveExtractSubsetEmitMain parse plus HostKernel.kernelCheck
  of live ExtractSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.ExtractSubsetEmitMain.
  Not mill 38 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  This wrap is not GraphSubsetEmitMain. Do not steal HostFrontLiveExtractMain.
  Unique needles (trailing newline so SlakeTypecheckExtractSubsetEmitMain is not a prefix):
  SlakeTypecheckExtractSubsetEmitMain
  HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_EXTRACT_SUBSET_EMIT_MAIN_V0
  slake-typecheck-extractsubsetemitmain
  PARSE-LIVE-EXTRACT-SUBSET-EMIT-MAIN
  EXTRACT-SUBSET-EMIT-MAIN
  HOST-EXTRACT-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-extractsubsetemitmain,
  slakeTypecheckExtractSubsetEmitMainReady,
  kernelCheckLiveExtractSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckExtractSubsetEmitMain
  Checkable writer: just slake-typecheck-extractsubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveExtractSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ExtractSubsetEmitMain. -/
def justRecipeSlakeTypecheckExtractSubsetEmitMain : String :=
  "slake-typecheck-extractsubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveExtractSubsetEmitMain.liveExtractSubsetEmitMainRel

/-- Ready names HostFrontLiveExtractSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckExtractSubsetEmitMainReady,
    kernelCheckLiveExtractSubsetEmitMainSource. -/
def slakeTypecheckExtractSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveExtractSubsetEmitMain.hostFrontLiveExtractSubsetEmitMainReady

/-- Honesty: this command is not lake build of ExtractSubsetEmitMain. -/
def slakeTypecheckExtractSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ExtractSubsetEmitMain.lean.
    Ready is HostFrontLiveExtractSubsetEmitMain.hostFrontLiveExtractSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveExtractSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtractSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveExtractSubsetEmitMainRel}"
  unless (!slakeTypecheckExtractSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtractSubsetEmitMain.main args
