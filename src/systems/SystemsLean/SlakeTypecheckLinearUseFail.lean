/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.
  Short role: named driver for just slake-typecheck-linearusefail.
  Ready is HostFrontLiveLinearUseFail parse plus HostKernel.kernelCheck of live
  LinearUseFail.lean, not := true, not lake build SystemsLean.LinearUseFail.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL,
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_V0, slake-typecheck-linearusefail,
  slakeTypecheckLinearUseFailReady, kernelCheckLiveLinearUseFailSource,
  PARSE-LIVE-LINEAR-USE-FAIL, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFail
  Checkable writer: just slake-typecheck-linearusefail (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearUseFail

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail. -/
def justRecipeSlakeTypecheckLinearUseFail : String :=
  "slake-typecheck-linearusefail"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailRel : String :=
  SystemsLean.HostFrontLiveLinearUseFail.liveLinearUseFailRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveLinearUseFail.liveRel

/-- Ready names HostFrontLiveLinearUseFail parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckLinearUseFailReady,
    kernelCheckLiveLinearUseFailSource. -/
def slakeTypecheckLinearUseFailReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFail.hostFrontLiveLinearUseFailReady

/-- Honesty: this command is not lake build of LinearUseFail. -/
def slakeTypecheckLinearUseFailDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail.lean.
    Ready is HostFrontLiveLinearUseFail.hostFrontLiveLinearUseFailReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFail.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFail} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLinearUseFailRel}"
  unless (liveRel == "LinearUseFail.lean") do
    IO.eprintln "error: liveRel must be LinearUseFail.lean"
    return 1
  unless (!slakeTypecheckLinearUseFailFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFail.main args
