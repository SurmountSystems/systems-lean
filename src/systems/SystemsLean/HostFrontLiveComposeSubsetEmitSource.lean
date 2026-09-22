/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ComposeSubsetEmit.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveComposeSubsetEmitSource. Not occupancy name 50. Not mill 70.
  This wrap is ComposeSubsetEmit.lean. It is not ComposeSubsetEmitMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveComposeSubsetEmitSource,
  HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveComposeSubsetEmitSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. The live def composeSubsetEmitLlvmUnlocked stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveComposeSubsetEmit

/-- Dual-pinned live ComposeSubsetEmit.lean bytes (must match on-disk file).
    Greppable: liveComposeSubsetEmitSource, HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT. -/
def liveComposeSubsetEmitSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Compose subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Compose unit input (COMPILE-PATH-COMPOSE /
  COMPOSE-FIXTURE / composeFixtureCompilePathReady) -> write freestanding Compose
  unit package (header + body) under emit/, reusing HOST-EMIT-COMPOSE dialect
  (EmitCompose fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Compose subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Not full CFG/SSA. Not elaborator MULT-1 freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT,
  SLAKE_COMPOSE_SUBSET_EMIT_V0, HOST-COMPOSE-SUBSET-EMIT, composeSubsetEmitReady,
  composeSubsetEmitInputId, composeSubsetEmitWroteExpected, composeSubsetEmitReady_true,
  COMPOSE-SUBSET-EMIT-SMOKE, COMPOSE-SUBSET-EMIT-THEOREM, COMPILE-PATH-COMPOSE,
  COMPOSE-FIXTURE, SLAKE_COMPOSE_SUBSET_COMPOSE, HOST-EMIT-COMPOSE, emitComposeReady,
  composeFixtureCompilePathReady, slake-compose-subset-emit, just compose-subset-emit,
  slake_compose_subset.h, slake_compose_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, HOST_COMPOSE_V0, IR_GRAPH_EDGES_V0, UNIT_SURFACE host surface.
  Module: SystemsLean.ComposeSubsetEmit
  Short role name (not ProductPathFreestandingComposeSubset kitchen-sink).
  Honesty dual evidence: composeSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Compose fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe composeSubsetEmitWrite (IO.FS.writeFile)
  plus just compose-subset-emit greps on emit/slake_compose_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ComposeSubsetEmit; lake exe slake-compose-subset-emit;
  just compose-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathCompose
import SystemsLean.EmitCompose

namespace SystemsLean.ComposeSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitCompose

/-! ### COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE structural
  readiness (`composeFixtureCompilePathReady`).
  Output: written Compose freestanding C unit package (header + body fragments
  from HOST-EMIT-COMPOSE), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Compose subset emit). -/
def stageId : String := "SLAKE_COMPOSE_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-COMPOSE-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "COMPOSE-SUBSET-EMIT"

/-- Compose unit input identity (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE content).
    Greppable: composeSubsetEmitInputId, SLAKE_COMPOSE_SUBSET_COMPOSE. -/
def composeSubsetEmitInputId : String := "SLAKE_COMPOSE_SUBSET_COMPOSE"

/-- Lake exe name. -/
def lakeExeName : String := "slake-compose-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "compose-subset-emit"

/-- Relative emit header base (Compose unit package only). -/
def emitHeaderBase : String := "slake_compose_subset.h"

/-- Relative emit source base (Compose unit package only). -/
def emitSourceBase : String := "slake_compose_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def composeSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def composeSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def composeSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def composeSubsetEmitProvablyUnlocked : Bool := false

/-- Compose unit input structural readiness reused.
    Greppable: composeSubsetEmitInputReady, composeFixtureCompilePathReady. -/
def composeSubsetEmitInputReady : Bool := composeFixtureCompilePathReady

/-- HOST-EMIT-COMPOSE dialect readiness (no second Compose dialect).
    Greppable: composeSubsetEmitComposeDialectOk, emitComposeReady, HOST-EMIT-COMPOSE. -/
def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady

/-- Package banner (header) with greppable M1 honesty; Compose dialect follows. -/
def composeSubsetHeaderBanner : String :=
  "/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0\n"
    ++ " * Host-built Compose subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_COMPOSE_SUBSET_COMPOSE (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-COMPOSE (EmitCompose; no second Compose dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Compose unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC on this Compose subset package.\n"
    ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
    ++ " * Not full CFG/SSA.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Compose body follows. -/
def composeSubsetSourceBanner : String :=
  "/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Compose subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_COMPOSE_SUBSET_COMPOSE; dialect HOST-EMIT-COMPOSE.\n"
    ++ " * Not full slake_freestanding.c regenerate; Compose unit only.\n"
    ++ " * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC.\n"
    ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
    ++ " * Not full CFG/SSA.\n"
    ++ " */\n"
    ++ "\n"

