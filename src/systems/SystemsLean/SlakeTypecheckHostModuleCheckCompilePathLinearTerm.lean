/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathLinearTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathLinearTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathLinearTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathLinearTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathLinearTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathLinearTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHLINEARTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHLINEARTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHLINEARTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathlinearterm,
  slakeTypecheckHostModuleCheckCompilePathLinearTermReady,
  kernelCheckLiveHostModuleCheckCompilePathLinearTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathLinearTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHLINEARTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHLINEARTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathLinearTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathLinearTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathlinearterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathLinearTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm.liveHostModuleCheckCompilePathLinearTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathLinearTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathLinearTermReady,
    kernelCheckLiveHostModuleCheckCompilePathLinearTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm.hostFrontLiveHostModuleCheckCompilePathLinearTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathLinearTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathLinearTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathLinearTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathLinearTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathLinearTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathLinearTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathLinearTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathLinearTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathLinearTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm.main args
