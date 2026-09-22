/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelLinearTerm.
  Short role: named driver for just slake-typecheck-kernellinearterm.
  Ready is HostFrontLiveKernelLinearTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckKernelLinearTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckKernelLinearTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELLINEARTERM,
  SLAKE_TYPECHECK_KERNELLINEARTERM_V0, slake-typecheck-kernellinearterm,
  slakeTypecheckKernelLinearTermReady, kernelCheckLiveKernelLinearTermSource,
  PARSE-LIVE-KERNELLINEARTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelLinearTerm
  Checkable writer: just slake-typecheck-kernellinearterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelLinearTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELLINEARTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELLINEARTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckKernelLinearTerm. -/
def justRecipeSlakeTypecheckKernelLinearTerm : String :=
  "slake-typecheck-kernellinearterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelLinearTermRel : String :=
  SystemsLean.HostFrontLiveKernelLinearTerm.liveKernelLinearTermRel

/-- Ready names HostFrontLiveKernelLinearTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelLinearTermReady,
    kernelCheckLiveKernelLinearTermSource. -/
def slakeTypecheckKernelLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveKernelLinearTerm.hostFrontLiveKernelLinearTermReady

/-- Honesty: this command is not lake build of HostModuleCheckKernelLinearTerm. -/
def slakeTypecheckKernelLinearTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelLinearTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelLinearTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckKernelLinearTerm.lean.
    Ready is HostFrontLiveKernelLinearTerm.hostFrontLiveKernelLinearTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelLinearTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelLinearTerm} =="
  IO.println s!"  host={hostId} file={liveKernelLinearTermRel}"
  unless (!slakeTypecheckKernelLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelLinearTerm.main args
