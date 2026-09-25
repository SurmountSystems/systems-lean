/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathProgramTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathProgramTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathProgramTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathProgramTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathProgramTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathProgramTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHPROGRAMTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHPROGRAMTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHPROGRAMTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathprogramterm,
  slakeTypecheckHostModuleCheckCompilePathProgramTermReady,
  kernelCheckLiveHostModuleCheckCompilePathProgramTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathProgramTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathProgramTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHPROGRAMTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHPROGRAMTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathProgramTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathProgramTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathprogramterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathProgramTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathProgramTerm.liveHostModuleCheckCompilePathProgramTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathProgramTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathProgramTermReady,
    kernelCheckLiveHostModuleCheckCompilePathProgramTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathProgramTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathProgramTerm.hostFrontLiveHostModuleCheckCompilePathProgramTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathProgramTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathProgramTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathProgramTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathProgramTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathProgramTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathProgramTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathProgramTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathProgramTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathProgramTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathProgramTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathProgramTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathProgramTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathProgramTerm.main args
