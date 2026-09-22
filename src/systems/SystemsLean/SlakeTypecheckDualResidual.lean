/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualResidual.
  Short role: named driver for just slake-typecheck-dualresidual.
  Ready is HostFrontLiveDualResidual parse plus HostKernel.kernelCheck of live
  DualResidual.lean, not := true, not lake build SystemsLean.DualResidual.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so DualResidualTheorems wrap is not a prefix):
  SlakeTypecheckDualResidual
  HOST-SLAKE-TYPECHECK-DUAL-RESIDUAL
  SLAKE_TYPECHECK_DUAL_RESIDUAL_V0
  PARSE-LIVE-DUAL-RESIDUAL
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-DUAL-RESIDUAL,
  SLAKE_TYPECHECK_DUAL_RESIDUAL_V0, slake-typecheck-dualresidual,
  slakeTypecheckDualResidualReady, kernelCheckLiveDualResidualSource,
  PARSE-LIVE-DUAL-RESIDUAL, SKELETON.
  Module: SystemsLean.SlakeTypecheckDualResidual
  Checkable writer: just slake-typecheck-dualresidual (lean --run; no mill; no lake).
  Dests skipped; recipe not invoked here.
-/

import SystemsLean.HostFrontLiveDualResidual

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_RESIDUAL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-RESIDUAL"

/-- Named just recipe. Not lake build SystemsLean.DualResidual. -/
def justRecipeSlakeTypecheckDualResidual : String :=
  "slake-typecheck-dualresidual"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualResidualRel : String :=
  SystemsLean.HostFrontLiveDualResidual.liveDualResidualRel

/-- Ready names HostFrontLiveDualResidual parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckDualResidualReady,
    kernelCheckLiveDualResidualSource. -/
def slakeTypecheckDualResidualReady : Bool :=
  SystemsLean.HostFrontLiveDualResidual.hostFrontLiveDualResidualReady

/-- Honesty: this command is not lake build of DualResidual. -/
def slakeTypecheckDualResidualDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualResidualFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualResidualOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualResidual.lean.
    Ready is HostFrontLiveDualResidual.hostFrontLiveDualResidualReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualResidual.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualResidual} =="
  IO.println s!"  host={hostId} file={liveDualResidualRel}"
  unless (!slakeTypecheckDualResidualFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualResidualOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualResidual.main args
