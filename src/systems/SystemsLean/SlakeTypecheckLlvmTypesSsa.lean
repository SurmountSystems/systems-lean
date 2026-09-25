/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmTypesSsa.
  Short role: named driver for just slake-typecheck-llvmtypessa.
  Ready is HostFrontLiveLlvmTypesSsa parse plus HostKernel.kernelCheck
  of live LlvmTypesSsa.lean, not := true, not lake build
  SystemsLean.LlvmTypesSsa.
  liveRel is the bare basename LlvmTypesSsa.lean, not a path.
  Not mill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not Linear.lean. Not IrGraph.lean. Not LlvmTypesSsaMain.lean.
  Parses the library LlvmTypesSsa.lean. Does not replace the mill entry.
  Unique needles (trailing newline, each once in LlvmTypesSsa.lean):
  import SystemsLean.KernelTypes
  namespace SystemsLean.LlvmTypesSsa
  def stageId : String := "SLAKE_LLVM_TYPES_SSA_V0"
  def hostId : String := "HOST-LLVM-TYPES-SSA"
  def llvmTypesSsaFullBackendClaimed : Bool := false
  def typesSsaBasename : String := "slake_types_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmTypesSsa
  HOST-SLAKE-TYPECHECK-LLVM-TYPES-SSA
  slake-typecheck-llvmtypessa
  PARSE-LIVE-LLVM-TYPES-SSA
  LLVM-TYPES-SSA
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmtypessa,
  slakeTypecheckLlvmTypesSsaReady,
  kernelCheckLiveLlvmTypesSsaSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmTypesSsa
  Checkable writer: lean --run of this driver
  (no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmTypesSsa

/-- Greppable stage id. Hyphenated. Distinct from LLVM-TYPES-SSA-MAIN. -/
def stageId : String := "LLVM-TYPES-SSA"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-TYPES-SSA"

/-- Named recipe. Not lake build SystemsLean.LlvmTypesSsa. -/
def justRecipeSlakeTypecheckLlvmTypesSsa : String :=
  "slake-typecheck-llvmtypessa"

/-- Live file relative to repo root. Dual-pin path. Library, not the mill entry. -/
def liveLlvmTypesSsaRel : String :=
  SystemsLean.HostFrontLiveLlvmTypesSsa.liveLlvmTypesSsaRel

/-- Ready names HostFrontLiveLlvmTypesSsa parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmTypesSsaReady,
    kernelCheckLiveLlvmTypesSsaSource. -/
def slakeTypecheckLlvmTypesSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmTypesSsa.hostFrontLiveLlvmTypesSsaReady

/-- Honesty: this command is not lake build of LlvmTypesSsa. -/
def slakeTypecheckLlvmTypesSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmTypesSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmTypesSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmTypesSsaOwnsPackageTypecheck : Bool := false

/-- Dests are not written on this closed-subset run. -/
def slakeTypecheckLlvmTypesSsaDestsSkipped : Bool := true

/-- lean --run entry: parse plus kernelCheck live LlvmTypesSsa.lean.
    Ready is HostFrontLiveLlvmTypesSsa.hostFrontLiveLlvmTypesSsaReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmTypesSsa.main at runtime.
    kernelCheck is HostKernel.kernelCheck, not a constant true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmTypesSsa} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmTypesSsa.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmTypesSsaRel}"
  IO.println "dests skipped"
  unless slakeTypecheckLlvmTypesSsaDestsSkipped do
    IO.eprintln "error: dests must stay skipped"
    return 1
  unless (!slakeTypecheckLlvmTypesSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmTypesSsa.main args
