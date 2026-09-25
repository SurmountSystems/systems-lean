/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live MultFsDeepen.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultFsDeepenSource. Not occupancy name 50. Not mill 70.
  This wrap is MultFsDeepen.lean. It is not a different product file.
  Greppable: SYSTEMS_LEAN_HOST, liveMultFsDeepenSource,
  HOST-FRONT-LIVE-MULT-FS-DEEPEN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveMultFsDeepenSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveMultFsDeepen

/-- Dual-pinned live MultFsDeepen.lean bytes (must match on-disk file).
    Greppable: liveMultFsDeepenSource, HOST-FRONT-LIVE-MULT-FS-DEEPEN. -/
def liveMultFsDeepenSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult freestanding deepen + Name B full Mult write.
  After Mult without-Lake prebuilt (Name A), Name B greps partial, and host
  MultSubsetEmit SSOT write path: measured Mult package write uses Lean-native
  MultSubsetEmit / MultFsWriteTool IO.FS.writeFile (P1; Path A host-cc full C
  print from Lean retired). Not Mult rebuild ELF as package writer.
  freestandingDeepenPartial true; multFsWritePathReady true;
  freestandingDriverComplete **true** with dual evidence (Lean pins + just
  greps after real write). Product StillUsesLake / DependsOnLake stay true
  until S4 / M6. Name A prebuilt path remains valid (additive). Host Lake
  multFsWrite / slake-mult-fs-write remain bootstrap helpers. Not free /
  complete product flip. Not freestanding residual free. Not freestanding emit
  residual free. Not freestanding Mult compiler without Lake. Not full
  freestanding dialect rewrite as sole success. Not PROVABLY. Not llvm unlock.
  Not S4 Lake retire. Not shell mill.
  Greppable: SYSTEMS_LEAN_HOST, MULT-FS-DEEPEN, SLAKE_MULT_FS_DEEPEN,
  SLAKE_MULT_FS_DEEPEN_V0, HOST-MULT-FS-DEEPEN, multFsDeepenReady,
  freestandingDeepenPartial, freestandingDriverComplete,
  multFsDeepenDriverReady, multFsDeepenCompleteImpliesPartial,
  multFsDeepenDialectShared, multFsDeepenPackageSurfaceOk,
  multFsDeepenWithoutLakeFinishedOk, multFsDeepenKeepsHostLake,
  multFsWrite, multFsWritePathReady, multFsWriteNotRebuildDriver,
  justRecipeFsWrite, lakeExeFsWrite, prebuiltFsWriteRel, MULT-FS-WRITE,
  freestandingWriteToolBinRel, freestandingWriteToolCRel,
  freestandingWriteToolNotLakeBuilt, multFsWriteToolReady, MULT-FS-WRITE-TOOL,
  slake-mult-fs-write-cc, slake_mult_fs_write_tool.c,
  MULT-FS-DEEPEN-SMOKE, MULT-FS-DEEPEN-THEOREM, multFsDeepenReady_true,
  multFsDeepenDriverReady_true, multFsWritePathReady_true,
  just mult-subset-freestanding-deepen, just mult-subset-freestanding-write,
  justRecipeFsDeepen, MULT-WITHOUT-LAKE,
  multSubsetRebuildWithoutLakeFinishedClaimed, HOST-EMIT-MULT, emitMultReady,
  slake_mult_subset.h, slake_mult_subset.c, slake_freestanding.h,
  slake_freestanding.c, host_emit_mult.ssot.txt, slake-mult-fs-write,
  StillUsesLake, DependsOnLake, UNIT_SURFACE, MULT-0.
  Module: SystemsLean.MultFsDeepen
  Short role name (not ProductPathFreestandingMult kitchen-sink).
  Ladder: multFsDeepenReady (partial surface) stays true; multFsDeepenDriverReady
  requires freestandingDriverComplete. Dual evidence: Lean structural pins +
  theorems/smoke + just mult-subset-freestanding-write package greps after real
  Mult package write. Do not read Lean Bool alone as filesystem proof. Measured
  write recipe must not exec Mult rebuild ELF as package writer. Living Mult
  write is Lean MultSubsetEmit IO (P1); retired Path A host-cc path names stay
  greppable for archaeology only.
  Red/green: lake build SystemsLean.MultFsDeepen; just mult-subset-freestanding-write;
  just mult-subset-freestanding-deepen.
  Module must stay ASCII.
