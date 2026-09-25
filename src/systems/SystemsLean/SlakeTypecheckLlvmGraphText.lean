/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmGraphText.
  Short role: named driver for the closed LlvmGraphText check.
  Ready is HostFrontLiveLlvmGraphText parse plus HostKernel.kernelCheck
  of live LlvmGraphText.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmGraphText.
  liveRel is LlvmGraphText.lean.
  This wrap is LlvmGraphText.lean. It is not LlvmHold.lean.
  It is not LlvmTypesText.lean. It is not LlvmProgramText.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Not Lake-gone.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-GRAPH-TEXT,
  SLAKE_TYPECHECK_LLVM_GRAPH_TEXT, slake-typecheck-llvmgraphtext,
  slakeTypecheckLlvmGraphTextReady,
  kernelCheckLiveLlvmGraphTextSource,
  PARSE-LIVE-LLVM-GRAPH-TEXT.
  Module: SystemsLean.SlakeTypecheckLlvmGraphText
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmGraphText

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_GRAPH_TEXT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-GRAPH-TEXT"

/-- Named check. Not lake build SystemsLean.LlvmGraphText. -/
def justRecipeSlakeTypecheckLlvmGraphText : String :=
  "slake-typecheck-llvmgraphtext"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmGraphTextRel : String :=
  SystemsLean.HostFrontLiveLlvmGraphText.liveLlvmGraphTextRel

/-- Ready names HostFrontLiveLlvmGraphText parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmGraphTextReady,
    kernelCheckLiveLlvmGraphTextSource. -/
def slakeTypecheckLlvmGraphTextReady : Bool :=
  SystemsLean.HostFrontLiveLlvmGraphText.hostFrontLiveLlvmGraphTextReady

/-- Honesty: this command is not lake build of LlvmGraphText. -/
def slakeTypecheckLlvmGraphTextDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmGraphTextFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmGraphTextFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmGraphTextOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmGraphText.lean.
    Ready is HostFrontLiveLlvmGraphText.hostFrontLiveLlvmGraphTextReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmGraphText.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmGraphText} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmGraphText.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmGraphTextRel}"
  IO.println s!"FullHost={slakeTypecheckLlvmGraphTextFullHost} FullBackend={slakeTypecheckLlvmGraphTextFullBackend}"
  unless (!slakeTypecheckLlvmGraphTextFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphTextFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmGraphTextOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmGraphText.main args
