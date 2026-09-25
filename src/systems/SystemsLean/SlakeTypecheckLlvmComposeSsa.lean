/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmComposeSsa.
  Short role: named driver for just slake-typecheck-llvmcomposessa.
  Ready is HostFrontLiveLlvmComposeSsa parse plus HostKernel.kernelCheck
  of live LlvmComposeSsa.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmComposeSsa.
  liveRel is LlvmComposeSsa.lean.
  This wrap is LlvmComposeSsa.lean. It is not LlvmComposeSsaTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA,
  SLAKE_TYPECHECK_LLVM_COMPOSE_SSA, slake-typecheck-llvmcomposessa,
  slakeTypecheckLlvmComposeSsaReady,
  kernelCheckLiveLlvmComposeSsaSource,
  PARSE-LIVE-LLVM-COMPOSE-SSA.
  Module: SystemsLean.SlakeTypecheckLlvmComposeSsa
  Checkable writer: just slake-typecheck-llvmcomposessa
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmComposeSsa

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_COMPOSE_SSA"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA"

/-- Named just recipe. Not lake build SystemsLean.LlvmComposeSsa. -/
def justRecipeSlakeTypecheckLlvmComposeSsa : String :=
  "slake-typecheck-llvmcomposessa"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeSsaRel : String :=
  SystemsLean.HostFrontLiveLlvmComposeSsa.liveLlvmComposeSsaRel

/-- Ready names HostFrontLiveLlvmComposeSsa parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmComposeSsaReady,
    kernelCheckLiveLlvmComposeSsaSource. -/
def slakeTypecheckLlvmComposeSsaReady : Bool :=
  SystemsLean.HostFrontLiveLlvmComposeSsa.hostFrontLiveLlvmComposeSsaReady

/-- Honesty: this command is not lake build of LlvmComposeSsa. -/
def slakeTypecheckLlvmComposeSsaDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmComposeSsaFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmComposeSsaFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmComposeSsaOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmComposeSsa.lean.
    Ready is HostFrontLiveLlvmComposeSsa.hostFrontLiveLlvmComposeSsaReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmComposeSsa.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmComposeSsa} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmComposeSsa.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmComposeSsaRel}"
  unless (!slakeTypecheckLlvmComposeSsaFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeSsaFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeSsaOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmComposeSsa.main args
