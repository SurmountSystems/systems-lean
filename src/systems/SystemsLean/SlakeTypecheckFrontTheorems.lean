/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFrontTheorems.
  Short role: named driver for just slake-typecheck-fronttheorems.
  Ready is HostFrontLiveFrontTheorems parse plus HostKernel.kernelCheck of live
  HostFrontTheorems.lean, not := true, not lake build SystemsLean.HostFrontTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-FRONT-THEOREMS,
  SLAKE_TYPECHECK_FRONT_THEOREMS_V0, slake-typecheck-fronttheorems,
  slakeTypecheckFrontTheoremsReady, kernelCheckLiveFrontTheoremsSource,
  PARSE-LIVE-FRONT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckFrontTheorems
  Checkable writer: just slake-typecheck-fronttheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFrontTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FRONT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FRONT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostFrontTheorems. -/
def justRecipeSlakeTypecheckFrontTheorems : String :=
  "slake-typecheck-fronttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontTheoremsRel : String :=
  SystemsLean.HostFrontLiveFrontTheorems.liveFrontTheoremsRel

/-- Ready names HostFrontLiveFrontTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckFrontTheoremsReady,
    kernelCheckLiveFrontTheoremsSource. -/
def slakeTypecheckFrontTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveFrontTheorems.hostFrontLiveFrontTheoremsReady

/-- Honesty: this command is not lake build of HostFrontTheorems. -/
def slakeTypecheckFrontTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFrontTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFrontTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFrontTheorems.lean.
    Ready is hostFrontLiveFrontTheoremsReady (parse plus HostKernel.kernelCheck),
    not := true. Evaluated inside HostFrontLiveFrontTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFrontTheorems} =="
  IO.println s!"  host={hostId} file={liveFrontTheoremsRel}"
  unless (!slakeTypecheckFrontTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFrontTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFrontTheorems.main args
