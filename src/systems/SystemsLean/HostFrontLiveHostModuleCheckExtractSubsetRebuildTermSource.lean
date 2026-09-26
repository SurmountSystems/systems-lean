/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckExtractSubsetRebuildTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckExtractSubsetRebuildTermSource.
  Not occupancy name 50. Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckExtractSubsetRebuildTerm.lean only. One part.
  Do not steal a neighbor checker.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEXTRACTSUBSETREBUILDTERM,
  liveHostModuleCheckExtractSubsetRebuildTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEXTRACTSUBSETREBUILDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetRebuildTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetRebuildTerm

/-- Dual-pinned live HostModuleCheckExtractSubsetRebuildTerm.lean bytes.
    One part. Not split. Greppable: liveHostModuleCheckExtractSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKEXTRACTSUBSETREBUILDTERM. -/
def liveHostModuleCheckExtractSubsetRebuildTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ExtractSubsetRebuild L2 term-surface (ExtractSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ExtractSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ExtractSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Extract rebuild self-apply body matches product (extractSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && extractSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - extractSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckExtractSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - ExtractSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - ErasureSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitExtractReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckExtractSubsetRebuildTerm, TERM-SURFACE, ExtractSubsetRebuild-only,
  ILL-TYPED-TERM, checkExtractSubsetRebuildTermDialect,
  hostModuleCheckExtractSubsetRebuildTermDialectOk,
  hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckExtractSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckExtractSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckExtractSubsetRebuildTerm;
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

/-! ### ExtractSubsetRebuild L2 term-surface dual-ok pins (ExtractSubsetRebuild-only) -/

def checkDepthExtractSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthExtractSubsetRebuildTermSurfaceScope : String := "ExtractSubsetRebuild-only"
def hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product extractSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ExtractSubsetRebuild match. Not emitExtractReady. -/
def extractSubsetRebuildSelfApplyOkTermBody : String :=
  "extractSubsetRebuildInputReady && extractSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_extract_subset.h\") && (emitSourceBase == \"slake_extract_subset.c\") && (extractSubsetRebuildInputId == \"SLAKE_EXTRACT_SUBSET_EMIT_V0\") && extractSubsetEmitWroteExpected && (extractSubsetHeaderPackage.length > 0) && (extractSubsetSourcePackage.length > 0)"

/-- Product extractSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def extractSubsetRebuildWroteExpectedTermBody : String :=
  "extractSubsetRebuildSelfApplyOk && extractSubsetEmitWroteExpected"

/-- Product extractSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ExtractSubsetRebuild match. -/
def extractSubsetRebuildReadyTermBody : String :=
  "extractSubsetRebuildInputReady && extractSubsetRebuildPackagePinOk && extractSubsetRebuildSelfApplyOk && extractSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !extractSubsetRebuildResidualFreeClaimed && !extractSubsetRebuildProductSelfHostCompleteClaimed && !extractSubsetRebuildProofCompleteClaimed && !extractSubsetRebuildLlvmUnlocked && !extractSubsetRebuildProvablyUnlocked && !extractSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\") && (hostId == \"HOST-EXTRACT-SUBSET-REBUILD\") && (surfaceId == \"EXTRACT-SUBSET-REBUILD\") && (extractSubsetRebuildInputId == \"SLAKE_EXTRACT_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-extract-subset-rebuild\") && (justRecipe == \"extract-subset-rebuild\") && (emitHeaderBase == \"slake_extract_subset.h\") && (emitSourceBase == \"slake_extract_subset.c\")"

def extractSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == extractSubsetRebuildSelfApplyOkTermBody

def extractSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == extractSubsetRebuildWroteExpectedTermBody

def extractSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def extractSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def extractSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetRebuildReady" with
  | none => false
  | some body => body == extractSubsetRebuildReadyTermBody

def checkExtractSubsetRebuildTermDialect (content : String) : Option String :=
  if !extractSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineExtractSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkExtractSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.ExtractSubsetEmit\n" ++
  "namespace SystemsLean.ExtractSubsetRebuild\n"

def hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.ExtractSubsetRebuild\n"

def hostModuleCheckExtractSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++ extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++ extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := " ++ extractSubsetRebuildReadyTermBody ++ "\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodExtractSubsetRebuildTermText : String :=
  hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckExtractSubsetRebuildTermGoodMid
    ++ hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetRebuildResidualText : String :=
  hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++ extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++ extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := " ++ extractSubsetRebuildReadyTermBody ++ "\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetRebuildSelfApplyText : String :=
  hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++ extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := " ++ extractSubsetRebuildReadyTermBody ++ "\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetRebuildReadyText : String :=
  hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++ extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++ extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := true\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetRebuildCompleteText : String :=
  hostModuleCheckExtractSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++ extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++ extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := " ++ extractSubsetRebuildReadyTermBody ++ "\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

def extractSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ExtractSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadExtractSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (extractSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadExtractSubsetRebuildResidualText)
    extractSubsetRebuildExpectedNamespace extractSubsetRebuildRequiredDecls
    (some "SystemsLean.ExtractSubsetEmit")).isAccept

def hostModuleCheckBadExtractSubsetRebuildResidualDialectReject : Bool :=
  match checkExtractSubsetRebuildTermDialect hostModuleCheckBadExtractSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (extractSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadExtractSubsetRebuildSelfApplyText)
    extractSubsetRebuildExpectedNamespace extractSubsetRebuildRequiredDecls
    (some "SystemsLean.ExtractSubsetEmit")).isAccept

def hostModuleCheckBadExtractSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkExtractSubsetRebuildTermDialect hostModuleCheckBadExtractSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (extractSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadExtractSubsetRebuildReadyText)
    extractSubsetRebuildExpectedNamespace extractSubsetRebuildRequiredDecls
    (some "SystemsLean.ExtractSubsetEmit")).isAccept

def hostModuleCheckBadExtractSubsetRebuildReadyDialectReject : Bool :=
  match checkExtractSubsetRebuildTermDialect hostModuleCheckBadExtractSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (extractSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadExtractSubsetRebuildCompleteText)
    extractSubsetRebuildExpectedNamespace extractSubsetRebuildRequiredDecls
    (some "SystemsLean.ExtractSubsetEmit")).isAccept

def hostModuleCheckBadExtractSubsetRebuildCompleteDialectReject : Bool :=
  match checkExtractSubsetRebuildTermDialect hostModuleCheckBadExtractSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckExtractSubsetRebuildTermDialectOk : Bool :=
  (checkExtractSubsetRebuildTermDialect hostModuleCheckGoodExtractSubsetRebuildTermText).isNone

/-- On-disk ExtractSubsetRebuild extractSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText : String :=
  "def extractSubsetRebuildReady : Bool :=\n" ++
  "  extractSubsetRebuildInputReady\n" ++
  "    && extractSubsetRebuildPackagePinOk\n" ++
  "    && extractSubsetRebuildSelfApplyOk\n" ++
  "    && extractSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !extractSubsetRebuildResidualFreeClaimed\n" ++
  "    && !extractSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !extractSubsetRebuildProofCompleteClaimed\n" ++
  "    && !extractSubsetRebuildLlvmUnlocked\n" ++
  "    && !extractSubsetRebuildProvablyUnlocked\n" ++
  "    && !extractSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-EXTRACT-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"EXTRACT-SUBSET-REBUILD\")\n" ++
  "    && (extractSubsetRebuildInputId == \"SLAKE_EXTRACT_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-extract-subset-rebuild\")\n" ++
  "    && (justRecipe == \"extract-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_extract_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_extract_subset.c\")\n"

/-- Collapse of the on-disk multi-line extractSubsetRebuildReady body. -/
def hostModuleCheckExtractSubsetRebuildReadyMultilineOk : Bool :=
  extractSubsetRebuildReadyBodyOk hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText

def hostModuleCheckExtractSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk
    && (checkDepthExtractSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthExtractSubsetRebuildTermSurfaceScope == "ExtractSubsetRebuild-only")
    && hostModuleCheckExtractSubsetRebuildTermDialectOk
    && hostModuleCheckBadExtractSubsetRebuildResidualDialectReject
    && hostModuleCheckBadExtractSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadExtractSubsetRebuildReadyDialectReject
    && hostModuleCheckBadExtractSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadExtractSubsetRebuildResidualL0Accept
    && hostModuleCheckBadExtractSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadExtractSubsetRebuildReadyL0Accept
    && hostModuleCheckBadExtractSubsetRebuildCompleteL0Accept
    && hostModuleCheckExtractSubsetRebuildReadyMultilineOk

theorem hostModuleCheckExtractSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckExtractSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckExtractSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckExtractSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_extractSubsetRebuild_term_surface_ids_eq :
    checkDepthExtractSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthExtractSubsetRebuildTermSurfaceScope = "ExtractSubsetRebuild-only"
      && hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckExtractSubsetRebuildTerm
