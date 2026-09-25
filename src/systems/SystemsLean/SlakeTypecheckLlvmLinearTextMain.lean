/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmLinearTextMain.
  Short role: named driver for just slake-typecheck-llvmlineartextmain.
  Ready is HostFrontLiveLlvmLinearTextMainSource parse plus HostKernel.kernelCheck
  of live LlvmLinearTextMain.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmLinearTextMain.
  liveRel is LlvmLinearTextMain.lean.
  This wrap is LlvmLinearTextMain.lean. It is not LlvmLinearText.lean.
  The checker accepts the Main source. The forwarder only calls the neighbor.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-LINEAR-TEXT-MAIN,
  SLAKE_TYPECHECK_LLVM_LINEAR_TEXT_MAIN_V0,
  slake-typecheck-llvmlineartextmain,
  slakeTypecheckLlvmLinearTextMainReady,
  kernelCheckLiveLlvmLinearTextMainSource,
  PARSE-LIVE-LLVM-LINEAR-TEXT-MAIN.
  Module: SystemsLean.SlakeTypecheckLlvmLinearTextMain
  Checkable writer: just slake-typecheck-llvmlineartextmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmLinearTextMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_LINEAR_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-LINEAR-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmLinearTextMain. -/
def justRecipeSlakeTypecheckLlvmLinearTextMain : String :=
  "slake-typecheck-llvmlineartextmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveLlvmLinearTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmLinearTextMainSource.liveRel

/-- Ready names HostFrontLiveLlvmLinearTextMainSource parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmLinearTextMainReady,
    kernelCheckLiveLlvmLinearTextMainSource. -/
def slakeTypecheckLlvmLinearTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmLinearTextMainSource.hostFrontLiveLlvmLinearTextMainReady

/-- Honesty: this command is not lake build of LlvmLinearTextMain. -/
def slakeTypecheckLlvmLinearTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmLinearTextMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmLinearTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmLinearTextMain.lean.
    Ready is HostFrontLiveLlvmLinearTextMainSource.hostFrontLiveLlvmLinearTextMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmLinearTextMainSource.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmLinearTextMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmLinearTextMainSource.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmLinearTextMainRel}"
  unless (!slakeTypecheckLlvmLinearTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmLinearTextMainSource.main args
