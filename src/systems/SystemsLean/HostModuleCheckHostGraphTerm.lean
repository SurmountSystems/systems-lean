/-
  SYSTEMS_LEAN_HOST partial -- HostGraph L2 term-surface (HostGraph TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Host fragment graph dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  HostGraph L2 dialect subset (documented; not full Lean 4 elaborator):
  - hostGraphReady compose matches product (goldens + ids + HostFront
    reuse + Lake + residual remains + peer-green + living false residual-free
    / complete / proof / llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - peer-green honesty pin true (does not claim peer green).
  - host residual remains true; stillUsesLake / dependsOnLake true.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostGraphTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostGraphTermSurfaceOk.

  Intentional non-claims:
  - HostGraph Mult-first fragment graph only -- not package elaborate,
    not FullHost re-true. Skip HostGraphTheorems (proof companion).
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostGraphTerm, TERM-SURFACE, HostGraph-only,
  ILL-TYPED-TERM, checkHostGraphTermDialect,
  hostModuleCheckHostGraphTermDialectOk,
  hostModuleCheckHostGraphTermSurfaceDualOk,
  hostModuleCheckHostGraphTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostGraphTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostGraphTerm;
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

/-! ### HostGraph L2 term-surface dual-ok pins (HostGraph-only) -/

def checkDepthHostGraphTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostGraphTermSurfaceScope : String := "HostGraph-only"
def hostModuleCheckHostGraphTermSurfaceDualOk : Bool := true

/-- Product hostGraphReady fold (goldens + ids + HostFront reuse +
    Lake + residual + peer-green + living false claims). Same string as the
    collapsed on-disk HostGraph body so L0 fixtures and product match. -/
def hostGraphReadyTermBody : String :=
  "hostGraphGoldensStructuralOk && hostGraphIdsOk && hostGraphReusesHostFront && stillUsesLake && dependsOnLake && hostGraphStillUsesLake && hostGraphDependsOnLake && hostGraphHostElaboratorResidualRemains && hostGraphDoesNotClaimPeerGreen && !hostGraphResidualFreeClaimed && !hostGraphProductSelfHostCompleteClaimed && !hostGraphProofCompleteClaimed && !hostGraphLlvmUnlocked && !hostGraphProvablyUnlocked"

def hostGraphReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphReady" with
  | none => false
  | some body => body == hostGraphReadyTermBody

def hostGraphResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostGraphCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostGraphProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostGraphLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostGraphProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostGraphPeerGreenBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphDoesNotClaimPeerGreen" with
  | none => false
  | some body => body == "true"

def hostGraphHostResidualBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostGraphHostElaboratorResidualRemains" with
  | none => false
  | some body => body == "true"

def hostGraphStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostGraphDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostGraphTermDialect (content : String) : Option String :=
  if !hostGraphReadyBodyOk content then some reasonIllTypedTerm
  else if !hostGraphResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostGraphCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostGraphProofBodyOk content then some reasonIllTypedTerm
  else if !hostGraphLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostGraphProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostGraphPeerGreenBodyOk content then some reasonIllTypedTerm
  else if !hostGraphHostResidualBodyOk content then some reasonIllTypedTerm
  else if !hostGraphStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostGraphDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostGraphWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostGraphTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostGraphTermSkeletonPrefix : String :=
  "import SystemsLean.HostFront\n" ++
  "import SystemsLean.HostTerm\n" ++
  "namespace SystemsLean.HostGraph\n"

def hostModuleCheckHostGraphTermSkeletonSuffix : String :=
  "end SystemsLean.HostGraph\n"

/-- Honest HostGraph TERM mid: required L0 decls plus living claim pins. -/
def hostGraphTermGoodPins (readyBody residual complete proof llvm provably
    peerGreen hostResidual lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_GRAPH_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH\"\n" ++
  "def surfaceId : String := \"HOST-GRAPH\"\n" ++
  "def justRecipe : String := \"host-graph\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostGraphHostElaboratorResidualRemains : Bool := " ++ hostResidual ++ "\n" ++
  "def hostGraphDoesNotClaimPeerGreen : Bool := " ++ peerGreen ++ "\n" ++
  "def hostGraphResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostGraphProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostGraphProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostGraphLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostGraphProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostGraphReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostGraphTermGoodMid : String :=
  hostGraphTermGoodPins hostGraphReadyTermBody
    "false" "false" "false" "false" "false" "true" "true" "true"

def hostModuleCheckGoodHostGraphTermText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostModuleCheckHostGraphTermGoodMid
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphResidualText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "true" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphCompleteText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "true" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphReadyText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins "true"
      "false" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphPeerGreenText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphProofText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "false" "true" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphLlvmText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "false" "false" "true" "false" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphProvablyText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "false" "false" "false" "true" "true" "true" "true"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostModuleCheckBadHostGraphLakeText : String :=
  hostModuleCheckHostGraphTermSkeletonPrefix
    ++ hostGraphTermGoodPins hostGraphReadyTermBody
      "false" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckHostGraphTermSkeletonSuffix

def hostGraphTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostGraph"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostGraphTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostGraphTermSurfaceFrom content)
    hostGraphExpectedNamespace hostGraphRequiredDecls
    (some "SystemsLean.HostFront")).isAccept

def hostGraphTermDialectReject (content : String) : Bool :=
  match checkHostGraphTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostGraphResidualL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphResidualText

def hostModuleCheckBadHostGraphResidualDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphResidualText

def hostModuleCheckBadHostGraphCompleteL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphCompleteText

def hostModuleCheckBadHostGraphCompleteDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphCompleteText

def hostModuleCheckBadHostGraphReadyL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphReadyText

def hostModuleCheckBadHostGraphReadyDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphReadyText

def hostModuleCheckBadHostGraphPeerGreenL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphPeerGreenText

def hostModuleCheckBadHostGraphPeerGreenDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphPeerGreenText

def hostModuleCheckBadHostGraphProofL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphProofText

def hostModuleCheckBadHostGraphProofDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphProofText

def hostModuleCheckBadHostGraphLlvmL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphLlvmText

def hostModuleCheckBadHostGraphLlvmDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphLlvmText

def hostModuleCheckBadHostGraphProvablyL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphProvablyText

def hostModuleCheckBadHostGraphProvablyDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphProvablyText

def hostModuleCheckBadHostGraphLakeL0Accept : Bool :=
  hostGraphTermL0Accept hostModuleCheckBadHostGraphLakeText

def hostModuleCheckBadHostGraphLakeDialectReject : Bool :=
  hostGraphTermDialectReject hostModuleCheckBadHostGraphLakeText

def hostModuleCheckHostGraphTermDialectOk : Bool :=
  (checkHostGraphTermDialect hostModuleCheckGoodHostGraphTermText).isNone

/-- On-disk HostGraph hostGraphReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostGraphReadyMultilineText : String :=
  "def hostGraphReady : Bool :=\n" ++
  "  hostGraphGoldensStructuralOk\n" ++
  "    && hostGraphIdsOk\n" ++
  "    && hostGraphReusesHostFront\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostGraphStillUsesLake\n" ++
  "    && hostGraphDependsOnLake\n" ++
  "    && hostGraphHostElaboratorResidualRemains\n" ++
  "    && hostGraphDoesNotClaimPeerGreen\n" ++
  "    && !hostGraphResidualFreeClaimed\n" ++
  "    && !hostGraphProductSelfHostCompleteClaimed\n" ++
  "    && !hostGraphProofCompleteClaimed\n" ++
  "    && !hostGraphLlvmUnlocked\n" ++
  "    && !hostGraphProvablyUnlocked\n"

/-- Collapse of the on-disk multi-line hostGraphReady body. -/
def hostModuleCheckHostGraphReadyMultilineOk : Bool :=
  hostGraphReadyBodyOk hostModuleCheckGoodHostGraphReadyMultilineText

def hostModuleCheckHostGraphTermSurfaceOk : Bool :=
  hostModuleCheckHostGraphTermSurfaceDualOk
    && (checkDepthHostGraphTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostGraphTermSurfaceScope == "HostGraph-only")
    && hostModuleCheckHostGraphTermDialectOk
    && hostModuleCheckBadHostGraphResidualDialectReject
    && hostModuleCheckBadHostGraphCompleteDialectReject
    && hostModuleCheckBadHostGraphReadyDialectReject
    && hostModuleCheckBadHostGraphPeerGreenDialectReject
    && hostModuleCheckBadHostGraphProofDialectReject
    && hostModuleCheckBadHostGraphLlvmDialectReject
    && hostModuleCheckBadHostGraphProvablyDialectReject
    && hostModuleCheckBadHostGraphLakeDialectReject
    && hostModuleCheckBadHostGraphResidualL0Accept
    && hostModuleCheckBadHostGraphCompleteL0Accept
    && hostModuleCheckBadHostGraphReadyL0Accept
    && hostModuleCheckBadHostGraphPeerGreenL0Accept
    && hostModuleCheckBadHostGraphProofL0Accept
    && hostModuleCheckBadHostGraphLlvmL0Accept
    && hostModuleCheckBadHostGraphProvablyL0Accept
    && hostModuleCheckBadHostGraphLakeL0Accept
    && hostModuleCheckHostGraphReadyMultilineOk

theorem hostModuleCheckHostGraphTermSurfaceOk_true :
    hostModuleCheckHostGraphTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostGraphReadyMultilineOk_true :
    hostModuleCheckHostGraphReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostGraph_term_surface_ids_eq :
    checkDepthHostGraphTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostGraphTermSurfaceScope = "HostGraph-only"
      && hostModuleCheckHostGraphTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
