/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmLinearText.
  Short role: named driver for the closed LlvmLinearText check.
  Ready is HostFrontLiveLlvmLinearText parse plus HostKernel.kernelCheck
  of live LlvmLinearText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmLinearText.
  liveRel is LlvmLinearText.lean.
  This wrap is LlvmLinearText.lean. It is not a theorems peel.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-LINEAR-TEXT,
  SLAKE_TYPECHECK_LLVM_LINEAR_TEXT, slake-typecheck-llvmlineartext,
  slakeTypecheckLlvmLinearTextReady,
  kernelCheckLiveLlvmLinearTextSource,
  PARSE-LIVE-LLVM-LINEAR-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmLinearText
  Checkable writer: lean --run of this module (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmLinearText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_LINEAR_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-LINEAR-TEXT"

/-- Named closed check. Not lake build SystemsLean.LlvmLinearText. -/
def justRecipeSlakeTypecheckLlvmLinearText : String :=
  "slake-typecheck-llvmlineartext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmLinearTextRel : String :=
  SystemsLean.HostFrontLiveLlvmLinearText.liveLlvmLinearTextRel

/-- Ready names HostFrontLiveLlvmLinearText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmLinearTextReady,
    kernelCheckLiveLlvmLinearTextSource. -/
def slakeTypecheckLlvmLinearTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmLinearText.hostFrontLiveLlvmLinearTextReady

/-- Honesty: this command is not lake build of LlvmLinearText. -/
def slakeTypecheckLlvmLinearTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmLinearTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmLinearTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmLinearTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmLinearText.lean.
    Ready is HostFrontLiveLlvmLinearText.hostFrontLiveLlvmLinearTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmLinearText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmLinearText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmLinearText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmLinearTextRel}"
  unless (!slakeTypecheckLlvmLinearTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmLinearText.main args
