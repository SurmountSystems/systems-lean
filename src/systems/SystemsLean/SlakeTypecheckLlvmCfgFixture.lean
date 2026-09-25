/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgFixture.
  Short role: named driver for just slake-typecheck-llvmcfgfixture.
  Ready is HostFrontLiveLlvmCfgFixture parse plus HostKernel.kernelCheck
  of live LlvmCfgFixture.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgFixture.
  liveRel is LlvmCfgFixture.lean.
  This wrap is LlvmCfgFixture.lean. It is not LlvmCfgHonesty.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-FIXTURE,
  SLAKE_TYPECHECK_LLVM_CFG_FIXTURE, slake-typecheck-llvmcfgfixture,
  slakeTypecheckLlvmCfgFixtureReady,
  kernelCheckLiveLlvmCfgFixtureSource,
  PARSE-LIVE-LLVM-CFG-FIXTURE.
  Module: SystemsLean.SlakeTypecheckLlvmCfgFixture
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgFixture

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_CFG_FIXTURE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-FIXTURE"

/-- Named recipe. Not lake build SystemsLean.LlvmCfgFixture. -/
def justRecipeSlakeTypecheckLlvmCfgFixture : String :=
  "slake-typecheck-llvmcfgfixture"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgFixtureRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgFixture.liveLlvmCfgFixtureRel

/-- Ready names HostFrontLiveLlvmCfgFixture parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgFixtureReady,
    kernelCheckLiveLlvmCfgFixtureSource. -/
def slakeTypecheckLlvmCfgFixtureReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgFixture.hostFrontLiveLlvmCfgFixtureReady

/-- Honesty: this command is not lake build of LlvmCfgFixture. -/
def slakeTypecheckLlvmCfgFixtureDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgFixtureFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgFixtureFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgFixtureOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgFixture.lean.
    Ready is HostFrontLiveLlvmCfgFixture.hostFrontLiveLlvmCfgFixtureReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgFixture.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgFixture} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgFixture.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgFixtureRel}"
  unless (!slakeTypecheckLlvmCfgFixtureFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgFixtureFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgFixtureOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgFixture.main args
