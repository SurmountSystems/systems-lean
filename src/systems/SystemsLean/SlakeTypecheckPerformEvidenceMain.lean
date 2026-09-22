/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PerformEvidenceMain.
  Short role: named driver for just slake-typecheck-performevidencemain.
  Ready is HostFrontLivePerformEvidenceMain parse plus HostKernel.kernelCheck
  of live PerformEvidenceMain.lean, not := true, not lake build
  SystemsLean.PerformEvidenceMain.
  Not mill 11 remill (just eleventh-host-tool / inventory row 14).
  Not occupancy name 50. Not FullHost.
  This wrap parses PerformEvidenceMain.lean only. Do not wrap PerformEvidence.lean.
  Short name is free because HostFrontLivePerformEvidence (library wrap) does not exist.
  Do not mint HostFrontLiveHostPerformEvidenceMain.
  Do not steal HostFrontLivePerformClaimedMain. PerformEvidence is not PerformClaimed.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckPerformEvidenceMain is not a prefix):
  SlakeTypecheckPerformEvidenceMain
  HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE-MAIN
  SLAKE_TYPECHECK_PERFORM_EVIDENCE_MAIN_V0
  slake-typecheck-performevidencemain
  PARSE-LIVE-PERFORM-EVIDENCE-MAIN
  PERFORM-EVIDENCE-MAIN
  HOST-PERFORM-EVIDENCE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-performevidencemain,
  slakeTypecheckPerformEvidenceMainReady,
  kernelCheckLivePerformEvidenceMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckPerformEvidenceMain
  Checkable writer: just slake-typecheck-performevidencemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLivePerformEvidenceMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PERFORM_EVIDENCE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.PerformEvidenceMain. -/
def justRecipeSlakeTypecheckPerformEvidenceMain : String :=
  "slake-typecheck-performevidencemain"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformEvidenceMainRel : String :=
  SystemsLean.HostFrontLivePerformEvidenceMain.livePerformEvidenceMainRel

/-- Ready names HostFrontLivePerformEvidenceMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckPerformEvidenceMainReady,
    kernelCheckLivePerformEvidenceMainSource. -/
def slakeTypecheckPerformEvidenceMainReady : Bool :=
  SystemsLean.HostFrontLivePerformEvidenceMain.hostFrontLivePerformEvidenceMainReady

/-- Honesty: this command is not lake build of PerformEvidenceMain. -/
def slakeTypecheckPerformEvidenceMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformEvidenceMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformEvidenceMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PerformEvidenceMain.lean.
    Ready is HostFrontLivePerformEvidenceMain.hostFrontLivePerformEvidenceMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLivePerformEvidenceMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformEvidenceMain} =="
  IO.println s!"  host={hostId} file={livePerformEvidenceMainRel}"
  unless (!slakeTypecheckPerformEvidenceMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformEvidenceMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePerformEvidenceMain.main args
