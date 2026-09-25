/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFront.
  Short role: named driver for lean --run of HostFront.lean.
  Ready is HostFrontLiveHostFront parse plus HostKernel.kernelCheck of live
  HostFront.lean, not := true, not lake build SystemsLean.HostFront.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-FRONT,
  SLAKE_TYPECHECK_HOST_FRONT_V0, slake-typecheck-hostfront,
  slakeTypecheckHostFrontReady, kernelCheckLiveHostFrontSource,
  PARSE-LIVE-HOST-FRONT.
  Module: SystemsLean.SlakeTypecheckHostFront
  Checkable writer: lean --run SlakeTypecheckHostFront (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostFront

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_FRONT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-FRONT"

/-- Named recipe. Not lake build SystemsLean.HostFront. -/
def justRecipeSlakeTypecheckHostFront : String :=
  "slake-typecheck-hostfront"

/-- Live file relative to repo root. -/
def liveHostFrontRel : String :=
  SystemsLean.HostFrontLiveHostFront.liveHostFrontRel

/-- Ready names HostFrontLiveHostFront parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostFrontReady,
    kernelCheckLiveHostFrontSource. -/
def slakeTypecheckHostFrontReady : Bool :=
  SystemsLean.HostFrontLiveHostFront.hostFrontLiveHostFrontReady

/-- Honesty: this command is not lake build of HostFront. -/
def slakeTypecheckHostFrontDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostFrontFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostFrontOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFront.lean.
    Ready is HostFrontLiveHostFront.hostFrontLiveHostFrontReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostFront.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostFront} =="
  IO.println s!"  host={hostId} file={liveHostFrontRel}"
  unless (!slakeTypecheckHostFrontFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostFrontOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostFront.main args
