/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.RuntimeBenchFailClosedShapeMain.
  Short role: named driver for just slake-typecheck-runtimebenchfailclosedshapemain.
  Ready is HostFrontLiveRuntimeBenchFailClosedShapeMainParse parse plus HostKernel.kernelCheck
  of live RuntimeBenchFailClosedShapeMain.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchFailClosedShapeMain.
  liveRel is RuntimeBenchFailClosedShapeMain.lean.
  This wrap is RuntimeBenchFailClosedShapeMain.lean. It is not RuntimeBenchFailClosedShape.lean.
  Not a speed claim.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE-MAIN,
  SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_MAIN, slake-typecheck-runtimebenchfailclosedshapemain,
  slakeTypecheckRuntimeBenchFailClosedShapeMainReady,
  kernelCheckLiveRuntimeBenchFailClosedShapeMainSource,
  PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE-MAIN.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchFailClosedShapeMain
  Checkable writer: just slake-typecheck-runtimebenchfailclosedshapemain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchFailClosedShapeMain. -/
def justRecipeSlakeTypecheckRuntimeBenchFailClosedShapeMain : String :=
  "slake-typecheck-runtimebenchfailclosedshapemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRuntimeBenchFailClosedShapeMainRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse.liveRuntimeBenchFailClosedShapeMainRel

/-- Ready names HostFrontLiveRuntimeBenchFailClosedShapeMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchFailClosedShapeMainReady,
    kernelCheckLiveRuntimeBenchFailClosedShapeMainSource. -/
def slakeTypecheckRuntimeBenchFailClosedShapeMainReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse.hostFrontLiveRuntimeBenchFailClosedShapeMainReady

/-- Honesty: this command is not lake build of RuntimeBenchFailClosedShapeMain. -/
def slakeTypecheckRuntimeBenchFailClosedShapeMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchFailClosedShapeMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckRuntimeBenchFailClosedShapeMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRuntimeBenchFailClosedShapeMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchFailClosedShapeMain.lean.
    Ready is HostFrontLiveRuntimeBenchFailClosedShapeMainParse.hostFrontLiveRuntimeBenchFailClosedShapeMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchFailClosedShapeMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchFailClosedShapeMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse.liveRel}"
  IO.println s!"  host={hostId} file={liveRuntimeBenchFailClosedShapeMainRel}"
  unless (!slakeTypecheckRuntimeBenchFailClosedShapeMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchFailClosedShapeMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchFailClosedShapeMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMainParse.main args
