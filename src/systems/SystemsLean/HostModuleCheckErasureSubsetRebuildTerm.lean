/-
  SYSTEMS_LEAN_HOST partial -- ErasureSubsetRebuild L2 term-surface (ErasureSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ErasureSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ErasureSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Erasure rebuild self-apply body matches product (erasureSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && erasureSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - erasureSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckErasureSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - ErasureSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - TypesSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - GraphSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitErasureReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckErasureSubsetRebuildTerm, TERM-SURFACE, ErasureSubsetRebuild-only,
  ILL-TYPED-TERM, checkErasureSubsetRebuildTermDialect,
  hostModuleCheckErasureSubsetRebuildTermDialectOk,
  hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckErasureSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckErasureSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm;
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

/-! ### ErasureSubsetRebuild L2 term-surface dual-ok pins (ErasureSubsetRebuild-only) -/

def checkDepthErasureSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthErasureSubsetRebuildTermSurfaceScope : String := "ErasureSubsetRebuild-only"
def hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product erasureSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ErasureSubsetRebuild match. Not emitErasureReady. -/
def erasureSubsetRebuildSelfApplyOkTermBody : String :=
  "erasureSubsetRebuildInputReady && erasureSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_erasure_subset.h\") && (emitSourceBase == \"slake_erasure_subset.c\") && (erasureSubsetRebuildInputId == \"SLAKE_ERASURE_SUBSET_EMIT_V0\") && erasureSubsetEmitWroteExpected && (erasureSubsetHeaderPackage.length > 0) && (erasureSubsetSourcePackage.length > 0)"

/-- Product erasureSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def erasureSubsetRebuildWroteExpectedTermBody : String :=
  "erasureSubsetRebuildSelfApplyOk && erasureSubsetEmitWroteExpected"

/-- Product erasureSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ErasureSubsetRebuild match. -/
def erasureSubsetRebuildReadyTermBody : String :=
  "erasureSubsetRebuildInputReady && erasureSubsetRebuildPackagePinOk && erasureSubsetRebuildSelfApplyOk && erasureSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !erasureSubsetRebuildResidualFreeClaimed && !erasureSubsetRebuildProductSelfHostCompleteClaimed && !erasureSubsetRebuildProofCompleteClaimed && !erasureSubsetRebuildLlvmUnlocked && !erasureSubsetRebuildProvablyUnlocked && !erasureSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_ERASURE_SUBSET_REBUILD_V0\") && (hostId == \"HOST-ERASURE-SUBSET-REBUILD\") && (surfaceId == \"ERASURE-SUBSET-REBUILD\") && (erasureSubsetRebuildInputId == \"SLAKE_ERASURE_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-erasure-subset-rebuild\") && (justRecipe == \"erasure-subset-rebuild\") && (emitHeaderBase == \"slake_erasure_subset.h\") && (emitSourceBase == \"slake_erasure_subset.c\")"

def erasureSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == erasureSubsetRebuildSelfApplyOkTermBody

def erasureSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == erasureSubsetRebuildWroteExpectedTermBody

def erasureSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def erasureSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def erasureSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetRebuildReady" with
  | none => false
  | some body => body == erasureSubsetRebuildReadyTermBody

def checkErasureSubsetRebuildTermDialect (content : String) : Option String :=
  if !erasureSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineErasureSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkErasureSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.ErasureSubsetEmit\n" ++
  "namespace SystemsLean.ErasureSubsetRebuild\n"

def hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.ErasureSubsetRebuild\n"

def hostModuleCheckErasureSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++ erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++ erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := " ++ erasureSubsetRebuildReadyTermBody ++ "\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodErasureSubsetRebuildTermText : String :=
  hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckErasureSubsetRebuildTermGoodMid
    ++ hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetRebuildResidualText : String :=
  hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++ erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++ erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := " ++ erasureSubsetRebuildReadyTermBody ++ "\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetRebuildSelfApplyText : String :=
  hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++ erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := " ++ erasureSubsetRebuildReadyTermBody ++ "\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetRebuildReadyText : String :=
  hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++ erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++ erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := true\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetRebuildCompleteText : String :=
  hostModuleCheckErasureSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++ erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++ erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := " ++ erasureSubsetRebuildReadyTermBody ++ "\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

def erasureSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ErasureSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadErasureSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadErasureSubsetRebuildResidualText)
    erasureSubsetRebuildExpectedNamespace erasureSubsetRebuildRequiredDecls
    (some "SystemsLean.ErasureSubsetEmit")).isAccept

