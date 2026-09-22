/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityLinearTheorems.
  Short role: named driver for just slake-typecheck-paritylineartheorems.
  Ready is HostFrontLiveParityLinearTheorems parse plus HostKernel.kernelCheck
  of live ParityLinearTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.ParityLinearTheorems.
  liveRel is ParityLinearTheorems.lean.
  This wrap is ParityLinearTheorems.lean. It is not ParityLinear.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-LINEAR-THEOREMS,
  SLAKE_TYPECHECK_PARITY_LINEAR_THEOREMS, slake-typecheck-paritylineartheorems,
  slakeTypecheckParityLinearTheoremsReady,
  kernelCheckLiveParityLinearTheoremsSource,
  PARSE-LIVE-PARITY-LINEAR-THEOREMS.
  Module: SystemsLean.SlakeTypecheckParityLinearTheorems
  Checkable writer: just slake-typecheck-paritylineartheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityLinearTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_LINEAR_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-LINEAR-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ParityLinearTheorems. -/
def justRecipeSlakeTypecheckParityLinearTheorems : String :=
  "slake-typecheck-paritylineartheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityLinearTheoremsRel : String :=
  SystemsLean.HostFrontLiveParityLinearTheorems.liveParityLinearTheoremsRel

/-- Ready names HostFrontLiveParityLinearTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityLinearTheoremsReady,
    kernelCheckLiveParityLinearTheoremsSource. -/
def slakeTypecheckParityLinearTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveParityLinearTheorems.hostFrontLiveParityLinearTheoremsReady

/-- Honesty: this command is not lake build of ParityLinearTheorems. -/
def slakeTypecheckParityLinearTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityLinearTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityLinearTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityLinearTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityLinearTheorems.lean.
    Ready is HostFrontLiveParityLinearTheorems.hostFrontLiveParityLinearTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityLinearTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityLinearTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityLinearTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveParityLinearTheoremsRel}"
  unless (!slakeTypecheckParityLinearTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityLinearTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityLinearTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityLinearTheorems.main args
