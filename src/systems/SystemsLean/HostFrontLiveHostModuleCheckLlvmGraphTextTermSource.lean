/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckLlvmGraphTextTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLlvmGraphTextTermSource.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-LLVMGRAPHTEXTTERM,
  liveHostModuleCheckLlvmGraphTextTermSource, liveRel,
  HOST-FRONT-LIVE-LLVMGRAPHTEXTTERM, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckLlvmGraphTextTerm.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckLlvmGraphTextTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Dual-pinned live HostModuleCheckLlvmGraphTextTerm.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckLlvmGraphTextTermSource, PARSE-LIVE-LLVMGRAPHTEXTTERM. -/
def liveHostModuleCheckLlvmGraphTextTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Graph text L2 term-surface
  (LLVM Graph text TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LLVM Graph text dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LLVM IR Graph text L2 dialect subset (documented; not full Lean 4
  elaborator):
  - llvmGraphTextReady compose matches product (finished + package + wrote +
    surface + keeps locked + does not unlock + local unlock false + living
    false residual-free / complete / proof / PROVABLY-work / production /
    rust-link / llvm-as / cfg / dominance / ssa + LlvmHold + LlvmEmitPath ready +
    emit-path local unlock false + LlvmMultText ready + Mult local unlock false +
    LlvmLinearText ready + Linear local unlock false + LlvmTypesText ready +
    Types local unlock false + LlvmProgramText ready + Program local unlock
    false).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / local llvm unlock / PROVABLY-work / production / rust-link /
    llvm-as / cfg / dominance / ssa honesty pins false.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not Lake-false twins (this module has no stillUsesLake pin).
  - Not HostPackageWrite. Not MultFsDeepen writer-deepen. Not join.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLlvmGraphTextTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLlvmGraphTextTermSurfaceOk.

  Intentional non-claims:
  - LLVM IR Graph text only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Not llvm unlock. Not FullBackend.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLlvmGraphTextTerm, TERM-SURFACE, LlvmGraphText-only,
  ILL-TYPED-TERM, checkLlvmGraphTextTermDialect,
  hostModuleCheckLlvmGraphTextTermDialectOk,
  hostModuleCheckLlvmGraphTextTermSurfaceDualOk,
  hostModuleCheckLlvmGraphTextTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLlvmGraphTextTerm
  Red/green: lake build SystemsLean.HostModuleCheckLlvmGraphTextTerm;
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

/-! ### LLVM Graph text L2 term-surface dual-ok pins (LlvmGraphText-only) -/

def checkDepthLlvmGraphTextTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLlvmGraphTextTermSurfaceScope : String := "LlvmGraphText-only"
def hostModuleCheckLlvmGraphTextTermSurfaceDualOk : Bool := true

/-- Product llvmGraphTextReady fold (finished + package + wrote + surface +
    lock honesty + living false claims + LlvmHold + LlvmEmitPath +
    LlvmMultText + LlvmLinearText + LlvmTypesText + LlvmProgramText). Same
    string as the collapsed on-disk LlvmGraphText body so L0 fixtures and
    product match. -/
def llvmGraphTextReadyTermBody : String :=
  "llvmGraphTextFinishedClaimed && llvmGraphTextPackageOk && llvmGraphTextWroteExpected && llvmGraphTextSurfaceOk && llvmGraphTextKeepsLlvmLocked && llvmGraphTextDoesNotUnlockLlvm && llvmGraphTextLocalUnlockFalse && !llvmGraphTextLlvmUnlocked && !llvmGraphTextResidualFreeClaimed && !llvmGraphTextProductSelfHostCompleteClaimed && !llvmGraphTextProofCompleteClaimed && !llvmGraphTextProvablyUnlockWorkClaimed && !llvmGraphTextProductionReadyClaimed && !llvmGraphTextRustNativeLinkClaimed && !llvmGraphTextLlvmAsClaimed && !llvmGraphTextCfgClaimed && !llvmGraphTextDominanceClaimed && !llvmGraphTextSsaClaimed && LlvmHold.llvmHoldReady && LlvmEmitPath.llvmEmitPathReady && !LlvmEmitPath.llvmEmitPathLlvmUnlocked && LlvmMultText.llvmMultTextReady && !LlvmMultText.llvmMultTextLlvmUnlocked && LlvmLinearText.llvmLinearTextReady && !LlvmLinearText.llvmLinearTextLlvmUnlocked && LlvmTypesText.llvmTypesTextReady && !LlvmTypesText.llvmTypesTextLlvmUnlocked && LlvmProgramText.llvmProgramTextReady && !LlvmProgramText.llvmProgramTextLlvmUnlocked"

def llvmGraphTextReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextReady" with
  | none => false
  | some body => body == llvmGraphTextReadyTermBody

def llvmGraphTextResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def llvmGraphTextProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextProvablyUnlockWorkClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextProductionBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextProductionReadyClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextRustLinkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextRustNativeLinkClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextLlvmAsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextLlvmAsClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextCfgBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextCfgClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextDominanceBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextDominanceClaimed" with
  | none => false
  | some body => body == "false"

def llvmGraphTextSsaBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "llvmGraphTextSsaClaimed" with
  | none => false
  | some body => body == "false"

def checkLlvmGraphTextTermDialect (content : String) : Option String :=
  if !llvmGraphTextReadyBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextCompleteBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextProofBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextLlvmBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextProvablyBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextProductionBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextRustLinkBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextLlvmAsBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextCfgBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextDominanceBodyOk content then some reasonIllTypedTerm
  else if !llvmGraphTextSsaBodyOk content then some reasonIllTypedTerm
  else none

def refineLlvmGraphTextWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLlvmGraphTextTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLlvmGraphTextTermSkeletonPrefix : String :=
  "import SystemsLean.IrGraph\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "import SystemsLean.LlvmEmitPath\n" ++
  "import SystemsLean.LlvmMultText\n" ++
  "import SystemsLean.LlvmLinearText\n" ++
  "import SystemsLean.LlvmTypesText\n" ++
  "import SystemsLean.LlvmProgramText\n" ++
  "namespace SystemsLean.LlvmGraphText\n"

def hostModuleCheckLlvmGraphTextTermSkeletonSuffix : String :=
  "end SystemsLean.LlvmGraphText\n"

/-- Honest LLVM Graph text TERM mid: required L0 decls plus living claim pins. -/
def llvmGraphTextTermGoodPins (readyBody residual complete proof llvm
    provably production rustLink llvmAs cfg dominance ssa : String) : String :=
  "def stageId : String := \"SLAKE_LLVM_GRAPH_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-GRAPH-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-GRAPH-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-graph-text\"\n" ++
  "def llvmGraphTextLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def llvmGraphTextResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def llvmGraphTextProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def llvmGraphTextProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def llvmGraphTextProvablyUnlockWorkClaimed : Bool := " ++ provably ++ "\n" ++
  "def llvmGraphTextProductionReadyClaimed : Bool := " ++ production ++ "\n" ++
  "def llvmGraphTextRustNativeLinkClaimed : Bool := " ++ rustLink ++ "\n" ++
  "def llvmGraphTextLlvmAsClaimed : Bool := " ++ llvmAs ++ "\n" ++
  "def llvmGraphTextCfgClaimed : Bool := " ++ cfg ++ "\n" ++
  "def llvmGraphTextDominanceClaimed : Bool := " ++ dominance ++ "\n" ++
  "def llvmGraphTextSsaClaimed : Bool := " ++ ssa ++ "\n" ++
  "def llvmGraphTextReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckLlvmGraphTextTermGoodMid : String :=
  llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
    "false" "false" "false" "false" "false" "false" "false" "false" "false"
    "false" "false"

def hostModuleCheckGoodLlvmGraphTextTermText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ hostModuleCheckLlvmGraphTextTermGoodMid
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextResidualText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "true" "false" "false" "false" "false" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextCompleteText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "true" "false" "false" "false" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextReadyText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins "true"
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextProofText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "true" "false" "false" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextLlvmText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "true" "false" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextProvablyText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "true" "false" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextProductionText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "true" "false" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextRustLinkText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "true" "false" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextLlvmAsText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "true" "false"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextCfgText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "true"
      "false" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextDominanceText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "true" "false"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def hostModuleCheckBadLlvmGraphTextSsaText : String :=
  hostModuleCheckLlvmGraphTextTermSkeletonPrefix
    ++ llvmGraphTextTermGoodPins llvmGraphTextReadyTermBody
      "false" "false" "false" "false" "false" "false" "false" "false" "false"
      "false" "true"
    ++ hostModuleCheckLlvmGraphTextTermSkeletonSuffix

def llvmGraphTextTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LlvmGraphText"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def llvmGraphTextTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (llvmGraphTextTermSurfaceFrom content)
    llvmGraphTextExpectedNamespace llvmGraphTextRequiredDecls
    (some "SystemsLean.IrGraph")).isAccept

