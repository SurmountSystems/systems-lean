/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelEmitTerm.
  Short role: named driver for just slake-typecheck-kernelemitterm.
  Ready is HostFrontLiveKernelEmitTerm parse plus HostKernel.kernelCheck of live
  HostModuleCheckKernelEmitTerm.lean, not := true, not lake build
  SystemsLean.HostModuleCheckKernelEmitTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELEMITTERM,
  SLAKE_TYPECHECK_KERNELEMITTERM_V0, slake-typecheck-kernelemitterm,
  slakeTypecheckKernelEmitTermReady, kernelCheckLiveKernelEmitTermSource,
  PARSE-LIVE-KERNELEMITTERM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelEmitTerm
  Checkable writer: just slake-typecheck-kernelemitterm (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelEmitTerm

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELEMITTERM"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckKernelEmitTerm. -/
def justRecipeSlakeTypecheckKernelEmitTerm : String :=
  "slake-typecheck-kernelemitterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelEmitTermRel : String :=
  SystemsLean.HostFrontLiveKernelEmitTerm.liveKernelEmitTermRel

/-- Ready names HostFrontLiveKernelEmitTerm parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelEmitTermReady,
    kernelCheckLiveKernelEmitTermSource. -/
def slakeTypecheckKernelEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveKernelEmitTerm.hostFrontLiveKernelEmitTermReady

/-- Honesty: this command is not lake build of HostModuleCheckKernelEmitTerm. -/
def slakeTypecheckKernelEmitTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckKernelEmitTerm.lean.
    Ready is HostFrontLiveKernelEmitTerm.hostFrontLiveKernelEmitTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelEmitTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelEmitTerm} =="
  IO.println s!"  host={hostId} file={liveKernelEmitTermRel}"
  unless (!slakeTypecheckKernelEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelEmitTerm.main args
