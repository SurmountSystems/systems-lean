/-
  SYSTEMS_LEAN_HOST partial -- GraphSubsetRebuild L2 term-surface (GraphSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: GraphSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  GraphSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Graph rebuild self-apply body matches product (graphSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && graphSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - graphSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckGraphSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - GraphSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitGraphReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckGraphSubsetRebuildTerm, TERM-SURFACE, GraphSubsetRebuild-only,
  ILL-TYPED-TERM, checkGraphSubsetRebuildTermDialect,
  hostModuleCheckGraphSubsetRebuildTermDialectOk,
  hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckGraphSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckGraphSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm;
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

/-! ### GraphSubsetRebuild L2 term-surface dual-ok pins (GraphSubsetRebuild-only) -/

def checkDepthGraphSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthGraphSubsetRebuildTermSurfaceScope : String := "GraphSubsetRebuild-only"
def hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product graphSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    GraphSubsetRebuild match. Not emitGraphReady. -/
def graphSubsetRebuildSelfApplyOkTermBody : String :=
  "graphSubsetRebuildInputReady && graphSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_graph_subset.h\") && (emitSourceBase == \"slake_graph_subset.c\") && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\") && graphSubsetEmitWroteExpected && (graphSubsetHeaderPackage.length > 0) && (graphSubsetSourcePackage.length > 0)"

/-- Product graphSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def graphSubsetRebuildWroteExpectedTermBody : String :=
  "graphSubsetRebuildSelfApplyOk && graphSubsetEmitWroteExpected"

/-- Product graphSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    GraphSubsetRebuild match. -/
def graphSubsetRebuildReadyTermBody : String :=
  "graphSubsetRebuildInputReady && graphSubsetRebuildPackagePinOk && graphSubsetRebuildSelfApplyOk && graphSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !graphSubsetRebuildResidualFreeClaimed && !graphSubsetRebuildProductSelfHostCompleteClaimed && !graphSubsetRebuildProofCompleteClaimed && !graphSubsetRebuildLlvmUnlocked && !graphSubsetRebuildProvablyUnlocked && !graphSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_GRAPH_SUBSET_REBUILD_V0\") && (hostId == \"HOST-GRAPH-SUBSET-REBUILD\") && (surfaceId == \"GRAPH-SUBSET-REBUILD\") && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-graph-subset-rebuild\") && (justRecipe == \"graph-subset-rebuild\") && (emitHeaderBase == \"slake_graph_subset.h\") && (emitSourceBase == \"slake_graph_subset.c\")"

def graphSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == graphSubsetRebuildSelfApplyOkTermBody

def graphSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == graphSubsetRebuildWroteExpectedTermBody

def graphSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetRebuildReady" with
  | none => false
  | some body => body == graphSubsetRebuildReadyTermBody

def checkGraphSubsetRebuildTermDialect (content : String) : Option String :=
  if !graphSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineGraphSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkGraphSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.GraphSubsetEmit\n" ++
  "namespace SystemsLean.GraphSubsetRebuild\n"

def hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.GraphSubsetRebuild\n"

def hostModuleCheckGraphSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodGraphSubsetRebuildTermText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckGraphSubsetRebuildTermGoodMid
    ++ hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildResidualText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildSelfApplyText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildReadyText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := true\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetRebuildCompleteText : String :=
  hostModuleCheckGraphSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++ graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++ graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

def graphSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.GraphSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadGraphSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildResidualText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildResidualDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildSelfApplyText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildReadyText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildReadyDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (graphSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadGraphSubsetRebuildCompleteText)
    graphSubsetRebuildExpectedNamespace graphSubsetRebuildRequiredDecls
    (some "SystemsLean.GraphSubsetEmit")).isAccept

def hostModuleCheckBadGraphSubsetRebuildCompleteDialectReject : Bool :=
  match checkGraphSubsetRebuildTermDialect hostModuleCheckBadGraphSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckGraphSubsetRebuildTermDialectOk : Bool :=
  (checkGraphSubsetRebuildTermDialect hostModuleCheckGoodGraphSubsetRebuildTermText).isNone

/-- On-disk GraphSubsetRebuild graphSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText : String :=
  "def graphSubsetRebuildReady : Bool :=\n" ++
  "  graphSubsetRebuildInputReady\n" ++
  "    && graphSubsetRebuildPackagePinOk\n" ++
  "    && graphSubsetRebuildSelfApplyOk\n" ++
  "    && graphSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !graphSubsetRebuildResidualFreeClaimed\n" ++
  "    && !graphSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !graphSubsetRebuildProofCompleteClaimed\n" ++
  "    && !graphSubsetRebuildLlvmUnlocked\n" ++
  "    && !graphSubsetRebuildProvablyUnlocked\n" ++
  "    && !graphSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_GRAPH_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-GRAPH-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"GRAPH-SUBSET-REBUILD\")\n" ++
  "    && (graphSubsetRebuildInputId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-graph-subset-rebuild\")\n" ++
  "    && (justRecipe == \"graph-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_graph_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_graph_subset.c\")\n"

/-- Collapse of the on-disk multi-line graphSubsetRebuildReady body. -/
def hostModuleCheckGraphSubsetRebuildReadyMultilineOk : Bool :=
  graphSubsetRebuildReadyBodyOk hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText

def hostModuleCheckGraphSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk
    && (checkDepthGraphSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthGraphSubsetRebuildTermSurfaceScope == "GraphSubsetRebuild-only")
    && hostModuleCheckGraphSubsetRebuildTermDialectOk
    && hostModuleCheckBadGraphSubsetRebuildResidualDialectReject
    && hostModuleCheckBadGraphSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadGraphSubsetRebuildReadyDialectReject
    && hostModuleCheckBadGraphSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadGraphSubsetRebuildResidualL0Accept
    && hostModuleCheckBadGraphSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadGraphSubsetRebuildReadyL0Accept
    && hostModuleCheckBadGraphSubsetRebuildCompleteL0Accept
    && hostModuleCheckGraphSubsetRebuildReadyMultilineOk

theorem hostModuleCheckGraphSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckGraphSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckGraphSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckGraphSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_graphSubsetRebuild_term_surface_ids_eq :
    checkDepthGraphSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthGraphSubsetRebuildTermSurfaceScope = "GraphSubsetRebuild-only"
      && hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
