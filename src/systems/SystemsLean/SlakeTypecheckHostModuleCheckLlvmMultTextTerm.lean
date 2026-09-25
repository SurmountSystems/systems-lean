/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLlvmMultTextTerm.
  Short role: named driver for the HostModuleCheckLlvmMultTextTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckLlvmMultTextTerm parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckLlvmMultTextTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckLlvmMultTextTerm.
  liveRel is HostModuleCheckLlvmMultTextTerm.lean.
  This wrap is HostModuleCheckLlvmMultTextTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-MULT-TEXT-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_MULT_TEXT_TERM,
  slake-typecheck-hostmodulecheckllvmmulttextterm,
  slakeTypecheckHostModuleCheckLlvmMultTextTermReady,
  kernelCheckLiveHostModuleCheckLlvmMultTextTermSource,
  PARSE-LIVE-LLVMMULTTEXTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLlvmMultTextTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLlvmMultTextTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTermSource
import SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTerm

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LLVM_MULT_TEXT_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LLVM-MULT-TEXT-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckLlvmMultTextTerm : String :=
  "slake-typecheck-hostmodulecheckllvmmulttextterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckLlvmMultTextTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTerm.liveHostModuleCheckLlvmMultTextTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLlvmMultTextTermReady. -/
def slakeTypecheckHostModuleCheckLlvmMultTextTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTerm.hostFrontLiveHostModuleCheckLlvmMultTextTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLlvmMultTextTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLlvmMultTextTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckLlvmMultTextTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLlvmMultTextTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckLlvmMultTextTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLlvmMultTextTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmMultTextTermRel}"
  unless (!slakeTypecheckHostModuleCheckLlvmMultTextTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmMultTextTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLlvmMultTextTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLlvmMultTextTerm.main args
