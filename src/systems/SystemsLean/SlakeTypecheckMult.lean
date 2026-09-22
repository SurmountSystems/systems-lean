/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Mult.
  Short role: named driver for just slake-typecheck-mult.
  Ready is HostFrontLiveMult parse plus HostKernel.kernelCheck of live
  Mult.lean, not := true, not lake build SystemsLean.Mult.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT,
  SLAKE_TYPECHECK_MULT_V0, slake-typecheck-mult, slakeTypecheckMultReady,
  kernelCheckLiveMultSource, PARSE-LIVE-MULT, SKELETON.
  Module: SystemsLean.SlakeTypecheckMult
  Checkable writer: just slake-typecheck-mult (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMult

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT"

/-- Named just recipe. Not lake build SystemsLean.Mult. -/
def justRecipeSlakeTypecheckMult : String := "slake-typecheck-mult"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultRel : String := SystemsLean.HostFrontLiveMult.liveMultRel

/-- Ready names HostFrontLiveMult parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckMultReady, kernelCheckLiveMultSource. -/
def slakeTypecheckMultReady : Bool :=
  SystemsLean.HostFrontLiveMult.hostFrontLiveMultReady

/-- Honesty: this command is not lake build of Mult. -/
def slakeTypecheckMultDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Mult.lean.
    Ready is HostFrontLiveMult.hostFrontLiveMultReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveMult.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMult} =="
  IO.println s!"  host={hostId} file={liveMultRel}"
  unless (!slakeTypecheckMultFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMult.main args
