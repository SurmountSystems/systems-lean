/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmComposeText.
  Short role: named driver for just slake-typecheck-llvmcomposetext.
  Ready is HostFrontLiveLlvmComposeText parse plus HostKernel.kernelCheck
  of live LlvmComposeText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmComposeText.
  liveRel is LlvmComposeText.lean.
  This wrap is LlvmComposeText.lean. It is not LlvmComposeTextTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-TEXT,
  SLAKE_TYPECHECK_LLVM_COMPOSE_TEXT, slake-typecheck-llvmcomposetext,
  slakeTypecheckLlvmComposeTextReady,
  kernelCheckLiveLlvmComposeTextSource,
  PARSE-LIVE-LLVM-COMPOSE-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmComposeText
  Checkable writer: just slake-typecheck-llvmcomposetext
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmComposeText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_COMPOSE_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-TEXT"

/-- Named just recipe. Not lake build SystemsLean.LlvmComposeText. -/
def justRecipeSlakeTypecheckLlvmComposeText : String :=
  "slake-typecheck-llvmcomposetext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeTextRel : String :=
  SystemsLean.HostFrontLiveLlvmComposeText.liveLlvmComposeTextRel

/-- Ready names HostFrontLiveLlvmComposeText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmComposeTextReady,
    kernelCheckLiveLlvmComposeTextSource. -/
def slakeTypecheckLlvmComposeTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmComposeText.hostFrontLiveLlvmComposeTextReady

/-- Honesty: this command is not lake build of LlvmComposeText. -/
def slakeTypecheckLlvmComposeTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmComposeTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmComposeTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmComposeTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmComposeText.lean.
    Ready is HostFrontLiveLlvmComposeText.hostFrontLiveLlvmComposeTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmComposeText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmComposeText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmComposeText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmComposeTextRel}"
  unless (!slakeTypecheckLlvmComposeTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmComposeText.main args
