/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathBodyTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathBodyTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathBodyTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathBodyTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathBodyTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathBodyTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHBODYTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHBODYTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHBODYTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathbodyterm,
  slakeTypecheckHostModuleCheckCompilePathBodyTermReady,
  kernelCheckLiveHostModuleCheckCompilePathBodyTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathBodyTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathBodyTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHBODYTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHBODYTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathBodyTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathBodyTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathbodyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathBodyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathBodyTerm.liveHostModuleCheckCompilePathBodyTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathBodyTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathBodyTermReady,
    kernelCheckLiveHostModuleCheckCompilePathBodyTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathBodyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathBodyTerm.hostFrontLiveHostModuleCheckCompilePathBodyTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathBodyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathBodyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathBodyTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathBodyTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathBodyTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathBodyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathBodyTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathBodyTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathBodyTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathBodyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathBodyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathBodyTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathBodyTerm.main args
