/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SubsetFront.
  Short role: named driver for just slake-typecheck-subsetfront.
  Ready is HostFrontLiveSubsetFront parse plus HostKernel.kernelCheck
  of live SubsetFront.lean, not a hardcoded true, not lake build
  SystemsLean.SubsetFront.
  liveRel is SubsetFront.lean.
  This wrap is SubsetFront.lean. It is not SubsetFrontTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SUBSET-FRONT,
  SLAKE_TYPECHECK_SUBSET_FRONT, slake-typecheck-subsetfront,
  slakeTypecheckSubsetFrontReady,
  kernelCheckLiveSubsetFrontSource,
  PARSE-LIVE-SUBSET-FRONT.
  Module: SystemsLean.SlakeTypecheckSubsetFront
  Checkable writer: just slake-typecheck-subsetfront
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSubsetFront

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SUBSET_FRONT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SUBSET-FRONT"

/-- Named just recipe. Not lake build SystemsLean.SubsetFront. -/
def justRecipeSlakeTypecheckSubsetFront : String :=
  "slake-typecheck-subsetfront"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSubsetFrontRel : String :=
  SystemsLean.HostFrontLiveSubsetFront.liveSubsetFrontRel

/-- Ready names HostFrontLiveSubsetFront parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSubsetFrontReady,
    kernelCheckLiveSubsetFrontSource. -/
def slakeTypecheckSubsetFrontReady : Bool :=
  SystemsLean.HostFrontLiveSubsetFront.hostFrontLiveSubsetFrontReady

/-- Honesty: this command is not lake build of SubsetFront. -/
def slakeTypecheckSubsetFrontDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSubsetFrontFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSubsetFrontFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSubsetFrontOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SubsetFront.lean.
    Ready is HostFrontLiveSubsetFront.hostFrontLiveSubsetFrontReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSubsetFront.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSubsetFront} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSubsetFront.liveRel}"
  IO.println s!"  host={hostId} file={liveSubsetFrontRel}"
  unless (!slakeTypecheckSubsetFrontFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSubsetFrontFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSubsetFrontOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSubsetFront.main args
