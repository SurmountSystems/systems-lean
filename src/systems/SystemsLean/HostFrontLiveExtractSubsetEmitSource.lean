/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ExtractSubsetEmit.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveExtractSubsetEmitSource. Not occupancy name 50.
  Not mill 36 remill. Mill stays 69 of 69.
  This wrap is ExtractSubsetEmit.lean. Theorems and examples in that file are
  skipped by the parser. It is not ExtractSubsetEmitMain.lean.
  HostFrontLiveExtractSubsetEmitMain parses ExtractSubsetEmitMain.lean.
  Do not steal that module.
  Unique needles (trailing newline so HostFrontLiveExtractSubsetEmit is not a
  prefix hit on HostFrontLiveExtractSubsetEmitSource):
  HostFrontLiveExtractSubsetEmitSource
  PARSE-LIVE-EXTRACT-SUBSET-EMIT
  HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT
  EXTRACT-SUBSET-EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveExtractSubsetEmitSource,
  HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveExtractSubsetEmitSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveExtractSubsetEmit

/-- Dual-pinned live ExtractSubsetEmit.lean bytes (must match on-disk file).
    Greppable: liveExtractSubsetEmitSource, HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT. -/
def liveExtractSubsetEmitSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Extract subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Extract unit input (COMPILE-PATH-EXTRACT /
  EXTRACT-RUNTIME-FS / extractRuntimeFsGateReady) -> write freestanding Extract
  unit package (header + body) under emit/, reusing HOST-EMIT-EXTRACT dialect
  (EmitExtract fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Extract subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT,
  SLAKE_EXTRACT_SUBSET_EMIT_V0, HOST-EXTRACT-SUBSET-EMIT, extractSubsetEmitReady,
  extractSubsetEmitInputId, extractSubsetEmitWroteExpected, extractSubsetEmitReady_true,
  EXTRACT-SUBSET-EMIT-SMOKE, EXTRACT-SUBSET-EMIT-THEOREM, COMPILE-PATH-EXTRACT,
  EXTRACT-RUNTIME-FS, SLAKE_EXTRACT_SUBSET_EXTRACT, HOST-EMIT-EXTRACT, emitExtractReady,
  extractRuntimeFsGateReady, slake-extract-subset-emit, just extract-subset-emit,
  slake_extract_subset.h, slake_extract_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, FAIL_CLOSED_CHECKER_V1, UNIT_SURFACE host surface.
  Module: SystemsLean.ExtractSubsetEmit
  Short role name (not ProductPathFreestandingExtractSubset kitchen-sink).
  Honesty dual evidence: extractSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Extract fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe extractSubsetEmitWrite (IO.FS.writeFile)
  plus just extract-subset-emit greps on emit/slake_extract_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ExtractSubsetEmit; lake exe slake-extract-subset-emit;
  just extract-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathExtract
import SystemsLean.EmitExtract

namespace SystemsLean.ExtractSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitExtract

/-! ### EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS structural
  readiness (`extractRuntimeFsGateReady`).
  Output: written Extract freestanding C unit package (header + body fragments
  from HOST-EMIT-EXTRACT), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Extract subset emit). -/
def stageId : String := "SLAKE_EXTRACT_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-EXTRACT-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "EXTRACT-SUBSET-EMIT"

/-- Extract unit input identity (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS content).
    Greppable: extractSubsetEmitInputId, SLAKE_EXTRACT_SUBSET_EXTRACT. -/
def extractSubsetEmitInputId : String := "SLAKE_EXTRACT_SUBSET_EXTRACT"

/-- Lake exe name. -/
def lakeExeName : String := "slake-extract-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "extract-subset-emit"

/-- Relative emit header base (Extract unit package only). -/
def emitHeaderBase : String := "slake_extract_subset.h"

/-- Relative emit source base (Extract unit package only). -/
def emitSourceBase : String := "slake_extract_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def extractSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def extractSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def extractSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def extractSubsetEmitProvablyUnlocked : Bool := false

/-- Extract unit input structural readiness reused.
    Greppable: extractSubsetEmitInputReady, extractRuntimeFsGateReady. -/
def extractSubsetEmitInputReady : Bool := extractRuntimeFsGateReady

/-- HOST-EMIT-EXTRACT dialect readiness (no second Extract dialect).
    Greppable: extractSubsetEmitExtractDialectOk, emitExtractReady, HOST-EMIT-EXTRACT. -/
def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady

/-- Package banner (header) with greppable M1 honesty; Extract dialect follows. -/
def extractSubsetHeaderBanner : String :=
  "/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0\n"
    ++ " * Host-built Extract subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_EXTRACT_SUBSET_EXTRACT (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS).\n"
    ++ " * Dialect: HOST-EMIT-EXTRACT (EmitExtract; no second Extract dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Extract unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC on this Extract subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Extract body follows. -/
