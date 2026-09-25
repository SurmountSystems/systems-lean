/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckKernelEmitTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckKernelEmitTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckKernelEmitTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-EMIT-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckKernelEmitTerm.lean"

/-- Pinned live HostModuleCheckKernelEmitTerm.lean bytes. -/
def liveHostModuleCheckKernelEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelEmit L2 term-surface pilot (C2 after KernelProgram).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_EMIT_V0"; kernelEmitId
    "SELF-HOST-KERNEL-EMIT".
  - lowerEmitCompose fail-closed program compose mark + mint.
  - emitKernelReady fail-closed programKernelReady && plan/apply/body paths
    && emitMultReady && emitSurfaceOk.
  - emitKernelOk = emitKernelReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelEmitTermSurfaceOk (E-good dialect +
    KE1..KE4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelEmit pilot only -- not package elaborate, not KernelEmitTheorems L3,
    not FullHostElaborateRemains re-true.
  - Mult..Extract + EmitPlan + EmitApply + EmitBody + KernelMult + KernelLinear
    + KernelTypes + KernelProgram TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for KernelEmit is KernelEmit-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckKernelEmitTerm,
  TERM-SURFACE, KernelEmit-only, ILL-TYPED-TERM, checkKernelEmitTermDialect,
  hostModuleCheckBadKernelEmitStageIdText,
  hostModuleCheckBadKernelEmitLowerText,
  hostModuleCheckBadKernelEmitReadyText,
  hostModuleCheckBadKernelEmitOkText,
  hostModuleCheckKernelEmitTermDialectOk, KernelEmit term-surface pilot,
  hostModuleCheckKernelEmitTermSurfaceDualOk,
  hostModuleCheckKernelEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelEmitTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelEmit L2 term-surface dual-ok pins (KernelEmit-only) -/

/-- Named term-surface depth bar for KernelEmit L2 pilot honesty.
    Greppable: checkDepthKernelEmitTermSurfaceBar, TERM-SURFACE, KernelEmit-only. -/
def checkDepthKernelEmitTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: KernelEmit.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthKernelEmitTermSurfaceScope, KernelEmit-only, TERM-SURFACE. -/
def checkDepthKernelEmitTermSurfaceScope : String := "KernelEmit-only"

/-- Dual-ok when KernelEmit L2 E-good/E-bad rejects work (KernelEmit pilot only).
    Greppable: hostModuleCheckKernelEmitTermSurfaceDualOk, TERM-SURFACE,
    KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSurfaceDualOk : Bool := true

/-! ### KernelEmit dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_KERNEL_EMIT_V0 string.
    Greppable: kernelEmitStageIdBodyOk, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_EMIT_V0\""

/-- kernelEmitId body is SELF-HOST-KERNEL-EMIT string.
    Greppable: kernelEmitIdBodyOk, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "kernelEmitId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-EMIT\""

/-- lowerEmitCompose fail-closed mark+mint body (collapsed).
    Greppable: kernelEmitLowerBodyOk, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitLowerBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "lowerEmitCompose" with
  | none => false
  | some body =>
    body == "match KernelProgram.lowerProgramCompose with | none => none | some hcRaw => let hcMarked := HostCompose.markErased hcRaw match KernelProgram.mintHost hcMarked KernelProgram.smokeMintId with | none => none | some hc => some hc"

/-- emitKernelReady fail-closed path fold body.
    Greppable: kernelEmitReadyBodyOk, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitKernelReady" with
  | none => false
  | some body =>
    body == "KernelProgram.programKernelReady && emitPlanPathReady && emitApplyPathReady && emitBodyPathReady && EmitMult.emitMultReady && emitSurfaceOk"

/-- emitKernelOk body is emitKernelReady.
    Greppable: kernelEmitKernelOkBodyOk, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitKernelOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitKernelOk" with
  | none => false
  | some body => body == "emitKernelReady"

/-- KernelEmit L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkKernelEmitTermDialect, TERM-SURFACE,
    KernelEmit term-surface pilot. -/
def checkKernelEmitTermDialect (content : String) : Option String :=
  if !kernelEmitStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelEmitIdBodyOk content then some reasonIllTypedTerm
  else if !kernelEmitLowerBodyOk content then some reasonIllTypedTerm
  else if !kernelEmitReadyBodyOk content then some reasonIllTypedTerm
  else if !kernelEmitKernelOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply KernelEmit L2 after a structural KernelEmit accept.
    Greppable: refineKernelEmitWithTermSurface, TERM-SURFACE, KernelEmit-only. -/
def refineKernelEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelEmit L2 well-typed good fixture (E-good) -/

/-- Shared KernelEmit skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckKernelEmitTermSkeletonPrefix, TERM-SURFACE,
    KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSkeletonPrefix : String :=
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelEmit\n"

/-- Shared KernelEmit skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckKernelEmitTermSkeletonSuffix, TERM-SURFACE,
    KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSkeletonSuffix : String :=
  "end SystemsLean.KernelEmit\n"

/-- Shared good-path mid bodies for stage/id/lower/ready/ok + L0 tokens.
    Greppable: hostModuleCheckKernelEmitTermGoodMid, TERM-SURFACE, KernelEmit-only. -/
def hostModuleCheckKernelEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def lowerEmitCompose : Option Nat :=\n" ++
  "  match KernelProgram.lowerProgramCompose with\n" ++
  "  | none => none\n" ++
  "  | some hcRaw =>\n" ++
  "    let hcMarked := HostCompose.markErased hcRaw\n" ++
  "    match KernelProgram.mintHost hcMarked KernelProgram.smokeMintId with\n" ++
  "    | none => none\n" ++
  "    | some hc => some hc\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "def emitSurfaceOk : Bool := true\n" ++
  "def emitKernelReady : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && emitPlanPathReady\n" ++
  "    && emitApplyPathReady\n" ++
  "    && emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && emitSurfaceOk\n" ++
  "def emitKernelOk : Bool := emitKernelReady\n" ++
  "def productEmitPlanId : String := \"EMIT_PLAN_V0\"\n" ++
  "def productEmitBodyId : String := \"EMIT_BODY_V0\"\n"

/-- Well-typed KernelEmit L2 good text.
    Greppable: hostModuleCheckGoodKernelEmitTermText, TERM-SURFACE, KernelEmit-only. -/
def hostModuleCheckGoodKernelEmitTermText : String :=
  hostModuleCheckKernelEmitTermSkeletonPrefix
    ++ hostModuleCheckKernelEmitTermGoodMid
    ++ hostModuleCheckKernelEmitTermSkeletonSuffix

/-! ### Ill-typed KernelEmit twins (L0 tokens present; L2 must reject). -/

/-- KE1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadKernelEmitStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitStageIdText : String :=
  hostModuleCheckKernelEmitTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def lowerEmitCompose : Option Nat :=\n" ++
  "  match KernelProgram.lowerProgramCompose with\n" ++
  "  | none => none\n" ++
  "  | some hcRaw =>\n" ++
  "    let hcMarked := HostCompose.markErased hcRaw\n" ++
  "    match KernelProgram.mintHost hcMarked KernelProgram.smokeMintId with\n" ++
  "    | none => none\n" ++
  "    | some hc => some hc\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "def emitSurfaceOk : Bool := true\n" ++
  "def emitKernelReady : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && emitPlanPathReady\n" ++
  "    && emitApplyPathReady\n" ++
  "    && emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && emitSurfaceOk\n" ++
  "def emitKernelOk : Bool := emitKernelReady\n" ++
  "def productEmitPlanId : String := \"EMIT_PLAN_V0\"\n" ++
  "def productEmitBodyId : String := \"EMIT_BODY_V0\"\n" ++
  hostModuleCheckKernelEmitTermSkeletonSuffix

/-- KE2: lowerEmitCompose always some 0 (drops fail-closed mark+mint).
    Greppable: hostModuleCheckBadKernelEmitLowerText, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitLowerText : String :=
  hostModuleCheckKernelEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def lowerEmitCompose : Option Nat := some 0\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "def emitSurfaceOk : Bool := true\n" ++
  "def emitKernelReady : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && emitPlanPathReady\n" ++
  "    && emitApplyPathReady\n" ++
  "    && emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && emitSurfaceOk\n" ++
  "def emitKernelOk : Bool := emitKernelReady\n" ++
  "def productEmitPlanId : String := \"EMIT_PLAN_V0\"\n" ++
  "def productEmitBodyId : String := \"EMIT_BODY_V0\"\n" ++
  hostModuleCheckKernelEmitTermSkeletonSuffix

/-- KE3: emitKernelReady always true (drops fail-closed path fold).
    Greppable: hostModuleCheckBadKernelEmitReadyText, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitReadyText : String :=
  hostModuleCheckKernelEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def lowerEmitCompose : Option Nat :=\n" ++
  "  match KernelProgram.lowerProgramCompose with\n" ++
  "  | none => none\n" ++
  "  | some hcRaw =>\n" ++
  "    let hcMarked := HostCompose.markErased hcRaw\n" ++
  "    match KernelProgram.mintHost hcMarked KernelProgram.smokeMintId with\n" ++
  "    | none => none\n" ++
  "    | some hc => some hc\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "def emitSurfaceOk : Bool := true\n" ++
  "def emitKernelReady : Bool := true\n" ++
  "def emitKernelOk : Bool := emitKernelReady\n" ++
  "def productEmitPlanId : String := \"EMIT_PLAN_V0\"\n" ++
  "def productEmitBodyId : String := \"EMIT_BODY_V0\"\n" ++
  hostModuleCheckKernelEmitTermSkeletonSuffix

/-- KE4: emitKernelOk always true (drops = emitKernelReady fold).
    Greppable: hostModuleCheckBadKernelEmitOkText, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitOkText : String :=
  hostModuleCheckKernelEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def lowerEmitCompose : Option Nat :=\n" ++
  "  match KernelProgram.lowerProgramCompose with\n" ++
  "  | none => none\n" ++
  "  | some hcRaw =>\n" ++
  "    let hcMarked := HostCompose.markErased hcRaw\n" ++
  "    match KernelProgram.mintHost hcMarked KernelProgram.smokeMintId with\n" ++
  "    | none => none\n" ++
  "    | some hc => some hc\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "def emitSurfaceOk : Bool := true\n" ++
  "def emitKernelReady : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && emitPlanPathReady\n" ++
  "    && emitApplyPathReady\n" ++
  "    && emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && emitSurfaceOk\n" ++
  "def emitKernelOk : Bool := true\n" ++
  "def productEmitPlanId : String := \"EMIT_PLAN_V0\"\n" ++
  "def productEmitBodyId : String := \"EMIT_BODY_V0\"\n" ++
  hostModuleCheckKernelEmitTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelEmit twin text for L0 dual-pin. -/
def kernelEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept KE1 when tokens present.
    Greppable: hostModuleCheckBadKernelEmitStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelEmitTermSurfaceFrom
      hostModuleCheckBadKernelEmitStageIdText)
    kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept KE2 when tokens present.
    Greppable: hostModuleCheckBadKernelEmitLowerL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitLowerL0Accept : Bool :=
  (checkNamedSurface (kernelEmitTermSurfaceFrom
      hostModuleCheckBadKernelEmitLowerText)
    kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept KE3 when tokens present.
    Greppable: hostModuleCheckBadKernelEmitReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitReadyL0Accept : Bool :=
  (checkNamedSurface (kernelEmitTermSurfaceFrom
      hostModuleCheckBadKernelEmitReadyText)
    kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept KE4 when tokens present.
    Greppable: hostModuleCheckBadKernelEmitOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitOkL0Accept : Bool :=
  (checkNamedSurface (kernelEmitTermSurfaceFrom
      hostModuleCheckBadKernelEmitOkText)
    kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelEmitTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckKernelEmitTermDialectOk : Bool :=
  (checkKernelEmitTermDialect hostModuleCheckGoodKernelEmitTermText).isNone

/-- Dialect rejects KE1.
    Greppable: hostModuleCheckBadKernelEmitStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitStageIdDialectReject : Bool :=
  match checkKernelEmitTermDialect hostModuleCheckBadKernelEmitStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KE2.
    Greppable: hostModuleCheckBadKernelEmitLowerDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitLowerDialectReject : Bool :=
  match checkKernelEmitTermDialect hostModuleCheckBadKernelEmitLowerText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KE3.
    Greppable: hostModuleCheckBadKernelEmitReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitReadyDialectReject : Bool :=
  match checkKernelEmitTermDialect hostModuleCheckBadKernelEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects KE4.
    Greppable: hostModuleCheckBadKernelEmitOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadKernelEmitOkDialectReject : Bool :=
  match checkKernelEmitTermDialect hostModuleCheckBadKernelEmitOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined KernelEmit L2 dual-pin (good + KE1..KE4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelEmitTermSurfaceOk, TERM-SURFACE, KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSurfaceOk : Bool :=
  hostModuleCheckKernelEmitTermSurfaceDualOk
    && (checkDepthKernelEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelEmitTermSurfaceScope == "KernelEmit-only")
    && hostModuleCheckKernelEmitTermDialectOk
    && hostModuleCheckBadKernelEmitStageIdDialectReject
    && hostModuleCheckBadKernelEmitLowerDialectReject
    && hostModuleCheckBadKernelEmitReadyDialectReject
    && hostModuleCheckBadKernelEmitOkDialectReject
    && hostModuleCheckBadKernelEmitStageIdL0Accept
    && hostModuleCheckBadKernelEmitLowerL0Accept
    && hostModuleCheckBadKernelEmitReadyL0Accept
    && hostModuleCheckBadKernelEmitOkL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelEmitTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckKernelEmitTermSurfaceOk_true :
    hostModuleCheckKernelEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_emit_term_surface_ids_eq :
    checkDepthKernelEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelEmitTermSurfaceScope = "KernelEmit-only"
      && hostModuleCheckKernelEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckKernelEmitTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckKernelEmitTermSourceReady : Bool :=
  liveRel == "HostModuleCheckKernelEmitTerm.lean"
    && kernelCheckLiveHostModuleCheckKernelEmitTermSource liveHostModuleCheckKernelEmitTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckKernelEmitTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckKernelEmitTerm.lean")
  let k := kernelCheckLiveHostModuleCheckKernelEmitTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckKernelEmitTerm parse false")
  unless hostFrontLiveHostModuleCheckKernelEmitTermSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource
