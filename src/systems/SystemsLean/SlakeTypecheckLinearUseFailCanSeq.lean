/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.CanSeq.
  Short role: named driver for just slake-typecheck-linearusefailcanseq.
  Ready is HostFrontLiveLinearUseFailCanSeq parse plus HostKernel.kernelCheck
  of live LinearUseFail/CanSeq.lean, not := true, not lake build
  SystemsLean.LinearUseFail.CanSeq.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  SlakeTypecheckLinearUseFailCanSeq
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-CAN-SEQ
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_CAN_SEQ_V0
  PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefailcanseq,
  slakeTypecheckLinearUseFailCanSeqReady,
  kernelCheckLiveLinearUseFailCanSeqSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailCanSeq
  Checkable writer: just slake-typecheck-linearusefailcanseq
  (lean --run; no mill; no lake). dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLinearUseFailCanSeq

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_CAN_SEQ_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-CAN-SEQ"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail.CanSeq. -/
def justRecipeSlakeTypecheckLinearUseFailCanSeq : String :=
  "slake-typecheck-linearusefailcanseq"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailCanSeqRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailCanSeq.liveLinearUseFailCanSeqRel

/-- Ready names HostFrontLiveLinearUseFailCanSeq parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailCanSeqReady,
    kernelCheckLiveLinearUseFailCanSeqSource. -/
def slakeTypecheckLinearUseFailCanSeqReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailCanSeq.hostFrontLiveLinearUseFailCanSeqReady

/-- Honesty: this command is not lake build of LinearUseFail/CanSeq. -/
def slakeTypecheckLinearUseFailCanSeqDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailCanSeqFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailCanSeqOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail/CanSeq.lean.
    Ready is HostFrontLiveLinearUseFailCanSeq.hostFrontLiveLinearUseFailCanSeqReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailCanSeq.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailCanSeq} =="
  IO.println s!"  host={hostId} file={liveLinearUseFailCanSeqRel}"
  unless (!slakeTypecheckLinearUseFailCanSeqFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailCanSeqOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailCanSeq.main args
