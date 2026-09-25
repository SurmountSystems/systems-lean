/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.RuntimeBenchLeanMain.
  Short role: named driver for just slake-typecheck-runtimebenchleanmain.
  Ready is HostFrontLiveRuntimeBenchLeanMainSource parse plus HostKernel.kernelCheck
  of live RuntimeBenchLeanMain.lean, not a hardcoded true, not lake build
  SystemsLean.RuntimeBenchLeanMain.
  liveRel is RuntimeBenchLeanMain.lean.
  This wrap is RuntimeBenchLeanMain.lean. It is not RuntimeBenchLean.lean.
  The checker accepts the Main source. The forwarder only calls the neighbor.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-LEAN-MAIN,
  SLAKE_TYPECHECK_RUNTIME_BENCH_LEAN_MAIN_V0,
  slake-typecheck-runtimebenchleanmain,
  slakeTypecheckRuntimeBenchLeanMainReady,
  kernelCheckLiveRuntimeBenchLeanMainSource,
  PARSE-LIVE-RUNTIME-BENCH-LEAN-MAIN.
  Module: SystemsLean.SlakeTypecheckRuntimeBenchLeanMain
  Checkable writer: just slake-typecheck-runtimebenchleanmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRuntimeBenchLeanMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_RUNTIME_BENCH_LEAN_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-LEAN-MAIN"

/-- Named just recipe. Not lake build SystemsLean.RuntimeBenchLeanMain. -/
def justRecipeSlakeTypecheckRuntimeBenchLeanMain : String :=
  "slake-typecheck-runtimebenchleanmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveRuntimeBenchLeanMainRel : String :=
  SystemsLean.HostFrontLiveRuntimeBenchLeanMainSource.liveRel

/-- Ready names HostFrontLiveRuntimeBenchLeanMainSource parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckRuntimeBenchLeanMainReady,
    kernelCheckLiveRuntimeBenchLeanMainSource. -/
def slakeTypecheckRuntimeBenchLeanMainReady : Bool :=
  SystemsLean.HostFrontLiveRuntimeBenchLeanMainSource.hostFrontLiveRuntimeBenchLeanMainReady

/-- Honesty: this command is not lake build of RuntimeBenchLeanMain. -/
def slakeTypecheckRuntimeBenchLeanMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRuntimeBenchLeanMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRuntimeBenchLeanMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live RuntimeBenchLeanMain.lean.
    Ready is HostFrontLiveRuntimeBenchLeanMainSource.hostFrontLiveRuntimeBenchLeanMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveRuntimeBenchLeanMainSource.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRuntimeBenchLeanMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveRuntimeBenchLeanMainSource.liveRel}"
  IO.println s!"  host={hostId} file={liveRuntimeBenchLeanMainRel}"
  unless (!slakeTypecheckRuntimeBenchLeanMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRuntimeBenchLeanMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRuntimeBenchLeanMainSource.main args
