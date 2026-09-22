/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathMult.
  Short role: named driver for just slake-typecheck-compilepathmult.
  Ready is HostFrontLiveCompilePathMult parse plus HostKernel.kernelCheck
  of live CompilePathMult.lean, not a hardcoded true, not lake build
  SystemsLean.CompilePathMult.
  liveRel is CompilePathMult.lean.
  This wrap is CompilePathMult.lean. It is not CompilePath.lean.
  The live namespace is SystemsLean.CompilePath.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPILE-PATH-MULT,
  SLAKE_TYPECHECK_COMPILE_PATH_MULT, slake-typecheck-compilepathmult,
  slakeTypecheckCompilePathMultReady,
  kernelCheckLiveCompilePathMultSource,
  PARSE-LIVE-COMPILE-PATH-MULT, COMPILE-PATH-MULT.
  Module: SystemsLean.SlakeTypecheckCompilePathMult
  Checkable writer: just slake-typecheck-compilepathmult
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCompilePathMult

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_MULT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-MULT"

/-- Named just recipe. Not lake build SystemsLean.CompilePathMult. -/
def justRecipeSlakeTypecheckCompilePathMult : String :=
  "slake-typecheck-compilepathmult"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathMultRel : String :=
  SystemsLean.HostFrontLiveCompilePathMult.liveCompilePathMultRel

/-- Ready names HostFrontLiveCompilePathMult parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCompilePathMultReady,
    kernelCheckLiveCompilePathMultSource. -/
def slakeTypecheckCompilePathMultReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathMult.hostFrontLiveCompilePathMultReady

/-- Honesty: this command is not lake build of CompilePathMult. -/
def slakeTypecheckCompilePathMultDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathMultFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCompilePathMultFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathMultOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathMult.lean.
    Ready is HostFrontLiveCompilePathMult.hostFrontLiveCompilePathMultReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCompilePathMult.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathMult} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCompilePathMult.liveRel}"
  IO.println s!"  host={hostId} file={liveCompilePathMultRel}"
  unless (!slakeTypecheckCompilePathMultFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathMultFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCompilePathMultOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathMult.main args
