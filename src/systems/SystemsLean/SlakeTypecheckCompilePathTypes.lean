/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathTypes.
  Short role: named driver for just slake-typecheck-compilepathtypes.
  Ready is HostFrontLiveCompilePathTypes parse plus HostKernel.kernelCheck
  of live CompilePathTypes.lean, not := true, not lake build
  SystemsLean.CompilePathTypes.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathTypes drivers are not prefix hits):
  SlakeTypecheckCompilePathTypes
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-TYPES
  SLAKE_TYPECHECK_COMPILE_PATH_TYPES_V0
  PARSE-LIVE-COMPILE-PATH-TYPES
  COMPILE-PATH-TYPES
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathtypes,
  slakeTypecheckCompilePathTypesReady,
  kernelCheckLiveCompilePathTypesSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathTypes
  Checkable writer: just slake-typecheck-compilepathtypes
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCompilePathTypes

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-TYPES"

/-- Named just recipe. Not lake build SystemsLean.CompilePathTypes. -/
def justRecipeSlakeTypecheckCompilePathTypes : String :=
  "slake-typecheck-compilepathtypes"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathTypesRel : String :=
  SystemsLean.HostFrontLiveCompilePathTypes.liveCompilePathTypesRel

/-- Ready names HostFrontLiveCompilePathTypes parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathTypesReady,
    kernelCheckLiveCompilePathTypesSource. -/
def slakeTypecheckCompilePathTypesReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathTypes.hostFrontLiveCompilePathTypesReady

/-- Honesty: this command is not lake build of CompilePathTypes. -/
def slakeTypecheckCompilePathTypesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathTypesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathTypesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathTypes.lean.
    Ready is HostFrontLiveCompilePathTypes.hostFrontLiveCompilePathTypesReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathTypes.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathTypes} =="
  IO.println s!"  host={hostId} file={liveCompilePathTypesRel}"
  unless (!slakeTypecheckCompilePathTypesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathTypesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathTypes.main args
