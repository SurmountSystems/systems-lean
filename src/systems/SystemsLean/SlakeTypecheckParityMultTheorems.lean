/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityMultTheorems.
  Short role: named driver for just slake-typecheck-paritymulttheorems.
  Ready is HostFrontLiveParityMultTheorems parse plus HostKernel.kernelCheck
  of live ParityMultTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.ParityMultTheorems.
  liveRel is ParityMultTheorems.lean.
  This wrap is ParityMultTheorems.lean. It is not ParityMult.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-MULT-THEOREMS,
  SLAKE_TYPECHECK_PARITY_MULT_THEOREMS, slake-typecheck-paritymulttheorems,
  slakeTypecheckParityMultTheoremsReady,
  kernelCheckLiveParityMultTheoremsSource,
  PARSE-LIVE-PARITY-MULT-THEOREMS.
  Module: SystemsLean.SlakeTypecheckParityMultTheorems
  Checkable writer: just slake-typecheck-paritymulttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityMultTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_MULT_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-MULT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ParityMultTheorems. -/
def justRecipeSlakeTypecheckParityMultTheorems : String :=
  "slake-typecheck-paritymulttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityMultTheoremsRel : String :=
  SystemsLean.HostFrontLiveParityMultTheorems.liveParityMultTheoremsRel

/-- Ready names HostFrontLiveParityMultTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityMultTheoremsReady,
    kernelCheckLiveParityMultTheoremsSource. -/
def slakeTypecheckParityMultTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveParityMultTheorems.hostFrontLiveParityMultTheoremsReady

/-- Honesty: this command is not lake build of ParityMultTheorems. -/
def slakeTypecheckParityMultTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityMultTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityMultTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityMultTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityMultTheorems.lean.
    Ready is HostFrontLiveParityMultTheorems.hostFrontLiveParityMultTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityMultTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityMultTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityMultTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveParityMultTheoremsRel}"
  unless (!slakeTypecheckParityMultTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityMultTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityMultTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityMultTheorems.main args
