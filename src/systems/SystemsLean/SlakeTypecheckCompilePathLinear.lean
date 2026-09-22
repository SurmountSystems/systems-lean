/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathLinear.
  Short role: named driver for just slake-typecheck-compilepathlinear.
  Ready is HostFrontLiveCompilePathLinear parse plus HostKernel.kernelCheck
  of live CompilePathLinear.lean, not := true, not lake build
  SystemsLean.CompilePathLinear.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathLinear drivers are not prefix hits):
  SlakeTypecheckCompilePathLinear
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-LINEAR
  SLAKE_TYPECHECK_COMPILE_PATH_LINEAR_V0
  PARSE-LIVE-COMPILE-PATH-LINEAR
  COMPILE-PATH-LINEAR
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathlinear,
  slakeTypecheckCompilePathLinearReady,
  kernelCheckLiveCompilePathLinearSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathLinear
  Checkable writer: just slake-typecheck-compilepathlinear
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathLinear

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-LINEAR"

/-- Named just recipe. Not lake build SystemsLean.CompilePathLinear. -/
def justRecipeSlakeTypecheckCompilePathLinear : String :=
  "slake-typecheck-compilepathlinear"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathLinearRel : String :=
  SystemsLean.HostFrontLiveCompilePathLinear.liveCompilePathLinearRel

/-- Live basename. Greppable: liveRel. Must be CompilePathLinear.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveCompilePathLinear.liveRel

/-- Ready names HostFrontLiveCompilePathLinear parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathLinearReady,
    kernelCheckLiveCompilePathLinearSource. -/
def slakeTypecheckCompilePathLinearReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathLinear.hostFrontLiveCompilePathLinearReady

/-- Honesty: this command is not lake build of CompilePathLinear. -/
def slakeTypecheckCompilePathLinearDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathLinearFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathLinearOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathLinear.lean.
    Ready is HostFrontLiveCompilePathLinear.hostFrontLiveCompilePathLinearReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathLinear.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathLinear} =="
  IO.println s!"  host={hostId} file={liveCompilePathLinearRel} liveRel={liveRel}"
  unless (!slakeTypecheckCompilePathLinearFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathLinearOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathLinear.main args
