/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmMultSsa.
  Short role: named driver for just slake-typecheck-llvmmultssa.
  Ready is HostFrontLiveLlvmMultSsa parse plus HostKernel.kernelCheck
  of live LlvmMultSsa.lean, not := true, not lake build
  SystemsLean.LlvmMultSsa.
  Not mill 61 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not the mill Main wrap HostFrontLiveLlvmMultSsaMain.
  Not LlvmLinearSsa. Not IrGraph. Not Linear.lean. Not ComposeSubsetEmit.lean.
  Unique needles (trailing newline so SlakeTypecheckLlvmMultSsa is not a prefix):
  SlakeTypecheckLlvmMultSsa
  HOST-SLAKE-TYPECHECK-LLVM-MULT-SSA
  SLAKE_TYPECHECK_LLVM_MULT_SSA_V0
  slake-typecheck-llvmmultssa
  PARSE-LIVE-LLVM-MULT-SSA
  LLVM-MULT-SSA
  HOST-FRONT-LIVE-LLVM-MULT-SSA
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmmultssa,
  slakeTypecheckLlvmMultSsaReady,
  kernelCheckLiveLlvmMultSsaSource.
  Module: SystemsLean.SlakeTypecheckLlvmMultSsa
  Checkable writer: just slake-typecheck-llvmmultssa
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmMultSsa

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_MULT_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-MULT-SSA"

/-- Named just recipe. Not lake build SystemsLean.LlvmMultSsa. -/
def justRecipeSlakeTypecheckLlvmMultSsa : String :=
  "slake-typecheck-llvmmultssa"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmMultSsaRel : String :=
  SystemsLean.HostFrontLiveLlvmMultSsa.liveLlvmMultSsaRel

/-- Ready names HostFrontLiveLlvmMultSsa parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmMultSsaReady,
    kernelCheckLiveLlvmMultSsaSource. -/
def slakeTypecheckLlvmMultSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmMultSsa.hostFrontLiveLlvmMultSsaReady

/-- Honesty: this command is not lake build of LlvmMultSsa. -/
def slakeTypecheckLlvmMultSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmMultSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmMultSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmMultSsaOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmMultSsa.lean.
    Ready is HostFrontLiveLlvmMultSsa.hostFrontLiveLlvmMultSsaReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmMultSsa.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmMultSsa} =="
  IO.println s!"  host={hostId} file={liveLlvmMultSsaRel}"
  unless (!slakeTypecheckLlvmMultSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmMultSsa.main args
