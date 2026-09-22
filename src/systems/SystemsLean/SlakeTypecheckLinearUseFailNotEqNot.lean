/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.NotEqNot.
  Short role: named driver for just slake-typecheck-linearusefailnoteqnot.
  Ready is HostFrontLiveLinearUseFailNotEqNot parse plus HostKernel.kernelCheck
  of live LinearUseFail/NotEqNot.lean, not := true, not lake build
  SystemsLean.LinearUseFail.NotEqNot.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail and Decide wraps are not a prefix):
  SlakeTypecheckLinearUseFailNotEqNot
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-NOT-EQ-NOT
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_NOT_EQ_NOT_V0
  PARSE-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefailnoteqnot,
  slakeTypecheckLinearUseFailNotEqNotReady,
  kernelCheckLiveLinearUseFailNotEqNotSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailNotEqNot
  Checkable writer: just slake-typecheck-linearusefailnoteqnot
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearUseFailNotEqNot

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_NOT_EQ_NOT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-NOT-EQ-NOT"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail.NotEqNot. -/
def justRecipeSlakeTypecheckLinearUseFailNotEqNot : String :=
  "slake-typecheck-linearusefailnoteqnot"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailNotEqNotRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailNotEqNot.liveLinearUseFailNotEqNotRel

/-- Ready names HostFrontLiveLinearUseFailNotEqNot parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailNotEqNotReady,
    kernelCheckLiveLinearUseFailNotEqNotSource. -/
def slakeTypecheckLinearUseFailNotEqNotReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailNotEqNot.hostFrontLiveLinearUseFailNotEqNotReady

/-- Honesty: this command is not lake build of LinearUseFail/NotEqNot. -/
def slakeTypecheckLinearUseFailNotEqNotDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailNotEqNotFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailNotEqNotOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail/NotEqNot.lean.
    Ready is HostFrontLiveLinearUseFailNotEqNot.hostFrontLiveLinearUseFailNotEqNotReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailNotEqNot.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailNotEqNot} =="
  IO.println s!"  host={hostId} file={liveLinearUseFailNotEqNotRel}"
  unless (!slakeTypecheckLinearUseFailNotEqNotFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailNotEqNotOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailNotEqNot.main args
