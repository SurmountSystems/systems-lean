/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckParityMultTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveParityMultTermSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-PARITY-MULT-TERM, liveParityMultTermSource,
  HOST-FRONT-LIVE-PARITY-MULT-TERM, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveParityMultTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveParityMultTerm

/-- Dual-pinned live HostModuleCheckParityMultTerm.lean bytes (must match on-disk file).
    Greppable: liveParityMultTermSource, PARSE-LIVE-PARITY-MULT-TERM. -/
def liveParityMultTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ParityMult L2 term-surface pilot (first post-Kernel
  named host unit TERM-SURFACE).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ParityMult dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ParityMult L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PARITY_MULT_V0".
  - hostParityMultId body "HOST-PARITY-MULT".
  - selfHostParityMultId body "SELF-HOST-PARITY-MULT".
  - multParityReady fail-closed compose KernelMult.multKernelReady &&
    EmitMult.emitMultReady && gradeParityOk && paritySurfaceOk.
  - multParityOk definitional alias multParityReady.
  - gradeParityOk compose ofNatRoundTripOk && isValidTagParityOk &&
    isValidParityOk && nameParityOk && enumTagParityOk.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckParityMultTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckParityMultTermSurfaceOk (E-good dialect +
    PM1..PM4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - ParityMult pilot only -- not package elaborate, not ParityMultTheorems L3,
    not FullHostElaborateRemains re-true, not ParityLinear same slice.
  - Mult..Extract + Emit* + Kernel* TERM-SURFACE dual-ok unchanged.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for ParityMult is ParityMult-only when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckParityMultTerm,
  TERM-SURFACE, ParityMult-only, ILL-TYPED-TERM, checkParityMultTermDialect,
  hostModuleCheckBadParityMultStageIdText,
  hostModuleCheckBadParityMultReadyText,
  hostModuleCheckBadParityMultOkText,
  hostModuleCheckBadParityMultGradeText,
  hostModuleCheckParityMultTermDialectOk, ParityMult term-surface pilot,
  hostModuleCheckParityMultTermSurfaceDualOk,
  hostModuleCheckParityMultTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckParityMultTerm
  Red/green: lake build SystemsLean.HostModuleCheckParityMultTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ParityMult L2 term-surface dual-ok pins (ParityMult-only) -/

/-- Named term-surface depth bar for ParityMult L2 pilot honesty.
    Greppable: checkDepthParityMultTermSurfaceBar, TERM-SURFACE, ParityMult-only. -/
def checkDepthParityMultTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: ParityMult.lean pilot only (not package elaborate; not prior).
    Greppable: checkDepthParityMultTermSurfaceScope, ParityMult-only, TERM-SURFACE. -/
def checkDepthParityMultTermSurfaceScope : String := "ParityMult-only"

/-- Dual-ok when ParityMult L2 E-good/E-bad rejects work (ParityMult pilot only).
    Greppable: hostModuleCheckParityMultTermSurfaceDualOk, TERM-SURFACE,
    ParityMult-only. -/
def hostModuleCheckParityMultTermSurfaceDualOk : Bool := true

/-! ### ParityMult dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_PARITY_MULT_V0 string.
    Greppable: parityMultStageIdBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PARITY_MULT_V0\""

/-- hostParityMultId body is HOST-PARITY-MULT string.
    Greppable: parityMultHostIdBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostParityMultId" with
  | none => false
  | some body => body == "\"HOST-PARITY-MULT\""

/-- selfHostParityMultId body is SELF-HOST-PARITY-MULT string.
    Greppable: parityMultSelfHostIdBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostParityMultId" with
  | none => false
  | some body => body == "\"SELF-HOST-PARITY-MULT\""

/-- multParityReady fail-closed Kernel+Emit+grade+surface compose (collapsed).
    Greppable: parityMultReadyBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multParityReady" with
  | none => false
  | some body =>
    body == "KernelMult.multKernelReady && EmitMult.emitMultReady && gradeParityOk && paritySurfaceOk"

/-- multParityOk is definitional alias of multParityReady.
    Greppable: parityMultOkBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multParityOk" with
  | none => false
  | some body => body == "multParityReady"

/-- gradeParityOk compose of five Mult grade parity sub-oks (collapsed).
    Greppable: parityMultGradeBodyOk, TERM-SURFACE, ParityMult-only. -/
def parityMultGradeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "gradeParityOk" with
  | none => false
  | some body =>
    body == "ofNatRoundTripOk && isValidTagParityOk && isValidParityOk && nameParityOk && enumTagParityOk"

/-- ParityMult L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkParityMultTermDialect, TERM-SURFACE,
    ParityMult term-surface pilot. -/
def checkParityMultTermDialect (content : String) : Option String :=
  if !parityMultStageIdBodyOk content then some reasonIllTypedTerm
  else if !parityMultHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityMultSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !parityMultReadyBodyOk content then some reasonIllTypedTerm
  else if !parityMultOkBodyOk content then some reasonIllTypedTerm
  else if !parityMultGradeBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply ParityMult L2 after a structural ParityMult accept.
    Greppable: refineParityMultWithTermSurface, TERM-SURFACE, ParityMult-only. -/
def refineParityMultWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkParityMultTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### ParityMult L2 well-typed good fixture (E-good) -/

/-- Shared ParityMult skeleton prefix for good/bad twins.
    Greppable: hostModuleCheckParityMultTermSkeletonPrefix, TERM-SURFACE,
    ParityMult-only. -/
def hostModuleCheckParityMultTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.KernelMult\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.ParityMult\n"

/-- Shared ParityMult skeleton suffix for good/bad twins.
    Greppable: hostModuleCheckParityMultTermSkeletonSuffix, TERM-SURFACE,
    ParityMult-only. -/
def hostModuleCheckParityMultTermSkeletonSuffix : String :=
  "end SystemsLean.ParityMult\n"

/-- Shared good-path mid bodies for stage/ids/ready/ok/grade + L0 tokens.
    Greppable: hostModuleCheckParityMultTermGoodMid, TERM-SURFACE, ParityMult-only. -/
def hostModuleCheckParityMultTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def isValidTagParityOk : Bool := true\n" ++
  "def isValidParityOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def enumTagParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool :=\n" ++
  "  ofNatRoundTripOk\n" ++
  "    && isValidTagParityOk\n" ++
  "    && isValidParityOk\n" ++
  "    && nameParityOk\n" ++
  "    && enumTagParityOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def multParityReady : Bool :=\n" ++
  "  KernelMult.multKernelReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && gradeParityOk\n" ++
  "    && paritySurfaceOk\n" ++
  "def multParityOk : Bool := multParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n"

/-- Well-typed ParityMult L2 good text.
    Greppable: hostModuleCheckGoodParityMultTermText, TERM-SURFACE, ParityMult-only. -/
def hostModuleCheckGoodParityMultTermText : String :=
  hostModuleCheckParityMultTermSkeletonPrefix
    ++ hostModuleCheckParityMultTermGoodMid
    ++ hostModuleCheckParityMultTermSkeletonSuffix

/-! ### Ill-typed ParityMult twins (L0 tokens present; L2 must reject). -/

/-- PM1: wrong stageId string (L0 still has def:stageId).
    Greppable: hostModuleCheckBadParityMultStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadParityMultStageIdText : String :=
  hostModuleCheckParityMultTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def isValidTagParityOk : Bool := true\n" ++
  "def isValidParityOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def enumTagParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool :=\n" ++
  "  ofNatRoundTripOk\n" ++
  "    && isValidTagParityOk\n" ++
  "    && isValidParityOk\n" ++
  "    && nameParityOk\n" ++
  "    && enumTagParityOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def multParityReady : Bool :=\n" ++
  "  KernelMult.multKernelReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && gradeParityOk\n" ++
  "    && paritySurfaceOk\n" ++
  "def multParityOk : Bool := multParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityMultTermSkeletonSuffix

/-- PM2: multParityReady always true (drops fail-closed Kernel+Emit+grade compose).
    Greppable: hostModuleCheckBadParityMultReadyText, TERM-SURFACE. -/
def hostModuleCheckBadParityMultReadyText : String :=
  hostModuleCheckParityMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def isValidTagParityOk : Bool := true\n" ++
  "def isValidParityOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def enumTagParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool :=\n" ++
  "  ofNatRoundTripOk\n" ++
  "    && isValidTagParityOk\n" ++
  "    && isValidParityOk\n" ++
  "    && nameParityOk\n" ++
  "    && enumTagParityOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def multParityReady : Bool := true\n" ++
  "def multParityOk : Bool := multParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityMultTermSkeletonSuffix

/-- PM3: multParityOk always true (drops definitional alias of multParityReady).
    Greppable: hostModuleCheckBadParityMultOkText, TERM-SURFACE. -/
def hostModuleCheckBadParityMultOkText : String :=
  hostModuleCheckParityMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def isValidTagParityOk : Bool := true\n" ++
  "def isValidParityOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def enumTagParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool :=\n" ++
  "  ofNatRoundTripOk\n" ++
  "    && isValidTagParityOk\n" ++
  "    && isValidParityOk\n" ++
  "    && nameParityOk\n" ++
  "    && enumTagParityOk\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def multParityReady : Bool :=\n" ++
  "  KernelMult.multKernelReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && gradeParityOk\n" ++
  "    && paritySurfaceOk\n" ++
  "def multParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityMultTermSkeletonSuffix

/-- PM4: gradeParityOk always true (drops five-way Mult grade compose).
    Greppable: hostModuleCheckBadParityMultGradeText, TERM-SURFACE. -/
def hostModuleCheckBadParityMultGradeText : String :=
  hostModuleCheckParityMultTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def isValidTagParityOk : Bool := true\n" ++
  "def isValidParityOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def enumTagParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def multParityReady : Bool :=\n" ++
  "  KernelMult.multKernelReady\n" ++
  "    && EmitMult.emitMultReady\n" ++
  "    && gradeParityOk\n" ++
  "    && paritySurfaceOk\n" ++
  "def multParityOk : Bool := multParityReady\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  hostModuleCheckParityMultTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from ParityMult twin text for L0 dual-pin. -/
def parityMultTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ParityMult"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept PM1 when tokens present.
    Greppable: hostModuleCheckBadParityMultStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityMultStageIdL0Accept : Bool :=
  (checkNamedSurface (parityMultTermSurfaceFrom
      hostModuleCheckBadParityMultStageIdText)
    parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- L0/L1 still accept PM2 when tokens present.
    Greppable: hostModuleCheckBadParityMultReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityMultReadyL0Accept : Bool :=
  (checkNamedSurface (parityMultTermSurfaceFrom
      hostModuleCheckBadParityMultReadyText)
    parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- L0/L1 still accept PM3 when tokens present.
    Greppable: hostModuleCheckBadParityMultOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityMultOkL0Accept : Bool :=
  (checkNamedSurface (parityMultTermSurfaceFrom
      hostModuleCheckBadParityMultOkText)
    parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- L0/L1 still accept PM4 when tokens present.
    Greppable: hostModuleCheckBadParityMultGradeL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadParityMultGradeL0Accept : Bool :=
  (checkNamedSurface (parityMultTermSurfaceFrom
      hostModuleCheckBadParityMultGradeText)
    parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckParityMultTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckParityMultTermDialectOk : Bool :=
  (checkParityMultTermDialect hostModuleCheckGoodParityMultTermText).isNone

/-- Dialect rejects PM1.
    Greppable: hostModuleCheckBadParityMultStageIdDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityMultStageIdDialectReject : Bool :=
  match checkParityMultTermDialect hostModuleCheckBadParityMultStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PM2.
    Greppable: hostModuleCheckBadParityMultReadyDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityMultReadyDialectReject : Bool :=
  match checkParityMultTermDialect hostModuleCheckBadParityMultReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PM3.
    Greppable: hostModuleCheckBadParityMultOkDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityMultOkDialectReject : Bool :=
  match checkParityMultTermDialect hostModuleCheckBadParityMultOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PM4.
    Greppable: hostModuleCheckBadParityMultGradeDialectReject, TERM-SURFACE. -/
def hostModuleCheckBadParityMultGradeDialectReject : Bool :=
  match checkParityMultTermDialect hostModuleCheckBadParityMultGradeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined ParityMult L2 dual-pin (good + PM1..PM4 rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckParityMultTermSurfaceOk, TERM-SURFACE, ParityMult-only. -/
def hostModuleCheckParityMultTermSurfaceOk : Bool :=
  hostModuleCheckParityMultTermSurfaceDualOk
    && (checkDepthParityMultTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthParityMultTermSurfaceScope == "ParityMult-only")
    && hostModuleCheckParityMultTermDialectOk
    && hostModuleCheckBadParityMultStageIdDialectReject
    && hostModuleCheckBadParityMultReadyDialectReject
    && hostModuleCheckBadParityMultOkDialectReject
    && hostModuleCheckBadParityMultGradeDialectReject
    && hostModuleCheckBadParityMultStageIdL0Accept
    && hostModuleCheckBadParityMultReadyL0Accept
    && hostModuleCheckBadParityMultOkL0Accept
    && hostModuleCheckBadParityMultGradeL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckParityMultTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckParityMultTermSurfaceOk_true :
    hostModuleCheckParityMultTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_parity_mult_term_surface_ids_eq :
    checkDepthParityMultTermSurfaceBar = "TERM-SURFACE"
      && checkDepthParityMultTermSurfaceScope = "ParityMult-only"
      && hostModuleCheckParityMultTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveParityMultTerm
