/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.DualEqWriteClosePathTheorems.
  Short role: named driver for just slake-typecheck-dualeqwriteclosepaththeorems.
  Ready is HostFrontLiveDualEqWriteClosePathTheorems parse plus
  HostKernel.kernelCheck of live DualEqWriteClosePathTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.DualEqWriteClosePathTheorems.
  liveRel is DualEqWriteClosePathTheorems.lean.
  Not DualEqWriteClosePath.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS,
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_THEOREMS,
  slake-typecheck-dualeqwriteclosepaththeorems,
  slakeTypecheckDualEqWriteClosePathTheoremsReady,
  kernelCheckLiveDualEqWriteClosePathTheoremsSource,
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS.
  Module: SystemsLean.SlakeTypecheckDualEqWriteClosePathTheorems
  Checkable writer: just slake-typecheck-dualeqwriteclosepaththeorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteClosePathTheorems. -/
def justRecipeSlakeTypecheckDualEqWriteClosePathTheorems : String :=
  "slake-typecheck-dualeqwriteclosepaththeorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteClosePathTheoremsRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.liveDualEqWriteClosePathTheoremsRel

/-- Ready names HostFrontLiveDualEqWriteClosePathTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckDualEqWriteClosePathTheoremsReady,
    kernelCheckLiveDualEqWriteClosePathTheoremsSource. -/
def slakeTypecheckDualEqWriteClosePathTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.hostFrontLiveDualEqWriteClosePathTheoremsReady

/-- Honesty: this command is not lake build of DualEqWriteClosePathTheorems. -/
def slakeTypecheckDualEqWriteClosePathTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteClosePathTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckDualEqWriteClosePathTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteClosePathTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteClosePathTheorems.lean.
    Ready is HostFrontLiveDualEqWriteClosePathTheorems.hostFrontLiveDualEqWriteClosePathTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveDualEqWriteClosePathTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteClosePathTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveDualEqWriteClosePathTheoremsRel}"
  unless (!slakeTypecheckDualEqWriteClosePathTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteClosePathTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteClosePathTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.main args
