/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Lean-native Mult package
  write (P1). Root for lake exe slake-mult-fs-write-tool. Body lives in
  SystemsLean.MultFsWriteTool (multFsWriteToolEmit / MultSubsetEmit
  IO.FS.writeFile). Does not print full host-cc C tool bodies. Measured Mult
  package write: just mult-subset-freestanding-write.
  Greppable: SystemsLean.MultFsWriteToolMain, slake-mult-fs-write-tool,
  MultFsWriteToolMain, MULT-FS-WRITE-TOOL, MULT-FS-WRITE, SYSTEMS_LEAN_HOST,
  SKELETON.
  Module: SystemsLean.MultFsWriteToolMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsWriteTool

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsWriteTool.main args
