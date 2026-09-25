/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmComposeSsaMain.
  Short role: named driver for just slake-typecheck-llvmcomposessamain.
  Ready is HostFrontLiveLlvmComposeSsaMain parse plus HostKernel.kernelCheck
  of live LlvmComposeSsaMain.lean, not := true, not lake build
  SystemsLean.LlvmComposeSsaMain.
  Not mill 56 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not invent HostFrontLiveLlvmComposeSsa. Do not wrap IrGraph.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not wrap ComposeSubsetEmit.lean. Do not wrap ComposeSubsetEmitMain.lean.
  Do not wrap ComposeSubsetRebuildMain.lean. Do not wrap CapableComposeMain.lean.
  Do not steal HostFrontLiveLlvmLinearSsaMain (sibling LINEAR mill wrap).
  Do not steal HostFrontLiveLlvmTypesSsaMain / HostFrontLiveLlvmProgramSsaMain / HostFrontLiveLlvmGraphSsaMain.
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  Unique needles (trailing newline so SlakeTypecheckLlvmComposeSsaMain is not a prefix):
  SlakeTypecheckLlvmComposeSsaMain
  HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA-MAIN
  SLAKE_TYPECHECK_LLVM_COMPOSE_SSA_MAIN_V0
  slake-typecheck-llvmcomposessamain
  PARSE-LIVE-LLVM-COMPOSE-SSA-MAIN
  LLVM-COMPOSE-SSA-MAIN
  HOST-LLVM-COMPOSE-SSA-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmcomposessamain,
  slakeTypecheckLlvmComposeSsaMainReady,
  kernelCheckLiveLlvmComposeSsaMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmComposeSsaMain
  Checkable writer: just slake-typecheck-llvmcomposessamain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmComposeSsaMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_COMPOSE_SSA_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmComposeSsaMain. -/
def justRecipeSlakeTypecheckLlvmComposeSsaMain : String :=
  "slake-typecheck-llvmcomposessamain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeSsaMainRel : String :=
  SystemsLean.HostFrontLiveLlvmComposeSsaMain.liveLlvmComposeSsaMainRel

/-- Ready names HostFrontLiveLlvmComposeSsaMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmComposeSsaMainReady,
    kernelCheckLiveLlvmComposeSsaMainSource. -/
def slakeTypecheckLlvmComposeSsaMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmComposeSsaMain.hostFrontLiveLlvmComposeSsaMainReady

/-- Honesty: this command is not lake build of LlvmComposeSsaMain. -/
def slakeTypecheckLlvmComposeSsaMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmComposeSsaMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmComposeSsaMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmComposeSsaMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmComposeSsaMain.lean.
    Ready is HostFrontLiveLlvmComposeSsaMain.hostFrontLiveLlvmComposeSsaMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmComposeSsaMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmComposeSsaMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmComposeSsaMain.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmComposeSsaMainRel}"
  unless (!slakeTypecheckLlvmComposeSsaMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeSsaMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeSsaMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmComposeSsaMain.main args
