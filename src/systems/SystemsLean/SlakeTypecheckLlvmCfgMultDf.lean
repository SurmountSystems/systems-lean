/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgMultDf.
  Short role: named driver for just slake-typecheck-llvmcfgmultdf.
  Ready is HostFrontLiveLlvmCfgMultDf parse plus HostKernel.kernelCheck
  of live LlvmCfgMultDf.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgMultDf.
  liveRel is LlvmCfgMultDf.lean.
  This wrap is LlvmCfgMultDf.lean. It is not LlvmCfgMultProduction.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-MULT-DF,
  SLAKE_TYPECHECK_LLVM_CFG_MULT_DF, slake-typecheck-llvmcfgmultdf,
  slakeTypecheckLlvmCfgMultDfReady,
  kernelCheckLiveLlvmCfgMultDfSource,
  PARSE-LIVE-LLVM-CFG-MULT-DF.
  Module: SystemsLean.SlakeTypecheckLlvmCfgMultDf
  Checkable writer: just slake-typecheck-llvmcfgmultdf
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgMultDf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_CFG_MULT_DF"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-MULT-DF"

/-- Named just recipe. Not lake build SystemsLean.LlvmCfgMultDf. -/
def justRecipeSlakeTypecheckLlvmCfgMultDf : String :=
  "slake-typecheck-llvmcfgmultdf"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgMultDfRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgMultDf.liveLlvmCfgMultDfRel

/-- Ready names HostFrontLiveLlvmCfgMultDf parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgMultDfReady,
    kernelCheckLiveLlvmCfgMultDfSource. -/
def slakeTypecheckLlvmCfgMultDfReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgMultDf.hostFrontLiveLlvmCfgMultDfReady

/-- Honesty: this command is not lake build of LlvmCfgMultDf. -/
def slakeTypecheckLlvmCfgMultDfDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgMultDfFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgMultDfFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgMultDfOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgMultDf.lean.
    Ready is HostFrontLiveLlvmCfgMultDf.hostFrontLiveLlvmCfgMultDfReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgMultDf.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgMultDf} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgMultDf.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgMultDfRel}"
  unless (!slakeTypecheckLlvmCfgMultDfFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgMultDfFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgMultDfOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgMultDf.main args
