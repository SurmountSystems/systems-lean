/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFront.
  Short role: named driver for just slake-typecheck-front.
  Ready is HostFrontLiveFront parse plus HostKernel.kernelCheck of live
  HostFront.lean, not := true, not lake build SystemsLean.HostFront.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-FRONT,
  SLAKE_TYPECHECK_FRONT_V0, slake-typecheck-front, slakeTypecheckFrontReady,
  kernelCheckLiveFrontSource, PARSE-LIVE-FRONT, SKELETON.
  Module: SystemsLean.SlakeTypecheckFront
  Checkable writer: just slake-typecheck-front (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFront

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FRONT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FRONT"

/-- Named just recipe. Not lake build SystemsLean.HostFront. -/
def justRecipeSlakeTypecheckFront : String := "slake-typecheck-front"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontRel : String := SystemsLean.HostFrontLiveFront.liveFrontRel

/-- Ready names HostFrontLiveFront parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckFrontReady, kernelCheckLiveFrontSource. -/
def slakeTypecheckFrontReady : Bool :=
  SystemsLean.HostFrontLiveFront.hostFrontLiveFrontReady

/-- Honesty: this command is not lake build of HostFront. -/
def slakeTypecheckFrontDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFrontFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFrontOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFront.lean.
    Ready is HostFrontLiveFront.hostFrontLiveFrontReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveFront.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFront} =="
  IO.println s!"  host={hostId} file={liveFrontRel}"
  unless (!slakeTypecheckFrontFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFrontOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFront.main args
