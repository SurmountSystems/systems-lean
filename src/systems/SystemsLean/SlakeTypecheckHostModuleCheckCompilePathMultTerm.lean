/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathMultTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathMultTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathMultTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathMultTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathMultTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathMultTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHMULTTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHMULTTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHMULTTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathmultterm,
  slakeTypecheckHostModuleCheckCompilePathMultTermReady,
  kernelCheckLiveHostModuleCheckCompilePathMultTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathMultTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHMULTTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHMULTTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathMultTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathMultTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathmultterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathMultTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm.liveHostModuleCheckCompilePathMultTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathMultTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathMultTermReady,
    kernelCheckLiveHostModuleCheckCompilePathMultTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathMultTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm.hostFrontLiveHostModuleCheckCompilePathMultTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathMultTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathMultTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathMultTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathMultTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathMultTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathMultTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathMultTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathMultTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathMultTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathMultTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathMultTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm.main args
