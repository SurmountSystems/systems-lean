/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmLinearSsaMain.
  Short role: named driver for just slake-typecheck-llvmlinearssamain.
  Ready is HostFrontLiveLlvmLinearSsaMain parse plus HostKernel.kernelCheck
  of live LlvmLinearSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmLinearSsaMain.
  Not mill 62 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not invent HostFrontLiveLlvmLinearSsa. Do not wrap IrGraph.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not steal HostFrontLiveLlvmTypesSsaMain / HostFrontLiveLlvmProgramSsaMain / HostFrontLiveLlvmGraphSsaMain.
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  Unique needles (trailing newline so SlakeTypecheckLlvmLinearSsaMain is not a prefix):
  SlakeTypecheckLlvmLinearSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_LINEAR_SSA_MAIN_V0
  slake-typecheck-llvmlinearssamain
  PARSE-LIVE-LLVM-LINEAR-SSA-MAIN
  LLVM-LINEAR-SSA-MAIN
  HOST-LLVM-LINEAR-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmlinearssamain,
  slakeTypecheckLlvmLinearSsaMainReady,
  kernelCheckLiveLlvmLinearSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmLinearSsaMain
  Checkable writer: just slake-typecheck-llvmlinearssamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmLinearSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_LINEAR_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmLinearSsaMain. -/
def justRecipeSlakeTypecheckLlvmLinearSsaMain : String :=
  "slake-typecheck-llvmlinearssamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmLinearSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmLinearSsaMain.liveLlvmLinearSsaMainRel

/-- Ready names HostFrontLiveLlvmLinearSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmLinearSsaMainReady,
    kernelCheckLiveLlvmLinearSsaMainSource. -/
def slakeTypecheckLlvmLinearSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmLinearSsaMain.hostFrontLiveLlvmLinearSsaMainReady

/-- Honesty: this command is not lake build of LlvmLinearSsaMain. -/
def slakeTypecheckLlvmLinearSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmLinearSsaMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmLinearSsaMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmLinearSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmLinearSsaMain.lean.
    Ready is HostFrontLiveLlvmLinearSsaMain.hostFrontLiveLlvmLinearSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmLinearSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmLinearSsaMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmLinearSsaMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmLinearSsaMainRel}"
  unless (!slakeTypecheckLlvmLinearSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearSsaMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmLinearSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmLinearSsaMain.main args
