/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmLinearSsa.
  Short role: named driver for just slake-typecheck-llvmlinearssa.
  Ready is HostFrontLiveLlvmLinearSsa parse plus HostKernel.kernelCheck
  of live LlvmLinearSsa.lean, not := true, not lake build
  SystemsLean.LlvmLinearSsa.
  Not mill 62 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not Linear.lean (QTT Linear module). Not IrGraph.lean.
  Not ComposeSubsetEmit.lean. Not a mill remill.
  Parses the library LlvmLinearSsa.lean. Does not replace the mill entry.
  Unique needles (trailing newline, each once in LlvmLinearSsa.lean):
  import SystemsLean.KernelLinear
  namespace SystemsLean.LlvmLinearSsa
  def stageId : String := "SLAKE_LLVM_LINEAR_SSA_V0"
  def hostId : String := "HOST-LLVM-LINEAR-SSA"
  def llvmLinearSsaFullBackendClaimed : Bool := false
  def linearSsaBasename : String := "slake_linear_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmLinearSsa
  HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA
  slake-typecheck-llvmlinearssa
  PARSE-LIVE-LLVM-LINEAR-SSA
  LLVM-LINEAR-SSA
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmlinearssa,
  slakeTypecheckLlvmLinearSsaReady,
  kernelCheckLiveLlvmLinearSsaSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmLinearSsa
  Checkable writer: just slake-typecheck-llvmlinearssa
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmLinearSsa

/-- Greppable stage id. Hyphenated. Distinct from LLVM-LINEAR-SSA-MAIN. -/
def stageId : String := "LLVM-LINEAR-SSA"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA"

/-- Named just recipe. Not lake build SystemsLean.LlvmLinearSsa. -/
def justRecipeSlakeTypecheckLlvmLinearSsa : String :=
  "slake-typecheck-llvmlinearssa"

/-- Live file relative to repo root. Dual-pin path. Library, not the mill entry. -/
def liveLlvmLinearSsaRel : String :=
  SystemsLean.HostFrontLiveLlvmLinearSsa.liveLlvmLinearSsaRel

/-- Ready names HostFrontLiveLlvmLinearSsa parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmLinearSsaReady,
    kernelCheckLiveLlvmLinearSsaSource. -/
def slakeTypecheckLlvmLinearSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmLinearSsa.hostFrontLiveLlvmLinearSsaReady

/-- Honesty: this command is not lake build of LlvmLinearSsa. -/
def slakeTypecheckLlvmLinearSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmLinearSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmLinearSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmLinearSsaOwnsPackageTypecheck : Bool := false

/-- Dests are not written on this closed-subset run. -/
def slakeTypecheckLlvmLinearSsaDestsSkipped : Bool := true

/-- lean --run entry: parse plus kernelCheck live LlvmLinearSsa.lean.
    Ready is HostFrontLiveLlvmLinearSsa.hostFrontLiveLlvmLinearSsaReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmLinearSsa.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmLinearSsa} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmLinearSsa.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmLinearSsaRel}"
  IO.println "dests skipped"
  unless slakeTypecheckLlvmLinearSsaDestsSkipped do
    IO.eprintln "error: dests must stay skipped"
    return 1
  unless (!slakeTypecheckLlvmLinearSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmLinearSsa.main args
