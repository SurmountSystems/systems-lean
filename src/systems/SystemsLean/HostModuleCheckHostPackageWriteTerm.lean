/-
  SYSTEMS_LEAN_HOST partial -- Host package write L2 term-surface
  (HostPackageWrite TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: HostPackageWrite dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Host package write L2 dialect subset (documented; not full Lean 4
  elaborator):
  - hostPackageWriteReady compose matches product (G1 + graph + Mult/Linear/
    Types/Program/Graph/Compose package surfaces + reuses + ids + finished +
    keeps host Lake + Lake + living false residual-free / complete / proof /
    llvm / PROVABLY).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not LLVM IR text. Not llvm-as / rust-link / production backend.
  - Not MultFsDeepen writer-deepen. Not HostPackageWriteTheorems proof.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckHostPackageWriteTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckHostPackageWriteTermSurfaceOk.

  Intentional non-claims:
  - Host package write only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckHostPackageWriteTerm, TERM-SURFACE, HostPackageWrite-only,
  ILL-TYPED-TERM, checkHostPackageWriteTermDialect,
  hostModuleCheckHostPackageWriteTermDialectOk,
  hostModuleCheckHostPackageWriteTermSurfaceDualOk,
  hostModuleCheckHostPackageWriteTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckHostPackageWriteTerm
  Red/green: lake build SystemsLean.HostModuleCheckHostPackageWriteTerm;
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

/-! ### HostPackageWrite L2 term-surface dual-ok pins (HostPackageWrite-only) -/

def checkDepthHostPackageWriteTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthHostPackageWriteTermSurfaceScope : String := "HostPackageWrite-only"
def hostModuleCheckHostPackageWriteTermSurfaceDualOk : Bool := true

/-- Product hostPackageWriteReady fold (G1 + graph + unit packages + reuses +
    ids + finished + host Lake + living false claims). Same string as the
    collapsed on-disk HostPackageWrite body so L0 fixtures and product match. -/
def hostPackageWriteReadyTermBody : String :=
  "hostPackageWriteG1Ready && hostPackageWriteGraphReady && hostPackageWriteMultReady && hostPackageWriteLinearGraphReady && hostPackageWriteLinearReady && hostPackageWriteTypesGraphReady && hostPackageWriteTypesReady && hostPackageWriteProgramGraphReady && hostPackageWriteProgramReady && hostPackageWriteGraphExpandReady && hostPackageWriteGraphPackageReady && hostPackageWriteComposeExpandReady && hostPackageWriteComposePackageReady && hostPackageWriteReusesHostSurfaces && hostPackageWriteIdsOk && hostPackageWriteFinishedClaimed && hostPackageWriteKeepsHostLake && stillUsesLake && dependsOnLake && hostPackageWriteStillUsesLake && hostPackageWriteDependsOnLake && hostPackageWriteHostElaboratorResidualRemains && hostPackageWriteDoesNotClaimPeerGreen && !hostPackageWriteResidualFreeClaimed && !hostPackageWriteProductSelfHostCompleteClaimed && !hostPackageWriteProofCompleteClaimed && !hostPackageWriteLlvmUnlocked && !hostPackageWriteProvablyUnlocked"

def hostPackageWriteReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteReady" with
  | none => false
  | some body => body == hostPackageWriteReadyTermBody

def hostPackageWriteResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def hostPackageWriteLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def hostPackageWriteProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostPackageWriteProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def hostPackageWriteStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def hostPackageWriteDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkHostPackageWriteTermDialect (content : String) : Option String :=
  if !hostPackageWriteReadyBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteCompleteBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteProofBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteLlvmBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteProvablyBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !hostPackageWriteDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineHostPackageWriteWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkHostPackageWriteTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckHostPackageWriteTermSkeletonPrefix : String :=
  "import SystemsLean.HostFront\n" ++
  "namespace SystemsLean.HostPackageWrite\n"

def hostModuleCheckHostPackageWriteTermSkeletonSuffix : String :=
  "end SystemsLean.HostPackageWrite\n"

/-- Honest HostPackageWrite TERM mid: required L0 decls plus living claim pins. -/
def hostPackageWriteTermGoodPins (readyBody residual complete proof llvm
    provably lake : String) : String :=
  "def stageId : String := \"SLAKE_HOST_PACKAGE_WRITE_V0\"\n" ++
  "def hostId : String := \"HOST-PACKAGE-WRITE\"\n" ++
  "def surfaceId : String := \"HOST-PACKAGE-WRITE\"\n" ++
  "def justRecipe : String := \"host-package-write\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostPackageWriteResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def hostPackageWriteProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def hostPackageWriteProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def hostPackageWriteLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def hostPackageWriteProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def hostPackageWriteReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckHostPackageWriteTermGoodMid : String :=
  hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
    "false" "false" "false" "false" "false" "true"

def hostModuleCheckGoodHostPackageWriteTermText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostModuleCheckHostPackageWriteTermGoodMid
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteResidualText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "true" "false" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteCompleteText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "true" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteReadyText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins "true"
      "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteProofText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "true" "false" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteLlvmText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "true" "false" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteProvablyText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostModuleCheckBadHostPackageWriteLakeText : String :=
  hostModuleCheckHostPackageWriteTermSkeletonPrefix
    ++ hostPackageWriteTermGoodPins hostPackageWriteReadyTermBody
      "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckHostPackageWriteTermSkeletonSuffix

def hostPackageWriteTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.HostPackageWrite"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostPackageWriteTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (hostPackageWriteTermSurfaceFrom content)
    hostPackageWriteExpectedNamespace hostPackageWriteRequiredDecls
    (some "SystemsLean.HostFront")).isAccept

