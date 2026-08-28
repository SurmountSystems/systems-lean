/-
  SYSTEMS_LEAN_HOST partial -- Mult package writer tool L2 term-surface
  (MultFsWriteTool TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultFsWriteTool dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Mult package writer tool L2 dialect subset (documented; not full Lean 4
  elaborator):
  - multFsWriteToolReady compose matches product (MultSubsetEmit package +
    wrote + not-Lake-built + native Io + no full helper C print + Lake +
    living false residual-free / complete / proof / llvm / PROVABLY + ids).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - native Io true; prints-full-helper-C false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not LLVM IR text. Not llvm-as / rust-link / production backend.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckMultFsWriteToolTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckMultFsWriteToolTermSurfaceOk.

  Intentional non-claims:
  - Mult package writer tool only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckMultFsWriteToolTerm, TERM-SURFACE, MultFsWriteTool-only,
  ILL-TYPED-TERM, checkMultFsWriteToolTermDialect,
  hostModuleCheckMultFsWriteToolTermDialectOk,
  hostModuleCheckMultFsWriteToolTermSurfaceDualOk,
  hostModuleCheckMultFsWriteToolTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckMultFsWriteToolTerm
  Red/green: lake build SystemsLean.HostModuleCheckMultFsWriteToolTerm;
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

/-! ### MultFsWriteTool L2 term-surface dual-ok pins (MultFsWriteTool-only) -/

def checkDepthMultFsWriteToolTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthMultFsWriteToolTermSurfaceScope : String := "MultFsWriteTool-only"
def hostModuleCheckMultFsWriteToolTermSurfaceDualOk : Bool := true

/-- Product multFsWriteToolReady fold (package + wrote + not-Lake-built +
    native Io + Lake + living false claims + ids). Same string as the
    collapsed on-disk MultFsWriteTool body so L0 fixtures and product match. -/
def multFsWriteToolReadyTermBody : String :=
  "multSubsetEmitReady && multSubsetEmitWroteExpected && freestandingWriteToolNotLakeBuilt && multFsWriteToolNativeIo && !multFsWriteToolPrintsFullHelperC && stillUsesLake && dependsOnLake && !multFsWriteToolResidualFreeClaimed && !multFsWriteToolProductSelfHostCompleteClaimed && !multFsWriteToolProofCompleteClaimed && !multFsWriteToolLlvmUnlocked && !multFsWriteToolProvablyUnlocked && (stageId == \"SLAKE_MULT_FS_WRITE_TOOL_V0\") && (hostId == \"HOST-MULT-FS-WRITE-TOOL\") && (surfaceId == \"MULT-FS-WRITE-TOOL\") && (justRecipeWriteTool == \"mult-subset-freestanding-write\") && (multSubsetHeaderPackage.length > 0) && (multSubsetSourcePackage.length > 0)"

def multFsWriteToolReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolReady" with
  | none => false
  | some body => body == multFsWriteToolReadyTermBody

def multFsWriteToolResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def multFsWriteToolCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multFsWriteToolProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multFsWriteToolLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def multFsWriteToolProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def multFsWriteToolStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def multFsWriteToolDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def multFsWriteToolNativeIoBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolNativeIo" with
  | none => false
  | some body => body == "true"

def multFsWriteToolPrintsCBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsWriteToolPrintsFullHelperC" with
  | none => false
  | some body => body == "false"

def checkMultFsWriteToolTermDialect (content : String) : Option String :=
  if !multFsWriteToolReadyBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolCompleteBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolProofBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolLlvmBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolProvablyBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolNativeIoBodyOk content then some reasonIllTypedTerm
  else if !multFsWriteToolPrintsCBodyOk content then some reasonIllTypedTerm
  else none

def refineMultFsWriteToolWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultFsWriteToolTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckMultFsWriteToolTermSkeletonPrefix : String :=
  "import SystemsLean.MultSubsetEmit\n" ++
  "namespace SystemsLean.MultFsWriteTool\n"

def hostModuleCheckMultFsWriteToolTermSkeletonSuffix : String :=
  "end SystemsLean.MultFsWriteTool\n"

/-- Honest MultFsWriteTool TERM mid: required L0 decls plus living claim pins. -/
def multFsWriteToolTermGoodPins (readyBody residual complete proof llvm
    provably lake nativeIo printsC : String) : String :=
  "def stageId : String := \"SLAKE_MULT_FS_WRITE_TOOL_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-FS-WRITE-TOOL\"\n" ++
  "def surfaceId : String := \"MULT-FS-WRITE-TOOL\"\n" ++
  "def justRecipeWriteTool : String := \"mult-subset-freestanding-write\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def multFsWriteToolNativeIo : Bool := " ++ nativeIo ++ "\n" ++
  "def multFsWriteToolPrintsFullHelperC : Bool := " ++ printsC ++ "\n" ++
  "def multFsWriteToolResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def multFsWriteToolProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def multFsWriteToolProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def multFsWriteToolLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def multFsWriteToolProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def multFsWriteToolReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckMultFsWriteToolTermGoodMid : String :=
  multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
    "false" "false" "false" "false" "false" "true" "true" "false"

def hostModuleCheckGoodMultFsWriteToolTermText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ hostModuleCheckMultFsWriteToolTermGoodMid
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolResidualText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "true" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolCompleteText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "true" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolReadyText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins "true"
      "false" "false" "false" "false" "false" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolProofText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "true" "false" "false" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolLlvmText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "false" "true" "false" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolProvablyText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "false" "false" "true" "true" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolLakeText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolNativeIoText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def hostModuleCheckBadMultFsWriteToolPrintsCText : String :=
  hostModuleCheckMultFsWriteToolTermSkeletonPrefix
    ++ multFsWriteToolTermGoodPins multFsWriteToolReadyTermBody
      "false" "false" "false" "false" "false" "true" "true" "true"
    ++ hostModuleCheckMultFsWriteToolTermSkeletonSuffix

def multFsWriteToolTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.MultFsWriteTool"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def multFsWriteToolTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (multFsWriteToolTermSurfaceFrom content)
    multFsWriteToolExpectedNamespace multFsWriteToolRequiredDecls
    (some "SystemsLean.MultSubsetEmit")).isAccept

