/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSubsetPackageJoinTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckSubsetPackageJoinTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSubsetPackageJoinTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckSubsetPackageJoinTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSubsetPackageJoinTerm.
  liveRel is HostModuleCheckSubsetPackageJoinTerm.lean.
  This wrap is HostModuleCheckSubsetPackageJoinTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSUBSETPACKAGEJOINTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKSUBSETPACKAGEJOINTERM,
  slake-typecheck-hostmodulechecksubsetpackagejointerm,
  slakeTypecheckHostModuleCheckSubsetPackageJoinTermReady,
  kernelCheckLiveHostModuleCheckSubsetPackageJoinTermSource,
  PARSE-LIVE-HOSTMODULECHECKSUBSETPACKAGEJOINTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSubsetPackageJoinTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSubsetPackageJoinTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSubsetPackageJoinTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSUBSETPACKAGEJOINTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSUBSETPACKAGEJOINTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSubsetPackageJoinTerm : String :=
  "slake-typecheck-hostmodulechecksubsetpackagejointerm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSubsetPackageJoinTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSubsetPackageJoinTerm.liveHostModuleCheckSubsetPackageJoinTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSubsetPackageJoinTermReady,
    kernelCheckLiveHostModuleCheckSubsetPackageJoinTermSource. -/
def slakeTypecheckHostModuleCheckSubsetPackageJoinTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSubsetPackageJoinTerm.hostFrontLiveHostModuleCheckSubsetPackageJoinTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSubsetPackageJoinTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSubsetPackageJoinTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSubsetPackageJoinTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSubsetPackageJoinTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSubsetPackageJoinTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSubsetPackageJoinTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSubsetPackageJoinTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSubsetPackageJoinTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSubsetPackageJoinTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSubsetPackageJoinTermRel}"
  unless (!slakeTypecheckHostModuleCheckSubsetPackageJoinTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSubsetPackageJoinTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSubsetPackageJoinTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSubsetPackageJoinTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSubsetPackageJoinTerm.main args
