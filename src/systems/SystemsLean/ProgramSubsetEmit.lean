/-
  SYSTEMS_LEAN_HOST partial -- Program subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Program unit input (COMPILE-PATH-PROGRAM /
  PROGRAM-FIXTURE / programFixtureCompilePathReady) -> write freestanding Program
  unit package (header + body) under emit/, reusing HOST-EMIT-PROGRAM dialect
  (EmitProgram fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Program subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT,
  SLAKE_PROGRAM_SUBSET_EMIT_V0, HOST-PROGRAM-SUBSET-EMIT, programSubsetEmitReady,
  programSubsetEmitInputId, programSubsetEmitWroteExpected, programSubsetEmitReady_true,
  PROGRAM-SUBSET-EMIT-SMOKE, PROGRAM-SUBSET-EMIT-THEOREM, COMPILE-PATH-PROGRAM,
  PROGRAM-FIXTURE, SLAKE_PROGRAM_SUBSET_PROGRAM, HOST-EMIT-PROGRAM, emitProgramReady,
  programFixtureCompilePathReady, slake-program-subset-emit, just program-subset-emit,
  slake_program_subset.h, slake_program_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, UNIT_SURFACE host surface. Module: SystemsLean.ProgramSubsetEmit
  Short role name (not ProductPathFreestandingProgramSubset kitchen-sink).
  Honesty dual evidence: programSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Program fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe programSubsetEmitWrite (IO.FS.writeFile)
  plus just program-subset-emit greps on emit/slake_program_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ProgramSubsetEmit; lake exe slake-program-subset-emit;
  just program-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathProgram
import SystemsLean.EmitProgram

namespace SystemsLean.ProgramSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitProgram

/-! ### PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE structural
  readiness (`programFixtureCompilePathReady`).
  Output: written Program freestanding C unit package (header + body fragments
  from HOST-EMIT-PROGRAM), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Program subset emit). -/
def stageId : String := "SLAKE_PROGRAM_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PROGRAM-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "PROGRAM-SUBSET-EMIT"

/-- Program unit input identity (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE content).
    Greppable: programSubsetEmitInputId, SLAKE_PROGRAM_SUBSET_PROGRAM. -/
def programSubsetEmitInputId : String := "SLAKE_PROGRAM_SUBSET_PROGRAM"

/-- Lake exe name. -/
def lakeExeName : String := "slake-program-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "program-subset-emit"

/-- Relative emit header base (Program unit package only). -/
def emitHeaderBase : String := "slake_program_subset.h"

/-- Relative emit source base (Program unit package only). -/
def emitSourceBase : String := "slake_program_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def programSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def programSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def programSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def programSubsetEmitProvablyUnlocked : Bool := false

/-- Program unit input structural readiness reused.
    Greppable: programSubsetEmitInputReady, programFixtureCompilePathReady. -/
def programSubsetEmitInputReady : Bool := programFixtureCompilePathReady

/-- HOST-EMIT-PROGRAM dialect readiness (no second Program dialect).
    Greppable: programSubsetEmitProgramDialectOk, emitProgramReady, HOST-EMIT-PROGRAM. -/
def programSubsetEmitProgramDialectOk : Bool := emitProgramReady

/-- Package banner (header) with greppable M1 honesty; Program dialect follows. -/
def programSubsetHeaderBanner : String :=
  "/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0\n"
    ++ " * Host-built Program subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_PROGRAM_SUBSET_PROGRAM (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-PROGRAM (EmitProgram; no second Program dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Program unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; no product GC on this Program subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Program body follows. -/
def programSubsetSourceBanner : String :=
  "/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Program subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_PROGRAM_SUBSET_PROGRAM; dialect HOST-EMIT-PROGRAM.\n"
    ++ " * Not full slake_freestanding.c regenerate; Program unit only.\n"
    ++ " * RUNTIME-FS; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Program subset header package text (banner + programHeaderFragment).
    Greppable: programSubsetHeaderPackage, slake_program_subset.h. -/
def programSubsetHeaderPackage : String :=
  programSubsetHeaderBanner ++ programHeaderFragment

