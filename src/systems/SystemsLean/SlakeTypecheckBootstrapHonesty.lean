/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.BootstrapHonesty.
  Short role: named driver for just slake-typecheck-bootstraphonesty.
  Ready is HostFrontLiveBootstrapHonesty parse plus HostKernel.kernelCheck of live
  BootstrapHonesty.lean, not := true, not lake build SystemsLean.BootstrapHonesty.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY,
  SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_V0, slake-typecheck-bootstraphonesty,
  slakeTypecheckBootstrapHonestyReady, kernelCheckLiveBootstrapHonestySource,
  PARSE-LIVE-BOOTSTRAP-HONESTY, SKELETON.
  Module: SystemsLean.SlakeTypecheckBootstrapHonesty
  Checkable writer: just slake-typecheck-bootstraphonesty (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveBootstrapHonesty

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY"

/-- Named just recipe. Not lake build SystemsLean.BootstrapHonesty. -/
def justRecipeSlakeTypecheckBootstrapHonesty : String :=
  "slake-typecheck-bootstraphonesty"

/-- Live file relative to repo root. Dual-pin path. -/
def liveBootstrapHonestyRel : String :=
  SystemsLean.HostFrontLiveBootstrapHonesty.liveBootstrapHonestyRel

/-- Ready names HostFrontLiveBootstrapHonesty parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckBootstrapHonestyReady,
    kernelCheckLiveBootstrapHonestySource. -/
def slakeTypecheckBootstrapHonestyReady : Bool :=
  SystemsLean.HostFrontLiveBootstrapHonesty.hostFrontLiveBootstrapHonestyReady

/-- Honesty: this command is not lake build of BootstrapHonesty. -/
def slakeTypecheckBootstrapHonestyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckBootstrapHonestyFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckBootstrapHonestyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live BootstrapHonesty.lean.
    Ready is HostFrontLiveBootstrapHonesty.hostFrontLiveBootstrapHonestyReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveBootstrapHonesty.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckBootstrapHonesty} =="
  IO.println s!"  host={hostId} file={liveBootstrapHonestyRel} liveRel={liveBootstrapHonestyRel}"
  unless (!slakeTypecheckBootstrapHonestyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckBootstrapHonestyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveBootstrapHonesty.main args
