/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostResidualShrink.
  Short role: named driver for just slake-typecheck-hostresidualshrink.
  Ready is HostFrontLiveHostResidualShrink parse plus HostKernel.kernelCheck
  of live HostResidualShrink.lean, not := true, not lake build
  SystemsLean.HostResidualShrink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostResidualShrink is not a prefix):
  SlakeTypecheckHostResidualShrink
  HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK
  SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_V0
  PARSE-LIVE-HOST-RESIDUAL-SHRINK
  slake-typecheck-hostresidualshrink
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostresidualshrink,
  slakeTypecheckHostResidualShrinkReady,
  kernelCheckLiveHostResidualShrinkSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostResidualShrink
  Checkable writer: just slake-typecheck-hostresidualshrink
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostResidualShrink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK"

/-- Named just recipe. Not lake build SystemsLean.HostResidualShrink. -/
def justRecipeSlakeTypecheckHostResidualShrink : String :=
  "slake-typecheck-hostresidualshrink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostResidualShrinkRel : String :=
  SystemsLean.HostFrontLiveHostResidualShrink.liveHostResidualShrinkRel

/-- Ready names HostFrontLiveHostResidualShrink parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostResidualShrinkReady,
    kernelCheckLiveHostResidualShrinkSource. -/
def slakeTypecheckHostResidualShrinkReady : Bool :=
  SystemsLean.HostFrontLiveHostResidualShrink.hostFrontLiveHostResidualShrinkReady

/-- Honesty: this command is not lake build of HostResidualShrink. -/
def slakeTypecheckHostResidualShrinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostResidualShrinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostResidualShrinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostResidualShrink.lean.
    Ready is HostFrontLiveHostResidualShrink.hostFrontLiveHostResidualShrinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostResidualShrink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostResidualShrink} =="
  IO.println s!"  host={hostId} file={liveHostResidualShrinkRel}"
  unless (!slakeTypecheckHostResidualShrinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostResidualShrinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostResidualShrink.main args
