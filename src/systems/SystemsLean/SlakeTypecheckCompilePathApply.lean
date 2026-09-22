/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathApply.
  Short role: named driver for just slake-typecheck-compilepathapply.
  Ready is HostFrontLiveCompilePathApply parse plus HostKernel.kernelCheck of live
  CompilePathApply.lean, not := true, not lake build SystemsLean.CompilePathApply.
  Not mill. Not occupancy name 50. Not FullHost.
  Occupancy leftover HostModuleCheckCompilePathApplyTerm is not this wrap.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathApply drivers are not prefix hits):
  SlakeTypecheckCompilePathApply
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-APPLY
  SLAKE_TYPECHECK_COMPILE_PATH_APPLY_V0
  PARSE-LIVE-COMPILE-PATH-APPLY
  COMPILE-PATH-APPLY
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathapply,
  slakeTypecheckCompilePathApplyReady,
  kernelCheckLiveCompilePathApplySource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathApply
  Checkable writer: just slake-typecheck-compilepathapply
  (lean --run; no mill; no lake). Dests skipped this land.
-/

import SystemsLean.HostFrontLiveCompilePathApply

/-- Greppable stage id. Hyphenated COMPILE-PATH-APPLY in the host map id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-APPLY"

/-- Named just recipe. Not lake build SystemsLean.CompilePathApply. -/
def justRecipeSlakeTypecheckCompilePathApply : String :=
  "slake-typecheck-compilepathapply"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathApplyRel : String :=
  SystemsLean.HostFrontLiveCompilePathApply.liveCompilePathApplyRel

/-- Ready names HostFrontLiveCompilePathApply parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckCompilePathApplyReady,
    kernelCheckLiveCompilePathApplySource. -/
def slakeTypecheckCompilePathApplyReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathApply.hostFrontLiveCompilePathApplyReady

/-- Honesty: this command is not lake build of CompilePathApply. -/
def slakeTypecheckCompilePathApplyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathApplyFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathApplyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathApply.lean.
    Ready is HostFrontLiveCompilePathApply.hostFrontLiveCompilePathApplyReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathApply.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathApply} =="
  IO.println s!"  host={hostId} file={liveCompilePathApplyRel}"
  unless (!slakeTypecheckCompilePathApplyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathApplyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathApply.main args
