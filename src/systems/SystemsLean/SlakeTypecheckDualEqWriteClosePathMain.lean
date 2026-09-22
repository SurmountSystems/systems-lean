/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteClosePathMain.
  Short role: named driver for just slake-typecheck-dualeqwriteclosepathmain.
  Ready is HostFrontLiveDualEqWriteClosePathMain parse plus HostKernel.kernelCheck
  of live DualEqWriteClosePathMain.lean, not := true, not lake build
  SystemsLean.DualEqWriteClosePathMain.
  Not mill 15 remill (just fifteenth-host-tool).
  Not occupancy name 50. Not FullHost.
  This wrap parses DualEqWriteClosePathMain.lean only. Do not wrap DualEqWriteClosePath.lean.
  Do not invent HostFrontLiveDualEqWriteClosePath. DualEqWrite.lean does not exist.
  Do not wrap DualEqWriteApiMain. Do not wrap DualEqWriteParityMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteClosePathMain is not a prefix):
  SlakeTypecheckDualEqWriteClosePathMain
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0
  slake-typecheck-dualeqwriteclosepathmain
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteclosepathmain,
  slakeTypecheckDualEqWriteClosePathMainReady,
  kernelCheckLiveDualEqWriteClosePathMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteClosePathMain
  Checkable writer: just slake-typecheck-dualeqwriteclosepathmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePathMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-MAIN"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteClosePathMain. -/
def justRecipeSlakeTypecheckDualEqWriteClosePathMain : String :=
  "slake-typecheck-dualeqwriteclosepathmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteClosePathMainRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathMain.liveDualEqWriteClosePathMainRel

/-- Ready names HostFrontLiveDualEqWriteClosePathMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteClosePathMainReady,
    kernelCheckLiveDualEqWriteClosePathMainSource. -/
def slakeTypecheckDualEqWriteClosePathMainReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathMain.hostFrontLiveDualEqWriteClosePathMainReady

/-- Honesty: this command is not lake build of DualEqWriteClosePathMain. -/
def slakeTypecheckDualEqWriteClosePathMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteClosePathMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteClosePathMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteClosePathMain.lean.
    Ready is HostFrontLiveDualEqWriteClosePathMain.hostFrontLiveDualEqWriteClosePathMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteClosePathMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteClosePathMain} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteClosePathMainRel}"
  unless (!slakeTypecheckDualEqWriteClosePathMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteClosePathMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteClosePathMain.main args
