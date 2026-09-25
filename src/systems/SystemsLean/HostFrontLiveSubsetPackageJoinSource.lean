/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SubsetPackageJoin.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSubsetPackageJoinSource. Not occupancy name 50. Not mill 70.
  This wrap is SubsetPackageJoin.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveSubsetPackageJoinSource,
  HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSubsetPackageJoinSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSubsetPackageJoin

/-- Dual-pinned live SubsetPackageJoin.lean bytes (must match on-disk file).
    Greppable: liveSubsetPackageJoinSource, HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN. -/
def liveSubsetPackageJoinSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- M5 multi-unit subset package rebuild join (Name A)
  + without-Lake multi-unit join deepen (Name C).
  Measured ordered join of compiler unit package rebuilds Mult..Compose as one
  end-to-end residual with dual evidence. Reuses M1 unit rebuild ready pins and
  M2 Mult without-Lake measured step; does not reimplement emit. Lake host remains
  (stillUsesLake / dependsOnLake true until S4 / M6). Name C: multi-unit join
  runs prebuilt unit rebuild ELFs with no lake on the measured hot path;
  subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed true. Non-Mult per-unit
  without-Lake finished pins stay false (no dedicated per-unit without-Lake
  product recipes; prebuilt ELFs used only by the multi-unit join).
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding product self-host complete rebrand. Not PROVABLY.
  Not llvm unlock. Not S4 Lake retire. Not SubsetFront->package wire (Name B).
  Not product-wire rewrite as sole success (M4 orthogonal).
  Not freestandingDriverComplete flip (Mult package writer Path A orthogonal).
  Not hand-authored product C. Not freestanding emit.
  Greppable: SYSTEMS_LEAN_HOST, SUBSET-PACKAGE-JOIN, SLAKE_SUBSET_PACKAGE_JOIN,
  SLAKE_SUBSET_PACKAGE_JOIN_V0, HOST-SUBSET-PACKAGE-JOIN, subsetPackageJoinReady,
  subsetPackageJoinFinishedClaimed, subsetPackageJoinUnitsReady,
  justRecipeSubsetPackageJoin, subset-packages-rebuild-join,
  justRecipeSubsetPackageJoinWithoutLake, subset-packages-rebuild-join-without-lake,
  subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed,
  subsetPackageJoinWithoutLakeReady, prebuiltUnitRebuildBinDirRel,
  subsetPackageJoinKeepsHostLake, SUBSET-PACKAGE-JOIN-SMOKE,
  SUBSET-PACKAGE-JOIN-THEOREM, multSubsetRebuildReady, linearSubsetRebuildReady,
  typesSubsetRebuildReady, programSubsetRebuildReady, extractSubsetRebuildReady,
  erasureSubsetRebuildReady, graphSubsetRebuildReady, composeSubsetRebuildReady,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (unit package dialect cite from Mult rebuild pin).
  Module: SystemsLean.SubsetPackageJoin
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural join pin + just subset-packages-rebuild-join
  (Name A) or just subset-packages-rebuild-join-without-lake (Name C prebuilts)
  ordered unit rebuilds + on-disk greps of each emit/slake_*_subset stage token.
  Red/green: lake build SystemsLean.SubsetPackageJoin;
  just subset-packages-rebuild-join-without-lake.
  Module must stay ASCII.
-/

import SystemsLean.MultSubsetRebuild
import SystemsLean.LinearSubsetRebuild
import SystemsLean.TypesSubsetRebuild
import SystemsLean.ProgramSubsetRebuild
import SystemsLean.ExtractSubsetRebuild
import SystemsLean.ErasureSubsetRebuild
import SystemsLean.GraphSubsetRebuild
import SystemsLean.ComposeSubsetRebuild

namespace SystemsLean.SubsetPackageJoin

open SystemsLean.MultSubsetRebuild
open SystemsLean.LinearSubsetRebuild
open SystemsLean.TypesSubsetRebuild
open SystemsLean.ProgramSubsetRebuild
open SystemsLean.ExtractSubsetRebuild
open SystemsLean.ErasureSubsetRebuild
open SystemsLean.GraphSubsetRebuild
open SystemsLean.ComposeSubsetRebuild

/-! ### SUBSET-PACKAGE-JOIN / SLAKE_SUBSET_PACKAGE_JOIN (ideal ladder M5 Name A + C)

  Input: eight unit rebuild-ready structural pins (Mult..Compose).
  Output: measured multi-unit package rebuild join pin for dual evidence.
  Name C: multi-unit without-Lake join via prebuilt rebuild ELFs.
-/

/-- Greppable primary stage id (M5 multi-unit package rebuild join). -/
def stageId : String := "SLAKE_SUBSET_PACKAGE_JOIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SUBSET-PACKAGE-JOIN"

/-- Short surface name (product role). -/
def surfaceId : String := "SUBSET-PACKAGE-JOIN"

/-- just recipe name (ordered multi-unit rebuild join; Name A).
    Greppable: justRecipeSubsetPackageJoin, subset-packages-rebuild-join. -/
def justRecipeSubsetPackageJoin : String := "subset-packages-rebuild-join"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeSubsetPackageJoin

/-- just recipe for multi-unit without-Lake join (Name C; prebuilt ELFs only).
    Greppable: justRecipeSubsetPackageJoinWithoutLake,
    subset-packages-rebuild-join-without-lake. -/
def justRecipeSubsetPackageJoinWithoutLake : String :=
  "subset-packages-rebuild-join-without-lake"

/-- Relative dir of prebuilt unit rebuild binaries under src/systems (Lake once).
    Greppable: prebuiltUnitRebuildBinDirRel, .lake/build/bin. -/
def prebuiltUnitRebuildBinDirRel : String := ".lake/build/bin"

/-- Host elaborator still Lake (M5 join; S4 / M6 only retires product pins).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M5 join does not claim product residual free flip. -/
def subsetPackageJoinResidualFreeClaimed : Bool := false

/-- Local honesty: M5 join is not freestanding product self-host complete rebrand. -/
def subsetPackageJoinProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M5 join does not claim proof complete. -/
def subsetPackageJoinProofCompleteClaimed : Bool := false

/-- Local honesty: M5 join does not unlock llvm. -/
def subsetPackageJoinLlvmUnlocked : Bool := false

/-- Local honesty: M5 join does not unlock PROVABLY. -/
def subsetPackageJoinProvablyUnlocked : Bool := false

/-- Multi-unit without-Lake join finished (M5 Name C): measured join runs
    prebuilt unit rebuild ELFs Mult..Compose with no lake on the hot path.
    Per-unit non-Mult withoutLakeFinished stay false (join-level claim only).
    Greppable: subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed. -/
def subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed : Bool := true

/-- All eight unit rebuild structural ready pins compose (M1 + Mult S3).
    Greppable: subsetPackageJoinUnitsReady. -/
def subsetPackageJoinUnitsReady : Bool :=
  multSubsetRebuildReady
    && linearSubsetRebuildReady
    && typesSubsetRebuildReady
    && programSubsetRebuildReady
    && extractSubsetRebuildReady
    && erasureSubsetRebuildReady
    && graphSubsetRebuildReady
    && composeSubsetRebuildReady

/-- Non-Mult per-unit without-Lake finished stay false (no dedicated per-unit
    without-Lake product recipes). Mult without-Lake finished may be true (M2).
    Multi-unit join without-Lake is a separate pin (Name C).
    Greppable: subsetPackageJoinNonMultWithoutLakeHonest. -/
def subsetPackageJoinNonMultWithoutLakeHonest : Bool :=
  !linearSubsetRebuildWithoutLakeFinishedClaimed
    && !typesSubsetRebuildWithoutLakeFinishedClaimed
    && !programSubsetRebuildWithoutLakeFinishedClaimed
    && !extractSubsetRebuildWithoutLakeFinishedClaimed
    && !erasureSubsetRebuildWithoutLakeFinishedClaimed
    && !graphSubsetRebuildWithoutLakeFinishedClaimed
    && !composeSubsetRebuildWithoutLakeFinishedClaimed

/-- Local M5 Name A join finished pin (structural compose of unit rebuild-ready).
    True only when units ready + host Lake honesty + non-claims hold.
    Greppable: subsetPackageJoinFinishedClaimed, SUBSET-PACKAGE-JOIN. -/
def subsetPackageJoinFinishedClaimed : Bool := true

/-- Preferred honesty: join finished does not retire product Lake host.
    Greppable: subsetPackageJoinKeepsHostLake. -/
def subsetPackageJoinKeepsHostLake : Bool :=
  subsetPackageJoinFinishedClaimed && stillUsesLake && dependsOnLake

/-- Name C multi-unit without-Lake join keeps product Lake residual.
    Greppable: subsetPackageJoinWithoutLakeKeepsHostLake. -/
def subsetPackageJoinWithoutLakeKeepsHostLake : Bool :=
  subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed
    && stillUsesLake
    && dependsOnLake

/-- Structural ready for multi-unit package rebuild join measure (Name A + C).
    Greppable: subsetPackageJoinReady, SUBSET-PACKAGE-JOIN,
    SLAKE_SUBSET_PACKAGE_JOIN. -/
def subsetPackageJoinReady : Bool :=
  subsetPackageJoinUnitsReady
    && subsetPackageJoinFinishedClaimed
    && subsetPackageJoinKeepsHostLake
    && subsetPackageJoinNonMultWithoutLakeHonest
    && subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed
    && subsetPackageJoinWithoutLakeKeepsHostLake
    && stillUsesLake
    && dependsOnLake
    && !subsetPackageJoinResidualFreeClaimed
    && !subsetPackageJoinProductSelfHostCompleteClaimed
    && !subsetPackageJoinProofCompleteClaimed
    && !subsetPackageJoinLlvmUnlocked
    && !subsetPackageJoinProvablyUnlocked
    && (stageId == "SLAKE_SUBSET_PACKAGE_JOIN_V0")
    && (hostId == "HOST-SUBSET-PACKAGE-JOIN")
    && (surfaceId == "SUBSET-PACKAGE-JOIN")
    && (justRecipeSubsetPackageJoin == "subset-packages-rebuild-join")
    && (justRecipe == "subset-packages-rebuild-join")
    && (justRecipeSubsetPackageJoinWithoutLake
      == "subset-packages-rebuild-join-without-lake")
    && (prebuiltUnitRebuildBinDirRel == ".lake/build/bin")

/-- Without-Lake multi-unit join structural ready (Name C tip).
    Greppable: subsetPackageJoinWithoutLakeReady. -/
def subsetPackageJoinWithoutLakeReady : Bool :=
  subsetPackageJoinReady
    && subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed
    && subsetPackageJoinWithoutLakeKeepsHostLake
    && multSubsetRebuildWithoutLakeFinishedClaimed
    && (justRecipeSubsetPackageJoinWithoutLake
      == "subset-packages-rebuild-join-without-lake")

/-- subsetPackageJoinReady does not retire Lake (S4 / M6 only).
    Greppable: subsetPackageJoinDoesNotRetireLake. -/
def subsetPackageJoinDoesNotRetireLake : Bool :=
  subsetPackageJoinReady && stillUsesLake && dependsOnLake

/-- subsetPackageJoinReady is not product residual free claim.
    Greppable: subsetPackageJoinDoesNotMeanResidualFree. -/
def subsetPackageJoinDoesNotMeanResidualFree : Bool :=
  subsetPackageJoinReady && !subsetPackageJoinResidualFreeClaimed

/-! ### SUBSET-PACKAGE-JOIN-THEOREM (readable M5 Name A/C statements, then proofs) -/

set_option maxRecDepth 8192

/-- Eight unit rebuild-ready pins compose.
    Greppable: subsetPackageJoinUnitsReady_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinUnitsReady_true :
    subsetPackageJoinUnitsReady = true := by
  native_decide

/-- Non-Mult per-unit without-Lake honesty holds.
    Greppable: subsetPackageJoinNonMultWithoutLakeHonest_true,
    SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinNonMultWithoutLakeHonest_true :
    subsetPackageJoinNonMultWithoutLakeHonest = true := by
  native_decide

/-- M5 Name A join finished claimed.
    Greppable: subsetPackageJoinFinishedClaimed_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinFinishedClaimed_true :
    subsetPackageJoinFinishedClaimed = true :=
  rfl

/-- M5 Name C multi-unit without-Lake join finished.
    Greppable: subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed_true,
    SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed_true :
    subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed = true :=
  rfl

/-- Join keeps product Lake host residual.
    Greppable: subsetPackageJoinKeepsHostLake_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinKeepsHostLake_true :
    subsetPackageJoinKeepsHostLake = true := by
  native_decide

/-- Name C without-Lake join keeps product Lake host residual.
    Greppable: subsetPackageJoinWithoutLakeKeepsHostLake_true,
    SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinWithoutLakeKeepsHostLake_true :
    subsetPackageJoinWithoutLakeKeepsHostLake = true := by
  native_decide

/-- Structural multi-unit join ready.
    Greppable: subsetPackageJoinReady_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinReady_true :
    subsetPackageJoinReady = true := by
  native_decide

/-- Without-Lake multi-unit join ready (Name C).
    Greppable: subsetPackageJoinWithoutLakeReady_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinWithoutLakeReady_true :
    subsetPackageJoinWithoutLakeReady = true := by
  native_decide

/-- Host Lake honesty pins true.
    Greppable: subsetPackageJoin_stillUsesLake_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoin_stillUsesLake_true : stillUsesLake = true := rfl

theorem subsetPackageJoin_dependsOnLake_true : dependsOnLake = true := rfl

/-- just recipe name pin (Name A).
    Greppable: justRecipeSubsetPackageJoin_eq, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem justRecipeSubsetPackageJoin_eq :
    justRecipeSubsetPackageJoin = "subset-packages-rebuild-join" :=
  rfl

/-- just recipe name pin (Name C without-Lake).
    Greppable: justRecipeSubsetPackageJoinWithoutLake_eq, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem justRecipeSubsetPackageJoinWithoutLake_eq :
    justRecipeSubsetPackageJoinWithoutLake
      = "subset-packages-rebuild-join-without-lake" :=
  rfl

/-- Prebuilt bin dir pin.
    Greppable: prebuiltUnitRebuildBinDirRel_eq, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem prebuiltUnitRebuildBinDirRel_eq :
    prebuiltUnitRebuildBinDirRel = ".lake/build/bin" :=
  rfl

/-- Stage / host / surface ids.
    Greppable: subsetPackageJoin_stageId_eq, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoin_stageId_eq :
    stageId = "SLAKE_SUBSET_PACKAGE_JOIN_V0" :=
  rfl

theorem subsetPackageJoin_hostId_eq :
    hostId = "HOST-SUBSET-PACKAGE-JOIN" :=
  rfl

theorem subsetPackageJoin_surfaceId_eq :
    surfaceId = "SUBSET-PACKAGE-JOIN" :=
  rfl

/-- Join does not retire Lake.
    Greppable: subsetPackageJoinDoesNotRetireLake_true, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinDoesNotRetireLake_true :
    subsetPackageJoinDoesNotRetireLake = true := by
  native_decide

/-- Join is not residual free claim.
    Greppable: subsetPackageJoinDoesNotMeanResidualFree_true,
    SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoinDoesNotMeanResidualFree_true :
    subsetPackageJoinDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY non-claims false.
    Multi-unit without-Lake finished is true (Name C); listed separately.
    Greppable: subsetPackageJoin_claims_false, SUBSET-PACKAGE-JOIN-THEOREM. -/
theorem subsetPackageJoin_claims_false :
    subsetPackageJoinResidualFreeClaimed = false
      && subsetPackageJoinProductSelfHostCompleteClaimed = false
      && subsetPackageJoinProofCompleteClaimed = false
      && subsetPackageJoinLlvmUnlocked = false
      && subsetPackageJoinProvablyUnlocked = false :=
  rfl

/-! ### SUBSET-PACKAGE-JOIN-SMOKE (quick examples) -/

example : subsetPackageJoinFinishedClaimed = true := rfl
example : subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed = true := rfl
example : subsetPackageJoinReady = true := by native_decide
example : subsetPackageJoinWithoutLakeReady = true := by native_decide
example : subsetPackageJoinUnitsReady = true := by native_decide
example : subsetPackageJoinKeepsHostLake = true := by native_decide
example : subsetPackageJoinWithoutLakeKeepsHostLake = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example :
    justRecipeSubsetPackageJoin = "subset-packages-rebuild-join" :=
  rfl
example :
    justRecipeSubsetPackageJoinWithoutLake
      = "subset-packages-rebuild-join-without-lake" :=
  rfl
example : prebuiltUnitRebuildBinDirRel = ".lake/build/bin" := rfl
example : multSubsetRebuildWithoutLakeFinishedClaimed = true := rfl
example : linearSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : composeSubsetRebuildWithoutLakeFinishedClaimed = false := rfl

end SystemsLean.SubsetPackageJoin
"#

end SystemsLean.HostFrontLiveSubsetPackageJoin

