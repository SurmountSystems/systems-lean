/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathProgram.
  Short role: named driver for just slake-typecheck-compilepathprogram.
  Ready is HostFrontLiveCompilePathProgram parse plus HostKernel.kernelCheck
  of live CompilePathProgram.lean, not := true, not lake build
  SystemsLean.CompilePathProgram.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathProgram drivers are not prefix hits):
  SlakeTypecheckCompilePathProgram
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-PROGRAM
  SLAKE_TYPECHECK_COMPILE_PATH_PROGRAM_V0
  PARSE-LIVE-COMPILE-PATH-PROGRAM
  COMPILE-PATH-PROGRAM
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathprogram,
  slakeTypecheckCompilePathProgramReady,
  kernelCheckLiveCompilePathProgramSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathProgram
  Checkable writer: just slake-typecheck-compilepathprogram
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathProgram

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_PROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-PROGRAM"

/-- Named just recipe. Not lake build SystemsLean.CompilePathProgram. -/
def justRecipeSlakeTypecheckCompilePathProgram : String :=
  "slake-typecheck-compilepathprogram"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathProgramRel : String :=
  SystemsLean.HostFrontLiveCompilePathProgram.liveCompilePathProgramRel

/-- Ready names HostFrontLiveCompilePathProgram parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathProgramReady,
    kernelCheckLiveCompilePathProgramSource. -/
def slakeTypecheckCompilePathProgramReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathProgram.hostFrontLiveCompilePathProgramReady

/-- Honesty: this command is not lake build of CompilePathProgram. -/
def slakeTypecheckCompilePathProgramDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathProgramFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathProgramOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathProgram.lean.
    Ready is HostFrontLiveCompilePathProgram.hostFrontLiveCompilePathProgramReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathProgram.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathProgram} =="
  IO.println s!"  host={hostId} file={liveCompilePathProgramRel}"
  unless (!slakeTypecheckCompilePathProgramFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathProgramOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathProgram.main args
