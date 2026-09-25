/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.RuntimeBenchLean.
  Short role: named driver for just slake-typecheck-runtimebenchlean.
  Ready is HostFrontLiveRuntimeBenchLean parse plus HostKernel.kernelCheck
  of live RuntimeBenchLean.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchLean.
  liveRel is RuntimeBenchLean.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-LEAN,
  SLAKE_TYPECHECK_RUNTIME_BENCH_LEAN_V0, slake-typecheck-runtimebenchlean,
  slakeTypecheckRuntimeBenchLeanReady,
  kernelCheckLiveRuntimeBenchLeanSource,
  PARSE-LIVE-RUNTIME-BENCH-LEAN, SKELETON.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchLean
  Checkable writer: just slake-typecheck-runtimebenchlean
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchLean

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_LEAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-LEAN"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchLean. -/
def justRecipeSlakeTypecheckRuntimeBenchLean : String :=
  "slake-typecheck-runtimebenchlean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRuntimeBenchLeanRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchLean.liveRuntimeBenchLeanRel

/-- Ready names HostFrontLiveRuntimeBenchLean parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchLeanReady,
    kernelCheckLiveRuntimeBenchLeanSource. -/
def slakeTypecheckRuntimeBenchLeanReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchLean.hostFrontLiveRuntimeBenchLeanReady

/-- Honesty: this command is not lake build of RuntimeBenchLean. -/
def slakeTypecheckRuntimeBenchLeanDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchLeanFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRuntimeBenchLeanOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchLean.lean.
    Ready is HostFrontLiveRuntimeBenchLean.hostFrontLiveRuntimeBenchLeanReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchLean.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchLean} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveRuntimeBenchLean.liveRel}"
  IO.println s!"  host={hostId} file={liveRuntimeBenchLeanRel}"
  unless (!slakeTypecheckRuntimeBenchLeanFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchLeanOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchLean.main args
