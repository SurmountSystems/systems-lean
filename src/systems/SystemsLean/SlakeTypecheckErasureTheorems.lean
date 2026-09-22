/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ErasureTheorems.
  Short role: named driver for just slake-typecheck-erasuretheorems.
  Ready is HostFrontLiveErasureTheorems parse plus HostKernel.kernelCheck of live
  ErasureTheorems.lean, not := true, not lake build SystemsLean.ErasureTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-ERASURE-THEOREMS,
  SLAKE_TYPECHECK_ERASURE_THEOREMS_V0, slake-typecheck-erasuretheorems,
  slakeTypecheckErasureTheoremsReady, kernelCheckLiveErasureTheoremsSource,
  PARSE-LIVE-ERASURE-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckErasureTheorems
  Checkable writer: just slake-typecheck-erasuretheorems (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveErasureTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ErasureTheorems. -/
def justRecipeSlakeTypecheckErasureTheorems : String :=
  "slake-typecheck-erasuretheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureTheoremsRel : String :=
  SystemsLean.HostFrontLiveErasureTheorems.liveErasureTheoremsRel

/-- Ready names HostFrontLiveErasureTheorems parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckErasureTheoremsReady,
    kernelCheckLiveErasureTheoremsSource. -/
def slakeTypecheckErasureTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveErasureTheorems.hostFrontLiveErasureTheoremsReady

/-- Honesty: this command is not lake build of ErasureTheorems. -/
def slakeTypecheckErasureTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ErasureTheorems.lean.
    Ready is HostFrontLiveErasureTheorems.hostFrontLiveErasureTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveErasureTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasureTheorems} =="
  IO.println s!"  host={hostId} file={liveErasureTheoremsRel}"
  unless (!slakeTypecheckErasureTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasureTheorems.main args
