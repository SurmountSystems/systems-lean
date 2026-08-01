/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for host MultSubsetEmit
  freestanding Mult SSOT package write. Root for lake exe slake-mult-fs-write
  (bootstrap helper). Measured Mult write after Name B full is host-cc Path A
  tool (slake-mult-fs-write-cc). Body lives in SystemsLean.MultFsDeepen
  (multFsWrite / multFsWritePathReady; freestandingDriverComplete true with
  Path A dual evidence). Not freestanding Mult compiler.
  Greppable: SystemsLean.MultFsWriteMain, slake-mult-fs-write,
  MultFsWriteMain, MULT-FS-WRITE, MULT-FS-DEEPEN, SLAKE_MULT_FS_DEEPEN,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultFsWriteMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsDeepen

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsDeepen.main args
