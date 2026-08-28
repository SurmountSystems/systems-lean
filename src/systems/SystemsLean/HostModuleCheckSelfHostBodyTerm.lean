/-
  SYSTEMS_LEAN_HOST partial -- SelfHostBody leftover L2 term-surface
  (SelfHostBody TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SelfHostBody leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host self-host-body leftover dialect subset (documented; not full Lean 4
  elaborator):
  - selfHostBodyReady compose matches product (sixteen conjuncts:
    EmitMult.emitMultReady + EmitLinear.emitLinearReady +
    EmitErasure.emitErasureReady + EmitExtract.emitExtractReady +
    EmitTypes.emitTypesReady + EmitProgram.emitProgramReady +
    EmitGraph.emitGraphReady + EmitCompose.emitComposeReady +
    EmitPlan.emitPlanReady + EmitApply.emitApplyReady +
    EmitBody.emitBodyReady + selfHostBodySurfaceOk +
    (freestandingEmitStageCite == "SLAKE_EMIT_FREESTANDING_C_V0") +
    !residualFreeClaimed + productSelfHostCompleteClaimed +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is L0 presence false and a ready conjunct
    (!residualFreeClaimed). Not a DualResidual ILL.
  - selfHostBodyOk aliases selfHostBodyReady. L0 requires the alias.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (L0 requires the name present as false).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not SelfHostBodyTheorems. Not PackageEnv / Soft J2
    (later PE invents packageBodyImportsEmitMult).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSelfHostBodyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSelfHostBodyTermSurfaceOk.

  Intentional non-claims:
  - Host self-host-body leftover only -- not package elaborate, not FullHost
    re-true.
  - Not SelfHostBodyTheorems. Not ProbeWire rewrite. Not DualResidual rewrite.
  - Not emit*Ready. Not full elaborator typecheck. Not freestanding residual
    free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip DualResidual residualFreeClaimed (stays true).
  - Does not flip DualResidual hostElaboratorResidualFreeClaimed (stays true).
  - Does not flip DualResidual remains pins (stay false).
  - Does not flip productSelfHostCompleteClaimed or
    SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSelfHostBodyTerm, TERM-SURFACE, SelfHostBody-only,
  ILL-TYPED-TERM, checkSelfHostBodyTermDialect,
  hostModuleCheckSelfHostBodyTermDialectOk,
  hostModuleCheckSelfHostBodyTermSurfaceDualOk,
  hostModuleCheckSelfHostBodyTermSurfaceOk,
  selfHostBodyReady, selfHostBodyOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSelfHostBodyTerm
  Red/green: lake build SystemsLean.HostModuleCheckSelfHostBodyTerm;
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

/-! ### SelfHostBody leftover L2 term-surface dual-ok pins (SelfHostBody-only) -/

def checkDepthSelfHostBodyTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSelfHostBodyTermSurfaceScope : String := "SelfHostBody-only"
def hostModuleCheckSelfHostBodyTermSurfaceDualOk : Bool := true

/-- Product selfHostBodyReady fold (sixteen conjuncts only). Same string
    as the collapsed on-disk SelfHostBody leftover body so L0 fixtures and
    product match. Keep parens on the stage-cite equality. No Lake / llvm /
    dominance conjuncts. residual-free stays a false conjunct, not an ILL. -/
def selfHostBodyReadyTermBody : String :=
  "EmitMult.emitMultReady && EmitLinear.emitLinearReady && EmitErasure.emitErasureReady && EmitExtract.emitExtractReady && EmitTypes.emitTypesReady && EmitProgram.emitProgramReady && EmitGraph.emitGraphReady && EmitCompose.emitComposeReady && EmitPlan.emitPlanReady && EmitApply.emitApplyReady && EmitBody.emitBodyReady && selfHostBodySurfaceOk && (freestandingEmitStageCite == \"SLAKE_EMIT_FREESTANDING_C_V0\") && !residualFreeClaimed && productSelfHostCompleteClaimed && SelfApplyFs.freestandingProductSelfHostComplete"

def selfHostBodyReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostBodyReady" with
  | none => false
  | some body => body == selfHostBodyReadyTermBody

def checkSelfHostBodyTermDialect (content : String) : Option String :=
  if !selfHostBodyReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineSelfHostBodyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSelfHostBodyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSelfHostBodyTermSkeletonPrefix : String :=
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.SelfHostBody\n"

def hostModuleCheckSelfHostBodyTermSkeletonSuffix : String :=
  "end SystemsLean.SelfHostBody\n"

/-- Honest SelfHostBody leftover TERM mid: required L0 decls. Stage /
    host ids match product SelfHostBody leftover. residualFreeClaimed
    stays false (L0 presence and ready conjunct; not a DualResidual ILL).
    selfHostBodyOk aliases selfHostBodyReady (L0 requires the alias). -/
def selfHostBodyTermGoodPins (readyBody : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_BODY_V0\"\n" ++
  "def hostSelfHostBodyId : String := \"HOST-SELF-HOST-BODY\"\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def selfHostBodyReady : Bool := " ++ readyBody ++ "\n" ++
  "def selfHostBodyOk : Bool := selfHostBodyReady\n"

def hostModuleCheckSelfHostBodyTermGoodMid : String :=
  selfHostBodyTermGoodPins selfHostBodyReadyTermBody

def hostModuleCheckGoodSelfHostBodyTermText : String :=
  hostModuleCheckSelfHostBodyTermSkeletonPrefix
    ++ hostModuleCheckSelfHostBodyTermGoodMid
    ++ hostModuleCheckSelfHostBodyTermSkeletonSuffix

def hostModuleBodyBadSelfHostBodyReadyText : String :=
  selfHostBodyTermGoodPins "true"

def hostModuleCheckBadSelfHostBodyReadyText : String :=
  hostModuleCheckSelfHostBodyTermSkeletonPrefix
    ++ hostModuleBodyBadSelfHostBodyReadyText
    ++ hostModuleCheckSelfHostBodyTermSkeletonSuffix

def selfHostBodyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SelfHostBody"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def selfHostBodyTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (selfHostBodyTermSurfaceFrom content)
    selfHostBodyExpectedNamespace selfHostBodyRequiredDecls
    (some "SystemsLean.EmitMult")).isAccept

def selfHostBodyTermDialectReject (content : String) : Bool :=
  match checkSelfHostBodyTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSelfHostBodyReadyL0Accept : Bool :=
  selfHostBodyTermL0Accept hostModuleCheckBadSelfHostBodyReadyText

def hostModuleCheckBadSelfHostBodyReadyDialectReject : Bool :=
  selfHostBodyTermDialectReject hostModuleCheckBadSelfHostBodyReadyText

def hostModuleCheckSelfHostBodyTermDialectOk : Bool :=
  (checkSelfHostBodyTermDialect hostModuleCheckGoodSelfHostBodyTermText).isNone

/-- On-disk SelfHostBody leftover selfHostBodyReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodSelfHostBodyReadyMultilineText : String :=
  "def selfHostBodyReady : Bool :=\n" ++
  "  EmitMult.emitMultReady\n" ++
  "    && EmitLinear.emitLinearReady\n" ++
  "    && EmitErasure.emitErasureReady\n" ++
  "    && EmitExtract.emitExtractReady\n" ++
  "    && EmitTypes.emitTypesReady\n" ++
  "    && EmitProgram.emitProgramReady\n" ++
  "    && EmitGraph.emitGraphReady\n" ++
  "    && EmitCompose.emitComposeReady\n" ++
  "    && EmitPlan.emitPlanReady\n" ++
  "    && EmitApply.emitApplyReady\n" ++
  "    && EmitBody.emitBodyReady\n" ++
  "    && selfHostBodySurfaceOk\n" ++
  "    && (freestandingEmitStageCite == \"SLAKE_EMIT_FREESTANDING_C_V0\")\n" ++
  "    && !residualFreeClaimed\n" ++
  "    && productSelfHostCompleteClaimed\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line selfHostBodyReady body. -/
def hostModuleCheckSelfHostBodyReadyMultilineOk : Bool :=
  selfHostBodyReadyBodyOk hostModuleCheckGoodSelfHostBodyReadyMultilineText

def hostModuleCheckSelfHostBodyTermSurfaceOk : Bool :=
  hostModuleCheckSelfHostBodyTermSurfaceDualOk
    && (checkDepthSelfHostBodyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSelfHostBodyTermSurfaceScope == "SelfHostBody-only")
    && hostModuleCheckSelfHostBodyTermDialectOk
    && hostModuleCheckBadSelfHostBodyReadyDialectReject
    && hostModuleCheckBadSelfHostBodyReadyL0Accept
    && hostModuleCheckSelfHostBodyReadyMultilineOk

theorem hostModuleCheckSelfHostBodyTermSurfaceOk_true :
    hostModuleCheckSelfHostBodyTermSurfaceOk = true := by native_decide

theorem hostModuleCheckSelfHostBodyReadyMultilineOk_true :
    hostModuleCheckSelfHostBodyReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_selfHostBody_term_surface_ids_eq :
    checkDepthSelfHostBodyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSelfHostBodyTermSurfaceScope = "SelfHostBody-only"
      && hostModuleCheckSelfHostBodyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
