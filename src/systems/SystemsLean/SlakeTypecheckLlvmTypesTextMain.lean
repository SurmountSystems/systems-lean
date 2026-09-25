/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmTypesTextMain.
  Short role: named driver for just slake-typecheck-llvmtypestextmain.
  Ready is HostFrontLiveLlvmTypesTextMainParse parse plus HostKernel.kernelCheck
  of live LlvmTypesTextMain.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmTypesTextMain.
  liveRel is LlvmTypesTextMain.lean.
  This wrap is LlvmTypesTextMain.lean. It is not LlvmTypesText.lean.
  It is not HostFrontLiveLlvmHold.lean.
  Not a full LLVM backend. FullBackend stays false.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-TYPES-TEXT-MAIN,
  SLAKE_TYPECHECK_LLVM_TYPES_TEXT_MAIN_V0,
  slake-typecheck-llvmtypestextmain,
  slakeTypecheckLlvmTypesTextMainReady,
  kernelCheckLiveLlvmTypesTextMainSource,
  PARSE-LIVE-LLVM-TYPES-TEXT-MAIN.
  Module: SystemsLean.SlakeTypecheckLlvmTypesTextMain
  Checkable writer: just slake-typecheck-llvmtypestextmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmTypesTextMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_TYPES_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-TYPES-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmTypesTextMain. -/
def justRecipeSlakeTypecheckLlvmTypesTextMain : String :=
  "slake-typecheck-llvmtypestextmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveLlvmTypesTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmTypesTextMain.liveRel

/-- Ready names HostFrontLiveLlvmTypesTextMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmTypesTextMainReady,
    kernelCheckLiveLlvmTypesTextMainSource. -/
def slakeTypecheckLlvmTypesTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmTypesTextMainParse.hostFrontLiveLlvmTypesTextMainReady

/-- Honesty: this command is not lake build of LlvmTypesTextMain. -/
def slakeTypecheckLlvmTypesTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmTypesTextMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a full LLVM backend. -/
def slakeTypecheckLlvmTypesTextMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmTypesTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmTypesTextMain.lean.
    Ready is HostFrontLiveLlvmTypesTextMainParse.hostFrontLiveLlvmTypesTextMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmTypesTextMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmTypesTextMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmTypesTextMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmTypesTextMainRel}"
  unless (!slakeTypecheckLlvmTypesTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesTextMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmTypesTextMainParse.main args
