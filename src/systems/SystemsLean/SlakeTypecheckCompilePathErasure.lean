/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathErasure.
  Short role: named driver for just slake-typecheck-compilepatherasure.
  Ready is HostFrontLiveCompilePathErasure parse plus HostKernel.kernelCheck
  of live CompilePathErasure.lean, not := true, not lake build
  SystemsLean.CompilePathErasure.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathErasure drivers are not prefix hits):
  SlakeTypecheckCompilePathErasure
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-ERASURE
  SLAKE_TYPECHECK_COMPILE_PATH_ERASURE_V0
  PARSE-LIVE-COMPILE-PATH-ERASURE
  COMPILE-PATH-ERASURE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepatherasure,
  slakeTypecheckCompilePathErasureReady,
  kernelCheckLiveCompilePathErasureSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathErasure
  Checkable writer: just slake-typecheck-compilepatherasure
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathErasure

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_ERASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-ERASURE"

/-- Named just recipe. Not lake build SystemsLean.CompilePathErasure. -/
def justRecipeSlakeTypecheckCompilePathErasure : String :=
  "slake-typecheck-compilepatherasure"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathErasureRel : String :=
  SystemsLean.HostFrontLiveCompilePathErasure.liveCompilePathErasureRel

/-- Ready names HostFrontLiveCompilePathErasure parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathErasureReady,
    kernelCheckLiveCompilePathErasureSource. -/
def slakeTypecheckCompilePathErasureReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathErasure.hostFrontLiveCompilePathErasureReady

/-- Honesty: this command is not lake build of CompilePathErasure. -/
def slakeTypecheckCompilePathErasureDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathErasureFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathErasureOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathErasure.lean.
    Ready is HostFrontLiveCompilePathErasure.hostFrontLiveCompilePathErasureReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathErasure.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathErasure} =="
  IO.println s!"  host={hostId} file={liveCompilePathErasureRel}"
  unless (!slakeTypecheckCompilePathErasureFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathErasureOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathErasure.main args
