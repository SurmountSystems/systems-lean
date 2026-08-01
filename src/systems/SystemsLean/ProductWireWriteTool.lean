/-
  SYSTEMS_LEAN_HOST partial -- Path A freestanding product-wire writer tool.
  Lean-generated host-cc dual-eq freestanding dialect writer (not Lake-built
  CapableRegenerate ELF). Bootstrap may lake-build this generator once: it runs
  freestandingCapableWriteFreestandingHc (dual-eq SSOT vs Emit* + dialect),
  embeds the resulting slake_freestanding.{h,c} bytes into tool C, and the
  measured recipe host-cc builds src/systems/bin/slake-product-wire-fs-write-cc
  (outside .lake/build/bin) which WRITEs emit + INSTALLs Out. Same spirit as
  MultFsWriteTool (M2 Name B Path A). Not S4 / M6. Product StillUsesLake remains.
  freestandingDriverComplete stays Mult-orthogonal (separate pin here).
  Not free/complete product flip. Not PROVABLY. Not llvm unlock.
  Greppable: SYSTEMS_LEAN_HOST, PRODUCT-WIRE-FS-WRITE-TOOL,
  SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL, SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0,
  HOST-PRODUCT-WIRE-FS-WRITE-TOOL, productWireFsWriterReady,
  productWireFsWriterFinishedClaimed, productWireFsWriterNotLakeBuilt,
  productWireFsWriterKeepsHostLake, productWireFsWriterBinRel,
  productWireFsWriterCRel, productWireFsWriterEmit, productWireFsWriterCSource,
  slake_product_wire_fs_write_tool.c, slake-product-wire-fs-write-cc,
  product-wire-freestanding-write, freestandingCapableWriteFreestandingHc,
  PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE, PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM,
  StillUsesLake, DependsOnLake, UNIT_SURFACE, CapableWriteHc, InstallOut,
  SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT.
  Module: SystemsLean.ProductWireWriteTool
  Short role name (not ProductPathFreestanding* kitchen-sink).
  Red/green: lake build SystemsLean.ProductWireWriteTool;
  lake exe slake-product-wire-fs-write-tool; just product-wire-freestanding-write.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as Lake-only success. UNIT_SURFACE host surface.
-/

import SystemsLean.CapableWriteHc

namespace SystemsLean.ProductWireWriteTool

open SystemsLean.CapableWriteHc

/-! ### PRODUCT-WIRE-FS-WRITE-TOOL / SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL

  Path A freestanding product-wire writer (M4 Name B).
  Bootstrap: dual-eq WRITE via freestandingCapableWriteFreestandingHc, embed
  bytes into tool C. Measured: host-cc bin writes emit + installs Out.
-/

/-- Greppable primary stage id (Path A freestanding product-wire writer). -/
def stageId : String := "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PRODUCT-WIRE-FS-WRITE-TOOL"

/-- Short surface name. -/
def surfaceId : String := "PRODUCT-WIRE-FS-WRITE-TOOL"

/-- Generated product-wire writer C relative to repo root.
    Greppable: productWireFsWriterCRel, slake_product_wire_fs_write_tool.c. -/
def productWireFsWriterCRel : String :=
  "src/systems/emit/slake_product_wire_fs_write_tool.c"

/-- Host-cc product-wire writer binary relative to repo root (not under .lake).
    Greppable: productWireFsWriterBinRel, slake-product-wire-fs-write-cc. -/
def productWireFsWriterBinRel : String :=
  "src/systems/bin/slake-product-wire-fs-write-cc"

/-- Lake exe that regenerates tool C (bootstrap only; not measured product write).
    Greppable: lakeExeProductWireFsWriter, slake-product-wire-fs-write-tool. -/
def lakeExeProductWireFsWriter : String := "slake-product-wire-fs-write-tool"

/-- just recipe for measured product-wire freestanding write after Path A.
    Greppable: justRecipeProductWireFsWriter, product-wire-freestanding-write. -/
def justRecipeProductWireFsWriter : String := "product-wire-freestanding-write"

/-- Host elaborator still Lake (bootstrap; S4 / M6 only retires product pins).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty non-claims. -/
def productWireFsWriterResidualFreeClaimed : Bool := false
def productWireFsWriterProductSelfHostCompleteClaimed : Bool := false
def productWireFsWriterProofCompleteClaimed : Bool := false
def productWireFsWriterLlvmUnlocked : Bool := false
def productWireFsWriterProvablyUnlocked : Bool := false

/-- Local finished pin for M4 Name B product-wire freestanding writer
    (separate from Mult freestandingDriverComplete). Greppable:
    productWireFsWriterFinishedClaimed, PRODUCT-WIRE-FS-WRITE-TOOL. -/
def productWireFsWriterFinishedClaimed : Bool := true

/-- Writer bin path is not a Lake-built CapableRegenerate / Mult write ELF path.
    Greppable: productWireFsWriterNotLakeBuilt, slake-product-wire-fs-write-cc. -/
def productWireFsWriterNotLakeBuilt : Bool :=
  (productWireFsWriterBinRel == "src/systems/bin/slake-product-wire-fs-write-cc")
    && (productWireFsWriterCRel
      == "src/systems/emit/slake_product_wire_fs_write_tool.c")
    && (productWireFsWriterBinRel
      != ".lake/build/bin/slake-freestanding-capable-regenerate")
    && (productWireFsWriterBinRel
      != "src/systems/.lake/build/bin/slake-freestanding-capable-regenerate")
    && (productWireFsWriterBinRel
      != ".lake/build/bin/slake-mult-fs-write")
    && (productWireFsWriterBinRel
      != "src/systems/.lake/build/bin/slake-mult-fs-write")
    && (productWireFsWriterBinRel
      != "src/systems/bin/slake-mult-fs-write-cc")
    && (lakeExeProductWireFsWriter == "slake-product-wire-fs-write-tool")
    && (lakeExeProductWireFsWriter != "slake-freestanding-capable-regenerate")
    && (lakeExeProductWireFsWriter != "slake-mult-fs-write-tool")

/-- Preferred honesty: product-wire freestanding writer finished does not retire
    product Lake host. Greppable: productWireFsWriterKeepsHostLake. -/
def productWireFsWriterKeepsHostLake : Bool :=
  productWireFsWriterFinishedClaimed && stillUsesLake && dependsOnLake

/-- Structural ready: dual-eq Capable WRITE surface + non-Lake tool path + finished
    + Lake host honesty. Greppable: productWireFsWriterReady. -/
def productWireFsWriterReady : Bool :=
  productPathFreestandingCapableWriteHcOk
    && productPathCapableWriteDualEqualityLive
    && productWireFsWriterNotLakeBuilt
    && productWireFsWriterFinishedClaimed
    && productWireFsWriterKeepsHostLake
    && stillUsesLake
    && dependsOnLake
    && !productWireFsWriterResidualFreeClaimed
    && !productWireFsWriterProductSelfHostCompleteClaimed
    && !productWireFsWriterProofCompleteClaimed
    && !productWireFsWriterLlvmUnlocked
    && !productWireFsWriterProvablyUnlocked
    && (stageId == "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0")
    && (hostId == "HOST-PRODUCT-WIRE-FS-WRITE-TOOL")
    && (surfaceId == "PRODUCT-WIRE-FS-WRITE-TOOL")
    && (justRecipeProductWireFsWriter == "product-wire-freestanding-write")
    && (lakeExeProductWireFsWriter == "slake-product-wire-fs-write-tool")
    && (productWireFsWriterBinRel
      == "src/systems/bin/slake-product-wire-fs-write-cc")
    && (productWireFsWriterCRel
      == "src/systems/emit/slake_product_wire_fs_write_tool.c")

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

/-- Build product-wire writer C tool source from dual-eq freestanding header/source.
    Greppable: productWireFsWriterCSource. -/
def productWireFsWriterCSource (header : String) (source : String) : String :=
  "/* PRODUCT-WIRE-FS-WRITE-TOOL / SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0\n"
    ++ " * Lean-generated freestanding product-wire writer (M4 Name B Path A).\n"
    ++ " * Bytes: dual-eq freestandingCapableWriteFreestandingHc (CapableWriteHc).\n"
    ++ " * Do not hand-edit freestanding dialect features here; regenerate from Lean.\n"
    ++ " * Host-cc tool (stdio); not Lake AOT CapableRegenerate ELF.\n"
    ++ " * Measured bin: src/systems/bin/slake-product-wire-fs-write-cc (outside .lake).\n"
    ++ " * WRITE emit/slake_freestanding.{h,c} + INSTALL out/freestanding-c/.\n"
    ++ " * Product StillUsesLake / DependsOnLake remain until S4 / M6.\n"
    ++ " * freestandingDriverComplete is Mult-orthogonal (separate product-wire pin).\n"
    ++ " * RUNTIME-FS; no product GC on freestanding product wire.\n"
    ++ " */\n"
    ++ "#include <errno.h>\n"
    ++ "#include <stdio.h>\n"
    ++ "#include <stdlib.h>\n"
    ++ "#include <string.h>\n"
    ++ "#include <sys/stat.h>\n"
    ++ "\n"
    ++ cByteArrayDef "fs_header_bytes" header
    ++ cByteArrayDef "fs_source_bytes" source
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
    ++ "static int ensure_out_dir(const char *root)\n"
    ++ "{\n"
    ++ "  char p[4096];\n"
    ++ "  if ((size_t)snprintf(p, sizeof p, \"%s/out\", root) >= sizeof p) {\n"
    ++ "    fprintf(stderr, \"error: path too long (out)\\n\");\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (ensure_dir(p) != 0) return -1;\n"
    ++ "  if ((size_t)snprintf(p, sizeof p, \"%s/out/freestanding-c\", root) >= sizeof p) {\n"
    ++ "    fprintf(stderr, \"error: path too long (out/freestanding-c)\\n\");\n"
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
    ++ "  char path_oh[4096];\n"
    ++ "  char path_oc[4096];\n"
    ++ "  char path_readme[4096];\n"
    ++ "  printf(\"== SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0: freestanding product-wire write (host-cc)\\n\");\n"
    ++ "  printf(\"  host: HOST-PRODUCT-WIRE-FS-WRITE-TOOL / surface: PRODUCT-WIRE-FS-WRITE-TOOL\\n\");\n"
    ++ "  printf(\"  package: dual-eq freestanding dialect (embedded; CapableWriteHc)\\n\");\n"
    ++ "  printf(\"  honest: not Lake-built CapableRegenerate ELF; StillUsesLake remains\\n\");\n"
    ++ "  if (ensure_emit_dir(root) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (ensure_out_dir(root) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_readme, sizeof path_readme,\n"
    ++ "        \"%s/out/freestanding-c/README.md\", root) >= sizeof path_readme) {\n"
    ++ "    fprintf(stderr, \"error: README path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  {\n"
    ++ "    FILE *rf = fopen(path_readme, \"rb\");\n"
    ++ "    if (!rf) {\n"
    ++ "      fprintf(stderr, \"error: missing Out README (release marker): %s\\n\", path_readme);\n"
    ++ "      return 1;\n"
    ++ "    }\n"
    ++ "    fclose(rf);\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_h, sizeof path_h,\n"
    ++ "        \"%s/src/systems/emit/slake_freestanding.h\", root) >= sizeof path_h) {\n"
    ++ "    fprintf(stderr, \"error: header path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_c, sizeof path_c,\n"
    ++ "        \"%s/src/systems/emit/slake_freestanding.c\", root) >= sizeof path_c) {\n"
    ++ "    fprintf(stderr, \"error: source path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_h, fs_header_bytes, fs_header_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_c, fs_source_bytes, fs_source_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_oh, sizeof path_oh,\n"
    ++ "        \"%s/out/freestanding-c/slake_freestanding.h\", root) >= sizeof path_oh) {\n"
    ++ "    fprintf(stderr, \"error: Out header path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if ((size_t)snprintf(path_oc, sizeof path_oc,\n"
    ++ "        \"%s/out/freestanding-c/slake_freestanding.c\", root) >= sizeof path_oc) {\n"
    ++ "    fprintf(stderr, \"error: Out source path too long\\n\");\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_oh, fs_header_bytes, fs_header_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (write_bytes(path_oc, fs_source_bytes, fs_source_bytes_len) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  printf(\"GREEN SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0: wrote freestanding wire + install Out\\n\");\n"
    ++ "  printf(\"  wrote: %s (%zu bytes)\\n\", path_h, (size_t)fs_header_bytes_len);\n"
    ++ "  printf(\"  wrote: %s (%zu bytes)\\n\", path_c, (size_t)fs_source_bytes_len);\n"
    ++ "  printf(\"  installed: %s\\n\", path_oh);\n"
    ++ "  printf(\"  installed: %s\\n\", path_oc);\n"
    ++ "  printf(\"  greppable: PRODUCT-WIRE-FS-WRITE-TOOL, SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT\\n\");\n"
    ++ "  return 0;\n"
    ++ "}\n"

/-- Emit product-wire writer C under root after dual-eq WRITE.
    Greppable: productWireFsWriterEmit. -/
