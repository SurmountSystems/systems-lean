/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathterm,
  slakeTypecheckHostModuleCheckCompilePathTermReady,
  kernelCheckLiveHostModuleCheckCompilePathTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm.liveHostModuleCheckCompilePathTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathTermReady,
    kernelCheckLiveHostModuleCheckCompilePathTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm.hostFrontLiveHostModuleCheckCompilePathTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm.main args
