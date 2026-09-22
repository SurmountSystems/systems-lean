/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.IrNodeLayout.
  Short role: named driver for just slake-typecheck-irnodelayout.
  Ready is HostFrontLiveIrNodeLayout parse plus HostKernel.kernelCheck of live
  IrNodeLayout.lean, not := true, not lake build SystemsLean.IrNodeLayout.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IR-NODE-LAYOUT,
  SLAKE_TYPECHECK_IR_NODE_LAYOUT_V0, slake-typecheck-irnodelayout,
  slakeTypecheckIrNodeLayoutReady, kernelCheckLiveIrNodeLayoutSource,
  PARSE-LIVE-IR-NODE-LAYOUT, SKELETON.
  Module: SystemsLean.SlakeTypecheckIrNodeLayout
  Checkable writer: just slake-typecheck-irnodelayout (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveIrNodeLayout

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IR_NODE_LAYOUT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IR-NODE-LAYOUT"

/-- Named just recipe. Not lake build SystemsLean.IrNodeLayout. -/
def justRecipeSlakeTypecheckIrNodeLayout : String :=
  "slake-typecheck-irnodelayout"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrNodeLayoutRel : String :=
  SystemsLean.HostFrontLiveIrNodeLayout.liveIrNodeLayoutRel

/-- Ready names HostFrontLiveIrNodeLayout parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckIrNodeLayoutReady,
    kernelCheckLiveIrNodeLayoutSource. -/
def slakeTypecheckIrNodeLayoutReady : Bool :=
  SystemsLean.HostFrontLiveIrNodeLayout.hostFrontLiveIrNodeLayoutReady

/-- Honesty: this command is not lake build of IrNodeLayout. -/
def slakeTypecheckIrNodeLayoutDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckIrNodeLayoutFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckIrNodeLayoutOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live IrNodeLayout.lean.
    Ready is HostFrontLiveIrNodeLayout.hostFrontLiveIrNodeLayoutReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveIrNodeLayout.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckIrNodeLayout} =="
  IO.println s!"  host={hostId} file={liveIrNodeLayoutRel}"
  unless (!slakeTypecheckIrNodeLayoutFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckIrNodeLayoutOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveIrNodeLayout.main args