def hostPackageWriteTermDialectReject (content : String) : Bool :=
  match checkHostPackageWriteTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadHostPackageWriteResidualL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteResidualText

def hostModuleCheckBadHostPackageWriteResidualDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteResidualText

def hostModuleCheckBadHostPackageWriteCompleteL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteCompleteText

def hostModuleCheckBadHostPackageWriteCompleteDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteCompleteText

def hostModuleCheckBadHostPackageWriteReadyL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteReadyText

def hostModuleCheckBadHostPackageWriteReadyDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteReadyText

def hostModuleCheckBadHostPackageWriteProofL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteProofText

def hostModuleCheckBadHostPackageWriteProofDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteProofText

def hostModuleCheckBadHostPackageWriteLlvmL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteLlvmText

def hostModuleCheckBadHostPackageWriteLlvmDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteLlvmText

def hostModuleCheckBadHostPackageWriteProvablyL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteProvablyText

def hostModuleCheckBadHostPackageWriteProvablyDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteProvablyText

def hostModuleCheckBadHostPackageWriteLakeL0Accept : Bool :=
  hostPackageWriteTermL0Accept hostModuleCheckBadHostPackageWriteLakeText

def hostModuleCheckBadHostPackageWriteLakeDialectReject : Bool :=
  hostPackageWriteTermDialectReject hostModuleCheckBadHostPackageWriteLakeText

def hostModuleCheckHostPackageWriteTermDialectOk : Bool :=
  (checkHostPackageWriteTermDialect hostModuleCheckGoodHostPackageWriteTermText).isNone

/-- On-disk HostPackageWrite hostPackageWriteReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodHostPackageWriteReadyMultilineText : String :=
  "def hostPackageWriteReady : Bool :=\n" ++
  "  hostPackageWriteG1Ready\n" ++
  "    && hostPackageWriteGraphReady\n" ++
  "    && hostPackageWriteMultReady\n" ++
  "    && hostPackageWriteLinearGraphReady\n" ++
  "    && hostPackageWriteLinearReady\n" ++
  "    && hostPackageWriteTypesGraphReady\n" ++
  "    && hostPackageWriteTypesReady\n" ++
  "    && hostPackageWriteProgramGraphReady\n" ++
  "    && hostPackageWriteProgramReady\n" ++
  "    && hostPackageWriteGraphExpandReady\n" ++
  "    && hostPackageWriteGraphPackageReady\n" ++
  "    && hostPackageWriteComposeExpandReady\n" ++
  "    && hostPackageWriteComposePackageReady\n" ++
  "    && hostPackageWriteReusesHostSurfaces\n" ++
  "    && hostPackageWriteIdsOk\n" ++
  "    && hostPackageWriteFinishedClaimed\n" ++
  "    && hostPackageWriteKeepsHostLake\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && hostPackageWriteStillUsesLake\n" ++
  "    && hostPackageWriteDependsOnLake\n" ++
  "    && hostPackageWriteHostElaboratorResidualRemains\n" ++
  "    && hostPackageWriteDoesNotClaimPeerGreen\n" ++
  "    && !hostPackageWriteResidualFreeClaimed\n" ++
  "    && !hostPackageWriteProductSelfHostCompleteClaimed\n" ++
  "    && !hostPackageWriteProofCompleteClaimed\n" ++
  "    && !hostPackageWriteLlvmUnlocked\n" ++
  "    && !hostPackageWriteProvablyUnlocked\n"

def hostModuleCheckHostPackageWriteReadyMultilineOk : Bool :=
  hostPackageWriteReadyBodyOk hostModuleCheckGoodHostPackageWriteReadyMultilineText

def hostModuleCheckHostPackageWriteTermSurfaceOk : Bool :=
  hostModuleCheckHostPackageWriteTermSurfaceDualOk
    && (checkDepthHostPackageWriteTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthHostPackageWriteTermSurfaceScope == "HostPackageWrite-only")
    && hostModuleCheckHostPackageWriteTermDialectOk
    && hostModuleCheckBadHostPackageWriteResidualDialectReject
    && hostModuleCheckBadHostPackageWriteCompleteDialectReject
    && hostModuleCheckBadHostPackageWriteReadyDialectReject
    && hostModuleCheckBadHostPackageWriteProofDialectReject
    && hostModuleCheckBadHostPackageWriteLlvmDialectReject
    && hostModuleCheckBadHostPackageWriteProvablyDialectReject
    && hostModuleCheckBadHostPackageWriteLakeDialectReject
    && hostModuleCheckBadHostPackageWriteResidualL0Accept
    && hostModuleCheckBadHostPackageWriteCompleteL0Accept
    && hostModuleCheckBadHostPackageWriteReadyL0Accept
    && hostModuleCheckBadHostPackageWriteProofL0Accept
    && hostModuleCheckBadHostPackageWriteLlvmL0Accept
    && hostModuleCheckBadHostPackageWriteProvablyL0Accept
    && hostModuleCheckBadHostPackageWriteLakeL0Accept
    && hostModuleCheckHostPackageWriteReadyMultilineOk

theorem hostModuleCheckHostPackageWriteTermSurfaceOk_true :
    hostModuleCheckHostPackageWriteTermSurfaceOk = true := by native_decide

theorem hostModuleCheckHostPackageWriteReadyMultilineOk_true :
    hostModuleCheckHostPackageWriteReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_hostPackageWrite_term_surface_ids_eq :
    checkDepthHostPackageWriteTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostPackageWriteTermSurfaceScope = "HostPackageWrite-only"
      && hostModuleCheckHostPackageWriteTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
