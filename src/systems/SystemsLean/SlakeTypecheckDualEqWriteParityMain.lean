/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteParityMain.
  Short role: named driver for just slake-typecheck-dualeqwriteparitymain.
  Ready is HostFrontLiveDualEqWriteParityMain parse plus HostKernel.kernelCheck
  of live DualEqWriteParityMain.lean, not := true, not lake build
  SystemsLean.DualEqWriteParityMain.
  Not mill 14 remill (fourteenth-host-tool ELF already exists; inventory row 17).
  Not occupancy name 50. Not FullHost.
  This wrap parses DualEqWriteParityMain.lean only. Do not wrap DualEqWriteParity.lean.
  Do not invent HostFrontLiveDualEqWriteParity. Do not steal DualEqWriteApi companions.
  DualEqWrite.lean does not exist. Not Linear. Not IrGraph. Not ComposeSubsetEmit.
  Not CapableComposeMain. Not HostModuleCheckMain. Not DualEqWriteApi.lean.
  Occupancy leftover is not this wrap.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteParityMain is not a prefix):
  SlakeTypecheckDualEqWriteParityMain
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-MAIN
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_MAIN_V0
  slake-typecheck-dualeqwriteparitymain
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN
  DUAL-EQ-WRITE-PARITY-MAIN
  HOST-DUAL-EQ-WRITE-PARITY-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwriteparitymain,
  slakeTypecheckDualEqWriteParityMainReady,
  hostFrontLiveDualEqWriteParityMainReady,
  kernelCheckLiveDualEqWriteParityMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteParityMain
  Checkable writer: just slake-typecheck-dualeqwriteparitymain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteParityMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-MAIN"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteParityMain. -/
def justRecipeSlakeTypecheckDualEqWriteParityMain : String :=
  "slake-typecheck-dualeqwriteparitymain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteParityMainRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteParityMain.liveDualEqWriteParityMainRel

/-- Ready names HostFrontLiveDualEqWriteParityMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteParityMainReady,
    hostFrontLiveDualEqWriteParityMainReady,
    kernelCheckLiveDualEqWriteParityMainSource. -/
def slakeTypecheckDualEqWriteParityMainReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteParityMain.hostFrontLiveDualEqWriteParityMainReady

/-- Honesty: this command is not lake build of DualEqWriteParityMain. -/
def slakeTypecheckDualEqWriteParityMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteParityMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteParityMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteParityMain.lean.
    Ready is HostFrontLiveDualEqWriteParityMain.hostFrontLiveDualEqWriteParityMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteParityMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteParityMain} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteParityMainRel}"
  unless (!slakeTypecheckDualEqWriteParityMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteParityMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteParityMain.main args
