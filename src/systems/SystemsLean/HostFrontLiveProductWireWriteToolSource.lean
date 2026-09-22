/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductWireWriteTool.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductWireWriteToolSource.
  Not occupancy name 50. Not mill 70.
  This wrap is ProductWireWriteTool.lean. It is not CapableWriteHc.lean.
  It is not InstallOut.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveProductWireWriteToolSource,
  HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductWireWriteToolSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductWireWriteTool

/-- Live file basename. Greppable: liveRel. -/
def liveRel : String := "ProductWireWriteTool.lean"

/-- Dual-pinned live ProductWireWriteTool.lean bytes (must match on-disk file).
    Greppable: liveProductWireWriteToolSource,
    HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL. -/
def liveProductWireWriteToolSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding product-wire writer tool (P1).
  Living path: dual-eq freestandingCapableWriteFreestandingHc + Install Out via
  Lean IO.FS.writeFile. Does NOT print full host-cc C tool bodies as Lean string
  soup (Path A C-print retired under Program P Host-cc helper tools without C
  printed from Lean). Greppable retired Path A path names
  (slake_product_wire_fs_write_tool.c, slake-product-wire-fs-write-cc) remain
  for archaeology and pin continuity. Not Lake-built CapableRegenerate ELF as
  the only design. Product StillUsesLake remains. freestandingDriverComplete
  stays Mult-orthogonal (separate pin here). Not free/complete product flip.
  Not PROVABLY. Not llvm unlock.
  Greppable: SYSTEMS_LEAN_HOST, PRODUCT-WIRE-FS-WRITE-TOOL,
  SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL, SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0,
  HOST-PRODUCT-WIRE-FS-WRITE-TOOL, productWireFsWriterReady,
  productWireFsWriterFinishedClaimed, productWireFsWriterNotLakeBuilt,
  productWireFsWriterKeepsHostLake, productWireFsWriterBinRel,
  productWireFsWriterCRel, productWireFsWriterEmit, productWireFsWriterCSource,
  productWireFsWriterNativeIo, productWireFsWriterPrintsFullHelperC,
  IO.FS.writeFile, slake_product_wire_fs_write_tool.c,
  slake-product-wire-fs-write-cc, product-wire-freestanding-write,
  freestandingCapableWriteFreestandingHc, freestandingCapableInstallFreestandingOut,
  PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE, PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM,
  StillUsesLake, DependsOnLake, UNIT_SURFACE, CapableWriteHc, InstallOut,
  SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT, RUNTIME-FS.
  Module: SystemsLean.ProductWireWriteTool
  Short role name (not ProductPathFreestanding* kitchen-sink).
  Red/green: lake build SystemsLean.ProductWireWriteTool;
  lake exe slake-product-wire-fs-write-tool; just product-wire-freestanding-write.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as Lake-only success. UNIT_SURFACE host surface.
  Greppable: RUNTIME-FS (product-wire freestanding write honesty).
-/

import SystemsLean.CapableWriteHc
import SystemsLean.InstallOut

namespace SystemsLean.ProductWireWriteTool

open SystemsLean.CapableWriteHc
open SystemsLean.InstallOut

/-! ### PRODUCT-WIRE-FS-WRITE-TOOL / SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL

  Lean-native freestanding product-wire writer (M4 Name B, P1).
  Living: dual-eq WRITE via freestandingCapableWriteFreestandingHc, then
  freestandingCapableInstallFreestandingOut. No host-cc tool C generation.
-/

/-- Greppable primary stage id (freestanding product-wire writer). -/
def stageId : String := "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PRODUCT-WIRE-FS-WRITE-TOOL"

/-- Short surface name. -/
def surfaceId : String := "PRODUCT-WIRE-FS-WRITE-TOOL"

/-- Retired Path A product-wire writer C relative to repo root (archaeology only).
    Greppable: productWireFsWriterCRel, slake_product_wire_fs_write_tool.c. -/
def productWireFsWriterCRel : String :=
  "src/systems/emit/slake_product_wire_fs_write_tool.c"

/-- Retired Path A host-cc product-wire writer binary (archaeology only).
    Greppable: productWireFsWriterBinRel, slake-product-wire-fs-write-cc. -/
def productWireFsWriterBinRel : String :=
  "src/systems/bin/slake-product-wire-fs-write-cc"

/-- Lake exe for living Lean-native product-wire WRITE+INSTALL.
    Greppable: lakeExeProductWireFsWriter, slake-product-wire-fs-write-tool. -/
def lakeExeProductWireFsWriter : String := "slake-product-wire-fs-write-tool"

/-- just recipe for measured product-wire freestanding write.
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

/-- Local finished pin for M4 product-wire freestanding writer
    (separate from Mult freestandingDriverComplete). Greppable:
    productWireFsWriterFinishedClaimed, PRODUCT-WIRE-FS-WRITE-TOOL. -/
def productWireFsWriterFinishedClaimed : Bool := true

/-- Living product-wire writer uses Lean dual-eq WRITE + Install Out IO.
    Greppable: productWireFsWriterNativeIo, IO.FS.writeFile, CapableWriteHc. -/
