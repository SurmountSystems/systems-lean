/-
  SYSTEMS_LEAN_HOST partial -- EmitComposeScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitComposeScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitComposeScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_COMPOSE_V0".
  - hostEmitComposeId body "HOST-EMIT-COMPOSE".
  - selfHostEmitComposeId body "SELF-HOST-EMIT-COMPOSE".
  - emitComposeReady fail-closed compose emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitComposeOk definitional alias emitComposeReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitComposeScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitComposeScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitComposeScaffold is EmitComposeScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitComposeScaffoldTerm, TERM-SURFACE, EmitComposeScaffold-only,
  ILL-TYPED-TERM, checkEmitComposeScaffoldTermDialect,
  hostModuleCheckBadEmitComposeScaffoldStageIdText,
  hostModuleCheckBadEmitComposeScaffoldReadyText,
  hostModuleCheckBadEmitComposeScaffoldOkText,
  hostModuleCheckBadEmitComposeScaffoldContractText,
  hostModuleCheckEmitComposeScaffoldTermDialectOk,
  hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitComposeScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitComposeScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitComposeScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitComposeScaffold L2 term-surface dual-ok pins (EmitComposeScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitComposeScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitComposeScaffold-only. -/
def checkDepthEmitComposeScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitComposeScaffold.lean only.
    Greppable: checkDepthEmitComposeScaffoldTermSurfaceScope, EmitComposeScaffold-only. -/
def checkDepthEmitComposeScaffoldTermSurfaceScope : String := "EmitComposeScaffold-only"

/-- Dual-ok when EmitComposeScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitComposeScaffold-only. -/
def hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitComposeScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_COMPOSE_V0.
    Greppable: emitComposeScaffoldStageIdBodyOk, TERM-SURFACE, EmitComposeScaffold-only. -/
def emitComposeScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\""

/-- hostEmitComposeId body is HOST-EMIT-COMPOSE.
    Greppable: emitComposeScaffoldHostIdBodyOk, TERM-SURFACE, EmitComposeScaffold-only. -/
def emitComposeScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitComposeId" with
  | none => false
  | some body => body == "\"HOST-EMIT-COMPOSE\""

/-- selfHostEmitComposeId body is SELF-HOST-EMIT-COMPOSE.
    Greppable: emitComposeScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitComposeScaffold-only. -/
def emitComposeScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitComposeId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-COMPOSE\""

/-- emitComposeReady fail-closed compose.
    Greppable: emitComposeScaffoldReadyBodyOk, TERM-SURFACE, EmitComposeScaffold-only. -/
def emitComposeScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitComposeReady" with
  | none => false
  | some body =>
    body == "emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitComposeOk is definitional alias of emitComposeReady.
    Greppable: emitComposeScaffoldOkBodyOk, TERM-SURFACE, EmitComposeScaffold-only. -/
def emitComposeScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitComposeOk" with
  | none => false
  | some body => body == "emitComposeReady"

/-- EmitComposeScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitComposeScaffoldTermDialect, TERM-SURFACE,
    EmitComposeScaffold-only. -/
def checkEmitComposeScaffoldTermDialect (content : String) : Option String :=
  if !emitComposeScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitComposeScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitComposeScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitComposeScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitComposeScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitComposeScaffold L2 after a structural accept.
    Greppable: refineEmitComposeScaffoldWithTermSurface, TERM-SURFACE,
    EmitComposeScaffold-only. -/
def refineEmitComposeScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitComposeScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitComposeScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitCompose\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitCompose\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitComposeScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitComposeScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "def emitComposeSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitComposeReady : Bool :=\n" ++
  "  emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitComposeOk : Bool := emitComposeReady\n"

/-- Well-typed EmitComposeScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitComposeScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitComposeScaffoldTermText : String :=
  hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitComposeScaffoldTermGoodMid
    ++ hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitComposeScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitComposeScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldStageIdText : String :=
  hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "def emitComposeSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitComposeReady : Bool :=\n" ++
  "  emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitComposeOk : Bool := emitComposeReady\n" ++
  hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix

/-- E2: emitComposeReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitComposeScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldReadyText : String :=
  hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "def emitComposeSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitComposeReady : Bool := true\n" ++
  "def emitComposeOk : Bool := emitComposeReady\n" ++
  hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix

/-- E3: emitComposeOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitComposeScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldOkText : String :=
  hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "def emitComposeSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitComposeReady : Bool :=\n" ++
  "  emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitComposeOk : Bool := true\n" ++
  hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix

/-- E4: emitComposeReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitComposeScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldContractText : String :=
  hostModuleCheckEmitComposeScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "def emitComposeSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitComposeReady : Bool :=\n" ++
  "  emitComposeSurfaceOk && headerHonestyOk\n" ++
  "def emitComposeOk : Bool := emitComposeReady\n" ++
  hostModuleCheckEmitComposeScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitComposeScaffold twin text for L0 dual-pin. -/
def emitComposeScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitComposeScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitComposeScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitComposeScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitComposeScaffoldStageIdText)
    emitComposeExpectedNamespace emitComposeScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitComposeScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitComposeScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitComposeScaffoldReadyText)
    emitComposeExpectedNamespace emitComposeScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitComposeScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitComposeScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitComposeScaffoldOkText)
    emitComposeExpectedNamespace emitComposeScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitComposeScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitComposeScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitComposeScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitComposeScaffoldContractText)
    emitComposeExpectedNamespace emitComposeScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitComposeScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitComposeScaffoldTermDialectOk : Bool :=
  (checkEmitComposeScaffoldTermDialect
    hostModuleCheckGoodEmitComposeScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitComposeScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitComposeScaffoldStageIdDialectReject : Bool :=
  match checkEmitComposeScaffoldTermDialect
      hostModuleCheckBadEmitComposeScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitComposeScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitComposeScaffoldReadyDialectReject : Bool :=
  match checkEmitComposeScaffoldTermDialect
      hostModuleCheckBadEmitComposeScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitComposeScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitComposeScaffoldOkDialectReject : Bool :=
  match checkEmitComposeScaffoldTermDialect
      hostModuleCheckBadEmitComposeScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitComposeScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitComposeScaffoldContractDialectReject : Bool :=
  match checkEmitComposeScaffoldTermDialect
      hostModuleCheckBadEmitComposeScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitComposeScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitComposeScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitComposeScaffold-only. -/
def hostModuleCheckEmitComposeScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk
    && (checkDepthEmitComposeScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitComposeScaffoldTermSurfaceScope == "EmitComposeScaffold-only")
    && hostModuleCheckEmitComposeScaffoldTermDialectOk
    && hostModuleCheckBadEmitComposeScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitComposeScaffoldReadyDialectReject
    && hostModuleCheckBadEmitComposeScaffoldOkDialectReject
    && hostModuleCheckBadEmitComposeScaffoldContractDialectReject
    && hostModuleCheckBadEmitComposeScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitComposeScaffoldReadyL0Accept
    && hostModuleCheckBadEmitComposeScaffoldOkL0Accept
    && hostModuleCheckBadEmitComposeScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitComposeScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitComposeScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitComposeScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_compose_scaffold_term_surface_ids_eq :
    checkDepthEmitComposeScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitComposeScaffoldTermSurfaceScope = "EmitComposeScaffold-only"
      && hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
