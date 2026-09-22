/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProgramSubsetEmitMain.
  Short role: named driver for just slake-typecheck-programsubsetemitmain.
  Ready is HostFrontLiveProgramSubsetEmitMain parse plus HostKernel.kernelCheck
  of live ProgramSubsetEmitMain.lean, not := true, not lake build
  SystemsLean.ProgramSubsetEmitMain.
  Not mill 36 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  This wrap is not ExtractSubsetEmitMain. Do not steal HostFrontLiveProgramMain.
  Do not steal HostFrontLiveProgramForeignLink.
  Unique needles (trailing newline so SlakeTypecheckProgramSubsetEmitMain is not a prefix):
  SlakeTypecheckProgramSubsetEmitMain
  HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-EMIT-MAIN
  SLAKE_TYPECHECK_PROGRAM_SUBSET_EMIT_MAIN_V0
  slake-typecheck-programsubsetemitmain
  PARSE-LIVE-PROGRAM-SUBSET-EMIT-MAIN
  PROGRAM-SUBSET-EMIT-MAIN
  HOST-PROGRAM-SUBSET-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-programsubsetemitmain,
  slakeTypecheckProgramSubsetEmitMainReady,
  kernelCheckLiveProgramSubsetEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProgramSubsetEmitMain
  Checkable writer: just slake-typecheck-programsubsetemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProgramSubsetEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROGRAM_SUBSET_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProgramSubsetEmitMain. -/
def justRecipeSlakeTypecheckProgramSubsetEmitMain : String :=
  "slake-typecheck-programsubsetemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramSubsetEmitMainRel : String :=
  SystemsLean.HostFrontLiveProgramSubsetEmitMain.liveProgramSubsetEmitMainRel

/-- Ready names HostFrontLiveProgramSubsetEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProgramSubsetEmitMainReady,
    kernelCheckLiveProgramSubsetEmitMainSource. -/
def slakeTypecheckProgramSubsetEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveProgramSubsetEmitMain.hostFrontLiveProgramSubsetEmitMainReady

/-- Honesty: this command is not lake build of ProgramSubsetEmitMain. -/
def slakeTypecheckProgramSubsetEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProgramSubsetEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProgramSubsetEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProgramSubsetEmitMain.lean.
    Ready is HostFrontLiveProgramSubsetEmitMain.hostFrontLiveProgramSubsetEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProgramSubsetEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProgramSubsetEmitMain} =="
  IO.println s!"  host={hostId} file={liveProgramSubsetEmitMainRel}"
  unless (!slakeTypecheckProgramSubsetEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProgramSubsetEmitMain.main args
