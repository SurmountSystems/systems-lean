/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmTypesText.
  Short role: named driver for the closed LlvmTypesText check.
  Ready is HostFrontLiveLlvmTypesText parse plus HostKernel.kernelCheck
  of live LlvmTypesText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmTypesText.
  liveRel is LlvmTypesText.lean.
  This wrap is LlvmTypesText.lean. It is not LlvmHold.lean.
  It is not LlvmLinearText.lean. It is not LlvmMultText.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-TYPES-TEXT,
  SLAKE_TYPECHECK_LLVM_TYPES_TEXT, slake-typecheck-llvmtypestext,
  slakeTypecheckLlvmTypesTextReady,
  kernelCheckLiveLlvmTypesTextSource,
  PARSE-LIVE-LLVM-TYPES-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmTypesText
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmTypesText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_TYPES_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-TYPES-TEXT"

/-- Named check. Not lake build SystemsLean.LlvmTypesText. -/
def justRecipeSlakeTypecheckLlvmTypesText : String :=
  "slake-typecheck-llvmtypestext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmTypesTextRel : String :=
  SystemsLean.HostFrontLiveLlvmTypesText.liveLlvmTypesTextRel

/-- Ready names HostFrontLiveLlvmTypesText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmTypesTextReady,
    kernelCheckLiveLlvmTypesTextSource. -/
def slakeTypecheckLlvmTypesTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmTypesText.hostFrontLiveLlvmTypesTextReady

/-- Honesty: this command is not lake build of LlvmTypesText. -/
def slakeTypecheckLlvmTypesTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmTypesTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmTypesTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmTypesTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmTypesText.lean.
    Ready is HostFrontLiveLlvmTypesText.hostFrontLiveLlvmTypesTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmTypesText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmTypesText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmTypesText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmTypesTextRel}"
  IO.println s!"FullHost={slakeTypecheckLlvmTypesTextFullHost} FullBackend={slakeTypecheckLlvmTypesTextFullBackend}"
  unless (!slakeTypecheckLlvmTypesTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmTypesText.main args
