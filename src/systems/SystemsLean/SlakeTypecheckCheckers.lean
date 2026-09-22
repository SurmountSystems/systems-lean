/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckCheckers.
  Short role: named driver for just slake-typecheck-checkers.
  Ready is HostFrontLiveCheckers parse plus HostKernel.kernelCheck of live
  HostModuleCheckCheckers.lean, not := true, not lake build
  SystemsLean.HostModuleCheckCheckers.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CHECKERS,
  SLAKE_TYPECHECK_CHECKERS_V0, slake-typecheck-checkers,
  slakeTypecheckCheckersReady, kernelCheckLiveCheckersSource,
  PARSE-LIVE-CHECKERS, SKELETON.
  Module: SystemsLean.SlakeTypecheckCheckers
  Checkable writer: just slake-typecheck-checkers (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCheckers

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CHECKERS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CHECKERS"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckCheckers. -/
def justRecipeSlakeTypecheckCheckers : String :=
  "slake-typecheck-checkers"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCheckersRel : String :=
  SystemsLean.HostFrontLiveCheckers.liveCheckersRel

/-- Ready names HostFrontLiveCheckers parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCheckersReady,
    kernelCheckLiveCheckersSource. -/
def slakeTypecheckCheckersReady : Bool :=
  SystemsLean.HostFrontLiveCheckers.hostFrontLiveCheckersReady

/-- Honesty: this command is not lake build of HostModuleCheckCheckers. -/
def slakeTypecheckCheckersDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCheckersFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCheckersOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckCheckers.lean.
    Ready is HostFrontLiveCheckers.hostFrontLiveCheckersReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCheckers.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCheckers} =="
  IO.println s!"  host={hostId} file={liveCheckersRel}"
  unless (!slakeTypecheckCheckersFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCheckersOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCheckers.main args
