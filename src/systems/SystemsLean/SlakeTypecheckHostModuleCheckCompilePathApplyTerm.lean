/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathApplyTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathApplyTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathApplyTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathApplyTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathApplyTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathApplyTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHAPPLYTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHAPPLYTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHAPPLYTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathapplyterm,
  slakeTypecheckHostModuleCheckCompilePathApplyTermReady,
  kernelCheckLiveHostModuleCheckCompilePathApplyTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathApplyTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHAPPLYTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHAPPLYTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathApplyTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathApplyTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathapplyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathApplyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm.liveHostModuleCheckCompilePathApplyTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathApplyTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathApplyTermReady,
    kernelCheckLiveHostModuleCheckCompilePathApplyTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathApplyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm.hostFrontLiveHostModuleCheckCompilePathApplyTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathApplyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathApplyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathApplyTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathApplyTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathApplyTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathApplyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathApplyTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathApplyTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathApplyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathApplyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathApplyTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm.main args
