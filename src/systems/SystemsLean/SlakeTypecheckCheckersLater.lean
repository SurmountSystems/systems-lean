/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckCheckersLater.
  Short role: named driver for just slake-typecheck-checkerslater.
  Ready is HostFrontLiveCheckersLater parse plus HostKernel.kernelCheck of live
  HostModuleCheckCheckersLater.lean, not := true, not lake build
  SystemsLean.HostModuleCheckCheckersLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CHECKERS-LATER,
  SLAKE_TYPECHECK_CHECKERS_LATER_V0, slake-typecheck-checkerslater,
  slakeTypecheckCheckersLaterReady, kernelCheckLiveCheckersLaterSource,
  PARSE-LIVE-CHECKERS-LATER, SKELETON.
  Module: SystemsLean.SlakeTypecheckCheckersLater
  Checkable writer: just slake-typecheck-checkerslater (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCheckersLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CHECKERS_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CHECKERS-LATER"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckCheckersLater. -/
def justRecipeSlakeTypecheckCheckersLater : String :=
  "slake-typecheck-checkerslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCheckersLaterRel : String :=
  SystemsLean.HostFrontLiveCheckersLater.liveCheckersLaterRel

/-- Ready names HostFrontLiveCheckersLater parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCheckersLaterReady,
    kernelCheckLiveCheckersLaterSource. -/
def slakeTypecheckCheckersLaterReady : Bool :=
  SystemsLean.HostFrontLiveCheckersLater.hostFrontLiveCheckersLaterReady

/-- Honesty: this command is not lake build of HostModuleCheckCheckersLater. -/
def slakeTypecheckCheckersLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCheckersLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCheckersLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckCheckersLater.lean.
    Ready is HostFrontLiveCheckersLater.hostFrontLiveCheckersLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCheckersLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCheckersLater} =="
  IO.println s!"  host={hostId} file={liveCheckersLaterRel}"
  unless (!slakeTypecheckCheckersLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCheckersLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCheckersLater.main args
