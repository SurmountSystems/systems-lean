/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck Emit/Kernel/Parity L2 term-surface smoke accepts.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel from SystemsLean.HostModuleCheckAcceptsGoods: EmitPlan/Apply/Body
  term twins + Kernel Mult..Emit + Parity Mult..Emit compact smoke folds.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.
  Sub-1-KLOC: do not grow past 1000.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAcceptsGoodsTerm,
  TERM-SURFACE, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckAcceptsGoodsTerm
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAcceptsGoodsTerm;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckEmitApplyTerm
import SystemsLean.HostModuleCheckEmitBodyTerm
import SystemsLean.HostModuleCheckKernelMultTerm
import SystemsLean.HostModuleCheckKernelLinearTerm
import SystemsLean.HostModuleCheckKernelTypesTerm
import SystemsLean.HostModuleCheckKernelProgramTerm
import SystemsLean.HostModuleCheckKernelEmitTerm
import SystemsLean.HostModuleCheckParityMultTerm
import SystemsLean.HostModuleCheckParityLinearTerm
import SystemsLean.HostModuleCheckParityTypesTerm
import SystemsLean.HostModuleCheckParityProgramTerm
import SystemsLean.HostModuleCheckParityEmitTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitPlan L2 term-surface twins (EP1..EP4; full checkRealModule) -/

/-- Good EmitPlan L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodEmitPlanTerm, TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckGoodEmitPlanTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan" hostModuleCheckGoodEmitPlanTermText

/-- EP1 wrong Plan.failClosed body rejects under L2.
    Greppable: hostModuleCheckBadEmitPlanFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckBadEmitPlanFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan"
    hostModuleCheckBadEmitPlanFailClosedText

/-- EP2 wrong isRuntimeMult body rejects under L2.
    Greppable: hostModuleCheckBadEmitPlanIsRuntimeMult, ILL-TYPED-TERM,
    TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckBadEmitPlanIsRuntimeMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan"
    hostModuleCheckBadEmitPlanIsRuntimeMultText

/-- EP3 wrong planFromCompose body rejects under L2.
    Greppable: hostModuleCheckBadEmitPlanFromCompose, ILL-TYPED-TERM,
    TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckBadEmitPlanFromCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan"
    hostModuleCheckBadEmitPlanFromComposeText

/-- EP4 wrong isReady body rejects under L2.
    Greppable: hostModuleCheckBadEmitPlanIsReady, ILL-TYPED-TERM,
    TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckBadEmitPlanIsReady : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan"
    hostModuleCheckBadEmitPlanIsReadyText

/-- Compact full-path smoke (good + EP1..EP4 + SurfaceOk) for Driver Sub-1-KLOC.
    Greppable: hostModuleCheckEmitPlanTermSmokeOk, TERM-SURFACE, EmitPlan-only. -/
def hostModuleCheckEmitPlanTermSmokeOk : Bool :=
  hostModuleCheckGoodEmitPlanTerm.isAccept
    && hostModuleCheckBadEmitPlanFailClosed.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitPlanIsRuntimeMult.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitPlanFromCompose.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitPlanIsReady.isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitPlanTermSurfaceOk

/-! ### EmitApply L2 term-surface twins (EA1..EA4; full checkRealModule) -/

/-- Good EmitApply L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodEmitApplyTerm, TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckGoodEmitApplyTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply" hostModuleCheckGoodEmitApplyTermText

/-- EA1 wrong Apply.failClosed body rejects under L2.
    Greppable: hostModuleCheckBadEmitApplyFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckBadEmitApplyFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply"
    hostModuleCheckBadEmitApplyFailClosedText

/-- EA2 wrong applyCap body rejects under L2.
    Greppable: hostModuleCheckBadEmitApplyCap, ILL-TYPED-TERM,
    TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckBadEmitApplyCap : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply"
    hostModuleCheckBadEmitApplyCapText

/-- EA3 wrong multCode body rejects under L2.
    Greppable: hostModuleCheckBadEmitApplyMultCode, ILL-TYPED-TERM,
    TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckBadEmitApplyMultCode : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply"
    hostModuleCheckBadEmitApplyMultCodeText

/-- EA4 wrong applyFromCompose body rejects under L2.
    Greppable: hostModuleCheckBadEmitApplyFromCompose, ILL-TYPED-TERM,
    TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckBadEmitApplyFromCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply"
    hostModuleCheckBadEmitApplyFromComposeText

/-- Compact full-path smoke (good + EA1..EA4 + SurfaceOk) for Driver Sub-1-KLOC.
    Greppable: hostModuleCheckEmitApplyTermSmokeOk, TERM-SURFACE, EmitApply-only. -/
def hostModuleCheckEmitApplyTermSmokeOk : Bool :=
  hostModuleCheckGoodEmitApplyTerm.isAccept
    && hostModuleCheckBadEmitApplyFailClosed.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitApplyCap.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitApplyMultCode.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitApplyFromCompose.isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitApplyTermSurfaceOk

/-! ### EmitBody L2 term-surface twins (EB1..EB4; full checkRealModule) -/

/-- Good EmitBody L2 term fixture accepts (E-good via checkRealModule).
    Greppable: hostModuleCheckGoodEmitBodyTerm, TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckGoodEmitBodyTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody" hostModuleCheckGoodEmitBodyTermText

/-- EB1 wrong Body.failClosed body rejects under L2.
    Greppable: hostModuleCheckBadEmitBodyFailClosed, ILL-TYPED-TERM,
    TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckBadEmitBodyFailClosed : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody"
    hostModuleCheckBadEmitBodyFailClosedText

/-- EB2 wrong bodyCap body rejects under L2.
    Greppable: hostModuleCheckBadEmitBodyCap, ILL-TYPED-TERM,
    TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckBadEmitBodyCap : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody"
    hostModuleCheckBadEmitBodyCapText

/-- EB3 wrong bodyFromCompose body rejects under L2.
    Greppable: hostModuleCheckBadEmitBodyFromCompose, ILL-TYPED-TERM,
    TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckBadEmitBodyFromCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody"
    hostModuleCheckBadEmitBodyFromComposeText

/-- EB4 wrong bodyIsValid body rejects under L2.
    Greppable: hostModuleCheckBadEmitBodyIsValid, ILL-TYPED-TERM,
    TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckBadEmitBodyIsValid : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody"
    hostModuleCheckBadEmitBodyIsValidText

/-- Compact full-path smoke (good + EB1..EB4 + SurfaceOk) for Driver Sub-1-KLOC.
    Greppable: hostModuleCheckEmitBodyTermSmokeOk, TERM-SURFACE, EmitBody-only. -/
def hostModuleCheckEmitBodyTermSmokeOk : Bool :=
  hostModuleCheckGoodEmitBodyTerm.isAccept
    && hostModuleCheckBadEmitBodyFailClosed.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitBodyCap.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitBodyFromCompose.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadEmitBodyIsValid.isRejectWith reasonIllTypedTerm
    && hostModuleCheckEmitBodyTermSurfaceOk

/-! ### Kernel* L2 term-surface twins (compact inline checkRealModule; Sub-1-KLOC) -/

/-- Compact full-path smoke (good + KM1..KM4 + SurfaceOk).
    Greppable: hostModuleCheckKernelMultTermSmokeOk, hostModuleCheckGoodKernelMultTerm,
    hostModuleCheckBadKernelMultStageId, hostModuleCheckBadKernelMultLower,
    hostModuleCheckBadKernelMultReady, hostModuleCheckBadKernelMultUnknownTag,
    TERM-SURFACE, KernelMult-only. -/
def hostModuleCheckKernelMultTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.KernelMult"
      hostModuleCheckGoodKernelMultTermText).isAccept
    && (checkRealModule "SystemsLean.KernelMult"
      hostModuleCheckBadKernelMultStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelMult"
      hostModuleCheckBadKernelMultLowerText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelMult"
      hostModuleCheckBadKernelMultReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelMult"
      hostModuleCheckBadKernelMultUnknownTagText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelMultTermSurfaceOk

/-- Compact full-path smoke (good + KL1..KL4 + SurfaceOk).
    Greppable: hostModuleCheckKernelLinearTermSmokeOk, hostModuleCheckGoodKernelLinearTerm,
    hostModuleCheckBadKernelLinearStageId, hostModuleCheckBadKernelLinearLower,
    hostModuleCheckBadKernelLinearReady, hostModuleCheckBadKernelLinearMismatch,
    TERM-SURFACE, KernelLinear-only. -/
def hostModuleCheckKernelLinearTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.KernelLinear"
      hostModuleCheckGoodKernelLinearTermText).isAccept
    && (checkRealModule "SystemsLean.KernelLinear"
      hostModuleCheckBadKernelLinearStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelLinear"
      hostModuleCheckBadKernelLinearLowerText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelLinear"
      hostModuleCheckBadKernelLinearReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelLinear"
      hostModuleCheckBadKernelLinearMismatchText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelLinearTermSurfaceOk

/-- Compact full-path smoke (good + KT1..KT4 + SurfaceOk).
    Greppable: hostModuleCheckKernelTypesTermSmokeOk, hostModuleCheckGoodKernelTypesTerm,
    hostModuleCheckBadKernelTypesStageId, hostModuleCheckBadKernelTypesLower,
    hostModuleCheckBadKernelTypesReady, hostModuleCheckBadKernelTypesUnknownKind,
    TERM-SURFACE, KernelTypes-only. -/
def hostModuleCheckKernelTypesTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.KernelTypes"
      hostModuleCheckGoodKernelTypesTermText).isAccept
    && (checkRealModule "SystemsLean.KernelTypes"
      hostModuleCheckBadKernelTypesStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelTypes"
      hostModuleCheckBadKernelTypesLowerText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelTypes"
      hostModuleCheckBadKernelTypesReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelTypes"
      hostModuleCheckBadKernelTypesUnknownKindText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelTypesTermSurfaceOk

/-- Compact full-path smoke (good + KP1..KP4 + SurfaceOk).
    Greppable: hostModuleCheckKernelProgramTermSmokeOk, hostModuleCheckGoodKernelProgramTerm,
    hostModuleCheckBadKernelProgramStageId, hostModuleCheckBadKernelProgramLower,
    hostModuleCheckBadKernelProgramReady, hostModuleCheckBadKernelProgramOk,
    TERM-SURFACE, KernelProgram-only. -/
def hostModuleCheckKernelProgramTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.KernelProgram"
      hostModuleCheckGoodKernelProgramTermText).isAccept
    && (checkRealModule "SystemsLean.KernelProgram"
      hostModuleCheckBadKernelProgramStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelProgram"
      hostModuleCheckBadKernelProgramLowerText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelProgram"
      hostModuleCheckBadKernelProgramReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelProgram"
      hostModuleCheckBadKernelProgramOkText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelProgramTermSurfaceOk

/-- Compact full-path smoke (good + KE1..KE4 + SurfaceOk).
    Greppable: hostModuleCheckKernelEmitTermSmokeOk, hostModuleCheckGoodKernelEmitTerm,
    hostModuleCheckBadKernelEmitStageId, hostModuleCheckBadKernelEmitLower,
    hostModuleCheckBadKernelEmitReady, hostModuleCheckBadKernelEmitOk,
    TERM-SURFACE, KernelEmit-only. -/
def hostModuleCheckKernelEmitTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.KernelEmit"
      hostModuleCheckGoodKernelEmitTermText).isAccept
    && (checkRealModule "SystemsLean.KernelEmit"
      hostModuleCheckBadKernelEmitStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelEmit"
      hostModuleCheckBadKernelEmitLowerText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelEmit"
      hostModuleCheckBadKernelEmitReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.KernelEmit"
      hostModuleCheckBadKernelEmitOkText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckKernelEmitTermSurfaceOk

/-- Fold Emit* + Kernel* L2 smokes so Driver stays Sub-1-KLOC.
    ParityMult L2 smoke lives in LoadOk (Sub-1-KLOC: AcceptsGoods at limit).
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

/-! ### KernelMultTheorems L3 proof-surface twins (full checkRealModule + smoke) -/



/-- Compact full-path smoke (good + PM1..PM4 + SurfaceOk).
    Lives here so AcceptsGoods stays under Sub-1-KLOC growth.
    Greppable: hostModuleCheckParityMultTermSmokeOk, hostModuleCheckGoodParityMultTerm,
    hostModuleCheckBadParityMultStageId, hostModuleCheckBadParityMultReady,
    hostModuleCheckBadParityMultOk, hostModuleCheckBadParityMultGrade,
    TERM-SURFACE, ParityMult-only. -/
def hostModuleCheckParityMultTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.ParityMult"
      hostModuleCheckGoodParityMultTermText).isAccept
    && (checkRealModule "SystemsLean.ParityMult"
      hostModuleCheckBadParityMultStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityMult"
      hostModuleCheckBadParityMultReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityMult"
      hostModuleCheckBadParityMultOkText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityMult"
      hostModuleCheckBadParityMultGradeText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityMultTermSurfaceOk

/-- Compact full-path smoke (good + PL1..PL4 + SurfaceOk).
    Lives here so AcceptsGoods stays under Sub-1-KLOC growth.
    Greppable: hostModuleCheckParityLinearTermSmokeOk, hostModuleCheckGoodParityLinearTerm,
    hostModuleCheckBadParityLinearStageId, hostModuleCheckBadParityLinearReady,
    hostModuleCheckBadParityLinearOk, hostModuleCheckBadParityLinearContract,
    TERM-SURFACE, ParityLinear-only. -/
def hostModuleCheckParityLinearTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.ParityLinear"
      hostModuleCheckGoodParityLinearTermText).isAccept
    && (checkRealModule "SystemsLean.ParityLinear"
      hostModuleCheckBadParityLinearStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityLinear"
      hostModuleCheckBadParityLinearReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityLinear"
      hostModuleCheckBadParityLinearOkText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityLinear"
      hostModuleCheckBadParityLinearContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityLinearTermSurfaceOk

/-- Compact full-path smoke (good + PT1..PT4 + SurfaceOk). Greppable:
    hostModuleCheckParityTypesTermSmokeOk, TERM-SURFACE, ParityTypes-only. -/
def hostModuleCheckParityTypesTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.ParityTypes"
      hostModuleCheckGoodParityTypesTermText).isAccept
    && (checkRealModule "SystemsLean.ParityTypes"
      hostModuleCheckBadParityTypesStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityTypes"
      hostModuleCheckBadParityTypesReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityTypes"
      hostModuleCheckBadParityTypesOkText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityTypes"
      hostModuleCheckBadParityTypesContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityTypesTermSurfaceOk

/-- Compact full-path smoke (good + PP1..PP4 + SurfaceOk). Greppable:
    hostModuleCheckParityProgramTermSmokeOk, TERM-SURFACE, ParityProgram-only. -/
def hostModuleCheckParityProgramTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.ParityProgram"
      hostModuleCheckGoodParityProgramTermText).isAccept
    && (checkRealModule "SystemsLean.ParityProgram"
      hostModuleCheckBadParityProgramStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityProgram"
      hostModuleCheckBadParityProgramReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityProgram"
      hostModuleCheckBadParityProgramOkText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityProgram"
      hostModuleCheckBadParityProgramContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityProgramTermSurfaceOk

/-- Compact full-path smoke (good + PE1..PE4 + SurfaceOk). Greppable:
    hostModuleCheckParityEmitTermSmokeOk, TERM-SURFACE, ParityEmit-only. -/
def hostModuleCheckParityEmitTermSmokeOk : Bool :=
  (checkRealModule "SystemsLean.ParityEmit"
      hostModuleCheckGoodParityEmitTermText).isAccept
    && (checkRealModule "SystemsLean.ParityEmit"
      hostModuleCheckBadParityEmitStageIdText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityEmit"
      hostModuleCheckBadParityEmitReadyText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityEmit"
      hostModuleCheckBadParityEmitOkText).isRejectWith reasonIllTypedTerm
    && (checkRealModule "SystemsLean.ParityEmit"
      hostModuleCheckBadParityEmitContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityEmitTermSurfaceOk


end SystemsLean.HostModuleCheck
