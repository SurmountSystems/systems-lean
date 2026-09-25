/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitBodyTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitBodyTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitBodyTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitBodyTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitBodyTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitBodyTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITBODYTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITBODYTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITBODYTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitbodyterm,
  slakeTypecheckHostModuleCheckEmitBodyTermReady,
  kernelCheckLiveHostModuleCheckEmitBodyTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitBodyTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITBODYTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITBODYTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitBodyTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitBodyTerm : String :=
  "slake-typecheck-hostmodulecheckemitbodyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitBodyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTerm.liveHostModuleCheckEmitBodyTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitBodyTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitBodyTermReady,
    kernelCheckLiveHostModuleCheckEmitBodyTermSource. -/
def slakeTypecheckHostModuleCheckEmitBodyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTerm.hostFrontLiveHostModuleCheckEmitBodyTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitBodyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitBodyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitBodyTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitBodyTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitBodyTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitBodyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitBodyTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitBodyTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitBodyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitBodyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitBodyTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTerm.main args
