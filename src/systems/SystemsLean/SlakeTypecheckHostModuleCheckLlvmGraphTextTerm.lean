/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmGraphTextTerm.
  Short role: named driver for the HostModuleCheckLlvmGraphTextTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckLlvmGraphTextTerm parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckLlvmGraphTextTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckLlvmGraphTextTerm.
  liveRel is HostModuleCheckLlvmGraphTextTerm.lean.
  This wrap is HostModuleCheckLlvmGraphTextTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-GRAPH-TEXT-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_GRAPH_TEXT_TERM,
  slake-typecheck-hostmodulecheckllvmgraphtextterm,
  slakeTypecheckHostModuleCheckLlvmGraphTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmGraphTextTermSource,
  PARSE-LIVE-LLVMGRAPHTEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmGraphTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmGraphTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTermSource
import SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_GRAPH_TEXT_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-GRAPH-TEXT-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmGraphTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmgraphtextterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckLlvmGraphTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm.liveHostModuleCheckLlvmGraphTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmGraphTextTermReady. -/
def slakeTypecheckHostModuleCheckLlvmGraphTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm.hostFrontLiveHostModuleCheckLlvmGraphTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmGraphTextTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmGraphTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckLlvmGraphTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmGraphTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmGraphTextTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmGraphTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmGraphTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmGraphTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmGraphTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmGraphTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm.main args
