/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitExtractScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitExtractScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitExtractScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitExtractScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitExtractScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitextractscaffoldterm,
  slakeTypecheckHostModuleCheckEmitExtractScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitExtractScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitExtractScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitExtractScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitExtractScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitextractscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitExtractScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm.liveHostModuleCheckEmitExtractScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitExtractScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitExtractScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitExtractScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm.hostFrontLiveHostModuleCheckEmitExtractScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitExtractScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitExtractScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitExtractScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitExtractScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitExtractScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitExtractScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitExtractScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitExtractScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitExtractScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitExtractScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm.main args
