/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityEmitTheorems.
  Short role: named driver for just slake-typecheck-parityemittheorems.
  Ready is HostFrontLiveParityEmitTheorems parse plus HostKernel.kernelCheck
  of live ParityEmitTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.ParityEmitTheorems.
  liveRel is ParityEmitTheorems.lean.
  This wrap is ParityEmitTheorems.lean. It is not ParityEmit.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-EMIT-THEOREMS,
  SLAKE_TYPECHECK_PARITY_EMIT_THEOREMS, slake-typecheck-parityemittheorems,
  slakeTypecheckParityEmitTheoremsReady,
  kernelCheckLiveParityEmitTheoremsSource,
  PARSE-LIVE-PARITY-EMIT-THEOREMS.
  Module: SystemsLean.SlakeTypecheckParityEmitTheorems
  Checkable writer: just slake-typecheck-parityemittheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityEmitTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_EMIT_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-EMIT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ParityEmitTheorems. -/
def justRecipeSlakeTypecheckParityEmitTheorems : String :=
  "slake-typecheck-parityemittheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityEmitTheoremsRel : String :=
  SystemsLean.HostFrontLiveParityEmitTheorems.liveParityEmitTheoremsRel

/-- Ready names HostFrontLiveParityEmitTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityEmitTheoremsReady,
    kernelCheckLiveParityEmitTheoremsSource. -/
def slakeTypecheckParityEmitTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveParityEmitTheorems.hostFrontLiveParityEmitTheoremsReady

/-- Honesty: this command is not lake build of ParityEmitTheorems. -/
def slakeTypecheckParityEmitTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityEmitTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityEmitTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityEmitTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityEmitTheorems.lean.
    Ready is HostFrontLiveParityEmitTheorems.hostFrontLiveParityEmitTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityEmitTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityEmitTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityEmitTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveParityEmitTheoremsRel}"
  unless (!slakeTypecheckParityEmitTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityEmitTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityEmitTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityEmitTheorems.main args
