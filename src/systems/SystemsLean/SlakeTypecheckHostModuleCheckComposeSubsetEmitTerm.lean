/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckComposeSubsetEmitTerm.
  Short role: named driver for lean --run of
  HostModuleCheckComposeSubsetEmitTerm.lean.
  Ready is HostFrontLiveHostModuleCheckComposeSubsetEmitTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckComposeSubsetEmitTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckComposeSubsetEmitTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckComposeSubsetEmitTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPOSESUBSETEMITTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPOSESUBSETEMITTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETEMITTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcomposesubsetemitterm,
  slakeTypecheckHostModuleCheckComposeSubsetEmitTermReady,
  kernelCheckLiveHostModuleCheckComposeSubsetEmitTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckComposeSubsetEmitTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPOSESUBSETEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPOSESUBSETEMITTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckComposeSubsetEmitTerm : String :=
  "slake-typecheck-hostmodulecheckcomposesubsetemitterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckComposeSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.liveHostModuleCheckComposeSubsetEmitTermRel

/-- Ready names HostFrontLiveHostModuleCheckComposeSubsetEmitTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckComposeSubsetEmitTermReady,
    kernelCheckLiveHostModuleCheckComposeSubsetEmitTermSource. -/
def slakeTypecheckHostModuleCheckComposeSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.hostFrontLiveHostModuleCheckComposeSubsetEmitTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckComposeSubsetEmitTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckComposeSubsetEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckComposeSubsetEmitTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckComposeSubsetEmitTerm.lean.
    Ready is hostFrontLiveHostModuleCheckComposeSubsetEmitTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckComposeSubsetEmitTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckComposeSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckComposeSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckComposeSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckComposeSubsetEmitTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.main args
