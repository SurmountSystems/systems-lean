/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitCompose.
  Short role: named driver for lean --run of live EmitCompose.lean parse.
  Ready is HostFrontLiveEmitCompose parse plus HostKernel.kernelCheck of live
  EmitCompose.lean, not := true, not lake build SystemsLean.EmitCompose.
  Does not import SystemsLean.EmitCompose or SystemsLean.EmitComposeScaffold.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-COMPOSE,
  SLAKE_TYPECHECK_EMIT_COMPOSE_V0, slake-typecheck-emitcompose,
  slakeTypecheckEmitComposeReady, kernelCheckLiveEmitComposeSource,
  PARSE-LIVE-EMIT-COMPOSE, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitCompose
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveEmitCompose

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-COMPOSE"

/-- Named just recipe string. Dest just module is locked; not written here. -/
def justRecipeSlakeTypecheckEmitCompose : String :=
  "slake-typecheck-emitcompose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitComposeRel : String :=
  SystemsLean.HostFrontLiveEmitCompose.liveEmitComposeRel

/-- Ready names HostFrontLiveEmitCompose parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckEmitComposeReady,
    kernelCheckLiveEmitComposeSource. -/
def slakeTypecheckEmitComposeReady : Bool :=
  SystemsLean.HostFrontLiveEmitCompose.hostFrontLiveEmitComposeReady

/-- Honesty: this command is not lake build of EmitCompose. -/
def slakeTypecheckEmitComposeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitComposeFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitComposeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitCompose.lean.
    Ready is HostFrontLiveEmitCompose.hostFrontLiveEmitComposeReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitCompose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitCompose} =="
  IO.println s!"  host={hostId} file={liveEmitComposeRel}"
  unless (!slakeTypecheckEmitComposeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitComposeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitCompose.main args