def productWireFsWriterNativeIo : Bool := true

/-- Living design does not print full helper C tool source from Lean (P1).
    Greppable: productWireFsWriterPrintsFullHelperC. -/
def productWireFsWriterPrintsFullHelperC : Bool := false

/-- Honesty: living product-wire writer is Lean-native dual-eq WRITE+INSTALL, not
    CapableRegenerate-only as sole design, not Mult package writer, and not full
    host-cc C printed from Lean. Retired Path A path names stay greppable.
    Greppable: productWireFsWriterNotLakeBuilt, slake-product-wire-fs-write-cc. -/
def productWireFsWriterNotLakeBuilt : Bool :=
  productWireFsWriterNativeIo
    && !productWireFsWriterPrintsFullHelperC
    && (productWireFsWriterBinRel == "src/systems/bin/slake-product-wire-fs-write-cc")
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

/-- Structural ready: dual-eq Capable WRITE surface + native Io + finished + Lake.
    Greppable: productWireFsWriterReady. -/
def productWireFsWriterReady : Bool :=
  productPathFreestandingCapableWriteHcOk
    && productPathCapableWriteDualEqualityLive
    && productWireFsWriterNotLakeBuilt
    && productWireFsWriterFinishedClaimed
    && productWireFsWriterKeepsHostLake
    && productWireFsWriterNativeIo
    && !productWireFsWriterPrintsFullHelperC
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

/-- Retired greppable marker only: Path A full host-cc C body removed (P1).
    Not a living C tool source. Greppable: productWireFsWriterCSource,
    slake_product_wire_fs_write_tool.c. -/
def productWireFsWriterCSource : String :=
  "/* RETIRED P1: productWireFsWriterCSource full host-cc C print removed.\n"
    ++ " * Living product-wire write: freestandingCapableWriteFreestandingHc\n"
    ++ " * + freestandingCapableInstallFreestandingOut (Lean-native IO).\n"
    ++ " * Greppable archaeology: slake_product_wire_fs_write_tool.c,\n"
    ++ " * slake-product-wire-fs-write-cc.\n"
    ++ " * Do not restore multi-hundred-line C-in-Lean helper tools.\n"
    ++ " */\n"

/-- True if hay contains needle (ASCII scan). -/
private def containsStr (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Dual-eq WRITE emit + Install Out under root (Lean-native; no tool C).
    Greppable: productWireFsWriterEmit, freestandingCapableWriteFreestandingHc,
    freestandingCapableInstallFreestandingOut, IO.FS.writeFile. -/
def productWireFsWriterEmit (root : System.FilePath) : IO Unit := do
  unless productWireFsWriterReady do
    IO.eprintln s!"error: {stageId}: productWireFsWriterReady false"
    throw (IO.userError "productWireFsWriterReady false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / "slake_freestanding.h"
  let outC := emitDir / "slake_freestanding.c"
  let outDir := root / "out" / "freestanding-c"
  let installH := outDir / "slake_freestanding.h"
  let installC := outDir / "slake_freestanding.c"
  IO.println s!"== {stageId}: Lean-native product-wire WRITE+INSTALL (no host-cc C print) =="
  IO.println s!"  living: freestandingCapableWriteFreestandingHc + InstallOut"
  IO.println s!"  lake exe: {lakeExeProductWireFsWriter}"
  IO.println s!"  just: {justRecipeProductWireFsWriter}"
  IO.println s!"  retired Path A C (not written): {productWireFsWriterCRel}"
  IO.println s!"  retired Path A bin (not built): {productWireFsWriterBinRel}"
  freestandingCapableWriteFreestandingHc root
  freestandingCapableInstallFreestandingOut root
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
  unless (<- installH.pathExists) do
    IO.eprintln s!"error: missing Out install header: {installH}"
    throw (IO.userError "missing Out header")
  unless (<- installC.pathExists) do
    IO.eprintln s!"error: missing Out install source: {installC}"
    throw (IO.userError "missing Out source")
  IO.println s!"GREEN {stageId}: freestanding wire + Out via Lean-native dual-eq WRITE+INSTALL"
  IO.println s!"  wrote: {outH} ({header.length} chars)"
  IO.println s!"  wrote: {outC} ({source.length} chars)"
  IO.println s!"  installed: {installH}"
  IO.println s!"  installed: {installC}"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: Lean-native product-wire WRITE+INSTALL under repo root (default .). -/
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

theorem productWireFsWriterNativeIo_true :
    productWireFsWriterNativeIo = true :=
  rfl

theorem productWireFsWriterPrintsFullHelperC_false :
    productWireFsWriterPrintsFullHelperC = false :=
  rfl

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
example : productWireFsWriterNativeIo = true := rfl
example : productWireFsWriterPrintsFullHelperC = false := rfl
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
example : productWireFsWriterCSource.length > 0 := by native_decide

end SystemsLean.ProductWireWriteTool
"#

end SystemsLean.HostFrontLiveProductWireWriteTool
