/-
  SYSTEMS_LEAN_HOST partial -- Mult subset freestanding emit (bootstrap S2).
  Host-built Slake path: S1 Mult unit input SLAKE_FIRST_SURFACE_MULT -> write
  freestanding Mult unit package (header + body) under emit/, reusing HOST-EMIT-MULT
  dialect (EmitMult fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not S3 self-application. Not S4 Lake retire. Not free/complete flip.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Greppable: SYSTEMS_LEAN_HOST, MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT,
  SLAKE_MULT_SUBSET_EMIT_V0, HOST-MULT-SUBSET-EMIT, multSubsetEmitReady,
  multSubsetEmitInputId, multSubsetEmitWroteExpected, multSubsetEmitReady_true,
  MULT-SUBSET-EMIT-SMOKE, MULT-SUBSET-EMIT-THEOREM, FIRST-SURFACE,
  SLAKE_FIRST_SURFACE_MULT, HOST-EMIT-MULT, emitMultReady, firstSurfaceReady,
  slake-mult-subset-emit, just mult-subset-emit, slake_mult_subset.h,
  slake_mult_subset.c, StillUsesLake, DependsOnLake, RUNTIME-FS,
  UNIT_SURFACE host surface. Module: SystemsLean.MultSubsetEmit
  Short role name (not ProductPathFreestandingBootstrapS2 kitchen-sink).
  Honesty dual evidence: multSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Mult fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe multSubsetEmitWrite (IO.FS.writeFile)
  plus just mult-subset-emit greps on emit/slake_mult_subset.{h,c}. Do not read
  the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.MultSubsetEmit; lake exe slake-mult-subset-emit;
  just mult-subset-emit. Module must stay ASCII.
-/

import SystemsLean.FirstSurface
import SystemsLean.EmitMult

namespace SystemsLean.MultSubsetEmit

open SystemsLean.FirstSurface
open SystemsLean.EmitMult

/-! ### MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT (bootstrap S2)

  Input identity reuses S1 Mult unit `SLAKE_FIRST_SURFACE_MULT` / FirstSurface.
  Output: written Mult freestanding C unit package (header + body fragments from
  HOST-EMIT-MULT), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (bootstrap S2 Mult subset emit). -/
def stageId : String := "SLAKE_MULT_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "MULT-SUBSET-EMIT"

/-- Mult unit input identity (same as S1 FirstSurface Mult input).
    Greppable: multSubsetEmitInputId, SLAKE_FIRST_SURFACE_MULT. -/
def multSubsetEmitInputId : String := firstSurfaceMultInputId

/-- Lake exe name. -/
def lakeExeName : String := "slake-mult-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "mult-subset-emit"

/-- Relative emit header base (Mult unit package only). -/
def emitHeaderBase : String := "slake_mult_subset.h"

/-- Relative emit source base (Mult unit package only). -/
def emitSourceBase : String := "slake_mult_subset.c"

/-- Host elaborator still Lake (bootstrap S2; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: S2 does not claim product residual free flip. -/
def multSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: S2 is not freestanding product self-host complete rebrand. -/
def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: S2 does not claim proof complete. -/
def multSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: S2 does not unlock llvm. -/
def multSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: S2 does not unlock PROVABLY. -/
def multSubsetEmitProvablyUnlocked : Bool := false

/-- S1 Mult input structural readiness reused.
    Greppable: multSubsetEmitInputReady, firstSurfaceReady. -/
def multSubsetEmitInputReady : Bool := firstSurfaceReady

/-- HOST-EMIT-MULT dialect readiness (no second Mult dialect).
    Greppable: multSubsetEmitMultDialectOk, emitMultReady, HOST-EMIT-MULT. -/
def multSubsetEmitMultDialectOk : Bool := emitMultReady

/-- Package banner (header) with greppable S2 honesty; Mult dialect follows. -/
def multSubsetHeaderBanner : String :=
  "/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0\n"
    ++ " * Host-built Mult subset freestanding C (bootstrap S2).\n"
    ++ " * Input: SLAKE_FIRST_SURFACE_MULT (S1 FirstSurface).\n"
    ++ " * Dialect: HOST-EMIT-MULT (EmitMult; no second Mult dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Mult unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; no product GC on this Mult subset package.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable S2 honesty; Mult body follows. -/
def multSubsetSourceBanner : String :=
  "/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Mult subset freestanding C (bootstrap S2).\n"
    ++ " * Input: SLAKE_FIRST_SURFACE_MULT; dialect HOST-EMIT-MULT.\n"
    ++ " * Not full slake_freestanding.c regenerate; Mult unit only.\n"
    ++ " * RUNTIME-FS; no product GC.\n"
    ++ " */\n"
    ++ "\n"

/-- Mult subset header package text (banner + multHeaderFragment).
    Greppable: multSubsetHeaderPackage, slake_mult_subset.h. -/
def multSubsetHeaderPackage : String :=
  multSubsetHeaderBanner ++ multHeaderFragment

/-- Mult subset source package text (banner + multBodyFragment).
    Greppable: multSubsetSourcePackage, slake_mult_subset.c. -/
def multSubsetSourcePackage : String :=
  multSubsetSourceBanner ++ multBodyFragment

/-- Package text honesty: banners + Mult dialect pieces present.
    Greppable: multSubsetEmitPackageOk. -/
def multSubsetEmitPackageOk : Bool :=
  multSubsetEmitMultDialectOk
    && (emitHeaderBase == "slake_mult_subset.h")
    && (emitSourceBase == "slake_mult_subset.c")
    && (multSubsetHeaderBanner
      == "/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0\n"
        ++ " * Host-built Mult subset freestanding C (bootstrap S2).\n"
        ++ " * Input: SLAKE_FIRST_SURFACE_MULT (S1 FirstSurface).\n"
        ++ " * Dialect: HOST-EMIT-MULT (EmitMult; no second Mult dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Mult unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; no product GC on this Mult subset package.\n"
        ++ " */\n"
        ++ "\n")
    && (multSubsetSourceBanner
      == "/* MULT-SUBSET-EMIT / SLAKE_MULT_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Mult subset freestanding C (bootstrap S2).\n"
        ++ " * Input: SLAKE_FIRST_SURFACE_MULT; dialect HOST-EMIT-MULT.\n"
        ++ " * Not full slake_freestanding.c regenerate; Mult unit only.\n"
        ++ " * RUNTIME-FS; no product GC.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Mult subset emit (S1 input + Mult dialect + package pins
    + Lake host + local free/complete/proof/llvm/PROVABLY non-claims).
    Greppable: multSubsetEmitReady, MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT. -/
def multSubsetEmitReady : Bool :=
  multSubsetEmitInputReady
    && multSubsetEmitMultDialectOk
    && multSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !multSubsetEmitResidualFreeClaimed
    && !multSubsetEmitProductSelfHostCompleteClaimed
    && !multSubsetEmitProofCompleteClaimed
    && !multSubsetEmitLlvmUnlocked
    && !multSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_MULT_SUBSET_EMIT_V0")
    && (hostId == "HOST-MULT-SUBSET-EMIT")
    && (surfaceId == "MULT-SUBSET-EMIT")
    && (multSubsetEmitInputId == "SLAKE_FIRST_SURFACE_MULT")
    && (lakeExeName == "slake-mult-subset-emit")
    && (justRecipe == "mult-subset-emit")

/-- multSubsetEmitReady does not retire Lake (S4 only).
    Greppable: multSubsetEmitDoesNotRetireLake. -/
def multSubsetEmitDoesNotRetireLake : Bool :=
  multSubsetEmitReady && stillUsesLake && dependsOnLake

/-- multSubsetEmitReady is not product residual free claim.
    Greppable: multSubsetEmitDoesNotMeanResidualFree. -/
def multSubsetEmitDoesNotMeanResidualFree : Bool :=
  multSubsetEmitReady && !multSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Mult subset text equals
    banner + HOST-EMIT-MULT fragments. NOT filesystem write proof.
    Actual on-disk write: multSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateMultSubsetPackage; host gate just mult-subset-emit greps
    emit/slake_mult_subset.{h,c}. Dual evidence = Lean pin + lake exe / just.
    Greppable: multSubsetEmitWroteExpected (structural package pin). -/
def multSubsetEmitWroteExpected : Bool :=
  multSubsetEmitPackageOk
    && (multSubsetHeaderPackage == multSubsetHeaderBanner ++ multHeaderFragment)
    && (multSubsetSourcePackage == multSubsetSourceBanner ++ multBodyFragment)

/-! ### MULT-SUBSET-EMIT-THEOREM (readable S2 statements, then proofs) -/

set_option maxRecDepth 8192

/-- S1 Mult input ready for subset emit.
    Greppable: multSubsetEmitInputReady_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitInputReady_true :
    multSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-MULT dialect ok for subset package.
    Greppable: multSubsetEmitMultDialectOk_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitMultDialectOk_true :
    multSubsetEmitMultDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: multSubsetEmitPackageOk_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitPackageOk_true :
    multSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: multSubsetEmitWroteExpected_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitWroteExpected_true :
    multSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Mult subset emit structural ready (bootstrap S2).
    Greppable: multSubsetEmitReady_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitReady_true : multSubsetEmitReady = true := by
  native_decide

/-- S2 ready does not retire Lake.
    Greppable: multSubsetEmitDoesNotRetireLake_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitDoesNotRetireLake_true :
    multSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- S2 ready does not claim residual free.
    Greppable: multSubsetEmitDoesNotMeanResidualFree_true, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmitDoesNotMeanResidualFree_true :
    multSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: multSubsetEmit_claims_false, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmit_claims_false :
    (multSubsetEmitResidualFreeClaimed = false)
      /\ (multSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (multSubsetEmitProofCompleteClaimed = false)
      /\ (multSubsetEmitLlvmUnlocked = false)
      /\ (multSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: multSubsetEmit_ids_eq, MULT-SUBSET-EMIT-THEOREM. -/
theorem multSubsetEmit_ids_eq :
    (stageId = "SLAKE_MULT_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-MULT-SUBSET-EMIT")
      /\ (surfaceId = "MULT-SUBSET-EMIT")
      /\ (multSubsetEmitInputId = "SLAKE_FIRST_SURFACE_MULT")
      /\ (lakeExeName = "slake-mult-subset-emit")
      /\ (justRecipe = "mult-subset-emit")
      /\ (emitHeaderBase = "slake_mult_subset.h")
      /\ (emitSourceBase = "slake_mult_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### MULT-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: MULT-SUBSET-EMIT-SMOKE, MULT-SUBSET-EMIT, SLAKE_FIRST_SURFACE_MULT. -/

/-- MULT-SUBSET-EMIT-SMOKE: S1 input + Mult dialect + package + write pin. -/
example : multSubsetEmitInputReady = true := by native_decide
example : multSubsetEmitMultDialectOk = true := by native_decide
example : multSubsetEmitPackageOk = true := by native_decide
example : multSubsetEmitWroteExpected = true := by native_decide

/-- MULT-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : multSubsetEmitReady = true := by native_decide
example : multSubsetEmitDoesNotRetireLake = true := by native_decide
example : multSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : multSubsetEmitResidualFreeClaimed = false := rfl
example : multSubsetEmitLlvmUnlocked = false := rfl
example : multSubsetEmitProvablyUnlocked = false := rfl
example : multSubsetEmitInputId = "SLAKE_FIRST_SURFACE_MULT" := rfl
example : lakeExeName = "slake-mult-subset-emit" := rfl
example : emitHeaderBase = "slake_mult_subset.h" := rfl
example : emitSourceBase = "slake_mult_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Mult subset package lacks greppable honesty tokens. -/
def validateMultSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "MULT-SUBSET-EMIT"
    , "SLAKE_MULT_SUBSET_EMIT_V0"
    , "SLAKE_FIRST_SURFACE_MULT"
    , "HOST-EMIT-MULT"
    , "RUNTIME-FS"
    , "no product GC"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "slake_mult"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_mult_is_valid" do
      IO.eprintln s!"error: {label}: missing slake_mult_is_valid body"
      throw (IO.userError s!"{label}: missing is_valid")
  else
    unless containsSub text "enum slake_mult" do
      IO.eprintln s!"error: {label}: missing enum slake_mult"
      throw (IO.userError s!"{label}: missing enum")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Mult subset freestanding C unit package under root/src/systems/emit.
    Reuses S1 Mult input identity + HOST-EMIT-MULT fragments; does not rewrite
    full slake_freestanding.{c,h}. Greppable: multSubsetEmitWrite,
    slake_mult_subset.h, slake_mult_subset.c, IO.FS.writeFile. -/
def multSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless multSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: multSubsetEmitReady false"
    throw (IO.userError "multSubsetEmitReady false")
  unless multSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: multSubsetEmitWroteExpected false"
    throw (IO.userError "multSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Mult subset freestanding emit (bootstrap S2) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  Mult unit input id: {multSubsetEmitInputId} (S1 FirstSurface reuse)"
  IO.println s!"  multSubsetEmitInputReady: {multSubsetEmitInputReady} (firstSurfaceReady)"
  IO.println s!"  multSubsetEmitMultDialectOk: {multSubsetEmitMultDialectOk} (HOST-EMIT-MULT)"
  IO.println s!"  multSubsetEmitPackageOk: {multSubsetEmitPackageOk}"
  IO.println s!"  multSubsetEmitReady: {multSubsetEmitReady}"
  IO.println s!"  multSubsetEmitWroteExpected: {multSubsetEmitWroteExpected} (package identity pin)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: S2 = Mult subset unit package write; not full product-wire regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not S3 self-application; not S4 Lake retire"
  IO.println "  short module name MultSubsetEmit (not ProductPathFreestandingBootstrapS2)"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH multSubsetHeaderPackage
  IO.FS.writeFile outC multSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Mult subset header ({emitHeaderBase})"
  requireFile outC s!"Mult subset source ({emitSourceBase})"
  if headerWritten != multSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != multSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateMultSubsetPackage emitHeaderBase headerWritten false
  validateMultSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: Mult subset freestanding C wrote under {emitDir}/"
  IO.println s!"  wrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  wrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  greppable: MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT_V0, HOST-EMIT-MULT, MULT-0/1/OMEGA"
  IO.println "  honest: subset emit evidence (not sole success via full dialect rewrite)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Mult subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    multSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.MultSubsetEmit
