/-
  SYSTEMS_LEAN_HOST partial -- ParityLinear L2 term-surface pilot (second post-
  Kernel named host unit TERM-SURFACE after ParityMult).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ParityLinear dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ParityLinear L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PARITY_LINEAR_V0".
  - hostParityLinearId body "HOST-PARITY-LINEAR".
  - selfHostParityLinearId body "SELF-HOST-PARITY-LINEAR".
  - linearContractParityOk fail-closed compose KernelLinear.linearKernelReady &&
    KernelLinear.linearHostPathReady && ParityMult.multParityReady &&
    productApiSurfaceOk.
  - linearParityReady fail-closed compose linearContractParityOk &&
    paritySurfaceOk.
  - linearParityOk definitional alias linearParityReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckParityLinearTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckParityLinearTermSurfaceOk (E-good dialect +
    PL1..PL4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - ParityLinear pilot only -- not package elaborate, not ParityLinearTheorems L3,
    not FullHostElaborateRemains re-true, not package-env rewrite same slice.
  - Mult..Extract + Emit* + Kernel* + ParityMult TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for ParityLinear is ParityLinear-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckParityLinearTerm,
  TERM-SURFACE, ParityLinear-only, ILL-TYPED-TERM, checkParityLinearTermDialect,
  hostModuleCheckBadParityLinearStageIdText,
  hostModuleCheckBadParityLinearReadyText,
  hostModuleCheckBadParityLinearOkText,
  hostModuleCheckBadParityLinearContractText,
  hostModuleCheckParityLinearTermDialectOk, ParityLinear term-surface pilot,
  hostModuleCheckParityLinearTermSurfaceDualOk,
  hostModuleCheckParityLinearTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckParityLinearTerm
  Red/green: lake build SystemsLean.HostModuleCheckParityLinearTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ParityLinear L2 term-surface dual-ok pins (ParityLinear-only) -/

/-- Named term-surface depth bar for ParityLinear L2 pilot honesty.
    Greppable: checkDepthParityLinearTermSurfaceBar, TERM-SURFACE, ParityLinear-only. -/
def checkDepthParityLinearTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: ParityLinear.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthParityLinearTermSurfaceScope, ParityLinear-only, TERM-SURFACE. -/
def checkDepthParityLinearTermSurfaceScope : String := "ParityLinear-only"

/-- Dual-ok when ParityLinear L2 E-good/E-bad rejects work (ParityLinear pilot only).
    Greppable: hostModuleCheckParityLinearTermSurfaceDualOk, TERM-SURFACE,
    ParityLinear-only. -/
def hostModuleCheckParityLinearTermSurfaceDualOk : Bool := true

/-! ### ParityLinear dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_PARITY_LINEAR_V0 string.
    Greppable: parityLinearStageIdBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PARITY_LINEAR_V0\""

/-- hostParityLinearId body is HOST-PARITY-LINEAR string.
    Greppable: parityLinearHostIdBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostParityLinearId" with
  | none => false
  | some body => body == "\"HOST-PARITY-LINEAR\""

/-- selfHostParityLinearId body is SELF-HOST-PARITY-LINEAR string.
    Greppable: parityLinearSelfHostIdBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostParityLinearId" with
  | none => false
  | some body => body == "\"SELF-HOST-PARITY-LINEAR\""

/-- linearContractParityOk fail-closed Kernel+Mult+product API compose (collapsed).
    Greppable: parityLinearContractBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearContractBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearContractParityOk" with
  | none => false
  | some body =>
    body == "KernelLinear.linearKernelReady && KernelLinear.linearHostPathReady && ParityMult.multParityReady && productApiSurfaceOk"

/-- linearParityReady fail-closed contract+surface compose (collapsed).
    Greppable: parityLinearReadyBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearParityReady" with
  | none => false
  | some body => body == "linearContractParityOk && paritySurfaceOk"

/-- linearParityOk is definitional alias of linearParityReady.
    Greppable: parityLinearOkBodyOk, TERM-SURFACE, ParityLinear-only. -/
def parityLinearOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearParityOk" with
  | none => false
  | some body => body == "linearParityReady"

/-- ParityLinear L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkParityLinearTermDialect, TERM-SURFACE,
    ParityLinear term-surface pilot. -/
def checkParityLinearTermDialect (content : String) : Option String :=
  if !parityLinearStageIdBodyOk content then some reasonIllTypedTerm
  else if !parityLinearHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityLinearSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityLinearContractBodyOk content then some reasonIllTypedTerm
  else if !parityLinearReadyBodyOk content then some reasonIllTypedTerm
  else if !parityLinearOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply ParityLinear L2 after a structural ParityLinear accept.
    Greppable: refineParityLinearWithTermSurface, TERM-SURFACE, ParityLinear-only. -/
def refineParityLinearWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkParityLinearTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### ParityLinear L2 well-typed good fixture (E-good) -/

/-- Shared ParityLinear skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckParityLinearTermSkeletonPrefix, TERM-SURFACE,
    ParityLinear-only. -/
def hostModuleCheckParityLinearTermSkeletonPrefix : String :=
  "import SystemsLean.KernelLinear\n" ++
  "import SystemsLean.ParityMult\n" ++
  "namespace SystemsLean.ParityLinear\n"

/-- Shared ParityLinear skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckParityLinearTermSkeletonSuffix, TERM-SURFACE,
    ParityLinear-only. -/
def hostModuleCheckParityLinearTermSkeletonSuffix : String :=
  "end SystemsLean.ParityLinear\n"

/-- Shared good-path mid bodies for stage/ids/ready/ok/contract + L0 tokens.
    Greppable: hostModuleCheckParityLinearTermGoodMid, TERM-SURFACE, ParityLinear-only. -/
def hostModuleCheckParityLinearTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def linearContractParityOk : Bool :=\n" ++
  "  KernelLinear.linearKernelReady\n" ++
  "    && KernelLinear.linearHostPathReady\n" ++
  "    && ParityMult.multParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def linearParityReady : Bool :=\n" ++
  "  linearContractParityOk && paritySurfaceOk\n" ++
  "def multLinearParityReady : Bool :=\n" ++
  "  ParityMult.multParityReady && linearParityReady\n" ++
  "def linearParityOk : Bool := linearParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n"

/-- Well-typed ParityLinear L2 good text.
    Greppable: hostModuleCheckGoodParityLinearTermText, TERM-SURFACE, ParityLinear-only. -/
def hostModuleCheckGoodParityLinearTermText : String :=
  hostModuleCheckParityLinearTermSkeletonPrefix
    ++ hostModuleCheckParityLinearTermGoodMid
    ++ hostModuleCheckParityLinearTermSkeletonSuffix

/-! ### Ill-typed ParityLinear twins (L0 tokens present; L2 must reject). -/

/-- PL1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadParityLinearStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearStageIdText : String :=
  hostModuleCheckParityLinearTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def linearContractParityOk : Bool :=\n" ++
  "  KernelLinear.linearKernelReady\n" ++
  "    && KernelLinear.linearHostPathReady\n" ++
  "    && ParityMult.multParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def linearParityReady : Bool :=\n" ++
  "  linearContractParityOk && paritySurfaceOk\n" ++
  "def multLinearParityReady : Bool :=\n" ++
  "  ParityMult.multParityReady && linearParityReady\n" ++
  "def linearParityOk : Bool := linearParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityLinearTermSkeletonSuffix

/-- PL2: linearParityReady always true (drops fail-closed contract+surface compose).
    Greppable: hostModuleCheckBadParityLinearReadyText, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearReadyText : String :=
  hostModuleCheckParityLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def linearContractParityOk : Bool :=\n" ++
  "  KernelLinear.linearKernelReady\n" ++
  "    && KernelLinear.linearHostPathReady\n" ++
  "    && ParityMult.multParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def linearParityReady : Bool := true\n" ++
  "def multLinearParityReady : Bool :=\n" ++
  "  ParityMult.multParityReady && linearParityReady\n" ++
  "def linearParityOk : Bool := linearParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityLinearTermSkeletonSuffix

/-- PL3: linearParityOk always true (drops definitional alias of linearParityReady).
    Greppable: hostModuleCheckBadParityLinearOkText, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearOkText : String :=
  hostModuleCheckParityLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def linearContractParityOk : Bool :=\n" ++
  "  KernelLinear.linearKernelReady\n" ++
  "    && KernelLinear.linearHostPathReady\n" ++
  "    && ParityMult.multParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def linearParityReady : Bool :=\n" ++
  "  linearContractParityOk && paritySurfaceOk\n" ++
  "def multLinearParityReady : Bool :=\n" ++
  "  ParityMult.multParityReady && linearParityReady\n" ++
  "def linearParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityLinearTermSkeletonSuffix

/-- PL4: linearContractParityOk always true (drops Kernel+Mult+API compose).
    Greppable: hostModuleCheckBadParityLinearContractText, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearContractText : String :=
  hostModuleCheckParityLinearTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def linearContractParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def linearParityReady : Bool :=\n" ++
  "  linearContractParityOk && paritySurfaceOk\n" ++
  "def multLinearParityReady : Bool :=\n" ++
  "  ParityMult.multParityReady && linearParityReady\n" ++
  "def linearParityOk : Bool := linearParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityLinearTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from ParityLinear twin text for L0 dual-pin. -/
def parityLinearTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ParityLinear"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PL1 when tokens present.
    Greppable: hostModuleCheckBadParityLinearStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearStageIdL0Accept : Bool :=
  (checkNamedSurface (parityLinearTermSurfaceFrom
      hostModuleCheckBadParityLinearStageIdText)
    parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- L0/L1 still accept PL2 when tokens present.
    Greppable: hostModuleCheckBadParityLinearReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearReadyL0Accept : Bool :=
  (checkNamedSurface (parityLinearTermSurfaceFrom
      hostModuleCheckBadParityLinearReadyText)
    parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- L0/L1 still accept PL3 when tokens present.
    Greppable: hostModuleCheckBadParityLinearOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearOkL0Accept : Bool :=
  (checkNamedSurface (parityLinearTermSurfaceFrom
      hostModuleCheckBadParityLinearOkText)
    parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- L0/L1 still accept PL4 when tokens present.
    Greppable: hostModuleCheckBadParityLinearContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearContractL0Accept : Bool :=
  (checkNamedSurface (parityLinearTermSurfaceFrom
      hostModuleCheckBadParityLinearContractText)
    parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckParityLinearTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckParityLinearTermDialectOk : Bool :=
  (checkParityLinearTermDialect hostModuleCheckGoodParityLinearTermText).isNone

/-- Dialect rejects PL1.
    Greppable: hostModuleCheckBadParityLinearStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearStageIdDialectReject : Bool :=
  match checkParityLinearTermDialect hostModuleCheckBadParityLinearStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PL2.
    Greppable: hostModuleCheckBadParityLinearReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearReadyDialectReject : Bool :=
  match checkParityLinearTermDialect hostModuleCheckBadParityLinearReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PL3.
    Greppable: hostModuleCheckBadParityLinearOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearOkDialectReject : Bool :=
  match checkParityLinearTermDialect hostModuleCheckBadParityLinearOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PL4.
    Greppable: hostModuleCheckBadParityLinearContractDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityLinearContractDialectReject : Bool :=
  match checkParityLinearTermDialect hostModuleCheckBadParityLinearContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined ParityLinear L2 dual-pin (good + PL1..PL4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckParityLinearTermSurfaceOk, TERM-SURFACE, ParityLinear-only. -/
def hostModuleCheckParityLinearTermSurfaceOk : Bool :=
  hostModuleCheckParityLinearTermSurfaceDualOk
    && (checkDepthParityLinearTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthParityLinearTermSurfaceScope == "ParityLinear-only")
    && hostModuleCheckParityLinearTermDialectOk
    && hostModuleCheckBadParityLinearStageIdDialectReject
    && hostModuleCheckBadParityLinearReadyDialectReject
    && hostModuleCheckBadParityLinearOkDialectReject
    && hostModuleCheckBadParityLinearContractDialectReject
    && hostModuleCheckBadParityLinearStageIdL0Accept
    && hostModuleCheckBadParityLinearReadyL0Accept
    && hostModuleCheckBadParityLinearOkL0Accept
    && hostModuleCheckBadParityLinearContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckParityLinearTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckParityLinearTermSurfaceOk_true :
    hostModuleCheckParityLinearTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_parity_linear_term_surface_ids_eq :
    checkDepthParityLinearTermSurfaceBar = "TERM-SURFACE"
      && checkDepthParityLinearTermSurfaceScope = "ParityLinear-only"
      && hostModuleCheckParityLinearTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
