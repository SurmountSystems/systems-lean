/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.DualEqWriteCapableGapTheorems.
  Short role: named driver for just slake-typecheck-dualeqwritecapablegaptheorems.
  Ready is HostFrontLiveDualEqWriteCapableGapTheorems parse plus
  HostKernel.kernelCheck of live DualEqWriteCapableGapTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.DualEqWriteCapableGapTheorems.
  liveRel is DualEqWriteCapableGapTheorems.lean.
  This wrap is DualEqWriteCapableGapTheorems.lean.
  It is not DualEqWriteCapableGap.lean.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS,
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS,
  slake-typecheck-dualeqwritecapablegaptheorems,
  slakeTypecheckDualEqWriteCapableGapTheoremsReady,
  kernelCheckLiveDualEqWriteCapableGapTheoremsSource,
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS.
  Module: SystemsLean.SlakeTypecheckDualEqWriteCapableGapTheorems
  Checkable writer: just slake-typecheck-dualeqwritecapablegaptheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteCapableGapTheorems. -/
def justRecipeSlakeTypecheckDualEqWriteCapableGapTheorems : String :=
  "slake-typecheck-dualeqwritecapablegaptheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteCapableGapTheoremsRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.liveDualEqWriteCapableGapTheoremsRel

/-- Ready names HostFrontLiveDualEqWriteCapableGapTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckDualEqWriteCapableGapTheoremsReady,
    kernelCheckLiveDualEqWriteCapableGapTheoremsSource. -/
def slakeTypecheckDualEqWriteCapableGapTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.hostFrontLiveDualEqWriteCapableGapTheoremsReady

/-- Honesty: this command is not lake build of DualEqWriteCapableGapTheorems. -/
def slakeTypecheckDualEqWriteCapableGapTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteCapableGapTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckDualEqWriteCapableGapTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteCapableGapTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteCapableGapTheorems.lean.
    Ready is HostFrontLiveDualEqWriteCapableGapTheorems.hostFrontLiveDualEqWriteCapableGapTheoremsReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveDualEqWriteCapableGapTheorems.main at runtime.
    kernelCheckLiveDualEqWriteCapableGapTheoremsSource calls HostKernel.kernelCheck. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteCapableGapTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveDualEqWriteCapableGapTheoremsRel}"
  unless (!slakeTypecheckDualEqWriteCapableGapTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteCapableGapTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteCapableGapTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.main args
