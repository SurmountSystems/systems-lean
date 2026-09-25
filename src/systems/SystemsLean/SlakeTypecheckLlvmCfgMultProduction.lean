/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgMultProduction.
  Short role: named driver for the closed LlvmCfgMultProduction check.
  Ready is HostFrontLiveLlvmCfgMultProduction parse plus HostKernel.kernelCheck
  of live LlvmCfgMultProduction.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgMultProduction.
  liveRel is LlvmCfgMultProduction.lean.
  This wrap is LlvmCfgMultProduction.lean. It is not LlvmCfgFixture.lean.
  It is not LlvmHold.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-MULT-PRODUCTION,
  SLAKE-TYPECHECK-LLVM-CFG-MULT-PRODUCTION,
  slake-typecheck-llvmcfgmultproduction,
  slakeTypecheckLlvmCfgMultProductionReady,
  kernelCheckLiveLlvmCfgMultProductionSource,
  PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION, LLVM-CFG-MULT-PRODUCTION.
  Module: SystemsLean.SlakeTypecheckLlvmCfgMultProduction
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgMultProduction

/-- Greppable stage id. Hyphenated. Not the LlvmHold stage id. -/
def stageId : String := "SLAKE-TYPECHECK-LLVM-CFG-MULT-PRODUCTION"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-MULT-PRODUCTION"

/-- Named recipe string. Not lake build SystemsLean.LlvmCfgMultProduction. -/
def justRecipeSlakeTypecheckLlvmCfgMultProduction : String :=
  "slake-typecheck-llvmcfgmultproduction"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgMultProductionRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgMultProduction.liveLlvmCfgMultProductionRel

/-- Ready names HostFrontLiveLlvmCfgMultProduction parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgMultProductionReady,
    kernelCheckLiveLlvmCfgMultProductionSource. -/
def slakeTypecheckLlvmCfgMultProductionReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgMultProduction.hostFrontLiveLlvmCfgMultProductionReady

/-- Honesty: this command is not lake build of LlvmCfgMultProduction. -/
def slakeTypecheckLlvmCfgMultProductionDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgMultProductionFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgMultProductionFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgMultProductionOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgMultProduction.lean.
    Ready is HostFrontLiveLlvmCfgMultProduction.hostFrontLiveLlvmCfgMultProductionReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgMultProduction.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgMultProduction} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgMultProduction.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgMultProductionRel}"
  unless (!slakeTypecheckLlvmCfgMultProductionFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgMultProductionFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgMultProductionOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgMultProduction.main args
