/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.RuntimeBenchFailClosedShape.
  Short role: named driver for just slake-typecheck-runtimebenchfailclosedshape.
  Ready is HostFrontLiveRuntimeBenchFailClosedShape parse plus HostKernel.kernelCheck
  of live RuntimeBenchFailClosedShape.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchFailClosedShape.
  liveRel is RuntimeBenchFailClosedShape.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a runtime benchmark claim. Not a new measurement C file.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE,
  SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0, slake-typecheck-runtimebenchfailclosedshape,
  slakeTypecheckRuntimeBenchFailClosedShapeReady,
  kernelCheckLiveRuntimeBenchFailClosedShapeSource,
  PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE, SKELETON.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchFailClosedShape
  Checkable writer: just slake-typecheck-runtimebenchfailclosedshape
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchFailClosedShape. -/
def justRecipeSlakeTypecheckRuntimeBenchFailClosedShape : String :=
  "slake-typecheck-runtimebenchfailclosedshape"

/-- Live file relative to repo root. Repo-relative path. -/
def liveRuntimeBenchFailClosedShapeRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.liveRuntimeBenchFailClosedShapeRel

/-- Ready names HostFrontLiveRuntimeBenchFailClosedShape parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchFailClosedShapeReady,
    kernelCheckLiveRuntimeBenchFailClosedShapeSource. -/
def slakeTypecheckRuntimeBenchFailClosedShapeReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.hostFrontLiveRuntimeBenchFailClosedShapeReady

/-- Honesty: this command is not lake build of RuntimeBenchFailClosedShape.
    Not kernelCheck. -/
def slakeTypecheckRuntimeBenchFailClosedShapeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchFailClosedShapeFullHost : Bool := false

/-- Honesty: package typecheck flag stays false. -/
def slakeTypecheckRuntimeBenchFailClosedShapeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchFailClosedShape.lean.
    Ready is hostFrontLiveRuntimeBenchFailClosedShapeReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchFailClosedShape.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchFailClosedShape} =="
  IO.println s!"  host={hostId} file={liveRuntimeBenchFailClosedShapeRel} liveRel={SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.liveRel}"
  unless (!slakeTypecheckRuntimeBenchFailClosedShapeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchFailClosedShapeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckRuntimeBenchFailClosedShapeDoesNotUseLake do
    IO.eprintln "error: DoesNotUseLake honesty flag must stay true"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.main args
