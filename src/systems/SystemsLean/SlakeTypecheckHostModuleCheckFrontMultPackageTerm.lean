/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFrontMultPackageTerm.
  Short role: named driver for lean --run of
  HostModuleCheckFrontMultPackageTerm.lean.
  Ready is HostFrontLiveHostModuleCheckFrontMultPackageTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckFrontMultPackageTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFrontMultPackageTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFrontMultPackageTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFRONTMULTPACKAGETERM
  SLAKE_TYPECHECK_HOSTMODULECHECKFRONTMULTPACKAGETERM_V0
  PARSE-LIVE-HOSTMODULECHECKFRONTMULTPACKAGETERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfrontmultpackageterm,
  slakeTypecheckHostModuleCheckFrontMultPackageTermReady,
  kernelCheckLiveHostModuleCheckFrontMultPackageTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFrontMultPackageTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFrontMultPackageTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFRONTMULTPACKAGETERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFRONTMULTPACKAGETERM"

/-- Named recipe string. Not lake build
    SystemsLean.HostModuleCheckFrontMultPackageTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFrontMultPackageTerm : String :=
  "slake-typecheck-hostmodulecheckfrontmultpackageterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFrontMultPackageTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontMultPackageTerm.liveHostModuleCheckFrontMultPackageTermRel

/-- Ready names HostFrontLiveHostModuleCheckFrontMultPackageTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFrontMultPackageTermReady,
    kernelCheckLiveHostModuleCheckFrontMultPackageTermSource. -/
def slakeTypecheckHostModuleCheckFrontMultPackageTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontMultPackageTerm.hostFrontLiveHostModuleCheckFrontMultPackageTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFrontMultPackageTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFrontMultPackageTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFrontMultPackageTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFrontMultPackageTerm.lean.
    Ready is hostFrontLiveHostModuleCheckFrontMultPackageTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFrontMultPackageTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFrontMultPackageTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFrontMultPackageTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFrontMultPackageTermRel}"
  unless (!slakeTypecheckHostModuleCheckFrontMultPackageTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFrontMultPackageTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFrontMultPackageTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFrontMultPackageTerm.main args
