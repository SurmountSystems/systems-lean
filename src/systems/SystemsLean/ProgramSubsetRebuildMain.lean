/-
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
