/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckLlvmLinearTextTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLlvmLinearTextTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckLlvmLinearTextTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckLlvmLinearTextTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKLLVMLINEARTEXTTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm

/-- Dual-pinned live HostModuleCheckLlvmLinearTextTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckLlvmLinearTextTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKLLVMLINEARTEXTTERM. -/
def liveHostModuleCheckLlvmLinearTextTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Linear text L2 term-surface (LLVM Linear text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Linear text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Linear text L2 dialect subset (documented; not full Lean 4 elaborator):
  - llvmLinearTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as + LlvmHold + LlvmEmitPath ready + emit-path local
    unlock false + LlvmMultText ready + Mult local unlock false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as honesty pins false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmLinearTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmLinearTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Linear text only -- not fragment front-end, not package elaborate,
    not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmLinearTextTerm, TERM-SURFACE, LlvmLinearText-only,
  ILL-TYPED-TERM, checkLlvmLinearTextTermDialect,
  hostModuleCheckLlvmLinearTextTermDialectOk,
  hostModuleCheckLlvmLinearTextTermSurfaceDualOk,
  hostModuleCheckLlvmLinearTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmLinearTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmLinearTextTerm;
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

/-! ### LLVM Linear text L2 term-surface dual-ok pins (LlvmLinearText-only) -/

def checkDepthLlvmLinearTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmLinearTextTermSurfaceScope : String := "LlvmLinearText-only"
def hostModuleCheckLlvmLinearTextTermSurfaceDualOk : Bool := true

/-- Product llvmLinearTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath + LlvmMultText).
    Same string as the collapsed on-disk LlvmLinearText body so L0 fixtures
    and product match. -/
def llvmLinearTextReadyTermBody : String :=
  "llvmLinearTextFinishedClaimed && llvmLinearTextPackageOk && llvmLinearTextWroteExpected && llvmLinearTextSurfaceOk && llvmLinearTextKeepsLlvmLocked && llvmLinearTextDoesNotUnlockLlvm && llvmLinearTextLocalUnlockFalse && !llvmLinearTextLlvmUnlocked && !llvmLinearTextResidualFreeClaimed && !llvmLinearTextProductSelfHostCompleteClaimed && !llvmLinearTextProofCompleteClaimed && !llvmLinearTextProvablyUnlockWorkClaimed && !llvmLinearTextProductionReadyClaimed && !llvmLinearTextRustNativeLinkClaimed && !llvmLinearTextLlvmAsClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked && LlvmMultText.llvmMultTextReady && !LlvmMultText.llvmMultTextLlvmUnlocked"

def llvmLinearTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextReady" with
  | none => false
  | some body => body == llvmLinearTextReadyTermBody

def llvmLinearTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmLinearTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmLinearTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmLinearTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmLinearTextTermDialect (content : String) : Option String :=
  if !llvmLinearTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmLinearTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmLinearTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmLinearTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmLinearTextTermSkeletonPrefix : String :=
  "import SystemsLean.Linear\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "import SystemsLean.LlvmMultText\n" ++
  "namespace SystemsLean.LlvmLinearText\n"

def hostModuleCheckLlvmLinearTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmLinearText\n"

/-- Honest LLVM Linear text TERM mid: required L0 decls plus living claim pins. -/
def llvmLinearTextTermGoodPins (readyBody residual complete proof llvm provably
    production rustLink llvmAs : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_LINEAR_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-linear-text\"\n" ++
  "def llvmLinearTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmLinearTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmLinearTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmLinearTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmLinearTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmLinearTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmLinearTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmLinearTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmLinearTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmLinearTextTermGoodMid : String :=
  llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false"

def hostModuleCheckGoodLlvmLinearTextTermText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmLinearTextTermGoodMid
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextResidualText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextCompleteText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextReadyText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextProofText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextLlvmText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextProvablyText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextProductionText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextRustLinkText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def hostModuleCheckBadLlvmLinearTextLlvmAsText : String :=
  hostModuleCheckLlvmLinearTextTermSkeletonPrefix
    ++ llvmLinearTextTermGoodPins llvmLinearTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckLlvmLinearTextTermSkeletonSuffix

def llvmLinearTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmLinearText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmLinearTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmLinearTextTermSurfaceFrom content)
    llvmLinearTextExpectedNamespace llvmLinearTextRequiredDecls
    (some "SystemsLean.Linear")).isAccept

def llvmLinearTextTermDialectReject (content : String) : Bool :=
  match checkLlvmLinearTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmLinearTextResidualL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextResidualText

def hostModuleCheckBadLlvmLinearTextResidualDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextResidualText

def hostModuleCheckBadLlvmLinearTextCompleteL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextCompleteText

def hostModuleCheckBadLlvmLinearTextCompleteDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextCompleteText

def hostModuleCheckBadLlvmLinearTextReadyL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextReadyText

def hostModuleCheckBadLlvmLinearTextReadyDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextReadyText

def hostModuleCheckBadLlvmLinearTextProofL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextProofText

def hostModuleCheckBadLlvmLinearTextProofDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextProofText

def hostModuleCheckBadLlvmLinearTextLlvmL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextLlvmText

def hostModuleCheckBadLlvmLinearTextLlvmDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextLlvmText

def hostModuleCheckBadLlvmLinearTextProvablyL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextProvablyText

def hostModuleCheckBadLlvmLinearTextProvablyDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextProvablyText

def hostModuleCheckBadLlvmLinearTextProductionL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextProductionText

def hostModuleCheckBadLlvmLinearTextProductionDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextProductionText

def hostModuleCheckBadLlvmLinearTextRustLinkL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextRustLinkText

def hostModuleCheckBadLlvmLinearTextRustLinkDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextRustLinkText

def hostModuleCheckBadLlvmLinearTextLlvmAsL0Accept : Bool :=
  llvmLinearTextTermL0Accept hostModuleCheckBadLlvmLinearTextLlvmAsText

def hostModuleCheckBadLlvmLinearTextLlvmAsDialectReject : Bool :=
  llvmLinearTextTermDialectReject hostModuleCheckBadLlvmLinearTextLlvmAsText

def hostModuleCheckLlvmLinearTextTermDialectOk : Bool :=
  (checkLlvmLinearTextTermDialect hostModuleCheckGoodLlvmLinearTextTermText).isNone

/-- On-disk LlvmLinearText llvmLinearTextReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmLinearTextReadyMultilineText : String :=
  "def llvmLinearTextReady : Bool :=\n" ++
  "  llvmLinearTextFinishedClaimed\n" ++
  "    && llvmLinearTextPackageOk\n" ++
  "    && llvmLinearTextWroteExpected\n" ++
  "    && llvmLinearTextSurfaceOk\n" ++
  "    && llvmLinearTextKeepsLlvmLocked\n" ++
  "    && llvmLinearTextDoesNotUnlockLlvm\n" ++
  "    && llvmLinearTextLocalUnlockFalse\n" ++
  "    && !llvmLinearTextLlvmUnlocked\n" ++
  "    && !llvmLinearTextResidualFreeClaimed\n" ++
  "    && !llvmLinearTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmLinearTextProofCompleteClaimed\n" ++
  "    && !llvmLinearTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmLinearTextProductionReadyClaimed\n" ++
  "    && !llvmLinearTextRustNativeLinkClaimed\n" ++
  "    && !llvmLinearTextLlvmAsClaimed\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && LlvmEmitPath.llvmEmitPathReady\n" ++
  "    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked\n" ++
  "    && LlvmMultText.llvmMultTextReady\n" ++
  "    && !LlvmMultText.llvmMultTextLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmLinearTextReady body. -/
def hostModuleCheckLlvmLinearTextReadyMultilineOk : Bool :=
  llvmLinearTextReadyBodyOk hostModuleCheckGoodLlvmLinearTextReadyMultilineText

def hostModuleCheckLlvmLinearTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmLinearTextTermSurfaceDualOk
    && (checkDepthLlvmLinearTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmLinearTextTermSurfaceScope == "LlvmLinearText-only")
    && hostModuleCheckLlvmLinearTextTermDialectOk
    && hostModuleCheckBadLlvmLinearTextResidualDialectReject
    && hostModuleCheckBadLlvmLinearTextCompleteDialectReject
    && hostModuleCheckBadLlvmLinearTextReadyDialectReject
    && hostModuleCheckBadLlvmLinearTextProofDialectReject
    && hostModuleCheckBadLlvmLinearTextLlvmDialectReject
    && hostModuleCheckBadLlvmLinearTextProvablyDialectReject
    && hostModuleCheckBadLlvmLinearTextProductionDialectReject
    && hostModuleCheckBadLlvmLinearTextRustLinkDialectReject
    && hostModuleCheckBadLlvmLinearTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmLinearTextResidualL0Accept
    && hostModuleCheckBadLlvmLinearTextCompleteL0Accept
    && hostModuleCheckBadLlvmLinearTextReadyL0Accept
    && hostModuleCheckBadLlvmLinearTextProofL0Accept
    && hostModuleCheckBadLlvmLinearTextLlvmL0Accept
    && hostModuleCheckBadLlvmLinearTextProvablyL0Accept
    && hostModuleCheckBadLlvmLinearTextProductionL0Accept
    && hostModuleCheckBadLlvmLinearTextRustLinkL0Accept
    && hostModuleCheckBadLlvmLinearTextLlvmAsL0Accept
    && hostModuleCheckLlvmLinearTextReadyMultilineOk

theorem hostModuleCheckLlvmLinearTextTermSurfaceOk_true :
    hostModuleCheckLlvmLinearTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmLinearTextReadyMultilineOk_true :
    hostModuleCheckLlvmLinearTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmLinearText_term_surface_ids_eq :
    checkDepthLlvmLinearTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmLinearTextTermSurfaceScope = "LlvmLinearText-only"
      && hostModuleCheckLlvmLinearTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckLlvmLinearTextTerm
