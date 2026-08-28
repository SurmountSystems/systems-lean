/-
  SYSTEMS_LEAN_HOST partial -- FrontMultPackage L2 term-surface
  (FrontMultPackage TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: FrontMultPackage dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  FrontMultPackage L2 dialect subset (documented; not full Lean 4 elaborator):
  - frontMultPackageReady compose matches product (G1 + SubsetFront ready +
    Mult package ready + finished + keeps Lake + Lake pins + living false
    residual-free / complete / proof / llvm / PROVABLY + ids).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - HostFront-class: host fragment front-end (SubsetFront G1 accept then
    Mult package write). Not writer-tool native Io. Not LLVM IR text.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not llvm-as / rust-link / production backend.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckFrontMultPackageTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckFrontMultPackageTermSurfaceOk.

  Intentional non-claims:
  - Front-end Mult package path only -- not package elaborate, not FullHost
    re-true. Skip HostFrontTheorems / HostGraphTheorems (proof).
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckFrontMultPackageTerm, TERM-SURFACE, FrontMultPackage-only,
  ILL-TYPED-TERM, checkFrontMultPackageTermDialect,
  hostModuleCheckFrontMultPackageTermDialectOk,
  hostModuleCheckFrontMultPackageTermSurfaceDualOk,
  hostModuleCheckFrontMultPackageTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckFrontMultPackageTerm
  Red/green: lake build SystemsLean.HostModuleCheckFrontMultPackageTerm;
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

/-! ### FrontMultPackage L2 term-surface dual-ok pins (FrontMultPackage-only) -/

def checkDepthFrontMultPackageTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthFrontMultPackageTermSurfaceScope : String := "FrontMultPackage-only"
def hostModuleCheckFrontMultPackageTermSurfaceDualOk : Bool := true

/-- Product frontMultPackageReady fold (G1 + SubsetFront + Mult package +
    finished + keeps Lake + Lake + living false claims + ids). Same string
    as the collapsed on-disk FrontMultPackage body so L0 fixtures and
    product match. -/
def frontMultPackageReadyTermBody : String :=
  "frontMultPackageG1Ready && subsetFrontReady && frontMultPackageMultReady && frontMultPackageFinishedClaimed && frontMultPackageKeepsHostLake && stillUsesLake && dependsOnLake && !frontMultPackageResidualFreeClaimed && !frontMultPackageProductSelfHostCompleteClaimed && !frontMultPackageProofCompleteClaimed && !frontMultPackageLlvmUnlocked && !frontMultPackageProvablyUnlocked && (stageId == \"SLAKE_FRONT_MULT_PACKAGE_V0\") && (hostId == \"HOST-FRONT-MULT-PACKAGE\") && (surfaceId == \"FRONT-MULT-PACKAGE\") && (lakeExeName == \"slake-front-mult-package\") && (justRecipeFrontMultPackage == \"front-mult-package\") && (justRecipe == \"front-mult-package\")"

def frontMultPackageReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageReady" with
  | none => false
  | some body => body == frontMultPackageReadyTermBody

def frontMultPackageResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def frontMultPackageCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def frontMultPackageProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def frontMultPackageLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def frontMultPackageProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "frontMultPackageProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def frontMultPackageStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def frontMultPackageDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkFrontMultPackageTermDialect (content : String) : Option String :=
  if !frontMultPackageReadyBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageCompleteBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageProofBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageLlvmBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageProvablyBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !frontMultPackageDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineFrontMultPackageWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkFrontMultPackageTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckFrontMultPackageTermSkeletonPrefix : String :=
  "import SystemsLean.SubsetFront\n" ++
  "namespace SystemsLean.FrontMultPackage\n"

def hostModuleCheckFrontMultPackageTermSkeletonSuffix : String :=
  "end SystemsLean.FrontMultPackage\n"

/-- Honest FrontMultPackage TERM mid: required L0 decls plus living claim pins. -/
def frontMultPackageTermGoodPins (readyBody residual complete proof llvm
    provably lake : String) : String :=
  "def stageId : String := \"SLAKE_FRONT_MULT_PACKAGE_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT-MULT-PACKAGE\"\n" ++
  "def surfaceId : String := \"FRONT-MULT-PACKAGE\"\n" ++
  "def justRecipeFrontMultPackage : String := \"front-mult-package\"\n" ++
  "def justRecipe : String := \"front-mult-package\"\n" ++
  "def lakeExeName : String := \"slake-front-mult-package\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def frontMultPackageResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def frontMultPackageProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def frontMultPackageProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def frontMultPackageLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def frontMultPackageProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def frontMultPackageReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckFrontMultPackageTermGoodMid : String :=
  frontMultPackageTermGoodPins frontMultPackageReadyTermBody
    "false" "false" "false" "false" "false" "true"

def hostModuleCheckGoodFrontMultPackageTermText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ hostModuleCheckFrontMultPackageTermGoodMid
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageResidualText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "true" "false" "false" "false" "false" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageCompleteText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "false" "true" "false" "false" "false" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageReadyText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins "true"
      "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageProofText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "false" "false" "true" "false" "false" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageLlvmText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "false" "false" "false" "true" "false" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageProvablyText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def hostModuleCheckBadFrontMultPackageLakeText : String :=
  hostModuleCheckFrontMultPackageTermSkeletonPrefix
    ++ frontMultPackageTermGoodPins frontMultPackageReadyTermBody
      "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckFrontMultPackageTermSkeletonSuffix

def frontMultPackageTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.FrontMultPackage"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def frontMultPackageTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (frontMultPackageTermSurfaceFrom content)
    frontMultPackageExpectedNamespace frontMultPackageRequiredDecls
    (some "SystemsLean.SubsetFront")).isAccept

