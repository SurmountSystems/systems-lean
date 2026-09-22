/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfApplyFsClose.
  Short role: named driver for just slake-typecheck-selfapplyfsclose.
  Ready is HostFrontLiveSelfApplyFsClose parse plus HostKernel.kernelCheck
  of live SelfApplyFsClose.lean, not := true, not lake build
  SystemsLean.SelfApplyFsClose.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Hyphenated stage id: SELF-APPLY-FS-CLOSE.
  liveRel is SelfApplyFsClose.lean.
  Unique needles (trailing newline so SlakeTypecheckSelfApplyFsClose is not a
  prefix hit on a shorter name):
  SlakeTypecheckSelfApplyFsClose
  HOST-SLAKE-TYPECHECK-SELF-APPLY-FS-CLOSE
  SELF-APPLY-FS-CLOSE
  PARSE-LIVE-SELF-APPLY-FS-CLOSE
  slake-typecheck-selfapplyfsclose
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SELF-APPLY-FS-CLOSE,
  SELF-APPLY-FS-CLOSE, slake-typecheck-selfapplyfsclose,
  slakeTypecheckSelfApplyFsCloseReady,
  kernelCheckLiveSelfApplyFsCloseSource,
  PARSE-LIVE-SELF-APPLY-FS-CLOSE, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfApplyFsClose
  Checkable writer: just slake-typecheck-selfapplyfsclose
  (lean --run; no mill; no lake). Dests skipped this slice
  (shared nix and barrel stay untouched).
-/

import SystemsLean.HostFrontLiveSelfApplyFsClose

/-- Greppable stage id. Hyphenated: SELF-APPLY-FS-CLOSE. -/
def stageId : String := "SELF-APPLY-FS-CLOSE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-APPLY-FS-CLOSE"

/-- Named just recipe. Not lake build SystemsLean.SelfApplyFsClose. -/
def justRecipeSlakeTypecheckSelfApplyFsClose : String :=
  "slake-typecheck-selfapplyfsclose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfApplyFsCloseRel : String :=
  SystemsLean.HostFrontLiveSelfApplyFsClose.liveSelfApplyFsCloseRel

/-- Live basename. Greppable: liveRel. Must be SelfApplyFsClose.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSelfApplyFsClose.liveRel

/-- Ready names HostFrontLiveSelfApplyFsClose parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfApplyFsCloseReady,
    kernelCheckLiveSelfApplyFsCloseSource. -/
def slakeTypecheckSelfApplyFsCloseReady : Bool :=
  SystemsLean.HostFrontLiveSelfApplyFsClose.hostFrontLiveSelfApplyFsCloseReady

/-- Honesty: this command is not lake build of SelfApplyFsClose. -/
def slakeTypecheckSelfApplyFsCloseDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfApplyFsCloseFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfApplyFsCloseOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfApplyFsClose.lean.
    Ready is HostFrontLiveSelfApplyFsClose.hostFrontLiveSelfApplyFsCloseReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfApplyFsClose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfApplyFsClose} =="
  IO.println s!"  host={hostId} file={liveSelfApplyFsCloseRel} liveRel={liveRel}"
  unless (!slakeTypecheckSelfApplyFsCloseFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfApplyFsCloseOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (liveRel == "SelfApplyFsClose.lean") do
    IO.eprintln "error: liveRel must be SelfApplyFsClose.lean"
    return 1
  SystemsLean.HostFrontLiveSelfApplyFsClose.main args