def llvmGraphTextTermDialectReject (content : String) : Bool :=
  match checkLlvmGraphTextTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLlvmGraphTextResidualL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextResidualText

def hostModuleCheckBadLlvmGraphTextResidualDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextResidualText

def hostModuleCheckBadLlvmGraphTextCompleteL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextCompleteText

def hostModuleCheckBadLlvmGraphTextCompleteDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextCompleteText

def hostModuleCheckBadLlvmGraphTextReadyL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextReadyText

def hostModuleCheckBadLlvmGraphTextReadyDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextReadyText

def hostModuleCheckBadLlvmGraphTextProofL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextProofText

def hostModuleCheckBadLlvmGraphTextProofDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextProofText

def hostModuleCheckBadLlvmGraphTextLlvmL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextLlvmText

def hostModuleCheckBadLlvmGraphTextLlvmDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextLlvmText

def hostModuleCheckBadLlvmGraphTextProvablyL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextProvablyText

def hostModuleCheckBadLlvmGraphTextProvablyDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextProvablyText

def hostModuleCheckBadLlvmGraphTextProductionL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextProductionText

def hostModuleCheckBadLlvmGraphTextProductionDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextProductionText

def hostModuleCheckBadLlvmGraphTextRustLinkL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextRustLinkText

def hostModuleCheckBadLlvmGraphTextRustLinkDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextRustLinkText

def hostModuleCheckBadLlvmGraphTextLlvmAsL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextLlvmAsText

def hostModuleCheckBadLlvmGraphTextLlvmAsDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextLlvmAsText

def hostModuleCheckBadLlvmGraphTextCfgL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextCfgText

def hostModuleCheckBadLlvmGraphTextCfgDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextCfgText

def hostModuleCheckBadLlvmGraphTextDominanceL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextDominanceText

def hostModuleCheckBadLlvmGraphTextDominanceDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextDominanceText

def hostModuleCheckBadLlvmGraphTextSsaL0Accept : Bool :=
  llvmGraphTextTermL0Accept hostModuleCheckBadLlvmGraphTextSsaText

def hostModuleCheckBadLlvmGraphTextSsaDialectReject : Bool :=
  llvmGraphTextTermDialectReject hostModuleCheckBadLlvmGraphTextSsaText

def hostModuleCheckLlvmGraphTextTermDialectOk : Bool :=
  (checkLlvmGraphTextTermDialect hostModuleCheckGoodLlvmGraphTextTermText).isNone

/-- On-disk LlvmGraphText llvmGraphTextReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLlvmGraphTextReadyMultilineText : String :=
  "def llvmGraphTextReady : Bool :=\n" ++
  "  llvmGraphTextFinishedClaimed\n" ++
  "    && llvmGraphTextPackageOk\n" ++
  "    && llvmGraphTextWroteExpected\n" ++
  "    && llvmGraphTextSurfaceOk\n" ++
  "    && llvmGraphTextKeepsLlvmLocked\n" ++
  "    && llvmGraphTextDoesNotUnlockLlvm\n" ++
  "    && llvmGraphTextLocalUnlockFalse\n" ++
  "    && !llvmGraphTextLlvmUnlocked\n" ++
  "    && !llvmGraphTextResidualFreeClaimed\n" ++
  "    && !llvmGraphTextProductSelfHostCompleteClaimed\n" ++
  "    && !llvmGraphTextProofCompleteClaimed\n" ++
  "    && !llvmGraphTextProvablyUnlockWorkClaimed\n" ++
  "    && !llvmGraphTextProductionReadyClaimed\n" ++
  "    && !llvmGraphTextRustNativeLinkClaimed\n" ++
  "    && !llvmGraphTextLlvmAsClaimed\n" ++
  "    && !llvmGraphTextCfgClaimed\n" ++
  "    && !llvmGraphTextDominanceClaimed\n" ++
  "    && !llvmGraphTextSsaClaimed\n" ++
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
  "    && !LlvmProgramText.llvmProgramTextLlvmUnlocked\n"

