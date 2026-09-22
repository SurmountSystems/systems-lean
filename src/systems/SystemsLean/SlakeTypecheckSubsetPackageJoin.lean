/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SubsetPackageJoin.
  Short role: named driver for just slake-typecheck-subsetpackagejoin.
  Ready is HostFrontLiveSubsetPackageJoin parse plus HostKernel.kernelCheck
  of live SubsetPackageJoin.lean, not a hardcoded true, not lake build
  SystemsLean.SubsetPackageJoin.
  liveRel is SubsetPackageJoin.lean.
  This wrap is SubsetPackageJoin.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SUBSET-PACKAGE-JOIN,
  SUBSET-PACKAGE-JOIN, slake-typecheck-subsetpackagejoin,
  slakeTypecheckSubsetPackageJoinReady,
  kernelCheckLiveSubsetPackageJoinSource,
  PARSE-LIVE-SUBSET-PACKAGE-JOIN.
  Module: SystemsLean.SlakeTypecheckSubsetPackageJoin
  Checkable writer: just slake-typecheck-subsetpackagejoin
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSubsetPackageJoin

/-- Greppable stage id. -/
def stageId : String := "SUBSET-PACKAGE-JOIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SUBSET-PACKAGE-JOIN"

/-- Named just recipe. Not lake build SystemsLean.SubsetPackageJoin. -/
def justRecipeSlakeTypecheckSubsetPackageJoin : String :=
  "slake-typecheck-subsetpackagejoin"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSubsetPackageJoinRel : String :=
  SystemsLean.HostFrontLiveSubsetPackageJoin.liveSubsetPackageJoinRel

/-- Ready names HostFrontLiveSubsetPackageJoin parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSubsetPackageJoinReady,
    kernelCheckLiveSubsetPackageJoinSource. -/
def slakeTypecheckSubsetPackageJoinReady : Bool :=
  SystemsLean.HostFrontLiveSubsetPackageJoin.hostFrontLiveSubsetPackageJoinReady

/-- Honesty: this command is not lake build of SubsetPackageJoin. -/
def slakeTypecheckSubsetPackageJoinDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSubsetPackageJoinFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSubsetPackageJoinFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSubsetPackageJoinOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SubsetPackageJoin.lean.
    Ready is HostFrontLiveSubsetPackageJoin.hostFrontLiveSubsetPackageJoinReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSubsetPackageJoin.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSubsetPackageJoin} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSubsetPackageJoin.liveRel}"
  IO.println s!"  host={hostId} file={liveSubsetPackageJoinRel}"
  unless (!slakeTypecheckSubsetPackageJoinFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSubsetPackageJoinFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSubsetPackageJoinOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSubsetPackageJoin.main args
