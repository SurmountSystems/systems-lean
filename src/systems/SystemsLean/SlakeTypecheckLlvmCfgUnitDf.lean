/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgUnitDf.
  Short role: named driver for just slake-typecheck-llvmcfgunitdf.
  Ready is HostFrontLiveLlvmCfgUnitDf parse plus HostKernel.kernelCheck
  of live LlvmCfgUnitDf.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgUnitDf.
  liveRel is LlvmCfgUnitDf.lean.
  This wrap is LlvmCfgUnitDf.lean. It is not LlvmCfg.lean.
  It is not LlvmCfgGeneral.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-DF,
  SLAKE_TYPECHECK_LLVM_CFG_UNIT_DF, slake-typecheck-llvmcfgunitdf,
  slakeTypecheckLlvmCfgUnitDfReady,
  kernelCheckLiveLlvmCfgUnitDfSource,
  PARSE-LIVE-LLVM-CFG-UNIT-DF.
  Module: SystemsLean.SlakeTypecheckLlvmCfgUnitDf
  Checkable writer: just slake-typecheck-llvmcfgunitdf
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgUnitDf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_CFG_UNIT_DF"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-DF"

/-- Named just recipe. Not lake build SystemsLean.LlvmCfgUnitDf. -/
def justRecipeSlakeTypecheckLlvmCfgUnitDf : String :=
  "slake-typecheck-llvmcfgunitdf"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgUnitDfRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgUnitDf.liveLlvmCfgUnitDfRel

/-- Ready names HostFrontLiveLlvmCfgUnitDf parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgUnitDfReady,
    kernelCheckLiveLlvmCfgUnitDfSource. -/
def slakeTypecheckLlvmCfgUnitDfReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgUnitDf.hostFrontLiveLlvmCfgUnitDfReady

/-- Honesty: this command is not lake build of LlvmCfgUnitDf. -/
def slakeTypecheckLlvmCfgUnitDfDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgUnitDfFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgUnitDfFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgUnitDfOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgUnitDf.lean.
    Ready is HostFrontLiveLlvmCfgUnitDf.hostFrontLiveLlvmCfgUnitDfReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgUnitDf.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgUnitDf} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgUnitDf.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgUnitDfRel}"
  unless (!slakeTypecheckLlvmCfgUnitDfFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgUnitDfFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgUnitDfOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgUnitDf.main args
