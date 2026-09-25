/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmGraphSsa.
  Short role: named driver for lean --run of this module.
  Ready is HostFrontLiveLlvmGraphSsa parse plus HostKernel.kernelCheck
  of live LlvmGraphSsa.lean, not := true, not lake build
  SystemsLean.LlvmGraphSsa.
  liveRel is the bare basename LlvmGraphSsa.lean, not a path.
  Not mill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not Linear.lean. Not IrGraph.lean. Not LlvmGraphSsaMain.lean.
  Parses the library LlvmGraphSsa.lean. Does not replace the mill entry.
  Unique needles (trailing newline, each once in LlvmGraphSsa.lean):
  import SystemsLean.KernelProgram
  namespace SystemsLean.LlvmGraphSsa
  def stageId : String := "SLAKE_LLVM_GRAPH_SSA_V0"
  def hostId : String := "HOST-LLVM-GRAPH-SSA"
  def llvmGraphSsaFullBackendClaimed : Bool := false
  def graphSsaBasename : String := "slake_graph_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmGraphSsa
  HOST-SLAKE-TYPECHECK-LLVM-GRAPH-SSA
  slake-typecheck-llvmgraphssa
  PARSE-LIVE-LLVM-GRAPH-SSA
  LLVM-GRAPH-SSA
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmgraphssa,
  slakeTypecheckLlvmGraphSsaReady,
  kernelCheckLiveLlvmGraphSsaSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmGraphSsa
  Checkable writer: lean --run of this driver
  (no mill; no lake). Dests skipped this slice.
  No just module is added. Run is direct lean --run.
-/

import SystemsLean.HostFrontLiveLlvmGraphSsa

/-- Greppable stage id. Hyphenated. Distinct from LLVM-GRAPH-SSA-MAIN. -/
def stageId : String := "LLVM-GRAPH-SSA"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-GRAPH-SSA"

/-- Closed-check id. Not lake build SystemsLean.LlvmGraphSsa.
    Not a just module this slice. -/
def justRecipeSlakeTypecheckLlvmGraphSsa : String :=
  "slake-typecheck-llvmgraphssa"

/-- Live file relative to repo root. Dual-pin path. Library, not the mill entry. -/
def liveLlvmGraphSsaRel : String :=
  SystemsLean.HostFrontLiveLlvmGraphSsa.liveLlvmGraphSsaRel

/-- Ready names HostFrontLiveLlvmGraphSsa parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmGraphSsaReady,
    kernelCheckLiveLlvmGraphSsaSource. -/
def slakeTypecheckLlvmGraphSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmGraphSsa.hostFrontLiveLlvmGraphSsaReady

/-- Honesty: this command is not lake build of LlvmGraphSsa. -/
def slakeTypecheckLlvmGraphSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmGraphSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmGraphSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmGraphSsaOwnsPackageTypecheck : Bool := false

/-- Dests are not written on this closed-subset run. -/
def slakeTypecheckLlvmGraphSsaDestsSkipped : Bool := true

/-- lean --run entry: parse plus kernelCheck live LlvmGraphSsa.lean.
    Ready is HostFrontLiveLlvmGraphSsa.hostFrontLiveLlvmGraphSsaReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmGraphSsa.main at runtime.
    kernelCheck is HostKernel.kernelCheck, not a constant true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmGraphSsa} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmGraphSsa.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmGraphSsaRel}"
  IO.println "dests skipped"
  unless slakeTypecheckLlvmGraphSsaDestsSkipped do
    IO.eprintln "error: dests must stay skipped"
    return 1
  unless (!slakeTypecheckLlvmGraphSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmGraphSsa.main args
