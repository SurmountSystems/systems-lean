/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitBody.
  Short role: named driver for just slake-typecheck-emitbody.
  Ready is HostFrontLiveEmitBody parse plus HostKernel.kernelCheck
  of live EmitBody.lean, not a hardcoded true, not lake build
  SystemsLean.EmitBody.
  liveRel is EmitBody.lean.
  This wrap is EmitBody.lean. It is not EmitBodyScaffold.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-BODY,
  SLAKE_TYPECHECK_EMIT_BODY, slake-typecheck-emitbody,
  slakeTypecheckEmitBodyReady,
  kernelCheckLiveEmitBodySource,
  PARSE-LIVE-EMIT-BODY.
  Module: SystemsLean.SlakeTypecheckEmitBody
  Checkable writer: just slake-typecheck-emitbody
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitBody

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_BODY"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-BODY"

/-- Named just recipe. Not lake build SystemsLean.EmitBody. -/
def justRecipeSlakeTypecheckEmitBody : String :=
  "slake-typecheck-emitbody"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBodyRel : String :=
  SystemsLean.HostFrontLiveEmitBody.liveEmitBodyRel

/-- Ready names HostFrontLiveEmitBody parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitBodyReady,
    kernelCheckLiveEmitBodySource. -/
def slakeTypecheckEmitBodyReady : Bool :=
  SystemsLean.HostFrontLiveEmitBody.hostFrontLiveEmitBodyReady

/-- Honesty: this command is not lake build of EmitBody. -/
def slakeTypecheckEmitBodyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitBodyFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitBodyFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitBodyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitBody.lean.
    Ready is HostFrontLiveEmitBody.hostFrontLiveEmitBodyReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitBody.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitBody} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitBody.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitBodyRel}"
  unless (!slakeTypecheckEmitBodyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitBodyFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitBodyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitBody.main args