/-- Compose subset header package text (banner + composeHeaderFragment).
    Greppable: composeSubsetHeaderPackage, slake_compose_subset.h. -/
def composeSubsetHeaderPackage : String :=
  composeSubsetHeaderBanner ++ composeHeaderFragment

/-- Compose subset source package text (banner + composeBodyFragment).
    Greppable: composeSubsetSourcePackage, slake_compose_subset.c. -/
def composeSubsetSourcePackage : String :=
  composeSubsetSourceBanner ++ composeBodyFragment

/-- Package text honesty: banners + Compose dialect pieces present.
    Greppable: composeSubsetEmitPackageOk. -/
def composeSubsetEmitPackageOk : Bool :=
  composeSubsetEmitComposeDialectOk
    && (emitHeaderBase == "slake_compose_subset.h")
    && (emitSourceBase == "slake_compose_subset.c")
    && (composeSubsetHeaderBanner
      == "/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0\n"
        ++ " * Host-built Compose subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_COMPOSE_SUBSET_COMPOSE (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-COMPOSE (EmitCompose; no second Compose dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Compose unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC on this Compose subset package.\n"
        ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
        ++ " * Not full CFG/SSA.\n"
        ++ " */\n"
        ++ "\n")
    && (composeSubsetSourceBanner
      == "/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Compose subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_COMPOSE_SUBSET_COMPOSE; dialect HOST-EMIT-COMPOSE.\n"
        ++ " * Not full slake_freestanding.c regenerate; Compose unit only.\n"
        ++ " * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC.\n"
        ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
        ++ " * Not full CFG/SSA.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Compose subset emit (Compose fixture input + Compose
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: composeSubsetEmitReady, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT. -/
def composeSubsetEmitReady : Bool :=
  composeSubsetEmitInputReady
    && composeSubsetEmitComposeDialectOk
    && composeSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !composeSubsetEmitResidualFreeClaimed
    && !composeSubsetEmitProductSelfHostCompleteClaimed
    && !composeSubsetEmitProofCompleteClaimed
    && !composeSubsetEmitLlvmUnlocked
    && !composeSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_COMPOSE_SUBSET_EMIT_V0")
    && (hostId == "HOST-COMPOSE-SUBSET-EMIT")
    && (surfaceId == "COMPOSE-SUBSET-EMIT")
    && (composeSubsetEmitInputId == "SLAKE_COMPOSE_SUBSET_COMPOSE")
    && (lakeExeName == "slake-compose-subset-emit")
    && (justRecipe == "compose-subset-emit")

/-- composeSubsetEmitReady does not retire Lake (S4 only).
    Greppable: composeSubsetEmitDoesNotRetireLake. -/
def composeSubsetEmitDoesNotRetireLake : Bool :=
  composeSubsetEmitReady && stillUsesLake && dependsOnLake

/-- composeSubsetEmitReady is not product residual free claim.
    Greppable: composeSubsetEmitDoesNotMeanResidualFree. -/
def composeSubsetEmitDoesNotMeanResidualFree : Bool :=
  composeSubsetEmitReady && !composeSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Compose subset text equals
    banner + HOST-EMIT-COMPOSE fragments. NOT filesystem write proof.
    Actual on-disk write: composeSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateComposeSubsetPackage; host gate just compose-subset-emit
    greps emit/slake_compose_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: composeSubsetEmitWroteExpected (structural package pin). -/
def composeSubsetEmitWroteExpected : Bool :=
  composeSubsetEmitPackageOk
    && (composeSubsetHeaderPackage == composeSubsetHeaderBanner ++ composeHeaderFragment)
    && (composeSubsetSourcePackage == composeSubsetSourceBanner ++ composeBodyFragment)

/-! ### COMPOSE-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Compose unit input ready for subset emit.
    Greppable: composeSubsetEmitInputReady_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitInputReady_true :
    composeSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-COMPOSE dialect ok for subset package.
    Greppable: composeSubsetEmitComposeDialectOk_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitComposeDialectOk_true :
    composeSubsetEmitComposeDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: composeSubsetEmitPackageOk_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitPackageOk_true :
    composeSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: composeSubsetEmitWroteExpected_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitWroteExpected_true :
    composeSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Compose subset emit structural ready (ideal ladder M1).
    Greppable: composeSubsetEmitReady_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitReady_true : composeSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: composeSubsetEmitDoesNotRetireLake_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitDoesNotRetireLake_true :
    composeSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: composeSubsetEmitDoesNotMeanResidualFree_true, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmitDoesNotMeanResidualFree_true :
    composeSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: composeSubsetEmit_claims_false, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmit_claims_false :
    (composeSubsetEmitResidualFreeClaimed = false)
      /\ (composeSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (composeSubsetEmitProofCompleteClaimed = false)
      /\ (composeSubsetEmitLlvmUnlocked = false)
      /\ (composeSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: composeSubsetEmit_ids_eq, COMPOSE-SUBSET-EMIT-THEOREM. -/
theorem composeSubsetEmit_ids_eq :
    (stageId = "SLAKE_COMPOSE_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-COMPOSE-SUBSET-EMIT")
      /\ (surfaceId = "COMPOSE-SUBSET-EMIT")
      /\ (composeSubsetEmitInputId = "SLAKE_COMPOSE_SUBSET_COMPOSE")
      /\ (lakeExeName = "slake-compose-subset-emit")
      /\ (justRecipe = "compose-subset-emit")
      /\ (emitHeaderBase = "slake_compose_subset.h")
      /\ (emitSourceBase = "slake_compose_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### COMPOSE-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: COMPOSE-SUBSET-EMIT-SMOKE, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_COMPOSE. -/

/-- COMPOSE-SUBSET-EMIT-SMOKE: Compose input + Compose dialect + package + write pin. -/
example : composeSubsetEmitInputReady = true := by native_decide
example : composeSubsetEmitComposeDialectOk = true := by native_decide
example : composeSubsetEmitPackageOk = true := by native_decide
example : composeSubsetEmitWroteExpected = true := by native_decide

/-- COMPOSE-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : composeSubsetEmitReady = true := by native_decide
example : composeSubsetEmitDoesNotRetireLake = true := by native_decide
example : composeSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : composeSubsetEmitResidualFreeClaimed = false := rfl
example : composeSubsetEmitLlvmUnlocked = false := rfl
example : composeSubsetEmitProvablyUnlocked = false := rfl
example : composeSubsetEmitInputId = "SLAKE_COMPOSE_SUBSET_COMPOSE" := rfl
example : lakeExeName = "slake-compose-subset-emit" := rfl
example : emitHeaderBase = "slake_compose_subset.h" := rfl
example : emitSourceBase = "slake_compose_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Compose subset package lacks greppable honesty tokens. -/
def validateComposeSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "COMPOSE-SUBSET-EMIT"
    , "SLAKE_COMPOSE_SUBSET_EMIT_V0"
    , "SLAKE_COMPOSE_SUBSET_COMPOSE"
    , "HOST-EMIT-COMPOSE"
    , "RUNTIME-FS"
    , "no product GC"
    , "HOST_COMPOSE_V0"
    , "IR_GRAPH_EDGES_V0"
    , "slake_host_compose"
    , "slake_host_compose_init"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_host_compose_add_edge" do
      IO.eprintln s!"error: {label}: missing slake_host_compose_add_edge body"
      throw (IO.userError s!"{label}: missing add_edge body")
    unless containsSub text "slake_host_compose_mint" do
      IO.eprintln s!"error: {label}: missing slake_host_compose_mint body"
      throw (IO.userError s!"{label}: missing mint body")
    unless containsSub text "slake_host_compose_check_fail_closed" do
      IO.eprintln s!"error: {label}: missing slake_host_compose_check_fail_closed body"
      throw (IO.userError s!"{label}: missing check_fail_closed body")
  else
    unless containsSub text "typedef struct slake_host_compose" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_host_compose"
      throw (IO.userError s!"{label}: missing host_compose typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Compose subset freestanding C unit package under root/src/systems/emit.
    Reuses Compose fixture input identity + HOST-EMIT-COMPOSE fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: composeSubsetEmitWrite,
    slake_compose_subset.h, slake_compose_subset.c, IO.FS.writeFile. -/
def composeSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless composeSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: composeSubsetEmitReady false"
    throw (IO.userError "composeSubsetEmitReady false")
  unless composeSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: composeSubsetEmitWroteExpected false"
    throw (IO.userError "composeSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Compose subset emit =="
  IO.println s!"  readyPin={composeSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH composeSubsetHeaderPackage
  IO.FS.writeFile outC composeSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Compose subset header ({emitHeaderBase})"
  requireFile outC s!"Compose subset source ({emitSourceBase})"
  if headerWritten != composeSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != composeSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateComposeSubsetPackage emitHeaderBase headerWritten false
  validateComposeSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT_V0, HOST-EMIT-COMPOSE, HOST_COMPOSE_V0"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Compose subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    composeSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ComposeSubsetEmit
"#

end SystemsLean.HostFrontLiveComposeSubsetEmit
