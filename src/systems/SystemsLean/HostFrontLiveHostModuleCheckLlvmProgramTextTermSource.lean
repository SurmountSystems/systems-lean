/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckLlvmProgramTextTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLlvmProgramTextTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckLlvmProgramTextTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckLlvmProgramTextTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKLLVMPROGRAMTEXTTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm

/-- Dual-pinned live HostModuleCheckLlvmProgramTextTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckLlvmProgramTextTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKLLVMPROGRAMTEXTTERM. -/
def liveHostModuleCheckLlvmProgramTextTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Program text L2 term-surface
  (LLVM Program text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Program text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Program text L2 dialect subset (documented; not full Lean 4
  elaborator):
  - llvmProgramTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as / cfg / ssa + LlvmHold + LlvmEmitPath ready + emit-path
    local unlock false + LlvmMultText ready + Mult local unlock false +
    LlvmLinearText ready + Linear local unlock false + LlvmTypesText ready +
    Types local unlock false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as / cfg / ssa honesty pins false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not Lake-false twins (this module has no stillUsesLake pin).
  - Not HostPackageWrite. Not MultFsDeepen writer-deepen. Not join.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmProgramTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmProgramTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Program text only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Not llvm unlock. Not FullBackend.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmProgramTextTerm, TERM-SURFACE, LlvmProgramText-only,
  ILL-TYPED-TERM, checkLlvmProgramTextTermDialect,
  hostModuleCheckLlvmProgramTextTermDialectOk,
  hostModuleCheckLlvmProgramTextTermSurfaceDualOk,
  hostModuleCheckLlvmProgramTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmProgramTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmProgramTextTerm;
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

/-! ### LLVM Program text L2 term-surface dual-ok pins (LlvmProgramText-only) -/

def checkDepthLlvmProgramTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmProgramTextTermSurfaceScope : String := "LlvmProgramText-only"
def hostModuleCheckLlvmProgramTextTermSurfaceDualOk : Bool := true

/-- Product llvmProgramTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath +
    LlvmMultText + LlvmLinearText + LlvmTypesText). Same string as the
    collapsed on-disk LlvmProgramText body so L0 fixtures and product match. -/
def llvmProgramTextReadyTermBody : String :=
  "llvmProgramTextFinishedClaimed && llvmProgramTextPackageOk && llvmProgramTextWroteExpected && llvmProgramTextSurfaceOk && llvmProgramTextKeepsLlvmLocked && llvmProgramTextDoesNotUnlockLlvm && llvmProgramTextLocalUnlockFalse && !llvmProgramTextLlvmUnlocked && !llvmProgramTextResidualFreeClaimed && !llvmProgramTextProductSelfHostCompleteClaimed && !llvmProgramTextProofCompleteClaimed && !llvmProgramTextProvablyUnlockWorkClaimed && !llvmProgramTextProductionReadyClaimed && !llvmProgramTextRustNativeLinkClaimed && !llvmProgramTextLlvmAsClaimed && !llvmProgramTextCfgClaimed && !llvmProgramTextSsaClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked && LlvmMultText.llvmMultTextReady && !LlvmMultText.llvmMultTextLlvmUnlocked && LlvmLinearText.llvmLinearTextReady && !LlvmLinearText.llvmLinearTextLlvmUnlocked && LlvmTypesText.llvmTypesTextReady && !LlvmTypesText.llvmTypesTextLlvmUnlocked"

def llvmProgramTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextReady" with
  | none => false
  | some body => body == llvmProgramTextReadyTermBody

def llvmProgramTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmProgramTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextCfgBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextCfgClaimed" with
  | none => false
  | some body => body == "false"

def llvmProgramTextSsaBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmProgramTextSsaClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmProgramTextTermDialect (content : String) : Option String :=
  if !llvmProgramTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextCfgBodyOk content then some reasonIllTypedTerm
  else if !llvmProgramTextSsaBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmProgramTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmProgramTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmProgramTextTermSkeletonPrefix : String :=
  "import SystemsLean.IrProgram\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "import SystemsLean.LlvmMultText\n" ++
  "import SystemsLean.LlvmLinearText\n" ++
  "import SystemsLean.LlvmTypesText\n" ++
  "namespace SystemsLean.LlvmProgramText\n"

def hostModuleCheckLlvmProgramTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmProgramText\n"

/-- Honest LLVM Program text TERM mid: required L0 decls plus living claim pins. -/
def llvmProgramTextTermGoodPins (readyBody residual complete proof llvm
    provably production rustLink llvmAs cfg ssa : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_PROGRAM_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-PROGRAM-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-PROGRAM-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-program-text\"\n" ++
  "def llvmProgramTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmProgramTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmProgramTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmProgramTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmProgramTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmProgramTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmProgramTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmProgramTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmProgramTextCfgClaimed : Bool := " ++ cfg ++ "\n" ++
  "def llvmProgramTextSsaClaimed : Bool := " ++ ssa ++ "\n" ++
  "def llvmProgramTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmProgramTextTermGoodMid : String :=
  llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false" "false"
    "false"

def hostModuleCheckGoodLlvmProgramTextTermText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmProgramTextTermGoodMid
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextResidualText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextCompleteText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextReadyText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextProofText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextLlvmText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextProvablyText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextProductionText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextRustLinkText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextLlvmAsText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true" "false"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextCfgText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "true"
      "false"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def hostModuleCheckBadLlvmProgramTextSsaText : String :=
  hostModuleCheckLlvmProgramTextTermSkeletonPrefix
    ++ llvmProgramTextTermGoodPins llvmProgramTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "true"
    ++ hostModuleCheckLlvmProgramTextTermSkeletonSuffix

def llvmProgramTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmProgramText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmProgramTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmProgramTextTermSurfaceFrom content)
    llvmProgramTextExpectedNamespace llvmProgramTextRequiredDecls
    (some "SystemsLean.IrProgram")).isAccept

def llvmProgramTextTermDialectReject (content : String) : Bool :=
  match checkLlvmProgramTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmProgramTextResidualL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextResidualText

def hostModuleCheckBadLlvmProgramTextResidualDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextResidualText

def hostModuleCheckBadLlvmProgramTextCompleteL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextCompleteText

def hostModuleCheckBadLlvmProgramTextCompleteDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextCompleteText

def hostModuleCheckBadLlvmProgramTextReadyL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextReadyText

def hostModuleCheckBadLlvmProgramTextReadyDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextReadyText

def hostModuleCheckBadLlvmProgramTextProofL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextProofText

def hostModuleCheckBadLlvmProgramTextProofDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextProofText

def hostModuleCheckBadLlvmProgramTextLlvmL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextLlvmText

def hostModuleCheckBadLlvmProgramTextLlvmDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextLlvmText

def hostModuleCheckBadLlvmProgramTextProvablyL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextProvablyText

def hostModuleCheckBadLlvmProgramTextProvablyDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextProvablyText

def hostModuleCheckBadLlvmProgramTextProductionL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextProductionText

def hostModuleCheckBadLlvmProgramTextProductionDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextProductionText

def hostModuleCheckBadLlvmProgramTextRustLinkL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextRustLinkText

def hostModuleCheckBadLlvmProgramTextRustLinkDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextRustLinkText

def hostModuleCheckBadLlvmProgramTextLlvmAsL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextLlvmAsText

def hostModuleCheckBadLlvmProgramTextLlvmAsDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextLlvmAsText

def hostModuleCheckBadLlvmProgramTextCfgL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextCfgText

def hostModuleCheckBadLlvmProgramTextCfgDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextCfgText

def hostModuleCheckBadLlvmProgramTextSsaL0Accept : Bool :=
  llvmProgramTextTermL0Accept hostModuleCheckBadLlvmProgramTextSsaText

def hostModuleCheckBadLlvmProgramTextSsaDialectReject : Bool :=
  llvmProgramTextTermDialectReject hostModuleCheckBadLlvmProgramTextSsaText

def hostModuleCheckLlvmProgramTextTermDialectOk : Bool :=
  (checkLlvmProgramTextTermDialect hostModuleCheckGoodLlvmProgramTextTermText).isNone

/-- On-disk LlvmProgramText llvmProgramTextReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmProgramTextReadyMultilineText : String :=
  "def llvmProgramTextReady : Bool :=\n" ++
  "  llvmProgramTextFinishedClaimed\n" ++
  "    && llvmProgramTextPackageOk\n" ++
  "    && llvmProgramTextWroteExpected\n" ++
  "    && llvmProgramTextSurfaceOk\n" ++
  "    && llvmProgramTextKeepsLlvmLocked\n" ++
  "    && llvmProgramTextDoesNotUnlockLlvm\n" ++
  "    && llvmProgramTextLocalUnlockFalse\n" ++
  "    && !llvmProgramTextLlvmUnlocked\n" ++
  "    && !llvmProgramTextResidualFreeClaimed\n" ++
  "    && !llvmProgramTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmProgramTextProofCompleteClaimed\n" ++
  "    && !llvmProgramTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmProgramTextProductionReadyClaimed\n" ++
  "    && !llvmProgramTextRustNativeLinkClaimed\n" ++
  "    && !llvmProgramTextLlvmAsClaimed\n" ++
  "    && !llvmProgramTextCfgClaimed\n" ++
  "    && !llvmProgramTextSsaClaimed\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && LlvmEmitPath.llvmEmitPathReady\n" ++
  "    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked\n" ++
  "    && LlvmMultText.llvmMultTextReady\n" ++
  "    && !LlvmMultText.llvmMultTextLlvmUnlocked\n" ++
  "    && LlvmLinearText.llvmLinearTextReady\n" ++
  "    && !LlvmLinearText.llvmLinearTextLlvmUnlocked\n" ++
  "    && LlvmTypesText.llvmTypesTextReady\n" ++
  "    && !LlvmTypesText.llvmTypesTextLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmProgramTextReady body. -/
def hostModuleCheckLlvmProgramTextReadyMultilineOk : Bool :=
  llvmProgramTextReadyBodyOk hostModuleCheckGoodLlvmProgramTextReadyMultilineText

def hostModuleCheckLlvmProgramTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmProgramTextTermSurfaceDualOk
    && (checkDepthLlvmProgramTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmProgramTextTermSurfaceScope == "LlvmProgramText-only")
    && hostModuleCheckLlvmProgramTextTermDialectOk
    && hostModuleCheckBadLlvmProgramTextResidualDialectReject
    && hostModuleCheckBadLlvmProgramTextCompleteDialectReject
    && hostModuleCheckBadLlvmProgramTextReadyDialectReject
    && hostModuleCheckBadLlvmProgramTextProofDialectReject
    && hostModuleCheckBadLlvmProgramTextLlvmDialectReject
    && hostModuleCheckBadLlvmProgramTextProvablyDialectReject
    && hostModuleCheckBadLlvmProgramTextProductionDialectReject
    && hostModuleCheckBadLlvmProgramTextRustLinkDialectReject
    && hostModuleCheckBadLlvmProgramTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmProgramTextCfgDialectReject
    && hostModuleCheckBadLlvmProgramTextSsaDialectReject
    && hostModuleCheckBadLlvmProgramTextResidualL0Accept
    && hostModuleCheckBadLlvmProgramTextCompleteL0Accept
    && hostModuleCheckBadLlvmProgramTextReadyL0Accept
    && hostModuleCheckBadLlvmProgramTextProofL0Accept
    && hostModuleCheckBadLlvmProgramTextLlvmL0Accept
    && hostModuleCheckBadLlvmProgramTextProvablyL0Accept
    && hostModuleCheckBadLlvmProgramTextProductionL0Accept
    && hostModuleCheckBadLlvmProgramTextRustLinkL0Accept
    && hostModuleCheckBadLlvmProgramTextLlvmAsL0Accept
    && hostModuleCheckBadLlvmProgramTextCfgL0Accept
    && hostModuleCheckBadLlvmProgramTextSsaL0Accept
    && hostModuleCheckLlvmProgramTextReadyMultilineOk

theorem hostModuleCheckLlvmProgramTextTermSurfaceOk_true :
    hostModuleCheckLlvmProgramTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmProgramTextReadyMultilineOk_true :
    hostModuleCheckLlvmProgramTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmProgramText_term_surface_ids_eq :
    checkDepthLlvmProgramTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmProgramTextTermSurfaceScope = "LlvmProgramText-only"
      && hostModuleCheckLlvmProgramTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckLlvmProgramTextTerm
