/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckComposeSubsetRebuildTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckComposeSubsetRebuildTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckComposeSubsetRebuildTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckComposeSubsetEmitTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM,
  liveHostModuleCheckComposeSubsetRebuildTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm

/-- Dual-pinned live HostModuleCheckComposeSubsetRebuildTerm.lean bytes.
    One part. Not split. 307 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckComposeSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM. -/
def liveHostModuleCheckComposeSubsetRebuildTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ComposeSubsetRebuild L2 term-surface (ComposeSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ComposeSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ComposeSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Compose rebuild self-apply body matches product (composeSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && composeSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - composeSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckComposeSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - ComposeSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitComposeReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckComposeSubsetRebuildTerm, TERM-SURFACE, ComposeSubsetRebuild-only,
  ILL-TYPED-TERM, checkComposeSubsetRebuildTermDialect,
  hostModuleCheckComposeSubsetRebuildTermDialectOk,
  hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckComposeSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckComposeSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm;
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

/-! ### ComposeSubsetRebuild L2 term-surface dual-ok pins (ComposeSubsetRebuild-only) -/

def checkDepthComposeSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthComposeSubsetRebuildTermSurfaceScope : String := "ComposeSubsetRebuild-only"
def hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product composeSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ComposeSubsetRebuild match. Not emitComposeReady. -/
def composeSubsetRebuildSelfApplyOkTermBody : String :=
  "composeSubsetRebuildInputReady && composeSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_compose_subset.h\") && (emitSourceBase == \"slake_compose_subset.c\") && (composeSubsetRebuildInputId == \"SLAKE_COMPOSE_SUBSET_EMIT_V0\") && composeSubsetEmitWroteExpected && (composeSubsetHeaderPackage.length > 0) && (composeSubsetSourcePackage.length > 0)"

/-- Product composeSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def composeSubsetRebuildWroteExpectedTermBody : String :=
  "composeSubsetRebuildSelfApplyOk && composeSubsetEmitWroteExpected"

/-- Product composeSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ComposeSubsetRebuild match. -/
def composeSubsetRebuildReadyTermBody : String :=
  "composeSubsetRebuildInputReady && composeSubsetRebuildPackagePinOk && composeSubsetRebuildSelfApplyOk && composeSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !composeSubsetRebuildResidualFreeClaimed && !composeSubsetRebuildProductSelfHostCompleteClaimed && !composeSubsetRebuildProofCompleteClaimed && !composeSubsetRebuildLlvmUnlocked && !composeSubsetRebuildProvablyUnlocked && !composeSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\") && (hostId == \"HOST-COMPOSE-SUBSET-REBUILD\") && (surfaceId == \"COMPOSE-SUBSET-REBUILD\") && (composeSubsetRebuildInputId == \"SLAKE_COMPOSE_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-compose-subset-rebuild\") && (justRecipe == \"compose-subset-rebuild\") && (emitHeaderBase == \"slake_compose_subset.h\") && (emitSourceBase == \"slake_compose_subset.c\")"

def composeSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == composeSubsetRebuildSelfApplyOkTermBody

def composeSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == composeSubsetRebuildWroteExpectedTermBody

def composeSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def composeSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def composeSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetRebuildReady" with
  | none => false
  | some body => body == composeSubsetRebuildReadyTermBody

def checkComposeSubsetRebuildTermDialect (content : String) : Option String :=
  if !composeSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineComposeSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkComposeSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.ComposeSubsetEmit\n" ++
  "namespace SystemsLean.ComposeSubsetRebuild\n"

def hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.ComposeSubsetRebuild\n"

def hostModuleCheckComposeSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++ composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++ composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := " ++ composeSubsetRebuildReadyTermBody ++ "\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodComposeSubsetRebuildTermText : String :=
  hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckComposeSubsetRebuildTermGoodMid
    ++ hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetRebuildResidualText : String :=
  hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++ composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++ composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := " ++ composeSubsetRebuildReadyTermBody ++ "\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetRebuildSelfApplyText : String :=
  hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++ composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := " ++ composeSubsetRebuildReadyTermBody ++ "\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetRebuildReadyText : String :=
  hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++ composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++ composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := true\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetRebuildCompleteText : String :=
  hostModuleCheckComposeSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++ composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++ composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := " ++ composeSubsetRebuildReadyTermBody ++ "\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

def composeSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ComposeSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadComposeSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (composeSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadComposeSubsetRebuildResidualText)
    composeSubsetRebuildExpectedNamespace composeSubsetRebuildRequiredDecls
    (some "SystemsLean.ComposeSubsetEmit")).isAccept

def hostModuleCheckBadComposeSubsetRebuildResidualDialectReject : Bool :=
  match checkComposeSubsetRebuildTermDialect hostModuleCheckBadComposeSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (composeSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadComposeSubsetRebuildSelfApplyText)
    composeSubsetRebuildExpectedNamespace composeSubsetRebuildRequiredDecls
    (some "SystemsLean.ComposeSubsetEmit")).isAccept

def hostModuleCheckBadComposeSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkComposeSubsetRebuildTermDialect hostModuleCheckBadComposeSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (composeSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadComposeSubsetRebuildReadyText)
    composeSubsetRebuildExpectedNamespace composeSubsetRebuildRequiredDecls
    (some "SystemsLean.ComposeSubsetEmit")).isAccept

def hostModuleCheckBadComposeSubsetRebuildReadyDialectReject : Bool :=
  match checkComposeSubsetRebuildTermDialect hostModuleCheckBadComposeSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (composeSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadComposeSubsetRebuildCompleteText)
    composeSubsetRebuildExpectedNamespace composeSubsetRebuildRequiredDecls
    (some "SystemsLean.ComposeSubsetEmit")).isAccept

def hostModuleCheckBadComposeSubsetRebuildCompleteDialectReject : Bool :=
  match checkComposeSubsetRebuildTermDialect hostModuleCheckBadComposeSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckComposeSubsetRebuildTermDialectOk : Bool :=
  (checkComposeSubsetRebuildTermDialect hostModuleCheckGoodComposeSubsetRebuildTermText).isNone

/-- On-disk ComposeSubsetRebuild composeSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText : String :=
  "def composeSubsetRebuildReady : Bool :=\n" ++
  "  composeSubsetRebuildInputReady\n" ++
  "    && composeSubsetRebuildPackagePinOk\n" ++
  "    && composeSubsetRebuildSelfApplyOk\n" ++
  "    && composeSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !composeSubsetRebuildResidualFreeClaimed\n" ++
  "    && !composeSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !composeSubsetRebuildProofCompleteClaimed\n" ++
  "    && !composeSubsetRebuildLlvmUnlocked\n" ++
  "    && !composeSubsetRebuildProvablyUnlocked\n" ++
  "    && !composeSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-COMPOSE-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"COMPOSE-SUBSET-REBUILD\")\n" ++
  "    && (composeSubsetRebuildInputId == \"SLAKE_COMPOSE_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-compose-subset-rebuild\")\n" ++
  "    && (justRecipe == \"compose-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_compose_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_compose_subset.c\")\n"

/-- Collapse of the on-disk multi-line composeSubsetRebuildReady body. -/
def hostModuleCheckComposeSubsetRebuildReadyMultilineOk : Bool :=
  composeSubsetRebuildReadyBodyOk hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText

def hostModuleCheckComposeSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk
    && (checkDepthComposeSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthComposeSubsetRebuildTermSurfaceScope == "ComposeSubsetRebuild-only")
    && hostModuleCheckComposeSubsetRebuildTermDialectOk
    && hostModuleCheckBadComposeSubsetRebuildResidualDialectReject
    && hostModuleCheckBadComposeSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadComposeSubsetRebuildReadyDialectReject
    && hostModuleCheckBadComposeSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadComposeSubsetRebuildResidualL0Accept
    && hostModuleCheckBadComposeSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadComposeSubsetRebuildReadyL0Accept
    && hostModuleCheckBadComposeSubsetRebuildCompleteL0Accept
    && hostModuleCheckComposeSubsetRebuildReadyMultilineOk

theorem hostModuleCheckComposeSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckComposeSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckComposeSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckComposeSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_composeSubsetRebuild_term_surface_ids_eq :
    checkDepthComposeSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthComposeSubsetRebuildTermSurfaceScope = "ComposeSubsetRebuild-only"
      && hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm
