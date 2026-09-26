/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckExtractTerm.
  Short role: named driver for lean --run of
  HostModuleCheckExtractTerm.lean.
  Ready is HostFrontLiveHostModuleCheckExtractTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckExtractTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckExtractTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckExtractTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEXTRACTTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEXTRACTTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEXTRACTTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckextractterm,
  slakeTypecheckHostModuleCheckExtractTermReady,
  kernelCheckLiveHostModuleCheckExtractTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckExtractTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckExtractTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEXTRACTTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEXTRACTTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckExtractTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckExtractTerm : String :=
  "slake-typecheck-hostmodulecheckextractterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckExtractTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractTerm.liveHostModuleCheckExtractTermRel

/-- Ready names HostFrontLiveHostModuleCheckExtractTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckExtractTermReady,
    kernelCheckLiveHostModuleCheckExtractTermSource. -/
def slakeTypecheckHostModuleCheckExtractTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractTerm.hostFrontLiveHostModuleCheckExtractTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckExtractTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckExtractTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckExtractTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckExtractTerm.lean.
    Ready is hostFrontLiveHostModuleCheckExtractTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckExtractTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckExtractTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckExtractTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckExtractTermRel}"
  unless (!slakeTypecheckHostModuleCheckExtractTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckExtractTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckExtractTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckExtractTerm.main args
