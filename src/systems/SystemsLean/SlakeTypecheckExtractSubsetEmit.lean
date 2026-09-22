/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ExtractSubsetEmit.
  Short role: named driver for the closed ExtractSubsetEmit check.
  Ready is HostFrontLiveExtractSubsetEmit parse plus HostKernel.kernelCheck
  of live ExtractSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.ExtractSubsetEmit.
  liveRel is ExtractSubsetEmit.lean.
  This wrap is ExtractSubsetEmit.lean. Theorems and examples in that file
  are skipped. It is not ExtractSubsetEmitMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-EMIT,
  SLAKE_TYPECHECK_EXTRACT_SUBSET_EMIT, slake-typecheck-extractsubsetemit,
  slakeTypecheckExtractSubsetEmitReady,
  kernelCheckLiveExtractSubsetEmitSource,
  PARSE-LIVE-EXTRACT-SUBSET-EMIT, EXTRACT-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckExtractSubsetEmit
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveExtractSubsetEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-EMIT"

/-- Closed-check name. Not lake build SystemsLean.ExtractSubsetEmit.
    Not a just module. -/
def justRecipeSlakeTypecheckExtractSubsetEmit : String :=
  "slake-typecheck-extractsubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveExtractSubsetEmit.liveExtractSubsetEmitRel

/-- Ready names HostFrontLiveExtractSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckExtractSubsetEmitReady,
    kernelCheckLiveExtractSubsetEmitSource. -/
def slakeTypecheckExtractSubsetEmitReady : Bool :=
  SystemsLean.HostFrontLiveExtractSubsetEmit.hostFrontLiveExtractSubsetEmitReady

/-- Honesty: this command is not lake build of ExtractSubsetEmit. -/
def slakeTypecheckExtractSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractSubsetEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckExtractSubsetEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ExtractSubsetEmit.lean.
    Ready is HostFrontLiveExtractSubsetEmit.hostFrontLiveExtractSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveExtractSubsetEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtractSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveExtractSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveExtractSubsetEmitRel}"
  unless (!slakeTypecheckExtractSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtractSubsetEmit.main args
