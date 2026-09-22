/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfApplyTheorems.
  Short role: named driver for just slake-typecheck-selfapplytheorems.
  Ready is HostFrontLiveSelfApplyTheorems parse plus HostKernel.kernelCheck
  of live SelfApplyTheorems.lean, not := true, not lake build
  SystemsLean.SelfApplyTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not SlakeTypecheckSelfApplyFsClose (that wrap typechecks SelfApplyFsClose.lean).
  Unique needles (own lines; THEOREMS suffix so they are not a prefix of a
  shorter name):
  SlakeTypecheckSelfApplyTheorems
  HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS
  SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0
  PARSE-LIVE-SELF-APPLY-THEOREMS
  slake-typecheck-selfapplytheorems
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS,
  SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0, slake-typecheck-selfapplytheorems,
  slakeTypecheckSelfApplyTheoremsReady,
  kernelCheckLiveSelfApplyTheoremsSource,
  PARSE-LIVE-SELF-APPLY-THEOREMS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfApplyTheorems
  Checkable writer: just slake-typecheck-selfapplytheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveSelfApplyTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SelfApplyTheorems. -/
def justRecipeSlakeTypecheckSelfApplyTheorems : String :=
  "slake-typecheck-selfapplytheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyTheoremsRel : String :=
  SystemsLean.HostFrontLiveSelfApplyTheorems.liveSelfApplyTheoremsRel

/-- Live basename. Greppable: liveRel. Must be SelfApplyTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSelfApplyTheorems.liveRel

/-- Ready names HostFrontLiveSelfApplyTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfApplyTheoremsReady,
    kernelCheckLiveSelfApplyTheoremsSource. -/
def slakeTypecheckSelfApplyTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSelfApplyTheorems.hostFrontLiveSelfApplyTheoremsReady

/-- Honesty: this command is not lake build of SelfApplyTheorems. -/
def slakeTypecheckSelfApplyTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfApplyTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfApplyTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfApplyTheorems.lean.
    Ready is HostFrontLiveSelfApplyTheorems.hostFrontLiveSelfApplyTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfApplyTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfApplyTheorems} =="
  IO.println s!"  host={hostId} file={liveSelfApplyTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckSelfApplyTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfApplyTheorems.main args
