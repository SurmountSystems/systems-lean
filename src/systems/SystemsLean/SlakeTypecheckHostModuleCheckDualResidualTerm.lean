/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckDualResidualTerm.
  Short role: named driver for lean --run of
  HostModuleCheckDualResidualTerm.lean.
  Ready is HostFrontLiveHostModuleCheckDualResidualTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckDualResidualTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckDualResidualTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckDualResidualTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDUALRESIDUALTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKDUALRESIDUALTERM_V0
  PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckdualresidualterm,
  slakeTypecheckHostModuleCheckDualResidualTermReady,
  kernelCheckLiveHostModuleCheckDualResidualTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckDualResidualTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKDUALRESIDUALTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKDUALRESIDUALTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckDualResidualTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckDualResidualTerm : String :=
  "slake-typecheck-hostmodulecheckdualresidualterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckDualResidualTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm.liveHostModuleCheckDualResidualTermRel

/-- Ready names HostFrontLiveHostModuleCheckDualResidualTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckDualResidualTermReady,
    kernelCheckLiveHostModuleCheckDualResidualTermSource. -/
def slakeTypecheckHostModuleCheckDualResidualTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm.hostFrontLiveHostModuleCheckDualResidualTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckDualResidualTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckDualResidualTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckDualResidualTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckDualResidualTerm.lean.
    Ready is hostFrontLiveHostModuleCheckDualResidualTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckDualResidualTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckDualResidualTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckDualResidualTermRel}"
  unless (!slakeTypecheckHostModuleCheckDualResidualTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckDualResidualTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckDualResidualTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm.main args
