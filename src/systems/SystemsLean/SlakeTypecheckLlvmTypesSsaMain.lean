/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmTypesSsaMain.
  Short role: named driver for just slake-typecheck-llvmtypesssamain.
  Ready is HostFrontLiveLlvmTypesSsaMain parse plus HostKernel.kernelCheck
  of live LlvmTypesSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmTypesSsaMain.
  Not mill 58 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckLlvmTypesSsaMain is not a prefix):
  SlakeTypecheckLlvmTypesSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-TYPES-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_TYPES_SSA_MAIN_V0
  slake-typecheck-llvmtypesssamain
  PARSE-LIVE-LLVM-TYPES-SSA-MAIN
  LLVM-TYPES-SSA-MAIN
  HOST-LLVM-TYPES-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmtypesssamain,
  slakeTypecheckLlvmTypesSsaMainReady,
  kernelCheckLiveLlvmTypesSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmTypesSsaMain
  Checkable writer: just slake-typecheck-llvmtypesssamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmTypesSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_TYPES_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-TYPES-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmTypesSsaMain. -/
def justRecipeSlakeTypecheckLlvmTypesSsaMain : String :=
  "slake-typecheck-llvmtypesssamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmTypesSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmTypesSsaMain.liveLlvmTypesSsaMainRel

/-- Ready names HostFrontLiveLlvmTypesSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmTypesSsaMainReady,
    kernelCheckLiveLlvmTypesSsaMainSource. -/
def slakeTypecheckLlvmTypesSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmTypesSsaMain.hostFrontLiveLlvmTypesSsaMainReady

/-- Honesty: this command is not lake build of LlvmTypesSsaMain. -/
def slakeTypecheckLlvmTypesSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmTypesSsaMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmTypesSsaMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmTypesSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmTypesSsaMain.lean.
    Ready is HostFrontLiveLlvmTypesSsaMain.hostFrontLiveLlvmTypesSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmTypesSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmTypesSsaMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmTypesSsaMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmTypesSsaMainRel}"
  unless (!slakeTypecheckLlvmTypesSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesSsaMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmTypesSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmTypesSsaMain.main args
