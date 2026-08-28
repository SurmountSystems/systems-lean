/-
  SYSTEMS_LEAN_HOST partial -- LLVM Types text L2 term-surface (LLVM Types text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Types text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Types text L2 dialect subset (documented; not full Lean 4 elaborator):
  - llvmTypesTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as + LlvmHold + LlvmEmitPath ready + emit-path local
    unlock false + LlvmMultText ready + Mult local unlock false +
    LlvmLinearText ready + Linear local unlock false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as honesty pins false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not Lake-false twins (this module has no stillUsesLake pin).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmTypesTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmTypesTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Types text only -- not fragment front-end, not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmTypesTextTerm, TERM-SURFACE, LlvmTypesText-only,
  ILL-TYPED-TERM, checkLlvmTypesTextTermDialect,
  hostModuleCheckLlvmTypesTextTermDialectOk,
  hostModuleCheckLlvmTypesTextTermSurfaceDualOk,
  hostModuleCheckLlvmTypesTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmTypesTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmTypesTextTerm;
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

/-! ### LLVM Types text L2 term-surface dual-ok pins (LlvmTypesText-only) -/

def checkDepthLlvmTypesTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmTypesTextTermSurfaceScope : String := "LlvmTypesText-only"
def hostModuleCheckLlvmTypesTextTermSurfaceDualOk : Bool := true

/-- Product llvmTypesTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath +
    LlvmMultText + LlvmLinearText). Same string as the collapsed on-disk
    LlvmTypesText body so L0 fixtures and product match. -/
def llvmTypesTextReadyTermBody : String :=
  "llvmTypesTextFinishedClaimed && llvmTypesTextPackageOk && llvmTypesTextWroteExpected && llvmTypesTextSurfaceOk && llvmTypesTextKeepsLlvmLocked && llvmTypesTextDoesNotUnlockLlvm && llvmTypesTextLocalUnlockFalse && !llvmTypesTextLlvmUnlocked && !llvmTypesTextResidualFreeClaimed && !llvmTypesTextProductSelfHostCompleteClaimed && !llvmTypesTextProofCompleteClaimed && !llvmTypesTextProvablyUnlockWorkClaimed && !llvmTypesTextProductionReadyClaimed && !llvmTypesTextRustNativeLinkClaimed && !llvmTypesTextLlvmAsClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked && LlvmMultText.llvmMultTextReady && !LlvmMultText.llvmMultTextLlvmUnlocked && LlvmLinearText.llvmLinearTextReady && !LlvmLinearText.llvmLinearTextLlvmUnlocked"

def llvmTypesTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextReady" with
  | none => false
  | some body => body == llvmTypesTextReadyTermBody

def llvmTypesTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmTypesTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmTypesTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmTypesTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmTypesTextTermDialect (content : String) : Option String :=
  if !llvmTypesTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmTypesTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmTypesTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmTypesTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmTypesTextTermSkeletonPrefix : String :=
  "import SystemsLean.Types\n" ++
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "import SystemsLean.LlvmMultText\n" ++
  "import SystemsLean.LlvmLinearText\n" ++
  "namespace SystemsLean.LlvmTypesText\n"

def hostModuleCheckLlvmTypesTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmTypesText\n"

/-- Honest LLVM Types text TERM mid: required L0 decls plus living claim pins. -/
def llvmTypesTextTermGoodPins (readyBody residual complete proof llvm provably
    production rustLink llvmAs : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_TYPES_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-types-text\"\n" ++
  "def llvmTypesTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmTypesTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmTypesTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmTypesTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmTypesTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmTypesTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmTypesTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmTypesTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmTypesTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmTypesTextTermGoodMid : String :=
  llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false"

def hostModuleCheckGoodLlvmTypesTextTermText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmTypesTextTermGoodMid
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextResidualText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextCompleteText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextReadyText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextProofText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextLlvmText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextProvablyText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextProductionText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextRustLinkText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def hostModuleCheckBadLlvmTypesTextLlvmAsText : String :=
  hostModuleCheckLlvmTypesTextTermSkeletonPrefix
    ++ llvmTypesTextTermGoodPins llvmTypesTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckLlvmTypesTextTermSkeletonSuffix

def llvmTypesTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmTypesText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmTypesTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmTypesTextTermSurfaceFrom content)
    llvmTypesTextExpectedNamespace llvmTypesTextRequiredDecls
    (some "SystemsLean.Types")).isAccept

def llvmTypesTextTermDialectReject (content : String) : Bool :=
  match checkLlvmTypesTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmTypesTextResidualL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextResidualText

def hostModuleCheckBadLlvmTypesTextResidualDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextResidualText

def hostModuleCheckBadLlvmTypesTextCompleteL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextCompleteText

def hostModuleCheckBadLlvmTypesTextCompleteDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextCompleteText

def hostModuleCheckBadLlvmTypesTextReadyL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextReadyText

def hostModuleCheckBadLlvmTypesTextReadyDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextReadyText

def hostModuleCheckBadLlvmTypesTextProofL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextProofText

def hostModuleCheckBadLlvmTypesTextProofDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextProofText

def hostModuleCheckBadLlvmTypesTextLlvmL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextLlvmText

def hostModuleCheckBadLlvmTypesTextLlvmDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextLlvmText

def hostModuleCheckBadLlvmTypesTextProvablyL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextProvablyText

def hostModuleCheckBadLlvmTypesTextProvablyDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextProvablyText

def hostModuleCheckBadLlvmTypesTextProductionL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextProductionText

def hostModuleCheckBadLlvmTypesTextProductionDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextProductionText

def hostModuleCheckBadLlvmTypesTextRustLinkL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextRustLinkText

def hostModuleCheckBadLlvmTypesTextRustLinkDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextRustLinkText

def hostModuleCheckBadLlvmTypesTextLlvmAsL0Accept : Bool :=
  llvmTypesTextTermL0Accept hostModuleCheckBadLlvmTypesTextLlvmAsText

def hostModuleCheckBadLlvmTypesTextLlvmAsDialectReject : Bool :=
  llvmTypesTextTermDialectReject hostModuleCheckBadLlvmTypesTextLlvmAsText

def hostModuleCheckLlvmTypesTextTermDialectOk : Bool :=
  (checkLlvmTypesTextTermDialect hostModuleCheckGoodLlvmTypesTextTermText).isNone

/-- On-disk LlvmTypesText llvmTypesTextReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmTypesTextReadyMultilineText : String :=
  "def llvmTypesTextReady : Bool :=\n" ++
  "  llvmTypesTextFinishedClaimed\n" ++
  "    && llvmTypesTextPackageOk\n" ++
  "    && llvmTypesTextWroteExpected\n" ++
  "    && llvmTypesTextSurfaceOk\n" ++
  "    && llvmTypesTextKeepsLlvmLocked\n" ++
  "    && llvmTypesTextDoesNotUnlockLlvm\n" ++
  "    && llvmTypesTextLocalUnlockFalse\n" ++
  "    && !llvmTypesTextLlvmUnlocked\n" ++
  "    && !llvmTypesTextResidualFreeClaimed\n" ++
  "    && !llvmTypesTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmTypesTextProofCompleteClaimed\n" ++
  "    && !llvmTypesTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmTypesTextProductionReadyClaimed\n" ++
  "    && !llvmTypesTextRustNativeLinkClaimed\n" ++
  "    && !llvmTypesTextLlvmAsClaimed\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && LlvmEmitPath.llvmEmitPathReady\n" ++
  "    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked\n" ++
  "    && LlvmMultText.llvmMultTextReady\n" ++
  "    && !LlvmMultText.llvmMultTextLlvmUnlocked\n" ++
  "    && LlvmLinearText.llvmLinearTextReady\n" ++
  "    && !LlvmLinearText.llvmLinearTextLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmTypesTextReady body. -/
def hostModuleCheckLlvmTypesTextReadyMultilineOk : Bool :=
  llvmTypesTextReadyBodyOk hostModuleCheckGoodLlvmTypesTextReadyMultilineText

def hostModuleCheckLlvmTypesTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmTypesTextTermSurfaceDualOk
    && (checkDepthLlvmTypesTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmTypesTextTermSurfaceScope == "LlvmTypesText-only")
    && hostModuleCheckLlvmTypesTextTermDialectOk
    && hostModuleCheckBadLlvmTypesTextResidualDialectReject
    && hostModuleCheckBadLlvmTypesTextCompleteDialectReject
    && hostModuleCheckBadLlvmTypesTextReadyDialectReject
    && hostModuleCheckBadLlvmTypesTextProofDialectReject
    && hostModuleCheckBadLlvmTypesTextLlvmDialectReject
    && hostModuleCheckBadLlvmTypesTextProvablyDialectReject
    && hostModuleCheckBadLlvmTypesTextProductionDialectReject
    && hostModuleCheckBadLlvmTypesTextRustLinkDialectReject
    && hostModuleCheckBadLlvmTypesTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmTypesTextResidualL0Accept
    && hostModuleCheckBadLlvmTypesTextCompleteL0Accept
    && hostModuleCheckBadLlvmTypesTextReadyL0Accept
    && hostModuleCheckBadLlvmTypesTextProofL0Accept
    && hostModuleCheckBadLlvmTypesTextLlvmL0Accept
    && hostModuleCheckBadLlvmTypesTextProvablyL0Accept
    && hostModuleCheckBadLlvmTypesTextProductionL0Accept
    && hostModuleCheckBadLlvmTypesTextRustLinkL0Accept
    && hostModuleCheckBadLlvmTypesTextLlvmAsL0Accept
    && hostModuleCheckLlvmTypesTextReadyMultilineOk

theorem hostModuleCheckLlvmTypesTextTermSurfaceOk_true :
    hostModuleCheckLlvmTypesTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmTypesTextReadyMultilineOk_true :
    hostModuleCheckLlvmTypesTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmTypesText_term_surface_ids_eq :
    checkDepthLlvmTypesTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmTypesTextTermSurfaceScope = "LlvmTypesText-only"
      && hostModuleCheckLlvmTypesTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
