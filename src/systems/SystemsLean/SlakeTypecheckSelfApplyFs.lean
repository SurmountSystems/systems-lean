/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfApplyFs.
  Short role: named driver for just slake-typecheck-selfapplyfs.
  Ready is HostFrontLiveSelfApplyFs parse plus HostKernel.kernelCheck
  of live SelfApplyFs.lean, not := true, not lake build
  SystemsLean.SelfApplyFs.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Hyphenated stage id: SELF-APPLY-FS.
  liveRel is SelfApplyFs.lean.
  Unique needles (trailing newline so SlakeTypecheckSelfApplyFs is not a
  prefix hit on a shorter name):
  SlakeTypecheckSelfApplyFs
  HOST-SLAKE-TYPECHECK-SELF-APPLY-FS
  SELF-APPLY-FS
  PARSE-LIVE-SELF-APPLY-FS
  slake-typecheck-selfapplyfs
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-APPLY-FS,
  SELF-APPLY-FS, slake-typecheck-selfapplyfs,
  slakeTypecheckSelfApplyFsReady,
  kernelCheckLiveSelfApplyFsSource,
  PARSE-LIVE-SELF-APPLY-FS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfApplyFs
  Checkable writer: just slake-typecheck-selfapplyfs
  (lean --run; no mill; no lake). Dests skipped this slice
  (shared nix and barrel stay untouched).
-/

import SystemsLean.HostFrontLiveSelfApplyFs

/-- Greppable stage id. Hyphenated: SELF-APPLY-FS. -/
def stageId : String := "SELF-APPLY-FS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-APPLY-FS"

/-- Named just recipe. Not lake build SystemsLean.SelfApplyFs. -/
def justRecipeSlakeTypecheckSelfApplyFs : String :=
  "slake-typecheck-selfapplyfs"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyFsRel : String :=
  SystemsLean.HostFrontLiveSelfApplyFs.liveSelfApplyFsRel

/-- Live basename. Greppable: liveRel. Must be SelfApplyFs.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSelfApplyFs.liveRel

/-- Ready names HostFrontLiveSelfApplyFs parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfApplyFsReady,
    kernelCheckLiveSelfApplyFsSource. -/
def slakeTypecheckSelfApplyFsReady : Bool :=
  SystemsLean.HostFrontLiveSelfApplyFs.hostFrontLiveSelfApplyFsReady

/-- Honesty: this command is not lake build of SelfApplyFs. -/
def slakeTypecheckSelfApplyFsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfApplyFsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfApplyFsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfApplyFs.lean.
    Ready is HostFrontLiveSelfApplyFs.hostFrontLiveSelfApplyFsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfApplyFs.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfApplyFs} =="
  IO.println s!"  host={hostId} file={liveSelfApplyFsRel} liveRel={liveRel}"
  unless (!slakeTypecheckSelfApplyFsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyFsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (liveRel == "SelfApplyFs.lean") do
    IO.eprintln "error: liveRel must be SelfApplyFs.lean"
    return 1
  SystemsLean.HostFrontLiveSelfApplyFs.main args
