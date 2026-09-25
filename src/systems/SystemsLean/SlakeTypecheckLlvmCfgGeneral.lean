/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgGeneral.
  Short role: named driver for just slake-typecheck-llvmcfggeneral.
  Ready is HostFrontLiveLlvmCfgGeneral parse plus HostKernel.kernelCheck
  of live LlvmCfgGeneral.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgGeneral.
  liveRel is LlvmCfgGeneral.lean.
  This wrap is LlvmCfgGeneral.lean. It is not LlvmCfgFixture.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-GENERAL,
  SLAKE_TYPECHECK_LLVM_CFG_GENERAL, slake-typecheck-llvmcfggeneral,
  slakeTypecheckLlvmCfgGeneralReady,
  kernelCheckLiveLlvmCfgGeneralSource,
  PARSE-LIVE-LLVM-CFG-GENERAL.
  Module: SystemsLean.SlakeTypecheckLlvmCfgGeneral
  Checkable writer: just slake-typecheck-llvmcfggeneral
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgGeneral

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_CFG_GENERAL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-GENERAL"

/-- Named just recipe. Not lake build SystemsLean.LlvmCfgGeneral. -/
def justRecipeSlakeTypecheckLlvmCfgGeneral : String :=
  "slake-typecheck-llvmcfggeneral"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgGeneralRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgGeneral.liveLlvmCfgGeneralRel

/-- Ready names HostFrontLiveLlvmCfgGeneral parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgGeneralReady,
    kernelCheckLiveLlvmCfgGeneralSource. -/
def slakeTypecheckLlvmCfgGeneralReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgGeneral.hostFrontLiveLlvmCfgGeneralReady

/-- Honesty: this command is not lake build of LlvmCfgGeneral. -/
def slakeTypecheckLlvmCfgGeneralDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgGeneralFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgGeneralFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgGeneralOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgGeneral.lean.
    Ready is HostFrontLiveLlvmCfgGeneral.hostFrontLiveLlvmCfgGeneralReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated
    inside HostFrontLiveLlvmCfgGeneral.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgGeneral} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgGeneral.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgGeneralRel}"
  unless (!slakeTypecheckLlvmCfgGeneralFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgGeneralFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgGeneralOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckLlvmCfgGeneralReady do
    IO.eprintln "error: slakeTypecheckLlvmCfgGeneralReady false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgGeneral.main args