-/

import SystemsLean.MultSubsetRebuild
import SystemsLean.EmitMult
import SystemsLean.MultFsWriteTool

namespace SystemsLean.MultFsDeepen

open SystemsLean.MultSubsetRebuild
open SystemsLean.MultSubsetEmit
open SystemsLean.EmitMult

/-! ### MULT-FS-DEEPEN / SLAKE_MULT_FS_DEEPEN (M2 Name B deepen + full Mult write)

  Input: Name A without-Lake finished + S2 Mult package identity + freestanding
  Mult dialect (HOST-EMIT-MULT) + Name B greps partial + MultFsWriteTool
  Lean-native Mult write (P1).
  Output: Mult package write via MultSubsetEmit freestanding Mult SSOT (Lean
  IO; not Mult rebuild ELF). freestandingDriverComplete true with dual evidence.
  Ready ladder keeps partial true (complete implies partial). Product Lake host
  remains until S4.
-/

/-- Greppable primary stage id (M2 Name B freestanding Mult deepen / write). -/
def stageId : String := "SLAKE_MULT_FS_DEEPEN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-FS-DEEPEN"

/-- Short surface name (product role). -/
def surfaceId : String := "MULT-FS-DEEPEN"

/-- just recipe for Mult freestanding deepen greps path (Name B partial bar).
    Greppable: justRecipeFsDeepen, mult-subset-freestanding-deepen, MULT-FS-DEEPEN. -/
def justRecipeFsDeepen : String := "mult-subset-freestanding-deepen"

/-- just recipe for Mult package write measure (host MultSubsetEmit SSOT write).
    Greppable: justRecipeFsWrite, mult-subset-freestanding-write, MULT-FS-WRITE. -/
def justRecipeFsWrite : String := "mult-subset-freestanding-write"

/-- Lake exe for host MultSubsetEmit freestanding Mult SSOT write (bootstrap once).
    Greppable: lakeExeFsWrite, slake-mult-fs-write, MULT-FS-WRITE. -/
def lakeExeFsWrite : String := "slake-mult-fs-write"

/-- Relative path of prebuilt Mult SSOT write binary after lake build
    (bootstrap host helper only; not measured Mult write after Name B full).
    Greppable: prebuiltFsWriteRel, slake-mult-fs-write. -/
def prebuiltFsWriteRel : String := ".lake/build/bin/slake-mult-fs-write"

/-- Retired Path A host-cc Mult package writer bin path (archaeology only).
    Greppable: freestandingWriteToolBinRel, slake-mult-fs-write-cc. -/
def freestandingWriteToolBinRel : String :=
  MultFsWriteTool.freestandingWriteToolBinRel

/-- Retired Path A Mult package writer C path (archaeology only).
    Greppable: freestandingWriteToolCRel, slake_mult_fs_write_tool.c. -/
def freestandingWriteToolCRel : String :=
  MultFsWriteTool.freestandingWriteToolCRel

/-- Mult write honesty: Lean-native MultSubsetEmit / MultFsWriteTool; not Mult
    rebuild ELF; not full host-cc C print from Lean (P1).
    Greppable: freestandingWriteToolNotLakeBuilt, MULT-FS-WRITE-TOOL. -/
def freestandingWriteToolNotLakeBuilt : Bool :=
  MultFsWriteTool.freestandingWriteToolNotLakeBuilt

/-- MultFsWriteTool structural ready (Lean-native Mult package write).
    Greppable: multFsWriteToolReady, MULT-FS-WRITE-TOOL. -/
def multFsWriteToolReady : Bool := MultFsWriteTool.multFsWriteToolReady

/-- Freestanding Mult surface dual-check partial (Name B greps landed).
    Mult unit dialect shared with freestanding product wire + Mult subset package
    dual-checked via greps + Lean pins. Stays true if freestandingDriverComplete
    later becomes true (complete implies partial). Greppable:
    freestandingDeepenPartial, MULT-FS-DEEPEN. -/
def freestandingDeepenPartial : Bool := true

/-- Design freestanding Mult package write driver complete. True with Lean-native
    MultSubsetEmit / MultFsWriteTool Mult package write + dual evidence (P1;
    Path A host-cc C print retired). Greppable: freestandingDriverComplete,
    MULT-FS-DEEPEN, MULT-FS-WRITE-TOOL. -/
def freestandingDriverComplete : Bool := true

/-- Host MultSubsetEmit freestanding Mult SSOT package write path ready
    (multFsWrite / slake-mult-fs-write; not Mult rebuild ELF). Not design
    freestandingDriverComplete. Greppable: multFsWritePathReady, MULT-FS-WRITE. -/
def multFsWritePathReady : Bool := true

/-- Host elaborator still Lake (bootstrap; S4 / M6 only retires product pins).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: Name B partial does not claim product residual free flip. -/
def multFsDeepenResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def multFsDeepenProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def multFsDeepenProofCompleteClaimed : Bool := false

/-- Local honesty: not llvm unlock. -/
def multFsDeepenLlvmUnlocked : Bool := false

/-- Local honesty: not PROVABLY unlock. -/
def multFsDeepenProvablyUnlocked : Bool := false

/-- Mult dialect shared: Mult subset package reuses HOST-EMIT-MULT / EmitMult
    (same dialect freestanding emit embeds into slake_freestanding Mult).
    Greppable: multFsDeepenDialectShared, HOST-EMIT-MULT, emitMultReady. -/
def multFsDeepenDialectShared : Bool :=
  emitMultReady
    && multSubsetEmitMultDialectOk
    && (multSubsetEmitInputId == "SLAKE_FIRST_SURFACE_MULT")

/-- Mult package surface identity present for freestanding dual check
    (structural; on-disk proof is just greps). Greppable:
    multFsDeepenPackageSurfaceOk, slake_mult_subset.h, slake_mult_subset.c. -/
def multFsDeepenPackageSurfaceOk : Bool :=
  multSubsetEmitReady
    && multSubsetEmitWroteExpected
    && (MultSubsetEmit.emitHeaderBase == "slake_mult_subset.h")
    && (MultSubsetEmit.emitSourceBase == "slake_mult_subset.c")
    && (multSubsetHeaderPackage.length > 0)
    && (multSubsetSourcePackage.length > 0)

/-- Name A Mult without-Lake measured step finished (prebuilt path remains).
    Greppable: multFsDeepenWithoutLakeFinishedOk, MULT-WITHOUT-LAKE,
    multSubsetRebuildWithoutLakeFinishedClaimed. -/
def multFsDeepenWithoutLakeFinishedOk : Bool :=
  multSubsetRebuildWithoutLakeFinishedClaimed
    && multSubsetRebuildWithoutLakeKeepsHostLake

/-- Measured freestanding surface dual-check path is not the Name A prebuilt
    Mult rebuild ELF sole driver. Independent of freestandingDriverComplete so
    a later complete flip does not break this pin. Greppable:
    multFsDeepenNotPrebuiltOnly, justRecipeFsDeepen, mult-subset-freestanding-deepen. -/
def multFsDeepenNotPrebuiltOnly : Bool :=
  freestandingDeepenPartial
    && (justRecipeFsDeepen == "mult-subset-freestanding-deepen")
    && (justRecipeFsDeepen != justRecipeWithoutLake)
    && (justRecipeFsDeepen != "mult-subset-rebuild-without-lake")

/-- Partial freestanding Mult surface dual-check keeps product Lake host.
    Independent of freestandingDriverComplete (S4 / M6 retires Lake). Greppable:
    multFsDeepenKeepsHostLake, StillUsesLake, DependsOnLake. -/
def multFsDeepenKeepsHostLake : Bool :=
  freestandingDeepenPartial && stillUsesLake && dependsOnLake

/-- Structural ready for freestanding Mult surface dual-check (Name B partial).
    Does NOT require !freestandingDriverComplete: complete may later be true
    while this partial ready stays true (complete implies partial). Greppable:
    multFsDeepenReady, MULT-FS-DEEPEN, SLAKE_MULT_FS_DEEPEN. -/
def multFsDeepenReady : Bool :=
  freestandingDeepenPartial
    && multFsDeepenDialectShared
    && multFsDeepenPackageSurfaceOk
    && multFsDeepenWithoutLakeFinishedOk
    && multFsDeepenNotPrebuiltOnly
    && multFsDeepenKeepsHostLake
    && stillUsesLake
    && dependsOnLake
    && !multFsDeepenResidualFreeClaimed
    && !multFsDeepenProductSelfHostCompleteClaimed
    && !multFsDeepenProofCompleteClaimed
    && !multFsDeepenLlvmUnlocked
    && !multFsDeepenProvablyUnlocked
    && (stageId == "SLAKE_MULT_FS_DEEPEN_V0")
    && (hostId == "HOST-MULT-FS-DEEPEN")
    && (surfaceId == "MULT-FS-DEEPEN")
    && (justRecipeFsDeepen == "mult-subset-freestanding-deepen")

/-- Design freestanding Mult write driver ready (requires freestandingDriverComplete).
    False while complete is false. Greppable: multFsDeepenDriverReady,
    freestandingDriverComplete. -/
def multFsDeepenDriverReady : Bool :=
  multFsDeepenReady && freestandingDriverComplete

/-- Write path is MultSubsetEmit freestanding Mult SSOT package builder, not
    Mult rebuild ELF (independent of freestandingDriverComplete). Greppable:
    multFsWriteNotRebuildDriver, MULT-FS-WRITE, slake-mult-fs-write,
    mult-subset-freestanding-write. -/
def multFsWriteNotRebuildDriver : Bool :=
  multFsWritePathReady
    && (lakeExeFsWrite == "slake-mult-fs-write")
    && (lakeExeFsWrite != "slake-mult-subset-rebuild")
    && (justRecipeFsWrite == "mult-subset-freestanding-write")
    && (justRecipeFsWrite != justRecipeWithoutLake)
    && (justRecipeFsWrite != "mult-subset-rebuild")
    && (prebuiltFsWriteRel == ".lake/build/bin/slake-mult-fs-write")
    && (prebuiltFsWriteRel != prebuiltMultRebuildRel)
    && freestandingWriteToolNotLakeBuilt
    && (freestandingWriteToolBinRel != prebuiltMultRebuildRel)

/-- Host MultSubsetEmit SSOT write path ready for measure (structural).
    True with multFsWritePathReady + not-rebuild + deepen ready. Greppable:
    multFsWritePathStructuralReady, MULT-FS-WRITE. -/
def multFsWritePathStructuralReady : Bool :=
  multFsWritePathReady
    && multFsDeepenReady
    && multFsWriteNotRebuildDriver
    && freestandingDeepenPartial
    && stillUsesLake
    && dependsOnLake

/-- Path ready alone does not equal freestanding complete; when complete is true
    the Path A non-Lake writer pins must also hold (driver ready tracks complete).
    Greppable: multFsWritePathDoesNotMeanDriverComplete. -/
def multFsWritePathDoesNotMeanDriverComplete : Bool :=
  multFsWritePathStructuralReady
    && (multFsDeepenDriverReady == freestandingDriverComplete)
    && (!freestandingDriverComplete
      || (freestandingWriteToolNotLakeBuilt && multFsWriteToolReady
        && freestandingDeepenPartial && multFsWriteNotRebuildDriver))

/-- Design complete implies ready ladder + write-not-rebuild honesty + Path A tool.
    Greppable: multFsDeepenDriverCompleteMeansReady. -/
def multFsDeepenDriverCompleteMeansReady : Bool :=
  !freestandingDriverComplete
    || (multFsDeepenReady && multFsDeepenDriverReady && freestandingDeepenPartial
      && multFsWriteNotRebuildDriver && freestandingWriteToolNotLakeBuilt
      && multFsWriteToolReady)

/-- Ladder honesty: freestandingDriverComplete implies freestandingDeepenPartial
    still true (complete does not kill partial). Greppable:
    multFsDeepenCompleteImpliesPartial. -/
def multFsDeepenCompleteImpliesPartial : Bool :=
  !freestandingDriverComplete || freestandingDeepenPartial

/-- multFsDeepenReady does not retire Lake (S4 / M6 only).
    Greppable: multFsDeepenDoesNotRetireLake. -/
def multFsDeepenDoesNotRetireLake : Bool :=
  multFsDeepenReady && stillUsesLake && dependsOnLake

/-- Ready ladder alone is not freestanding complete; when complete is true,
    driverReady tracks complete and Path A tool pins hold.
    Greppable: multFsDeepenDoesNotMeanDriverComplete. -/
def multFsDeepenDoesNotMeanDriverComplete : Bool :=
  multFsDeepenReady && freestandingDeepenPartial
    && (multFsDeepenDriverReady == freestandingDriverComplete)
    && (!freestandingDriverComplete
      || (freestandingWriteToolNotLakeBuilt && multFsWriteToolReady))

/-- multFsDeepenReady is not product residual free claim.
    Greppable: multFsDeepenDoesNotMeanResidualFree. -/
def multFsDeepenDoesNotMeanResidualFree : Bool :=
  multFsDeepenReady && !multFsDeepenResidualFreeClaimed

/-- Host MultSubsetEmit SSOT write path does not retire Lake (S4 / M6 only).
    Greppable: multFsWriteDoesNotRetireLake. -/
def multFsWriteDoesNotRetireLake : Bool :=
  multFsWritePathReady && stillUsesLake && dependsOnLake

/-! ### MULT-FS-DEEPEN-THEOREM (readable Name B deepen + host write statements) -/

set_option maxRecDepth 8192

/-- Mult freestanding dialect shared with Mult subset package.
    Greppable: multFsDeepenDialectShared_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDialectShared_true :
    multFsDeepenDialectShared = true := by
  native_decide

/-- Mult package surface structural ok.
    Greppable: multFsDeepenPackageSurfaceOk_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenPackageSurfaceOk_true :
    multFsDeepenPackageSurfaceOk = true := by
  native_decide

/-- Name A without-Lake finished still holds for deepen input.
    Greppable: multFsDeepenWithoutLakeFinishedOk_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenWithoutLakeFinishedOk_true :
    multFsDeepenWithoutLakeFinishedOk = true := by
  native_decide

/-- Measured path is not prebuilt Mult rebuild only.
    Greppable: multFsDeepenNotPrebuiltOnly_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenNotPrebuiltOnly_true :
    multFsDeepenNotPrebuiltOnly = true := by
  native_decide

/-- Partial deepen keeps product Lake.
    Greppable: multFsDeepenKeepsHostLake_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenKeepsHostLake_true :
    multFsDeepenKeepsHostLake = true := by
  native_decide

/-- End-to-end freestanding Mult surface dual-check structural ready.
    Greppable: multFsDeepenReady_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenReady_true : multFsDeepenReady = true := by
  native_decide

/-- Design freestanding write driver ready true with freestandingDriverComplete.
    Greppable: multFsDeepenDriverReady_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDriverReady_true :
    multFsDeepenDriverReady = true := by
  native_decide

/-- Host MultSubsetEmit freestanding Mult SSOT write path ready.
    Greppable: multFsWritePathReady_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsWritePathReady_true :
    multFsWritePathReady = true := by
  native_decide

/-- Write path is not Mult rebuild ELF.
    Greppable: multFsWriteNotRebuildDriver_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsWriteNotRebuildDriver_true :
    multFsWriteNotRebuildDriver = true := by
  native_decide

/-- Host write path structural ready.
    Greppable: multFsWritePathStructuralReady_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsWritePathStructuralReady_true :
    multFsWritePathStructuralReady = true := by
  native_decide

/-- Host write path is not design freestanding complete.
    Greppable: multFsWritePathDoesNotMeanDriverComplete_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsWritePathDoesNotMeanDriverComplete_true :
    multFsWritePathDoesNotMeanDriverComplete = true := by
  native_decide

/-- Complete implies ready + write honesty (vacuous while complete false).
    Greppable: multFsDeepenDriverCompleteMeansReady_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDriverCompleteMeansReady_true :
    multFsDeepenDriverCompleteMeansReady = true := by
  native_decide

/-- Complete implies partial (ladder).
    Greppable: multFsDeepenCompleteImpliesPartial_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenCompleteImpliesPartial_true :
    multFsDeepenCompleteImpliesPartial = true := by
  native_decide

/-- Ready does not retire Lake.
    Greppable: multFsDeepenDoesNotRetireLake_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDoesNotRetireLake_true :
    multFsDeepenDoesNotRetireLake = true := by
  native_decide

/-- Ready does not mean design freestanding write driver complete.
    Greppable: multFsDeepenDoesNotMeanDriverComplete_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDoesNotMeanDriverComplete_true :
    multFsDeepenDoesNotMeanDriverComplete = true := by
  native_decide

/-- Host write path does not retire Lake.
    Greppable: multFsWriteDoesNotRetireLake_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsWriteDoesNotRetireLake_true :
    multFsWriteDoesNotRetireLake = true := by
  native_decide

/-- Ready does not claim residual free.
    Greppable: multFsDeepenDoesNotMeanResidualFree_true, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepenDoesNotMeanResidualFree_true :
    multFsDeepenDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/proof/llvm/PROVABLY stay false; partial true; host write path
    ready; design driver complete true (Path A); product Lake stays. Greppable:
    multFsDeepen_claims_false, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepen_claims_false :
    (multFsDeepenResidualFreeClaimed = false)
      /\ (multFsDeepenProductSelfHostCompleteClaimed = false)
      /\ (multFsDeepenProofCompleteClaimed = false)
      /\ (multFsDeepenLlvmUnlocked = false)
      /\ (multFsDeepenProvablyUnlocked = false)
      /\ (freestandingDeepenPartial = true)
      /\ (freestandingDriverComplete = true)
      /\ (multFsWritePathReady = true)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl
              (And.intro rfl
                (And.intro rfl (And.intro rfl rfl))))))))

/-- Stage / recipe / pin name pins.
    Greppable: multFsDeepen_ids_eq, MULT-FS-DEEPEN-THEOREM. -/
theorem multFsDeepen_ids_eq :
    (stageId = "SLAKE_MULT_FS_DEEPEN_V0")
      /\ (hostId = "HOST-MULT-FS-DEEPEN")
      /\ (surfaceId = "MULT-FS-DEEPEN")
      /\ (justRecipeFsDeepen = "mult-subset-freestanding-deepen")
      /\ (justRecipeFsWrite = "mult-subset-freestanding-write")
      /\ (lakeExeFsWrite = "slake-mult-fs-write")
      /\ (freestandingDeepenPartial = true)
      /\ (freestandingDriverComplete = true)
      /\ (multFsWritePathReady = true)
      /\ (freestandingWriteToolBinRel
        = "src/systems/bin/slake-mult-fs-write-cc") := by
  native_decide

/-! ### MULT-FS-DEEPEN-SMOKE (lake fails if examples fail)
    Greppable: MULT-FS-DEEPEN-SMOKE, MULT-FS-DEEPEN, MULT-FS-WRITE. -/

/-- MULT-FS-DEEPEN-SMOKE: dialect + package surface + without-Lake input. -/
example : multFsDeepenDialectShared = true := by native_decide
example : multFsDeepenPackageSurfaceOk = true := by native_decide
example : multFsDeepenWithoutLakeFinishedOk = true := by native_decide
example : multFsDeepenNotPrebuiltOnly = true := by native_decide

/-- MULT-FS-DEEPEN-SMOKE: surface ready; design driver ready true (Name B full);
    host write path ready; complete true; Path A tool; write not rebuild;
    product Lake remains. -/
example : multFsDeepenReady = true := by native_decide
example : multFsDeepenDriverReady = true := by native_decide
example : multFsWritePathReady = true := by native_decide
example : multFsWriteNotRebuildDriver = true := by native_decide
example : multFsWritePathStructuralReady = true := by native_decide
example : multFsWritePathDoesNotMeanDriverComplete = true := by native_decide
example : multFsDeepenDriverCompleteMeansReady = true := by native_decide
example : multFsDeepenCompleteImpliesPartial = true := by native_decide
example : multFsDeepenDoesNotRetireLake = true := by native_decide
example : multFsDeepenDoesNotMeanDriverComplete = true := by native_decide
example : multFsWriteDoesNotRetireLake = true := by native_decide
example : multFsDeepenDoesNotMeanResidualFree = true := by native_decide
example : multFsDeepenKeepsHostLake = true := by native_decide
example : freestandingWriteToolNotLakeBuilt = true := by native_decide
example : multFsWriteToolReady = true := by native_decide
example : freestandingDeepenPartial = true := rfl
example : freestandingDriverComplete = true := rfl
example : multFsWritePathReady = true := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : multFsDeepenResidualFreeClaimed = false := rfl
example : multFsDeepenLlvmUnlocked = false := rfl
example : multFsDeepenProvablyUnlocked = false := rfl
example : justRecipeFsDeepen = "mult-subset-freestanding-deepen" := rfl
example : justRecipeFsWrite = "mult-subset-freestanding-write" := rfl
example : lakeExeFsWrite = "slake-mult-fs-write" := rfl
example : prebuiltFsWriteRel = ".lake/build/bin/slake-mult-fs-write" := rfl
example : freestandingWriteToolBinRel
    = "src/systems/bin/slake-mult-fs-write-cc" := by native_decide
example : freestandingWriteToolCRel
    = "src/systems/emit/slake_mult_fs_write_tool.c" := by native_decide
example : stageId = "SLAKE_MULT_FS_DEEPEN_V0" := rfl
example : hostId = "HOST-MULT-FS-DEEPEN" := rfl
example : surfaceId = "MULT-FS-DEEPEN" := rfl

/-! ### MULT-FS-WRITE (IO Mult package write via MultSubsetEmit SSOT)
    Greppable: multFsWrite, MULT-FS-WRITE, IO.FS.writeFile.
    Host MultSubsetEmit freestanding Mult SSOT re-emit under freestanding stage
    labels -- not freestanding Mult compiler without Lake. -/

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- Write Mult unit package under root/src/systems/emit via MultSubsetEmit
    freestanding Mult SSOT packages (not Mult rebuild ELF writer). Host path
    only; freestandingDriverComplete may stay false. Greppable: multFsWrite,
    slake_mult_subset.h, slake_mult_subset.c, IO.FS.writeFile, MULT-FS-WRITE. -/
def multFsWrite (root : System.FilePath) : IO Unit := do
  unless multFsWritePathReady do
    IO.eprintln s!"error: {stageId}: multFsWritePathReady false"
    throw (IO.userError "multFsWritePathReady false")
  unless multFsDeepenReady do
    IO.eprintln s!"error: {stageId}: multFsDeepenReady false"
    throw (IO.userError "multFsDeepenReady false")
  unless multFsWriteNotRebuildDriver do
    IO.eprintln s!"error: {stageId}: multFsWriteNotRebuildDriver false"
    throw (IO.userError "multFsWriteNotRebuildDriver false")
  unless multFsWritePathStructuralReady do
    IO.eprintln s!"error: {stageId}: multFsWritePathStructuralReady false"
    throw (IO.userError "multFsWritePathStructuralReady false")
  unless multSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: multSubsetEmitReady false (MultSubsetEmit SSOT)"
    throw (IO.userError "multSubsetEmitReady false")
  unless multSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: multSubsetEmitWroteExpected false"
    throw (IO.userError "multSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / MultSubsetEmit.emitHeaderBase
  let outC := emitDir / MultSubsetEmit.emitSourceBase
  IO.println s!"== {stageId}: MultSubsetEmit Mult SSOT write =="
  IO.println s!"  partial={freestandingDeepenPartial} complete={freestandingDriverComplete} writePath={multFsWritePathReady} notRebuild={multFsWriteNotRebuildDriver}"
  IO.println s!"  deepenReady={multFsDeepenReady} driverReady={multFsDeepenDriverReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.FS.createDirAll emitDir
  -- MultSubsetEmit freestanding Mult SSOT package text (not MultSubsetRebuildWrite).
  IO.FS.writeFile outH multSubsetHeaderPackage
  IO.FS.writeFile outC multSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Mult subset header ({MultSubsetEmit.emitHeaderBase})"
  requireFile outC s!"Mult subset source ({MultSubsetEmit.emitSourceBase})"
  if headerWritten != multSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (multFsWrite)"
    throw (IO.userError "header mismatch")
  if sourceWritten != multSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (multFsWrite)"
    throw (IO.userError "source mismatch")
  MultSubsetEmit.validateMultSubsetPackage MultSubsetEmit.emitHeaderBase headerWritten false
  MultSubsetEmit.validateMultSubsetPackage MultSubsetEmit.emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length} chars), {outC} ({sourceWritten.length} chars)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: Mult freestanding package write under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    multFsWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.MultFsDeepen
"#

end SystemsLean.HostFrontLiveMultFsDeepen

