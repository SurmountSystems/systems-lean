/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProductOutKernelTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProductOutKernelTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProductOutKernelTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProductOutKernelTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProductOutKernelTerm.
  liveRel is HostModuleCheckProductOutKernelTerm.lean.
  This wrap is HostModuleCheckProductOutKernelTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTOUTKERNELTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTOUTKERNELTERM,
  slake-typecheck-hostmodulecheckproductoutkernelterm,
  slakeTypecheckHostModuleCheckProductOutKernelTermReady,
  kernelCheckLiveHostModuleCheckProductOutKernelTermSource,
  PARSE-LIVE-HOSTMODULECHECKPRODUCTOUTKERNELTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProductOutKernelTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProductOutKernelTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTOUTKERNELTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTOUTKERNELTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProductOutKernelTerm :
    String :=
  "slake-typecheck-hostmodulecheckproductoutkernelterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProductOutKernelTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm.liveHostModuleCheckProductOutKernelTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProductOutKernelTermReady,
    kernelCheckLiveHostModuleCheckProductOutKernelTermSource. -/
def slakeTypecheckHostModuleCheckProductOutKernelTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm.hostFrontLiveHostModuleCheckProductOutKernelTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProductOutKernelTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProductOutKernelTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProductOutKernelTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProductOutKernelTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProductOutKernelTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProductOutKernelTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProductOutKernelTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProductOutKernelTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProductOutKernelTermRel}"
  unless (!slakeTypecheckHostModuleCheckProductOutKernelTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductOutKernelTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductOutKernelTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProductOutKernelTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm.main args