def multFsWriteToolTermDialectReject (content : String) : Bool :=
  match checkMultFsWriteToolTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultFsWriteToolResidualL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolResidualText

def hostModuleCheckBadMultFsWriteToolResidualDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolResidualText

def hostModuleCheckBadMultFsWriteToolCompleteL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolCompleteText

def hostModuleCheckBadMultFsWriteToolCompleteDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolCompleteText

def hostModuleCheckBadMultFsWriteToolReadyL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolReadyText

def hostModuleCheckBadMultFsWriteToolReadyDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolReadyText

def hostModuleCheckBadMultFsWriteToolProofL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolProofText

def hostModuleCheckBadMultFsWriteToolProofDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolProofText

def hostModuleCheckBadMultFsWriteToolLlvmL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolLlvmText

def hostModuleCheckBadMultFsWriteToolLlvmDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolLlvmText

def hostModuleCheckBadMultFsWriteToolProvablyL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolProvablyText

def hostModuleCheckBadMultFsWriteToolProvablyDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolProvablyText

def hostModuleCheckBadMultFsWriteToolLakeL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolLakeText

def hostModuleCheckBadMultFsWriteToolLakeDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolLakeText

def hostModuleCheckBadMultFsWriteToolNativeIoL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolNativeIoText

def hostModuleCheckBadMultFsWriteToolNativeIoDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolNativeIoText

def hostModuleCheckBadMultFsWriteToolPrintsCL0Accept : Bool :=
  multFsWriteToolTermL0Accept hostModuleCheckBadMultFsWriteToolPrintsCText

def hostModuleCheckBadMultFsWriteToolPrintsCDialectReject : Bool :=
  multFsWriteToolTermDialectReject hostModuleCheckBadMultFsWriteToolPrintsCText

def hostModuleCheckMultFsWriteToolTermDialectOk : Bool :=
  (checkMultFsWriteToolTermDialect hostModuleCheckGoodMultFsWriteToolTermText).isNone

/-- On-disk MultFsWriteTool multFsWriteToolReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodMultFsWriteToolReadyMultilineText : String :=
  "def multFsWriteToolReady : Bool :=\n" ++
  "  multSubsetEmitReady\n" ++
  "    && multSubsetEmitWroteExpected\n" ++
  "    && freestandingWriteToolNotLakeBuilt\n" ++
  "    && multFsWriteToolNativeIo\n" ++
  "    && !multFsWriteToolPrintsFullHelperC\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !multFsWriteToolResidualFreeClaimed\n" ++
  "    && !multFsWriteToolProductSelfHostCompleteClaimed\n" ++
  "    && !multFsWriteToolProofCompleteClaimed\n" ++
  "    && !multFsWriteToolLlvmUnlocked\n" ++
  "    && !multFsWriteToolProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_MULT_FS_WRITE_TOOL_V0\")\n" ++
  "    && (hostId == \"HOST-MULT-FS-WRITE-TOOL\")\n" ++
  "    && (surfaceId == \"MULT-FS-WRITE-TOOL\")\n" ++
  "    && (justRecipeWriteTool == \"mult-subset-freestanding-write\")\n" ++
  "    && (multSubsetHeaderPackage.length > 0)\n" ++
  "    && (multSubsetSourcePackage.length > 0)\n"

/-- Collapse of the on-disk multi-line multFsWriteToolReady body. -/
def hostModuleCheckMultFsWriteToolReadyMultilineOk : Bool :=
  multFsWriteToolReadyBodyOk hostModuleCheckGoodMultFsWriteToolReadyMultilineText

def hostModuleCheckMultFsWriteToolTermSurfaceOk : Bool :=
  hostModuleCheckMultFsWriteToolTermSurfaceDualOk
    && (checkDepthMultFsWriteToolTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthMultFsWriteToolTermSurfaceScope == "MultFsWriteTool-only")
    && hostModuleCheckMultFsWriteToolTermDialectOk
    && hostModuleCheckBadMultFsWriteToolResidualDialectReject
    && hostModuleCheckBadMultFsWriteToolCompleteDialectReject
    && hostModuleCheckBadMultFsWriteToolReadyDialectReject
    && hostModuleCheckBadMultFsWriteToolProofDialectReject
    && hostModuleCheckBadMultFsWriteToolLlvmDialectReject
    && hostModuleCheckBadMultFsWriteToolProvablyDialectReject
    && hostModuleCheckBadMultFsWriteToolLakeDialectReject
    && hostModuleCheckBadMultFsWriteToolNativeIoDialectReject
    && hostModuleCheckBadMultFsWriteToolPrintsCDialectReject
    && hostModuleCheckBadMultFsWriteToolResidualL0Accept
    && hostModuleCheckBadMultFsWriteToolCompleteL0Accept
    && hostModuleCheckBadMultFsWriteToolReadyL0Accept
    && hostModuleCheckBadMultFsWriteToolProofL0Accept
    && hostModuleCheckBadMultFsWriteToolLlvmL0Accept
    && hostModuleCheckBadMultFsWriteToolProvablyL0Accept
    && hostModuleCheckBadMultFsWriteToolLakeL0Accept
    && hostModuleCheckBadMultFsWriteToolNativeIoL0Accept
    && hostModuleCheckBadMultFsWriteToolPrintsCL0Accept
    && hostModuleCheckMultFsWriteToolReadyMultilineOk

theorem hostModuleCheckMultFsWriteToolTermSurfaceOk_true :
    hostModuleCheckMultFsWriteToolTermSurfaceOk = true := by native_decide

theorem hostModuleCheckMultFsWriteToolReadyMultilineOk_true :
    hostModuleCheckMultFsWriteToolReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_multFsWriteTool_term_surface_ids_eq :
    checkDepthMultFsWriteToolTermSurfaceBar = "TERM-SURFACE"
      && checkDepthMultFsWriteToolTermSurfaceScope = "MultFsWriteTool-only"
      && hostModuleCheckMultFsWriteToolTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
