/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.Decide.
  Short role: named driver for just slake-typecheck-linearusefaildecide.
  Ready is HostFrontLiveLinearUseFailDecide parse plus HostKernel.kernelCheck
  of live LinearUseFail/Decide.lean, not := true, not lake build
  SystemsLean.LinearUseFail.Decide.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  SlakeTypecheckLinearUseFailDecide
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-DECIDE
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_DECIDE_V0
  PARSE-LIVE-LINEAR-USE-FAIL-DECIDE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefaildecide,
  slakeTypecheckLinearUseFailDecideReady,
  kernelCheckLiveLinearUseFailDecideSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailDecide
  Checkable writer: just slake-typecheck-linearusefaildecide
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearUseFailDecide

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_DECIDE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-DECIDE"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail.Decide. -/
def justRecipeSlakeTypecheckLinearUseFailDecide : String :=
  "slake-typecheck-linearusefaildecide"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailDecideRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailDecide.liveLinearUseFailDecideRel

/-- Ready names HostFrontLiveLinearUseFailDecide parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailDecideReady,
    kernelCheckLiveLinearUseFailDecideSource. -/
def slakeTypecheckLinearUseFailDecideReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailDecide.hostFrontLiveLinearUseFailDecideReady

/-- Honesty: this command is not lake build of LinearUseFail/Decide. -/
def slakeTypecheckLinearUseFailDecideDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailDecideFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailDecideOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail/Decide.lean.
    Ready is HostFrontLiveLinearUseFailDecide.hostFrontLiveLinearUseFailDecideReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailDecide.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailDecide} =="
  IO.println s!"  host={hostId} file={liveLinearUseFailDecideRel}"
  unless (!slakeTypecheckLinearUseFailDecideFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailDecideOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailDecide.main args
