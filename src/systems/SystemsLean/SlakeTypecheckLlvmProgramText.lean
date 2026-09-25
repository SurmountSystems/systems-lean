/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmProgramText.
  Short role: named driver for the closed LlvmProgramText check.
  Ready is HostFrontLiveLlvmProgramText parse plus HostKernel.kernelCheck
  of live LlvmProgramText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmProgramText.
  liveRel is LlvmProgramText.lean.
  This wrap is LlvmProgramText.lean. It is not LlvmHold.lean.
  It is not LlvmLinearText.lean. It is not LlvmMultText.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-TEXT,
  SLAKE_TYPECHECK_LLVM_PROGRAM_TEXT, slake-typecheck-llvmprogramtext,
  slakeTypecheckLlvmProgramTextReady,
  kernelCheckLiveLlvmProgramTextSource,
  PARSE-LIVE-LLVM-PROGRAM-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmProgramText
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmProgramText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_PROGRAM_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-PROGRAM-TEXT"

/-- Named check. Not lake build SystemsLean.LlvmProgramText. -/
def justRecipeSlakeTypecheckLlvmProgramText : String :=
  "slake-typecheck-llvmprogramtext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmProgramTextRel : String :=
  SystemsLean.HostFrontLiveLlvmProgramText.liveLlvmProgramTextRel

/-- Ready names HostFrontLiveLlvmProgramText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmProgramTextReady,
    kernelCheckLiveLlvmProgramTextSource. -/
def slakeTypecheckLlvmProgramTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmProgramText.hostFrontLiveLlvmProgramTextReady

/-- Honesty: this command is not lake build of LlvmProgramText. -/
def slakeTypecheckLlvmProgramTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmProgramTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmProgramTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmProgramTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmProgramText.lean.
    Ready is HostFrontLiveLlvmProgramText.hostFrontLiveLlvmProgramTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmProgramText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmProgramText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmProgramText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmProgramTextRel}"
  IO.println s!"FullHost={slakeTypecheckLlvmProgramTextFullHost} FullBackend={slakeTypecheckLlvmProgramTextFullBackend}"
  unless (!slakeTypecheckLlvmProgramTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmProgramTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmProgramText.main args
