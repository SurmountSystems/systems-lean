/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultTheorems.
  Short role: named driver for just slake-typecheck-multtheorems.
  Ready is HostFrontLiveMultTheorems parse plus HostKernel.kernelCheck of live
  MultTheorems.lean, not := true, not lake build SystemsLean.MultTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-THEOREMS,
  SLAKE_TYPECHECK_MULT_THEOREMS_V0, slake-typecheck-multtheorems,
  slakeTypecheckMultTheoremsReady, kernelCheckLiveMultTheoremsSource,
  PARSE-LIVE-MULT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckMultTheorems
  Checkable writer: just slake-typecheck-multtheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.MultTheorems. -/
def justRecipeSlakeTypecheckMultTheorems : String :=
  "slake-typecheck-multtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultTheoremsRel : String :=
  SystemsLean.HostFrontLiveMultTheorems.liveMultTheoremsRel

/-- Ready names HostFrontLiveMultTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckMultTheoremsReady,
    kernelCheckLiveMultTheoremsSource. -/
def slakeTypecheckMultTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveMultTheorems.hostFrontLiveMultTheoremsReady

/-- Honesty: this command is not lake build of MultTheorems. -/
def slakeTypecheckMultTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultTheorems.lean.
    Ready is HostFrontLiveMultTheorems.hostFrontLiveMultTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultTheorems} =="
  IO.println s!"  host={hostId} file={liveMultTheoremsRel}"
  unless (!slakeTypecheckMultTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultTheorems.main args
