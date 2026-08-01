/-
  SYSTEMS_LEAN_HOST partial -- M5 front-end Mult package path (Name B).
  Measured path: SubsetFront accepts Mult subset language golden G1 (classic
  three-node Mult IR), then Mult unit package write runs and dual-checks
  emit/slake_mult_subset.{h,c}. Not only fixed Mult fixtures as sole driver;
  front-end accept is the measured gate. Lake host remains (stillUsesLake /
  dependsOnLake true until S4 / M6). Not multi-unit package join (Name A;
  subsetPackageJoinFinishedClaimed stays true, orthogonal). Not Name C
  without-Lake multi-unit forge. Not freestanding residual free. Not freestanding
  emit residual free. Not freestanding product self-host complete rebrand. Not PROVABLY.
  Not llvm unlock. Not S4 Lake retire. Not freestandingDriverComplete flip
  (Mult Path A orthogonal). Not M4 product-wire pin flip. Not hand product C.
  Not freestanding emit.
  Greppable: SYSTEMS_LEAN_HOST, FRONT-MULT-PACKAGE, SLAKE_FRONT_MULT_PACKAGE,
  SLAKE_FRONT_MULT_PACKAGE_V0, HOST-FRONT-MULT-PACKAGE, frontMultPackageReady,
  frontMultPackageFinishedClaimed, frontMultPackageG1Ready,
  justRecipeFrontMultPackage, front-mult-package, frontMultPackageKeepsHostLake,
  FRONT-MULT-PACKAGE-SMOKE, FRONT-MULT-PACKAGE-THEOREM, subsetFrontGoodG1,
  subsetFrontReady, multSubsetEmitReady, multSubsetEmitWroteExpected,
  multSubsetRebuildReady, StillUsesLake, DependsOnLake, RUNTIME-FS,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA, goldens/mult-front,
  SLAKE_MULT_SUBSET_EMIT_V0, slake_mult_subset.h, slake_mult_subset.c,
  slake-front-mult-package, just front-mult-package.
  Module: SystemsLean.FrontMultPackage
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins (G1 accept + Mult package ready) + lake
  exe / just front-mult-package (accept G1 then Mult package write + greps).
  Red/green: lake build SystemsLean.FrontMultPackage; lake exe slake-front-mult-package;
  just front-mult-package. Module must stay ASCII.
-/

import SystemsLean.SubsetFront
import SystemsLean.MultSubsetEmit
import SystemsLean.MultSubsetRebuild

namespace SystemsLean.FrontMultPackage

open SystemsLean.SubsetFront
open SystemsLean.MultSubsetEmit
open SystemsLean.MultSubsetRebuild

/-! ### FRONT-MULT-PACKAGE / SLAKE_FRONT_MULT_PACKAGE (ideal ladder M5 Name B)

  Input: SubsetFront-accepted Mult subset language golden G1.
  Output: Mult unit package write/rebuild measured after front-end accept.
-/

/-- Greppable primary stage id (M5 front-end Mult package path). -/
def stageId : String := "SLAKE_FRONT_MULT_PACKAGE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-MULT-PACKAGE"

/-- Short surface name (product role). -/
def surfaceId : String := "FRONT-MULT-PACKAGE"

/-- Lake exe name. -/
def lakeExeName : String := "slake-front-mult-package"

/-- just recipe name.
    Greppable: justRecipeFrontMultPackage, front-mult-package. -/
def justRecipeFrontMultPackage : String := "front-mult-package"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeFrontMultPackage

/-- Host elaborator still Lake (M5 Name B; S4 / M6 only retires product pins).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M5 Name B does not claim product residual free flip. -/
def frontMultPackageResidualFreeClaimed : Bool := false

/-- Local honesty: M5 Name B is not freestanding product self-host complete rebrand. -/
def frontMultPackageProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M5 Name B does not claim proof complete. -/
def frontMultPackageProofCompleteClaimed : Bool := false

/-- Local honesty: M5 Name B does not unlock llvm. -/
def frontMultPackageLlvmUnlocked : Bool := false

/-- Local honesty: M5 Name B does not unlock PROVABLY. -/
def frontMultPackageProvablyUnlocked : Bool := false

/-- G1 Mult golden accept structural pin (SubsetFront parse+check).
    Greppable: frontMultPackageG1Ready, subsetFrontGoodG1. -/
def frontMultPackageG1Ready : Bool := subsetFrontGoodG1

/-- Mult unit package structural ready (emit + rebuild identity).
    Greppable: frontMultPackageMultReady, multSubsetEmitReady,
    multSubsetRebuildReady. -/
def frontMultPackageMultReady : Bool :=
  multSubsetEmitReady
    && multSubsetEmitWroteExpected
    && multSubsetRebuildReady

/-- Local M5 Name B finished pin (front-end G1 + Mult package path compose).
    Greppable: frontMultPackageFinishedClaimed, FRONT-MULT-PACKAGE. -/
def frontMultPackageFinishedClaimed : Bool := true

/-- Preferred honesty: Name B finished does not retire product Lake host.
    Greppable: frontMultPackageKeepsHostLake. -/
def frontMultPackageKeepsHostLake : Bool :=
  frontMultPackageFinishedClaimed && stillUsesLake && dependsOnLake

/-- Structural ready for front-end Mult package path measure.
    Greppable: frontMultPackageReady, FRONT-MULT-PACKAGE,
    SLAKE_FRONT_MULT_PACKAGE. -/
def frontMultPackageReady : Bool :=
  frontMultPackageG1Ready
    && subsetFrontReady
    && frontMultPackageMultReady
    && frontMultPackageFinishedClaimed
    && frontMultPackageKeepsHostLake
    && stillUsesLake
    && dependsOnLake
    && !frontMultPackageResidualFreeClaimed
    && !frontMultPackageProductSelfHostCompleteClaimed
    && !frontMultPackageProofCompleteClaimed
    && !frontMultPackageLlvmUnlocked
    && !frontMultPackageProvablyUnlocked
    && (stageId == "SLAKE_FRONT_MULT_PACKAGE_V0")
    && (hostId == "HOST-FRONT-MULT-PACKAGE")
    && (surfaceId == "FRONT-MULT-PACKAGE")
    && (lakeExeName == "slake-front-mult-package")
    && (justRecipeFrontMultPackage == "front-mult-package")
    && (justRecipe == "front-mult-package")

/-- Ready does not retire Lake (S4 / M6 only).
    Greppable: frontMultPackageDoesNotRetireLake. -/
def frontMultPackageDoesNotRetireLake : Bool :=
  frontMultPackageReady && stillUsesLake && dependsOnLake

/-- Ready is not product residual free claim.
    Greppable: frontMultPackageDoesNotMeanResidualFree. -/
def frontMultPackageDoesNotMeanResidualFree : Bool :=
  frontMultPackageReady && !frontMultPackageResidualFreeClaimed

/-! ### FRONT-MULT-PACKAGE-THEOREM (readable M5 Name B statements, then proofs) -/

set_option maxRecDepth 8192

/-- G1 Mult golden accepts (SubsetFront).
    Greppable: frontMultPackageG1Ready_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageG1Ready_true :
    frontMultPackageG1Ready = true := by
  native_decide

/-- Mult package emit/rebuild structural ready.
    Greppable: frontMultPackageMultReady_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageMultReady_true :
    frontMultPackageMultReady = true := by
  native_decide

/-- M5 Name B finished claimed.
    Greppable: frontMultPackageFinishedClaimed_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageFinishedClaimed_true :
    frontMultPackageFinishedClaimed = true :=
  rfl

/-- Name B keeps product Lake host residual.
    Greppable: frontMultPackageKeepsHostLake_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageKeepsHostLake_true :
    frontMultPackageKeepsHostLake = true := by
  native_decide

/-- Structural front-end Mult package path ready.
    Greppable: frontMultPackageReady_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageReady_true :
    frontMultPackageReady = true := by
  native_decide

/-- Host Lake honesty pins true.
    Greppable: frontMultPackage_stillUsesLake_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackage_stillUsesLake_true : stillUsesLake = true := rfl

theorem frontMultPackage_dependsOnLake_true : dependsOnLake = true := rfl

/-- just recipe name pin.
    Greppable: justRecipeFrontMultPackage_eq, FRONT-MULT-PACKAGE-THEOREM. -/
theorem justRecipeFrontMultPackage_eq :
    justRecipeFrontMultPackage = "front-mult-package" :=
  rfl

/-- Stage / host / surface / exe ids.
    Greppable: frontMultPackage_ids_eq, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackage_ids_eq :
    (stageId = "SLAKE_FRONT_MULT_PACKAGE_V0")
      /\ (hostId = "HOST-FRONT-MULT-PACKAGE")
      /\ (surfaceId = "FRONT-MULT-PACKAGE")
      /\ (lakeExeName = "slake-front-mult-package")
      /\ (justRecipe = "front-mult-package") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl (And.intro rfl rfl)))

/-- Ready does not retire Lake.
    Greppable: frontMultPackageDoesNotRetireLake_true, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageDoesNotRetireLake_true :
    frontMultPackageDoesNotRetireLake = true := by
  native_decide

/-- Ready is not residual free claim.
    Greppable: frontMultPackageDoesNotMeanResidualFree_true,
    FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackageDoesNotMeanResidualFree_true :
    frontMultPackageDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY non-claims false.
    Greppable: frontMultPackage_claims_false, FRONT-MULT-PACKAGE-THEOREM. -/
theorem frontMultPackage_claims_false :
    frontMultPackageResidualFreeClaimed = false
      && frontMultPackageProductSelfHostCompleteClaimed = false
      && frontMultPackageProofCompleteClaimed = false
      && frontMultPackageLlvmUnlocked = false
      && frontMultPackageProvablyUnlocked = false :=
  rfl

/-! ### FRONT-MULT-PACKAGE-SMOKE (quick examples) -/

example : frontMultPackageG1Ready = true := by native_decide
example : frontMultPackageMultReady = true := by native_decide
example : frontMultPackageFinishedClaimed = true := rfl
example : frontMultPackageReady = true := by native_decide
example : frontMultPackageKeepsHostLake = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : justRecipeFrontMultPackage = "front-mult-package" := rfl
example : lakeExeName = "slake-front-mult-package" := rfl
example : subsetFrontGoodG1 = true := by native_decide
example : multSubsetEmitReady = true := by native_decide
example : multSubsetRebuildReady = true := by native_decide

/-! ### Driver (short banners only; AGENTS driver stdout policy)

  Measured path: dual-pin G1 golden accept via SubsetFront, then Mult unit
  package write (MultSubsetEmit) and dual package validate. Rebuild-ready pin
  is structural dual evidence; write reuses S2 Mult package SSOT after G1 gate.
-/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require path exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Accept Mult golden G1 from disk (dual-pin + parse). Fail-closed.
    Greppable: acceptG1Golden, subsetFrontGoodG1, goldens/mult-front. -/
def acceptG1Golden (root : System.FilePath) : IO Unit := do
  let gpath := root / goldensRel / goodG1File
  requireFile gpath "G1 Mult golden"
  let disk <- IO.FS.readFile gpath
  if disk != goodG1Text then
    IO.eprintln s!"error: dual-pin mismatch G1: on-disk != Lean goodG1Text"
    throw (IO.userError "G1 dual-pin mismatch")
  let r := parseSource disk
  unless acceptOk r do
    IO.eprintln s!"error: G1 expected ACCEPT via SubsetFront"
    throw (IO.userError "G1 accept fail")
  unless r.acceptLength == 3 do
    IO.eprintln s!"error: G1 expected length 3, got {r.acceptLength}"
    throw (IO.userError "G1 length fail")
  unless subsetFrontGoodG1 do
    IO.eprintln s!"error: subsetFrontGoodG1 structural false"
    throw (IO.userError "subsetFrontGoodG1 false")
  IO.println s!"PASS G1 ACCEPT len={r.acceptLength} (SubsetFront)"

/-- Measured front-end Mult package path: G1 accept then Mult package write.
    Greppable: runFrontMultPackage, FRONT-MULT-PACKAGE, multSubsetEmitWrite. -/
def runFrontMultPackage (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: front-end Mult package path =="
  IO.println s!"  surface={surfaceId} host={hostId} recipe={justRecipe}"
  IO.println s!"  structuralReady={frontMultPackageReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  unless frontMultPackageReady do
    IO.eprintln s!"error: {stageId}: frontMultPackageReady false"
    throw (IO.userError "frontMultPackageReady false")
  -- (1) SubsetFront accepts Mult subset language golden G1.
  acceptG1Golden root
  -- (2) Mult unit package write (HOST-EMIT-MULT package; not full dialect).
  multSubsetEmitWrite root
  -- (3) Dual package identity already validated inside multSubsetEmitWrite;
  -- restate greppable Mult package paths for measured banner.
  let outH := root / "src" / "systems" / "emit" / MultSubsetEmit.emitHeaderBase
  let outC := root / "src" / "systems" / "emit" / MultSubsetEmit.emitSourceBase
  requireFile outH "Mult subset header after front path"
  requireFile outC "Mult subset source after front path"
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  unless (headerWritten.splitOn "SLAKE_MULT_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Mult header missing SLAKE_MULT_SUBSET_EMIT_V0 after front path"
    throw (IO.userError "header stage token")
  unless (sourceWritten.splitOn "SLAKE_MULT_SUBSET_EMIT_V0").length > 1 do
    IO.eprintln "error: Mult source missing SLAKE_MULT_SUBSET_EMIT_V0 after front path"
    throw (IO.userError "source stage token")
  IO.println s!"GREEN {stageId}: G1 accept + Mult package write dual-ok"
  IO.println s!"  wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println s!"  pins: frontMultPackageReady={frontMultPackageReady} finished={frontMultPackageFinishedClaimed}"

/-- CLI: front-end Mult package path under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runFrontMultPackage root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.FrontMultPackage
