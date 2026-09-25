/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckParityTypesTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckParityTypesTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckParityTypesTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckParityTypesTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPARITYTYPESTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm

/-- Dual-pinned live HostModuleCheckParityTypesTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckParityTypesTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPARITYTYPESTERM. -/
def liveHostModuleCheckParityTypesTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ParityTypes L2 term-surface pilot (third post-
  Kernel named host unit TERM-SURFACE after ParityMult + ParityLinear).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ParityTypes dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ParityTypes L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PARITY_TYPES_V0".
  - hostParityTypesId body "HOST-PARITY-TYPES".
  - selfHostParityTypesId body "SELF-HOST-PARITY-TYPES".
  - typesContractParityOk fail-closed compose KernelTypes.typesKernelReady &&
    KernelTypes.typesProgramPathReady && KernelTypes.kindMultMismatchRejected &&
    ParityLinear.linearParityReady && productApiSurfaceOk.
  - typesParityReady fail-closed compose typesContractParityOk &&
    paritySurfaceOk.
  - typesParityOk definitional alias typesParityReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckParityTypesTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckParityTypesTermSurfaceOk (E-good dialect +
    PT1..PT4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - ParityTypes pilot only -- not package elaborate, not ParityTypesTheorems L3,
    not FullHostElaborateRemains re-true, not package-env rewrite same slice.
  - Mult..Extract + Emit* + Kernel* + ParityMult + ParityLinear TERM-SURFACE
    dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for ParityTypes is ParityTypes-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckParityTypesTerm,
  TERM-SURFACE, ParityTypes-only, ILL-TYPED-TERM, checkParityTypesTermDialect,
  hostModuleCheckBadParityTypesStageIdText,
  hostModuleCheckBadParityTypesReadyText,
  hostModuleCheckBadParityTypesOkText,
  hostModuleCheckBadParityTypesContractText,
  hostModuleCheckParityTypesTermDialectOk, ParityTypes term-surface pilot,
  hostModuleCheckParityTypesTermSurfaceDualOk,
  hostModuleCheckParityTypesTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckParityTypesTerm
  Red/green: lake build SystemsLean.HostModuleCheckParityTypesTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ParityTypes L2 term-surface dual-ok pins (ParityTypes-only) -/

/-- Named term-surface depth bar for ParityTypes L2 pilot honesty.
    Greppable: checkDepthParityTypesTermSurfaceBar, TERM-SURFACE, ParityTypes-only. -/
def checkDepthParityTypesTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: ParityTypes.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthParityTypesTermSurfaceScope, ParityTypes-only, TERM-SURFACE. -/
def checkDepthParityTypesTermSurfaceScope : String := "ParityTypes-only"

/-- Dual-ok when ParityTypes L2 E-good/E-bad rejects work (ParityTypes pilot only).
    Greppable: hostModuleCheckParityTypesTermSurfaceDualOk, TERM-SURFACE,
    ParityTypes-only. -/
def hostModuleCheckParityTypesTermSurfaceDualOk : Bool := true

/-! ### ParityTypes dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_PARITY_TYPES_V0 string.
    Greppable: parityTypesStageIdBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PARITY_TYPES_V0\""

/-- hostParityTypesId body is HOST-PARITY-TYPES string.
    Greppable: parityTypesHostIdBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostParityTypesId" with
  | none => false
  | some body => body == "\"HOST-PARITY-TYPES\""

/-- selfHostParityTypesId body is SELF-HOST-PARITY-TYPES string.
    Greppable: parityTypesSelfHostIdBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostParityTypesId" with
  | none => false
  | some body => body == "\"SELF-HOST-PARITY-TYPES\""

/-- typesContractParityOk fail-closed Kernel+Linear+product API compose (collapsed).
    Greppable: parityTypesContractBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesContractBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesContractParityOk" with
  | none => false
  | some body =>
    body == "KernelTypes.typesKernelReady && KernelTypes.typesProgramPathReady && KernelTypes.kindMultMismatchRejected && ParityLinear.linearParityReady && productApiSurfaceOk"

/-- typesParityReady fail-closed contract+surface compose (collapsed).
    Greppable: parityTypesReadyBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesParityReady" with
  | none => false
  | some body => body == "typesContractParityOk && paritySurfaceOk"

/-- typesParityOk is definitional alias of typesParityReady.
    Greppable: parityTypesOkBodyOk, TERM-SURFACE, ParityTypes-only. -/
def parityTypesOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesParityOk" with
  | none => false
  | some body => body == "typesParityReady"

/-- ParityTypes L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkParityTypesTermDialect, TERM-SURFACE,
    ParityTypes term-surface pilot. -/
def checkParityTypesTermDialect (content : String) : Option String :=
  if !parityTypesStageIdBodyOk content then some reasonIllTypedTerm
  else if !parityTypesHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityTypesSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityTypesContractBodyOk content then some reasonIllTypedTerm
  else if !parityTypesReadyBodyOk content then some reasonIllTypedTerm
  else if !parityTypesOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply ParityTypes L2 after a structural ParityTypes accept.
    Greppable: refineParityTypesWithTermSurface, TERM-SURFACE, ParityTypes-only. -/
def refineParityTypesWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkParityTypesTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### ParityTypes L2 well-typed good fixture (E-good) -/

/-- Shared ParityTypes skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckParityTypesTermSkeletonPrefix, TERM-SURFACE,
    ParityTypes-only. -/
def hostModuleCheckParityTypesTermSkeletonPrefix : String :=
  "import SystemsLean.KernelTypes\n" ++
  "import SystemsLean.ParityLinear\n" ++
  "namespace SystemsLean.ParityTypes\n"

/-- Shared ParityTypes skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckParityTypesTermSkeletonSuffix, TERM-SURFACE,
    ParityTypes-only. -/
def hostModuleCheckParityTypesTermSkeletonSuffix : String :=
  "end SystemsLean.ParityTypes\n"

/-- Shared good-path mid bodies for stage/ids/ready/ok/contract + L0 tokens.
    Greppable: hostModuleCheckParityTypesTermGoodMid, TERM-SURFACE, ParityTypes-only. -/
def hostModuleCheckParityTypesTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def typesContractParityOk : Bool :=\n" ++
  "  KernelTypes.typesKernelReady\n" ++
  "    && KernelTypes.typesProgramPathReady\n" ++
  "    && KernelTypes.kindMultMismatchRejected\n" ++
  "    && ParityLinear.linearParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def typesParityReady : Bool :=\n" ++
  "  typesContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesParityReady : Bool :=\n" ++
  "  ParityLinear.multLinearParityReady && typesParityReady\n" ++
  "def typesParityOk : Bool := typesParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n"

/-- Well-typed ParityTypes L2 good text.
    Greppable: hostModuleCheckGoodParityTypesTermText, TERM-SURFACE, ParityTypes-only. -/
def hostModuleCheckGoodParityTypesTermText : String :=
  hostModuleCheckParityTypesTermSkeletonPrefix
    ++ hostModuleCheckParityTypesTermGoodMid
    ++ hostModuleCheckParityTypesTermSkeletonSuffix

/-! ### Ill-typed ParityTypes twins (L0 tokens present; L2 must reject). -/

/-- PT1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadParityTypesStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesStageIdText : String :=
  hostModuleCheckParityTypesTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def typesContractParityOk : Bool :=\n" ++
  "  KernelTypes.typesKernelReady\n" ++
  "    && KernelTypes.typesProgramPathReady\n" ++
  "    && KernelTypes.kindMultMismatchRejected\n" ++
  "    && ParityLinear.linearParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def typesParityReady : Bool :=\n" ++
  "  typesContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesParityReady : Bool :=\n" ++
  "  ParityLinear.multLinearParityReady && typesParityReady\n" ++
  "def typesParityOk : Bool := typesParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityTypesTermSkeletonSuffix

/-- PT2: typesParityReady always true (drops fail-closed contract+surface compose).
    Greppable: hostModuleCheckBadParityTypesReadyText, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesReadyText : String :=
  hostModuleCheckParityTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def typesContractParityOk : Bool :=\n" ++
  "  KernelTypes.typesKernelReady\n" ++
  "    && KernelTypes.typesProgramPathReady\n" ++
  "    && KernelTypes.kindMultMismatchRejected\n" ++
  "    && ParityLinear.linearParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def typesParityReady : Bool := true\n" ++
  "def multLinearTypesParityReady : Bool :=\n" ++
  "  ParityLinear.multLinearParityReady && typesParityReady\n" ++
  "def typesParityOk : Bool := typesParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityTypesTermSkeletonSuffix

/-- PT3: typesParityOk always true (drops definitional alias of typesParityReady).
    Greppable: hostModuleCheckBadParityTypesOkText, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesOkText : String :=
  hostModuleCheckParityTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def typesContractParityOk : Bool :=\n" ++
  "  KernelTypes.typesKernelReady\n" ++
  "    && KernelTypes.typesProgramPathReady\n" ++
  "    && KernelTypes.kindMultMismatchRejected\n" ++
  "    && ParityLinear.linearParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def typesParityReady : Bool :=\n" ++
  "  typesContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesParityReady : Bool :=\n" ++
  "  ParityLinear.multLinearParityReady && typesParityReady\n" ++
  "def typesParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityTypesTermSkeletonSuffix

/-- PT4: typesContractParityOk always true (drops Kernel+Linear+API compose).
    Greppable: hostModuleCheckBadParityTypesContractText, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesContractText : String :=
  hostModuleCheckParityTypesTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def typesContractParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def typesParityReady : Bool :=\n" ++
  "  typesContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesParityReady : Bool :=\n" ++
  "  ParityLinear.multLinearParityReady && typesParityReady\n" ++
  "def typesParityOk : Bool := typesParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityTypesTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from ParityTypes twin text for L0 dual-pin. -/
def parityTypesTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ParityTypes"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PT1 when tokens present.
    Greppable: hostModuleCheckBadParityTypesStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesStageIdL0Accept : Bool :=
  (checkNamedSurface (parityTypesTermSurfaceFrom
      hostModuleCheckBadParityTypesStageIdText)
    parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- L0/L1 still accept PT2 when tokens present.
    Greppable: hostModuleCheckBadParityTypesReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesReadyL0Accept : Bool :=
  (checkNamedSurface (parityTypesTermSurfaceFrom
      hostModuleCheckBadParityTypesReadyText)
    parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- L0/L1 still accept PT3 when tokens present.
    Greppable: hostModuleCheckBadParityTypesOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesOkL0Accept : Bool :=
  (checkNamedSurface (parityTypesTermSurfaceFrom
      hostModuleCheckBadParityTypesOkText)
    parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- L0/L1 still accept PT4 when tokens present.
    Greppable: hostModuleCheckBadParityTypesContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesContractL0Accept : Bool :=
  (checkNamedSurface (parityTypesTermSurfaceFrom
      hostModuleCheckBadParityTypesContractText)
    parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckParityTypesTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckParityTypesTermDialectOk : Bool :=
  (checkParityTypesTermDialect hostModuleCheckGoodParityTypesTermText).isNone

/-- Dialect rejects PT1.
    Greppable: hostModuleCheckBadParityTypesStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesStageIdDialectReject : Bool :=
  match checkParityTypesTermDialect hostModuleCheckBadParityTypesStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT2.
    Greppable: hostModuleCheckBadParityTypesReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesReadyDialectReject : Bool :=
  match checkParityTypesTermDialect hostModuleCheckBadParityTypesReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT3.
    Greppable: hostModuleCheckBadParityTypesOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesOkDialectReject : Bool :=
  match checkParityTypesTermDialect hostModuleCheckBadParityTypesOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PT4.
    Greppable: hostModuleCheckBadParityTypesContractDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityTypesContractDialectReject : Bool :=
  match checkParityTypesTermDialect hostModuleCheckBadParityTypesContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined ParityTypes L2 dual-pin (good + PT1..PT4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckParityTypesTermSurfaceOk, TERM-SURFACE, ParityTypes-only. -/
def hostModuleCheckParityTypesTermSurfaceOk : Bool :=
  hostModuleCheckParityTypesTermSurfaceDualOk
    && (checkDepthParityTypesTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthParityTypesTermSurfaceScope == "ParityTypes-only")
    && hostModuleCheckParityTypesTermDialectOk
    && hostModuleCheckBadParityTypesStageIdDialectReject
    && hostModuleCheckBadParityTypesReadyDialectReject
    && hostModuleCheckBadParityTypesOkDialectReject
    && hostModuleCheckBadParityTypesContractDialectReject
    && hostModuleCheckBadParityTypesStageIdL0Accept
    && hostModuleCheckBadParityTypesReadyL0Accept
    && hostModuleCheckBadParityTypesOkL0Accept
    && hostModuleCheckBadParityTypesContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckParityTypesTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckParityTypesTermSurfaceOk_true :
    hostModuleCheckParityTypesTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_parity_types_term_surface_ids_eq :
    checkDepthParityTypesTermSurfaceBar = "TERM-SURFACE"
      && checkDepthParityTypesTermSurfaceScope = "ParityTypes-only"
      && hostModuleCheckParityTypesTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm
