/-
  SYSTEMS_LEAN_HOST partial -- LLVM Compose text L2 term-surface
  (LLVM Compose text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Compose text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Compose text L2 dialect subset (documented; not full Lean 4
  elaborator):
  - llvmComposeTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as / cfg / ssa + LlvmHold + LlvmEmitPath ready +
    emit-path local unlock false + LlvmMultText ready + Mult local unlock false +
    LlvmLinearText ready + Linear local unlock false + LlvmTypesText ready +
    Types local unlock false + LlvmProgramText ready + Program local unlock
    false + LlvmGraphText ready + Graph local unlock false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as / cfg / ssa honesty pins false.
  - Not HostFront dialect. Not HostCompose unit. Not rebuild / self-apply.
  - Not emit*Ready. Not Lake-false twins (this module has no stillUsesLake pin).
  - Not HostPackageWrite. Not MultFsDeepen writer-deepen. Not join.
  - Not Graph dominance pin (product Compose has cfg + ssa only).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmComposeTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmComposeTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Compose text only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Not llvm unlock. Not FullBackend. Not dominance claimed.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmComposeTextTerm, TERM-SURFACE, LlvmComposeText-only,
  ILL-TYPED-TERM, checkLlvmComposeTextTermDialect,
  hostModuleCheckLlvmComposeTextTermDialectOk,
  hostModuleCheckLlvmComposeTextTermSurfaceDualOk,
  hostModuleCheckLlvmComposeTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmComposeTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmComposeTextTerm;
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

/-! ### LLVM Compose text L2 term-surface dual-ok pins (LlvmComposeText-only) -/

def checkDepthLlvmComposeTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmComposeTextTermSurfaceScope : String := "LlvmComposeText-only"
def hostModuleCheckLlvmComposeTextTermSurfaceDualOk : Bool := true

/-- Product llvmComposeTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath +
    LlvmMultText + LlvmLinearText + LlvmTypesText + LlvmProgramText +
    LlvmGraphText). Same string as the collapsed on-disk LlvmComposeText body
    so L0 fixtures and product match. No dominance conjunct. -/
def llvmComposeTextReadyTermBody : String :=
  "llvmComposeTextFinishedClaimed && llvmComposeTextPackageOk && llvmComposeTextWroteExpected && llvmComposeTextSurfaceOk && llvmComposeTextKeepsLlvmLocked && llvmComposeTextDoesNotUnlockLlvm && llvmComposeTextLocalUnlockFalse && !llvmComposeTextLlvmUnlocked && !llvmComposeTextResidualFreeClaimed && !llvmComposeTextProductSelfHostCompleteClaimed && !llvmComposeTextProofCompleteClaimed && !llvmComposeTextProvablyUnlockWorkClaimed && !llvmComposeTextProductionReadyClaimed && !llvmComposeTextRustNativeLinkClaimed && !llvmComposeTextLlvmAsClaimed && !llvmComposeTextCfgClaimed && !llvmComposeTextSsaClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked && LlvmMultText.llvmMultTextReady && !LlvmMultText.llvmMultTextLlvmUnlocked && LlvmLinearText.llvmLinearTextReady && !LlvmLinearText.llvmLinearTextLlvmUnlocked && LlvmTypesText.llvmTypesTextReady && !LlvmTypesText.llvmTypesTextLlvmUnlocked && LlvmProgramText.llvmProgramTextReady && !LlvmProgramText.llvmProgramTextLlvmUnlocked && LlvmGraphText.llvmGraphTextReady && !LlvmGraphText.llvmGraphTextLlvmUnlocked"

def llvmComposeTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextReady" with
  | none => false
  | some body => body == llvmComposeTextReadyTermBody

def llvmComposeTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmComposeTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextCfgBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextCfgClaimed" with
  | none => false
  | some body => body == "false"

def llvmComposeTextSsaBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmComposeTextSsaClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmComposeTextTermDialect (content : String) : Option String :=
  if !llvmComposeTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextCfgBodyOk content then some reasonIllTypedTerm
  else if !llvmComposeTextSsaBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmComposeTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmComposeTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmComposeTextTermSkeletonPrefix : String :=
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.IrProgram\n" ++
  "import SystemsLean.IrGraph\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "import SystemsLean.LlvmMultText\n" ++
  "import SystemsLean.LlvmLinearText\n" ++
  "import SystemsLean.LlvmTypesText\n" ++
  "import SystemsLean.LlvmProgramText\n" ++
  "import SystemsLean.LlvmGraphText\n" ++
  "namespace SystemsLean.LlvmComposeText\n"

def hostModuleCheckLlvmComposeTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmComposeText\n"

/-- Honest LLVM Compose text TERM mid: required L0 decls plus living claim pins. -/
def llvmComposeTextTermGoodPins (readyBody residual complete proof llvm
    provably production rustLink llvmAs cfg ssa : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_COMPOSE_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-COMPOSE-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-COMPOSE-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-compose-text\"\n" ++
  "def llvmComposeTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmComposeTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmComposeTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmComposeTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmComposeTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmComposeTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmComposeTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmComposeTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmComposeTextCfgClaimed : Bool := " ++ cfg ++ "\n" ++
  "def llvmComposeTextSsaClaimed : Bool := " ++ ssa ++ "\n" ++
  "def llvmComposeTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmComposeTextTermGoodMid : String :=
  llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false" "false"
    "false"

def hostModuleCheckGoodLlvmComposeTextTermText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmComposeTextTermGoodMid
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextResidualText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextCompleteText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextReadyText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextProofText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextLlvmText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextProvablyText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextProductionText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextRustLinkText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextLlvmAsText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true" "false"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextCfgText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "true"
      "false"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def hostModuleCheckBadLlvmComposeTextSsaText : String :=
  hostModuleCheckLlvmComposeTextTermSkeletonPrefix
    ++ llvmComposeTextTermGoodPins llvmComposeTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "true"
    ++ hostModuleCheckLlvmComposeTextTermSkeletonSuffix

def llvmComposeTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmComposeText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmComposeTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmComposeTextTermSurfaceFrom content)
    llvmComposeTextExpectedNamespace llvmComposeTextRequiredDecls
    (some "SystemsLean.HostCompose")).isAccept

def llvmComposeTextTermDialectReject (content : String) : Bool :=
  match checkLlvmComposeTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmComposeTextResidualL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextResidualText

def hostModuleCheckBadLlvmComposeTextResidualDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextResidualText

def hostModuleCheckBadLlvmComposeTextCompleteL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextCompleteText

def hostModuleCheckBadLlvmComposeTextCompleteDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextCompleteText

def hostModuleCheckBadLlvmComposeTextReadyL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextReadyText

def hostModuleCheckBadLlvmComposeTextReadyDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextReadyText

def hostModuleCheckBadLlvmComposeTextProofL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextProofText

def hostModuleCheckBadLlvmComposeTextProofDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextProofText

def hostModuleCheckBadLlvmComposeTextLlvmL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextLlvmText

def hostModuleCheckBadLlvmComposeTextLlvmDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextLlvmText

def hostModuleCheckBadLlvmComposeTextProvablyL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextProvablyText

def hostModuleCheckBadLlvmComposeTextProvablyDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextProvablyText

def hostModuleCheckBadLlvmComposeTextProductionL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextProductionText

def hostModuleCheckBadLlvmComposeTextProductionDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextProductionText

def hostModuleCheckBadLlvmComposeTextRustLinkL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextRustLinkText

def hostModuleCheckBadLlvmComposeTextRustLinkDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextRustLinkText

def hostModuleCheckBadLlvmComposeTextLlvmAsL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextLlvmAsText

def hostModuleCheckBadLlvmComposeTextLlvmAsDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextLlvmAsText

def hostModuleCheckBadLlvmComposeTextCfgL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextCfgText

def hostModuleCheckBadLlvmComposeTextCfgDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextCfgText

def hostModuleCheckBadLlvmComposeTextSsaL0Accept : Bool :=
  llvmComposeTextTermL0Accept hostModuleCheckBadLlvmComposeTextSsaText

def hostModuleCheckBadLlvmComposeTextSsaDialectReject : Bool :=
  llvmComposeTextTermDialectReject hostModuleCheckBadLlvmComposeTextSsaText

def hostModuleCheckLlvmComposeTextTermDialectOk : Bool :=
  (checkLlvmComposeTextTermDialect hostModuleCheckGoodLlvmComposeTextTermText).isNone

/-- On-disk LlvmComposeText llvmComposeTextReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmComposeTextReadyMultilineText : String :=
  "def llvmComposeTextReady : Bool :=\n" ++
  "  llvmComposeTextFinishedClaimed\n" ++
  "    && llvmComposeTextPackageOk\n" ++
  "    && llvmComposeTextWroteExpected\n" ++
  "    && llvmComposeTextSurfaceOk\n" ++
  "    && llvmComposeTextKeepsLlvmLocked\n" ++
  "    && llvmComposeTextDoesNotUnlockLlvm\n" ++
  "    && llvmComposeTextLocalUnlockFalse\n" ++
  "    && !llvmComposeTextLlvmUnlocked\n" ++
  "    && !llvmComposeTextResidualFreeClaimed\n" ++
  "    && !llvmComposeTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmComposeTextProofCompleteClaimed\n" ++
  "    && !llvmComposeTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmComposeTextProductionReadyClaimed\n" ++
  "    && !llvmComposeTextRustNativeLinkClaimed\n" ++
  "    && !llvmComposeTextLlvmAsClaimed\n" ++
  "    && !llvmComposeTextCfgClaimed\n" ++
  "    && !llvmComposeTextSsaClaimed\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && LlvmEmitPath.llvmEmitPathReady\n" ++
  "    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked\n" ++
  "    && LlvmMultText.llvmMultTextReady\n" ++
  "    && !LlvmMultText.llvmMultTextLlvmUnlocked\n" ++
  "    && LlvmLinearText.llvmLinearTextReady\n" ++
  "    && !LlvmLinearText.llvmLinearTextLlvmUnlocked\n" ++
  "    && LlvmTypesText.llvmTypesTextReady\n" ++
  "    && !LlvmTypesText.llvmTypesTextLlvmUnlocked\n" ++
  "    && LlvmProgramText.llvmProgramTextReady\n" ++
  "    && !LlvmProgramText.llvmProgramTextLlvmUnlocked\n" ++
  "    && LlvmGraphText.llvmGraphTextReady\n" ++
  "    && !LlvmGraphText.llvmGraphTextLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmComposeTextReady body. -/
def hostModuleCheckLlvmComposeTextReadyMultilineOk : Bool :=
  llvmComposeTextReadyBodyOk hostModuleCheckGoodLlvmComposeTextReadyMultilineText

def hostModuleCheckLlvmComposeTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmComposeTextTermSurfaceDualOk
    && (checkDepthLlvmComposeTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmComposeTextTermSurfaceScope == "LlvmComposeText-only")
    && hostModuleCheckLlvmComposeTextTermDialectOk
    && hostModuleCheckBadLlvmComposeTextResidualDialectReject
    && hostModuleCheckBadLlvmComposeTextCompleteDialectReject
    && hostModuleCheckBadLlvmComposeTextReadyDialectReject
    && hostModuleCheckBadLlvmComposeTextProofDialectReject
    && hostModuleCheckBadLlvmComposeTextLlvmDialectReject
    && hostModuleCheckBadLlvmComposeTextProvablyDialectReject
    && hostModuleCheckBadLlvmComposeTextProductionDialectReject
    && hostModuleCheckBadLlvmComposeTextRustLinkDialectReject
    && hostModuleCheckBadLlvmComposeTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmComposeTextCfgDialectReject
    && hostModuleCheckBadLlvmComposeTextSsaDialectReject
    && hostModuleCheckBadLlvmComposeTextResidualL0Accept
    && hostModuleCheckBadLlvmComposeTextCompleteL0Accept
    && hostModuleCheckBadLlvmComposeTextReadyL0Accept
    && hostModuleCheckBadLlvmComposeTextProofL0Accept
    && hostModuleCheckBadLlvmComposeTextLlvmL0Accept
    && hostModuleCheckBadLlvmComposeTextProvablyL0Accept
    && hostModuleCheckBadLlvmComposeTextProductionL0Accept
    && hostModuleCheckBadLlvmComposeTextRustLinkL0Accept
    && hostModuleCheckBadLlvmComposeTextLlvmAsL0Accept
    && hostModuleCheckBadLlvmComposeTextCfgL0Accept
    && hostModuleCheckBadLlvmComposeTextSsaL0Accept
    && hostModuleCheckLlvmComposeTextReadyMultilineOk

theorem hostModuleCheckLlvmComposeTextTermSurfaceOk_true :
    hostModuleCheckLlvmComposeTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmComposeTextReadyMultilineOk_true :
    hostModuleCheckLlvmComposeTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmComposeText_term_surface_ids_eq :
    checkDepthLlvmComposeTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmComposeTextTermSurfaceScope = "LlvmComposeText-only"
      && hostModuleCheckLlvmComposeTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
