/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSpecProofTerm.
  Short role: named driver for the HostModuleCheckSpecProofTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckSpecProofTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckSpecProofTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckSpecProofTerm.
  liveRel is HostModuleCheckSpecProofTerm.lean.
  This wrap is HostModuleCheckSpecProofTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SPEC-PROOF-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_SPEC_PROOF_TERM,
  slake-typecheck-hostmodulecheckspecprooffterm,
  slakeTypecheckHostModuleCheckSpecProofTermReady,
  kernelCheckLiveHostModuleCheckSpecProofTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-SPEC-PROOF-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSpecProofTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckSpecProofTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_SPEC_PROOF_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SPEC-PROOF-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckSpecProofTerm : String :=
  "slake-typecheck-hostmodulecheckspecprooffterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckSpecProofTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource.liveHostModuleCheckSpecProofTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSpecProofTermReady. -/
def slakeTypecheckHostModuleCheckSpecProofTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource.hostFrontLiveHostModuleCheckSpecProofTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSpecProofTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSpecProofTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckSpecProofTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSpecProofTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSpecProofTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSpecProofTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSpecProofTermRel}"
  unless (!slakeTypecheckHostModuleCheckSpecProofTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSpecProofTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSpecProofTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSpecProofTermSource.main args
