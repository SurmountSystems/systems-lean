/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitApplyTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitApplyTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitApplyTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitApplyTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitApplyTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitApplyTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITAPPLYTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITAPPLYTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITAPPLYTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitapplyterm,
  slakeTypecheckHostModuleCheckEmitApplyTermReady,
  kernelCheckLiveHostModuleCheckEmitApplyTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitApplyTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitApplyTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITAPPLYTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITAPPLYTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitApplyTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitApplyTerm : String :=
  "slake-typecheck-hostmodulecheckemitapplyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitApplyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitApplyTerm.liveHostModuleCheckEmitApplyTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitApplyTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitApplyTermReady,
    kernelCheckLiveHostModuleCheckEmitApplyTermSource. -/
def slakeTypecheckHostModuleCheckEmitApplyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitApplyTerm.hostFrontLiveHostModuleCheckEmitApplyTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitApplyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitApplyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitApplyTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitApplyTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitApplyTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitApplyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitApplyTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitApplyTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitApplyTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitApplyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitApplyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitApplyTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitApplyTerm.main args
