/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCheck.
  Short role: named driver for lean --run of HostCheck.lean.
  Ready is HostFrontLiveHostCheck parse plus HostKernel.kernelCheck of live
  HostCheck.lean, not := true, not lake build SystemsLean.HostCheck.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-CHECK,
  SLAKE_TYPECHECK_HOST_CHECK_V0, slake-typecheck-hostcheck,
  slakeTypecheckHostCheckReady, kernelCheckLiveHostCheckSource,
  PARSE-LIVE-HOST-CHECK.
  Module: SystemsLean.SlakeTypecheckHostCheck
  Checkable writer: lean --run SlakeTypecheckHostCheck (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostCheck

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-CHECK"

/-- Named recipe. Not lake build SystemsLean.HostCheck. -/
def justRecipeSlakeTypecheckHostCheck : String :=
  "slake-typecheck-hostcheck"

/-- Live file relative to repo root. -/
def liveHostCheckRel : String :=
  SystemsLean.HostFrontLiveHostCheck.liveHostCheckRel

/-- Ready names HostFrontLiveHostCheck parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostCheckReady,
    kernelCheckLiveHostCheckSource. -/
def slakeTypecheckHostCheckReady : Bool :=
  SystemsLean.HostFrontLiveHostCheck.hostFrontLiveHostCheckReady

/-- Honesty: this command is not lake build of HostCheck. -/
def slakeTypecheckHostCheckDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostCheckFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostCheckOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCheck.lean.
    Ready is HostFrontLiveHostCheck.hostFrontLiveHostCheckReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostCheck.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostCheck} =="
  IO.println s!"  host={hostId} file={liveHostCheckRel}"
  unless (!slakeTypecheckHostCheckFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostCheckOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostCheck.main args
