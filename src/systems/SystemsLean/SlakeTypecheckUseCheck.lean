/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.UseCheck.
  Short role: named driver for just slake-typecheck-usecheck.
  Ready is HostFrontLiveUseCheck parse plus HostKernel.kernelCheck of live
  UseCheck.lean, not := true, not lake build SystemsLean.UseCheck.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-USECHECK,
  SLAKE_TYPECHECK_USECHECK_V0, slake-typecheck-usecheck,
  slakeTypecheckUseCheckReady, kernelCheckLiveUseCheckSource,
  PARSE-LIVE-USECHECK, SKELETON.
  Module: SystemsLean.SlakeTypecheckUseCheck
  Checkable writer: just slake-typecheck-usecheck (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveUseCheck

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_USECHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-USECHECK"

/-- Named just recipe. Not lake build SystemsLean.UseCheck. -/
def justRecipeSlakeTypecheckUseCheck : String :=
  "slake-typecheck-usecheck"

/-- Live file relative to repo root. Dual-pin path. -/
def liveUseCheckRel : String :=
  SystemsLean.HostFrontLiveUseCheck.liveUseCheckRel

/-- Ready names HostFrontLiveUseCheck parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckUseCheckReady,
    kernelCheckLiveUseCheckSource. -/
def slakeTypecheckUseCheckReady : Bool :=
  SystemsLean.HostFrontLiveUseCheck.hostFrontLiveUseCheckReady

/-- Honesty: this command is not lake build of UseCheck. -/
def slakeTypecheckUseCheckDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckUseCheckFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckUseCheckOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live UseCheck.lean.
    Ready is HostFrontLiveUseCheck.hostFrontLiveUseCheckReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveUseCheck.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckUseCheck} =="
  IO.println s!"  host={hostId} file={liveUseCheckRel}"
  unless (!slakeTypecheckUseCheckFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckUseCheckOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveUseCheck.main args
