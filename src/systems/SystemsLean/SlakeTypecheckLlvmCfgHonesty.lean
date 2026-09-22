/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmCfgHonesty.
  Short role: named driver for just slake-typecheck-llvmcfghonesty.
  Ready is HostFrontLiveLlvmCfgHonesty parse plus HostKernel.kernelCheck
  of live LlvmCfgHonesty.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmCfgHonesty.
  liveRel is LlvmCfgHonesty.lean.
  Not LlvmCfg.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-CFG-HONESTY,
  SLAKE_TYPECHECK_LLVM_CFG_HONESTY, slake-typecheck-llvmcfghonesty,
  slakeTypecheckLlvmCfgHonestyReady,
  kernelCheckLiveLlvmCfgHonestySource,
  PARSE-LIVE-LLVM-CFG-HONESTY.
  Module: SystemsLean.SlakeTypecheckLlvmCfgHonesty
  Checkable writer: just slake-typecheck-llvmcfghonesty
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmCfgHonesty

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_CFG_HONESTY"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-CFG-HONESTY"

/-- Named just recipe. Not lake build SystemsLean.LlvmCfgHonesty. -/
def justRecipeSlakeTypecheckLlvmCfgHonesty : String :=
  "slake-typecheck-llvmcfghonesty"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgHonestyRel : String :=
  SystemsLean.HostFrontLiveLlvmCfgHonesty.liveLlvmCfgHonestyRel

/-- Ready names HostFrontLiveLlvmCfgHonesty parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmCfgHonestyReady,
    kernelCheckLiveLlvmCfgHonestySource. -/
def slakeTypecheckLlvmCfgHonestyReady : Bool :=
  SystemsLean.HostFrontLiveLlvmCfgHonesty.hostFrontLiveLlvmCfgHonestyReady

/-- Honesty: this command is not lake build of LlvmCfgHonesty. -/
def slakeTypecheckLlvmCfgHonestyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmCfgHonestyFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLlvmCfgHonestyFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmCfgHonestyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmCfgHonesty.lean.
    Ready is HostFrontLiveLlvmCfgHonesty.hostFrontLiveLlvmCfgHonestyReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmCfgHonesty.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmCfgHonesty} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmCfgHonesty.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmCfgHonestyRel}"
  unless (!slakeTypecheckLlvmCfgHonestyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgHonestyFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmCfgHonestyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmCfgHonesty.main args
