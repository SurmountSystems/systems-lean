/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfApplyFsTheorems.
  Short role: named driver for just slake-typecheck-selfapplyfstheorems.
  Ready is HostFrontLiveSelfApplyFsTheorems parse plus HostKernel.kernelCheck
  of live SelfApplyFsTheorems.lean, not := true, not lake build
  SystemsLean.SelfApplyFsTheorems.
  Product ids SELF-APPLY-FS-THEOREM and SELF-APPLY-FS-SMOKE are not changed.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-APPLY-FS-THEOREMS,
  SLAKE_TYPECHECK_SELF_APPLY_FS_THEOREMS_V0, slake-typecheck-selfapplyfstheorems,
  slakeTypecheckSelfApplyFsTheoremsReady,
  kernelCheckLiveSelfApplyFsTheoremsSource,
  PARSE-LIVE-SELFAPPLYFSTHEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfApplyFsTheorems
  Checkable writer: just slake-typecheck-selfapplyfstheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfApplyFsTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_APPLY_FS_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-APPLY-FS-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SelfApplyFsTheorems. -/
def justRecipeSlakeTypecheckSelfApplyFsTheorems : String :=
  "slake-typecheck-selfapplyfstheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyFsTheoremsRel : String :=
  SystemsLean.HostFrontLiveSelfApplyFsTheorems.liveRel

/-- Ready names HostFrontLiveSelfApplyFsTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfApplyFsTheoremsReady,
    kernelCheckLiveSelfApplyFsTheoremsSource. -/
def slakeTypecheckSelfApplyFsTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSelfApplyFsTheorems.hostFrontLiveSelfApplyFsTheoremsReady

/-- Honesty: this command is not lake build of SelfApplyFsTheorems. -/
def slakeTypecheckSelfApplyFsTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfApplyFsTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfApplyFsTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfApplyFsTheorems.lean.
    Ready is HostFrontLiveSelfApplyFsTheorems.hostFrontLiveSelfApplyFsTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfApplyFsTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfApplyFsTheorems} =="
  IO.println s!"  host={hostId} file={liveSelfApplyFsTheoremsRel}"
  unless (!slakeTypecheckSelfApplyFsTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyFsTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfApplyFsTheorems.main args
