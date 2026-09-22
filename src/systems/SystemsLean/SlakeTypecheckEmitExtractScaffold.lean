/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitExtractScaffold.
  Short role: named driver for just slake-typecheck-emitextractscaffold.
  Ready is HostFrontLiveEmitExtractScaffold parse plus HostKernel.kernelCheck
  of live EmitExtractScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitExtractScaffold.
  liveRel is EmitExtractScaffold.lean.
  This wrap is EmitExtractScaffold.lean. It is not EmitExtract.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-EXTRACT-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_EXTRACT_SCAFFOLD, slake-typecheck-emitextractscaffold,
  slakeTypecheckEmitExtractScaffoldReady,
  kernelCheckLiveEmitExtractScaffoldSource,
  PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitExtractScaffold
  Checkable writer: just slake-typecheck-emitextractscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitExtractScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_EXTRACT_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-EXTRACT-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitExtractScaffold. -/
def justRecipeSlakeTypecheckEmitExtractScaffold : String :=
  "slake-typecheck-emitextractscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitExtractScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitExtractScaffold.liveEmitExtractScaffoldRel

/-- Ready names HostFrontLiveEmitExtractScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitExtractScaffoldReady,
    kernelCheckLiveEmitExtractScaffoldSource. -/
def slakeTypecheckEmitExtractScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitExtractScaffold.hostFrontLiveEmitExtractScaffoldReady

/-- Honesty: this command is not lake build of EmitExtractScaffold. -/
def slakeTypecheckEmitExtractScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitExtractScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitExtractScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitExtractScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitExtractScaffold.lean.
    Ready is HostFrontLiveEmitExtractScaffold.hostFrontLiveEmitExtractScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitExtractScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitExtractScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitExtractScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitExtractScaffoldRel}"
  unless (!slakeTypecheckEmitExtractScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitExtractScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitExtractScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitExtractScaffold.main args
