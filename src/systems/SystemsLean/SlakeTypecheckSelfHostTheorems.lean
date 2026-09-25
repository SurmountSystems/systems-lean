/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SelfHostTheorems.
  Short role: named driver for just slake-typecheck-selfhosttheorems.
  Ready is HostFrontLiveSelfHostTheorems parse plus HostKernel.kernelCheck
  of live SelfHostTheorems.lean, not := true, not lake build
  SystemsLean.SelfHostTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SelfHost wrap is not a prefix):
  SlakeTypecheckSelfHostTheorems
  HOST-SLAKE-TYPECHECK-SELF-HOST-THEOREMS
  SLAKE_TYPECHECK_SELF_HOST_THEOREMS_V0
  PARSE-LIVE-SELF-HOST-THEOREMS
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-selfhosttheorems,
  slakeTypecheckSelfHostTheoremsReady,
  kernelCheckLiveSelfHostTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSelfHostTheorems
  Checkable writer: just slake-typecheck-selfhosttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSelfHostTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SELF_HOST_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SELF-HOST-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SelfHostTheorems. -/
def justRecipeSlakeTypecheckSelfHostTheorems : String :=
  "slake-typecheck-selfhosttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostTheoremsRel : String :=
  SystemsLean.HostFrontLiveSelfHostTheorems.liveSelfHostTheoremsRel

/-- Ready names HostFrontLiveSelfHostTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSelfHostTheoremsReady,
    kernelCheckLiveSelfHostTheoremsSource. -/
def slakeTypecheckSelfHostTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSelfHostTheorems.hostFrontLiveSelfHostTheoremsReady

/-- Honesty: this command is not lake build of SelfHostTheorems. -/
def slakeTypecheckSelfHostTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSelfHostTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSelfHostTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SelfHostTheorems.lean.
    Ready is HostFrontLiveSelfHostTheorems.hostFrontLiveSelfHostTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSelfHostTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSelfHostTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSelfHostTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveSelfHostTheoremsRel}"
  unless (!slakeTypecheckSelfHostTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSelfHostTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSelfHostTheorems.main args
