/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostResidualShrinkTheorems.
  Short role: named driver for just slake-typecheck-hostresidualshrinktheorems.
  Ready is HostFrontLiveHostResidualShrinkTheorems parse plus HostKernel.kernelCheck
  of live HostResidualShrinkTheorems.lean, not := true, not lake build
  SystemsLean.HostResidualShrinkTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostResidualShrink is not a prefix):
  SlakeTypecheckHostResidualShrinkTheorems
  HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK-THEOREMS
  SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_THEOREMS_V0
  PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS
  HOST-RESIDUAL-SHRINK-THEOREMS
  slake-typecheck-hostresidualshrinktheorems
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostresidualshrinktheorems,
  slakeTypecheckHostResidualShrinkTheoremsReady,
  kernelCheckLiveHostResidualShrinkTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostResidualShrinkTheorems
  Checkable writer: just slake-typecheck-hostresidualshrinktheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostResidualShrinkTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.HostResidualShrinkTheorems. -/
def justRecipeSlakeTypecheckHostResidualShrinkTheorems : String :=
  "slake-typecheck-hostresidualshrinktheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostResidualShrinkTheoremsRel : String :=
  SystemsLean.HostFrontLiveHostResidualShrinkTheorems.liveHostResidualShrinkTheoremsRel

/-- Ready names HostFrontLiveHostResidualShrinkTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostResidualShrinkTheoremsReady,
    kernelCheckLiveHostResidualShrinkTheoremsSource. -/
def slakeTypecheckHostResidualShrinkTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveHostResidualShrinkTheorems.hostFrontLiveHostResidualShrinkTheoremsReady

/-- Honesty: this command is not lake build of HostResidualShrinkTheorems. -/
def slakeTypecheckHostResidualShrinkTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostResidualShrinkTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostResidualShrinkTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostResidualShrinkTheorems.lean.
    Ready is HostFrontLiveHostResidualShrinkTheorems.hostFrontLiveHostResidualShrinkTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostResidualShrinkTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostResidualShrinkTheorems} =="
  IO.println s!"  host={hostId} file={liveHostResidualShrinkTheoremsRel}"
  unless (!slakeTypecheckHostResidualShrinkTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostResidualShrinkTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostResidualShrinkTheorems.main args
