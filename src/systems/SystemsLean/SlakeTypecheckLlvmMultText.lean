/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmMultText.
  Short role: named driver for just slake-typecheck-llvmmulttext.
  Ready is HostFrontLiveLlvmMultText parse plus HostKernel.kernelCheck
  of live LlvmMultText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmMultText.
  liveRel is LlvmMultText.lean.
  This wrap is LlvmMultText.lean. It is not LlvmMultTextTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-MULT-TEXT,
  SLAKE_TYPECHECK_LLVM_MULT_TEXT, slake-typecheck-llvmmulttext,
  slakeTypecheckLlvmMultTextReady,
  kernelCheckLiveLlvmMultTextSource,
  PARSE-LIVE-LLVM-MULT-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmMultText
  Checkable writer: just slake-typecheck-llvmmulttext
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmMultText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_MULT_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-MULT-TEXT"

/-- Named just recipe. Not lake build SystemsLean.LlvmMultText. -/
def justRecipeSlakeTypecheckLlvmMultText : String :=
  "slake-typecheck-llvmmulttext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmMultTextRel : String :=
  SystemsLean.HostFrontLiveLlvmMultText.liveLlvmMultTextRel

/-- Ready names HostFrontLiveLlvmMultText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmMultTextReady,
    kernelCheckLiveLlvmMultTextSource. -/
def slakeTypecheckLlvmMultTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmMultText.hostFrontLiveLlvmMultTextReady

/-- Honesty: this command is not lake build of LlvmMultText. -/
def slakeTypecheckLlvmMultTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmMultTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmMultTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmMultTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmMultText.lean.
    Ready is HostFrontLiveLlvmMultText.hostFrontLiveLlvmMultTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmMultText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmMultText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmMultText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmMultTextRel}"
  unless (!slakeTypecheckLlvmMultTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmMultText.main args
