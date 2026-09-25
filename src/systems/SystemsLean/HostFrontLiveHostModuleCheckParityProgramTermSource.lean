/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckParityProgramTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckParityProgramTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckParityProgramTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckParityProgramTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPARITYPROGRAMTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm

/-- Dual-pinned live HostModuleCheckParityProgramTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckParityProgramTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPARITYPROGRAMTERM. -/
def liveHostModuleCheckParityProgramTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ParityProgram L2 term-surface pilot (fourth post-
  Kernel named host unit TERM-SURFACE after ParityMult + ParityLinear +
  ParityTypes).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ParityProgram dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ParityProgram L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PARITY_PROGRAM_V0".
  - hostParityProgramId body "HOST-PARITY-PROGRAM".
  - selfHostParityProgramId body "SELF-HOST-PARITY-PROGRAM".
  - programContractParityOk fail-closed compose KernelProgram.programKernelReady &&
    KernelProgram.programPathReady && KernelProgram.programGraphPathReady &&
    KernelProgram.programComposePathReady && ParityTypes.typesParityReady &&
    productApiSurfaceOk.
  - programParityReady fail-closed compose programContractParityOk &&
    paritySurfaceOk.
  - programParityOk definitional alias programParityReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckParityProgramTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckParityProgramTermSurfaceOk (E-good dialect +
    PP1..PP4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - ParityProgram pilot only -- not package elaborate, not ParityProgramTheorems
    L3, not FullHostElaborateRemains re-true, not package-env rewrite same slice.
  - Mult..Extract + Emit* + Kernel* + ParityMult + ParityLinear + ParityTypes
    TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for ParityProgram is ParityProgram-only when E-bad
    rejects land.
  - ParityEmit TERM-SURFACE is a separate residual (W3b); not this module.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckParityProgramTerm,
  TERM-SURFACE, ParityProgram-only, ILL-TYPED-TERM, checkParityProgramTermDialect,
  hostModuleCheckBadParityProgramStageIdText,
  hostModuleCheckBadParityProgramReadyText,
  hostModuleCheckBadParityProgramOkText,
  hostModuleCheckBadParityProgramContractText,
  hostModuleCheckParityProgramTermDialectOk, ParityProgram term-surface pilot,
  hostModuleCheckParityProgramTermSurfaceDualOk,
  hostModuleCheckParityProgramTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckParityProgramTerm
  Red/green: lake build SystemsLean.HostModuleCheckParityProgramTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ParityProgram L2 term-surface dual-ok pins (ParityProgram-only) -/

/-- Named term-surface depth bar for ParityProgram L2 pilot honesty.
    Greppable: checkDepthParityProgramTermSurfaceBar, TERM-SURFACE,
    ParityProgram-only. -/
def checkDepthParityProgramTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: ParityProgram.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthParityProgramTermSurfaceScope, ParityProgram-only,
    TERM-SURFACE. -/
def checkDepthParityProgramTermSurfaceScope : String := "ParityProgram-only"

/-- Dual-ok when ParityProgram L2 E-good/E-bad rejects work (ParityProgram pilot).
    Greppable: hostModuleCheckParityProgramTermSurfaceDualOk, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermSurfaceDualOk : Bool := true

/-! ### ParityProgram dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_PARITY_PROGRAM_V0 string.
    Greppable: parityProgramStageIdBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\""

/-- hostParityProgramId body is HOST-PARITY-PROGRAM string.
    Greppable: parityProgramHostIdBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostParityProgramId" with
  | none => false
  | some body => body == "\"HOST-PARITY-PROGRAM\""

/-- selfHostParityProgramId body is SELF-HOST-PARITY-PROGRAM string.
    Greppable: parityProgramSelfHostIdBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostParityProgramId" with
  | none => false
  | some body => body == "\"SELF-HOST-PARITY-PROGRAM\""

/-- programContractParityOk fail-closed Kernel+Types+product API compose (collapsed).
    Greppable: parityProgramContractBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramContractBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programContractParityOk" with
  | none => false
  | some body =>
    body == "KernelProgram.programKernelReady && KernelProgram.programPathReady && KernelProgram.programGraphPathReady && KernelProgram.programComposePathReady && ParityTypes.typesParityReady && productApiSurfaceOk"

/-- programParityReady fail-closed contract+surface compose (collapsed).
    Greppable: parityProgramReadyBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programParityReady" with
  | none => false
  | some body => body == "programContractParityOk && paritySurfaceOk"

/-- programParityOk is definitional alias of programParityReady.
    Greppable: parityProgramOkBodyOk, TERM-SURFACE, ParityProgram-only. -/
def parityProgramOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programParityOk" with
  | none => false
  | some body => body == "programParityReady"

/-- ParityProgram L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkParityProgramTermDialect, TERM-SURFACE,
    ParityProgram term-surface pilot. -/
def checkParityProgramTermDialect (content : String) : Option String :=
  if !parityProgramStageIdBodyOk content then some reasonIllTypedTerm
  else if !parityProgramHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityProgramSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityProgramContractBodyOk content then some reasonIllTypedTerm
  else if !parityProgramReadyBodyOk content then some reasonIllTypedTerm
  else if !parityProgramOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply ParityProgram L2 after a structural ParityProgram accept.
    Greppable: refineParityProgramWithTermSurface, TERM-SURFACE,
    ParityProgram-only. -/
def refineParityProgramWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkParityProgramTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### ParityProgram L2 well-typed good fixture (E-good) -/

/-- Shared ParityProgram skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckParityProgramTermSkeletonPrefix, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermSkeletonPrefix : String :=
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.ParityTypes\n" ++
  "namespace SystemsLean.ParityProgram\n"

/-- Shared ParityProgram skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckParityProgramTermSkeletonSuffix, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermSkeletonSuffix : String :=
  "end SystemsLean.ParityProgram\n"

/-- Shared good-path mid bodies for stage/ids/ready/ok/contract + L0 tokens.
    Greppable: hostModuleCheckParityProgramTermGoodMid, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def programContractParityOk : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && KernelProgram.programPathReady\n" ++
  "    && KernelProgram.programGraphPathReady\n" ++
  "    && KernelProgram.programComposePathReady\n" ++
  "    && ParityTypes.typesParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def programParityReady : Bool :=\n" ++
  "  programContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramParityReady : Bool :=\n" ++
  "  ParityTypes.multLinearTypesParityReady && programParityReady\n" ++
  "def programParityOk : Bool := programParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n"

/-- Well-typed ParityProgram L2 good text.
    Greppable: hostModuleCheckGoodParityProgramTermText, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckGoodParityProgramTermText : String :=
  hostModuleCheckParityProgramTermSkeletonPrefix
    ++ hostModuleCheckParityProgramTermGoodMid
    ++ hostModuleCheckParityProgramTermSkeletonSuffix

/-! ### Ill-typed ParityProgram twins (L0 tokens present; L2 must reject). -/

/-- PP1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadParityProgramStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramStageIdText : String :=
  hostModuleCheckParityProgramTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def programContractParityOk : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && KernelProgram.programPathReady\n" ++
  "    && KernelProgram.programGraphPathReady\n" ++
  "    && KernelProgram.programComposePathReady\n" ++
  "    && ParityTypes.typesParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def programParityReady : Bool :=\n" ++
  "  programContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramParityReady : Bool :=\n" ++
  "  ParityTypes.multLinearTypesParityReady && programParityReady\n" ++
  "def programParityOk : Bool := programParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityProgramTermSkeletonSuffix

/-- PP2: programParityReady always true (drops fail-closed contract+surface).
    Greppable: hostModuleCheckBadParityProgramReadyText, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramReadyText : String :=
  hostModuleCheckParityProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def programContractParityOk : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && KernelProgram.programPathReady\n" ++
  "    && KernelProgram.programGraphPathReady\n" ++
  "    && KernelProgram.programComposePathReady\n" ++
  "    && ParityTypes.typesParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def programParityReady : Bool := true\n" ++
  "def multLinearTypesProgramParityReady : Bool :=\n" ++
  "  ParityTypes.multLinearTypesParityReady && programParityReady\n" ++
  "def programParityOk : Bool := programParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityProgramTermSkeletonSuffix

/-- PP3: programParityOk always true (drops definitional alias of ready).
    Greppable: hostModuleCheckBadParityProgramOkText, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramOkText : String :=
  hostModuleCheckParityProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def programContractParityOk : Bool :=\n" ++
  "  KernelProgram.programKernelReady\n" ++
  "    && KernelProgram.programPathReady\n" ++
  "    && KernelProgram.programGraphPathReady\n" ++
  "    && KernelProgram.programComposePathReady\n" ++
  "    && ParityTypes.typesParityReady\n" ++
  "    && productApiSurfaceOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def programParityReady : Bool :=\n" ++
  "  programContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramParityReady : Bool :=\n" ++
  "  ParityTypes.multLinearTypesParityReady && programParityReady\n" ++
  "def programParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityProgramTermSkeletonSuffix

/-- PP4: programContractParityOk always true (drops Kernel+Types+API compose).
    Greppable: hostModuleCheckBadParityProgramContractText, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramContractText : String :=
  hostModuleCheckParityProgramTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def productApiSurfaceOk : Bool := true\n" ++
  "def programContractParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def programParityReady : Bool :=\n" ++
  "  programContractParityOk && paritySurfaceOk\n" ++
  "def multLinearTypesProgramParityReady : Bool :=\n" ++
  "  ParityTypes.multLinearTypesParityReady && programParityReady\n" ++
  "def programParityOk : Bool := programParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityProgramTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from ParityProgram twin text for L0 dual-pin. -/
def parityProgramTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ParityProgram"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PP1 when tokens present.
    Greppable: hostModuleCheckBadParityProgramStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramStageIdL0Accept : Bool :=
  (checkNamedSurface (parityProgramTermSurfaceFrom
      hostModuleCheckBadParityProgramStageIdText)
    parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept PP2 when tokens present.
    Greppable: hostModuleCheckBadParityProgramReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramReadyL0Accept : Bool :=
  (checkNamedSurface (parityProgramTermSurfaceFrom
      hostModuleCheckBadParityProgramReadyText)
    parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept PP3 when tokens present.
    Greppable: hostModuleCheckBadParityProgramOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramOkL0Accept : Bool :=
  (checkNamedSurface (parityProgramTermSurfaceFrom
      hostModuleCheckBadParityProgramOkText)
    parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept PP4 when tokens present.
    Greppable: hostModuleCheckBadParityProgramContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramContractL0Accept : Bool :=
  (checkNamedSurface (parityProgramTermSurfaceFrom
      hostModuleCheckBadParityProgramContractText)
    parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckParityProgramTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckParityProgramTermDialectOk : Bool :=
  (checkParityProgramTermDialect hostModuleCheckGoodParityProgramTermText).isNone

/-- Dialect rejects PP1.
    Greppable: hostModuleCheckBadParityProgramStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramStageIdDialectReject : Bool :=
  match checkParityProgramTermDialect hostModuleCheckBadParityProgramStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PP2.
    Greppable: hostModuleCheckBadParityProgramReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramReadyDialectReject : Bool :=
  match checkParityProgramTermDialect hostModuleCheckBadParityProgramReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PP3.
    Greppable: hostModuleCheckBadParityProgramOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramOkDialectReject : Bool :=
  match checkParityProgramTermDialect hostModuleCheckBadParityProgramOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PP4.
    Greppable: hostModuleCheckBadParityProgramContractDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityProgramContractDialectReject : Bool :=
  match checkParityProgramTermDialect hostModuleCheckBadParityProgramContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined ParityProgram L2 dual-pin (good + PP1..PP4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckParityProgramTermSurfaceOk, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermSurfaceOk : Bool :=
  hostModuleCheckParityProgramTermSurfaceDualOk
    && (checkDepthParityProgramTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthParityProgramTermSurfaceScope == "ParityProgram-only")
    && hostModuleCheckParityProgramTermDialectOk
    && hostModuleCheckBadParityProgramStageIdDialectReject
    && hostModuleCheckBadParityProgramReadyDialectReject
    && hostModuleCheckBadParityProgramOkDialectReject
    && hostModuleCheckBadParityProgramContractDialectReject
    && hostModuleCheckBadParityProgramStageIdL0Accept
    && hostModuleCheckBadParityProgramReadyL0Accept
    && hostModuleCheckBadParityProgramOkL0Accept
    && hostModuleCheckBadParityProgramContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckParityProgramTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckParityProgramTermSurfaceOk_true :
    hostModuleCheckParityProgramTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_parity_program_term_surface_ids_eq :
    checkDepthParityProgramTermSurfaceBar = "TERM-SURFACE"
      && checkDepthParityProgramTermSurfaceScope = "ParityProgram-only"
      && hostModuleCheckParityProgramTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckParityProgramTerm
