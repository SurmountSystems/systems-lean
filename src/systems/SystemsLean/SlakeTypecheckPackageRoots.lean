/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageRoots.
  Short role: named driver for just slake-typecheck-packageroots.
  Ready is HostFrontLivePackageRoots parse plus HostKernel.kernelCheck of live
  HostPackageRoots.lean, not := true, not lake build SystemsLean.HostPackageRoots.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PACKAGEROOTS,
  SLAKE_TYPECHECK_PACKAGEROOTS_V0, slake-typecheck-packageroots, slakeTypecheckPackageRootsReady,
  kernelCheckLivePackageRootsSource, PARSE-LIVE-PACKAGE-ROOTS, SKELETON.
  Module: SystemsLean.SlakeTypecheckPackageRoots
  Checkable writer: just slake-typecheck-packageroots (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePackageRoots

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PACKAGEROOTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PACKAGEROOTS"

/-- Named just recipe. Not lake build SystemsLean.HostPackageRoots. -/
def justRecipeSlakeTypecheckPackageRoots : String := "slake-typecheck-packageroots"

/-- Live file relative to repo root. Dual-pin path. -/
def livePackageRootsRel : String := SystemsLean.HostFrontLivePackageRoots.livePackageRootsRel

/-- Ready names HostFrontLivePackageRoots parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckPackageRootsReady, kernelCheckLivePackageRootsSource. -/
def slakeTypecheckPackageRootsReady : Bool :=
  SystemsLean.HostFrontLivePackageRoots.hostFrontLivePackageRootsReady

/-- Honesty: this command is not lake build of HostPackageRoots. -/
def slakeTypecheckPackageRootsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPackageRootsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPackageRootsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageRoots.lean.
    Ready is HostFrontLivePackageRoots.hostFrontLivePackageRootsReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLivePackageRoots.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPackageRoots} =="
  IO.println s!"  host={hostId} file={livePackageRootsRel}"
  unless (!slakeTypecheckPackageRootsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPackageRootsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePackageRoots.main args
