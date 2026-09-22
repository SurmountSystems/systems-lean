/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostResidualShrinkTermOk.
  Short role: named driver for just slake-typecheck-hostresidualshrinktermok.
  Ready is HostFrontLiveHostResidualShrinkTermOk parse plus HostKernel.kernelCheck
  of live HostResidualShrinkTermOk.lean, not := true, not lake build
  SystemsLean.HostResidualShrinkTermOk.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so they are not a prefix of the library wrap):
  SlakeTypecheckHostResidualShrinkTermOk
  HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK-TERM-OK
  SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_TERM_OK_V0
  PARSE-LIVE-HOST-RESIDUAL-SHRINK-TERM-OK
  slake-typecheck-hostresidualshrinktermok
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostresidualshrinktermok,
  slakeTypecheckHostResidualShrinkTermOkReady,
  kernelCheckLiveHostResidualShrinkTermOkSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostResidualShrinkTermOk
  Checkable writer: just slake-typecheck-hostresidualshrinktermok
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostResidualShrinkTermOk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_RESIDUAL_SHRINK_TERM_OK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-RESIDUAL-SHRINK-TERM-OK"

/-- Named just recipe. Not lake build SystemsLean.HostResidualShrinkTermOk. -/
def justRecipeSlakeTypecheckHostResidualShrinkTermOk : String :=
  "slake-typecheck-hostresidualshrinktermok"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostResidualShrinkTermOkRel : String :=
  SystemsLean.HostFrontLiveHostResidualShrinkTermOk.liveHostResidualShrinkTermOkRel

/-- Ready names HostFrontLiveHostResidualShrinkTermOk parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostResidualShrinkTermOkReady,
    kernelCheckLiveHostResidualShrinkTermOkSource. -/
def slakeTypecheckHostResidualShrinkTermOkReady : Bool :=
  SystemsLean.HostFrontLiveHostResidualShrinkTermOk.hostFrontLiveHostResidualShrinkTermOkReady

/-- Honesty: this command is not lake build of HostResidualShrinkTermOk. -/
def slakeTypecheckHostResidualShrinkTermOkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostResidualShrinkTermOkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostResidualShrinkTermOkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostResidualShrinkTermOk.lean.
    Ready is HostFrontLiveHostResidualShrinkTermOk.hostFrontLiveHostResidualShrinkTermOkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostResidualShrinkTermOk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostResidualShrinkTermOk} =="
  IO.println s!"  host={hostId} file={liveHostResidualShrinkTermOkRel}"
  unless (!slakeTypecheckHostResidualShrinkTermOkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostResidualShrinkTermOkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostResidualShrinkTermOk.main args
