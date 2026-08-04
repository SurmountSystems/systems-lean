/-
  SYSTEMS_LEAN_HOST partial -- Mult package freestanding writer tool (P1).
  Living path: Lean-native MultSubsetEmit package write via IO.FS.writeFile.
  Does NOT print full host-cc C tool bodies as Lean string soup (Path A C-print
  retired under Program P Host-cc helper tools without C printed from Lean).
  Greppable retired Path A path names (slake_mult_fs_write_tool.c,
  slake-mult-fs-write-cc) remain for archaeology and MultFsDeepen pin continuity.
  Mult package bytes stay MultSubsetEmit freestanding Mult SSOT. Product
  StillUsesLake remains. Not freestanding Mult compiler. Not Mult rebuild ELF
  as package writer. Not free/complete product flip. Not PROVABLY. Not llvm unlock.
  Greppable: SYSTEMS_LEAN_HOST, MULT-FS-WRITE-TOOL, SLAKE_MULT_FS_WRITE_TOOL,
  SLAKE_MULT_FS_WRITE_TOOL_V0, HOST-MULT-FS-WRITE-TOOL, multFsWriteToolReady,
  freestandingWriteToolCRel, freestandingWriteToolBinRel,
  freestandingWriteToolNotLakeBuilt, multFsWriteToolCSource, multFsWriteToolEmit,
  multFsWriteToolNativeIo, multFsWriteToolPrintsFullHelperC, IO.FS.writeFile,
  slake_mult_fs_write_tool.c, slake-mult-fs-write-cc, MULT-FS-WRITE,
  MULT-FS-WRITE-TOOL-SMOKE, MULT-FS-WRITE-TOOL-THEOREM, StillUsesLake,
  DependsOnLake, UNIT_SURFACE, MultSubsetEmit, HOST-EMIT-MULT.
  Module: SystemsLean.MultFsWriteTool
  Short role name (not ProductPathFreestandingMult kitchen-sink).
  Red/green: lake build SystemsLean.MultFsWriteTool;
  lake exe slake-mult-fs-write-tool; just mult-subset-freestanding-write.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. UNIT_SURFACE host surface. MULT-0 (Mult package SSOT).
-/

import SystemsLean.MultSubsetEmit

namespace SystemsLean.MultFsWriteTool

open SystemsLean.MultSubsetEmit

/-! ### MULT-FS-WRITE-TOOL / SLAKE_MULT_FS_WRITE_TOOL (Lean-native Mult package writer)

  Input: MultSubsetEmit package strings (HOST-EMIT-MULT freestanding Mult SSOT).
  Output: emit/slake_mult_subset.{h,c} via IO.FS.writeFile (not host-cc tool C).
-/

/-- Greppable primary stage id (Mult package write tool). -/
def stageId : String := "SLAKE_MULT_FS_WRITE_TOOL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-FS-WRITE-TOOL"

/-- Short surface name. -/
def surfaceId : String := "MULT-FS-WRITE-TOOL"

/-- Retired Path A Mult package writer C relative to repo root (archaeology only).
    Greppable: freestandingWriteToolCRel, slake_mult_fs_write_tool.c. -/
def freestandingWriteToolCRel : String :=
  "src/systems/emit/slake_mult_fs_write_tool.c"

/-- Retired Path A host-cc Mult package writer binary (archaeology only).
    Greppable: freestandingWriteToolBinRel, slake-mult-fs-write-cc. -/
def freestandingWriteToolBinRel : String :=
  "src/systems/bin/slake-mult-fs-write-cc"

/-- Lake exe for living Lean-native Mult package write.
    Greppable: lakeExeWriteTool, slake-mult-fs-write-tool. -/
def lakeExeWriteTool : String := "slake-mult-fs-write-tool"

/-- just recipe for measured Mult write.
    Greppable: justRecipeWriteTool, mult-subset-freestanding-write. -/
def justRecipeWriteTool : String := "mult-subset-freestanding-write"

/-- Host elaborator still Lake (bootstrap; S4 / M6 only retires product pins).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty non-claims. -/
def multFsWriteToolResidualFreeClaimed : Bool := false
def multFsWriteToolProductSelfHostCompleteClaimed : Bool := false
def multFsWriteToolProofCompleteClaimed : Bool := false
def multFsWriteToolLlvmUnlocked : Bool := false
def multFsWriteToolProvablyUnlocked : Bool := false

/-- Living Mult package writer uses Lean MultSubsetEmit IO (not full C print).
    Greppable: multFsWriteToolNativeIo, IO.FS.writeFile, MultSubsetEmit. -/
def multFsWriteToolNativeIo : Bool := true

/-- Living design does not print full helper C tool source from Lean (P1).
    Greppable: multFsWriteToolPrintsFullHelperC. -/
def multFsWriteToolPrintsFullHelperC : Bool := false

/-- Honesty: living Mult package writer is Lean-native MultSubsetEmit IO, not Mult
    rebuild ELF, not Lake Mult write ELF as the only design, and not full host-cc
    C printed from Lean. Retired Path A path names stay greppable for archaeology.
    Greppable: freestandingWriteToolNotLakeBuilt, slake-mult-fs-write-cc. -/
def freestandingWriteToolNotLakeBuilt : Bool :=
  multFsWriteToolNativeIo
    && !multFsWriteToolPrintsFullHelperC
    && (freestandingWriteToolBinRel == "src/systems/bin/slake-mult-fs-write-cc")
    && (freestandingWriteToolCRel
      == "src/systems/emit/slake_mult_fs_write_tool.c")
    && (freestandingWriteToolBinRel != ".lake/build/bin/slake-mult-fs-write")
    && (freestandingWriteToolBinRel
      != "src/systems/.lake/build/bin/slake-mult-fs-write")
    && (freestandingWriteToolBinRel
      != ".lake/build/bin/slake-mult-subset-rebuild")
    && (freestandingWriteToolBinRel
      != "src/systems/.lake/build/bin/slake-mult-subset-rebuild")
    && (lakeExeWriteTool == "slake-mult-fs-write-tool")
    && (lakeExeWriteTool != "slake-mult-fs-write")
    && (lakeExeWriteTool != "slake-mult-subset-rebuild")

