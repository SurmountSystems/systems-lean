/-
  SYSTEMS_LEAN_HOST partial -- GraphSubsetEmit L2 term-surface (GraphSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: GraphSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  GraphSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Graph emit dialect body matches product (emitGraphReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - graphSubsetEmitReady compose matches product (CompilePathGraph chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckGraphSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckGraphSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - GraphSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckGraphSubsetEmitTerm, TERM-SURFACE, GraphSubsetEmit-only,
  ILL-TYPED-TERM, checkGraphSubsetEmitTermDialect,
  hostModuleCheckGraphSubsetEmitTermDialectOk,
  hostModuleCheckGraphSubsetEmitTermSurfaceDualOk,
  hostModuleCheckGraphSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckGraphSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckGraphSubsetEmitTerm;
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

/-! ### GraphSubsetEmit L2 term-surface dual-ok pins (GraphSubsetEmit-only) -/

def checkDepthGraphSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthGraphSubsetEmitTermSurfaceScope : String := "GraphSubsetEmit-only"
def hostModuleCheckGraphSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product graphSubsetEmitReady fold (Graph fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk GraphSubsetEmit match. -/
def graphSubsetEmitReadyTermBody : String :=
  "graphSubsetEmitInputReady && graphSubsetEmitGraphDialectOk && graphSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !graphSubsetEmitResidualFreeClaimed && !graphSubsetEmitProductSelfHostCompleteClaimed && !graphSubsetEmitProofCompleteClaimed && !graphSubsetEmitLlvmUnlocked && !graphSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\") && (hostId == \"HOST-GRAPH-SUBSET-EMIT\") && (surfaceId == \"GRAPH-SUBSET-EMIT\") && (graphSubsetEmitInputId == \"SLAKE_GRAPH_SUBSET_GRAPH\") && (lakeExeName == \"slake-graph-subset-emit\") && (justRecipe == \"graph-subset-emit\")"

def graphSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetEmitGraphDialectOk" with
  | none => false
  | some body => body == "emitGraphReady"

def graphSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def graphSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphSubsetEmitReady" with
  | none => false
  | some body => body == graphSubsetEmitReadyTermBody

def checkGraphSubsetEmitTermDialect (content : String) : Option String :=
  if !graphSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !graphSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineGraphSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkGraphSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckGraphSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "import SystemsLean.EmitGraph\n" ++
  "namespace SystemsLean.GraphSubsetEmit\n"

def hostModuleCheckGraphSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.GraphSubsetEmit\n"

def hostModuleCheckGraphSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodGraphSubsetEmitTermText : String :=
  hostModuleCheckGraphSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckGraphSubsetEmitTermGoodMid
    ++ hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetEmitResidualText : String :=
  hostModuleCheckGraphSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetEmitEmitText : String :=
  hostModuleCheckGraphSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := true\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetEmitReadyText : String :=
  hostModuleCheckGraphSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := true\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadGraphSubsetEmitCompleteText : String :=
  hostModuleCheckGraphSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

def graphSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.GraphSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadGraphSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (graphSubsetEmitTermSurfaceFrom
      hostModuleCheckBadGraphSubsetEmitResidualText)
    graphSubsetEmitExpectedNamespace graphSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathGraph")).isAccept

def hostModuleCheckBadGraphSubsetEmitResidualDialectReject : Bool :=
  match checkGraphSubsetEmitTermDialect hostModuleCheckBadGraphSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (graphSubsetEmitTermSurfaceFrom
      hostModuleCheckBadGraphSubsetEmitEmitText)
    graphSubsetEmitExpectedNamespace graphSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathGraph")).isAccept

def hostModuleCheckBadGraphSubsetEmitEmitDialectReject : Bool :=
  match checkGraphSubsetEmitTermDialect hostModuleCheckBadGraphSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (graphSubsetEmitTermSurfaceFrom
      hostModuleCheckBadGraphSubsetEmitReadyText)
    graphSubsetEmitExpectedNamespace graphSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathGraph")).isAccept

def hostModuleCheckBadGraphSubsetEmitReadyDialectReject : Bool :=
  match checkGraphSubsetEmitTermDialect hostModuleCheckBadGraphSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadGraphSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (graphSubsetEmitTermSurfaceFrom
      hostModuleCheckBadGraphSubsetEmitCompleteText)
    graphSubsetEmitExpectedNamespace graphSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathGraph")).isAccept

def hostModuleCheckBadGraphSubsetEmitCompleteDialectReject : Bool :=
  match checkGraphSubsetEmitTermDialect hostModuleCheckBadGraphSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckGraphSubsetEmitTermDialectOk : Bool :=
  (checkGraphSubsetEmitTermDialect hostModuleCheckGoodGraphSubsetEmitTermText).isNone

/-- On-disk GraphSubsetEmit graphSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodGraphSubsetEmitReadyMultilineText : String :=
  "def graphSubsetEmitReady : Bool :=\n" ++
  "  graphSubsetEmitInputReady\n" ++
  "    && graphSubsetEmitGraphDialectOk\n" ++
  "    && graphSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !graphSubsetEmitResidualFreeClaimed\n" ++
  "    && !graphSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !graphSubsetEmitProofCompleteClaimed\n" ++
  "    && !graphSubsetEmitLlvmUnlocked\n" ++
  "    && !graphSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_GRAPH_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-GRAPH-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"GRAPH-SUBSET-EMIT\")\n" ++
  "    && (graphSubsetEmitInputId == \"SLAKE_GRAPH_SUBSET_GRAPH\")\n" ++
  "    && (lakeExeName == \"slake-graph-subset-emit\")\n" ++
  "    && (justRecipe == \"graph-subset-emit\")\n"

/-- Collapse of the on-disk multi-line graphSubsetEmitReady body. -/
def hostModuleCheckGraphSubsetEmitReadyMultilineOk : Bool :=
  graphSubsetEmitReadyBodyOk hostModuleCheckGoodGraphSubsetEmitReadyMultilineText

def hostModuleCheckGraphSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckGraphSubsetEmitTermSurfaceDualOk
    && (checkDepthGraphSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthGraphSubsetEmitTermSurfaceScope == "GraphSubsetEmit-only")
    && hostModuleCheckGraphSubsetEmitTermDialectOk
    && hostModuleCheckBadGraphSubsetEmitResidualDialectReject
    && hostModuleCheckBadGraphSubsetEmitEmitDialectReject
    && hostModuleCheckBadGraphSubsetEmitReadyDialectReject
    && hostModuleCheckBadGraphSubsetEmitCompleteDialectReject
    && hostModuleCheckBadGraphSubsetEmitResidualL0Accept
    && hostModuleCheckBadGraphSubsetEmitEmitL0Accept
    && hostModuleCheckBadGraphSubsetEmitReadyL0Accept
    && hostModuleCheckBadGraphSubsetEmitCompleteL0Accept
    && hostModuleCheckGraphSubsetEmitReadyMultilineOk

theorem hostModuleCheckGraphSubsetEmitTermSurfaceOk_true :
    hostModuleCheckGraphSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckGraphSubsetEmitReadyMultilineOk_true :
    hostModuleCheckGraphSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_graphSubsetEmit_term_surface_ids_eq :
    checkDepthGraphSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthGraphSubsetEmitTermSurfaceScope = "GraphSubsetEmit-only"
      && hostModuleCheckGraphSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
