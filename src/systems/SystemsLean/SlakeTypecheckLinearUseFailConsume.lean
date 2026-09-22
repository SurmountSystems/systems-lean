/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFail.Consume.
  Short role: named driver for just slake-typecheck-linearusefailconsume.
  Ready is HostFrontLiveLinearUseFailConsume parse plus HostKernel.kernelCheck
  of live LinearUseFail/Consume.lean, not := true, not lake build
  SystemsLean.LinearUseFail.Consume.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  SlakeTypecheckLinearUseFailConsume
  LINEAR-USE-FAIL-CONSUME
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-CONSUME
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_CONSUME_V0
  PARSE-LIVE-LINEAR-USE-FAIL-CONSUME
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefailconsume,
  slakeTypecheckLinearUseFailConsumeReady,
  kernelCheckLiveLinearUseFailConsumeSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailConsume
  Checkable writer: just slake-typecheck-linearusefailconsume
  (lean --run; no mill; no lake). Destinations skipped this slice.
-/

import SystemsLean.HostFrontLiveLinearUseFailConsume

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_CONSUME_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-CONSUME"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFail.Consume. -/
def justRecipeSlakeTypecheckLinearUseFailConsume : String :=
  "slake-typecheck-linearusefailconsume"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailConsumeRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailConsume.liveLinearUseFailConsumeRel

/-- Ready names HostFrontLiveLinearUseFailConsume parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailConsumeReady,
    kernelCheckLiveLinearUseFailConsumeSource. -/
def slakeTypecheckLinearUseFailConsumeReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailConsume.hostFrontLiveLinearUseFailConsumeReady

/-- Honesty: this command is not lake build of LinearUseFail/Consume. -/
def slakeTypecheckLinearUseFailConsumeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailConsumeFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailConsumeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFail/Consume.lean.
    Ready is HostFrontLiveLinearUseFailConsume.hostFrontLiveLinearUseFailConsumeReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailConsume.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailConsume} =="
  IO.println s!"  host={hostId} file={liveLinearUseFailConsumeRel}"
  unless (!slakeTypecheckLinearUseFailConsumeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailConsumeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailConsume.main args
