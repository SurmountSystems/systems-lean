/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitErasureScaffold.
  Short role: named driver for just slake-typecheck-emiterasurescaffold.
  Ready is HostFrontLiveEmitErasureScaffold parse plus HostKernel.kernelCheck
  of live EmitErasureScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitErasureScaffold.
  liveRel is EmitErasureScaffold.lean.
  This wrap is EmitErasureScaffold.lean. It is not EmitErasure.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-ERASURE-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_ERASURE_SCAFFOLD, slake-typecheck-emiterasurescaffold,
  slakeTypecheckEmitErasureScaffoldReady,
  kernelCheckLiveEmitErasureScaffoldSource,
  PARSE-LIVE-EMIT-ERASURE-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitErasureScaffold
  Checkable writer: just slake-typecheck-emiterasurescaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitErasureScaffold
import SystemsLean.HostFrontLiveEmitErasureScaffoldSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_ERASURE_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-ERASURE-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitErasureScaffold. -/
def justRecipeSlakeTypecheckEmitErasureScaffold : String :=
  "slake-typecheck-emiterasurescaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitErasureScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitErasureScaffold.liveEmitErasureScaffoldRel

/-- Ready names HostFrontLiveEmitErasureScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitErasureScaffoldReady,
    kernelCheckLiveEmitErasureScaffoldSource. -/
def slakeTypecheckEmitErasureScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitErasureScaffold.hostFrontLiveEmitErasureScaffoldReady

/-- Honesty: this command is not lake build of EmitErasureScaffold. -/
def slakeTypecheckEmitErasureScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitErasureScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitErasureScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitErasureScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitErasureScaffold.lean.
    Ready is HostFrontLiveEmitErasureScaffold.hostFrontLiveEmitErasureScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitErasureScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitErasureScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitErasureScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitErasureScaffoldRel}"
  unless (!slakeTypecheckEmitErasureScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitErasureScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitErasureScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitErasureScaffold.main args