/-- Program subset source package text (banner + programBodyFragment).
    Greppable: programSubsetSourcePackage, slake_program_subset.c. -/
def programSubsetSourcePackage : String :=
  programSubsetSourceBanner ++ programBodyFragment

/-- Package text honesty: banners + Program dialect pieces present.
    Greppable: programSubsetEmitPackageOk. -/
def programSubsetEmitPackageOk : Bool :=
  programSubsetEmitProgramDialectOk
    && (emitHeaderBase == "slake_program_subset.h")
    && (emitSourceBase == "slake_program_subset.c")
    && (programSubsetHeaderBanner
      == "/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0\n"
        ++ " * Host-built Program subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_PROGRAM_SUBSET_PROGRAM (COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-PROGRAM (EmitProgram; no second Program dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Program unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; no product GC on this Program subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (programSubsetSourceBanner
      == "/* PROGRAM-SUBSET-EMIT / SLAKE_PROGRAM_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Program subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_PROGRAM_SUBSET_PROGRAM; dialect HOST-EMIT-PROGRAM.\n"
        ++ " * Not full slake_freestanding.c regenerate; Program unit only.\n"
        ++ " * RUNTIME-FS; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Program subset emit (Program fixture input + Program
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: programSubsetEmitReady, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT. -/
def programSubsetEmitReady : Bool :=
  programSubsetEmitInputReady
    && programSubsetEmitProgramDialectOk
    && programSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !programSubsetEmitResidualFreeClaimed
    && !programSubsetEmitProductSelfHostCompleteClaimed
    && !programSubsetEmitProofCompleteClaimed
    && !programSubsetEmitLlvmUnlocked
    && !programSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_PROGRAM_SUBSET_EMIT_V0")
    && (hostId == "HOST-PROGRAM-SUBSET-EMIT")
    && (surfaceId == "PROGRAM-SUBSET-EMIT")
    && (programSubsetEmitInputId == "SLAKE_PROGRAM_SUBSET_PROGRAM")
    && (lakeExeName == "slake-program-subset-emit")
    && (justRecipe == "program-subset-emit")

/-- programSubsetEmitReady does not retire Lake (S4 only).
    Greppable: programSubsetEmitDoesNotRetireLake. -/
def programSubsetEmitDoesNotRetireLake : Bool :=
  programSubsetEmitReady && stillUsesLake && dependsOnLake

/-- programSubsetEmitReady is not product residual free claim.
    Greppable: programSubsetEmitDoesNotMeanResidualFree. -/
def programSubsetEmitDoesNotMeanResidualFree : Bool :=
  programSubsetEmitReady && !programSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Program subset text equals
    banner + HOST-EMIT-PROGRAM fragments. NOT filesystem write proof.
    Actual on-disk write: programSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateProgramSubsetPackage; host gate just program-subset-emit
    greps emit/slake_program_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: programSubsetEmitWroteExpected (structural package pin). -/
def programSubsetEmitWroteExpected : Bool :=
  programSubsetEmitPackageOk
    && (programSubsetHeaderPackage == programSubsetHeaderBanner ++ programHeaderFragment)
    && (programSubsetSourcePackage == programSubsetSourceBanner ++ programBodyFragment)

/-! ### PROGRAM-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Program unit input ready for subset emit.
    Greppable: programSubsetEmitInputReady_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitInputReady_true :
    programSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-PROGRAM dialect ok for subset package.
    Greppable: programSubsetEmitProgramDialectOk_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitProgramDialectOk_true :
    programSubsetEmitProgramDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: programSubsetEmitPackageOk_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitPackageOk_true :
    programSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: programSubsetEmitWroteExpected_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitWroteExpected_true :
    programSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Program subset emit structural ready (ideal ladder M1).
    Greppable: programSubsetEmitReady_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitReady_true : programSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: programSubsetEmitDoesNotRetireLake_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitDoesNotRetireLake_true :
    programSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: programSubsetEmitDoesNotMeanResidualFree_true, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmitDoesNotMeanResidualFree_true :
    programSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: programSubsetEmit_claims_false, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmit_claims_false :
    (programSubsetEmitResidualFreeClaimed = false)
      /\ (programSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (programSubsetEmitProofCompleteClaimed = false)
      /\ (programSubsetEmitLlvmUnlocked = false)
      /\ (programSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: programSubsetEmit_ids_eq, PROGRAM-SUBSET-EMIT-THEOREM. -/
theorem programSubsetEmit_ids_eq :
    (stageId = "SLAKE_PROGRAM_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-PROGRAM-SUBSET-EMIT")
      /\ (surfaceId = "PROGRAM-SUBSET-EMIT")
      /\ (programSubsetEmitInputId = "SLAKE_PROGRAM_SUBSET_PROGRAM")
      /\ (lakeExeName = "slake-program-subset-emit")
      /\ (justRecipe = "program-subset-emit")
      /\ (emitHeaderBase = "slake_program_subset.h")
      /\ (emitSourceBase = "slake_program_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### PROGRAM-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: PROGRAM-SUBSET-EMIT-SMOKE, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_PROGRAM. -/

/-- PROGRAM-SUBSET-EMIT-SMOKE: Program input + Program dialect + package + write pin. -/
example : programSubsetEmitInputReady = true := by native_decide
example : programSubsetEmitProgramDialectOk = true := by native_decide
example : programSubsetEmitPackageOk = true := by native_decide
example : programSubsetEmitWroteExpected = true := by native_decide

/-- PROGRAM-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : programSubsetEmitReady = true := by native_decide
example : programSubsetEmitDoesNotRetireLake = true := by native_decide
example : programSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : programSubsetEmitResidualFreeClaimed = false := rfl
example : programSubsetEmitLlvmUnlocked = false := rfl
example : programSubsetEmitProvablyUnlocked = false := rfl
example : programSubsetEmitInputId = "SLAKE_PROGRAM_SUBSET_PROGRAM" := rfl
example : lakeExeName = "slake-program-subset-emit" := rfl
example : emitHeaderBase = "slake_program_subset.h" := rfl
example : emitSourceBase = "slake_program_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Program subset package lacks greppable honesty tokens. -/
def validateProgramSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "PROGRAM-SUBSET-EMIT"
    , "SLAKE_PROGRAM_SUBSET_EMIT_V0"
    , "SLAKE_PROGRAM_SUBSET_PROGRAM"
    , "HOST-EMIT-PROGRAM"
    , "RUNTIME-FS"
    , "no product GC"
    , "IR_PROGRAM_V0"
    , "slake_ir_program"
    , "SLAKE_IR_PROGRAM_CAP"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_ir_program_init" do
      IO.eprintln s!"error: {label}: missing slake_ir_program_init body"
      throw (IO.userError s!"{label}: missing ir_program_init body")
    unless containsSub text "slake_ir_program_push" do
      IO.eprintln s!"error: {label}: missing slake_ir_program_push body"
      throw (IO.userError s!"{label}: missing ir_program_push body")
  else
    unless containsSub text "typedef struct slake_ir_program" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_ir_program"
      throw (IO.userError s!"{label}: missing ir_program typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Program subset freestanding C unit package under root/src/systems/emit.
    Reuses Program fixture input identity + HOST-EMIT-PROGRAM fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: programSubsetEmitWrite,
    slake_program_subset.h, slake_program_subset.c, IO.FS.writeFile. -/
def programSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless programSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: programSubsetEmitReady false"
    throw (IO.userError "programSubsetEmitReady false")
  unless programSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: programSubsetEmitWroteExpected false"
    throw (IO.userError "programSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Program subset emit =="
  IO.println s!"  readyPin={programSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH programSubsetHeaderPackage
  IO.FS.writeFile outC programSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Program subset header ({emitHeaderBase})"
  requireFile outC s!"Program subset source ({emitSourceBase})"
  if headerWritten != programSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != programSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateProgramSubsetPackage emitHeaderBase headerWritten false
  validateProgramSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT_V0, HOST-EMIT-PROGRAM, IR_PROGRAM_V0"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Program subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    programSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProgramSubsetEmit
