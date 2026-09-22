/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityTypesTerm.
  Short role: named driver for just slake-typecheck-paritytypesterm.
  Ready is HostFrontLiveParityTypesTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckParityTypesTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckParityTypesTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITYTYPESTERM,
  SLAKE_TYPECHECK_PARITYTYPESTERM_V0, slake-typecheck-paritytypesterm,
  slakeTypecheckParityTypesTermReady, kernelCheckLiveParityTypesTermSource,
  PARSE-LIVE-PARITY-TYPES-TERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckParityTypesTerm
  Checkable writer: just slake-typecheck-paritytypesterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityTypesTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITYTYPESTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITYTYPESTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckParityTypesTerm. -/
def justRecipeSlakeTypecheckParityTypesTerm : String :=
  "slake-typecheck-paritytypesterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityTypesTermRel : String :=
  SystemsLean.HostFrontLiveParityTypesTerm.liveParityTypesTermRel

/-- Ready names HostFrontLiveParityTypesTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckParityTypesTermReady,
    kernelCheckLiveParityTypesTermSource. -/
def slakeTypecheckParityTypesTermReady : Bool :=
  SystemsLean.HostFrontLiveParityTypesTerm.hostFrontLiveParityTypesTermReady

/-- Honesty: this command is not lake build of HostModuleCheckParityTypesTerm. -/
def slakeTypecheckParityTypesTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityTypesTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityTypesTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckParityTypesTerm.lean.
    Ready is HostFrontLiveParityTypesTerm.hostFrontLiveParityTypesTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveParityTypesTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityTypesTerm} =="
  IO.println s!"  host={hostId} file={liveParityTypesTermRel}"
  unless (!slakeTypecheckParityTypesTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityTypesTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityTypesTerm.main args
