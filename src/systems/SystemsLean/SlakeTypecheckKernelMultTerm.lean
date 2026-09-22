/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelMultTerm.
  Short role: named driver for just slake-typecheck-kernelmultterm.
  Ready is HostFrontLiveKernelMultTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckKernelMultTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckKernelMultTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELMULTTERM,
  SLAKE_TYPECHECK_KERNELMULTTERM_V0, slake-typecheck-kernelmultterm,
  slakeTypecheckKernelMultTermReady, kernelCheckLiveKernelMultTermSource,
  PARSE-LIVE-KERNELMULTTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelMultTerm
  Checkable writer: just slake-typecheck-kernelmultterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelMultTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELMULTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELMULTTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckKernelMultTerm. -/
def justRecipeSlakeTypecheckKernelMultTerm : String :=
  "slake-typecheck-kernelmultterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelMultTermRel : String :=
  SystemsLean.HostFrontLiveKernelMultTerm.liveKernelMultTermRel

/-- Ready names HostFrontLiveKernelMultTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelMultTermReady,
    kernelCheckLiveKernelMultTermSource. -/
def slakeTypecheckKernelMultTermReady : Bool :=
  SystemsLean.HostFrontLiveKernelMultTerm.hostFrontLiveKernelMultTermReady

/-- Honesty: this command is not lake build of HostModuleCheckKernelMultTerm. -/
def slakeTypecheckKernelMultTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelMultTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelMultTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckKernelMultTerm.lean.
    Ready is HostFrontLiveKernelMultTerm.hostFrontLiveKernelMultTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelMultTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelMultTerm} =="
  IO.println s!"  host={hostId} file={liveKernelMultTermRel}"
  unless (!slakeTypecheckKernelMultTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelMultTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelMultTerm.main args
