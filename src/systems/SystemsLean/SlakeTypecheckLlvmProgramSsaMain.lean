/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmProgramSsaMain.
  Short role: named driver for just slake-typecheck-llvmprogramssamain.
  Ready is HostFrontLiveLlvmProgramSsaMain parse plus HostKernel.kernelCheck
  of live LlvmProgramSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmProgramSsaMain.
  Not mill 64 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckLlvmProgramSsaMain is not a prefix):
  SlakeTypecheckLlvmProgramSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_PROGRAM_SSA_MAIN_V0
  slake-typecheck-llvmprogramssamain
  PARSE-LIVE-LLVM-PROGRAM-SSA-MAIN
  LLVM-PROGRAM-SSA-MAIN
  HOST-LLVM-PROGRAM-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmprogramssamain,
  slakeTypecheckLlvmProgramSsaMainReady,
  kernelCheckLiveLlvmProgramSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmProgramSsaMain
  Checkable writer: just slake-typecheck-llvmprogramssamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmProgramSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_PROGRAM_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmProgramSsaMain. -/
def justRecipeSlakeTypecheckLlvmProgramSsaMain : String :=
  "slake-typecheck-llvmprogramssamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmProgramSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmProgramSsaMain.liveLlvmProgramSsaMainRel

/-- Ready names HostFrontLiveLlvmProgramSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmProgramSsaMainReady,
    kernelCheckLiveLlvmProgramSsaMainSource. -/
def slakeTypecheckLlvmProgramSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmProgramSsaMain.hostFrontLiveLlvmProgramSsaMainReady

/-- Honesty: this command is not lake build of LlvmProgramSsaMain. -/
def slakeTypecheckLlvmProgramSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmProgramSsaMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmProgramSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmProgramSsaMain.lean.
    Ready is HostFrontLiveLlvmProgramSsaMain.hostFrontLiveLlvmProgramSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmProgramSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmProgramSsaMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmProgramSsaMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmProgramSsaMainRel}"
  unless (!slakeTypecheckLlvmProgramSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmProgramSsaMain.main args
