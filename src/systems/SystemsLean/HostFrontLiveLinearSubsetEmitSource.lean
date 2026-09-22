/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearSubsetEmit.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearSubsetEmitSource. Not occupancy name 50. Not mill 70.
  This wrap is LinearSubsetEmit.lean. It is not LinearSubsetEmitMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveLinearSubsetEmitSource,
  HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearSubsetEmitSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. The live def linearSubsetEmitLlvmUnlocked stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearSubsetEmit

/-- Dual-pinned live LinearSubsetEmit.lean bytes (must match on-disk file).
    Greppable: liveLinearSubsetEmitSource, HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT. -/
def liveLinearSubsetEmitSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Linear subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Linear unit input (COMPILE-PATH-LINEAR /
  LINEAR-FIXTURE / linearFixtureCompilePathReady) -> write freestanding Linear
  unit package (header + body) under emit/, reusing HOST-EMIT-LINEAR dialect
  (EmitLinear fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Linear subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT,
  SLAKE_LINEAR_SUBSET_EMIT_V0, HOST-LINEAR-SUBSET-EMIT, linearSubsetEmitReady,
  linearSubsetEmitInputId, linearSubsetEmitWroteExpected, linearSubsetEmitReady_true,
  LINEAR-SUBSET-EMIT-SMOKE, LINEAR-SUBSET-EMIT-THEOREM, COMPILE-PATH-LINEAR,
  LINEAR-FIXTURE, SLAKE_LINEAR_SUBSET_LINEAR, HOST-EMIT-LINEAR, emitLinearReady,
  linearFixtureCompilePathReady, slake-linear-subset-emit, just linear-subset-emit,
  slake_linear_subset.h, slake_linear_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, UNIT_SURFACE host surface. Module: SystemsLean.LinearSubsetEmit
  Short role name (not ProductPathFreestandingLinearSubset kitchen-sink).
  Honesty dual evidence: linearSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Linear fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe linearSubsetEmitWrite (IO.FS.writeFile)
  plus just linear-subset-emit greps on emit/slake_linear_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.LinearSubsetEmit; lake exe slake-linear-subset-emit;
  just linear-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathLinear
import SystemsLean.EmitLinear

namespace SystemsLean.LinearSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitLinear

/-! ### LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-LINEAR / LINEAR-FIXTURE structural
  readiness (`linearFixtureCompilePathReady`).
  Output: written Linear freestanding C unit package (header + body fragments
  from HOST-EMIT-LINEAR), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Linear subset emit). -/
def stageId : String := "SLAKE_LINEAR_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LINEAR-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "LINEAR-SUBSET-EMIT"

/-- Linear unit input identity (COMPILE-PATH-LINEAR / LINEAR-FIXTURE content).
    Greppable: linearSubsetEmitInputId, SLAKE_LINEAR_SUBSET_LINEAR. -/
def linearSubsetEmitInputId : String := "SLAKE_LINEAR_SUBSET_LINEAR"

/-- Lake exe name. -/
def lakeExeName : String := "slake-linear-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "linear-subset-emit"

/-- Relative emit header base (Linear unit package only). -/
def emitHeaderBase : String := "slake_linear_subset.h"

/-- Relative emit source base (Linear unit package only). -/
def emitSourceBase : String := "slake_linear_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def linearSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def linearSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def linearSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def linearSubsetEmitProvablyUnlocked : Bool := false

/-- Linear unit input structural readiness reused.
    Greppable: linearSubsetEmitInputReady, linearFixtureCompilePathReady. -/
def linearSubsetEmitInputReady : Bool := linearFixtureCompilePathReady

/-- HOST-EMIT-LINEAR dialect readiness (no second Linear dialect).
    Greppable: linearSubsetEmitLinearDialectOk, emitLinearReady, HOST-EMIT-LINEAR. -/
def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady

/-- Package banner (header) with greppable M1 honesty; Linear dialect follows. -/
def linearSubsetHeaderBanner : String :=
  "/* LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT_V0\n"
    ++ " * Host-built Linear subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_LINEAR_SUBSET_LINEAR (COMPILE-PATH-LINEAR / LINEAR-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-LINEAR (EmitLinear; no second Linear dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Linear unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; no product GC on this Linear subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Linear body follows. -/
def linearSubsetSourceBanner : String :=
  "/* LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Linear subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_LINEAR_SUBSET_LINEAR; dialect HOST-EMIT-LINEAR.\n"
    ++ " * Not full slake_freestanding.c regenerate; Linear unit only.\n"
    ++ " * RUNTIME-FS; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Linear subset header package text (banner + linearHeaderFragment).
    Greppable: linearSubsetHeaderPackage, slake_linear_subset.h. -/
def linearSubsetHeaderPackage : String :=
  linearSubsetHeaderBanner ++ linearHeaderFragment

/-- Linear subset source package text (banner + linearBodyFragment).
    Greppable: linearSubsetSourcePackage, slake_linear_subset.c. -/
def linearSubsetSourcePackage : String :=
  linearSubsetSourceBanner ++ linearBodyFragment

/-- Package text honesty: banners + Linear dialect pieces present.
    Greppable: linearSubsetEmitPackageOk. -/
def linearSubsetEmitPackageOk : Bool :=
  linearSubsetEmitLinearDialectOk
    && (emitHeaderBase == "slake_linear_subset.h")
    && (emitSourceBase == "slake_linear_subset.c")
    && (linearSubsetHeaderBanner
      == "/* LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT_V0\n"
        ++ " * Host-built Linear subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_LINEAR_SUBSET_LINEAR (COMPILE-PATH-LINEAR / LINEAR-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-LINEAR (EmitLinear; no second Linear dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Linear unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; no product GC on this Linear subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (linearSubsetSourceBanner
      == "/* LINEAR-SUBSET-EMIT / SLAKE_LINEAR_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Linear subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_LINEAR_SUBSET_LINEAR; dialect HOST-EMIT-LINEAR.\n"
        ++ " * Not full slake_freestanding.c regenerate; Linear unit only.\n"
        ++ " * RUNTIME-FS; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Linear subset emit (Linear fixture input + Linear
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: linearSubsetEmitReady, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT. -/
def linearSubsetEmitReady : Bool :=
  linearSubsetEmitInputReady
    && linearSubsetEmitLinearDialectOk
    && linearSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !linearSubsetEmitResidualFreeClaimed
    && !linearSubsetEmitProductSelfHostCompleteClaimed
    && !linearSubsetEmitProofCompleteClaimed
    && !linearSubsetEmitLlvmUnlocked
    && !linearSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_LINEAR_SUBSET_EMIT_V0")
    && (hostId == "HOST-LINEAR-SUBSET-EMIT")
    && (surfaceId == "LINEAR-SUBSET-EMIT")
    && (linearSubsetEmitInputId == "SLAKE_LINEAR_SUBSET_LINEAR")
    && (lakeExeName == "slake-linear-subset-emit")
    && (justRecipe == "linear-subset-emit")

/-- linearSubsetEmitReady does not retire Lake (S4 only).
    Greppable: linearSubsetEmitDoesNotRetireLake. -/
def linearSubsetEmitDoesNotRetireLake : Bool :=
  linearSubsetEmitReady && stillUsesLake && dependsOnLake

/-- linearSubsetEmitReady is not product residual free claim.
    Greppable: linearSubsetEmitDoesNotMeanResidualFree. -/
def linearSubsetEmitDoesNotMeanResidualFree : Bool :=
  linearSubsetEmitReady && !linearSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Linear subset text equals
    banner + HOST-EMIT-LINEAR fragments. NOT filesystem write proof.
    Actual on-disk write: linearSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateLinearSubsetPackage; host gate just linear-subset-emit
    greps emit/slake_linear_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: linearSubsetEmitWroteExpected (structural package pin). -/
def linearSubsetEmitWroteExpected : Bool :=
  linearSubsetEmitPackageOk
    && (linearSubsetHeaderPackage == linearSubsetHeaderBanner ++ linearHeaderFragment)
    && (linearSubsetSourcePackage == linearSubsetSourceBanner ++ linearBodyFragment)

/-! ### LINEAR-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Linear unit input ready for subset emit.
    Greppable: linearSubsetEmitInputReady_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitInputReady_true :
    linearSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-LINEAR dialect ok for subset package.
    Greppable: linearSubsetEmitLinearDialectOk_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitLinearDialectOk_true :
    linearSubsetEmitLinearDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: linearSubsetEmitPackageOk_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitPackageOk_true :
    linearSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: linearSubsetEmitWroteExpected_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitWroteExpected_true :
    linearSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Linear subset emit structural ready (ideal ladder M1).
    Greppable: linearSubsetEmitReady_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitReady_true : linearSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: linearSubsetEmitDoesNotRetireLake_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitDoesNotRetireLake_true :
    linearSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: linearSubsetEmitDoesNotMeanResidualFree_true, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmitDoesNotMeanResidualFree_true :
    linearSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: linearSubsetEmit_claims_false, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmit_claims_false :
    (linearSubsetEmitResidualFreeClaimed = false)
      /\ (linearSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (linearSubsetEmitProofCompleteClaimed = false)
      /\ (linearSubsetEmitLlvmUnlocked = false)
      /\ (linearSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: linearSubsetEmit_ids_eq, LINEAR-SUBSET-EMIT-THEOREM. -/
theorem linearSubsetEmit_ids_eq :
    (stageId = "SLAKE_LINEAR_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-LINEAR-SUBSET-EMIT")
      /\ (surfaceId = "LINEAR-SUBSET-EMIT")
      /\ (linearSubsetEmitInputId = "SLAKE_LINEAR_SUBSET_LINEAR")
      /\ (lakeExeName = "slake-linear-subset-emit")
      /\ (justRecipe = "linear-subset-emit")
      /\ (emitHeaderBase = "slake_linear_subset.h")
      /\ (emitSourceBase = "slake_linear_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### LINEAR-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: LINEAR-SUBSET-EMIT-SMOKE, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_LINEAR. -/

/-- LINEAR-SUBSET-EMIT-SMOKE: Linear input + Linear dialect + package + write pin. -/
example : linearSubsetEmitInputReady = true := by native_decide
example : linearSubsetEmitLinearDialectOk = true := by native_decide
example : linearSubsetEmitPackageOk = true := by native_decide
example : linearSubsetEmitWroteExpected = true := by native_decide

/-- LINEAR-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : linearSubsetEmitReady = true := by native_decide
example : linearSubsetEmitDoesNotRetireLake = true := by native_decide
example : linearSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : linearSubsetEmitResidualFreeClaimed = false := rfl
example : linearSubsetEmitLlvmUnlocked = false := rfl
example : linearSubsetEmitProvablyUnlocked = false := rfl
example : linearSubsetEmitInputId = "SLAKE_LINEAR_SUBSET_LINEAR" := rfl
example : lakeExeName = "slake-linear-subset-emit" := rfl
example : emitHeaderBase = "slake_linear_subset.h" := rfl
example : emitSourceBase = "slake_linear_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Linear subset package lacks greppable honesty tokens. -/
def validateLinearSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "LINEAR-SUBSET-EMIT"
    , "SLAKE_LINEAR_SUBSET_EMIT_V0"
    , "SLAKE_LINEAR_SUBSET_LINEAR"
    , "HOST-EMIT-LINEAR"
    , "RUNTIME-FS"
    , "no product GC"
    , "LINEAR-EXACT-ONCE"
    , "CONSUME_TOKEN_HOST_V0"
    , "slake_linear_token"
    , "slake_linear_consume"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_consume_token_consume" do
      IO.eprintln s!"error: {label}: missing slake_consume_token_consume body"
      throw (IO.userError s!"{label}: missing consume body")
  else
    unless containsSub text "typedef struct slake_linear_token" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_linear_token"
      throw (IO.userError s!"{label}: missing linear_token typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Linear subset freestanding C unit package under root/src/systems/emit.
    Reuses Linear fixture input identity + HOST-EMIT-LINEAR fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: linearSubsetEmitWrite,
    slake_linear_subset.h, slake_linear_subset.c, IO.FS.writeFile. -/
def linearSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless linearSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: linearSubsetEmitReady false"
    throw (IO.userError "linearSubsetEmitReady false")
  unless linearSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: linearSubsetEmitWroteExpected false"
    throw (IO.userError "linearSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Linear subset emit =="
  IO.println s!"  readyPin={linearSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH linearSubsetHeaderPackage
  IO.FS.writeFile outC linearSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Linear subset header ({emitHeaderBase})"
  requireFile outC s!"Linear subset source ({emitSourceBase})"
  if headerWritten != linearSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != linearSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateLinearSubsetPackage emitHeaderBase headerWritten false
  validateLinearSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT_V0, HOST-EMIT-LINEAR, LINEAR-EXACT-ONCE"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Linear subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    linearSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LinearSubsetEmit
"#

end SystemsLean.HostFrontLiveLinearSubsetEmit
