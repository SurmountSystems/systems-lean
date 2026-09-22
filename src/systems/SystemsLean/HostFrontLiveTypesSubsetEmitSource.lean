/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesSubsetEmit.lean bytes.
  Module: SystemsLean.HostFrontLiveTypesSubsetEmitSource
  liveRel is TypesSubsetEmit.lean. Not FullHost. Not TypesSubsetEmitMain.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesSubsetEmit

/-- Dual-pinned live TypesSubsetEmit.lean bytes. -/
def liveTypesSubsetEmitSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- Types subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Types unit input (COMPILE-PATH-TYPES /
  TYPES-FIXTURE / typesFixtureCompilePathReady) -> write freestanding Types
  unit package (header + body) under emit/, reusing HOST-EMIT-TYPES dialect
  (EmitTypes fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Types subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT,
  SLAKE_TYPES_SUBSET_EMIT_V0, HOST-TYPES-SUBSET-EMIT, typesSubsetEmitReady,
  typesSubsetEmitInputId, typesSubsetEmitWroteExpected, typesSubsetEmitReady_true,
  TYPES-SUBSET-EMIT-SMOKE, TYPES-SUBSET-EMIT-THEOREM, COMPILE-PATH-TYPES,
  TYPES-FIXTURE, SLAKE_TYPES_SUBSET_TYPES, HOST-EMIT-TYPES, emitTypesReady,
  typesFixtureCompilePathReady, slake-types-subset-emit, just types-subset-emit,
  slake_types_subset.h, slake_types_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, UNIT_SURFACE host surface. Module: SystemsLean.TypesSubsetEmit
  Short role name (not ProductPathFreestandingTypesSubset kitchen-sink).
  Honesty dual evidence: typesSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Types fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe typesSubsetEmitWrite (IO.FS.writeFile)
  plus just types-subset-emit greps on emit/slake_types_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.TypesSubsetEmit; lake exe slake-types-subset-emit;
  just types-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathTypes
import SystemsLean.EmitTypes

namespace SystemsLean.TypesSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitTypes

/-! ### TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-TYPES / TYPES-FIXTURE structural
  readiness (`typesFixtureCompilePathReady`).
  Output: written Types freestanding C unit package (header + body fragments
  from HOST-EMIT-TYPES), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Types subset emit). -/
def stageId : String := "SLAKE_TYPES_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-TYPES-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "TYPES-SUBSET-EMIT"

/-- Types unit input identity (COMPILE-PATH-TYPES / TYPES-FIXTURE content).
    Greppable: typesSubsetEmitInputId, SLAKE_TYPES_SUBSET_TYPES. -/
def typesSubsetEmitInputId : String := "SLAKE_TYPES_SUBSET_TYPES"

/-- Lake exe name. -/
def lakeExeName : String := "slake-types-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "types-subset-emit"

/-- Relative emit header base (Types unit package only). -/
def emitHeaderBase : String := "slake_types_subset.h"

/-- Relative emit source base (Types unit package only). -/
def emitSourceBase : String := "slake_types_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def typesSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def typesSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def typesSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def typesSubsetEmitProvablyUnlocked : Bool := false

/-- Types unit input structural readiness reused.
    Greppable: typesSubsetEmitInputReady, typesFixtureCompilePathReady. -/
def typesSubsetEmitInputReady : Bool := typesFixtureCompilePathReady

/-- HOST-EMIT-TYPES dialect readiness (no second Types dialect).
    Greppable: typesSubsetEmitTypesDialectOk, emitTypesReady, HOST-EMIT-TYPES. -/
def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady

/-- Package banner (header) with greppable M1 honesty; Types dialect follows. -/
def typesSubsetHeaderBanner : String :=
  "/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0\n"
    ++ " * Host-built Types subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_TYPES_SUBSET_TYPES (COMPILE-PATH-TYPES / TYPES-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-TYPES (EmitTypes; no second Types dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Types unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; no product GC on this Types subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Types body follows. -/
def typesSubsetSourceBanner : String :=
  "/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Types subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_TYPES_SUBSET_TYPES; dialect HOST-EMIT-TYPES.\n"
    ++ " * Not full slake_freestanding.c regenerate; Types unit only.\n"
    ++ " * RUNTIME-FS; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Types subset header package text (banner + typesHeaderFragment).
    Greppable: typesSubsetHeaderPackage, slake_types_subset.h. -/
