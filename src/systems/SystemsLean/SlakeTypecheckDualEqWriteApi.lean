/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteApi.
  Short role: named driver for just slake-typecheck-dualeqwriteapi.
  Ready is HostFrontLiveDualEqWriteApi parse plus HostKernel.kernelCheck
  of live DualEqWriteApi.lean, not := true, not lake build
  SystemsLean.DualEqWriteApi.
  Not mill 65. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteApi is not a prefix):
  SlakeTypecheckDualEqWriteApi
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-API
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_API_V0
  PARSE-LIVE-DUAL-EQ-WRITE-API
  slake-typecheck-dualeqwriteapi
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteapi,
  slakeTypecheckDualEqWriteApiReady,
  kernelCheckLiveDualEqWriteApiSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteApi
  Checkable writer: just slake-typecheck-dualeqwriteapi
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteApi

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_API_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-API"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteApi. -/
def justRecipeSlakeTypecheckDualEqWriteApi : String :=
  "slake-typecheck-dualeqwriteapi"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteApiRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteApi.liveDualEqWriteApiRel

/-- Ready names HostFrontLiveDualEqWriteApi parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteApiReady,
    kernelCheckLiveDualEqWriteApiSource. -/
def slakeTypecheckDualEqWriteApiReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteApi.hostFrontLiveDualEqWriteApiReady

/-- Honesty: this command is not lake build of DualEqWriteApi. -/
def slakeTypecheckDualEqWriteApiDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteApiFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteApiOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteApi.lean.
    Ready is HostFrontLiveDualEqWriteApi.hostFrontLiveDualEqWriteApiReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteApi.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteApi} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteApiRel}"
  unless (!slakeTypecheckDualEqWriteApiFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteApiOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteApi.main args
