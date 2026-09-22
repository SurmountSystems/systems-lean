/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelTypesTerm.
  Short role: named driver for just slake-typecheck-kerneltypesterm.
  Ready is HostFrontLiveKernelTypesTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckKernelTypesTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckKernelTypesTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELTYPESTERM,
  SLAKE_TYPECHECK_KERNELTYPESTERM_V0, slake-typecheck-kerneltypesterm,
  slakeTypecheckKernelTypesTermReady, kernelCheckLiveKernelTypesTermSource,
  PARSE-LIVE-KERNELTYPESTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelTypesTerm
  Checkable writer: just slake-typecheck-kerneltypesterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelTypesTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELTYPESTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELTYPESTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckKernelTypesTerm. -/
def justRecipeSlakeTypecheckKernelTypesTerm : String :=
  "slake-typecheck-kerneltypesterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelTypesTermRel : String :=
  SystemsLean.HostFrontLiveKernelTypesTerm.liveKernelTypesTermRel

/-- Ready names HostFrontLiveKernelTypesTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelTypesTermReady,
    kernelCheckLiveKernelTypesTermSource. -/
def slakeTypecheckKernelTypesTermReady : Bool :=
  SystemsLean.HostFrontLiveKernelTypesTerm.hostFrontLiveKernelTypesTermReady

/-- Honesty: this command is not lake build of HostModuleCheckKernelTypesTerm. -/
def slakeTypecheckKernelTypesTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelTypesTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelTypesTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckKernelTypesTerm.lean.
    Ready is HostFrontLiveKernelTypesTerm.hostFrontLiveKernelTypesTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelTypesTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelTypesTerm} =="
  IO.println s!"  host={hostId} file={liveKernelTypesTermRel}"
  unless (!slakeTypecheckKernelTypesTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelTypesTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelTypesTerm.main args
