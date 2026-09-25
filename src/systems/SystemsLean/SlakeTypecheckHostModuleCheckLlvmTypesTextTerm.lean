/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmTypesTextTerm.
  Short role: named driver for the HostModuleCheckLlvmTypesTextTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckLlvmTypesTextTerm parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckLlvmTypesTextTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckLlvmTypesTextTerm.
  liveRel is HostModuleCheckLlvmTypesTextTerm.lean.
  This wrap is HostModuleCheckLlvmTypesTextTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-TYPES-TEXT-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_TYPES_TEXT_TERM,
  slake-typecheck-hostmodulecheckllvmtypestextterm,
  slakeTypecheckHostModuleCheckLlvmTypesTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmTypesTextTermSource,
  PARSE-LIVE-LLVMTYPESTEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmTypesTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmTypesTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTermSource
import SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_TYPES_TEXT_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-TYPES-TEXT-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmTypesTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmtypestextterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckLlvmTypesTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm.liveHostModuleCheckLlvmTypesTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmTypesTextTermReady. -/
def slakeTypecheckHostModuleCheckLlvmTypesTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm.hostFrontLiveHostModuleCheckLlvmTypesTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmTypesTextTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmTypesTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckLlvmTypesTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmTypesTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmTypesTextTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmTypesTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmTypesTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmTypesTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmTypesTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmTypesTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmTypesTextTerm.main args
