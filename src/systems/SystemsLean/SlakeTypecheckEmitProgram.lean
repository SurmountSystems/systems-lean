/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitProgram.
  Short role: named driver for just slake-typecheck-emitprogram.
  Ready is HostFrontLiveEmitProgram parse plus HostKernel.kernelCheck
  of live EmitProgram.lean, not := true, not lake build
  SystemsLean.EmitProgram.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  SlakeTypecheckEmitProgram
  HOST-SLAKE-TYPECHECK-EMIT-PROGRAM
  SLAKE_TYPECHECK_EMIT_PROGRAM_V0
  PARSE-LIVE-EMIT-PROGRAM
  src/systems/SystemsLean/EmitProgram.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitprogram,
  slakeTypecheckEmitProgramReady,
  kernelCheckLiveEmitProgramSource.
  Module: SystemsLean.SlakeTypecheckEmitProgram
  Checkable writer: just slake-typecheck-emitprogram
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitProgram

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_PROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-PROGRAM"

/-- Named just recipe. Not lake build SystemsLean.EmitProgram. -/
def justRecipeSlakeTypecheckEmitProgram : String := "slake-typecheck-emitprogram"

/-- Live file basename. Exact. Not EmitProgramScaffold.lean. -/
def liveRel : String := SystemsLean.HostFrontLiveEmitProgram.liveRel

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitProgramRel : String :=
  SystemsLean.HostFrontLiveEmitProgram.liveEmitProgramRel

/-- Ready names HostFrontLiveEmitProgram parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckEmitProgramReady,
    kernelCheckLiveEmitProgramSource. -/
def slakeTypecheckEmitProgramReady : Bool :=
  SystemsLean.HostFrontLiveEmitProgram.hostFrontLiveEmitProgramReady

/-- Honesty: this command is not lake build of EmitProgram. -/
def slakeTypecheckEmitProgramDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitProgramFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitProgramOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitProgram.lean.
    Ready is HostFrontLiveEmitProgram.hostFrontLiveEmitProgramReady
    (parse plus kernelCheck), not := true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitProgram} =="
  IO.println s!"  host={hostId} file={liveEmitProgramRel} liveRel={liveRel}"
  unless (liveRel == "EmitProgram.lean") do
    IO.eprintln "error: liveRel must be EmitProgram.lean"
    return 1
  unless (liveEmitProgramRel == "src/systems/SystemsLean/EmitProgram.lean") do
    IO.eprintln "error: live path must be src/systems/SystemsLean/EmitProgram.lean"
    return 1
  unless (!slakeTypecheckEmitProgramFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitProgramOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitProgramDoesNotUseLake do
    IO.eprintln "error: doesNotUseLake must stay true"
    return 1
  unless slakeTypecheckEmitProgramReady do
    IO.eprintln "error: slakeTypecheckEmitProgramReady false"
    return 1
  SystemsLean.HostFrontLiveEmitProgram.main args