def extractSubsetSourceBanner : String :=
  "/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Extract subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_EXTRACT_SUBSET_EXTRACT; dialect HOST-EMIT-EXTRACT.\n"
    ++ " * Not full slake_freestanding.c regenerate; Extract unit only.\n"
    ++ " * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Extract subset header package text (banner + extractHeaderFragment).
    Greppable: extractSubsetHeaderPackage, slake_extract_subset.h. -/
def extractSubsetHeaderPackage : String :=
  extractSubsetHeaderBanner ++ extractHeaderFragment

/-- Extract subset source package text (banner + extractBodyFragment).
    Greppable: extractSubsetSourcePackage, slake_extract_subset.c. -/
def extractSubsetSourcePackage : String :=
  extractSubsetSourceBanner ++ extractBodyFragment

/-- Package text honesty: banners + Extract dialect pieces present.
    Greppable: extractSubsetEmitPackageOk. -/
def extractSubsetEmitPackageOk : Bool :=
  extractSubsetEmitExtractDialectOk
    && (emitHeaderBase == "slake_extract_subset.h")
    && (emitSourceBase == "slake_extract_subset.c")
    && (extractSubsetHeaderBanner
      == "/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0\n"
        ++ " * Host-built Extract subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_EXTRACT_SUBSET_EXTRACT (COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS).\n"
        ++ " * Dialect: HOST-EMIT-EXTRACT (EmitExtract; no second Extract dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Extract unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC on this Extract subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (extractSubsetSourceBanner
      == "/* EXTRACT-SUBSET-EMIT / SLAKE_EXTRACT_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Extract subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_EXTRACT_SUBSET_EXTRACT; dialect HOST-EMIT-EXTRACT.\n"
        ++ " * Not full slake_freestanding.c regenerate; Extract unit only.\n"
        ++ " * RUNTIME-FS; FAIL_CLOSED_CHECKER_V1; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Extract subset emit (Extract gate input + Extract
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: extractSubsetEmitReady, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT. -/
def extractSubsetEmitReady : Bool :=
  extractSubsetEmitInputReady
    && extractSubsetEmitExtractDialectOk
    && extractSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !extractSubsetEmitResidualFreeClaimed
    && !extractSubsetEmitProductSelfHostCompleteClaimed
    && !extractSubsetEmitProofCompleteClaimed
    && !extractSubsetEmitLlvmUnlocked
    && !extractSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_EXTRACT_SUBSET_EMIT_V0")
    && (hostId == "HOST-EXTRACT-SUBSET-EMIT")
    && (surfaceId == "EXTRACT-SUBSET-EMIT")
    && (extractSubsetEmitInputId == "SLAKE_EXTRACT_SUBSET_EXTRACT")
    && (lakeExeName == "slake-extract-subset-emit")
    && (justRecipe == "extract-subset-emit")

/-- extractSubsetEmitReady does not retire Lake (S4 only).
    Greppable: extractSubsetEmitDoesNotRetireLake. -/
def extractSubsetEmitDoesNotRetireLake : Bool :=
  extractSubsetEmitReady && stillUsesLake && dependsOnLake

/-- extractSubsetEmitReady is not product residual free claim.
    Greppable: extractSubsetEmitDoesNotMeanResidualFree. -/
def extractSubsetEmitDoesNotMeanResidualFree : Bool :=
  extractSubsetEmitReady && !extractSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Extract subset text equals
    banner + HOST-EMIT-EXTRACT fragments. NOT filesystem write proof.
    Actual on-disk write: extractSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateExtractSubsetPackage; host gate just extract-subset-emit
    greps emit/slake_extract_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: extractSubsetEmitWroteExpected (structural package pin). -/
def extractSubsetEmitWroteExpected : Bool :=
  extractSubsetEmitPackageOk
    && (extractSubsetHeaderPackage == extractSubsetHeaderBanner ++ extractHeaderFragment)
    && (extractSubsetSourcePackage == extractSubsetSourceBanner ++ extractBodyFragment)

/-! ### EXTRACT-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Extract unit input ready for subset emit.
    Greppable: extractSubsetEmitInputReady_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitInputReady_true :
    extractSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-EXTRACT dialect ok for subset package.
    Greppable: extractSubsetEmitExtractDialectOk_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitExtractDialectOk_true :
    extractSubsetEmitExtractDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: extractSubsetEmitPackageOk_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitPackageOk_true :
    extractSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: extractSubsetEmitWroteExpected_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitWroteExpected_true :
    extractSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Extract subset emit structural ready (ideal ladder M1).
    Greppable: extractSubsetEmitReady_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitReady_true : extractSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: extractSubsetEmitDoesNotRetireLake_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitDoesNotRetireLake_true :
    extractSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: extractSubsetEmitDoesNotMeanResidualFree_true, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmitDoesNotMeanResidualFree_true :
    extractSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: extractSubsetEmit_claims_false, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmit_claims_false :
    (extractSubsetEmitResidualFreeClaimed = false)
      /\ (extractSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (extractSubsetEmitProofCompleteClaimed = false)
      /\ (extractSubsetEmitLlvmUnlocked = false)
      /\ (extractSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: extractSubsetEmit_ids_eq, EXTRACT-SUBSET-EMIT-THEOREM. -/
theorem extractSubsetEmit_ids_eq :
    (stageId = "SLAKE_EXTRACT_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-EXTRACT-SUBSET-EMIT")
      /\ (surfaceId = "EXTRACT-SUBSET-EMIT")
      /\ (extractSubsetEmitInputId = "SLAKE_EXTRACT_SUBSET_EXTRACT")
      /\ (lakeExeName = "slake-extract-subset-emit")
      /\ (justRecipe = "extract-subset-emit")
      /\ (emitHeaderBase = "slake_extract_subset.h")
      /\ (emitSourceBase = "slake_extract_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### EXTRACT-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: EXTRACT-SUBSET-EMIT-SMOKE, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EXTRACT. -/

/-- EXTRACT-SUBSET-EMIT-SMOKE: Extract input + Extract dialect + package + write pin. -/
example : extractSubsetEmitInputReady = true := by native_decide
example : extractSubsetEmitExtractDialectOk = true := by native_decide
example : extractSubsetEmitPackageOk = true := by native_decide
example : extractSubsetEmitWroteExpected = true := by native_decide

/-- EXTRACT-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : extractSubsetEmitReady = true := by native_decide
example : extractSubsetEmitDoesNotRetireLake = true := by native_decide
example : extractSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : extractSubsetEmitResidualFreeClaimed = false := rfl
example : extractSubsetEmitLlvmUnlocked = false := rfl
example : extractSubsetEmitProvablyUnlocked = false := rfl
example : extractSubsetEmitInputId = "SLAKE_EXTRACT_SUBSET_EXTRACT" := rfl
example : lakeExeName = "slake-extract-subset-emit" := rfl
example : emitHeaderBase = "slake_extract_subset.h" := rfl
example : emitSourceBase = "slake_extract_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Extract subset package lacks greppable honesty tokens. -/
def validateExtractSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "EXTRACT-SUBSET-EMIT"
    , "SLAKE_EXTRACT_SUBSET_EMIT_V0"
    , "SLAKE_EXTRACT_SUBSET_EXTRACT"
    , "HOST-EMIT-EXTRACT"
    , "RUNTIME-FS"
    , "no product GC"
    , "FAIL_CLOSED_CHECKER_V1"
    , "slake_extract_status"
    , "slake_check_bundle"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_extract_status_ok" do
      IO.eprintln s!"error: {label}: missing slake_extract_status_ok body"
      throw (IO.userError s!"{label}: missing extract_status_ok body")
    unless containsSub text "slake_extract_with_checks" do
      IO.eprintln s!"error: {label}: missing slake_extract_with_checks body"
      throw (IO.userError s!"{label}: missing extract_with_checks body")
  else
    unless containsSub text "enum slake_extract_status" do
      IO.eprintln s!"error: {label}: missing enum slake_extract_status"
      throw (IO.userError s!"{label}: missing extract_status enum")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Extract subset freestanding C unit package under root/src/systems/emit.
    Reuses Extract gate input identity + HOST-EMIT-EXTRACT fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: extractSubsetEmitWrite,
    slake_extract_subset.h, slake_extract_subset.c, IO.FS.writeFile. -/
def extractSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless extractSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: extractSubsetEmitReady false"
    throw (IO.userError "extractSubsetEmitReady false")
  unless extractSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: extractSubsetEmitWroteExpected false"
    throw (IO.userError "extractSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Extract subset emit =="
  IO.println s!"  readyPin={extractSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH extractSubsetHeaderPackage
  IO.FS.writeFile outC extractSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Extract subset header ({emitHeaderBase})"
  requireFile outC s!"Extract subset source ({emitSourceBase})"
  if headerWritten != extractSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != extractSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateExtractSubsetPackage emitHeaderBase headerWritten false
  validateExtractSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT_V0, HOST-EMIT-EXTRACT, FAIL_CLOSED_CHECKER_V1"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Extract subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    extractSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ExtractSubsetEmit
"#

/-- Live file basename. liveRel is ExtractSubsetEmit.lean. -/
def liveRel : String := "ExtractSubsetEmit.lean"

end SystemsLean.HostFrontLiveExtractSubsetEmit
