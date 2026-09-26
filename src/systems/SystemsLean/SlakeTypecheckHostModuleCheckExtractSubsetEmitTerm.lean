/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckExtractSubsetEmitTerm.
  Short role: named driver for lean --run of
  HostModuleCheckExtractSubsetEmitTerm.lean.
  Ready is HostFrontLiveHostModuleCheckExtractSubsetEmitTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckExtractSubsetEmitTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckExtractSubsetEmitTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckExtractSubsetEmitTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEXTRACTSUBSETEMITTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEXTRACTSUBSETEMITTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEXTRACTSUBSETEMITTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckextractsubsetemitterm,
  slakeTypecheckHostModuleCheckExtractSubsetEmitTermReady,
  kernelCheckLiveHostModuleCheckExtractSubsetEmitTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckExtractSubsetEmitTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetEmitTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEXTRACTSUBSETEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEXTRACTSUBSETEMITTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckExtractSubsetEmitTerm : String :=
  "slake-typecheck-hostmodulecheckextractsubsetemitterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckExtractSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetEmitTerm.liveHostModuleCheckExtractSubsetEmitTermRel

/-- Ready names HostFrontLiveHostModuleCheckExtractSubsetEmitTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckExtractSubsetEmitTermReady,
    kernelCheckLiveHostModuleCheckExtractSubsetEmitTermSource. -/
def slakeTypecheckHostModuleCheckExtractSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetEmitTerm.hostFrontLiveHostModuleCheckExtractSubsetEmitTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckExtractSubsetEmitTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckExtractSubsetEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckExtractSubsetEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckExtractSubsetEmitTerm.lean.
    Ready is hostFrontLiveHostModuleCheckExtractSubsetEmitTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckExtractSubsetEmitTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckExtractSubsetEmitTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetEmitTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckExtractSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckExtractSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckExtractSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckExtractSubsetEmitTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetEmitTerm.main args
