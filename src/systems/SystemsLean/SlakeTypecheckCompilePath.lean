/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePath.
  Short role: named driver for just slake-typecheck-compilepath.
  Ready is HostFrontLiveCompilePath parse plus HostKernel.kernelCheck of live
  CompilePath.lean, not := true, not lake build SystemsLean.CompilePath.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPILEPATH,
  SLAKE_TYPECHECK_COMPILEPATH_V0, slake-typecheck-compilepath,
  slakeTypecheckCompilePathReady, kernelCheckLiveCompilePathSource,
  PARSE-LIVE-COMPILEPATH, SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePath
  Checkable writer: just slake-typecheck-compilepath (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCompilePath

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILEPATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILEPATH"

/-- Named just recipe. Not lake build SystemsLean.CompilePath. -/
def justRecipeSlakeTypecheckCompilePath : String :=
  "slake-typecheck-compilepath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathRel : String :=
  SystemsLean.HostFrontLiveCompilePath.liveCompilePathRel

/-- Ready names HostFrontLiveCompilePath parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCompilePathReady,
    kernelCheckLiveCompilePathSource. -/
def slakeTypecheckCompilePathReady : Bool :=
  SystemsLean.HostFrontLiveCompilePath.hostFrontLiveCompilePathReady

/-- Honesty: this command is not lake build of CompilePath. -/
def slakeTypecheckCompilePathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePath.lean.
    Ready is HostFrontLiveCompilePath.hostFrontLiveCompilePathReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePath.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePath} =="
  IO.println s!"  host={hostId} file={liveCompilePathRel}"
  unless (!slakeTypecheckCompilePathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePath.main args
