/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathTypesTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathTypesTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathTypesTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathTypesTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathTypesTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathTypesTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHTYPESTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHTYPESTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHTYPESTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathtypesterm,
  slakeTypecheckHostModuleCheckCompilePathTypesTermReady,
  kernelCheckLiveHostModuleCheckCompilePathTypesTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathTypesTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathTypesTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHTYPESTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHTYPESTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathTypesTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathTypesTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathtypesterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathTypesTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTypesTerm.liveHostModuleCheckCompilePathTypesTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathTypesTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathTypesTermReady,
    kernelCheckLiveHostModuleCheckCompilePathTypesTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathTypesTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTypesTerm.hostFrontLiveHostModuleCheckCompilePathTypesTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathTypesTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathTypesTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathTypesTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathTypesTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathTypesTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathTypesTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathTypesTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathTypesTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathTypesTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathTypesTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathTypesTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathTypesTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathTypesTerm.main args
