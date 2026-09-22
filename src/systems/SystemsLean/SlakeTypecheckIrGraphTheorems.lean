/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.IrGraphTheorems.
  Short role: named driver for just slake-typecheck-irgraphtheorems.
  Ready is HostFrontLiveIrGraphTheorems parse plus HostKernel.kernelCheck
  of live IrGraphTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.IrGraphTheorems.
  liveRel is IrGraphTheorems.lean.
  This wrap is IrGraphTheorems.lean. It is not IrGraph.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IR-GRAPH-THEOREMS,
  SLAKE_TYPECHECK_IR_GRAPH_THEOREMS, slake-typecheck-irgraphtheorems,
  slakeTypecheckIrGraphTheoremsReady,
  kernelCheckLiveIrGraphTheoremsSource,
  PARSE-LIVE-IR-GRAPH-THEOREMS.
  Module: SystemsLean.SlakeTypecheckIrGraphTheorems
  Checkable writer: just slake-typecheck-irgraphtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveIrGraphTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IR_GRAPH_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IR-GRAPH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.IrGraphTheorems. -/
def justRecipeSlakeTypecheckIrGraphTheorems : String :=
  "slake-typecheck-irgraphtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrGraphTheoremsRel : String :=
  SystemsLean.HostFrontLiveIrGraphTheorems.liveIrGraphTheoremsRel

/-- Ready names HostFrontLiveIrGraphTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckIrGraphTheoremsReady,
    kernelCheckLiveIrGraphTheoremsSource. -/
def slakeTypecheckIrGraphTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveIrGraphTheorems.hostFrontLiveIrGraphTheoremsReady

/-- Honesty: this command is not lake build of IrGraphTheorems. -/
def slakeTypecheckIrGraphTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckIrGraphTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckIrGraphTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckIrGraphTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live IrGraphTheorems.lean.
    Ready is HostFrontLiveIrGraphTheorems.hostFrontLiveIrGraphTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveIrGraphTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckIrGraphTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveIrGraphTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveIrGraphTheoremsRel}"
  unless (!slakeTypecheckIrGraphTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckIrGraphTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckIrGraphTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveIrGraphTheorems.main args