/-- Collapse of the on-disk multi-line llvmGraphTextReady body. -/
def hostModuleCheckLlvmGraphTextReadyMultilineOk : Bool :=
  llvmGraphTextReadyBodyOk hostModuleCheckGoodLlvmGraphTextReadyMultilineText

def hostModuleCheckLlvmGraphTextTermSurfaceOk : Bool :=
  hostModuleCheckLlvmGraphTextTermSurfaceDualOk
    && (checkDepthLlvmGraphTextTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLlvmGraphTextTermSurfaceScope == "LlvmGraphText-only")
    && hostModuleCheckLlvmGraphTextTermDialectOk
    && hostModuleCheckBadLlvmGraphTextResidualDialectReject
    && hostModuleCheckBadLlvmGraphTextCompleteDialectReject
    && hostModuleCheckBadLlvmGraphTextReadyDialectReject
    && hostModuleCheckBadLlvmGraphTextProofDialectReject
    && hostModuleCheckBadLlvmGraphTextLlvmDialectReject
    && hostModuleCheckBadLlvmGraphTextProvablyDialectReject
    && hostModuleCheckBadLlvmGraphTextProductionDialectReject
    && hostModuleCheckBadLlvmGraphTextRustLinkDialectReject
    && hostModuleCheckBadLlvmGraphTextLlvmAsDialectReject
    && hostModuleCheckBadLlvmGraphTextCfgDialectReject
    && hostModuleCheckBadLlvmGraphTextDominanceDialectReject
    && hostModuleCheckBadLlvmGraphTextSsaDialectReject
    && hostModuleCheckBadLlvmGraphTextResidualL0Accept
    && hostModuleCheckBadLlvmGraphTextCompleteL0Accept
    && hostModuleCheckBadLlvmGraphTextReadyL0Accept
    && hostModuleCheckBadLlvmGraphTextProofL0Accept
    && hostModuleCheckBadLlvmGraphTextLlvmL0Accept
    && hostModuleCheckBadLlvmGraphTextProvablyL0Accept
    && hostModuleCheckBadLlvmGraphTextProductionL0Accept
    && hostModuleCheckBadLlvmGraphTextRustLinkL0Accept
    && hostModuleCheckBadLlvmGraphTextLlvmAsL0Accept
    && hostModuleCheckBadLlvmGraphTextCfgL0Accept
    && hostModuleCheckBadLlvmGraphTextDominanceL0Accept
    && hostModuleCheckBadLlvmGraphTextSsaL0Accept
    && hostModuleCheckLlvmGraphTextReadyMultilineOk

theorem hostModuleCheckLlvmGraphTextTermSurfaceOk_true :
    hostModuleCheckLlvmGraphTextTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLlvmGraphTextReadyMultilineOk_true :
    hostModuleCheckLlvmGraphTextReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_llvmGraphText_term_surface_ids_eq :
    checkDepthLlvmGraphTextTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLlvmGraphTextTermSurfaceScope = "LlvmGraphText-only"
      && hostModuleCheckLlvmGraphTextTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckLlvmGraphTextTerm
