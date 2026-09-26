/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckErasureTerm.
  Short role: named driver for lean --run of
  HostModuleCheckErasureTerm.lean.
  Ready is HostFrontLiveHostModuleCheckErasureTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckErasureTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckErasureTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckErasureTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURETERM
  SLAKE_TYPECHECK_HOSTMODULECHECKERASURETERM_V0
  PARSE-LIVE-HOSTMODULECHECKERASURETERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckerasureterm,
  slakeTypecheckHostModuleCheckErasureTermReady,
  kernelCheckLiveHostModuleCheckErasureTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckErasureTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckErasureTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKERASURETERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKERASURETERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckErasureTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckErasureTerm : String :=
  "slake-typecheck-hostmodulecheckerasureterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckErasureTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureTerm.liveHostModuleCheckErasureTermRel

/-- Ready names HostFrontLiveHostModuleCheckErasureTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckErasureTermReady,
    kernelCheckLiveHostModuleCheckErasureTermSource. -/
def slakeTypecheckHostModuleCheckErasureTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureTerm.hostFrontLiveHostModuleCheckErasureTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckErasureTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckErasureTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckErasureTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckErasureTerm.lean.
    Ready is hostFrontLiveHostModuleCheckErasureTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckErasureTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckErasureTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckErasureTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureTermRel}"
  unless (!slakeTypecheckHostModuleCheckErasureTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckErasureTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckErasureTerm.main args
