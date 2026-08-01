/-
  SYSTEMS_LEAN_HOST partial -- Erasure subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Erasure unit input (COMPILE-PATH-ERASURE /
  ERASURE-FIXTURE / erasureFixtureCompilePathReady) -> write freestanding Erasure
  unit package (header + body) under emit/, reusing HOST-EMIT-ERASURE dialect
  (EmitErasure fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Erasure subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT,
  SLAKE_ERASURE_SUBSET_EMIT_V0, HOST-ERASURE-SUBSET-EMIT, erasureSubsetEmitReady,
  erasureSubsetEmitInputId, erasureSubsetEmitWroteExpected, erasureSubsetEmitReady_true,
  ERASURE-SUBSET-EMIT-SMOKE, ERASURE-SUBSET-EMIT-THEOREM, COMPILE-PATH-ERASURE,
  ERASURE-FIXTURE, SLAKE_ERASURE_SUBSET_ERASURE, HOST-EMIT-ERASURE, emitErasureReady,
  erasureFixtureCompilePathReady, slake-erasure-subset-emit, just erasure-subset-emit,
  slake_erasure_subset.h, slake_erasure_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, ERASE-RULE-MULT-0, ERASE-NO-RUNTIME, UNIT_SURFACE host surface.
  Module: SystemsLean.ErasureSubsetEmit
  Short role name (not ProductPathFreestandingErasureSubset kitchen-sink).
  Honesty dual evidence: erasureSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Erasure fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe erasureSubsetEmitWrite (IO.FS.writeFile)
  plus just erasure-subset-emit greps on emit/slake_erasure_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ErasureSubsetEmit; lake exe slake-erasure-subset-emit;
  just erasure-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathErasure
import SystemsLean.EmitErasure

namespace SystemsLean.ErasureSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitErasure

/-! ### ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-ERASURE / ERASURE-FIXTURE structural
  readiness (`erasureFixtureCompilePathReady`).
  Output: written Erasure freestanding C unit package (header + body fragments
  from HOST-EMIT-ERASURE), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Erasure subset emit). -/
def stageId : String := "SLAKE_ERASURE_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-ERASURE-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "ERASURE-SUBSET-EMIT"

/-- Erasure unit input identity (COMPILE-PATH-ERASURE / ERASURE-FIXTURE content).
    Greppable: erasureSubsetEmitInputId, SLAKE_ERASURE_SUBSET_ERASURE. -/
def erasureSubsetEmitInputId : String := "SLAKE_ERASURE_SUBSET_ERASURE"

/-- Lake exe name. -/
def lakeExeName : String := "slake-erasure-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "erasure-subset-emit"

/-- Relative emit header base (Erasure unit package only). -/
def emitHeaderBase : String := "slake_erasure_subset.h"

/-- Relative emit source base (Erasure unit package only). -/
def emitSourceBase : String := "slake_erasure_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def erasureSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def erasureSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def erasureSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def erasureSubsetEmitProvablyUnlocked : Bool := false

/-- Erasure unit input structural readiness reused.
    Greppable: erasureSubsetEmitInputReady, erasureFixtureCompilePathReady. -/
def erasureSubsetEmitInputReady : Bool := erasureFixtureCompilePathReady

/-- HOST-EMIT-ERASURE dialect readiness (no second Erasure dialect).
    Greppable: erasureSubsetEmitErasureDialectOk, emitErasureReady, HOST-EMIT-ERASURE. -/
def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady

/-- Package banner (header) with greppable M1 honesty; Erasure dialect follows. -/
def erasureSubsetHeaderBanner : String :=
  "/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0\n"
    ++ " * Host-built Erasure subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_ERASURE_SUBSET_ERASURE (COMPILE-PATH-ERASURE / ERASURE-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-ERASURE (EmitErasure; no second Erasure dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Erasure unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC on this Erasure subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Erasure body follows. -/
def erasureSubsetSourceBanner : String :=
  "/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Erasure subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_ERASURE_SUBSET_ERASURE; dialect HOST-EMIT-ERASURE.\n"
    ++ " * Not full slake_freestanding.c regenerate; Erasure unit only.\n"
    ++ " * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Erasure subset header package text (banner + erasureHeaderFragment).
    Greppable: erasureSubsetHeaderPackage, slake_erasure_subset.h. -/
def erasureSubsetHeaderPackage : String :=
  erasureSubsetHeaderBanner ++ erasureHeaderFragment

/-- Erasure subset source package text (banner + erasureBodyFragment).
    Greppable: erasureSubsetSourcePackage, slake_erasure_subset.c. -/
def erasureSubsetSourcePackage : String :=
  erasureSubsetSourceBanner ++ erasureBodyFragment

/-- Package text honesty: banners + Erasure dialect pieces present.
    Greppable: erasureSubsetEmitPackageOk. -/
def erasureSubsetEmitPackageOk : Bool :=
  erasureSubsetEmitErasureDialectOk
    && (emitHeaderBase == "slake_erasure_subset.h")
    && (emitSourceBase == "slake_erasure_subset.c")
    && (erasureSubsetHeaderBanner
      == "/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0\n"
        ++ " * Host-built Erasure subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_ERASURE_SUBSET_ERASURE (COMPILE-PATH-ERASURE / ERASURE-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-ERASURE (EmitErasure; no second Erasure dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Erasure unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC on this Erasure subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (erasureSubsetSourceBanner
      == "/* ERASURE-SUBSET-EMIT / SLAKE_ERASURE_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Erasure subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_ERASURE_SUBSET_ERASURE; dialect HOST-EMIT-ERASURE.\n"
        ++ " * Not full slake_freestanding.c regenerate; Erasure unit only.\n"
        ++ " * RUNTIME-FS; ERASE-RULE-MULT-0; ERASE-NO-RUNTIME; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Erasure subset emit (Erasure fixture input + Erasure
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: erasureSubsetEmitReady, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT. -/
def erasureSubsetEmitReady : Bool :=
  erasureSubsetEmitInputReady
    && erasureSubsetEmitErasureDialectOk
    && erasureSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !erasureSubsetEmitResidualFreeClaimed
    && !erasureSubsetEmitProductSelfHostCompleteClaimed
    && !erasureSubsetEmitProofCompleteClaimed
    && !erasureSubsetEmitLlvmUnlocked
    && !erasureSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_ERASURE_SUBSET_EMIT_V0")
    && (hostId == "HOST-ERASURE-SUBSET-EMIT")
    && (surfaceId == "ERASURE-SUBSET-EMIT")
    && (erasureSubsetEmitInputId == "SLAKE_ERASURE_SUBSET_ERASURE")
    && (lakeExeName == "slake-erasure-subset-emit")
    && (justRecipe == "erasure-subset-emit")

/-- erasureSubsetEmitReady does not retire Lake (S4 only).
    Greppable: erasureSubsetEmitDoesNotRetireLake. -/
def erasureSubsetEmitDoesNotRetireLake : Bool :=
  erasureSubsetEmitReady && stillUsesLake && dependsOnLake

/-- erasureSubsetEmitReady is not product residual free claim.
    Greppable: erasureSubsetEmitDoesNotMeanResidualFree. -/
def erasureSubsetEmitDoesNotMeanResidualFree : Bool :=
  erasureSubsetEmitReady && !erasureSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Erasure subset text equals
    banner + HOST-EMIT-ERASURE fragments. NOT filesystem write proof.
    Actual on-disk write: erasureSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateErasureSubsetPackage; host gate just erasure-subset-emit
    greps emit/slake_erasure_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: erasureSubsetEmitWroteExpected (structural package pin). -/
def erasureSubsetEmitWroteExpected : Bool :=
  erasureSubsetEmitPackageOk
    && (erasureSubsetHeaderPackage == erasureSubsetHeaderBanner ++ erasureHeaderFragment)
    && (erasureSubsetSourcePackage == erasureSubsetSourceBanner ++ erasureBodyFragment)

/-! ### ERASURE-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Erasure unit input ready for subset emit.
    Greppable: erasureSubsetEmitInputReady_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitInputReady_true :
    erasureSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-ERASURE dialect ok for subset package.
    Greppable: erasureSubsetEmitErasureDialectOk_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitErasureDialectOk_true :
    erasureSubsetEmitErasureDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: erasureSubsetEmitPackageOk_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitPackageOk_true :
    erasureSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: erasureSubsetEmitWroteExpected_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitWroteExpected_true :
    erasureSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Erasure subset emit structural ready (ideal ladder M1).
    Greppable: erasureSubsetEmitReady_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitReady_true : erasureSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: erasureSubsetEmitDoesNotRetireLake_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitDoesNotRetireLake_true :
    erasureSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: erasureSubsetEmitDoesNotMeanResidualFree_true, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmitDoesNotMeanResidualFree_true :
    erasureSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: erasureSubsetEmit_claims_false, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmit_claims_false :
    (erasureSubsetEmitResidualFreeClaimed = false)
      /\ (erasureSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (erasureSubsetEmitProofCompleteClaimed = false)
      /\ (erasureSubsetEmitLlvmUnlocked = false)
      /\ (erasureSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: erasureSubsetEmit_ids_eq, ERASURE-SUBSET-EMIT-THEOREM. -/
theorem erasureSubsetEmit_ids_eq :
    (stageId = "SLAKE_ERASURE_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-ERASURE-SUBSET-EMIT")
      /\ (surfaceId = "ERASURE-SUBSET-EMIT")
      /\ (erasureSubsetEmitInputId = "SLAKE_ERASURE_SUBSET_ERASURE")
      /\ (lakeExeName = "slake-erasure-subset-emit")
      /\ (justRecipe = "erasure-subset-emit")
      /\ (emitHeaderBase = "slake_erasure_subset.h")
      /\ (emitSourceBase = "slake_erasure_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### ERASURE-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: ERASURE-SUBSET-EMIT-SMOKE, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_ERASURE. -/

/-- ERASURE-SUBSET-EMIT-SMOKE: Erasure input + Erasure dialect + package + write pin. -/
example : erasureSubsetEmitInputReady = true := by native_decide
example : erasureSubsetEmitErasureDialectOk = true := by native_decide
example : erasureSubsetEmitPackageOk = true := by native_decide
example : erasureSubsetEmitWroteExpected = true := by native_decide

/-- ERASURE-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : erasureSubsetEmitReady = true := by native_decide
example : erasureSubsetEmitDoesNotRetireLake = true := by native_decide
example : erasureSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : erasureSubsetEmitResidualFreeClaimed = false := rfl
example : erasureSubsetEmitLlvmUnlocked = false := rfl
example : erasureSubsetEmitProvablyUnlocked = false := rfl
example : erasureSubsetEmitInputId = "SLAKE_ERASURE_SUBSET_ERASURE" := rfl
example : lakeExeName = "slake-erasure-subset-emit" := rfl
example : emitHeaderBase = "slake_erasure_subset.h" := rfl
example : emitSourceBase = "slake_erasure_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Erasure subset package lacks greppable honesty tokens. -/
def validateErasureSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "ERASURE-SUBSET-EMIT"
    , "SLAKE_ERASURE_SUBSET_EMIT_V0"
    , "SLAKE_ERASURE_SUBSET_ERASURE"
    , "HOST-EMIT-ERASURE"
    , "RUNTIME-FS"
    , "no product GC"
    , "ERASE-RULE-MULT-0"
    , "ERASE-NO-RUNTIME"
    , "slake_erased"
    , "slake_erasure_is_runtime_absent"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_erased_mark" do
      IO.eprintln s!"error: {label}: missing slake_erased_mark body"
      throw (IO.userError s!"{label}: missing erased_mark body")
    unless containsSub text "slake_erasure_is_runtime_absent" do
      IO.eprintln s!"error: {label}: missing slake_erasure_is_runtime_absent body"
      throw (IO.userError s!"{label}: missing erasure_is_runtime_absent body")
  else
    unless containsSub text "typedef struct slake_erased" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_erased"
      throw (IO.userError s!"{label}: missing erased typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Erasure subset freestanding C unit package under root/src/systems/emit.
    Reuses Erasure fixture input identity + HOST-EMIT-ERASURE fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: erasureSubsetEmitWrite,
    slake_erasure_subset.h, slake_erasure_subset.c, IO.FS.writeFile. -/
def erasureSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless erasureSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: erasureSubsetEmitReady false"
    throw (IO.userError "erasureSubsetEmitReady false")
  unless erasureSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: erasureSubsetEmitWroteExpected false"
    throw (IO.userError "erasureSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Erasure subset freestanding emit (ideal ladder M1) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  Erasure unit input id: {erasureSubsetEmitInputId} (COMPILE-PATH-ERASURE reuse)"
  IO.println s!"  erasureSubsetEmitInputReady: {erasureSubsetEmitInputReady} (erasureFixtureCompilePathReady)"
  IO.println s!"  erasureSubsetEmitErasureDialectOk: {erasureSubsetEmitErasureDialectOk} (HOST-EMIT-ERASURE)"
  IO.println s!"  erasureSubsetEmitPackageOk: {erasureSubsetEmitPackageOk}"
  IO.println s!"  erasureSubsetEmitReady: {erasureSubsetEmitReady}"
  IO.println s!"  erasureSubsetEmitWroteExpected: {erasureSubsetEmitWroteExpected} (package identity pin)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: M1 = Erasure subset unit package write; not full product-wire regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not Erasure subset rebuild; not S4 Lake retire"
  IO.println "  short module name ErasureSubsetEmit (not ProductPathFreestandingErasureSubset)"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH erasureSubsetHeaderPackage
  IO.FS.writeFile outC erasureSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Erasure subset header ({emitHeaderBase})"
  requireFile outC s!"Erasure subset source ({emitSourceBase})"
  if headerWritten != erasureSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != erasureSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateErasureSubsetPackage emitHeaderBase headerWritten false
  validateErasureSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: Erasure subset freestanding C wrote under {emitDir}/"
  IO.println s!"  wrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  wrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  greppable: ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT_V0, HOST-EMIT-ERASURE, ERASE-RULE-MULT-0"
  IO.println "  honest: subset emit evidence (not sole success via full dialect rewrite)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Erasure subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    erasureSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ErasureSubsetEmit
