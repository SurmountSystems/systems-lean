/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ErasureSubsetEmitMain.
  Short role: named driver for just slake-typecheck-erasuresubsetemitmain.
  Ready is HostFrontLiveErasureSubsetEmitMain parse plus HostKernel.kernelCheck
  of live ErasureSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.ErasureSubsetEmitMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckErasureSubsetEmitMain is not a prefix):
  SlakeTypecheckErasureSubsetEmitMain
  HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_ERASURE_SUBSET_EMIT_MAIN_V0
  slake-typecheck-erasuresubsetemitmain
  PARSE-LIVE-ERASURE-SUBSET-EMIT-MAIN
  ERASURE-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-erasuresubsetemitmain,
  slakeTypecheckErasureSubsetEmitMainReady,
  kernelCheckLiveErasureSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckErasureSubsetEmitMain
  Checkable writer: just slake-typecheck-erasuresubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveErasureSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ErasureSubsetEmitMain. -/
def justRecipeSlakeTypecheckErasureSubsetEmitMain : String :=
  "slake-typecheck-erasuresubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveErasureSubsetEmitMain.liveErasureSubsetEmitMainRel

/-- Ready names HostFrontLiveErasureSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckErasureSubsetEmitMainReady,
    kernelCheckLiveErasureSubsetEmitMainSource. -/
def slakeTypecheckErasureSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveErasureSubsetEmitMain.hostFrontLiveErasureSubsetEmitMainReady

/-- Honesty: this command is not lake build of ErasureSubsetEmitMain. -/
def slakeTypecheckErasureSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ErasureSubsetEmitMain.lean.
    Ready is HostFrontLiveErasureSubsetEmitMain.hostFrontLiveErasureSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveErasureSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasureSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveErasureSubsetEmitMainRel}"
  unless (!slakeTypecheckErasureSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasureSubsetEmitMain.main args
