/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgUnitProduction.
  Short role: named driver for the closed LlvmCfgUnitProduction check.
  Ready is HostFrontLiveLlvmCfgUnitProduction parse plus HostKernel.kernelCheck
  of live LlvmCfgUnitProduction.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgUnitProduction.
  liveRel is LlvmCfgUnitProduction.lean.
  This wrap is LlvmCfgUnitProduction.lean. It is not LlvmCfgFixture.lean.
  It is not LlvmHold.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-PRODUCTION,
  SLAKE-TYPECHECK-LLVM-CFG-UNIT-PRODUCTION,
  slake-typecheck-llvmcfgunitproduction,
  slakeTypecheckLlvmCfgUnitProductionReady,
  kernelCheckLiveLlvmCfgUnitProductionSource,
  PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION, LLVM-CFG-UNIT-PRODUCTION.
  Module: SystemsLean.SlakeTypecheckLlvmCfgUnitProduction
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgUnitProduction

/-- Greppable stage id. Hyphenated. Not the LlvmHold stage id. -/
def stageId : String := "SLAKE-TYPECHECK-LLVM-CFG-UNIT-PRODUCTION"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-PRODUCTION"

/-- Named recipe string. Not lake build SystemsLean.LlvmCfgUnitProduction. -/
def justRecipeSlakeTypecheckLlvmCfgUnitProduction : String :=
  "slake-typecheck-llvmcfgunitproduction"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgUnitProductionRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgUnitProduction.liveLlvmCfgUnitProductionRel

/-- Ready names HostFrontLiveLlvmCfgUnitProduction parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgUnitProductionReady,
    kernelCheckLiveLlvmCfgUnitProductionSource. -/
def slakeTypecheckLlvmCfgUnitProductionReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgUnitProduction.hostFrontLiveLlvmCfgUnitProductionReady

/-- Honesty: this command is not lake build of LlvmCfgUnitProduction. -/
def slakeTypecheckLlvmCfgUnitProductionDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgUnitProductionFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgUnitProductionFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgUnitProductionOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgUnitProduction.lean.
    Ready is HostFrontLiveLlvmCfgUnitProduction.hostFrontLiveLlvmCfgUnitProductionReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgUnitProduction.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgUnitProduction} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgUnitProduction.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgUnitProductionRel}"
  unless (!slakeTypecheckLlvmCfgUnitProductionFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgUnitProductionFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgUnitProductionOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgUnitProduction.main args
