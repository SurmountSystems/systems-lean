/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmGraphTextMain.
  Short role: named driver for just slake-typecheck-llvmgraphtextmain.
  Ready is HostFrontLiveLlvmGraphTextMainParse parse plus HostKernel.kernelCheck
  of live LlvmGraphTextMain.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmGraphTextMain.
  liveRel is LlvmGraphTextMain.lean.
  This wrap is LlvmGraphTextMain.lean. It is not LlvmGraphText.lean.
  It is not HostFrontLiveLlvmHold.lean.
  Not a full LLVM backend. FullBackend stays false.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-GRAPH-TEXT-MAIN,
  SLAKE_TYPECHECK_LLVM_GRAPH_TEXT_MAIN_V0,
  slake-typecheck-llvmgraphtextmain,
  slakeTypecheckLlvmGraphTextMainReady,
  kernelCheckLiveLlvmGraphTextMainSource,
  PARSE-LIVE-LLVM-GRAPH-TEXT-MAIN.
  Module: SystemsLean.SlakeTypecheckLlvmGraphTextMain
  Checkable writer: just slake-typecheck-llvmgraphtextmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmGraphTextMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_GRAPH_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-GRAPH-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmGraphTextMain. -/
def justRecipeSlakeTypecheckLlvmGraphTextMain : String :=
  "slake-typecheck-llvmgraphtextmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveLlvmGraphTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmGraphTextMain.liveRel

/-- Ready names HostFrontLiveLlvmGraphTextMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmGraphTextMainReady,
    kernelCheckLiveLlvmGraphTextMainSource. -/
def slakeTypecheckLlvmGraphTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmGraphTextMainParse.hostFrontLiveLlvmGraphTextMainReady

/-- Honesty: this command is not lake build of LlvmGraphTextMain. -/
def slakeTypecheckLlvmGraphTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmGraphTextMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a full LLVM backend. -/
def slakeTypecheckLlvmGraphTextMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmGraphTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmGraphTextMain.lean.
    Ready is HostFrontLiveLlvmGraphTextMainParse.hostFrontLiveLlvmGraphTextMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmGraphTextMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmGraphTextMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmGraphTextMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmGraphTextMainRel}"
  unless (!slakeTypecheckLlvmGraphTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphTextMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmGraphTextMainParse.main args
