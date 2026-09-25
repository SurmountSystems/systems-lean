/-
  SYSTEMS_LEAN_HOST partial -- live ProgramSubsetRebuildMain.lean.
  The thin forwarder HostFrontLiveProgramSubsetRebuildMain stays
  byte-for-byte and still calls the neighbor body. This module is the
  checker for the Main file. It does not retarget that neighbor.
  liveRel is ProgramSubsetRebuildMain.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveProgramSubsetRebuildMainSource,
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildMainSource
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource

namespace SystemsLean.HostFrontLiveProgramSubsetRebuildMainSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "ProgramSubsetRebuildMain.lean"

/-- Pinned live ProgramSubsetRebuildMain.lean bytes. -/
def liveProgramSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Program subset rebuild /
  self-application (SKELETON). Root for lake exe slake-program-subset-rebuild.
  Body lives in SystemsLean.ProgramSubsetRebuild (programSubsetRebuildReady /
  Program subset package re-emit). Greppable: SystemsLean.ProgramSubsetRebuildMain,
  slake-program-subset-rebuild, ProgramSubsetRebuildMain, PROGRAM-SUBSET-REBUILD,
  SLAKE_PROGRAM_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ProgramSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ProgramSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProgramSubsetRebuild.main args
"#

/-- Accepted parse of the Main file calls HostKernel.kernelCheck.
    Not a constant true. -/
def kernelCheckLiveProgramSubsetRebuildMainSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned Main text. -/
def hostFrontLiveProgramSubsetRebuildMainSourceReady : Bool :=
  liveRel == "ProgramSubsetRebuildMain.lean"
    && kernelCheckLiveProgramSubsetRebuildMainSource
      liveProgramSubsetRebuildMainSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProgramSubsetRebuildMainSource then
    throw (IO.userError "dual-pin mismatch ProgramSubsetRebuildMain.lean")
  let k := kernelCheckLiveProgramSubsetRebuildMainSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live ProgramSubsetRebuildMain parse false")
  unless hostFrontLiveProgramSubsetRebuildMainSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProgramSubsetRebuildMainSource
