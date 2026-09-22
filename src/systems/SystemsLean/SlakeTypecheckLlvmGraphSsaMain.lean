/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmGraphSsaMain.
  Short role: named driver for just slake-typecheck-llvmgraphssamain.
  Ready is HostFrontLiveLlvmGraphSsaMain parse plus HostKernel.kernelCheck
  of live LlvmGraphSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmGraphSsaMain.
  Not mill 65 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not invent HostFrontLiveLlvmGraphSsa. Do not wrap IrGraph.lean.
  Unique needles (trailing newline so SlakeTypecheckLlvmGraphSsaMain is not a prefix):
  SlakeTypecheckLlvmGraphSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-GRAPH-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_GRAPH_SSA_MAIN_V0
  slake-typecheck-llvmgraphssamain
  PARSE-LIVE-LLVM-GRAPH-SSA-MAIN
  LLVM-GRAPH-SSA-MAIN
  HOST-LLVM-GRAPH-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmgraphssamain,
  slakeTypecheckLlvmGraphSsaMainReady,
  kernelCheckLiveLlvmGraphSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmGraphSsaMain
  Checkable writer: just slake-typecheck-llvmgraphssamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmGraphSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_GRAPH_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-GRAPH-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmGraphSsaMain. -/
def justRecipeSlakeTypecheckLlvmGraphSsaMain : String :=
  "slake-typecheck-llvmgraphssamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmGraphSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmGraphSsaMain.liveLlvmGraphSsaMainRel

/-- Ready names HostFrontLiveLlvmGraphSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmGraphSsaMainReady,
    kernelCheckLiveLlvmGraphSsaMainSource. -/
def slakeTypecheckLlvmGraphSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmGraphSsaMain.hostFrontLiveLlvmGraphSsaMainReady

/-- Honesty: this command is not lake build of LlvmGraphSsaMain. -/
def slakeTypecheckLlvmGraphSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmGraphSsaMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmGraphSsaMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmGraphSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmGraphSsaMain.lean.
    Ready is HostFrontLiveLlvmGraphSsaMain.hostFrontLiveLlvmGraphSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmGraphSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmGraphSsaMain} =="
  IO.println s!"  host={hostId} file={liveLlvmGraphSsaMainRel}"
  unless (!slakeTypecheckLlvmGraphSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphSsaMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmGraphSsaMain.main args
