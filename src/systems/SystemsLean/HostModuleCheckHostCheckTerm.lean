/-
  SYSTEMS_LEAN_HOST partial -- HostCheck L2 term-surface (HostCheck TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Host fragment check dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  HostCheck L2 dialect subset (documented; not full Lean 4 elaborator):
  - hostFragmentCheckReady compose matches product (corpus + ids + HostFront
    reuse + Lake + residual remains + peer-green + living false residual-free
    / complete / proof / llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - peer-green honesty pin true (does not claim peer green).
  - host residual remains true; stillUsesLake / dependsOnLake true.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostCheckTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostCheckTermSurfaceOk.

  Intentional non-claims:
  - HostCheck Mult-first fragment check only -- not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostCheckTerm, TERM-SURFACE, HostCheck-only,
  ILL-TYPED-TERM, checkHostCheckTermDialect,
  hostModuleCheckHostCheckTermDialectOk,
  hostModuleCheckHostCheckTermSurfaceDualOk,
  hostModuleCheckHostCheckTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostCheckTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostCheckTerm;
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

/-! ### HostCheck L2 term-surface dual-ok pins (HostCheck-only) -/

def checkDepthHostCheckTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostCheckTermSurfaceScope : String := "HostCheck-only"
def hostModuleCheckHostCheckTermSurfaceDualOk : Bool := true

/-- Product hostFragmentCheckReady fold (corpus + ids + HostFront reuse +
    Lake + residual + peer-green + living false claims). Same string as the
    collapsed on-disk HostCheck body so L0 fixtures and product match. -/
def hostFragmentCheckReadyTermBody : String :=
  "hostFragmentCheckCorpusOk && hostFragmentCheckIdsOk && hostFragmentCheckReusesHostFront && stillUsesLake && dependsOnLake && hostFragmentCheckStillUsesLake && hostFragmentCheckDependsOnLake && hostFragmentCheckHostElaboratorResidualRemains && hostFragmentCheckDoesNotClaimPeerGreen && !hostFragmentCheckResidualFreeClaimed && !hostFragmentCheckProductSelfHostCompleteClaimed && !hostFragmentCheckProofCompleteClaimed && !hostFragmentCheckLlvmUnlocked && !hostFragmentCheckProvablyUnlocked"

def hostFragmentCheckReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckReady" with
  | none => false
  | some body => body == hostFragmentCheckReadyTermBody

def hostFragmentCheckResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostFragmentCheckPeerGreenBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckDoesNotClaimPeerGreen" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckHostResidualBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFragmentCheckHostElaboratorResidualRemains" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostFragmentCheckDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostCheckTermDialect (content : String) : Option String :=
  if !hostFragmentCheckReadyBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckProofBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckPeerGreenBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckHostResidualBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostFragmentCheckDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostCheckWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostCheckTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostCheckTermSkeletonPrefix : String :=
  "import SystemsLean.HostFront\n" ++
  "namespace SystemsLean.HostCheck\n"

def hostModuleCheckHostCheckTermSkeletonSuffix : String :=
  "end SystemsLean.HostCheck\n"

/-- Honest HostCheck TERM mid: required L0 decls plus living claim pins. -/
def hostCheckTermGoodPins (readyBody residual complete proof llvm provably
    peerGreen hostResidual lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_FRAGMENT_CHECK_V0\"\n" ++
  "def hostId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def surfaceId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def justRecipe : String := \"host-fragment-check\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFragmentCheckHostElaboratorResidualRemains : Bool := " ++ hostResidual ++ "\n" ++
  "def hostFragmentCheckDoesNotClaimPeerGreen : Bool := " ++ peerGreen ++ "\n" ++
  "def hostFragmentCheckResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostFragmentCheckProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostFragmentCheckProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostFragmentCheckLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostFragmentCheckProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostFragmentCheckReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostCheckTermGoodMid : String :=
  hostCheckTermGoodPins hostFragmentCheckReadyTermBody
    "false" "false" "false" "false" "false" "true" "true" "true"

def hostModuleCheckGoodHostCheckTermText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostModuleCheckHostCheckTermGoodMid
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckResidualText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "true" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckCompleteText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "true" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckReadyText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins "true"
      "false" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckPeerGreenText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckProofText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "true" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckLlvmText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "true" "false" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckProvablyText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "true" "true" "true" "true"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostModuleCheckBadHostCheckLakeText : String :=
  hostModuleCheckHostCheckTermSkeletonPrefix
    ++ hostCheckTermGoodPins hostFragmentCheckReadyTermBody
      "false" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckHostCheckTermSkeletonSuffix

def hostCheckTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostCheck"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostCheckTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostCheckTermSurfaceFrom content)
    hostCheckExpectedNamespace hostCheckRequiredDecls
    (some "SystemsLean.HostFront")).isAccept

def hostCheckTermDialectReject (content : String) : Bool :=
  match checkHostCheckTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostCheckResidualL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckResidualText

def hostModuleCheckBadHostCheckResidualDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckResidualText

def hostModuleCheckBadHostCheckCompleteL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckCompleteText

def hostModuleCheckBadHostCheckCompleteDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckCompleteText

def hostModuleCheckBadHostCheckReadyL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckReadyText

def hostModuleCheckBadHostCheckReadyDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckReadyText

def hostModuleCheckBadHostCheckPeerGreenL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckPeerGreenText

def hostModuleCheckBadHostCheckPeerGreenDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckPeerGreenText

def hostModuleCheckBadHostCheckProofL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckProofText

def hostModuleCheckBadHostCheckProofDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckProofText

def hostModuleCheckBadHostCheckLlvmL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckLlvmText

def hostModuleCheckBadHostCheckLlvmDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckLlvmText

def hostModuleCheckBadHostCheckProvablyL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckProvablyText

def hostModuleCheckBadHostCheckProvablyDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckProvablyText

def hostModuleCheckBadHostCheckLakeL0Accept : Bool :=
  hostCheckTermL0Accept hostModuleCheckBadHostCheckLakeText

def hostModuleCheckBadHostCheckLakeDialectReject : Bool :=
  hostCheckTermDialectReject hostModuleCheckBadHostCheckLakeText

def hostModuleCheckHostCheckTermDialectOk : Bool :=
  (checkHostCheckTermDialect hostModuleCheckGoodHostCheckTermText).isNone

/-- On-disk HostCheck hostFragmentCheckReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostCheckReadyMultilineText : String :=
  "def hostFragmentCheckReady : Bool :=\n" ++
  "  hostFragmentCheckCorpusOk\n" ++
  "    && hostFragmentCheckIdsOk\n" ++
  "    && hostFragmentCheckReusesHostFront\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostFragmentCheckStillUsesLake\n" ++
  "    && hostFragmentCheckDependsOnLake\n" ++
  "    && hostFragmentCheckHostElaboratorResidualRemains\n" ++
  "    && hostFragmentCheckDoesNotClaimPeerGreen\n" ++
  "    && !hostFragmentCheckResidualFreeClaimed\n" ++
  "    && !hostFragmentCheckProductSelfHostCompleteClaimed\n" ++
  "    && !hostFragmentCheckProofCompleteClaimed\n" ++
  "    && !hostFragmentCheckLlvmUnlocked\n" ++
  "    && !hostFragmentCheckProvablyUnlocked\n"

/-- Collapse of the on-disk multi-line hostFragmentCheckReady body. -/
def hostModuleCheckHostCheckReadyMultilineOk : Bool :=
  hostFragmentCheckReadyBodyOk hostModuleCheckGoodHostCheckReadyMultilineText

def hostModuleCheckHostCheckTermSurfaceOk : Bool :=
  hostModuleCheckHostCheckTermSurfaceDualOk
    && (checkDepthHostCheckTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostCheckTermSurfaceScope == "HostCheck-only")
    && hostModuleCheckHostCheckTermDialectOk
    && hostModuleCheckBadHostCheckResidualDialectReject
    && hostModuleCheckBadHostCheckCompleteDialectReject
    && hostModuleCheckBadHostCheckReadyDialectReject
    && hostModuleCheckBadHostCheckPeerGreenDialectReject
    && hostModuleCheckBadHostCheckProofDialectReject
    && hostModuleCheckBadHostCheckLlvmDialectReject
    && hostModuleCheckBadHostCheckProvablyDialectReject
    && hostModuleCheckBadHostCheckLakeDialectReject
    && hostModuleCheckBadHostCheckResidualL0Accept
    && hostModuleCheckBadHostCheckCompleteL0Accept
    && hostModuleCheckBadHostCheckReadyL0Accept
    && hostModuleCheckBadHostCheckPeerGreenL0Accept
    && hostModuleCheckBadHostCheckProofL0Accept
    && hostModuleCheckBadHostCheckLlvmL0Accept
    && hostModuleCheckBadHostCheckProvablyL0Accept
    && hostModuleCheckBadHostCheckLakeL0Accept
    && hostModuleCheckHostCheckReadyMultilineOk

theorem hostModuleCheckHostCheckTermSurfaceOk_true :
    hostModuleCheckHostCheckTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostCheckReadyMultilineOk_true :
    hostModuleCheckHostCheckReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostCheck_term_surface_ids_eq :
    checkDepthHostCheckTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostCheckTermSurfaceScope = "HostCheck-only"
      && hostModuleCheckHostCheckTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
