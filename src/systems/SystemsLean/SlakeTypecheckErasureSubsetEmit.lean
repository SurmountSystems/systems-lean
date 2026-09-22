/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ErasureSubsetEmit.
  Short role: named driver for the closed ErasureSubsetEmit wrap.
  Ready is HostFrontLiveErasureSubsetEmit parse plus HostKernel.kernelCheck
  of live ErasureSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.ErasureSubsetEmit.
  liveRel is ErasureSubsetEmit.lean.
  This wrap is ErasureSubsetEmit.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-EMIT,
  SLAKE_TYPECHECK_ERASURE_SUBSET_EMIT, slake-typecheck-erasuresubsetemit,
  slakeTypecheckErasureSubsetEmitReady,
  kernelCheckLiveErasureSubsetEmitSource,
  PARSE-LIVE-ERASURE-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckErasureSubsetEmit
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveErasureSubsetEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-EMIT"

/-- Named closed recipe. Not lake build SystemsLean.ErasureSubsetEmit. -/
def justRecipeSlakeTypecheckErasureSubsetEmit : String :=
  "slake-typecheck-erasuresubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveErasureSubsetEmit.liveErasureSubsetEmitRel

/-- Ready names HostFrontLiveErasureSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckErasureSubsetEmitReady,
    kernelCheckLiveErasureSubsetEmitSource. -/
def slakeTypecheckErasureSubsetEmitReady : Bool :=
  SystemsLean.HostFrontLiveErasureSubsetEmit.hostFrontLiveErasureSubsetEmitReady

/-- Honesty: this command is not lake build of ErasureSubsetEmit. -/
def slakeTypecheckErasureSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureSubsetEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckErasureSubsetEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ErasureSubsetEmit.lean.
    Ready is HostFrontLiveErasureSubsetEmit.hostFrontLiveErasureSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveErasureSubsetEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasureSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveErasureSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveErasureSubsetEmitRel}"
  unless (!slakeTypecheckErasureSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasureSubsetEmit.main args
