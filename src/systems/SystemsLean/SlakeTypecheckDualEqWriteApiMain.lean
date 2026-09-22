/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteApiMain.
  Short role: named driver for just slake-typecheck-dualeqwriteapimain.
  Ready is HostFrontLiveDualEqWriteApiMain parse plus HostKernel.kernelCheck
  of live DualEqWriteApiMain.lean, not := true, not lake build
  SystemsLean.DualEqWriteApiMain.
  Not mill 65 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteApiMain is not a prefix):
  SlakeTypecheckDualEqWriteApiMain
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-API-MAIN
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_API_MAIN_V0
  slake-typecheck-dualeqwriteapimain
  PARSE-LIVE-DUAL-EQ-WRITE-API-MAIN
  DUAL-EQ-WRITE-API-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteapimain,
  slakeTypecheckDualEqWriteApiMainReady,
  kernelCheckLiveDualEqWriteApiMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteApiMain
  Checkable writer: just slake-typecheck-dualeqwriteapimain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteApiMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_API_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-API-MAIN"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteApiMain. -/
def justRecipeSlakeTypecheckDualEqWriteApiMain : String :=
  "slake-typecheck-dualeqwriteapimain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteApiMainRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteApiMain.liveDualEqWriteApiMainRel

/-- Ready names HostFrontLiveDualEqWriteApiMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteApiMainReady,
    kernelCheckLiveDualEqWriteApiMainSource. -/
def slakeTypecheckDualEqWriteApiMainReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteApiMain.hostFrontLiveDualEqWriteApiMainReady

/-- Honesty: this command is not lake build of DualEqWriteApiMain. -/
def slakeTypecheckDualEqWriteApiMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteApiMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteApiMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteApiMain.lean.
    Ready is HostFrontLiveDualEqWriteApiMain.hostFrontLiveDualEqWriteApiMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteApiMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteApiMain} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteApiMainRel}"
  unless (!slakeTypecheckDualEqWriteApiMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteApiMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteApiMain.main args
