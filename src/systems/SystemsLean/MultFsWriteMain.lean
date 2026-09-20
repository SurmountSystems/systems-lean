/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for host MultSubsetEmit
  freestanding Mult SSOT package write. Root for lake exe slake-mult-fs-write
  (bootstrap / measured Mult package write helper). Body lives in
  SystemsLean.MultFsWrite (forwards MultFsDeepen multFsWrite /
  multFsWritePathReady; freestandingDriverComplete true with Lean-native
  MultSubsetEmit dual evidence; P1 Path A host-cc C print retired).
  Not freestanding Mult compiler.
  Greppable: SystemsLean.MultFsWriteMain, slake-mult-fs-write,
  MultFsWriteMain, MULT-FS-WRITE, MULT-FS-DEEPEN, SLAKE_MULT_FS_DEEPEN,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultFsWriteMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsWrite

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsWrite.main args
