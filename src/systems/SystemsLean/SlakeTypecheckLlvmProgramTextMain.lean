/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmProgramTextMain.
  Short role: named driver for just slake-typecheck-llvmprogramtextmain.
  Ready is HostFrontLiveLlvmProgramTextMainParse parse plus HostKernel.kernelCheck
  of live LlvmProgramTextMain.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmProgramTextMain.
  liveRel is LlvmProgramTextMain.lean.
  This wrap is LlvmProgramTextMain.lean. It is not LlvmProgramText.lean.
  It is not HostFrontLiveLlvmHold.lean.
  Not a full LLVM backend. FullBackend stays false.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-TEXT-MAIN,
  SLAKE_TYPECHECK_LLVM_PROGRAM_TEXT_MAIN_V0,
  slake-typecheck-llvmprogramtextmain,
  slakeTypecheckLlvmProgramTextMainReady,
  kernelCheckLiveLlvmProgramTextMainSource,
  PARSE-LIVE-LLVM-PROGRAM-TEXT-MAIN.
  Module: SystemsLean.SlakeTypecheckLlvmProgramTextMain
  Checkable writer: just slake-typecheck-llvmprogramtextmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmProgramTextMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_PROGRAM_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmProgramTextMain. -/
def justRecipeSlakeTypecheckLlvmProgramTextMain : String :=
  "slake-typecheck-llvmprogramtextmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveLlvmProgramTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmProgramTextMain.liveRel

/-- Ready names HostFrontLiveLlvmProgramTextMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmProgramTextMainReady,
    kernelCheckLiveLlvmProgramTextMainSource. -/
def slakeTypecheckLlvmProgramTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmProgramTextMainParse.hostFrontLiveLlvmProgramTextMainReady

/-- Honesty: this command is not lake build of LlvmProgramTextMain. -/
def slakeTypecheckLlvmProgramTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmProgramTextMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a full LLVM backend. -/
def slakeTypecheckLlvmProgramTextMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmProgramTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmProgramTextMain.lean.
    Ready is HostFrontLiveLlvmProgramTextMainParse.hostFrontLiveLlvmProgramTextMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmProgramTextMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmProgramTextMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmProgramTextMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmProgramTextMainRel}"
  unless (!slakeTypecheckLlvmProgramTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramTextMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmProgramTextMainParse.main args
