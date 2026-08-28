/-
  SYSTEMS_LEAN_HOST partial -- TypesSubsetRebuild L2 term-surface (TypesSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  TypesSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Types rebuild self-apply body matches product (typesSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && typesSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - typesSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - TypesSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ErasureSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ExtractSubsetEmit TERM-SURFACE dual-ok unchanged.
  - MultSubsetEmit TERM-SURFACE dual-ok unchanged.
  - MultSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - LinearSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitTypesReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckTypesSubsetRebuildTerm, TERM-SURFACE, TypesSubsetRebuild-only,
  ILL-TYPED-TERM, checkTypesSubsetRebuildTermDialect,
  hostModuleCheckTypesSubsetRebuildTermDialectOk,
  hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckTypesSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckTypesSubsetRebuildTerm;
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

/-! ### TypesSubsetRebuild L2 term-surface dual-ok pins (TypesSubsetRebuild-only) -/

def checkDepthTypesSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthTypesSubsetRebuildTermSurfaceScope : String := "TypesSubsetRebuild-only"
def hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product typesSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    TypesSubsetRebuild match. Not emitTypesReady. -/
def typesSubsetRebuildSelfApplyOkTermBody : String :=
  "typesSubsetRebuildInputReady && typesSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_types_subset.h\") && (emitSourceBase == \"slake_types_subset.c\") && (typesSubsetRebuildInputId == \"SLAKE_TYPES_SUBSET_EMIT_V0\") && typesSubsetEmitWroteExpected && (typesSubsetHeaderPackage.length > 0) && (typesSubsetSourcePackage.length > 0)"

/-- Product typesSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def typesSubsetRebuildWroteExpectedTermBody : String :=
  "typesSubsetRebuildSelfApplyOk && typesSubsetEmitWroteExpected"

/-- Product typesSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    TypesSubsetRebuild match. -/
def typesSubsetRebuildReadyTermBody : String :=
  "typesSubsetRebuildInputReady && typesSubsetRebuildPackagePinOk && typesSubsetRebuildSelfApplyOk && typesSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !typesSubsetRebuildResidualFreeClaimed && !typesSubsetRebuildProductSelfHostCompleteClaimed && !typesSubsetRebuildProofCompleteClaimed && !typesSubsetRebuildLlvmUnlocked && !typesSubsetRebuildProvablyUnlocked && !typesSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_TYPES_SUBSET_REBUILD_V0\") && (hostId == \"HOST-TYPES-SUBSET-REBUILD\") && (surfaceId == \"TYPES-SUBSET-REBUILD\") && (typesSubsetRebuildInputId == \"SLAKE_TYPES_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-types-subset-rebuild\") && (justRecipe == \"types-subset-rebuild\") && (emitHeaderBase == \"slake_types_subset.h\") && (emitSourceBase == \"slake_types_subset.c\")"

def typesSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == typesSubsetRebuildSelfApplyOkTermBody

def typesSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == typesSubsetRebuildWroteExpectedTermBody

def typesSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetRebuildReady" with
  | none => false
  | some body => body == typesSubsetRebuildReadyTermBody

def checkTypesSubsetRebuildTermDialect (content : String) : Option String :=
  if !typesSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineTypesSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.TypesSubsetEmit\n" ++
  "namespace SystemsLean.TypesSubsetRebuild\n"

def hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.TypesSubsetRebuild\n"

def hostModuleCheckTypesSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++ typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++ typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := " ++ typesSubsetRebuildReadyTermBody ++ "\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodTypesSubsetRebuildTermText : String :=
  hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckTypesSubsetRebuildTermGoodMid
    ++ hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetRebuildResidualText : String :=
  hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++ typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++ typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := " ++ typesSubsetRebuildReadyTermBody ++ "\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetRebuildSelfApplyText : String :=
  hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++ typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := " ++ typesSubsetRebuildReadyTermBody ++ "\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetRebuildReadyText : String :=
  hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++ typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++ typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := true\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetRebuildCompleteText : String :=
  hostModuleCheckTypesSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++ typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++ typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := " ++ typesSubsetRebuildReadyTermBody ++ "\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

def typesSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.TypesSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadTypesSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (typesSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadTypesSubsetRebuildResidualText)
    typesSubsetRebuildExpectedNamespace typesSubsetRebuildRequiredDecls
    (some "SystemsLean.TypesSubsetEmit")).isAccept

def hostModuleCheckBadTypesSubsetRebuildResidualDialectReject : Bool :=
  match checkTypesSubsetRebuildTermDialect hostModuleCheckBadTypesSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (typesSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadTypesSubsetRebuildSelfApplyText)
    typesSubsetRebuildExpectedNamespace typesSubsetRebuildRequiredDecls
    (some "SystemsLean.TypesSubsetEmit")).isAccept

def hostModuleCheckBadTypesSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkTypesSubsetRebuildTermDialect hostModuleCheckBadTypesSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (typesSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadTypesSubsetRebuildReadyText)
    typesSubsetRebuildExpectedNamespace typesSubsetRebuildRequiredDecls
    (some "SystemsLean.TypesSubsetEmit")).isAccept

def hostModuleCheckBadTypesSubsetRebuildReadyDialectReject : Bool :=
  match checkTypesSubsetRebuildTermDialect hostModuleCheckBadTypesSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (typesSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadTypesSubsetRebuildCompleteText)
    typesSubsetRebuildExpectedNamespace typesSubsetRebuildRequiredDecls
    (some "SystemsLean.TypesSubsetEmit")).isAccept

def hostModuleCheckBadTypesSubsetRebuildCompleteDialectReject : Bool :=
  match checkTypesSubsetRebuildTermDialect hostModuleCheckBadTypesSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckTypesSubsetRebuildTermDialectOk : Bool :=
  (checkTypesSubsetRebuildTermDialect hostModuleCheckGoodTypesSubsetRebuildTermText).isNone

/-- On-disk TypesSubsetRebuild typesSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodTypesSubsetRebuildReadyMultilineText : String :=
  "def typesSubsetRebuildReady : Bool :=\n" ++
  "  typesSubsetRebuildInputReady\n" ++
  "    && typesSubsetRebuildPackagePinOk\n" ++
  "    && typesSubsetRebuildSelfApplyOk\n" ++
  "    && typesSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !typesSubsetRebuildResidualFreeClaimed\n" ++
  "    && !typesSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !typesSubsetRebuildProofCompleteClaimed\n" ++
  "    && !typesSubsetRebuildLlvmUnlocked\n" ++
  "    && !typesSubsetRebuildProvablyUnlocked\n" ++
  "    && !typesSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_TYPES_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-TYPES-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"TYPES-SUBSET-REBUILD\")\n" ++
  "    && (typesSubsetRebuildInputId == \"SLAKE_TYPES_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-types-subset-rebuild\")\n" ++
  "    && (justRecipe == \"types-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_types_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_types_subset.c\")\n"

/-- Collapse of the on-disk multi-line typesSubsetRebuildReady body. -/
def hostModuleCheckTypesSubsetRebuildReadyMultilineOk : Bool :=
  typesSubsetRebuildReadyBodyOk hostModuleCheckGoodTypesSubsetRebuildReadyMultilineText

def hostModuleCheckTypesSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk
    && (checkDepthTypesSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthTypesSubsetRebuildTermSurfaceScope == "TypesSubsetRebuild-only")
    && hostModuleCheckTypesSubsetRebuildTermDialectOk
    && hostModuleCheckBadTypesSubsetRebuildResidualDialectReject
    && hostModuleCheckBadTypesSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadTypesSubsetRebuildReadyDialectReject
    && hostModuleCheckBadTypesSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadTypesSubsetRebuildResidualL0Accept
    && hostModuleCheckBadTypesSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadTypesSubsetRebuildReadyL0Accept
    && hostModuleCheckBadTypesSubsetRebuildCompleteL0Accept
    && hostModuleCheckTypesSubsetRebuildReadyMultilineOk

theorem hostModuleCheckTypesSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckTypesSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckTypesSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckTypesSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_typesSubsetRebuild_term_surface_ids_eq :
    checkDepthTypesSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthTypesSubsetRebuildTermSurfaceScope = "TypesSubsetRebuild-only"
      && hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
