/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmEmitPath.
  Short role: named driver for just slake-typecheck-llvmemitpath.
  Ready is HostFrontLiveLlvmEmitPath parse plus HostKernel.kernelCheck
  of live LlvmEmitPath.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmEmitPath.
  liveRel is LlvmEmitPath.lean.
  This wrap is LlvmEmitPath.lean. Theorems and examples in that file are
  skipped. It is not a separate LlvmEmitPathTheorems file.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-EMIT-PATH,
  SLAKE_TYPECHECK_LLVM_EMIT_PATH, slake-typecheck-llvmemitpath,
  slakeTypecheckLlvmEmitPathReady,
  kernelCheckLiveLlvmEmitPathSource,
  PARSE-LIVE-LLVM-EMIT-PATH.
  Module: SystemsLean.SlakeTypecheckLlvmEmitPath
  Checkable writer: just slake-typecheck-llvmemitpath
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmEmitPath

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_EMIT_PATH"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-EMIT-PATH"

/-- Named just recipe. Not lake build SystemsLean.LlvmEmitPath. -/
def justRecipeSlakeTypecheckLlvmEmitPath : String :=
  "slake-typecheck-llvmemitpath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmEmitPathRel : String :=
  SystemsLean.HostFrontLiveLlvmEmitPath.liveLlvmEmitPathRel

/-- Ready names HostFrontLiveLlvmEmitPath parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmEmitPathReady,
    kernelCheckLiveLlvmEmitPathSource. -/
def slakeTypecheckLlvmEmitPathReady : Bool :=
  SystemsLean.HostFrontLiveLlvmEmitPath.hostFrontLiveLlvmEmitPathReady

/-- Honesty: this command is not lake build of LlvmEmitPath. -/
def slakeTypecheckLlvmEmitPathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmEmitPathFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmEmitPathFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmEmitPathOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmEmitPath.lean.
    Ready is HostFrontLiveLlvmEmitPath.hostFrontLiveLlvmEmitPathReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmEmitPath.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmEmitPath} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmEmitPath.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmEmitPathRel}"
  unless (!slakeTypecheckLlvmEmitPathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmEmitPathFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmEmitPathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmEmitPath.main args
