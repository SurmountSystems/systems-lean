/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProgramSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-programsubsetrebuildmain.
  Ready is HostFrontLiveProgramSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live ProgramSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.ProgramSubsetRebuildMain.
  Not mill remill (just twenty-fifth-host-tool / inventory table row 37).
  Not occupancy name 50. Occupancy 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  This wrap parses ProgramSubsetRebuildMain.lean only. Do not wrap ProgramSubsetRebuild.lean.
  This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  Do not steal HostFrontLiveProgramMain. Not Linear. Not ComposeSubsetEmit. Not IrGraph.
  Unique needles (trailing newline so SlakeTypecheckProgramSubsetRebuildMain is not a prefix):
  SlakeTypecheckProgramSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-programsubsetrebuildmain
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  PROGRAM-SUBSET-REBUILD-MAIN
  HOST-PROGRAM-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-programsubsetrebuildmain,
  slakeTypecheckProgramSubsetRebuildMainReady,
  kernelCheckLiveProgramSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProgramSubsetRebuildMain
  Checkable writer: just slake-typecheck-programsubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProgramSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProgramSubsetRebuildMain. -/
def justRecipeSlakeTypecheckProgramSubsetRebuildMain : String :=
  "slake-typecheck-programsubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveProgramSubsetRebuildMain.liveProgramSubsetRebuildMainRel

/-- Ready names HostFrontLiveProgramSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProgramSubsetRebuildMainReady,
    kernelCheckLiveProgramSubsetRebuildMainSource. -/
def slakeTypecheckProgramSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveProgramSubsetRebuildMain.hostFrontLiveProgramSubsetRebuildMainReady

/-- Honesty: this command is not lake build of ProgramSubsetRebuildMain. -/
def slakeTypecheckProgramSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProgramSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProgramSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProgramSubsetRebuildMain.lean.
    Ready is HostFrontLiveProgramSubsetRebuildMain.hostFrontLiveProgramSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProgramSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProgramSubsetRebuildMain} =="
  IO.println s!"  host={hostId} file={liveProgramSubsetRebuildMainRel}"
  unless (!slakeTypecheckProgramSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProgramSubsetRebuildMain.main args
