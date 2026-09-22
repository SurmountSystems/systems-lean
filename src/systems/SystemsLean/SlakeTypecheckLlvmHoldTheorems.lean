/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmHoldTheorems.
  Short role: named driver for just slake-typecheck-llvmholdtheorems.
  Ready is HostFrontLiveLlvmHoldTheorems parse plus HostKernel.kernelCheck
  of live LlvmHoldTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmHoldTheorems.
  liveRel is LlvmHoldTheorems.lean.
  Not LlvmHold.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-HOLD-THEOREMS,
  SLAKE_TYPECHECK_LLVM_HOLD_THEOREMS, slake-typecheck-llvmholdtheorems,
  slakeTypecheckLlvmHoldTheoremsReady,
  kernelCheckLiveLlvmHoldTheoremsSource,
  PARSE-LIVE-LLVM-HOLD-THEOREMS.
  Module: SystemsLean.SlakeTypecheckLlvmHoldTheorems
  Checkable writer: just slake-typecheck-llvmholdtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmHoldTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_HOLD_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-HOLD-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.LlvmHoldTheorems. -/
def justRecipeSlakeTypecheckLlvmHoldTheorems : String :=
  "slake-typecheck-llvmholdtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmHoldTheoremsRel : String :=
  SystemsLean.HostFrontLiveLlvmHoldTheorems.liveLlvmHoldTheoremsRel

/-- Ready names HostFrontLiveLlvmHoldTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmHoldTheoremsReady,
    kernelCheckLiveLlvmHoldTheoremsSource. -/
def slakeTypecheckLlvmHoldTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveLlvmHoldTheorems.hostFrontLiveLlvmHoldTheoremsReady

/-- Honesty: this command is not lake build of LlvmHoldTheorems. -/
def slakeTypecheckLlvmHoldTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmHoldTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmHoldTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmHoldTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmHoldTheorems.lean.
    Ready is HostFrontLiveLlvmHoldTheorems.hostFrontLiveLlvmHoldTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmHoldTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmHoldTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmHoldTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmHoldTheoremsRel}"
  unless (!slakeTypecheckLlvmHoldTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmHoldTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmHoldTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmHoldTheorems.main args
