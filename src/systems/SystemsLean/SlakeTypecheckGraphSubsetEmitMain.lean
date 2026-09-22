/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.GraphSubsetEmitMain.
  Short role: named driver for just slake-typecheck-graphsubsetemitmain.
  Ready is HostFrontLiveGraphSubsetEmitMain parse plus HostKernel.kernelCheck
  of live GraphSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.GraphSubsetEmitMain.
  Not mill 33 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckGraphSubsetEmitMain is not a prefix):
  SlakeTypecheckGraphSubsetEmitMain
  HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_GRAPH_SUBSET_EMIT_MAIN_V0
  slake-typecheck-graphsubsetemitmain
  PARSE-LIVE-GRAPH-SUBSET-EMIT-MAIN
  GRAPH-SUBSET-EMIT-MAIN
  HOST-GRAPH-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-graphsubsetemitmain,
  slakeTypecheckGraphSubsetEmitMainReady,
  kernelCheckLiveGraphSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckGraphSubsetEmitMain
  Checkable writer: just slake-typecheck-graphsubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveGraphSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.GraphSubsetEmitMain. -/
def justRecipeSlakeTypecheckGraphSubsetEmitMain : String :=
  "slake-typecheck-graphsubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveGraphSubsetEmitMain.liveGraphSubsetEmitMainRel

/-- Ready names HostFrontLiveGraphSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckGraphSubsetEmitMainReady,
    kernelCheckLiveGraphSubsetEmitMainSource. -/
def slakeTypecheckGraphSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveGraphSubsetEmitMain.hostFrontLiveGraphSubsetEmitMainReady

/-- Honesty: this command is not lake build of GraphSubsetEmitMain. -/
def slakeTypecheckGraphSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live GraphSubsetEmitMain.lean.
    Ready is HostFrontLiveGraphSubsetEmitMain.hostFrontLiveGraphSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveGraphSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveGraphSubsetEmitMainRel}"
  unless (!slakeTypecheckGraphSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraphSubsetEmitMain.main args
