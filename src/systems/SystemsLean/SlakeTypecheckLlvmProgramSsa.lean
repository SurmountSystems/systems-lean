/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmProgramSsa.
  Short role: named driver for just slake-typecheck-llvmprogramssa.
  Ready is HostFrontLiveLlvmProgramSsa parse plus HostKernel.kernelCheck
  of live LlvmProgramSsa.lean, not := true, not lake build
  SystemsLean.LlvmProgramSsa.
  Not mill 62 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not Linear.lean (QTT Linear module). Not IrGraph.lean.
  Not ComposeSubsetEmit.lean. Not a mill remill.
  Parses the library LlvmProgramSsa.lean. Does not replace the mill entry.
  Unique needles (trailing newline, each once in LlvmProgramSsa.lean):
  namespace SystemsLean.LlvmProgramSsa
  def stageId : String := "SLAKE_LLVM_PROGRAM_SSA_V0"
  def hostId : String := "HOST-LLVM-PROGRAM-SSA"
  def llvmProgramSsaFullBackendClaimed : Bool := false
  def programSsaBasename : String := "slake_program_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmProgramSsa
  HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-SSA
  slake-typecheck-llvmprogramssa
  PARSE-LIVE-LLVM-PROGRAM-SSA
  LLVM-PROGRAM-SSA
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmprogramssa,
  slakeTypecheckLlvmProgramSsaReady,
  kernelCheckLiveLlvmProgramSsaSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmProgramSsa
  Checkable writer: just slake-typecheck-llvmprogramssa
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmProgramSsa

/-- Greppable stage id. Hyphenated. Distinct from LLVM-PROGRAM-SSA-MAIN. -/
def stageId : String := "LLVM-PROGRAM-SSA"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-SSA"

/-- Named just recipe. Not lake build SystemsLean.LlvmProgramSsa. -/
def justRecipeSlakeTypecheckLlvmProgramSsa : String :=
  "slake-typecheck-llvmprogramssa"

/-- Live file basename. Not a src/systems path. -/
def liveRel : String := "LlvmProgramSsa.lean"

/-- Same basename as liveRel. -/
def liveLlvmProgramSsaRel : String := liveRel

/-- Ready names HostFrontLiveLlvmProgramSsa parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmProgramSsaReady,
    kernelCheckLiveLlvmProgramSsaSource. -/
def slakeTypecheckLlvmProgramSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmProgramSsa.hostFrontLiveLlvmProgramSsaReady

/-- Honesty: this command is not lake build of LlvmProgramSsa. -/
def slakeTypecheckLlvmProgramSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmProgramSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmProgramSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmProgramSsaOwnsPackageTypecheck : Bool := false

/-- Dests are not written on this closed-subset run. -/
def slakeTypecheckLlvmProgramSsaDestsSkipped : Bool := true

/-- lean --run entry: parse plus kernelCheck live LlvmProgramSsa.lean.
    Ready is HostFrontLiveLlvmProgramSsa.hostFrontLiveLlvmProgramSsaReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmProgramSsa.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmProgramSsa} =="
  IO.println s!"  host={hostId} file={liveLlvmProgramSsaRel}"
  IO.println "dests skipped"
  unless slakeTypecheckLlvmProgramSsaDestsSkipped do
    IO.eprintln "error: dests must stay skipped"
    return 1
  unless (!slakeTypecheckLlvmProgramSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless liveRel == "LlvmProgramSsa.lean" do
    IO.eprintln "error: liveRel must be the bare basename"
    return 1
  unless liveLlvmProgramSsaRel == liveRel do
    IO.eprintln "error: liveLlvmProgramSsaRel must equal liveRel"
    return 1
  unless liveRel == SystemsLean.HostFrontLiveLlvmProgramSsa.liveRel do
    IO.eprintln "error: driver liveRel != parser liveRel"
    return 1
  SystemsLean.HostFrontLiveLlvmProgramSsa.main args
