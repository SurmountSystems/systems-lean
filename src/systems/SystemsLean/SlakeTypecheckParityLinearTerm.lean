/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityLinearTerm.
  Short role: named driver for just slake-typecheck-paritylinearterm.
  Ready is HostFrontLiveParityLinearTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckParityLinearTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckParityLinearTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITYLINEARTERM,
  SLAKE_TYPECHECK_PARITYLINEARTERM_V0, slake-typecheck-paritylinearterm,
  slakeTypecheckParityLinearTermReady, kernelCheckLiveParityLinearTermSource,
  PARSE-LIVE-PARITY-LINEAR-TERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckParityLinearTerm
  Checkable writer: just slake-typecheck-paritylinearterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityLinearTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITYLINEARTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITYLINEARTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckParityLinearTerm. -/
def justRecipeSlakeTypecheckParityLinearTerm : String :=
  "slake-typecheck-paritylinearterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityLinearTermRel : String :=
  SystemsLean.HostFrontLiveParityLinearTerm.liveParityLinearTermRel

/-- Ready names HostFrontLiveParityLinearTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckParityLinearTermReady,
    kernelCheckLiveParityLinearTermSource. -/
def slakeTypecheckParityLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveParityLinearTerm.hostFrontLiveParityLinearTermReady

/-- Honesty: this command is not lake build of HostModuleCheckParityLinearTerm. -/
def slakeTypecheckParityLinearTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityLinearTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityLinearTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckParityLinearTerm.lean.
    Ready is HostFrontLiveParityLinearTerm.hostFrontLiveParityLinearTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveParityLinearTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityLinearTerm} =="
  IO.println s!"  host={hostId} file={liveParityLinearTermRel}"
  unless (!slakeTypecheckParityLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityLinearTerm.main args
