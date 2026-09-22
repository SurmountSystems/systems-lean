/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitGraphScaffold.
  Short role: named driver for just slake-typecheck-emitgraphscaffold.
  Ready is HostFrontLiveEmitGraphScaffold parse plus HostKernel.kernelCheck
  of live EmitGraphScaffold.lean, not := true, not lake build
  SystemsLean.EmitGraphScaffold.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other Emit* drivers are not prefix hits):
  SlakeTypecheckEmitGraphScaffold
  HOST-SLAKE-TYPECHECK-EMIT-GRAPH-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_GRAPH_SCAFFOLD_V0
  PARSE-LIVE-EMIT-GRAPH-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitgraphscaffold,
  slakeTypecheckEmitGraphScaffoldReady,
  kernelCheckLiveEmitGraphScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitGraphScaffold
  Checkable writer: just slake-typecheck-emitgraphscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitGraphScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_GRAPH_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-GRAPH-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitGraphScaffold. -/
def justRecipeSlakeTypecheckEmitGraphScaffold : String :=
  "slake-typecheck-emitgraphscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitGraphScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitGraphScaffold.liveEmitGraphScaffoldRel

/-- Ready names HostFrontLiveEmitGraphScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitGraphScaffoldReady,
    kernelCheckLiveEmitGraphScaffoldSource. -/
def slakeTypecheckEmitGraphScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitGraphScaffold.hostFrontLiveEmitGraphScaffoldReady

/-- Honesty: this command is not lake build of EmitGraphScaffold. -/
def slakeTypecheckEmitGraphScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitGraphScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitGraphScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitGraphScaffold.lean.
    Ready is HostFrontLiveEmitGraphScaffold.hostFrontLiveEmitGraphScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitGraphScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitGraphScaffold} =="
  IO.println s!"  host={hostId} file={liveEmitGraphScaffoldRel}"
  unless (!slakeTypecheckEmitGraphScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitGraphScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitGraphScaffold.main args
