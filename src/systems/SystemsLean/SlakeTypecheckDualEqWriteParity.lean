/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteParity.
  Short role: named driver for just slake-typecheck-dualeqwriteparity.
  Ready is HostFrontLiveDualEqWriteParity parse plus HostKernel.kernelCheck
  of live DualEqWriteParity.lean, not := true, not lake build
  SystemsLean.DualEqWriteParity.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteParity is not a
  prefix of mill wrap SlakeTypecheckDualEqWriteParityMain):
  SlakeTypecheckDualEqWriteParity
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_V0
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY
  slake-typecheck-dualeqwriteparity
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteparity,
  slakeTypecheckDualEqWriteParityReady,
  kernelCheckLiveDualEqWriteParitySource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteParity
  Checkable writer: just slake-typecheck-dualeqwriteparity
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteParity

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteParity. -/
def justRecipeSlakeTypecheckDualEqWriteParity : String :=
  "slake-typecheck-dualeqwriteparity"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteParityRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteParity.liveDualEqWriteParityRel

/-- Live basename. Greppable: liveRel. Must be DualEqWriteParity.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteParity.liveRel

/-- Ready names HostFrontLiveDualEqWriteParity parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteParityReady,
    kernelCheckLiveDualEqWriteParitySource. -/
def slakeTypecheckDualEqWriteParityReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteParity.hostFrontLiveDualEqWriteParityReady

/-- Honesty: this command is not lake build of DualEqWriteParity. -/
def slakeTypecheckDualEqWriteParityDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteParityFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteParityOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteParity.lean.
    Ready is HostFrontLiveDualEqWriteParity.hostFrontLiveDualEqWriteParityReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteParity.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteParity} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteParityRel} liveRel={liveRel}"
  unless (!slakeTypecheckDualEqWriteParityFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteParityOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteParity.main args
