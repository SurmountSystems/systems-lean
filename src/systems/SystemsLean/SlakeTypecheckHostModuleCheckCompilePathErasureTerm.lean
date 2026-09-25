/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathErasureTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathErasureTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathErasureTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathErasureTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathErasureTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathErasureTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHERASURETERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHERASURETERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHERASURETERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepatherasureterm,
  slakeTypecheckHostModuleCheckCompilePathErasureTermReady,
  kernelCheckLiveHostModuleCheckCompilePathErasureTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathErasureTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHERASURETERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHERASURETERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathErasureTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathErasureTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepatherasureterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathErasureTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm.liveHostModuleCheckCompilePathErasureTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathErasureTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathErasureTermReady,
    kernelCheckLiveHostModuleCheckCompilePathErasureTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathErasureTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm.hostFrontLiveHostModuleCheckCompilePathErasureTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathErasureTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathErasureTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathErasureTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathErasureTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathErasureTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathErasureTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathErasureTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathErasureTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathErasureTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathErasureTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathErasureTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm.main args