def frontMultPackageTermDialectReject (content : String) : Bool :=
  match checkFrontMultPackageTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadFrontMultPackageResidualL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageResidualText

def hostModuleCheckBadFrontMultPackageResidualDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageResidualText

def hostModuleCheckBadFrontMultPackageCompleteL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageCompleteText

def hostModuleCheckBadFrontMultPackageCompleteDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageCompleteText

def hostModuleCheckBadFrontMultPackageReadyL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageReadyText

def hostModuleCheckBadFrontMultPackageReadyDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageReadyText

def hostModuleCheckBadFrontMultPackageProofL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageProofText

def hostModuleCheckBadFrontMultPackageProofDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageProofText

def hostModuleCheckBadFrontMultPackageLlvmL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageLlvmText

def hostModuleCheckBadFrontMultPackageLlvmDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageLlvmText

def hostModuleCheckBadFrontMultPackageProvablyL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageProvablyText

def hostModuleCheckBadFrontMultPackageProvablyDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageProvablyText

def hostModuleCheckBadFrontMultPackageLakeL0Accept : Bool :=
  frontMultPackageTermL0Accept hostModuleCheckBadFrontMultPackageLakeText

def hostModuleCheckBadFrontMultPackageLakeDialectReject : Bool :=
  frontMultPackageTermDialectReject hostModuleCheckBadFrontMultPackageLakeText

def hostModuleCheckFrontMultPackageTermDialectOk : Bool :=
  (checkFrontMultPackageTermDialect hostModuleCheckGoodFrontMultPackageTermText).isNone

/-- On-disk FrontMultPackage frontMultPackageReady is multi-line. Collapse
    must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodFrontMultPackageReadyMultilineText : String :=
  "def frontMultPackageReady : Bool :=\n" ++
  "  frontMultPackageG1Ready\n" ++
  "    && subsetFrontReady\n" ++
  "    && frontMultPackageMultReady\n" ++
  "    && frontMultPackageFinishedClaimed\n" ++
  "    && frontMultPackageKeepsHostLake\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !frontMultPackageResidualFreeClaimed\n" ++
  "    && !frontMultPackageProductSelfHostCompleteClaimed\n" ++
  "    && !frontMultPackageProofCompleteClaimed\n" ++
  "    && !frontMultPackageLlvmUnlocked\n" ++
  "    && !frontMultPackageProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_FRONT_MULT_PACKAGE_V0\")\n" ++
  "    && (hostId == \"HOST-FRONT-MULT-PACKAGE\")\n" ++
  "    && (surfaceId == \"FRONT-MULT-PACKAGE\")\n" ++
  "    && (lakeExeName == \"slake-front-mult-package\")\n" ++
  "    && (justRecipeFrontMultPackage == \"front-mult-package\")\n" ++
  "    && (justRecipe == \"front-mult-package\")\n"

/-- Collapse of the on-disk multi-line frontMultPackageReady body. -/
def hostModuleCheckFrontMultPackageReadyMultilineOk : Bool :=
  frontMultPackageReadyBodyOk hostModuleCheckGoodFrontMultPackageReadyMultilineText

def hostModuleCheckFrontMultPackageTermSurfaceOk : Bool :=
  hostModuleCheckFrontMultPackageTermSurfaceDualOk
    && (checkDepthFrontMultPackageTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthFrontMultPackageTermSurfaceScope == "FrontMultPackage-only")
    && hostModuleCheckFrontMultPackageTermDialectOk
    && hostModuleCheckBadFrontMultPackageResidualDialectReject
    && hostModuleCheckBadFrontMultPackageCompleteDialectReject
    && hostModuleCheckBadFrontMultPackageReadyDialectReject
    && hostModuleCheckBadFrontMultPackageProofDialectReject
    && hostModuleCheckBadFrontMultPackageLlvmDialectReject
    && hostModuleCheckBadFrontMultPackageProvablyDialectReject
    && hostModuleCheckBadFrontMultPackageLakeDialectReject
    && hostModuleCheckBadFrontMultPackageResidualL0Accept
    && hostModuleCheckBadFrontMultPackageCompleteL0Accept
    && hostModuleCheckBadFrontMultPackageReadyL0Accept
    && hostModuleCheckBadFrontMultPackageProofL0Accept
    && hostModuleCheckBadFrontMultPackageLlvmL0Accept
    && hostModuleCheckBadFrontMultPackageProvablyL0Accept
    && hostModuleCheckBadFrontMultPackageLakeL0Accept
    && hostModuleCheckFrontMultPackageReadyMultilineOk

theorem hostModuleCheckFrontMultPackageTermSurfaceOk_true :
    hostModuleCheckFrontMultPackageTermSurfaceOk = true := by native_decide

theorem hostModuleCheckFrontMultPackageReadyMultilineOk_true :
    hostModuleCheckFrontMultPackageReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_frontMultPackage_term_surface_ids_eq :
    checkDepthFrontMultPackageTermSurfaceBar = "TERM-SURFACE"
      && checkDepthFrontMultPackageTermSurfaceScope = "FrontMultPackage-only"
      && hostModuleCheckFrontMultPackageTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
