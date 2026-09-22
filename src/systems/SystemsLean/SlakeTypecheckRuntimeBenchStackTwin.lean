/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.RuntimeBenchStackTwin.
  Short role: named driver for just slake-typecheck-runtimebenchstacktwin.
  Ready is HostFrontLiveRuntimeBenchStackTwin parse plus HostKernel.kernelCheck
  of live RuntimeBenchStackTwin.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchStackTwin.
  liveRel is RuntimeBenchStackTwin.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a runtime benchmark claim. Not a new measurement C file.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-STACK-TWIN,
  SLAKE_TYPECHECK_RUNTIME_BENCH_STACK_TWIN_V0, slake-typecheck-runtimebenchstacktwin,
  slakeTypecheckRuntimeBenchStackTwinReady,
  kernelCheckLiveRuntimeBenchStackTwinSource,
  PARSE-LIVE-RUNTIME-BENCH-STACK-TWIN, SKELETON.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchStackTwin
  Checkable writer: just slake-typecheck-runtimebenchstacktwin
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchStackTwin

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_STACK_TWIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-STACK-TWIN"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchStackTwin. -/
def justRecipeSlakeTypecheckRuntimeBenchStackTwin : String :=
  "slake-typecheck-runtimebenchstacktwin"

/-- Live file relative to repo root. Repo-relative path. -/
def liveRuntimeBenchStackTwinRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchStackTwin.liveRuntimeBenchStackTwinRel

/-- Ready names HostFrontLiveRuntimeBenchStackTwin parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchStackTwinReady,
    kernelCheckLiveRuntimeBenchStackTwinSource. -/
def slakeTypecheckRuntimeBenchStackTwinReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchStackTwin.hostFrontLiveRuntimeBenchStackTwinReady

/-- Honesty: this command is not lake build of RuntimeBenchStackTwin.
    Not kernelCheck. -/
def slakeTypecheckRuntimeBenchStackTwinDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchStackTwinFullHost : Bool := false

/-- Honesty: package typecheck flag stays false. -/
def slakeTypecheckRuntimeBenchStackTwinOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchStackTwin.lean.
    Ready is hostFrontLiveRuntimeBenchStackTwinReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchStackTwin.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchStackTwin} =="
  IO.println s!"  host={hostId} file={liveRuntimeBenchStackTwinRel} liveRel={SystemsLean.HostFrontLiveRuntimeBenchStackTwin.liveRel}"
  unless (!slakeTypecheckRuntimeBenchStackTwinFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchStackTwinOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckRuntimeBenchStackTwinDoesNotUseLake do
    IO.eprintln "error: DoesNotUseLake honesty flag must stay true"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchStackTwin.main args
