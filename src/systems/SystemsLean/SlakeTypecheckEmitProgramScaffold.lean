/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitProgramScaffold.
  Short role: named driver for just slake-typecheck-emitprogramscaffold.
  Ready is HostFrontLiveEmitProgramScaffold parse plus HostKernel.kernelCheck
  of live EmitProgramScaffold.lean, not := true, not lake build
  SystemsLean.EmitProgramScaffold.
  liveRel is EmitProgramScaffold.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so EmitProgram wrap is not a prefix):
  SlakeTypecheckEmitProgramScaffold
  HOST-SLAKE-TYPECHECK-EMIT-PROGRAM-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_PROGRAM_SCAFFOLD_V0
  PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitprogramscaffold,
  slakeTypecheckEmitProgramScaffoldReady,
  kernelCheckLiveEmitProgramScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitProgramScaffold
  Checkable writer: just slake-typecheck-emitprogramscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitProgramScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_PROGRAM_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-PROGRAM-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitProgramScaffold. -/
def justRecipeSlakeTypecheckEmitProgramScaffold : String :=
  "slake-typecheck-emitprogramscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitProgramScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitProgramScaffold.liveEmitProgramScaffoldRel

/-- Ready names HostFrontLiveEmitProgramScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitProgramScaffoldReady,
    kernelCheckLiveEmitProgramScaffoldSource. -/
def slakeTypecheckEmitProgramScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitProgramScaffold.hostFrontLiveEmitProgramScaffoldReady

/-- Honesty: this command is not lake build of EmitProgramScaffold. -/
def slakeTypecheckEmitProgramScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitProgramScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitProgramScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitProgramScaffold.lean.
    Ready is HostFrontLiveEmitProgramScaffold.hostFrontLiveEmitProgramScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitProgramScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitProgramScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitProgramScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitProgramScaffoldRel}"
  unless (!slakeTypecheckEmitProgramScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitProgramScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitProgramScaffold.main args
