/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmHold.
  Short role: named driver for just slake-typecheck-llvmhold.
  Ready is HostFrontLiveLlvmHold parse plus HostKernel.kernelCheck
  of live LlvmHold.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmHold.
  liveRel is LlvmHold.lean.
  This wrap is LlvmHold.lean. It is not LlvmHoldTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-HOLD,
  SLAKE_TYPECHECK_LLVM_HOLD, slake-typecheck-llvmhold,
  slakeTypecheckLlvmHoldReady,
  kernelCheckLiveLlvmHoldSource,
  PARSE-LIVE-LLVM-HOLD.
  Module: SystemsLean.SlakeTypecheckLlvmHold
  Checkable writer: just slake-typecheck-llvmhold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmHold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_HOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-HOLD"

/-- Named just recipe. Not lake build SystemsLean.LlvmHold. -/
def justRecipeSlakeTypecheckLlvmHold : String :=
  "slake-typecheck-llvmhold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmHoldRel : String :=
  SystemsLean.HostFrontLiveLlvmHold.liveLlvmHoldRel

/-- Ready names HostFrontLiveLlvmHold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmHoldReady,
    kernelCheckLiveLlvmHoldSource. -/
def slakeTypecheckLlvmHoldReady : Bool :=
  SystemsLean.HostFrontLiveLlvmHold.hostFrontLiveLlvmHoldReady

/-- Honesty: this command is not lake build of LlvmHold. -/
def slakeTypecheckLlvmHoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmHoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmHoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmHoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmHold.lean.
    Ready is HostFrontLiveLlvmHold.hostFrontLiveLlvmHoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmHold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmHold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmHold.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmHoldRel}"
  unless (!slakeTypecheckLlvmHoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmHoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmHoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmHold.main args
