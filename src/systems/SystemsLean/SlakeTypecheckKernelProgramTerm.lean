/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelProgramTerm.
  Short role: named driver for just slake-typecheck-kernelprogramterm.
  Ready is HostFrontLiveKernelProgramTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckKernelProgramTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckKernelProgramTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELPROGRAMTERM,
  SLAKE_TYPECHECK_KERNELPROGRAMTERM_V0, slake-typecheck-kernelprogramterm,
  slakeTypecheckKernelProgramTermReady, kernelCheckLiveKernelProgramTermSource,
  PARSE-LIVE-KERNELPROGRAMTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelProgramTerm
  Checkable writer: just slake-typecheck-kernelprogramterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelProgramTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELPROGRAMTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELPROGRAMTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckKernelProgramTerm. -/
def justRecipeSlakeTypecheckKernelProgramTerm : String :=
  "slake-typecheck-kernelprogramterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelProgramTermRel : String :=
  SystemsLean.HostFrontLiveKernelProgramTerm.liveKernelProgramTermRel

/-- Ready names HostFrontLiveKernelProgramTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelProgramTermReady,
    kernelCheckLiveKernelProgramTermSource. -/
def slakeTypecheckKernelProgramTermReady : Bool :=
  SystemsLean.HostFrontLiveKernelProgramTerm.hostFrontLiveKernelProgramTermReady

/-- Honesty: this command is not lake build of HostModuleCheckKernelProgramTerm. -/
def slakeTypecheckKernelProgramTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelProgramTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelProgramTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckKernelProgramTerm.lean.
    Ready is HostFrontLiveKernelProgramTerm.hostFrontLiveKernelProgramTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelProgramTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelProgramTerm} =="
  IO.println s!"  host={hostId} file={liveKernelProgramTermRel}"
  unless (!slakeTypecheckKernelProgramTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelProgramTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelProgramTerm.main args
