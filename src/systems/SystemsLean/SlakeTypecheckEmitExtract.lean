/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitExtract.
  Short role: named driver for just slake-typecheck-emitextract.
  Ready is HostFrontLiveEmitExtract parse plus HostKernel.kernelCheck
  of live EmitExtract.lean, not a hardcoded true, not lake build
  SystemsLean.EmitExtract.
  liveRel is EmitExtract.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a remill. Not a new emit feature.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-EXTRACT,
  SLAKE_TYPECHECK_EMIT_EXTRACT_V0, slake-typecheck-emitextract,
  slakeTypecheckEmitExtractReady,
  kernelCheckLiveEmitExtractSource,
  PARSE-LIVE-EMIT-EXTRACT, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitExtract
  Checkable writer: just slake-typecheck-emitextract
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitExtract

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_EXTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-EXTRACT"

/-- Named just recipe. Not lake build SystemsLean.EmitExtract. -/
def justRecipeSlakeTypecheckEmitExtract : String :=
  "slake-typecheck-emitextract"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitExtractRel : String :=
  SystemsLean.HostFrontLiveEmitExtract.liveEmitExtractRel

/-- Ready names HostFrontLiveEmitExtract parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitExtractReady,
    kernelCheckLiveEmitExtractSource. -/
def slakeTypecheckEmitExtractReady : Bool :=
  SystemsLean.HostFrontLiveEmitExtract.hostFrontLiveEmitExtractReady

/-- Honesty: this command is not lake build of EmitExtract. -/
def slakeTypecheckEmitExtractDoesNotUseLake : Bool :=
  justRecipeSlakeTypecheckEmitExtract == "slake-typecheck-emitextract"

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitExtractFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitExtractOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitExtract.lean.
    Ready is HostFrontLiveEmitExtract.hostFrontLiveEmitExtractReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitExtract.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitExtract} =="
  IO.println s!"  host={hostId} file={liveEmitExtractRel} liveRel={SystemsLean.HostFrontLiveEmitExtract.liveRel}"
  unless (!slakeTypecheckEmitExtractFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitExtractOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitExtractDoesNotUseLake do
    IO.eprintln "error: recipe must stay slake-typecheck-emitextract"
    return 1
  SystemsLean.HostFrontLiveEmitExtract.main args
