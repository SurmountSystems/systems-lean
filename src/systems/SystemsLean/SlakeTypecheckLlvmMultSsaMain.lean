/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmMultSsaMain.
  Short role: named driver for just slake-typecheck-llvmmultssamain.
  Ready is HostFrontLiveLlvmMultSsaMain parse plus HostKernel.kernelCheck
  of live LlvmMultSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmMultSsaMain.
  Not mill 61 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not invent HostFrontLiveLlvmMultSsa. Do not wrap IrGraph.lean.
  Do not steal HostFrontLiveLlvmTypesSsaMain / HostFrontLiveLlvmProgramSsaMain / HostFrontLiveLlvmGraphSsaMain.
  Unique needles (trailing newline so SlakeTypecheckLlvmMultSsaMain is not a prefix):
  SlakeTypecheckLlvmMultSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-MULT-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_MULT_SSA_MAIN_V0
  slake-typecheck-llvmmultssamain
  PARSE-LIVE-LLVM-MULT-SSA-MAIN
  LLVM-MULT-SSA-MAIN
  HOST-LLVM-MULT-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmmultssamain,
  slakeTypecheckLlvmMultSsaMainReady,
  kernelCheckLiveLlvmMultSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmMultSsaMain
  Checkable writer: just slake-typecheck-llvmmultssamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmMultSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_MULT_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-MULT-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmMultSsaMain. -/
def justRecipeSlakeTypecheckLlvmMultSsaMain : String :=
  "slake-typecheck-llvmmultssamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmMultSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmMultSsaMain.liveLlvmMultSsaMainRel

/-- Ready names HostFrontLiveLlvmMultSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmMultSsaMainReady,
    kernelCheckLiveLlvmMultSsaMainSource. -/
def slakeTypecheckLlvmMultSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmMultSsaMain.hostFrontLiveLlvmMultSsaMainReady

/-- Honesty: this command is not lake build of LlvmMultSsaMain. -/
def slakeTypecheckLlvmMultSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmMultSsaMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmMultSsaMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmMultSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmMultSsaMain.lean.
    Ready is HostFrontLiveLlvmMultSsaMain.hostFrontLiveLlvmMultSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmMultSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmMultSsaMain} =="
  IO.println s!"  host={hostId} file={liveLlvmMultSsaMainRel}"
  unless (!slakeTypecheckLlvmMultSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultSsaMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmMultSsaMain.main args
