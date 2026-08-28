/-
  SYSTEMS_LEAN_HOST partial -- LLVM Mult text L2 term-surface (LLVM Mult text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Mult text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Mult text L2 dialect subset (documented; not full Lean 4 elaborator):
  - llvmMultTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as + LlvmHold + LlvmEmitPath ready + emit-path local
    unlock false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as honesty pins false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmMultTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmMultTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Mult text only -- not fragment front-end, not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmMultTextTerm, TERM-SURFACE, LlvmMultText-only,
  ILL-TYPED-TERM, checkLlvmMultTextTermDialect,
  hostModuleCheckLlvmMultTextTermDialectOk,
  hostModuleCheckLlvmMultTextTermSurfaceDualOk,
  hostModuleCheckLlvmMultTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmMultTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmMultTextTerm;
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

/-! ### LLVM Mult text L2 term-surface dual-ok pins (LlvmMultText-only) -/

def checkDepthLlvmMultTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmMultTextTermSurfaceScope : String := "LlvmMultText-only"
def hostModuleCheckLlvmMultTextTermSurfaceDualOk : Bool := true

/-- Product llvmMultTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath). Same string
    as the collapsed on-disk LlvmMultText body so L0 fixtures and product match. -/
def llvmMultTextReadyTermBody : String :=
  "llvmMultTextFinishedClaimed && llvmMultTextPackageOk && llvmMultTextWroteExpected && llvmMultTextSurfaceOk && llvmMultTextKeepsLlvmLocked && llvmMultTextDoesNotUnlockLlvm && llvmMultTextLocalUnlockFalse && !llvmMultTextLlvmUnlocked && !llvmMultTextResidualFreeClaimed && !llvmMultTextProductSelfHostCompleteClaimed && !llvmMultTextProofCompleteClaimed && !llvmMultTextProvablyUnlockWorkClaimed && !llvmMultTextProductionReadyClaimed && !llvmMultTextRustNativeLinkClaimed && !llvmMultTextLlvmAsClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked"

def llvmMultTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextReady" with
  | none => false
  | some body => body == llvmMultTextReadyTermBody

def llvmMultTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmMultTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmMultTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmMultTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmMultTextTermDialect (content : String) : Option String :=
  if !llvmMultTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmMultTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmMultTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmMultTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmMultTextTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "namespace SystemsLean.LlvmMultText\n"

def hostModuleCheckLlvmMultTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmMultText\n"

/-- Honest LLVM Mult text TERM mid: required L0 decls plus living claim pins. -/
def llvmMultTextTermGoodPins (readyBody residual complete proof llvm provably
    production rustLink llvmAs : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_MULT_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-mult-text\"\n" ++
  "def llvmMultTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmMultTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmMultTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmMultTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmMultTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmMultTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmMultTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmMultTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmMultTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmMultTextTermGoodMid : String :=
  llvmMultTextTermGoodPins llvmMultTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false"

def hostModuleCheckGoodLlvmMultTextTermText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmMultTextTermGoodMid
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextResidualText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextCompleteText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextReadyText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextProofText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextLlvmText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextProvablyText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextProductionText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextRustLinkText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def hostModuleCheckBadLlvmMultTextLlvmAsText : String :=
  hostModuleCheckLlvmMultTextTermSkeletonPrefix
    ++ llvmMultTextTermGoodPins llvmMultTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckLlvmMultTextTermSkeletonSuffix

def llvmMultTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmMultText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmMultTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmMultTextTermSurfaceFrom content)
    llvmMultTextExpectedNamespace llvmMultTextRequiredDecls
    (some "SystemsLean.Mult")).isAccept

def llvmMultTextTermDialectReject (content : String) : Bool :=
  match checkLlvmMultTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmMultTextResidualL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextResidualText

def hostModuleCheckBadLlvmMultTextResidualDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextResidualText

def hostModuleCheckBadLlvmMultTextCompleteL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextCompleteText

def hostModuleCheckBadLlvmMultTextCompleteDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextCompleteText

def hostModuleCheckBadLlvmMultTextReadyL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextReadyText

def hostModuleCheckBadLlvmMultTextReadyDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextReadyText

def hostModuleCheckBadLlvmMultTextProofL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextProofText

def hostModuleCheckBadLlvmMultTextProofDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextProofText

def hostModuleCheckBadLlvmMultTextLlvmL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextLlvmText

def hostModuleCheckBadLlvmMultTextLlvmDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextLlvmText

def hostModuleCheckBadLlvmMultTextProvablyL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextProvablyText

def hostModuleCheckBadLlvmMultTextProvablyDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextProvablyText

def hostModuleCheckBadLlvmMultTextProductionL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextProductionText

def hostModuleCheckBadLlvmMultTextProductionDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextProductionText

def hostModuleCheckBadLlvmMultTextRustLinkL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextRustLinkText

def hostModuleCheckBadLlvmMultTextRustLinkDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextRustLinkText

def hostModuleCheckBadLlvmMultTextLlvmAsL0Accept : Bool :=
  llvmMultTextTermL0Accept hostModuleCheckBadLlvmMultTextLlvmAsText

def hostModuleCheckBadLlvmMultTextLlvmAsDialectReject : Bool :=
  llvmMultTextTermDialectReject hostModuleCheckBadLlvmMultTextLlvmAsText

def hostModuleCheckLlvmMultTextTermDialectOk : Bool :=
  (checkLlvmMultTextTermDialect hostModuleCheckGoodLlvmMultTextTermText).isNone

/-- On-disk LlvmMultText llvmMultTextReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmMultTextReadyMultilineText : String :=
  "def llvmMultTextReady : Bool :=\n" ++
  "  llvmMultTextFinishedClaimed\n" ++
  "    && llvmMultTextPackageOk\n" ++
  "    && llvmMultTextWroteExpected\n" ++
  "    && llvmMultTextSurfaceOk\n" ++
  "    && llvmMultTextKeepsLlvmLocked\n" ++
  "    && llvmMultTextDoesNotUnlockLlvm\n" ++
  "    && llvmMultTextLocalUnlockFalse\n" ++
  "    && !llvmMultTextLlvmUnlocked\n" ++
  "    && !llvmMultTextResidualFreeClaimed\n" ++
  "    && !llvmMultTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmMultTextProofCompleteClaimed\n" ++
  "    && !llvmMultTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmMultTextProductionReadyClaimed\n" ++
  "    && !llvmMultTextRustNativeLinkClaimed\n" ++
  "    && !llvmMultTextLlvmAsClaimed\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && LlvmEmitPath.llvmEmitPathReady\n" ++
  "    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmMultTextReady body. -/
def hostModuleCheckLlvmMultTextReadyMultilineOk : Bool :=
  llvmMultTextReadyBodyOk hostModuleCheckGoodLlvmMultTextReadyMultilineText

def hostModuleCheckLlvmMultTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmMultTextTermSurfaceDualOk
    && (checkDepthLlvmMultTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmMultTextTermSurfaceScope == "LlvmMultText-only")
    && hostModuleCheckLlvmMultTextTermDialectOk
    && hostModuleCheckBadLlvmMultTextResidualDialectReject
    && hostModuleCheckBadLlvmMultTextCompleteDialectReject
    && hostModuleCheckBadLlvmMultTextReadyDialectReject
    && hostModuleCheckBadLlvmMultTextProofDialectReject
    && hostModuleCheckBadLlvmMultTextLlvmDialectReject
    && hostModuleCheckBadLlvmMultTextProvablyDialectReject
    && hostModuleCheckBadLlvmMultTextProductionDialectReject
    && hostModuleCheckBadLlvmMultTextRustLinkDialectReject
    && hostModuleCheckBadLlvmMultTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmMultTextResidualL0Accept
    && hostModuleCheckBadLlvmMultTextCompleteL0Accept
    && hostModuleCheckBadLlvmMultTextReadyL0Accept
    && hostModuleCheckBadLlvmMultTextProofL0Accept
    && hostModuleCheckBadLlvmMultTextLlvmL0Accept
    && hostModuleCheckBadLlvmMultTextProvablyL0Accept
    && hostModuleCheckBadLlvmMultTextProductionL0Accept
    && hostModuleCheckBadLlvmMultTextRustLinkL0Accept
    && hostModuleCheckBadLlvmMultTextLlvmAsL0Accept
    && hostModuleCheckLlvmMultTextReadyMultilineOk

theorem hostModuleCheckLlvmMultTextTermSurfaceOk_true :
    hostModuleCheckLlvmMultTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmMultTextReadyMultilineOk_true :
    hostModuleCheckLlvmMultTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmMultText_term_surface_ids_eq :
    checkDepthLlvmMultTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmMultTextTermSurfaceScope = "LlvmMultText-only"
      && hostModuleCheckLlvmMultTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
