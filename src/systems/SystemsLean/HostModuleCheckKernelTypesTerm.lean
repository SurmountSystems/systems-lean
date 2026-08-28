/-
  SYSTEMS_LEAN_HOST partial -- KernelTypes L2 term-surface pilot (C2 after KernelLinear).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelTypes dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelTypes L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_TYPES_V0"; kernelTypesId
    "SELF-HOST-KERNEL-TYPES".
  - lowerTypesKernel fail-closed three-node lower (erased/linear/value).
  - typesKernelReady match lowerTypesKernel with none false / some path fold.
  - unknownKindRejected !Types.isValidKindTag 3; typesKernelOk = typesKernelReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelTypesTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelTypesTermSurfaceOk (E-good dialect +
    KT1..KT4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelTypes pilot only -- not package elaborate, not KernelTypesTheorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply + EmitBody + KernelMult + KernelLinear
    TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for KernelTypes is KernelTypes-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckKernelTypesTerm,
  TERM-SURFACE, KernelTypes-only, ILL-TYPED-TERM, checkKernelTypesTermDialect,
  hostModuleCheckBadKernelTypesStageIdText,
  hostModuleCheckBadKernelTypesLowerText,
  hostModuleCheckBadKernelTypesReadyText,
  hostModuleCheckBadKernelTypesUnknownKindText,
  hostModuleCheckKernelTypesTermDialectOk, KernelTypes term-surface pilot,
  hostModuleCheckKernelTypesTermSurfaceDualOk,
  hostModuleCheckKernelTypesTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelTypesTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelTypesTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelTypes L2 term-surface dual-ok pins (KernelTypes-only) -/

/-- Named term-surface depth bar for KernelTypes L2 pilot honesty.
    Greppable: checkDepthKernelTypesTermSurfaceBar, TERM-SURFACE, KernelTypes-only. -/
def checkDepthKernelTypesTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: KernelTypes.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthKernelTypesTermSurfaceScope, KernelTypes-only, TERM-SURFACE. -/
def checkDepthKernelTypesTermSurfaceScope : String := "KernelTypes-only"

/-- Dual-ok when KernelTypes L2 E-good/E-bad rejects work (KernelTypes pilot only).
    Greppable: hostModuleCheckKernelTypesTermSurfaceDualOk, TERM-SURFACE,
    KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSurfaceDualOk : Bool := true

/-! ### KernelTypes dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_KERNEL_TYPES_V0 string.
    Greppable: kernelTypesStageIdBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_TYPES_V0\""

/-- kernelTypesId body is SELF-HOST-KERNEL-TYPES string.
    Greppable: kernelTypesIdBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelTypesId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-TYPES\""

/-- lowerTypesKernel fail-closed three-node lower body (collapsed).
    Greppable: kernelTypesLowerBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesLowerBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "lowerTypesKernel" with
  | none => false
  | some body =>
    body == "let p0 : Program := IrProgram.empty let n0 := mkTypedNode tagErased Mult.mult0 NodeKind.erased let n1 := mkTypedNode tagLinear Mult.mult1 NodeKind.linear let n2 := mkTypedNode tagValue Mult.multOmega NodeKind.value match pushNode p0 n0 with | none => none | some p1 => match pushNode p1 n1 with | none => none | some p2 => pushNode p2 n2"

/-- typesKernelReady match lower fail-closed body.
    Greppable: kernelTypesReadyBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesKernelReady" with
  | none => false
  | some body =>
    body == "match lowerTypesKernel with | none => false | some p => programCompileReady p && typesProgramPathReady && gradeSurfaceOk && typesSurfaceOk && unknownKindRejected && kindMultMismatchRejected"

/-- unknownKindRejected body is !Types.isValidKindTag 3.
    Greppable: kernelTypesUnknownKindBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesUnknownKindBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "unknownKindRejected" with
  | none => false
  | some body => body == "!Types.isValidKindTag 3"

/-- typesKernelOk body is typesKernelReady.
    Greppable: kernelTypesKernelOkBodyOk, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesKernelOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesKernelOk" with
  | none => false
  | some body => body == "typesKernelReady"

/-- KernelTypes L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkKernelTypesTermDialect, TERM-SURFACE,
    KernelTypes term-surface pilot. -/
def checkKernelTypesTermDialect (content : String) : Option String :=
  if !kernelTypesStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelTypesIdBodyOk content then some reasonIllTypedTerm
  else if !kernelTypesLowerBodyOk content then some reasonIllTypedTerm
  else if !kernelTypesReadyBodyOk content then some reasonIllTypedTerm
  else if !kernelTypesUnknownKindBodyOk content then some reasonIllTypedTerm
  else if !kernelTypesKernelOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply KernelTypes L2 after a structural KernelTypes accept.
    Greppable: refineKernelTypesWithTermSurface, TERM-SURFACE, KernelTypes-only. -/
def refineKernelTypesWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelTypesTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelTypes L2 well-typed good fixture (E-good) -/

/-- Shared KernelTypes skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckKernelTypesTermSkeletonPrefix, TERM-SURFACE,
    KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelTypes\n"

/-- Shared KernelTypes skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckKernelTypesTermSkeletonSuffix, TERM-SURFACE,
    KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSkeletonSuffix : String :=
  "end SystemsLean.KernelTypes\n"

/-- Shared good-path mid bodies for stage/id/lower/ready/unknown/ok + L0 tokens.
    Greppable: hostModuleCheckKernelTypesTermGoodMid, TERM-SURFACE, KernelTypes-only. -/
def hostModuleCheckKernelTypesTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkTypedNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkTypedNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkTypedNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def typesKernelReady : Bool :=\n" ++
  "  match lowerTypesKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && typesProgramPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && typesSurfaceOk\n" ++
  "        && unknownKindRejected\n" ++
  "        && kindMultMismatchRejected\n" ++
  "def typesKernelOk : Bool := typesKernelReady\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := !Types.isValidKindTag 3\n" ++
  "def typesSurfaceOk : Bool := true\n"

/-- Well-typed KernelTypes L2 good text.
    Greppable: hostModuleCheckGoodKernelTypesTermText, TERM-SURFACE, KernelTypes-only. -/
def hostModuleCheckGoodKernelTypesTermText : String :=
  hostModuleCheckKernelTypesTermSkeletonPrefix
    ++ hostModuleCheckKernelTypesTermGoodMid
    ++ hostModuleCheckKernelTypesTermSkeletonSuffix

/-! ### Ill-typed KernelTypes twins (L0 tokens present; L2 must reject). -/

/-- KT1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadKernelTypesStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesStageIdText : String :=
  hostModuleCheckKernelTypesTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkTypedNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkTypedNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkTypedNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def typesKernelReady : Bool :=\n" ++
  "  match lowerTypesKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && typesProgramPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && typesSurfaceOk\n" ++
  "        && unknownKindRejected\n" ++
  "        && kindMultMismatchRejected\n" ++
  "def typesKernelOk : Bool := typesKernelReady\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := !Types.isValidKindTag 3\n" ++
  "def typesSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelTypesTermSkeletonSuffix

/-- KT2: lowerTypesKernel always some 0 (drops fail-closed three-node lower).
    Greppable: hostModuleCheckBadKernelTypesLowerText, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesLowerText : String :=
  hostModuleCheckKernelTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat := some 0\n" ++
  "def typesKernelReady : Bool :=\n" ++
  "  match lowerTypesKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && typesProgramPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && typesSurfaceOk\n" ++
  "        && unknownKindRejected\n" ++
  "        && kindMultMismatchRejected\n" ++
  "def typesKernelOk : Bool := typesKernelReady\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := !Types.isValidKindTag 3\n" ++
  "def typesSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelTypesTermSkeletonSuffix

/-- KT3: typesKernelReady always true (drops fail-closed match).
    Greppable: hostModuleCheckBadKernelTypesReadyText, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesReadyText : String :=
  hostModuleCheckKernelTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkTypedNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkTypedNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkTypedNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def typesKernelReady : Bool := true\n" ++
  "def typesKernelOk : Bool := typesKernelReady\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := !Types.isValidKindTag 3\n" ++
  "def typesSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelTypesTermSkeletonSuffix

/-- KT4: unknownKindRejected always true (drops !Types.isValidKindTag 3).
    Greppable: hostModuleCheckBadKernelTypesUnknownKindText, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesUnknownKindText : String :=
  hostModuleCheckKernelTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkTypedNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkTypedNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkTypedNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def typesKernelReady : Bool :=\n" ++
  "  match lowerTypesKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && typesProgramPathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && typesSurfaceOk\n" ++
  "        && unknownKindRejected\n" ++
  "        && kindMultMismatchRejected\n" ++
  "def typesKernelOk : Bool := typesKernelReady\n" ++
  "def hostKernelTypesId : String := \"HOST-KERNEL-TYPES\"\n" ++
  "def typesProgramPathReady : Bool := true\n" ++
  "def unknownKindRejected : Bool := true\n" ++
  "def typesSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelTypesTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelTypes twin text for L0 dual-pin. -/
def kernelTypesTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelTypes"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept KT1 when tokens present.
    Greppable: hostModuleCheckBadKernelTypesStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelTypesTermSurfaceFrom
      hostModuleCheckBadKernelTypesStageIdText)
    kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KT2 when tokens present.
    Greppable: hostModuleCheckBadKernelTypesLowerL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesLowerL0Accept : Bool :=
  (checkNamedSurface (kernelTypesTermSurfaceFrom
      hostModuleCheckBadKernelTypesLowerText)
    kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KT3 when tokens present.
    Greppable: hostModuleCheckBadKernelTypesReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesReadyL0Accept : Bool :=
  (checkNamedSurface (kernelTypesTermSurfaceFrom
      hostModuleCheckBadKernelTypesReadyText)
    kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KT4 when tokens present.
    Greppable: hostModuleCheckBadKernelTypesUnknownKindL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesUnknownKindL0Accept : Bool :=
  (checkNamedSurface (kernelTypesTermSurfaceFrom
      hostModuleCheckBadKernelTypesUnknownKindText)
    kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelTypesTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckKernelTypesTermDialectOk : Bool :=
  (checkKernelTypesTermDialect hostModuleCheckGoodKernelTypesTermText).isNone

/-- Dialect rejects KT1.
    Greppable: hostModuleCheckBadKernelTypesStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesStageIdDialectReject : Bool :=
  match checkKernelTypesTermDialect hostModuleCheckBadKernelTypesStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KT2.
    Greppable: hostModuleCheckBadKernelTypesLowerDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesLowerDialectReject : Bool :=
  match checkKernelTypesTermDialect hostModuleCheckBadKernelTypesLowerText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KT3.
    Greppable: hostModuleCheckBadKernelTypesReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesReadyDialectReject : Bool :=
  match checkKernelTypesTermDialect hostModuleCheckBadKernelTypesReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KT4.
    Greppable: hostModuleCheckBadKernelTypesUnknownKindDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelTypesUnknownKindDialectReject : Bool :=
  match checkKernelTypesTermDialect hostModuleCheckBadKernelTypesUnknownKindText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined KernelTypes L2 dual-pin (good + KT1..KT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelTypesTermSurfaceOk, TERM-SURFACE, KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSurfaceOk : Bool :=
  hostModuleCheckKernelTypesTermSurfaceDualOk
    && (checkDepthKernelTypesTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelTypesTermSurfaceScope == "KernelTypes-only")
    && hostModuleCheckKernelTypesTermDialectOk
    && hostModuleCheckBadKernelTypesStageIdDialectReject
    && hostModuleCheckBadKernelTypesLowerDialectReject
    && hostModuleCheckBadKernelTypesReadyDialectReject
    && hostModuleCheckBadKernelTypesUnknownKindDialectReject
    && hostModuleCheckBadKernelTypesStageIdL0Accept
    && hostModuleCheckBadKernelTypesLowerL0Accept
    && hostModuleCheckBadKernelTypesReadyL0Accept
    && hostModuleCheckBadKernelTypesUnknownKindL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelTypesTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckKernelTypesTermSurfaceOk_true :
    hostModuleCheckKernelTypesTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_types_term_surface_ids_eq :
    checkDepthKernelTypesTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelTypesTermSurfaceScope = "KernelTypes-only"
      && hostModuleCheckKernelTypesTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
