/-
  SYSTEMS_LEAN_HOST partial -- LinearSubsetRebuild L2 term-surface (LinearSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LinearSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LinearSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Linear rebuild self-apply body matches product (linearSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && linearSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - linearSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLinearSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - LinearSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitLinearReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLinearSubsetRebuildTerm, TERM-SURFACE, LinearSubsetRebuild-only,
  ILL-TYPED-TERM, checkLinearSubsetRebuildTermDialect,
  hostModuleCheckLinearSubsetRebuildTermDialectOk,
  hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckLinearSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLinearSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm;
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

/-! ### LinearSubsetRebuild L2 term-surface dual-ok pins (LinearSubsetRebuild-only) -/

def checkDepthLinearSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLinearSubsetRebuildTermSurfaceScope : String := "LinearSubsetRebuild-only"
def hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product linearSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    LinearSubsetRebuild match. Not emitLinearReady. -/
def linearSubsetRebuildSelfApplyOkTermBody : String :=
  "linearSubsetRebuildInputReady && linearSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_linear_subset.h\") && (emitSourceBase == \"slake_linear_subset.c\") && (linearSubsetRebuildInputId == \"SLAKE_LINEAR_SUBSET_EMIT_V0\") && linearSubsetEmitWroteExpected && (linearSubsetHeaderPackage.length > 0) && (linearSubsetSourcePackage.length > 0)"

/-- Product linearSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def linearSubsetRebuildWroteExpectedTermBody : String :=
  "linearSubsetRebuildSelfApplyOk && linearSubsetEmitWroteExpected"

/-- Product linearSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    LinearSubsetRebuild match. -/
def linearSubsetRebuildReadyTermBody : String :=
  "linearSubsetRebuildInputReady && linearSubsetRebuildPackagePinOk && linearSubsetRebuildSelfApplyOk && linearSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !linearSubsetRebuildResidualFreeClaimed && !linearSubsetRebuildProductSelfHostCompleteClaimed && !linearSubsetRebuildProofCompleteClaimed && !linearSubsetRebuildLlvmUnlocked && !linearSubsetRebuildProvablyUnlocked && !linearSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_LINEAR_SUBSET_REBUILD_V0\") && (hostId == \"HOST-LINEAR-SUBSET-REBUILD\") && (surfaceId == \"LINEAR-SUBSET-REBUILD\") && (linearSubsetRebuildInputId == \"SLAKE_LINEAR_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-linear-subset-rebuild\") && (justRecipe == \"linear-subset-rebuild\") && (emitHeaderBase == \"slake_linear_subset.h\") && (emitSourceBase == \"slake_linear_subset.c\")"

def linearSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == linearSubsetRebuildSelfApplyOkTermBody

def linearSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == linearSubsetRebuildWroteExpectedTermBody

def linearSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def linearSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def linearSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetRebuildReady" with
  | none => false
  | some body => body == linearSubsetRebuildReadyTermBody

def checkLinearSubsetRebuildTermDialect (content : String) : Option String :=
  if !linearSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineLinearSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLinearSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.LinearSubsetEmit\n" ++
  "namespace SystemsLean.LinearSubsetRebuild\n"

def hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.LinearSubsetRebuild\n"

def hostModuleCheckLinearSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++ linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++ linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := " ++ linearSubsetRebuildReadyTermBody ++ "\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodLinearSubsetRebuildTermText : String :=
  hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckLinearSubsetRebuildTermGoodMid
    ++ hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetRebuildResidualText : String :=
  hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++ linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++ linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := " ++ linearSubsetRebuildReadyTermBody ++ "\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetRebuildSelfApplyText : String :=
  hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++ linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := " ++ linearSubsetRebuildReadyTermBody ++ "\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetRebuildReadyText : String :=
  hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++ linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++ linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := true\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetRebuildCompleteText : String :=
  hostModuleCheckLinearSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++ linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++ linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := " ++ linearSubsetRebuildReadyTermBody ++ "\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

def linearSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LinearSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadLinearSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (linearSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadLinearSubsetRebuildResidualText)
    linearSubsetRebuildExpectedNamespace linearSubsetRebuildRequiredDecls
    (some "SystemsLean.LinearSubsetEmit")).isAccept

def hostModuleCheckBadLinearSubsetRebuildResidualDialectReject : Bool :=
  match checkLinearSubsetRebuildTermDialect hostModuleCheckBadLinearSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (linearSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadLinearSubsetRebuildSelfApplyText)
    linearSubsetRebuildExpectedNamespace linearSubsetRebuildRequiredDecls
    (some "SystemsLean.LinearSubsetEmit")).isAccept

def hostModuleCheckBadLinearSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkLinearSubsetRebuildTermDialect hostModuleCheckBadLinearSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (linearSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadLinearSubsetRebuildReadyText)
    linearSubsetRebuildExpectedNamespace linearSubsetRebuildRequiredDecls
    (some "SystemsLean.LinearSubsetEmit")).isAccept

def hostModuleCheckBadLinearSubsetRebuildReadyDialectReject : Bool :=
  match checkLinearSubsetRebuildTermDialect hostModuleCheckBadLinearSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (linearSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadLinearSubsetRebuildCompleteText)
    linearSubsetRebuildExpectedNamespace linearSubsetRebuildRequiredDecls
    (some "SystemsLean.LinearSubsetEmit")).isAccept

def hostModuleCheckBadLinearSubsetRebuildCompleteDialectReject : Bool :=
  match checkLinearSubsetRebuildTermDialect hostModuleCheckBadLinearSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckLinearSubsetRebuildTermDialectOk : Bool :=
  (checkLinearSubsetRebuildTermDialect hostModuleCheckGoodLinearSubsetRebuildTermText).isNone

/-- On-disk LinearSubsetRebuild linearSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText : String :=
  "def linearSubsetRebuildReady : Bool :=\n" ++
  "  linearSubsetRebuildInputReady\n" ++
  "    && linearSubsetRebuildPackagePinOk\n" ++
  "    && linearSubsetRebuildSelfApplyOk\n" ++
  "    && linearSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !linearSubsetRebuildResidualFreeClaimed\n" ++
  "    && !linearSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !linearSubsetRebuildProofCompleteClaimed\n" ++
  "    && !linearSubsetRebuildLlvmUnlocked\n" ++
  "    && !linearSubsetRebuildProvablyUnlocked\n" ++
  "    && !linearSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_LINEAR_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-LINEAR-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"LINEAR-SUBSET-REBUILD\")\n" ++
  "    && (linearSubsetRebuildInputId == \"SLAKE_LINEAR_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-linear-subset-rebuild\")\n" ++
  "    && (justRecipe == \"linear-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_linear_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_linear_subset.c\")\n"

/-- Collapse of the on-disk multi-line linearSubsetRebuildReady body. -/
def hostModuleCheckLinearSubsetRebuildReadyMultilineOk : Bool :=
  linearSubsetRebuildReadyBodyOk hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText

def hostModuleCheckLinearSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk
    && (checkDepthLinearSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLinearSubsetRebuildTermSurfaceScope == "LinearSubsetRebuild-only")
    && hostModuleCheckLinearSubsetRebuildTermDialectOk
    && hostModuleCheckBadLinearSubsetRebuildResidualDialectReject
    && hostModuleCheckBadLinearSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadLinearSubsetRebuildReadyDialectReject
    && hostModuleCheckBadLinearSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadLinearSubsetRebuildResidualL0Accept
    && hostModuleCheckBadLinearSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadLinearSubsetRebuildReadyL0Accept
    && hostModuleCheckBadLinearSubsetRebuildCompleteL0Accept
    && hostModuleCheckLinearSubsetRebuildReadyMultilineOk

theorem hostModuleCheckLinearSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckLinearSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLinearSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckLinearSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_linearSubsetRebuild_term_surface_ids_eq :
    checkDepthLinearSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLinearSubsetRebuildTermSurfaceScope = "LinearSubsetRebuild-only"
      && hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