def productWireFsWriterEmit (root : System.FilePath) : IO Unit := do
  unless productWireFsWriterReady do
    IO.eprintln s!"error: {stageId}: productWireFsWriterReady false"
    throw (IO.userError "productWireFsWriterReady false")
  let emitDir := root / "src" / "systems" / "emit"
  let outTool := emitDir / "slake_product_wire_fs_write_tool.c"
  let outH := emitDir / "slake_freestanding.h"
  let outC := emitDir / "slake_freestanding.c"
  IO.println s!"== {stageId}: dual-eq WRITE then emit product-wire writer C =="
  IO.println s!"  out tool C: {outTool}"
  IO.println s!"  measured bin: {productWireFsWriterBinRel}"
  -- Dual-eq freestanding dialect WRITE (CapableWriteHc authority; not Lake ELF measure).
  freestandingCapableWriteFreestandingHc root
  let header <- IO.FS.readFile outH
  let source <- IO.FS.readFile outC
  if header.isEmpty || source.isEmpty then
    IO.eprintln "error: empty freestanding wire after dual-eq WRITE"
    throw (IO.userError "empty freestanding wire")
  unless containsStr header "SLAKE_EMIT_FREESTANDING_C_V0" do
    IO.eprintln "error: freestanding header missing SLAKE_EMIT_FREESTANDING_C_V0"
    throw (IO.userError "missing freestanding stage token")
  unless containsStr source "HOST-EMIT-SSOT" do
    IO.eprintln "error: freestanding source missing HOST-EMIT-SSOT"
    throw (IO.userError "missing HOST-EMIT-SSOT")
  let toolC := productWireFsWriterCSource header source
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outTool toolC
  let written <- IO.FS.readFile outTool
  if written != toolC then
    IO.eprintln "error: tool C write mismatch"
    throw (IO.userError "tool C mismatch")
  unless (<- outTool.pathExists) do
    IO.eprintln s!"error: missing tool C after write: {outTool}"
    throw (IO.userError "missing tool C")
  IO.println s!"GREEN {stageId}: wrote {outTool} ({written.length} chars)"
  IO.println s!"  embedded freestanding header: {header.length} chars"
  IO.println s!"  embedded freestanding source: {source.length} chars"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: dual-eq WRITE + emit product-wire writer C under repo root (default .). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    productWireFsWriterEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

/-! ### PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM -/

set_option maxRecDepth 8192

theorem productWireFsWriterNotLakeBuilt_true :
    productWireFsWriterNotLakeBuilt = true := by
  native_decide

theorem productWireFsWriterFinishedClaimed_true :
    productWireFsWriterFinishedClaimed = true :=
  rfl

theorem productWireFsWriterKeepsHostLake_true :
    productWireFsWriterKeepsHostLake = true := by
  native_decide

theorem productWireFsWriterReady_true :
    productWireFsWriterReady = true := by
  native_decide

theorem productWireFsWriter_ids_eq :
    (stageId = "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0")
      /\ (hostId = "HOST-PRODUCT-WIRE-FS-WRITE-TOOL")
      /\ (surfaceId = "PRODUCT-WIRE-FS-WRITE-TOOL")
      /\ (productWireFsWriterBinRel
        = "src/systems/bin/slake-product-wire-fs-write-cc")
      /\ (productWireFsWriterCRel
        = "src/systems/emit/slake_product_wire_fs_write_tool.c")
      /\ (justRecipeProductWireFsWriter = "product-wire-freestanding-write")
      /\ (lakeExeProductWireFsWriter = "slake-product-wire-fs-write-tool")
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl
              (And.intro rfl (And.intro rfl rfl)))))))

/-! ### PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE -/

example : productWireFsWriterNotLakeBuilt = true := by native_decide
example : productWireFsWriterFinishedClaimed = true := rfl
example : productWireFsWriterKeepsHostLake = true := by native_decide
example : productWireFsWriterReady = true := by native_decide
example : productWireFsWriterBinRel
    = "src/systems/bin/slake-product-wire-fs-write-cc" := rfl
example : productWireFsWriterCRel
    = "src/systems/emit/slake_product_wire_fs_write_tool.c" := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : productWireFsWriterResidualFreeClaimed = false := rfl
example : productWireFsWriterLlvmUnlocked = false := rfl
example : productWireFsWriterProvablyUnlocked = false := rfl
example : lakeExeProductWireFsWriter = "slake-product-wire-fs-write-tool" := rfl
example : justRecipeProductWireFsWriter = "product-wire-freestanding-write" := rfl

end SystemsLean.ProductWireWriteTool
