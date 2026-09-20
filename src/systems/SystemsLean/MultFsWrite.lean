/-
  SYSTEMS_LEAN_HOST partial -- mill-named body for lake exe slake-mult-fs-write.
  Pairs with SystemsLean.MultFsWriteMain. Write surface is MultFsDeepen
  (multFsWrite / multFsWritePathReady; freestandingDriverComplete true with
  Lean-native MultSubsetEmit dual evidence; P1 Path A host-cc C print retired).
  Not a kitchen-sink filename. Not an empty stub. Not freestanding Mult compiler.
  Greppable: SystemsLean.MultFsWrite, slake-mult-fs-write, MULT-FS-WRITE,
  SLAKE_MULT_FS_WRITE, SLAKE_MULT_FS_WRITE_V0, HOST-MULT-FS-WRITE,
  MULT-FS-DEEPEN, SYSTEMS_LEAN_HOST, UNIT_SURFACE, MULT-0.
  Module: SystemsLean.MultFsWrite
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsDeepen

namespace SystemsLean.MultFsWrite

/-- Greppable primary stage id (mill-named Mult package write body). -/
def stageId : String := "SLAKE_MULT_FS_WRITE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-FS-WRITE"

/-- Short surface name (product role). -/
def surfaceId : String := "MULT-FS-WRITE"

/-- Lake exe for host Mult package write (bootstrap helper).
    Greppable: lakeExeFsWrite, slake-mult-fs-write, MULT-FS-WRITE. -/
def lakeExeFsWrite : String := SystemsLean.MultFsDeepen.lakeExeFsWrite

/-- Write path ready (MultSubsetEmit SSOT). Greppable: multFsWritePathReady. -/
def multFsWritePathReady : Bool := SystemsLean.MultFsDeepen.multFsWritePathReady

/-- Host MultSubsetEmit freestanding Mult SSOT write under repo root.
    Greppable: multFsWrite, MULT-FS-WRITE, IO.FS.writeFile. -/
def multFsWrite (root : System.FilePath) : IO Unit :=
  SystemsLean.MultFsDeepen.multFsWrite root

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsDeepen.main args

end SystemsLean.MultFsWrite