def typesSubsetHeaderPackage : String :=
  typesSubsetHeaderBanner ++ typesHeaderFragment

/-- Types subset source package text (banner + typesBodyFragment).
    Greppable: typesSubsetSourcePackage, slake_types_subset.c. -/
def typesSubsetSourcePackage : String :=
  typesSubsetSourceBanner ++ typesBodyFragment

/-- Package text honesty: banners + Types dialect pieces present.
    Greppable: typesSubsetEmitPackageOk. -/
def typesSubsetEmitPackageOk : Bool :=
  typesSubsetEmitTypesDialectOk
    && (emitHeaderBase == "slake_types_subset.h")
    && (emitSourceBase == "slake_types_subset.c")
    && (typesSubsetHeaderBanner
      == "/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0\n"
        ++ " * Host-built Types subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_TYPES_SUBSET_TYPES (COMPILE-PATH-TYPES / TYPES-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-TYPES (EmitTypes; no second Types dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Types unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; no product GC on this Types subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (typesSubsetSourceBanner
      == "/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Types subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_TYPES_SUBSET_TYPES; dialect HOST-EMIT-TYPES.\n"
        ++ " * Not full slake_freestanding.c regenerate; Types unit only.\n"
        ++ " * RUNTIME-FS; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Types subset emit (Types fixture input + Types
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: typesSubsetEmitReady, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT. -/
def typesSubsetEmitReady : Bool :=
  typesSubsetEmitInputReady
    && typesSubsetEmitTypesDialectOk
    && typesSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !typesSubsetEmitResidualFreeClaimed
    && !typesSubsetEmitProductSelfHostCompleteClaimed
    && !typesSubsetEmitProofCompleteClaimed
    && !typesSubsetEmitLlvmUnlocked
    && !typesSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_TYPES_SUBSET_EMIT_V0")
    && (hostId == "HOST-TYPES-SUBSET-EMIT")
    && (surfaceId == "TYPES-SUBSET-EMIT")
    && (typesSubsetEmitInputId == "SLAKE_TYPES_SUBSET_TYPES")
    && (lakeExeName == "slake-types-subset-emit")
    && (justRecipe == "types-subset-emit")

/-- typesSubsetEmitReady does not retire Lake (S4 only).
    Greppable: typesSubsetEmitDoesNotRetireLake. -/
def typesSubsetEmitDoesNotRetireLake : Bool :=
  typesSubsetEmitReady && stillUsesLake && dependsOnLake

/-- typesSubsetEmitReady is not product residual free claim.
    Greppable: typesSubsetEmitDoesNotMeanResidualFree. -/
def typesSubsetEmitDoesNotMeanResidualFree : Bool :=
  typesSubsetEmitReady && !typesSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Types subset text equals
    banner + HOST-EMIT-TYPES fragments. NOT filesystem write proof.
    Actual on-disk write: typesSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateTypesSubsetPackage; host gate just types-subset-emit
    greps emit/slake_types_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: typesSubsetEmitWroteExpected (structural package pin). -/
def typesSubsetEmitWroteExpected : Bool :=
  typesSubsetEmitPackageOk
    && (typesSubsetHeaderPackage == typesSubsetHeaderBanner ++ typesHeaderFragment)
    && (typesSubsetSourcePackage == typesSubsetSourceBanner ++ typesBodyFragment)

/-! ### TYPES-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Types unit input ready for subset emit.
    Greppable: typesSubsetEmitInputReady_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitInputReady_true :
    typesSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-TYPES dialect ok for subset package.
    Greppable: typesSubsetEmitTypesDialectOk_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitTypesDialectOk_true :
    typesSubsetEmitTypesDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: typesSubsetEmitPackageOk_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitPackageOk_true :
    typesSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: typesSubsetEmitWroteExpected_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitWroteExpected_true :
    typesSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Types subset emit structural ready (ideal ladder M1).
    Greppable: typesSubsetEmitReady_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitReady_true : typesSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: typesSubsetEmitDoesNotRetireLake_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitDoesNotRetireLake_true :
    typesSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: typesSubsetEmitDoesNotMeanResidualFree_true, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmitDoesNotMeanResidualFree_true :
    typesSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: typesSubsetEmit_claims_false, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmit_claims_false :
    (typesSubsetEmitResidualFreeClaimed = false)
      /\ (typesSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (typesSubsetEmitProofCompleteClaimed = false)
      /\ (typesSubsetEmitLlvmUnlocked = false)
      /\ (typesSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: typesSubsetEmit_ids_eq, TYPES-SUBSET-EMIT-THEOREM. -/
theorem typesSubsetEmit_ids_eq :
    (stageId = "SLAKE_TYPES_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-TYPES-SUBSET-EMIT")
      /\ (surfaceId = "TYPES-SUBSET-EMIT")
      /\ (typesSubsetEmitInputId = "SLAKE_TYPES_SUBSET_TYPES")
      /\ (lakeExeName = "slake-types-subset-emit")
      /\ (justRecipe = "types-subset-emit")
      /\ (emitHeaderBase = "slake_types_subset.h")
      /\ (emitSourceBase = "slake_types_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### TYPES-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: TYPES-SUBSET-EMIT-SMOKE, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_TYPES. -/

/-- TYPES-SUBSET-EMIT-SMOKE: Types input + Types dialect + package + write pin. -/
example : typesSubsetEmitInputReady = true := by native_decide
example : typesSubsetEmitTypesDialectOk = true := by native_decide
example : typesSubsetEmitPackageOk = true := by native_decide
example : typesSubsetEmitWroteExpected = true := by native_decide

/-- TYPES-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : typesSubsetEmitReady = true := by native_decide
example : typesSubsetEmitDoesNotRetireLake = true := by native_decide
example : typesSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : typesSubsetEmitResidualFreeClaimed = false := rfl
example : typesSubsetEmitLlvmUnlocked = false := rfl
example : typesSubsetEmitProvablyUnlocked = false := rfl
example : typesSubsetEmitInputId = "SLAKE_TYPES_SUBSET_TYPES" := rfl
example : lakeExeName = "slake-types-subset-emit" := rfl
example : emitHeaderBase = "slake_types_subset.h" := rfl
example : emitSourceBase = "slake_types_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Types subset package lacks greppable honesty tokens. -/
def validateTypesSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "TYPES-SUBSET-EMIT"
    , "SLAKE_TYPES_SUBSET_EMIT_V0"
    , "SLAKE_TYPES_SUBSET_TYPES"
    , "HOST-EMIT-TYPES"
    , "RUNTIME-FS"
    , "no product GC"
    , "TYPED_IR_V0"
    , "slake_type_tag"
    , "slake_ir_node"
    , "COMMON-UNIVERSE"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_type_tag_init" do
      IO.eprintln s!"error: {label}: missing slake_type_tag_init body"
      throw (IO.userError s!"{label}: missing type_tag_init body")
    unless containsSub text "slake_typed_ir_id" do
      IO.eprintln s!"error: {label}: missing slake_typed_ir_id body"
      throw (IO.userError s!"{label}: missing typed_ir_id body")
  else
    unless containsSub text "typedef struct slake_type_tag" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_type_tag"
      throw (IO.userError s!"{label}: missing type_tag typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Types subset freestanding C unit package under root/src/systems/emit.
    Reuses Types fixture input identity + HOST-EMIT-TYPES fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: typesSubsetEmitWrite,
    slake_types_subset.h, slake_types_subset.c, IO.FS.writeFile. -/
def typesSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless typesSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: typesSubsetEmitReady false"
    throw (IO.userError "typesSubsetEmitReady false")
  unless typesSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: typesSubsetEmitWroteExpected false"
    throw (IO.userError "typesSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Types subset emit =="
  IO.println s!"  readyPin={typesSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH typesSubsetHeaderPackage
  IO.FS.writeFile outC typesSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Types subset header ({emitHeaderBase})"
  requireFile outC s!"Types subset source ({emitSourceBase})"
  if headerWritten != typesSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != typesSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateTypesSubsetPackage emitHeaderBase headerWritten false
  validateTypesSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT_V0, HOST-EMIT-TYPES, TYPED_IR_V0"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Types subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    typesSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.TypesSubsetEmit
"##

end SystemsLean.HostFrontLiveTypesSubsetEmit
