/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckKernelMultTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelMultTermSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-KERNELMULTTERM, liveKernelMultTermSource,
  HOST-FRONT-LIVE-KERNELMULTTERM, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveKernelMultTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelMultTerm

/-- Dual-pinned live HostModuleCheckKernelMultTerm.lean bytes (must match on-disk file).
    Greppable: liveKernelMultTermSource, PARSE-LIVE-KERNELMULTTERM. -/
def liveKernelMultTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelMult L2 term-surface pilot (C2a after EmitBody).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelMult dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelMult L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_MULT_V0"; kernelMultId "SELF-HOST-KERNEL-MULT".
  - lowerMultKernel fail-closed three-node lower (empty + mkGradeNode grades + pushNode).
  - multKernelReady match lowerMultKernel with none false / some programCompileReady.
  - unknownTagRejected body !Mult.isValidTag 3; kernelOk ready && surface && reject.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelMultTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelMultTermSurfaceOk (E-good dialect +
    KM1..KM4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelMult pilot only -- not package elaborate, not KernelMultTheorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply + EmitBody TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for KernelMult is KernelMult-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckKernelMultTerm,
  TERM-SURFACE, KernelMult-only, ILL-TYPED-TERM, checkKernelMultTermDialect,
  hostModuleCheckBadKernelMultStageIdText,
  hostModuleCheckBadKernelMultLowerText,
  hostModuleCheckBadKernelMultReadyText,
  hostModuleCheckBadKernelMultUnknownTagText,
  hostModuleCheckKernelMultTermDialectOk, KernelMult term-surface pilot,
  hostModuleCheckKernelMultTermSurfaceDualOk,
  hostModuleCheckKernelMultTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelMultTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelMultTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelMult L2 term-surface dual-ok pins (KernelMult-only) -/

/-- Named term-surface depth bar for KernelMult L2 pilot honesty.
    Greppable: checkDepthKernelMultTermSurfaceBar, TERM-SURFACE, KernelMult-only. -/
def checkDepthKernelMultTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: KernelMult.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthKernelMultTermSurfaceScope, KernelMult-only, TERM-SURFACE. -/
def checkDepthKernelMultTermSurfaceScope : String := "KernelMult-only"

/-- Dual-ok when KernelMult L2 E-good/E-bad rejects work (KernelMult pilot only).
    Greppable: hostModuleCheckKernelMultTermSurfaceDualOk, TERM-SURFACE,
    KernelMult-only. -/
def hostModuleCheckKernelMultTermSurfaceDualOk : Bool := true

/-! ### KernelMult dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_KERNEL_MULT_V0 string.
    Greppable: kernelMultStageIdBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_MULT_V0\""

/-- kernelMultId body is SELF-HOST-KERNEL-MULT string.
    Greppable: kernelMultIdBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelMultId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-MULT\""

/-- lowerMultKernel fail-closed three-node lower body (collapsed).
    Greppable: kernelMultLowerBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultLowerBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "lowerMultKernel" with
  | none => false
  | some body =>
    body == "let p0 : Program := IrProgram.empty let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value match pushNode p0 n0 with | none => none | some p1 => match pushNode p1 n1 with | none => none | some p2 => pushNode p2 n2"

/-- multKernelReady match lower fail-closed body.
    Greppable: kernelMultReadyBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multKernelReady" with
  | none => false
  | some body =>
    body == "match lowerMultKernel with | none => false | some p => programCompileReady p && gradeSurfaceOk"

/-- unknownTagRejected body is !Mult.isValidTag 3.
    Greppable: kernelMultUnknownTagBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultUnknownTagBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "unknownTagRejected" with
  | none => false
  | some body => body == "!Mult.isValidTag 3"

/-- kernelOk body is multKernelReady && kernelSurfaceOk && unknownTagRejected.
    Greppable: kernelMultKernelOkBodyOk, TERM-SURFACE, KernelMult-only. -/
def kernelMultKernelOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelOk" with
  | none => false
  | some body =>
    body == "multKernelReady && kernelSurfaceOk && unknownTagRejected"

/-- KernelMult L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkKernelMultTermDialect, TERM-SURFACE,
    KernelMult term-surface pilot. -/
def checkKernelMultTermDialect (content : String) : Option String :=
  if !kernelMultStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelMultIdBodyOk content then some reasonIllTypedTerm
  else if !kernelMultLowerBodyOk content then some reasonIllTypedTerm
  else if !kernelMultReadyBodyOk content then some reasonIllTypedTerm
  else if !kernelMultUnknownTagBodyOk content then some reasonIllTypedTerm
  else if !kernelMultKernelOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply KernelMult L2 after a structural KernelMult accept.
    Greppable: refineKernelMultWithTermSurface, TERM-SURFACE, KernelMult-only. -/
def refineKernelMultWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelMultTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelMult L2 well-typed good fixture (E-good) -/

/-- Shared KernelMult skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckKernelMultTermSkeletonPrefix, TERM-SURFACE,
    KernelMult-only. -/
def hostModuleCheckKernelMultTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelMult\n"

/-- Shared KernelMult skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckKernelMultTermSkeletonSuffix, TERM-SURFACE,
    KernelMult-only. -/
def hostModuleCheckKernelMultTermSkeletonSuffix : String :=
  "end SystemsLean.KernelMult\n"

/-- Shared good-path mid bodies for stage/id/lower/ready/unknown/ok + L0 tokens.
    Greppable: hostModuleCheckKernelMultTermGoodMid, TERM-SURFACE, KernelMult-only. -/
def hostModuleCheckKernelMultTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def multKernelReady : Bool :=\n" ++
  "  match lowerMultKernel with\n" ++
  "  | none => false\n" ++
  "  | some p => programCompileReady p && gradeSurfaceOk\n" ++
  "def unknownTagRejected : Bool := !Mult.isValidTag 3\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- Well-typed KernelMult L2 good text.
    Greppable: hostModuleCheckGoodKernelMultTermText, TERM-SURFACE, KernelMult-only. -/
def hostModuleCheckGoodKernelMultTermText : String :=
  hostModuleCheckKernelMultTermSkeletonPrefix
    ++ hostModuleCheckKernelMultTermGoodMid
    ++ hostModuleCheckKernelMultTermSkeletonSuffix

/-! ### Ill-typed KernelMult twins (L0 tokens present; L2 must reject). -/

/-- KM1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadKernelMultStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultStageIdText : String :=
  hostModuleCheckKernelMultTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def multKernelReady : Bool :=\n" ++
  "  match lowerMultKernel with\n" ++
  "  | none => false\n" ++
  "  | some p => programCompileReady p && gradeSurfaceOk\n" ++
  "def unknownTagRejected : Bool := !Mult.isValidTag 3\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  hostModuleCheckKernelMultTermSkeletonSuffix

/-- KM2: lowerMultKernel always some 0 (drops fail-closed three-node lower).
    Greppable: hostModuleCheckBadKernelMultLowerText, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultLowerText : String :=
  hostModuleCheckKernelMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat := some 0\n" ++
  "def multKernelReady : Bool :=\n" ++
  "  match lowerMultKernel with\n" ++
  "  | none => false\n" ++
  "  | some p => programCompileReady p && gradeSurfaceOk\n" ++
  "def unknownTagRejected : Bool := !Mult.isValidTag 3\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  hostModuleCheckKernelMultTermSkeletonSuffix

/-- KM3: multKernelReady always true (drops fail-closed match).
    Greppable: hostModuleCheckBadKernelMultReadyText, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultReadyText : String :=
  hostModuleCheckKernelMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def multKernelReady : Bool := true\n" ++
  "def unknownTagRejected : Bool := !Mult.isValidTag 3\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  hostModuleCheckKernelMultTermSkeletonSuffix

/-- KM4: unknownTagRejected always true (drops !Mult.isValidTag 3).
    Greppable: hostModuleCheckBadKernelMultUnknownTagText, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultUnknownTagText : String :=
  hostModuleCheckKernelMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def multKernelReady : Bool :=\n" ++
  "  match lowerMultKernel with\n" ++
  "  | none => false\n" ++
  "  | some p => programCompileReady p && gradeSurfaceOk\n" ++
  "def unknownTagRejected : Bool := true\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def kernelOk : Bool := multKernelReady && kernelSurfaceOk && unknownTagRejected\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  hostModuleCheckKernelMultTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelMult twin text for L0 dual-pin. -/
def kernelMultTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelMult"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept KM1 when tokens present.
    Greppable: hostModuleCheckBadKernelMultStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelMultTermSurfaceFrom
      hostModuleCheckBadKernelMultStageIdText)
    kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KM2 when tokens present.
    Greppable: hostModuleCheckBadKernelMultLowerL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultLowerL0Accept : Bool :=
  (checkNamedSurface (kernelMultTermSurfaceFrom
      hostModuleCheckBadKernelMultLowerText)
    kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KM3 when tokens present.
    Greppable: hostModuleCheckBadKernelMultReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultReadyL0Accept : Bool :=
  (checkNamedSurface (kernelMultTermSurfaceFrom
      hostModuleCheckBadKernelMultReadyText)
    kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KM4 when tokens present.
    Greppable: hostModuleCheckBadKernelMultUnknownTagL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultUnknownTagL0Accept : Bool :=
  (checkNamedSurface (kernelMultTermSurfaceFrom
      hostModuleCheckBadKernelMultUnknownTagText)
    kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelMultTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckKernelMultTermDialectOk : Bool :=
  (checkKernelMultTermDialect hostModuleCheckGoodKernelMultTermText).isNone

/-- Dialect rejects KM1.
    Greppable: hostModuleCheckBadKernelMultStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultStageIdDialectReject : Bool :=
  match checkKernelMultTermDialect hostModuleCheckBadKernelMultStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KM2.
    Greppable: hostModuleCheckBadKernelMultLowerDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultLowerDialectReject : Bool :=
  match checkKernelMultTermDialect hostModuleCheckBadKernelMultLowerText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KM3.
    Greppable: hostModuleCheckBadKernelMultReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultReadyDialectReject : Bool :=
  match checkKernelMultTermDialect hostModuleCheckBadKernelMultReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KM4.
    Greppable: hostModuleCheckBadKernelMultUnknownTagDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelMultUnknownTagDialectReject : Bool :=
  match checkKernelMultTermDialect hostModuleCheckBadKernelMultUnknownTagText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined KernelMult L2 dual-pin (good + KM1..KM4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelMultTermSurfaceOk, TERM-SURFACE, KernelMult-only. -/
def hostModuleCheckKernelMultTermSurfaceOk : Bool :=
  hostModuleCheckKernelMultTermSurfaceDualOk
    && (checkDepthKernelMultTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelMultTermSurfaceScope == "KernelMult-only")
    && hostModuleCheckKernelMultTermDialectOk
    && hostModuleCheckBadKernelMultStageIdDialectReject
    && hostModuleCheckBadKernelMultLowerDialectReject
    && hostModuleCheckBadKernelMultReadyDialectReject
    && hostModuleCheckBadKernelMultUnknownTagDialectReject
    && hostModuleCheckBadKernelMultStageIdL0Accept
    && hostModuleCheckBadKernelMultLowerL0Accept
    && hostModuleCheckBadKernelMultReadyL0Accept
    && hostModuleCheckBadKernelMultUnknownTagL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelMultTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckKernelMultTermSurfaceOk_true :
    hostModuleCheckKernelMultTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_mult_term_surface_ids_eq :
    checkDepthKernelMultTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelMultTermSurfaceScope = "KernelMult-only"
      && hostModuleCheckKernelMultTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveKernelMultTerm
