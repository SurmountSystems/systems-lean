/-
  SYSTEMS_LEAN_HOST partial -- SubsetPackageJoin L2 term-surface
  (SubsetPackageJoin TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SubsetPackageJoin dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  SubsetPackageJoin L2 dialect subset (documented; not full Lean 4 elaborator):
  - subsetPackageJoinReady compose matches product (units ready + finished +
    keeps host Lake + non-Mult without-Lake honest + without-Lake multi-unit
    finished + without-Lake keeps host Lake + Lake pins + living false
    residual-free / complete / proof / llvm / PROVABLY + ids).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - Join of subset packages: ordered Mult..Compose unit rebuilds plus the
    without-Lake multi-unit join. Not HostFront-class. Not writer-tool
    native Io. Not LLVM IR text.
  - Not HostFront dialect. Not FrontMultPackage dialect. Not rebuild /
    self-apply. Not emit*Ready.
  - Not llvm-as / rust-link / production backend.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSubsetPackageJoinTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSubsetPackageJoinTermSurfaceOk.

  Intentional non-claims:
  - Multi-unit subset package join only -- not package elaborate, not FullHost
    re-true. Skip HostFrontTheorems / HostGraphTheorems (proof).
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSubsetPackageJoinTerm, TERM-SURFACE, SubsetPackageJoin-only,
  ILL-TYPED-TERM, checkSubsetPackageJoinTermDialect,
  hostModuleCheckSubsetPackageJoinTermDialectOk,
  hostModuleCheckSubsetPackageJoinTermSurfaceDualOk,
  hostModuleCheckSubsetPackageJoinTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSubsetPackageJoinTerm
  Red/green: lake build SystemsLean.HostModuleCheckSubsetPackageJoinTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### SubsetPackageJoin L2 term-surface dual-ok pins (SubsetPackageJoin-only) -/

def checkDepthSubsetPackageJoinTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSubsetPackageJoinTermSurfaceScope : String := "SubsetPackageJoin-only"
def hostModuleCheckSubsetPackageJoinTermSurfaceDualOk : Bool := true

/-- Product subsetPackageJoinReady fold (units + finished + keeps Lake +
    non-Mult without-Lake honest + without-Lake multi-unit + without-Lake
    keeps Lake + Lake + living false claims + ids). Same string as the
    collapsed on-disk SubsetPackageJoin body so L0 fixtures and product
    match. -/
def subsetPackageJoinReadyTermBody : String :=
  "subsetPackageJoinUnitsReady && subsetPackageJoinFinishedClaimed && subsetPackageJoinKeepsHostLake && subsetPackageJoinNonMultWithoutLakeHonest && subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed && subsetPackageJoinWithoutLakeKeepsHostLake && stillUsesLake && dependsOnLake && !subsetPackageJoinResidualFreeClaimed && !subsetPackageJoinProductSelfHostCompleteClaimed && !subsetPackageJoinProofCompleteClaimed && !subsetPackageJoinLlvmUnlocked && !subsetPackageJoinProvablyUnlocked && (stageId == \"SLAKE_SUBSET_PACKAGE_JOIN_V0\") && (hostId == \"HOST-SUBSET-PACKAGE-JOIN\") && (surfaceId == \"SUBSET-PACKAGE-JOIN\") && (justRecipeSubsetPackageJoin == \"subset-packages-rebuild-join\") && (justRecipe == \"subset-packages-rebuild-join\") && (justRecipeSubsetPackageJoinWithoutLake == \"subset-packages-rebuild-join-without-lake\") && (prebuiltUnitRebuildBinDirRel == \".lake/build/bin\")"

def subsetPackageJoinReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinReady" with
  | none => false
  | some body => body == subsetPackageJoinReadyTermBody

def subsetPackageJoinResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def subsetPackageJoinCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def subsetPackageJoinProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def subsetPackageJoinLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def subsetPackageJoinProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "subsetPackageJoinProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def subsetPackageJoinStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def subsetPackageJoinDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkSubsetPackageJoinTermDialect (content : String) : Option String :=
  if !subsetPackageJoinReadyBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinCompleteBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinProofBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinLlvmBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinProvablyBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !subsetPackageJoinDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineSubsetPackageJoinWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSubsetPackageJoinTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSubsetPackageJoinTermSkeletonPrefix : String :=
  "import SystemsLean.MultSubsetRebuild\n" ++
  "namespace SystemsLean.SubsetPackageJoin\n"

def hostModuleCheckSubsetPackageJoinTermSkeletonSuffix : String :=
  "end SystemsLean.SubsetPackageJoin\n"

/-- Honest SubsetPackageJoin TERM mid: required L0 decls plus living claim pins. -/
def subsetPackageJoinTermGoodPins (readyBody residual complete proof llvm
    provably lake : String) : String :=
  "def stageId : String := \"SLAKE_SUBSET_PACKAGE_JOIN_V0\"\n" ++
  "def hostId : String := \"HOST-SUBSET-PACKAGE-JOIN\"\n" ++
  "def surfaceId : String := \"SUBSET-PACKAGE-JOIN\"\n" ++
  "def justRecipeSubsetPackageJoin : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipe : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipeSubsetPackageJoinWithoutLake : String := \"subset-packages-rebuild-join-without-lake\"\n" ++
  "def prebuiltUnitRebuildBinDirRel : String := \".lake/build/bin\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def subsetPackageJoinResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def subsetPackageJoinProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def subsetPackageJoinProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def subsetPackageJoinLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def subsetPackageJoinProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def subsetPackageJoinReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckSubsetPackageJoinTermGoodMid : String :=
  subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
    "false" "false" "false" "false" "false" "true"

def hostModuleCheckGoodSubsetPackageJoinTermText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ hostModuleCheckSubsetPackageJoinTermGoodMid
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinResidualText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "true" "false" "false" "false" "false" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinCompleteText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "false" "true" "false" "false" "false" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinReadyText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins "true"
      "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinProofText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "false" "false" "true" "false" "false" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinLlvmText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "false" "false" "false" "true" "false" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinProvablyText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def hostModuleCheckBadSubsetPackageJoinLakeText : String :=
  hostModuleCheckSubsetPackageJoinTermSkeletonPrefix
    ++ subsetPackageJoinTermGoodPins subsetPackageJoinReadyTermBody
      "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

def subsetPackageJoinTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SubsetPackageJoin"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def subsetPackageJoinTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (subsetPackageJoinTermSurfaceFrom content)
    subsetPackageJoinExpectedNamespace subsetPackageJoinRequiredDecls
    (some "SystemsLean.MultSubsetRebuild")).isAccept

def subsetPackageJoinTermDialectReject (content : String) : Bool :=
  match checkSubsetPackageJoinTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSubsetPackageJoinResidualL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinResidualText

def hostModuleCheckBadSubsetPackageJoinResidualDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinResidualText

def hostModuleCheckBadSubsetPackageJoinCompleteL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinCompleteText

def hostModuleCheckBadSubsetPackageJoinCompleteDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinCompleteText

def hostModuleCheckBadSubsetPackageJoinReadyL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinReadyText

def hostModuleCheckBadSubsetPackageJoinReadyDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinReadyText

def hostModuleCheckBadSubsetPackageJoinProofL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinProofText

def hostModuleCheckBadSubsetPackageJoinProofDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinProofText

def hostModuleCheckBadSubsetPackageJoinLlvmL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinLlvmText

def hostModuleCheckBadSubsetPackageJoinLlvmDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinLlvmText

def hostModuleCheckBadSubsetPackageJoinProvablyL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinProvablyText

def hostModuleCheckBadSubsetPackageJoinProvablyDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinProvablyText

def hostModuleCheckBadSubsetPackageJoinLakeL0Accept : Bool :=
  subsetPackageJoinTermL0Accept hostModuleCheckBadSubsetPackageJoinLakeText

def hostModuleCheckBadSubsetPackageJoinLakeDialectReject : Bool :=
  subsetPackageJoinTermDialectReject hostModuleCheckBadSubsetPackageJoinLakeText

def hostModuleCheckSubsetPackageJoinTermDialectOk : Bool :=
  (checkSubsetPackageJoinTermDialect hostModuleCheckGoodSubsetPackageJoinTermText).isNone

/-- On-disk SubsetPackageJoin subsetPackageJoinReady is multi-line. Collapse
    must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodSubsetPackageJoinReadyMultilineText : String :=
  "def subsetPackageJoinReady : Bool :=\n" ++
  "  subsetPackageJoinUnitsReady\n" ++
  "    && subsetPackageJoinFinishedClaimed\n" ++
  "    && subsetPackageJoinKeepsHostLake\n" ++
  "    && subsetPackageJoinNonMultWithoutLakeHonest\n" ++
  "    && subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed\n" ++
  "    && subsetPackageJoinWithoutLakeKeepsHostLake\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !subsetPackageJoinResidualFreeClaimed\n" ++
  "    && !subsetPackageJoinProductSelfHostCompleteClaimed\n" ++
  "    && !subsetPackageJoinProofCompleteClaimed\n" ++
  "    && !subsetPackageJoinLlvmUnlocked\n" ++
  "    && !subsetPackageJoinProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_SUBSET_PACKAGE_JOIN_V0\")\n" ++
  "    && (hostId == \"HOST-SUBSET-PACKAGE-JOIN\")\n" ++
  "    && (surfaceId == \"SUBSET-PACKAGE-JOIN\")\n" ++
  "    && (justRecipeSubsetPackageJoin == \"subset-packages-rebuild-join\")\n" ++
  "    && (justRecipe == \"subset-packages-rebuild-join\")\n" ++
  "    && (justRecipeSubsetPackageJoinWithoutLake\n" ++
  "      == \"subset-packages-rebuild-join-without-lake\")\n" ++
  "    && (prebuiltUnitRebuildBinDirRel == \".lake/build/bin\")\n"

/-- Collapse of the on-disk multi-line subsetPackageJoinReady body. -/
def hostModuleCheckSubsetPackageJoinReadyMultilineOk : Bool :=
  subsetPackageJoinReadyBodyOk hostModuleCheckGoodSubsetPackageJoinReadyMultilineText

def hostModuleCheckSubsetPackageJoinTermSurfaceOk : Bool :=
  hostModuleCheckSubsetPackageJoinTermSurfaceDualOk
    && (checkDepthSubsetPackageJoinTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSubsetPackageJoinTermSurfaceScope == "SubsetPackageJoin-only")
    && hostModuleCheckSubsetPackageJoinTermDialectOk
    && hostModuleCheckBadSubsetPackageJoinResidualDialectReject
    && hostModuleCheckBadSubsetPackageJoinCompleteDialectReject
    && hostModuleCheckBadSubsetPackageJoinReadyDialectReject
    && hostModuleCheckBadSubsetPackageJoinProofDialectReject
    && hostModuleCheckBadSubsetPackageJoinLlvmDialectReject
    && hostModuleCheckBadSubsetPackageJoinProvablyDialectReject
    && hostModuleCheckBadSubsetPackageJoinLakeDialectReject
    && hostModuleCheckBadSubsetPackageJoinResidualL0Accept
    && hostModuleCheckBadSubsetPackageJoinCompleteL0Accept
    && hostModuleCheckBadSubsetPackageJoinReadyL0Accept
    && hostModuleCheckBadSubsetPackageJoinProofL0Accept
    && hostModuleCheckBadSubsetPackageJoinLlvmL0Accept
    && hostModuleCheckBadSubsetPackageJoinProvablyL0Accept
    && hostModuleCheckBadSubsetPackageJoinLakeL0Accept
    && hostModuleCheckSubsetPackageJoinReadyMultilineOk

theorem hostModuleCheckSubsetPackageJoinTermSurfaceOk_true :
    hostModuleCheckSubsetPackageJoinTermSurfaceOk = true := by native_decide

theorem hostModuleCheckSubsetPackageJoinReadyMultilineOk_true :
    hostModuleCheckSubsetPackageJoinReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_subsetPackageJoin_term_surface_ids_eq :
    checkDepthSubsetPackageJoinTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSubsetPackageJoinTermSurfaceScope = "SubsetPackageJoin-only"
      && hostModuleCheckSubsetPackageJoinTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
