/-
  SYSTEMS_LEAN_HOST partial -- KernelLinear L2 term-surface pilot (C2 after KernelMult).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelLinear dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelLinear L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_LINEAR_V0"; kernelLinearId
    "SELF-HOST-KERNEL-LINEAR".
  - lowerLinearKernel fail-closed one-node lower (empty + pushNode mkLinearNode).
  - linearKernelReady match lowerLinearKernel with none false / some path fold.
  - linearMismatchRejected dual mkNode? isNone arms; linearKernelOk ready && mismatch.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelLinearTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelLinearTermSurfaceOk (E-good dialect +
    KL1..KL4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelLinear pilot only -- not package elaborate, not KernelLinearTheorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply + EmitBody + KernelMult TERM-SURFACE
    dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for KernelLinear is KernelLinear-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckKernelLinearTerm,
  TERM-SURFACE, KernelLinear-only, ILL-TYPED-TERM, checkKernelLinearTermDialect,
  hostModuleCheckBadKernelLinearStageIdText,
  hostModuleCheckBadKernelLinearLowerText,
  hostModuleCheckBadKernelLinearReadyText,
  hostModuleCheckBadKernelLinearMismatchText,
  hostModuleCheckKernelLinearTermDialectOk, KernelLinear term-surface pilot,
  hostModuleCheckKernelLinearTermSurfaceDualOk,
  hostModuleCheckKernelLinearTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelLinearTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelLinearTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelLinear L2 term-surface dual-ok pins (KernelLinear-only) -/

/-- Named term-surface depth bar for KernelLinear L2 pilot honesty.
    Greppable: checkDepthKernelLinearTermSurfaceBar, TERM-SURFACE, KernelLinear-only. -/
def checkDepthKernelLinearTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: KernelLinear.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthKernelLinearTermSurfaceScope, KernelLinear-only, TERM-SURFACE. -/
def checkDepthKernelLinearTermSurfaceScope : String := "KernelLinear-only"

/-- Dual-ok when KernelLinear L2 E-good/E-bad rejects work (KernelLinear pilot only).
    Greppable: hostModuleCheckKernelLinearTermSurfaceDualOk, TERM-SURFACE,
    KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSurfaceDualOk : Bool := true

/-! ### KernelLinear dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_KERNEL_LINEAR_V0 string.
    Greppable: kernelLinearStageIdBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\""

/-- kernelLinearId body is SELF-HOST-KERNEL-LINEAR string.
    Greppable: kernelLinearIdBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelLinearId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-LINEAR\""

/-- lowerLinearKernel fail-closed one-node lower body (collapsed).
    Greppable: kernelLinearLowerBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearLowerBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "lowerLinearKernel" with
  | none => false
  | some body =>
    body == "let p0 : Program := IrProgram.empty pushNode p0 (mkLinearNode tagLinear)"

/-- linearKernelReady match lower fail-closed body.
    Greppable: kernelLinearReadyBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearKernelReady" with
  | none => false
  | some body =>
    body == "match lowerLinearKernel with | none => false | some p => programCompileReady p && linearHostPathReady && gradeSurfaceOk && linearSurfaceOk"

/-- linearMismatchRejected dual mkNode? isNone arms.
    Greppable: kernelLinearMismatchBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearMismatchBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearMismatchRejected" with
  | none => false
  | some body =>
    body == "(Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone"

/-- linearKernelOk body is linearKernelReady && linearMismatchRejected.
    Greppable: kernelLinearKernelOkBodyOk, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearKernelOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearKernelOk" with
  | none => false
  | some body =>
    body == "linearKernelReady && linearMismatchRejected"

/-- KernelLinear L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkKernelLinearTermDialect, TERM-SURFACE,
    KernelLinear term-surface pilot. -/
def checkKernelLinearTermDialect (content : String) : Option String :=
  if !kernelLinearStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelLinearIdBodyOk content then some reasonIllTypedTerm
  else if !kernelLinearLowerBodyOk content then some reasonIllTypedTerm
  else if !kernelLinearReadyBodyOk content then some reasonIllTypedTerm
  else if !kernelLinearMismatchBodyOk content then some reasonIllTypedTerm
  else if !kernelLinearKernelOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply KernelLinear L2 after a structural KernelLinear accept.
    Greppable: refineKernelLinearWithTermSurface, TERM-SURFACE, KernelLinear-only. -/
def refineKernelLinearWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelLinearTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelLinear L2 well-typed good fixture (E-good) -/

/-- Shared KernelLinear skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckKernelLinearTermSkeletonPrefix, TERM-SURFACE,
    KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelLinear\n"

/-- Shared KernelLinear skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckKernelLinearTermSkeletonSuffix, TERM-SURFACE,
    KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSkeletonSuffix : String :=
  "end SystemsLean.KernelLinear\n"

/-- Shared good-path mid bodies for stage/id/lower/ready/mismatch/ok + L0 tokens.
    Greppable: hostModuleCheckKernelLinearTermGoodMid, TERM-SURFACE, KernelLinear-only. -/
def hostModuleCheckKernelLinearTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  pushNode p0 (mkLinearNode tagLinear)\n" ++
  "def linearKernelReady : Bool :=\n" ++
  "  match lowerLinearKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && linearHostPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && linearSurfaceOk\n" ++
  "def linearKernelOk : Bool := linearKernelReady && linearMismatchRejected\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool :=\n" ++
  "  (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone\n" ++
  "    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone\n" ++
  "def linearSurfaceOk : Bool := true\n"

/-- Well-typed KernelLinear L2 good text.
    Greppable: hostModuleCheckGoodKernelLinearTermText, TERM-SURFACE, KernelLinear-only. -/
def hostModuleCheckGoodKernelLinearTermText : String :=
  hostModuleCheckKernelLinearTermSkeletonPrefix
    ++ hostModuleCheckKernelLinearTermGoodMid
    ++ hostModuleCheckKernelLinearTermSkeletonSuffix

/-! ### Ill-typed KernelLinear twins (L0 tokens present; L2 must reject). -/

/-- KL1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadKernelLinearStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearStageIdText : String :=
  hostModuleCheckKernelLinearTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  pushNode p0 (mkLinearNode tagLinear)\n" ++
  "def linearKernelReady : Bool :=\n" ++
  "  match lowerLinearKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && linearHostPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && linearSurfaceOk\n" ++
  "def linearKernelOk : Bool := linearKernelReady && linearMismatchRejected\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool :=\n" ++
  "  (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone\n" ++
  "    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone\n" ++
  "def linearSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelLinearTermSkeletonSuffix

/-- KL2: lowerLinearKernel always some 0 (drops fail-closed one-node lower).
    Greppable: hostModuleCheckBadKernelLinearLowerText, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearLowerText : String :=
  hostModuleCheckKernelLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat := some 0\n" ++
  "def linearKernelReady : Bool :=\n" ++
  "  match lowerLinearKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && linearHostPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && linearSurfaceOk\n" ++
  "def linearKernelOk : Bool := linearKernelReady && linearMismatchRejected\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool :=\n" ++
  "  (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone\n" ++
  "    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone\n" ++
  "def linearSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelLinearTermSkeletonSuffix

/-- KL3: linearKernelReady always true (drops fail-closed match).
    Greppable: hostModuleCheckBadKernelLinearReadyText, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearReadyText : String :=
  hostModuleCheckKernelLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  pushNode p0 (mkLinearNode tagLinear)\n" ++
  "def linearKernelReady : Bool := true\n" ++
  "def linearKernelOk : Bool := linearKernelReady && linearMismatchRejected\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool :=\n" ++
  "  (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone\n" ++
  "    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone\n" ++
  "def linearSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelLinearTermSkeletonSuffix

/-- KL4: linearMismatchRejected always true (drops dual mkNode? isNone).
    Greppable: hostModuleCheckBadKernelLinearMismatchText, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearMismatchText : String :=
  hostModuleCheckKernelLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  pushNode p0 (mkLinearNode tagLinear)\n" ++
  "def linearKernelReady : Bool :=\n" ++
  "  match lowerLinearKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && linearHostPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && linearSurfaceOk\n" ++
  "def linearKernelOk : Bool := linearKernelReady && linearMismatchRejected\n" ++
  "def hostKernelLinearId : String := \"HOST-KERNEL-LINEAR\"\n" ++
  "def linearHostPathReady : Bool := true\n" ++
  "def linearMismatchRejected : Bool := true\n" ++
  "def linearSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelLinearTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelLinear twin text for L0 dual-pin. -/
def kernelLinearTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelLinear"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept KL1 when tokens present.
    Greppable: hostModuleCheckBadKernelLinearStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelLinearTermSurfaceFrom
      hostModuleCheckBadKernelLinearStageIdText)
    kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KL2 when tokens present.
    Greppable: hostModuleCheckBadKernelLinearLowerL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearLowerL0Accept : Bool :=
  (checkNamedSurface (kernelLinearTermSurfaceFrom
      hostModuleCheckBadKernelLinearLowerText)
    kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KL3 when tokens present.
    Greppable: hostModuleCheckBadKernelLinearReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearReadyL0Accept : Bool :=
  (checkNamedSurface (kernelLinearTermSurfaceFrom
      hostModuleCheckBadKernelLinearReadyText)
    kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KL4 when tokens present.
    Greppable: hostModuleCheckBadKernelLinearMismatchL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearMismatchL0Accept : Bool :=
  (checkNamedSurface (kernelLinearTermSurfaceFrom
      hostModuleCheckBadKernelLinearMismatchText)
    kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelLinearTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckKernelLinearTermDialectOk : Bool :=
  (checkKernelLinearTermDialect hostModuleCheckGoodKernelLinearTermText).isNone

/-- Dialect rejects KL1.
    Greppable: hostModuleCheckBadKernelLinearStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearStageIdDialectReject : Bool :=
  match checkKernelLinearTermDialect hostModuleCheckBadKernelLinearStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KL2.
    Greppable: hostModuleCheckBadKernelLinearLowerDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearLowerDialectReject : Bool :=
  match checkKernelLinearTermDialect hostModuleCheckBadKernelLinearLowerText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KL3.
    Greppable: hostModuleCheckBadKernelLinearReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearReadyDialectReject : Bool :=
  match checkKernelLinearTermDialect hostModuleCheckBadKernelLinearReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KL4.
    Greppable: hostModuleCheckBadKernelLinearMismatchDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelLinearMismatchDialectReject : Bool :=
  match checkKernelLinearTermDialect hostModuleCheckBadKernelLinearMismatchText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined KernelLinear L2 dual-pin (good + KL1..KL4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelLinearTermSurfaceOk, TERM-SURFACE, KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSurfaceOk : Bool :=
  hostModuleCheckKernelLinearTermSurfaceDualOk
    && (checkDepthKernelLinearTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelLinearTermSurfaceScope == "KernelLinear-only")
    && hostModuleCheckKernelLinearTermDialectOk
    && hostModuleCheckBadKernelLinearStageIdDialectReject
    && hostModuleCheckBadKernelLinearLowerDialectReject
    && hostModuleCheckBadKernelLinearReadyDialectReject
    && hostModuleCheckBadKernelLinearMismatchDialectReject
    && hostModuleCheckBadKernelLinearStageIdL0Accept
    && hostModuleCheckBadKernelLinearLowerL0Accept
    && hostModuleCheckBadKernelLinearReadyL0Accept
    && hostModuleCheckBadKernelLinearMismatchL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelLinearTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckKernelLinearTermSurfaceOk_true :
    hostModuleCheckKernelLinearTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_linear_term_surface_ids_eq :
    checkDepthKernelLinearTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelLinearTermSurfaceScope = "KernelLinear-only"
      && hostModuleCheckKernelLinearTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
