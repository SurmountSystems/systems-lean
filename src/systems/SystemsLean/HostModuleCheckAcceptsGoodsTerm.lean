/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck Emit/Kernel L2 term-surface smoke.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel from SystemsLean.HostModuleCheckAcceptsGoods: EmitPlan/Apply/Body
  and Kernel Mult..Emit compact smokes. RealModule-free: checkNamedSurface plus
  unit refine, same shape as LoadOkLaterTerm. Occupancy-useful (no RealModule
  import). Occupancy names stay 49; this file is not a named occupancy member.
  Parity Mult..Emit TermSmokeOk live in HostModuleCheckLoadOkLaterTerm.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.
  Sub-1-KLOC: do not grow past 1000.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAcceptsGoodsTerm,
  TERM-SURFACE, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite),
  checkNamedSurface, emitPlanTermSmokeResult, emitApplyTermSmokeResult,
  emitBodyTermSmokeResult, kernelMultTermSmokeResult, kernelLinearTermSmokeResult,
  kernelTypesTermSmokeResult, kernelProgramTermSmokeResult, kernelEmitTermSmokeResult,
  hostModuleCheckEmitKernelTermSmokeAllOk, hostModuleCheckGoodEmitPlanTerm,
  RealModule-free.
  Module: SystemsLean.HostModuleCheckAcceptsGoodsTerm
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAcceptsGoodsTerm;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckEmitApplyTerm
import SystemsLean.HostModuleCheckEmitBodyTerm
import SystemsLean.HostModuleCheckKernelMultTerm
import SystemsLean.HostModuleCheckKernelLinearTerm
import SystemsLean.HostModuleCheckKernelTypesTerm
import SystemsLean.HostModuleCheckKernelProgramTerm
import SystemsLean.HostModuleCheckKernelEmitTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitPlan L2 term-surface smoke (EP1..EP4; no checkRealModule) -/

/-- Structural then EmitPlan L2 refine (no checkRealModule).
    Greppable: emitPlanTermSmokeResult, TERM-SURFACE, EmitPlan-only. -/
def emitPlanTermSmokeResult (content : String) : ModuleCheckResult :=
  refineEmitPlanWithTermSurface
    (checkNamedSurface (emitPlanTermSurfaceFrom content)
      emitPlanExpectedNamespace emitPlanRequiredDecls
      (some "SystemsLean.EmitPlanScaffold"))
    content

