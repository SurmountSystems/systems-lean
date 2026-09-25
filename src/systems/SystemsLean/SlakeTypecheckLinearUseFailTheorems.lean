/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearUseFailTheorems.
  Short role: named driver for just slake-typecheck-linearusefailtheorems.
  Ready is HostFrontLiveLinearUseFailTheorems parse plus HostKernel.kernelCheck
  of live LinearUseFailTheorems.lean, not := true, not lake build
  SystemsLean.LinearUseFailTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  SlakeTypecheckLinearUseFailTheorems
  HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-THEOREMS
  SLAKE_TYPECHECK_LINEAR_USE_FAIL_THEOREMS_V0
  PARSE-LIVE-LINEAR-USE-FAIL-THEOREMS
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearusefailtheorems,
  slakeTypecheckLinearUseFailTheoremsReady,
  kernelCheckLiveLinearUseFailTheoremsSource,
  liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearUseFailTheorems
  Checkable writer: just slake-typecheck-linearusefailtheorems
  (lean --run; no mill; no lake). Dests skipped; recipe not invoked here.
-/

import SystemsLean.HostFrontLiveLinearUseFailTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_USE_FAIL_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.LinearUseFailTheorems. -/
def justRecipeSlakeTypecheckLinearUseFailTheorems : String :=
  "slake-typecheck-linearusefailtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailTheoremsRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailTheorems.liveLinearUseFailTheoremsRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveLinearUseFailTheorems.liveRel

/-- Ready names HostFrontLiveLinearUseFailTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearUseFailTheoremsReady,
    kernelCheckLiveLinearUseFailTheoremsSource. -/
def slakeTypecheckLinearUseFailTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveLinearUseFailTheorems.hostFrontLiveLinearUseFailTheoremsReady

/-- Honesty: this command is not lake build of LinearUseFailTheorems. -/
def slakeTypecheckLinearUseFailTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearUseFailTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearUseFailTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearUseFailTheorems.lean.
    Ready is HostFrontLiveLinearUseFailTheorems.hostFrontLiveLinearUseFailTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearUseFailTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearUseFailTheorems} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveLinearUseFailTheoremsRel}"
  unless (liveRel == "LinearUseFailTheorems.lean") do
    IO.eprintln "error: liveRel must be LinearUseFailTheorems.lean"
    return 1
  unless (!slakeTypecheckLinearUseFailTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearUseFailTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearUseFailTheorems.main args
