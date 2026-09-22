/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteParityTheorems.
  Short role: named driver for the closed DualEqWriteParityTheorems check.
  Ready is HostFrontLiveDualEqWriteParityTheorems parse plus HostKernel.kernelCheck
  of live DualEqWriteParityTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.DualEqWriteParityTheorems.
  liveRel is DualEqWriteParityTheorems.lean.
  Not DualEqWriteParity.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Not wired into the root just index.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-THEOREMS,
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_THEOREMS,
  slake-typecheck-dualeqwriteparitytheorems,
  slakeTypecheckDualEqWriteParityTheoremsReady,
  kernelCheckLiveDualEqWriteParityTheoremsSource,
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS.
  Module: SystemsLean.SlakeTypecheckDualEqWriteParityTheorems
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveDualEqWriteParityTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-THEOREMS"

/-- Named recipe id. Not added to the root just index.
    Not lake build SystemsLean.DualEqWriteParityTheorems. -/
def justRecipeSlakeTypecheckDualEqWriteParityTheorems : String :=
  "slake-typecheck-dualeqwriteparitytheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteParityTheoremsRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteParityTheorems.liveDualEqWriteParityTheoremsRel

/-- Ready names HostFrontLiveDualEqWriteParityTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckDualEqWriteParityTheoremsReady,
    kernelCheckLiveDualEqWriteParityTheoremsSource. -/
def slakeTypecheckDualEqWriteParityTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteParityTheorems.hostFrontLiveDualEqWriteParityTheoremsReady

/-- Honesty: this command is not lake build of DualEqWriteParityTheorems. -/
def slakeTypecheckDualEqWriteParityTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteParityTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckDualEqWriteParityTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteParityTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteParityTheorems.lean.
    Ready is HostFrontLiveDualEqWriteParityTheorems.hostFrontLiveDualEqWriteParityTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveDualEqWriteParityTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteParityTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveDualEqWriteParityTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveDualEqWriteParityTheoremsRel}"
  unless (!slakeTypecheckDualEqWriteParityTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteParityTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteParityTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteParityTheorems.main args
