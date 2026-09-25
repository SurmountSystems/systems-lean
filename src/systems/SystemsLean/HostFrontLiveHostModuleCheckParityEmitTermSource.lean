/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckParityEmitTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckParityEmitTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckParityEmitTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PARITY-EMIT-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckParityEmitTerm.lean"

/-- Pinned live HostModuleCheckParityEmitTerm.lean bytes. -/
def liveHostModuleCheckParityEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ParityEmit L2 term-surface pilot (fifth post-
  Kernel named host unit TERM-SURFACE after ParityMult + ParityLinear +
  ParityTypes + ParityProgram).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ParityEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ParityEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PARITY_EMIT_V0".
  - hostParityEmitId body "HOST-PARITY-EMIT".
  - selfHostParityEmitId body "SELF-HOST-PARITY-EMIT".
  - emitContractParityOk fail-closed compose KernelEmit.emitKernelReady &&
    KernelEmit.emitPlanPathReady && KernelEmit.emitApplyPathReady &&
    KernelEmit.emitBodyPathReady && EmitMult.emitMultReady &&
    ParityProgram.programParityReady && productApiSurfaceOk.
  - emitParityReady fail-closed compose emitContractParityOk &&
    paritySurfaceOk.
  - emitParityOk definitional alias emitParityReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckParityEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckParityEmitTermSurfaceOk (E-good dialect +
    PE1..PE4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - ParityEmit pilot only -- not package elaborate, not ParityEmitTheorems
    L3, not FullHostElaborateRemains re-true, not package-env rewrite same slice.
  - Mult..Extract + Emit* + Kernel* + ParityMult + ParityLinear + ParityTypes +
    ParityProgram TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for ParityEmit is ParityEmit-only when E-bad
    rejects land.
  - Package-env ParityEmit band is a separate residual (W1); not this module.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckParityEmitTerm,
  TERM-SURFACE, ParityEmit-only, ILL-TYPED-TERM, checkParityEmitTermDialect,
  hostModuleCheckBadParityEmitStageIdText,
  hostModuleCheckBadParityEmitReadyText,
  hostModuleCheckBadParityEmitOkText,
  hostModuleCheckBadParityEmitContractText,
  hostModuleCheckParityEmitTermDialectOk, ParityEmit term-surface pilot,
  hostModuleCheckParityEmitTermSurfaceDualOk,
  hostModuleCheckParityEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckParityEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckParityEmitTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ParityEmit L2 term-surface dual-ok pins (ParityEmit-only) -/

/-- Named term-surface depth bar for ParityEmit L2 pilot honesty.
    Greppable: checkDepthParityEmitTermSurfaceBar, TERM-SURFACE,
    ParityEmit-only. -/
def checkDepthParityEmitTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: ParityEmit.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthParityEmitTermSurfaceScope, ParityEmit-only,
    TERM-SURFACE. -/
def checkDepthParityEmitTermSurfaceScope : String := "ParityEmit-only"

/-- Dual-ok when ParityEmit L2 E-good/E-bad rejects work (ParityEmit pilot).
    Greppable: hostModuleCheckParityEmitTermSurfaceDualOk, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermSurfaceDualOk : Bool := true

/-! ### ParityEmit dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_PARITY_EMIT_V0 string.
    Greppable: parityEmitStageIdBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PARITY_EMIT_V0\""

/-- hostParityEmitId body is HOST-PARITY-EMIT string.
    Greppable: parityEmitHostIdBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostParityEmitId" with
  | none => false
  | some body => body == "\"HOST-PARITY-EMIT\""

/-- selfHostParityEmitId body is SELF-HOST-PARITY-EMIT string.
    Greppable: parityEmitSelfHostIdBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostParityEmitId" with
  | none => false
  | some body => body == "\"SELF-HOST-PARITY-EMIT\""

/-- emitContractParityOk fail-closed Kernel+EmitMult+Program+API compose (collapsed).
    Greppable: parityEmitContractBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitContractBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitContractParityOk" with
  | none => false
  | some body =>
    body == "KernelEmit.emitKernelReady && KernelEmit.emitPlanPathReady && KernelEmit.emitApplyPathReady && KernelEmit.emitBodyPathReady && EmitMult.emitMultReady && ParityProgram.programParityReady && productApiSurfaceOk"

/-- emitParityReady fail-closed contract+surface compose (collapsed).
    Greppable: parityEmitReadyBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitParityReady" with
  | none => false
  | some body => body == "emitContractParityOk && paritySurfaceOk"

/-- emitParityOk is definitional alias of emitParityReady.
    Greppable: parityEmitOkBodyOk, TERM-SURFACE, ParityEmit-only. -/
def parityEmitOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitParityOk" with
  | none => false
  | some body => body == "emitParityReady"

/-- ParityEmit L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkParityEmitTermDialect, TERM-SURFACE,
    ParityEmit term-surface pilot. -/
def checkParityEmitTermDialect (content : String) : Option String :=
  if !parityEmitStageIdBodyOk content then some reasonIllTypedTerm
  else if !parityEmitHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityEmitSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityEmitContractBodyOk content then some reasonIllTypedTerm
  else if !parityEmitReadyBodyOk content then some reasonIllTypedTerm
  else if !parityEmitOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply ParityEmit L2 after a structural ParityEmit accept.
    Greppable: refineParityEmitWithTermSurface, TERM-SURFACE,
    ParityEmit-only. -/
def refineParityEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkParityEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### ParityEmit L2 well-typed good fixture (E-good) -/

/-- Shared ParityEmit skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckParityEmitTermSkeletonPrefix, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermSkeletonPrefix : String :=
  "import SystemsLean.KernelEmit\n" ++
  "import SystemsLean.ParityProgram\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.ParityEmit\n"

/-- Shared ParityEmit skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckParityEmitTermSkeletonSuffix, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermSkeletonSuffix : String :=
  "end SystemsLean.ParityEmit\n"

/-- Shared good-path mid bodies for stage/ids/ready/ok/contract + L0 tokens.
    Greppable: hostModuleCheckParityEmitTermGoodMid, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def emitContractParityOk : Bool :=\n" ++
  "  KernelEmit.emitKernelReady\n" ++
  "    && KernelEmit.emitPlanPathReady\n" ++
  "    && KernelEmit.emitApplyPathReady\n" ++
  "    && KernelEmit.emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && ParityProgram.programParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def emitParityReady : Bool :=\n" ++
  "  emitContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramEmitParityReady : Bool :=\n" ++
  "  ParityProgram.multLinearTypesProgramParityReady && emitParityReady\n" ++
  "def emitParityOk : Bool := emitParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n"

/-- Well-typed ParityEmit L2 good text.
    Greppable: hostModuleCheckGoodParityEmitTermText, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckGoodParityEmitTermText : String :=
  hostModuleCheckParityEmitTermSkeletonPrefix
    ++ hostModuleCheckParityEmitTermGoodMid
    ++ hostModuleCheckParityEmitTermSkeletonSuffix

/-! ### Ill-typed ParityEmit twins (L0 tokens present; L2 must reject). -/

/-- PE1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadParityEmitStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitStageIdText : String :=
  hostModuleCheckParityEmitTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def emitContractParityOk : Bool :=\n" ++
  "  KernelEmit.emitKernelReady\n" ++
  "    && KernelEmit.emitPlanPathReady\n" ++
  "    && KernelEmit.emitApplyPathReady\n" ++
  "    && KernelEmit.emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && ParityProgram.programParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def emitParityReady : Bool :=\n" ++
  "  emitContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramEmitParityReady : Bool :=\n" ++
  "  ParityProgram.multLinearTypesProgramParityReady && emitParityReady\n" ++
  "def emitParityOk : Bool := emitParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityEmitTermSkeletonSuffix

/-- PE2: emitParityReady always true (drops fail-closed contract+surface).
    Greppable: hostModuleCheckBadParityEmitReadyText, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitReadyText : String :=
  hostModuleCheckParityEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def emitContractParityOk : Bool :=\n" ++
  "  KernelEmit.emitKernelReady\n" ++
  "    && KernelEmit.emitPlanPathReady\n" ++
  "    && KernelEmit.emitApplyPathReady\n" ++
  "    && KernelEmit.emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && ParityProgram.programParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def emitParityReady : Bool := true\n" ++
  "def multLinearTypesProgramEmitParityReady : Bool :=\n" ++
  "  ParityProgram.multLinearTypesProgramParityReady && emitParityReady\n" ++
  "def emitParityOk : Bool := emitParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityEmitTermSkeletonSuffix

/-- PE3: emitParityOk always true (drops definitional alias of ready).
    Greppable: hostModuleCheckBadParityEmitOkText, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitOkText : String :=
  hostModuleCheckParityEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def emitContractParityOk : Bool :=\n" ++
  "  KernelEmit.emitKernelReady\n" ++
  "    && KernelEmit.emitPlanPathReady\n" ++
  "    && KernelEmit.emitApplyPathReady\n" ++
  "    && KernelEmit.emitBodyPathReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && ParityProgram.programParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def emitParityReady : Bool :=\n" ++
  "  emitContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramEmitParityReady : Bool :=\n" ++
  "  ParityProgram.multLinearTypesProgramParityReady && emitParityReady\n" ++
  "def emitParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityEmitTermSkeletonSuffix

/-- PE4: emitContractParityOk always true (drops Kernel+EmitMult+Program+API compose).
    Greppable: hostModuleCheckBadParityEmitContractText, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitContractText : String :=
  hostModuleCheckParityEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def emitContractParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def emitParityReady : Bool :=\n" ++
  "  emitContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramEmitParityReady : Bool :=\n" ++
  "  ParityProgram.multLinearTypesProgramParityReady && emitParityReady\n" ++
  "def emitParityOk : Bool := emitParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityEmitTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from ParityEmit twin text for L0 dual-pin. -/
def parityEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ParityEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PE1 when tokens present.
    Greppable: hostModuleCheckBadParityEmitStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitStageIdL0Accept : Bool :=
  (checkNamedSurface (parityEmitTermSurfaceFrom
      hostModuleCheckBadParityEmitStageIdText)
    parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- L0/L1 still accept PE2 when tokens present.
    Greppable: hostModuleCheckBadParityEmitReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitReadyL0Accept : Bool :=
  (checkNamedSurface (parityEmitTermSurfaceFrom
      hostModuleCheckBadParityEmitReadyText)
    parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- L0/L1 still accept PE3 when tokens present.
    Greppable: hostModuleCheckBadParityEmitOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitOkL0Accept : Bool :=
  (checkNamedSurface (parityEmitTermSurfaceFrom
      hostModuleCheckBadParityEmitOkText)
    parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- L0/L1 still accept PE4 when tokens present.
    Greppable: hostModuleCheckBadParityEmitContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitContractL0Accept : Bool :=
  (checkNamedSurface (parityEmitTermSurfaceFrom
      hostModuleCheckBadParityEmitContractText)
    parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckParityEmitTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckParityEmitTermDialectOk : Bool :=
  (checkParityEmitTermDialect hostModuleCheckGoodParityEmitTermText).isNone

/-- Dialect rejects PE1.
    Greppable: hostModuleCheckBadParityEmitStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitStageIdDialectReject : Bool :=
  match checkParityEmitTermDialect hostModuleCheckBadParityEmitStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE2.
    Greppable: hostModuleCheckBadParityEmitReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitReadyDialectReject : Bool :=
  match checkParityEmitTermDialect hostModuleCheckBadParityEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE3.
    Greppable: hostModuleCheckBadParityEmitOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitOkDialectReject : Bool :=
  match checkParityEmitTermDialect hostModuleCheckBadParityEmitOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE4.
    Greppable: hostModuleCheckBadParityEmitContractDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityEmitContractDialectReject : Bool :=
  match checkParityEmitTermDialect hostModuleCheckBadParityEmitContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined ParityEmit L2 dual-pin (good + PE1..PE4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckParityEmitTermSurfaceOk, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermSurfaceOk : Bool :=
  hostModuleCheckParityEmitTermSurfaceDualOk
    && (checkDepthParityEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthParityEmitTermSurfaceScope == "ParityEmit-only")
    && hostModuleCheckParityEmitTermDialectOk
    && hostModuleCheckBadParityEmitStageIdDialectReject
    && hostModuleCheckBadParityEmitReadyDialectReject
    && hostModuleCheckBadParityEmitOkDialectReject
    && hostModuleCheckBadParityEmitContractDialectReject
    && hostModuleCheckBadParityEmitStageIdL0Accept
    && hostModuleCheckBadParityEmitReadyL0Accept
    && hostModuleCheckBadParityEmitOkL0Accept
    && hostModuleCheckBadParityEmitContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckParityEmitTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckParityEmitTermSurfaceOk_true :
    hostModuleCheckParityEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_parity_emit_term_surface_ids_eq :
    checkDepthParityEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthParityEmitTermSurfaceScope = "ParityEmit-only"
      && hostModuleCheckParityEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckParityEmitTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckParityEmitTermSourceReady : Bool :=
  liveRel == "HostModuleCheckParityEmitTerm.lean"
    && kernelCheckLiveHostModuleCheckParityEmitTermSource liveHostModuleCheckParityEmitTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckParityEmitTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckParityEmitTerm.lean")
  let k := kernelCheckLiveHostModuleCheckParityEmitTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckParityEmitTerm parse false")
  unless hostFrontLiveHostModuleCheckParityEmitTermSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource
