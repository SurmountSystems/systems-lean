/-
  SYSTEMS_LEAN_HOST partial -- Path A freestanding Mult package writer tool.
  Lean-generated host-cc Mult package writer (not Lake-built Mult write ELF).
  Mult package bytes stay MultSubsetEmit freestanding Mult SSOT. This module
  renders a small C writer that embeds those bytes and writes
  emit/slake_mult_subset.{h,c}. Bootstrap may lake-build this generator once;
  measured Mult re-emit runs only the host-cc binary under src/systems/bin/
  (outside .lake/build/bin). Not S4 / M6. Product StillUsesLake remains.
  Not freestanding Mult compiler. Not Mult rebuild ELF as package writer.
  Not free/complete product flip. Not PROVABLY. Not llvm unlock.
  Greppable: SYSTEMS_LEAN_HOST, MULT-FS-WRITE-TOOL, SLAKE_MULT_FS_WRITE_TOOL,
  SLAKE_MULT_FS_WRITE_TOOL_V0, HOST-MULT-FS-WRITE-TOOL, multFsWriteToolReady,
  freestandingWriteToolCRel, freestandingWriteToolBinRel,
  freestandingWriteToolNotLakeBuilt, multFsWriteToolCSource, multFsWriteToolEmit,
  slake_mult_fs_write_tool.c, slake-mult-fs-write-cc, MULT-FS-WRITE,
  MULT-FS-WRITE-TOOL-SMOKE, MULT-FS-WRITE-TOOL-THEOREM, StillUsesLake,
  DependsOnLake, UNIT_SURFACE, MultSubsetEmit, HOST-EMIT-MULT.
  Module: SystemsLean.MultFsWriteTool
  Short role name (not ProductPathFreestandingMult kitchen-sink).
  Red/green: lake build SystemsLean.MultFsWriteTool;
  lake exe slake-mult-fs-write-tool; cc src/systems/bin/slake-mult-fs-write-cc.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. UNIT_SURFACE host surface. MULT-0 (Mult package SSOT).
-/

import SystemsLean.MultSubsetEmit

namespace SystemsLean.MultFsWriteTool

open SystemsLean.MultSubsetEmit

/-! ### MULT-FS-WRITE-TOOL / SLAKE_MULT_FS_WRITE_TOOL (Path A Mult package writer)

  Input: MultSubsetEmit package strings (HOST-EMIT-MULT freestanding Mult SSOT).
  Output: generated C tool source under emit/ + host-cc bin under bin/.
-/

/-- Greppable primary stage id (Path A freestanding Mult write tool). -/
def stageId : String := "SLAKE_MULT_FS_WRITE_TOOL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-FS-WRITE-TOOL"

/-- Short surface name. -/
def surfaceId : String := "MULT-FS-WRITE-TOOL"

/-- Generated Mult package writer C relative to repo root.
    Greppable: freestandingWriteToolCRel, slake_mult_fs_write_tool.c. -/
def freestandingWriteToolCRel : String :=
  "src/systems/emit/slake_mult_fs_write_tool.c"

/-- Host-cc Mult package writer binary relative to repo root (not under .lake).
    Greppable: freestandingWriteToolBinRel, slake-mult-fs-write-cc. -/
def freestandingWriteToolBinRel : String :=
  "src/systems/bin/slake-mult-fs-write-cc"

/-- Lake exe that regenerates tool C (bootstrap only; not measured Mult write).
    Greppable: lakeExeWriteTool, slake-mult-fs-write-tool. -/
def lakeExeWriteTool : String := "slake-mult-fs-write-tool"

/-- just recipe for measured Mult write after Path A (same greppable measure name).
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

/-- Writer bin path is not a Lake-built Mult write ELF path.
    Greppable: freestandingWriteToolNotLakeBuilt, slake-mult-fs-write-cc. -/
def freestandingWriteToolNotLakeBuilt : Bool :=
  (freestandingWriteToolBinRel == "src/systems/bin/slake-mult-fs-write-cc")
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

/-- Structural ready: Mult SSOT package + non-Lake tool path pins + Lake host.
    Greppable: multFsWriteToolReady, MULT-FS-WRITE-TOOL. -/
def multFsWriteToolReady : Bool :=
  multSubsetEmitReady
    && multSubsetEmitWroteExpected
    && freestandingWriteToolNotLakeBuilt
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

/-- Hex digit for low nibble 0..15. -/
private def hexDigit (n : Nat) : Char :=
  if n < 10 then Char.ofNat (48 + n) -- '0'
  else Char.ofNat (97 + (n - 10)) -- 'a'

/-- One byte as 0xNN. -/
private def byteHex (b : UInt8) : String :=
  let n := b.toNat
  let hi := n / 16
  let lo := n % 16
  "0x" ++ String.ofList [hexDigit hi, hexDigit lo]

/-- Format ByteArray as C initializer list (comma-separated 0xNN). -/
private partial def formatCByteList (ba : ByteArray) : String :=
  let rec go (i : Nat) (acc : String) : String :=
    if i < ba.size then
      let sep :=
        if i == 0 then "\n  "
        else if i % 12 == 0 then ",\n  "
        else ", "
      go (i + 1) (acc ++ sep ++ byteHex (ba[i]!))
    else
      acc
  go 0 ""

/-- One C static unsigned char array definition. -/
private def cByteArrayDef (name : String) (s : String) : String :=
  let ba := s.toUTF8
  "static const unsigned char " ++ name ++ "[] = {"
    ++ formatCByteList ba ++ "\n};\n"
    ++ "static const size_t " ++ name ++ "_len = "
    ++ toString ba.size ++ ";\n\n"

/-- Full Mult package writer C tool source (host stdio; Mult package freestanding).
    Greppable: multFsWriteToolCSource, slake_mult_fs_write_tool.c. -/
def multFsWriteToolCSource : String :=
  "/* MULT-FS-WRITE-TOOL / SLAKE_MULT_FS_WRITE_TOOL_V0\n"
    ++ " * Lean-generated Mult package writer (Path A Name B full).\n"
    ++ " * Mult package bytes: MultSubsetEmit freestanding Mult SSOT.\n"
    ++ " * Do not hand-edit Mult package features here; regenerate from Lean.\n"
    ++ " * Host-cc tool (stdio); not Lake AOT ELF; not Mult rebuild ELF.\n"
    ++ " * Measured bin: src/systems/bin/slake-mult-fs-write-cc (outside .lake).\n"
    ++ " * Product StillUsesLake / DependsOnLake remain until S4 / M6.\n"
    ++ " * RUNTIME-FS Mult unit package only; no product GC.\n"
    ++ " */\n"
    ++ "#include <errno.h>\n"
    ++ "#include <stdio.h>\n"
    ++ "#include <stdlib.h>\n"
    ++ "#include <string.h>\n"
    ++ "#include <sys/stat.h>\n"
    ++ "\n"
    ++ cByteArrayDef "mult_header_bytes" multSubsetHeaderPackage
    ++ cByteArrayDef "mult_source_bytes" multSubsetSourcePackage
    ++ "static int ensure_dir(const char *path)\n"
    ++ "{\n"
    ++ "  struct stat st;\n"
    ++ "  if (stat(path, &st) == 0) {\n"
    ++ "    if (S_ISDIR(st.st_mode)) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "    fprintf(stderr, \"error: not a directory: %s\\n\", path);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (mkdir(path, 0755) != 0 && errno != EEXIST) {\n"
    ++ "    fprintf(stderr, \"error: mkdir %s: %s\\n\", path, strerror(errno));\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int ensure_emit_dir(const char *root)\n"
    ++ "{\n"
    ++ "  char p[4096];\n"
    ++ "  if ((size_t)snprintf(p, sizeof p, \"%s/src\", root) >= sizeof p) {\n"
    ++ "    fprintf(stderr, \"error: path too long (src)\\n\");\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (ensure_dir(p) != 0) return -1;\n"
    ++ "  if ((size_t)snprintf(p, sizeof p, \"%s/src/systems\", root) >= sizeof p) {\n"
    ++ "    fprintf(stderr, \"error: path too long (systems)\\n\");\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (ensure_dir(p) != 0) return -1;\n"
    ++ "  if ((size_t)snprintf(p, sizeof p, \"%s/src/systems/emit\", root) >= sizeof p) {\n"
    ++ "    fprintf(stderr, \"error: path too long (emit)\\n\");\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return ensure_dir(p);\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int write_bytes(const char *path, const unsigned char *data, size_t n)\n"
    ++ "{\n"
    ++ "  FILE *f = fopen(path, \"wb\");\n"
    ++ "  size_t w;\n"
    ++ "  if (!f) {\n"
    ++ "    fprintf(stderr, \"error: open %s: %s\\n\", path, strerror(errno));\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  w = fwrite(data, 1, n, f);\n"
    ++ "  if (w != n) {\n"
    ++ "    fprintf(stderr, \"error: short write %s (%zu of %zu)\\n\", path, w, n);\n"
    ++ "    fclose(f);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (fclose(f) != 0) {\n"
    ++ "    fprintf(stderr, \"error: close %s: %s\\n\", path, strerror(errno));\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int main(int argc, char **argv)\n"
    ++ "{\n"
    ++ "  const char *root = (argc > 1 && argv[1] && argv[1][0]) ? argv[1] : \".\";\n"
    ++ "  char path_h[4096];\n"
    ++ "  char path_c[4096];\n"
    ++ "  printf(\"== SLAKE_MULT_FS_WRITE_TOOL_V0: freestanding Mult package write (host-cc)\\n\");\n"
    ++ "  printf(\"  host: HOST-MULT-FS-WRITE-TOOL / surface: MULT-FS-WRITE-TOOL\\n\");\n"
    ++ "  printf(\"  package: MultSubsetEmit freestanding Mult SSOT (embedded)\\n\");\n"
    ++ "  printf(\"  honest: not Lake-built Mult write ELF; not Mult rebuild ELF\\n\");\n"
    ++ "  printf(\"  honest: product StillUsesLake remains until S4 / M6\\n\");\n"
    ++ "  if (ensure_emit_dir(root) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_h, sizeof path_h,\n"
    ++ "        \"%s/src/systems/emit/slake_mult_subset.h\", root) >= sizeof path_h) {\n"
    ++ "    fprintf(stderr, \"error: header path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_c, sizeof path_c,\n"
    ++ "        \"%s/src/systems/emit/slake_mult_subset.c\", root) >= sizeof path_c) {\n"
    ++ "    fprintf(stderr, \"error: source path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_h, mult_header_bytes, mult_header_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_c, mult_source_bytes, mult_source_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  printf(\"GREEN SLAKE_MULT_FS_WRITE_TOOL_V0: wrote Mult package under emit/\\n\");\n"
    ++ "  printf(\"  wrote: %s (%zu bytes)\\n\", path_h, (size_t)mult_header_bytes_len);\n"
    ++ "  printf(\"  wrote: %s (%zu bytes)\\n\", path_c, (size_t)mult_source_bytes_len);\n"
    ++ "  printf(\"  greppable: MULT-FS-WRITE-TOOL, MULT-SUBSET-EMIT, HOST-EMIT-MULT\\n\");\n"
    ++ "  return 0;\n"
    ++ "}\n"

/-- Emit Mult package writer C under root. Greppable: multFsWriteToolEmit. -/
def multFsWriteToolEmit (root : System.FilePath) : IO Unit := do
  unless multFsWriteToolReady do
    IO.eprintln s!"error: {stageId}: multFsWriteToolReady false"
    throw (IO.userError "multFsWriteToolReady false")
  let out := root / "src" / "systems" / "emit" / "slake_mult_fs_write_tool.c"
  let emitDir := root / "src" / "systems" / "emit"
  IO.println s!"== {stageId}: emit freestanding Mult package writer C (bootstrap) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  out: {out}"
  IO.println s!"  measured bin (host-cc later): {freestandingWriteToolBinRel}"
  IO.println s!"  honest: not Lake Mult write ELF on measure; product Lake remains"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile out multFsWriteToolCSource
  let written <- IO.FS.readFile out
  if written != multFsWriteToolCSource then
    IO.eprintln "error: tool C write mismatch"
    throw (IO.userError "tool C mismatch")
  unless (<- out.pathExists) do
    IO.eprintln s!"error: missing tool C after write: {out}"
    throw (IO.userError "missing tool C")
  IO.println s!"GREEN {stageId}: wrote {out} ({written.length} chars)"
  IO.println "  greppable: MULT-FS-WRITE-TOOL, slake_mult_fs_write_tool.c, freestandingWriteToolNotLakeBuilt"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: emit Mult package writer C under repo root (default .). Fail-closed. -/
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
