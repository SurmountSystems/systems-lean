/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckKernelProgramTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckKernelProgramTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckKernelProgramTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckKernelProgramTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKKERNELPROGRAMTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm

/-- Dual-pinned live HostModuleCheckKernelProgramTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckKernelProgramTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKKERNELPROGRAMTERM. -/
def liveHostModuleCheckKernelProgramTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelProgram L2 term-surface pilot (C2 after KernelTypes).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelProgram dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelProgram L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0"; kernelProgramId
    "SELF-HOST-KERNEL-PROGRAM".
  - lowerProgramKernel fail-closed three-node lower (erased/linear/value).
  - programKernelReady match lowerProgramKernel with none false / some path fold.
  - programKernelOk = programKernelReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelProgramTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelProgramTermSurfaceOk (E-good dialect +
    KP1..KP4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelProgram pilot only -- not package elaborate, not KernelProgramTheorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply + EmitBody + KernelMult + KernelLinear
    + KernelTypes TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for KernelProgram is KernelProgram-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckKernelProgramTerm,
  TERM-SURFACE, KernelProgram-only, ILL-TYPED-TERM, checkKernelProgramTermDialect,
  hostModuleCheckBadKernelProgramStageIdText,
  hostModuleCheckBadKernelProgramLowerText,
  hostModuleCheckBadKernelProgramReadyText,
  hostModuleCheckBadKernelProgramOkText,
  hostModuleCheckKernelProgramTermDialectOk, KernelProgram term-surface pilot,
  hostModuleCheckKernelProgramTermSurfaceDualOk,
  hostModuleCheckKernelProgramTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelProgramTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelProgramTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelProgram L2 term-surface dual-ok pins (KernelProgram-only) -/

/-- Named term-surface depth bar for KernelProgram L2 pilot honesty.
    Greppable: checkDepthKernelProgramTermSurfaceBar, TERM-SURFACE, KernelProgram-only. -/
def checkDepthKernelProgramTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: KernelProgram.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthKernelProgramTermSurfaceScope, KernelProgram-only, TERM-SURFACE. -/
def checkDepthKernelProgramTermSurfaceScope : String := "KernelProgram-only"

/-- Dual-ok when KernelProgram L2 E-good/E-bad rejects work (KernelProgram pilot only).
    Greppable: hostModuleCheckKernelProgramTermSurfaceDualOk, TERM-SURFACE,
    KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSurfaceDualOk : Bool := true

/-! ### KernelProgram dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_KERNEL_PROGRAM_V0 string.
    Greppable: kernelProgramStageIdBodyOk, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\""

/-- kernelProgramId body is SELF-HOST-KERNEL-PROGRAM string.
    Greppable: kernelProgramIdBodyOk, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelProgramId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-PROGRAM\""

/-- lowerProgramKernel fail-closed three-node lower body (collapsed).
    Greppable: kernelProgramLowerBodyOk, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramLowerBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "lowerProgramKernel" with
  | none => false
  | some body =>
    body == "let p0 : Program := IrProgram.empty let n0 := mkProgramNode tagErased Mult.mult0 NodeKind.erased let n1 := mkProgramNode tagLinear Mult.mult1 NodeKind.linear let n2 := mkProgramNode tagValue Mult.multOmega NodeKind.value match pushNode p0 n0 with | none => none | some p1 => match pushNode p1 n1 with | none => none | some p2 => pushNode p2 n2"

/-- programKernelReady match lower fail-closed body.
    Greppable: kernelProgramReadyBodyOk, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programKernelReady" with
  | none => false
  | some body =>
    body == "match lowerProgramKernel with | none => false | some p => programCompileReady p && programPathReady && programGraphPathReady && programComposePathReady && gradeSurfaceOk && programSurfaceOk"

/-- programKernelOk body is programKernelReady.
    Greppable: kernelProgramKernelOkBodyOk, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramKernelOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programKernelOk" with
  | none => false
  | some body => body == "programKernelReady"

/-- KernelProgram L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkKernelProgramTermDialect, TERM-SURFACE,
    KernelProgram term-surface pilot. -/
def checkKernelProgramTermDialect (content : String) : Option String :=
  if !kernelProgramStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelProgramIdBodyOk content then some reasonIllTypedTerm
  else if !kernelProgramLowerBodyOk content then some reasonIllTypedTerm
  else if !kernelProgramReadyBodyOk content then some reasonIllTypedTerm
  else if !kernelProgramKernelOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply KernelProgram L2 after a structural KernelProgram accept.
    Greppable: refineKernelProgramWithTermSurface, TERM-SURFACE, KernelProgram-only. -/
def refineKernelProgramWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelProgramTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelProgram L2 well-typed good fixture (E-good) -/

/-- Shared KernelProgram skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckKernelProgramTermSkeletonPrefix, TERM-SURFACE,
    KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelProgram\n"

/-- Shared KernelProgram skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckKernelProgramTermSkeletonSuffix, TERM-SURFACE,
    KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSkeletonSuffix : String :=
  "end SystemsLean.KernelProgram\n"

/-- Shared good-path mid bodies for stage/id/lower/ready/ok + L0 tokens.
    Greppable: hostModuleCheckKernelProgramTermGoodMid, TERM-SURFACE, KernelProgram-only. -/
def hostModuleCheckKernelProgramTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkProgramNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkProgramNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkProgramNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def programKernelReady : Bool :=\n" ++
  "  match lowerProgramKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && programPathReady\n" ++
  "        && programGraphPathReady\n" ++
  "        && programComposePathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && programSurfaceOk\n" ++
  "def programKernelOk : Bool := programKernelReady\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "def programSurfaceOk : Bool := true\n"

/-- Well-typed KernelProgram L2 good text.
    Greppable: hostModuleCheckGoodKernelProgramTermText, TERM-SURFACE, KernelProgram-only. -/
def hostModuleCheckGoodKernelProgramTermText : String :=
  hostModuleCheckKernelProgramTermSkeletonPrefix
    ++ hostModuleCheckKernelProgramTermGoodMid
    ++ hostModuleCheckKernelProgramTermSkeletonSuffix

/-! ### Ill-typed KernelProgram twins (L0 tokens present; L2 must reject). -/

/-- KP1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadKernelProgramStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramStageIdText : String :=
  hostModuleCheckKernelProgramTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkProgramNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkProgramNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkProgramNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def programKernelReady : Bool :=\n" ++
  "  match lowerProgramKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && programPathReady\n" ++
  "        && programGraphPathReady\n" ++
  "        && programComposePathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && programSurfaceOk\n" ++
  "def programKernelOk : Bool := programKernelReady\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "def programSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelProgramTermSkeletonSuffix

/-- KP2: lowerProgramKernel always some 0 (drops fail-closed three-node lower).
    Greppable: hostModuleCheckBadKernelProgramLowerText, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramLowerText : String :=
  hostModuleCheckKernelProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat := some 0\n" ++
  "def programKernelReady : Bool :=\n" ++
  "  match lowerProgramKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && programPathReady\n" ++
  "        && programGraphPathReady\n" ++
  "        && programComposePathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && programSurfaceOk\n" ++
  "def programKernelOk : Bool := programKernelReady\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "def programSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelProgramTermSkeletonSuffix

/-- KP3: programKernelReady always true (drops fail-closed match).
    Greppable: hostModuleCheckBadKernelProgramReadyText, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramReadyText : String :=
  hostModuleCheckKernelProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkProgramNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkProgramNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkProgramNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def programKernelReady : Bool := true\n" ++
  "def programKernelOk : Bool := programKernelReady\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "def programSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelProgramTermSkeletonSuffix

/-- KP4: programKernelOk always true (drops = programKernelReady fold).
    Greppable: hostModuleCheckBadKernelProgramOkText, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramOkText : String :=
  hostModuleCheckKernelProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat :=\n" ++
  "  let p0 : Program := IrProgram.empty\n" ++
  "  let n0 := mkProgramNode tagErased Mult.mult0 NodeKind.erased\n" ++
  "  let n1 := mkProgramNode tagLinear Mult.mult1 NodeKind.linear\n" ++
  "  let n2 := mkProgramNode tagValue Mult.multOmega NodeKind.value\n" ++
  "  match pushNode p0 n0 with\n" ++
  "  | none => none\n" ++
  "  | some p1 =>\n" ++
  "    match pushNode p1 n1 with\n" ++
  "    | none => none\n" ++
  "    | some p2 => pushNode p2 n2\n" ++
  "def programKernelReady : Bool :=\n" ++
  "  match lowerProgramKernel with\n" ++
  "  | none => false\n" ++
  "  | some p =>\n" ++
  "      programCompileReady p\n" ++
  "        && programPathReady\n" ++
  "        && programGraphPathReady\n" ++
  "        && programComposePathReady\n" ++
  "        && gradeSurfaceOk\n" ++
  "        && programSurfaceOk\n" ++
  "def programKernelOk : Bool := true\n" ++
  "def hostKernelProgramId : String := \"HOST-KERNEL-PROGRAM\"\n" ++
  "def programPathReady : Bool := true\n" ++
  "def programGraphPathReady : Bool := true\n" ++
  "def programComposePathReady : Bool := true\n" ++
  "def programSurfaceOk : Bool := true\n" ++
  hostModuleCheckKernelProgramTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelProgram twin text for L0 dual-pin. -/
def kernelProgramTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelProgram"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept KP1 when tokens present.
    Greppable: hostModuleCheckBadKernelProgramStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelProgramTermSurfaceFrom
      hostModuleCheckBadKernelProgramStageIdText)
    kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KP2 when tokens present.
    Greppable: hostModuleCheckBadKernelProgramLowerL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramLowerL0Accept : Bool :=
  (checkNamedSurface (kernelProgramTermSurfaceFrom
      hostModuleCheckBadKernelProgramLowerText)
    kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KP3 when tokens present.
    Greppable: hostModuleCheckBadKernelProgramReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramReadyL0Accept : Bool :=
  (checkNamedSurface (kernelProgramTermSurfaceFrom
      hostModuleCheckBadKernelProgramReadyText)
    kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- L0/L1 still accept KP4 when tokens present.
    Greppable: hostModuleCheckBadKernelProgramOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramOkL0Accept : Bool :=
  (checkNamedSurface (kernelProgramTermSurfaceFrom
      hostModuleCheckBadKernelProgramOkText)
    kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelProgramTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckKernelProgramTermDialectOk : Bool :=
  (checkKernelProgramTermDialect hostModuleCheckGoodKernelProgramTermText).isNone

/-- Dialect rejects KP1.
    Greppable: hostModuleCheckBadKernelProgramStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramStageIdDialectReject : Bool :=
  match checkKernelProgramTermDialect hostModuleCheckBadKernelProgramStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KP2.
    Greppable: hostModuleCheckBadKernelProgramLowerDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramLowerDialectReject : Bool :=
  match checkKernelProgramTermDialect hostModuleCheckBadKernelProgramLowerText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KP3.
    Greppable: hostModuleCheckBadKernelProgramReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramReadyDialectReject : Bool :=
  match checkKernelProgramTermDialect hostModuleCheckBadKernelProgramReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KP4.
    Greppable: hostModuleCheckBadKernelProgramOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelProgramOkDialectReject : Bool :=
  match checkKernelProgramTermDialect hostModuleCheckBadKernelProgramOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined KernelProgram L2 dual-pin (good + KP1..KP4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelProgramTermSurfaceOk, TERM-SURFACE, KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSurfaceOk : Bool :=
  hostModuleCheckKernelProgramTermSurfaceDualOk
    && (checkDepthKernelProgramTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelProgramTermSurfaceScope == "KernelProgram-only")
    && hostModuleCheckKernelProgramTermDialectOk
    && hostModuleCheckBadKernelProgramStageIdDialectReject
    && hostModuleCheckBadKernelProgramLowerDialectReject
    && hostModuleCheckBadKernelProgramReadyDialectReject
    && hostModuleCheckBadKernelProgramOkDialectReject
    && hostModuleCheckBadKernelProgramStageIdL0Accept
    && hostModuleCheckBadKernelProgramLowerL0Accept
    && hostModuleCheckBadKernelProgramReadyL0Accept
    && hostModuleCheckBadKernelProgramOkL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelProgramTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckKernelProgramTermSurfaceOk_true :
    hostModuleCheckKernelProgramTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_program_term_surface_ids_eq :
    checkDepthKernelProgramTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelProgramTermSurfaceScope = "KernelProgram-only"
      && hostModuleCheckKernelProgramTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTerm
