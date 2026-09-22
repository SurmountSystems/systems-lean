/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteClosePath.
  Short role: named driver for just slake-typecheck-dualeqwriteclosepath.
  Ready is HostFrontLiveDualEqWriteClosePath parse plus HostKernel.kernelCheck
  of live DualEqWriteClosePath.lean, not := true, not lake build
  SystemsLean.DualEqWriteClosePath.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteClosePath is not a
  prefix of mill wrap SlakeTypecheckDualEqWriteClosePathMain):
  SlakeTypecheckDualEqWriteClosePath
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_V0
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH
  slake-typecheck-dualeqwriteclosepath
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteclosepath,
  slakeTypecheckDualEqWriteClosePathReady,
  kernelCheckLiveDualEqWriteClosePathSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteClosePath
  Checkable writer: just slake-typecheck-dualeqwriteclosepath
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePath

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteClosePath. -/
def justRecipeSlakeTypecheckDualEqWriteClosePath : String :=
  "slake-typecheck-dualeqwriteclosepath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteClosePathRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteClosePath.liveDualEqWriteClosePathRel

/-- Live basename. Greppable: liveRel. Must be DualEqWriteClosePath.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteClosePath.liveRel

/-- Ready names HostFrontLiveDualEqWriteClosePath parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteClosePathReady,
    kernelCheckLiveDualEqWriteClosePathSource. -/
def slakeTypecheckDualEqWriteClosePathReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteClosePath.hostFrontLiveDualEqWriteClosePathReady

/-- Honesty: this command is not lake build of DualEqWriteClosePath. -/
def slakeTypecheckDualEqWriteClosePathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteClosePathFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteClosePathOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteClosePath.lean.
    Ready is HostFrontLiveDualEqWriteClosePath.hostFrontLiveDualEqWriteClosePathReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteClosePath.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteClosePath} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteClosePathRel} liveRel={liveRel}"
  unless (!slakeTypecheckDualEqWriteClosePathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteClosePathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteClosePath.main args
