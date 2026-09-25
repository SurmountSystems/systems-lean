/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFrontTheorems.
  Short role: named driver for lean --run of HostFrontTheorems.lean.
  Ready is HostFrontLiveHostFrontTheorems parse plus HostKernel.kernelCheck of
  live HostFrontTheorems.lean, not := true, not lake build
  SystemsLean.HostFrontTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-FRONT-THEOREMS,
  SLAKE_TYPECHECK_HOST_FRONT_THEOREMS_V0, slake-typecheck-hostfronttheorems,
  slakeTypecheckHostFrontTheoremsReady, kernelCheckLiveHostFrontTheoremsSource,
  PARSE-LIVE-HOST-FRONT-THEOREMS.
  Module: SystemsLean.SlakeTypecheckHostFrontTheorems
  Checkable writer: lean --run SlakeTypecheckHostFrontTheorems (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostFrontTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_FRONT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-FRONT-THEOREMS"

/-- Named recipe. Not lake build SystemsLean.HostFrontTheorems. -/
def justRecipeSlakeTypecheckHostFrontTheorems : String :=
  "slake-typecheck-hostfronttheorems"

/-- Live file relative to repo root. -/
def liveHostFrontTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostFrontTheorems.liveHostFrontTheoremsRel

/-- Ready names HostFrontLiveHostFrontTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostFrontTheoremsReady,
    kernelCheckLiveHostFrontTheoremsSource. -/
def slakeTypecheckHostFrontTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostFrontTheorems.hostFrontLiveHostFrontTheoremsReady

/-- Honesty: this command is not lake build of HostFrontTheorems. -/
def slakeTypecheckHostFrontTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostFrontTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostFrontTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFrontTheorems.lean.
    Ready is HostFrontLiveHostFrontTheorems.hostFrontLiveHostFrontTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostFrontTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostFrontTheorems} =="
  IO.println s!"  host={hostId} file={liveHostFrontTheoremsRel}"
  unless (!slakeTypecheckHostFrontTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostFrontTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostFrontTheorems.main args
