/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.Keep.
  Short role: named driver for just slake-typecheck-linearusefailkeep.
  Ready is HostFrontLiveLinearUseFailKeep parse plus HostKernel.kernelCheck
  of live LinearUseFail/Keep.lean, not := true, not lake build
  SystemsLean.LinearUseFail.Keep.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  SlakeTypecheckLinearUseFailKeep
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-KEEP
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_KEEP_V0
  PARSE-LIVE-LINEAR-USE-FAIL-KEEP
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefailkeep,
  slakeTypecheckLinearUseFailKeepReady,
  kernelCheckLiveLinearUseFailKeepSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailKeep
  Checkable writer: just slake-typecheck-linearusefailkeep
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearUseFailKeep

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_KEEP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-KEEP"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail.Keep. -/
def justRecipeSlakeTypecheckLinearUseFailKeep : String :=
  "slake-typecheck-linearusefailkeep"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailKeepRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailKeep.liveLinearUseFailKeepRel

/-- Ready names HostFrontLiveLinearUseFailKeep parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailKeepReady,
    kernelCheckLiveLinearUseFailKeepSource. -/
def slakeTypecheckLinearUseFailKeepReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailKeep.hostFrontLiveLinearUseFailKeepReady

/-- Honesty: this command is not lake build of LinearUseFail/Keep. -/
def slakeTypecheckLinearUseFailKeepDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailKeepFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailKeepOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail/Keep.lean.
    Ready is HostFrontLiveLinearUseFailKeep.hostFrontLiveLinearUseFailKeepReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailKeep.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailKeep} =="
  IO.println s!"  host={hostId} file={liveLinearUseFailKeepRel}"
  unless (!slakeTypecheckLinearUseFailKeepFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailKeepOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailKeep.main args