/-- Compact full-path smoke (good + EP1..EP4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckEmitPlanTermSmokeOk, hostModuleCheckGoodEmitPlanTerm,
    TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSmokeOk : Bool :=
  (emitPlanTermSmokeResult
      hostModuleCheckGoodEmitPlanTermText).isAccept
    && (emitPlanTermSmokeResult
      hostModuleCheckBadEmitPlanFailClosedText).isRejectWith reasonIllTypedTerm
    && (emitPlanTermSmokeResult
      hostModuleCheckBadEmitPlanIsRuntimeMultText).isRejectWith reasonIllTypedTerm
    && (emitPlanTermSmokeResult
      hostModuleCheckBadEmitPlanFromComposeText).isRejectWith reasonIllTypedTerm
    && (emitPlanTermSmokeResult
      hostModuleCheckBadEmitPlanIsReadyText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitPlanTermSurfaceOk

/-! ### EmitApply L2 term-surface smoke (EA1..EA4; no checkRealModule) -/

/-- Structural then EmitApply L2 refine (no checkRealModule).
    Greppable: emitApplyTermSmokeResult, TERM-SURFACE, EmitApply-only. -/
def emitApplyTermSmokeResult (content : String) : ModuleCheckResult :=
  refineEmitApplyWithTermSurface
    (checkNamedSurface (emitApplyTermSurfaceFrom content)
      emitApplyExpectedNamespace emitApplyRequiredDecls
      (some "SystemsLean.EmitApplyScaffold"))
    content

/-- Compact full-path smoke (good + EA1..EA4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckEmitApplyTermSmokeOk, hostModuleCheckGoodEmitApplyTerm,
    TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckEmitApplyTermSmokeOk : Bool :=
  (emitApplyTermSmokeResult
      hostModuleCheckGoodEmitApplyTermText).isAccept
    && (emitApplyTermSmokeResult
      hostModuleCheckBadEmitApplyFailClosedText).isRejectWith reasonIllTypedTerm
    && (emitApplyTermSmokeResult
      hostModuleCheckBadEmitApplyCapText).isRejectWith reasonIllTypedTerm
    && (emitApplyTermSmokeResult
      hostModuleCheckBadEmitApplyMultCodeText).isRejectWith reasonIllTypedTerm
    && (emitApplyTermSmokeResult
      hostModuleCheckBadEmitApplyFromComposeText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitApplyTermSurfaceOk

/-! ### EmitBody L2 term-surface smoke (EB1..EB4; no checkRealModule) -/

/-- Structural then EmitBody L2 refine (no checkRealModule).
    Greppable: emitBodyTermSmokeResult, TERM-SURFACE, EmitBody-only. -/
def emitBodyTermSmokeResult (content : String) : ModuleCheckResult :=
  refineEmitBodyWithTermSurface
    (checkNamedSurface (emitBodyTermSurfaceFrom content)
      emitBodyExpectedNamespace emitBodyRequiredDecls
      (some "SystemsLean.EmitPlan"))
    content

/-- Compact full-path smoke (good + EB1..EB4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckEmitBodyTermSmokeOk, hostModuleCheckGoodEmitBodyTerm,
    TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckEmitBodyTermSmokeOk : Bool :=
  (emitBodyTermSmokeResult
      hostModuleCheckGoodEmitBodyTermText).isAccept
    && (emitBodyTermSmokeResult
      hostModuleCheckBadEmitBodyFailClosedText).isRejectWith reasonIllTypedTerm
    && (emitBodyTermSmokeResult
      hostModuleCheckBadEmitBodyCapText).isRejectWith reasonIllTypedTerm
    && (emitBodyTermSmokeResult
      hostModuleCheckBadEmitBodyFromComposeText).isRejectWith reasonIllTypedTerm
    && (emitBodyTermSmokeResult
      hostModuleCheckBadEmitBodyIsValidText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitBodyTermSurfaceOk

/-! ### Kernel* L2 term-surface smoke (compact Result helper; Sub-1-KLOC) -/

/-- Structural then KernelMult L2 refine (no checkRealModule).
    Greppable: kernelMultTermSmokeResult, TERM-SURFACE, KernelMult-only. -/
def kernelMultTermSmokeResult (content : String) : ModuleCheckResult :=
  refineKernelMultWithTermSurface
    (checkNamedSurface (kernelMultTermSurfaceFrom content)
      kernelMultExpectedNamespace kernelMultRequiredDecls
      (some "SystemsLean.CompilePath"))
    content

/-- Compact full-path smoke (good + KM1..KM4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckKernelMultTermSmokeOk, hostModuleCheckGoodKernelMultTerm,
    hostModuleCheckBadKernelMultStageId, hostModuleCheckBadKernelMultLower,
    hostModuleCheckBadKernelMultReady, hostModuleCheckBadKernelMultUnknownTag,
    TERM-SURFACE, KernelMult-only. -/
def hostModuleCheckKernelMultTermSmokeOk : Bool :=
  (kernelMultTermSmokeResult
      hostModuleCheckGoodKernelMultTermText).isAccept
    && (kernelMultTermSmokeResult
      hostModuleCheckBadKernelMultStageIdText).isRejectWith reasonIllTypedTerm
    && (kernelMultTermSmokeResult
      hostModuleCheckBadKernelMultLowerText).isRejectWith reasonIllTypedTerm
    && (kernelMultTermSmokeResult
      hostModuleCheckBadKernelMultReadyText).isRejectWith reasonIllTypedTerm
    && (kernelMultTermSmokeResult
      hostModuleCheckBadKernelMultUnknownTagText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelMultTermSurfaceOk

/-- Structural then KernelLinear L2 refine (no checkRealModule).
    Greppable: kernelLinearTermSmokeResult, TERM-SURFACE, KernelLinear-only. -/
def kernelLinearTermSmokeResult (content : String) : ModuleCheckResult :=
  refineKernelLinearWithTermSurface
    (checkNamedSurface (kernelLinearTermSurfaceFrom content)
      kernelLinearExpectedNamespace kernelLinearRequiredDecls
      (some "SystemsLean.CompilePath"))
    content

/-- Compact full-path smoke (good + KL1..KL4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckKernelLinearTermSmokeOk, hostModuleCheckGoodKernelLinearTerm,
    hostModuleCheckBadKernelLinearStageId, hostModuleCheckBadKernelLinearLower,
    hostModuleCheckBadKernelLinearReady, hostModuleCheckBadKernelLinearMismatch,
    TERM-SURFACE, KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSmokeOk : Bool :=
  (kernelLinearTermSmokeResult
      hostModuleCheckGoodKernelLinearTermText).isAccept
    && (kernelLinearTermSmokeResult
      hostModuleCheckBadKernelLinearStageIdText).isRejectWith reasonIllTypedTerm
    && (kernelLinearTermSmokeResult
      hostModuleCheckBadKernelLinearLowerText).isRejectWith reasonIllTypedTerm
    && (kernelLinearTermSmokeResult
      hostModuleCheckBadKernelLinearReadyText).isRejectWith reasonIllTypedTerm
    && (kernelLinearTermSmokeResult
      hostModuleCheckBadKernelLinearMismatchText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelLinearTermSurfaceOk

/-- Structural then KernelTypes L2 refine (no checkRealModule).
    Greppable: kernelTypesTermSmokeResult, TERM-SURFACE, KernelTypes-only. -/
def kernelTypesTermSmokeResult (content : String) : ModuleCheckResult :=
  refineKernelTypesWithTermSurface
    (checkNamedSurface (kernelTypesTermSurfaceFrom content)
      kernelTypesExpectedNamespace kernelTypesRequiredDecls
      (some "SystemsLean.CompilePath"))
    content

/-- Compact full-path smoke (good + KT1..KT4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckKernelTypesTermSmokeOk, hostModuleCheckGoodKernelTypesTerm,
    hostModuleCheckBadKernelTypesStageId, hostModuleCheckBadKernelTypesLower,
    hostModuleCheckBadKernelTypesReady, hostModuleCheckBadKernelTypesUnknownKind,
    TERM-SURFACE, KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSmokeOk : Bool :=
  (kernelTypesTermSmokeResult
      hostModuleCheckGoodKernelTypesTermText).isAccept
    && (kernelTypesTermSmokeResult
      hostModuleCheckBadKernelTypesStageIdText).isRejectWith reasonIllTypedTerm
    && (kernelTypesTermSmokeResult
      hostModuleCheckBadKernelTypesLowerText).isRejectWith reasonIllTypedTerm
    && (kernelTypesTermSmokeResult
      hostModuleCheckBadKernelTypesReadyText).isRejectWith reasonIllTypedTerm
    && (kernelTypesTermSmokeResult
      hostModuleCheckBadKernelTypesUnknownKindText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelTypesTermSurfaceOk

/-- Structural then KernelProgram L2 refine (no checkRealModule).
    Greppable: kernelProgramTermSmokeResult, TERM-SURFACE, KernelProgram-only. -/
def kernelProgramTermSmokeResult (content : String) : ModuleCheckResult :=
  refineKernelProgramWithTermSurface
    (checkNamedSurface (kernelProgramTermSurfaceFrom content)
      kernelProgramExpectedNamespace kernelProgramRequiredDecls
      (some "SystemsLean.CompilePath"))
    content

/-- Compact full-path smoke (good + KP1..KP4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckKernelProgramTermSmokeOk, hostModuleCheckGoodKernelProgramTerm,
    hostModuleCheckBadKernelProgramStageId, hostModuleCheckBadKernelProgramLower,
    hostModuleCheckBadKernelProgramReady, hostModuleCheckBadKernelProgramOk,
    TERM-SURFACE, KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSmokeOk : Bool :=
  (kernelProgramTermSmokeResult
      hostModuleCheckGoodKernelProgramTermText).isAccept
    && (kernelProgramTermSmokeResult
      hostModuleCheckBadKernelProgramStageIdText).isRejectWith reasonIllTypedTerm
    && (kernelProgramTermSmokeResult
      hostModuleCheckBadKernelProgramLowerText).isRejectWith reasonIllTypedTerm
    && (kernelProgramTermSmokeResult
      hostModuleCheckBadKernelProgramReadyText).isRejectWith reasonIllTypedTerm
    && (kernelProgramTermSmokeResult
      hostModuleCheckBadKernelProgramOkText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelProgramTermSurfaceOk

/-- Structural then KernelEmit L2 refine (no checkRealModule).
    Greppable: kernelEmitTermSmokeResult, TERM-SURFACE, KernelEmit-only. -/
def kernelEmitTermSmokeResult (content : String) : ModuleCheckResult :=
  refineKernelEmitWithTermSurface
    (checkNamedSurface (kernelEmitTermSurfaceFrom content)
      kernelEmitExpectedNamespace kernelEmitRequiredDecls
      (some "SystemsLean.KernelProgram"))
    content

/-- Compact full-path smoke (good + KE1..KE4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckKernelEmitTermSmokeOk, hostModuleCheckGoodKernelEmitTerm,
    hostModuleCheckBadKernelEmitStageId, hostModuleCheckBadKernelEmitLower,
    hostModuleCheckBadKernelEmitReady, hostModuleCheckBadKernelEmitOk,
    TERM-SURFACE, KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSmokeOk : Bool :=
  (kernelEmitTermSmokeResult
      hostModuleCheckGoodKernelEmitTermText).isAccept
    && (kernelEmitTermSmokeResult
      hostModuleCheckBadKernelEmitStageIdText).isRejectWith reasonIllTypedTerm
    && (kernelEmitTermSmokeResult
      hostModuleCheckBadKernelEmitLowerText).isRejectWith reasonIllTypedTerm
    && (kernelEmitTermSmokeResult
      hostModuleCheckBadKernelEmitReadyText).isRejectWith reasonIllTypedTerm
    && (kernelEmitTermSmokeResult
      hostModuleCheckBadKernelEmitOkText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelEmitTermSurfaceOk

/-- Fold Emit* + Kernel* L2 smokes so Driver stays Sub-1-KLOC.
    ParityMult L2 smoke lives in LoadOkLaterTerm.
    Greppable: hostModuleCheckEmitKernelTermSmokeAllOk, TERM-SURFACE. -/
def hostModuleCheckEmitKernelTermSmokeAllOk : Bool :=
  hostModuleCheckEmitPlanTermSmokeOk
    && hostModuleCheckEmitApplyTermSmokeOk
    && hostModuleCheckEmitBodyTermSmokeOk
    && hostModuleCheckKernelMultTermSmokeOk
    && hostModuleCheckKernelLinearTermSmokeOk
    && hostModuleCheckKernelTypesTermSmokeOk
    && hostModuleCheckKernelProgramTermSmokeOk
    && hostModuleCheckKernelEmitTermSmokeOk

/-!
  Parity Mult..Emit TermSmokeOk live in HostModuleCheckLoadOkLaterTerm
  (RealModule-free checkNamedSurface plus unit refine). Do not restore
  those five defs here. This module does not import RealModule.
-/

end SystemsLean.HostModuleCheck
