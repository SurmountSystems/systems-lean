/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCheck.
  Short role: named driver for just slake-typecheck-check.
  Ready is HostFrontLiveCheck parse plus HostKernel.kernelCheck of live
  HostCheck.lean, not := true, not lake build SystemsLean.HostCheck.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CHECK,
  SLAKE_TYPECHECK_CHECK_V0, slake-typecheck-check,
  slakeTypecheckCheckReady, kernelCheckLiveHostCheckSource,
  PARSE-LIVE-HOST-CHECK, SKELETON.
  Module: SystemsLean.SlakeTypecheckCheck
  Checkable writer: just slake-typecheck-check (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCheck

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CHECK"

/-- Named just recipe. Not lake build SystemsLean.HostCheck. -/
def justRecipeSlakeTypecheckCheck : String :=
  "slake-typecheck-check"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCheckRel : String :=
  SystemsLean.HostFrontLiveCheck.liveHostCheckRel

/-- Ready names HostFrontLiveCheck parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCheckReady,
    kernelCheckLiveHostCheckSource. -/
def slakeTypecheckCheckReady : Bool :=
  SystemsLean.HostFrontLiveCheck.hostFrontLiveCheckReady

/-- Honesty: this command is not lake build of HostCheck. -/
def slakeTypecheckCheckDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCheckFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCheckOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCheck.lean.
    Ready is HostFrontLiveCheck.hostFrontLiveCheckReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCheck.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCheck} =="
  IO.println s!"  host={hostId} file={liveCheckRel}"
  unless (!slakeTypecheckCheckFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCheckOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCheck.main args
