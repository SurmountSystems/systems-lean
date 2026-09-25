/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.RuntimeBenchStackTwinMain.
  Short role: named driver for just slake-typecheck-runtimebenchstacktwinmain.
  Ready is HostFrontLiveRuntimeBenchStackTwinMainParse parse plus HostKernel.kernelCheck
  of live RuntimeBenchStackTwinMain.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchStackTwinMain.
  liveRel is RuntimeBenchStackTwinMain.lean.
  This wrap is RuntimeBenchStackTwinMain.lean. It is not RuntimeBenchStackTwin.lean.
  Not a speed claim.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-STACK-TWIN-MAIN,
  SLAKE_TYPECHECK_RUNTIME_BENCH_STACK_TWIN_MAIN, slake-typecheck-runtimebenchstacktwinmain,
  slakeTypecheckRuntimeBenchStackTwinMainReady,
  kernelCheckLiveRuntimeBenchStackTwinMainSource,
  PARSE-LIVE-RUNTIME-BENCH-STACK-TWIN-MAIN.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchStackTwinMain
  Checkable writer: just slake-typecheck-runtimebenchstacktwinmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_STACK_TWIN_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-STACK-TWIN-MAIN"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchStackTwinMain. -/
def justRecipeSlakeTypecheckRuntimeBenchStackTwinMain : String :=
  "slake-typecheck-runtimebenchstacktwinmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRuntimeBenchStackTwinMainRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse.liveRuntimeBenchStackTwinMainRel

/-- Ready names HostFrontLiveRuntimeBenchStackTwinMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchStackTwinMainReady,
    kernelCheckLiveRuntimeBenchStackTwinMainSource. -/
def slakeTypecheckRuntimeBenchStackTwinMainReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse.hostFrontLiveRuntimeBenchStackTwinMainReady

/-- Honesty: this command is not lake build of RuntimeBenchStackTwinMain. -/
def slakeTypecheckRuntimeBenchStackTwinMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchStackTwinMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckRuntimeBenchStackTwinMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRuntimeBenchStackTwinMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchStackTwinMain.lean.
    Ready is HostFrontLiveRuntimeBenchStackTwinMainParse.hostFrontLiveRuntimeBenchStackTwinMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchStackTwinMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchStackTwinMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse.liveRel}"
  IO.println s!"  host={hostId} file={liveRuntimeBenchStackTwinMainRel}"
  unless (!slakeTypecheckRuntimeBenchStackTwinMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchStackTwinMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchStackTwinMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchStackTwinMainParse.main args