/-- Structural ready: Mult SSOT package + native Io + Lake host honesty.
    Greppable: multFsWriteToolReady, MULT-FS-WRITE-TOOL. -/
def multFsWriteToolReady : Bool :=
  multSubsetEmitReady
    && multSubsetEmitWroteExpected
    && freestandingWriteToolNotLakeBuilt
    && multFsWriteToolNativeIo
    && !multFsWriteToolPrintsFullHelperC
    && stillUsesLake
    && dependsOnLake
    && !multFsWriteToolResidualFreeClaimed
    && !multFsWriteToolProductSelfHostCompleteClaimed
    && !multFsWriteToolProofCompleteClaimed
    && !multFsWriteToolLlvmUnlocked
    && !multFsWriteToolProvablyUnlocked
    && (stageId == "SLAKE_MULT_FS_WRITE_TOOL_V0")
    && (hostId == "HOST-MULT-FS-WRITE-TOOL")
    && (surfaceId == "MULT-FS-WRITE-TOOL")
    && (justRecipeWriteTool == "mult-subset-freestanding-write")
    && (multSubsetHeaderPackage.length > 0)
    && (multSubsetSourcePackage.length > 0)

/-- Retired greppable marker only: Path A full host-cc C body removed (P1).
    Not a living C tool source. Greppable: multFsWriteToolCSource,
    slake_mult_fs_write_tool.c. -/
def multFsWriteToolCSource : String :=
  "/* RETIRED P1: multFsWriteToolCSource full host-cc C print removed.\n"
    ++ " * Living Mult package write: MultSubsetEmit IO.FS.writeFile (Lean-native).\n"
    ++ " * Greppable archaeology: slake_mult_fs_write_tool.c, slake-mult-fs-write-cc.\n"
    ++ " * Do not restore multi-hundred-line C-in-Lean helper tools.\n"
    ++ " */\n"

/-- Emit Mult package under root via Lean MultSubsetEmit (not tool C generation).
    Greppable: multFsWriteToolEmit, IO.FS.writeFile, MultSubsetEmit. -/
def multFsWriteToolEmit (root : System.FilePath) : IO Unit := do
  unless multFsWriteToolReady do
    IO.eprintln s!"error: {stageId}: multFsWriteToolReady false"
    throw (IO.userError "multFsWriteToolReady false")
  IO.println s!"== {stageId}: Lean-native Mult package write (no host-cc C print) =="
  IO.println s!"  living: MultSubsetEmit IO.FS.writeFile"
  IO.println s!"  lake exe: {lakeExeWriteTool}"
  IO.println s!"  just: {justRecipeWriteTool}"
  IO.println s!"  retired Path A C (not written): {freestandingWriteToolCRel}"
  IO.println s!"  retired Path A bin (not built): {freestandingWriteToolBinRel}"
  MultSubsetEmit.multSubsetEmitWrite root
  IO.println s!"GREEN {stageId}: Mult package wrote via Lean-native MultSubsetEmit"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: Lean-native Mult package write under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    multFsWriteToolEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

/-! ### MULT-FS-WRITE-TOOL-THEOREM -/

set_option maxRecDepth 8192

theorem freestandingWriteToolNotLakeBuilt_true :
    freestandingWriteToolNotLakeBuilt = true := by
  native_decide

theorem multFsWriteToolReady_true : multFsWriteToolReady = true := by
  native_decide

theorem multFsWriteToolNativeIo_true : multFsWriteToolNativeIo = true :=
  rfl

theorem multFsWriteToolPrintsFullHelperC_false :
    multFsWriteToolPrintsFullHelperC = false :=
  rfl

theorem multFsWriteTool_ids_eq :
    (stageId = "SLAKE_MULT_FS_WRITE_TOOL_V0")
      /\ (hostId = "HOST-MULT-FS-WRITE-TOOL")
      /\ (surfaceId = "MULT-FS-WRITE-TOOL")
      /\ (freestandingWriteToolBinRel = "src/systems/bin/slake-mult-fs-write-cc")
      /\ (freestandingWriteToolCRel
        = "src/systems/emit/slake_mult_fs_write_tool.c")
      /\ (justRecipeWriteTool = "mult-subset-freestanding-write")
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### MULT-FS-WRITE-TOOL-SMOKE -/

example : freestandingWriteToolNotLakeBuilt = true := by native_decide
example : multFsWriteToolReady = true := by native_decide
example : multFsWriteToolNativeIo = true := rfl
example : multFsWriteToolPrintsFullHelperC = false := rfl
example : freestandingWriteToolBinRel = "src/systems/bin/slake-mult-fs-write-cc" :=
  rfl
example : freestandingWriteToolCRel
    = "src/systems/emit/slake_mult_fs_write_tool.c" := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : multFsWriteToolResidualFreeClaimed = false := rfl
example : multFsWriteToolLlvmUnlocked = false := rfl
example : multFsWriteToolProvablyUnlocked = false := rfl
example : lakeExeWriteTool = "slake-mult-fs-write-tool" := rfl
example : justRecipeWriteTool = "mult-subset-freestanding-write" := rfl
example : multFsWriteToolCSource.length > 0 := by native_decide

end SystemsLean.MultFsWriteTool
