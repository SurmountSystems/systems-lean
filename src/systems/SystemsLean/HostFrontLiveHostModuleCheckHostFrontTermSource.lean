/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckHostFrontTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckHostFrontTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckHostFrontTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckHostFrontTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKHOSTFRONTTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckHostFrontTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm

/-- Dual-pinned live HostModuleCheckHostFrontTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckHostFrontTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKHOSTFRONTTERM. -/
def liveHostModuleCheckHostFrontTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostFront L2 term-surface (HostFront TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostFront dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  HostFront L2 dialect subset (documented; not full Lean 4 elaborator):
  - hostFrontReady compose matches product (goldens G1..G7 + B1..B4 + ids +
    Mult grades + HostTerm reuse + Lake + residual remains + peer-green +
    living false residual-free / complete / proof / llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - peer-green honesty pin true (does not claim peer green).
  - host residual remains true; stillUsesLake / dependsOnLake true.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostFrontTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostFrontTermSurfaceOk.

  Intentional non-claims:
  - HostFront Mult-first fragment front-end only -- not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostFrontTerm, TERM-SURFACE, HostFront-only,
  ILL-TYPED-TERM, checkHostFrontTermDialect,
  hostModuleCheckHostFrontTermDialectOk,
  hostModuleCheckHostFrontTermSurfaceDualOk,
  hostModuleCheckHostFrontTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostFrontTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostFrontTerm;
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

/-! ### HostFront L2 term-surface dual-ok pins (HostFront-only) -/

def checkDepthHostFrontTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostFrontTermSurfaceScope : String := "HostFront-only"
def hostModuleCheckHostFrontTermSurfaceDualOk : Bool := true

/-- Product hostFrontReady fold (goldens + ids + Mult grades + HostTerm reuse +
    Lake + residual + peer-green + living false claims). Same string as the
    collapsed on-disk HostFront body so L0 fixtures and product match. -/
def hostFrontReadyTermBody : String :=
  "hostFrontGoldensStructuralOk && hostFrontIdsOk && hostFrontMultGradesOk && hostFrontReusesHostTerm && stillUsesLake && dependsOnLake && hostFrontStillUsesLake && hostFrontDependsOnLake && hostFrontHostElaboratorResidualRemains && hostFrontDoesNotClaimPeerGreen && !hostFrontResidualFreeClaimed && !hostFrontProductSelfHostCompleteClaimed && !hostFrontProofCompleteClaimed && !hostFrontLlvmUnlocked && !hostFrontProvablyUnlocked"

def hostFrontReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontReady" with
  | none => false
  | some body => body == hostFrontReadyTermBody

def hostFrontResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostFrontCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFrontProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostFrontLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostFrontProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostFrontPeerGreenBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontDoesNotClaimPeerGreen" with
  | none => false
  | some body => body == "true"

def hostFrontHostResidualBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostFrontHostElaboratorResidualRemains" with
  | none => false
  | some body => body == "true"

def hostFrontStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostFrontDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostFrontTermDialect (content : String) : Option String :=
  if !hostFrontReadyBodyOk content then some reasonIllTypedTerm
  else if !hostFrontResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostFrontCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostFrontProofBodyOk content then some reasonIllTypedTerm
  else if !hostFrontLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostFrontProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostFrontPeerGreenBodyOk content then some reasonIllTypedTerm
  else if !hostFrontHostResidualBodyOk content then some reasonIllTypedTerm
  else if !hostFrontStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostFrontDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostFrontWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostFrontTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostFrontTermSkeletonPrefix : String :=
  "import SystemsLean.HostTerm\n" ++
  "namespace SystemsLean.HostFront\n"

def hostModuleCheckHostFrontTermSkeletonSuffix : String :=
  "end SystemsLean.HostFront\n"

/-- Honest HostFront TERM mid: required L0 decls plus living claim pins. -/
def hostFrontTermGoodPins (readyBody residual complete proof llvm provably
    peerGreen hostResidual lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_FRONT_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT\"\n" ++
  "def surfaceId : String := \"HOST-FRONT\"\n" ++
  "def justRecipe : String := \"host-front\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFrontHostElaboratorResidualRemains : Bool := " ++ hostResidual ++ "\n" ++
  "def hostFrontDoesNotClaimPeerGreen : Bool := " ++ peerGreen ++ "\n" ++
  "def hostFrontResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostFrontProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostFrontProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostFrontLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostFrontProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostFrontReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostFrontTermGoodMid : String :=
  hostFrontTermGoodPins hostFrontReadyTermBody
    "false" "false" "false" "false" "false" "true" "true" "true"

def hostModuleCheckGoodHostFrontTermText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostModuleCheckHostFrontTermGoodMid
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontResidualText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "true" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontCompleteText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "true" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontReadyText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins "true"
      "false" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontPeerGreenText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontProofText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "false" "true" "false" "false" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontLlvmText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "false" "false" "true" "false" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontProvablyText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "false" "false" "false" "true" "true" "true" "true"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostModuleCheckBadHostFrontLakeText : String :=
  hostModuleCheckHostFrontTermSkeletonPrefix
    ++ hostFrontTermGoodPins hostFrontReadyTermBody
      "false" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckHostFrontTermSkeletonSuffix

def hostFrontTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostFront"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostFrontTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostFrontTermSurfaceFrom content)
    hostFrontExpectedNamespace hostFrontRequiredDecls
    (some "SystemsLean.HostTerm")).isAccept

def hostFrontTermDialectReject (content : String) : Bool :=
  match checkHostFrontTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostFrontResidualL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontResidualText

def hostModuleCheckBadHostFrontResidualDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontResidualText

def hostModuleCheckBadHostFrontCompleteL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontCompleteText

def hostModuleCheckBadHostFrontCompleteDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontCompleteText

def hostModuleCheckBadHostFrontReadyL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontReadyText

def hostModuleCheckBadHostFrontReadyDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontReadyText

def hostModuleCheckBadHostFrontPeerGreenL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontPeerGreenText

def hostModuleCheckBadHostFrontPeerGreenDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontPeerGreenText

def hostModuleCheckBadHostFrontProofL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontProofText

def hostModuleCheckBadHostFrontProofDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontProofText

def hostModuleCheckBadHostFrontLlvmL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontLlvmText

def hostModuleCheckBadHostFrontLlvmDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontLlvmText

def hostModuleCheckBadHostFrontProvablyL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontProvablyText

def hostModuleCheckBadHostFrontProvablyDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontProvablyText

def hostModuleCheckBadHostFrontLakeL0Accept : Bool :=
  hostFrontTermL0Accept hostModuleCheckBadHostFrontLakeText

def hostModuleCheckBadHostFrontLakeDialectReject : Bool :=
  hostFrontTermDialectReject hostModuleCheckBadHostFrontLakeText

def hostModuleCheckHostFrontTermDialectOk : Bool :=
  (checkHostFrontTermDialect hostModuleCheckGoodHostFrontTermText).isNone

/-- On-disk HostFront hostFrontReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostFrontReadyMultilineText : String :=
  "def hostFrontReady : Bool :=\n" ++
  "  hostFrontGoldensStructuralOk\n" ++
  "    && hostFrontIdsOk\n" ++
  "    && hostFrontMultGradesOk\n" ++
  "    && hostFrontReusesHostTerm\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostFrontStillUsesLake\n" ++
  "    && hostFrontDependsOnLake\n" ++
  "    && hostFrontHostElaboratorResidualRemains\n" ++
  "    && hostFrontDoesNotClaimPeerGreen\n" ++
  "    && !hostFrontResidualFreeClaimed\n" ++
  "    && !hostFrontProductSelfHostCompleteClaimed\n" ++
  "    && !hostFrontProofCompleteClaimed\n" ++
  "    && !hostFrontLlvmUnlocked\n" ++
  "    && !hostFrontProvablyUnlocked\n"

/-- Collapse of the on-disk multi-line hostFrontReady body. -/
def hostModuleCheckHostFrontReadyMultilineOk : Bool :=
  hostFrontReadyBodyOk hostModuleCheckGoodHostFrontReadyMultilineText

def hostModuleCheckHostFrontTermSurfaceOk : Bool :=
  hostModuleCheckHostFrontTermSurfaceDualOk
    && (checkDepthHostFrontTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostFrontTermSurfaceScope == "HostFront-only")
    && hostModuleCheckHostFrontTermDialectOk
    && hostModuleCheckBadHostFrontResidualDialectReject
    && hostModuleCheckBadHostFrontCompleteDialectReject
    && hostModuleCheckBadHostFrontReadyDialectReject
    && hostModuleCheckBadHostFrontPeerGreenDialectReject
    && hostModuleCheckBadHostFrontProofDialectReject
    && hostModuleCheckBadHostFrontLlvmDialectReject
    && hostModuleCheckBadHostFrontProvablyDialectReject
    && hostModuleCheckBadHostFrontLakeDialectReject
    && hostModuleCheckBadHostFrontResidualL0Accept
    && hostModuleCheckBadHostFrontCompleteL0Accept
    && hostModuleCheckBadHostFrontReadyL0Accept
    && hostModuleCheckBadHostFrontPeerGreenL0Accept
    && hostModuleCheckBadHostFrontProofL0Accept
    && hostModuleCheckBadHostFrontLlvmL0Accept
    && hostModuleCheckBadHostFrontProvablyL0Accept
    && hostModuleCheckBadHostFrontLakeL0Accept
    && hostModuleCheckHostFrontReadyMultilineOk

theorem hostModuleCheckHostFrontTermSurfaceOk_true :
    hostModuleCheckHostFrontTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostFrontReadyMultilineOk_true :
    hostModuleCheckHostFrontReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostFront_term_surface_ids_eq :
    checkDepthHostFrontTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostFrontTermSurfaceScope = "HostFront-only"
      && hostModuleCheckHostFrontTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm
