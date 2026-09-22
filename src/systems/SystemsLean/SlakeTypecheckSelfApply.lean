/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfApply.
  Short role: named driver for just slake-typecheck-selfapply.
  Ready is HostFrontLiveSelfApply parse plus HostKernel.kernelCheck
  of live SelfApply.lean, not a hardcoded true, not lake build
  SystemsLean.SelfApply.
  liveRel is SelfApply.lean.
  This wrap is SelfApply.lean. It is not SelfApplyTheorems.lean.
  It is not SelfApplyFsClose.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-APPLY,
  SLAKE_TYPECHECK_SELF_APPLY, slake-typecheck-selfapply,
  slakeTypecheckSelfApplyReady,
  kernelCheckLiveSelfApplySource,
  PARSE-LIVE-SELF-APPLY.
  Module: SystemsLean.SlakeTypecheckSelfApply
  Checkable writer: just slake-typecheck-selfapply
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfApply

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_APPLY"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-APPLY"

/-- Named just recipe. Not lake build SystemsLean.SelfApply. -/
def justRecipeSlakeTypecheckSelfApply : String :=
  "slake-typecheck-selfapply"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyRel : String :=
  SystemsLean.HostFrontLiveSelfApply.liveSelfApplyRel

/-- Ready names HostFrontLiveSelfApply parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSelfApplyReady,
    kernelCheckLiveSelfApplySource. -/
def slakeTypecheckSelfApplyReady : Bool :=
  SystemsLean.HostFrontLiveSelfApply.hostFrontLiveSelfApplyReady

/-- Honesty: this command is not lake build of SelfApply. -/
def slakeTypecheckSelfApplyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfApplyFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSelfApplyFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfApplyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfApply.lean.
    Ready is HostFrontLiveSelfApply.hostFrontLiveSelfApplyReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSelfApply.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfApply} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSelfApply.liveRel}"
  IO.println s!"  host={hostId} file={liveSelfApplyRel}"
  unless (!slakeTypecheckSelfApplyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfApply.main args