def hostModuleCheckBadErasureSubsetRebuildResidualDialectReject : Bool :=
  match checkErasureSubsetRebuildTermDialect hostModuleCheckBadErasureSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadErasureSubsetRebuildSelfApplyText)
    erasureSubsetRebuildExpectedNamespace erasureSubsetRebuildRequiredDecls
    (some "SystemsLean.ErasureSubsetEmit")).isAccept

def hostModuleCheckBadErasureSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkErasureSubsetRebuildTermDialect hostModuleCheckBadErasureSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadErasureSubsetRebuildReadyText)
    erasureSubsetRebuildExpectedNamespace erasureSubsetRebuildRequiredDecls
    (some "SystemsLean.ErasureSubsetEmit")).isAccept

def hostModuleCheckBadErasureSubsetRebuildReadyDialectReject : Bool :=
  match checkErasureSubsetRebuildTermDialect hostModuleCheckBadErasureSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadErasureSubsetRebuildCompleteText)
    erasureSubsetRebuildExpectedNamespace erasureSubsetRebuildRequiredDecls
    (some "SystemsLean.ErasureSubsetEmit")).isAccept

def hostModuleCheckBadErasureSubsetRebuildCompleteDialectReject : Bool :=
  match checkErasureSubsetRebuildTermDialect hostModuleCheckBadErasureSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckErasureSubsetRebuildTermDialectOk : Bool :=
  (checkErasureSubsetRebuildTermDialect hostModuleCheckGoodErasureSubsetRebuildTermText).isNone

/-- On-disk ErasureSubsetRebuild erasureSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText : String :=
  "def erasureSubsetRebuildReady : Bool :=\n" ++
  "  erasureSubsetRebuildInputReady\n" ++
  "    && erasureSubsetRebuildPackagePinOk\n" ++
  "    && erasureSubsetRebuildSelfApplyOk\n" ++
  "    && erasureSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !erasureSubsetRebuildResidualFreeClaimed\n" ++
  "    && !erasureSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !erasureSubsetRebuildProofCompleteClaimed\n" ++
  "    && !erasureSubsetRebuildLlvmUnlocked\n" ++
  "    && !erasureSubsetRebuildProvablyUnlocked\n" ++
  "    && !erasureSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_ERASURE_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-ERASURE-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"ERASURE-SUBSET-REBUILD\")\n" ++
  "    && (erasureSubsetRebuildInputId == \"SLAKE_ERASURE_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-erasure-subset-rebuild\")\n" ++
  "    && (justRecipe == \"erasure-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_erasure_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_erasure_subset.c\")\n"

/-- Collapse of the on-disk multi-line erasureSubsetRebuildReady body. -/
def hostModuleCheckErasureSubsetRebuildReadyMultilineOk : Bool :=
  erasureSubsetRebuildReadyBodyOk hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText

def hostModuleCheckErasureSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk
    && (checkDepthErasureSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthErasureSubsetRebuildTermSurfaceScope == "ErasureSubsetRebuild-only")
    && hostModuleCheckErasureSubsetRebuildTermDialectOk
    && hostModuleCheckBadErasureSubsetRebuildResidualDialectReject
    && hostModuleCheckBadErasureSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadErasureSubsetRebuildReadyDialectReject
    && hostModuleCheckBadErasureSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadErasureSubsetRebuildResidualL0Accept
    && hostModuleCheckBadErasureSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadErasureSubsetRebuildReadyL0Accept
    && hostModuleCheckBadErasureSubsetRebuildCompleteL0Accept
    && hostModuleCheckErasureSubsetRebuildReadyMultilineOk

theorem hostModuleCheckErasureSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckErasureSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckErasureSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckErasureSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_erasureSubsetRebuild_term_surface_ids_eq :
    checkDepthErasureSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthErasureSubsetRebuildTermSurfaceScope = "ErasureSubsetRebuild-only"
      && hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
