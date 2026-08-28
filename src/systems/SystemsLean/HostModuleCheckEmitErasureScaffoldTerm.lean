/-
  SYSTEMS_LEAN_HOST partial -- EmitErasureScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitErasureScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitErasureScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_ERASURE_V0".
  - hostEmitErasureId body "HOST-EMIT-ERASURE".
  - selfHostEmitErasureId body "SELF-HOST-EMIT-ERASURE".
  - emitErasureReady fail-closed compose emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitErasureOk definitional alias emitErasureReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitErasureScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitErasureScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitErasureScaffold is EmitErasureScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitErasureScaffoldTerm, TERM-SURFACE, EmitErasureScaffold-only,
  ILL-TYPED-TERM, checkEmitErasureScaffoldTermDialect,
  hostModuleCheckBadEmitErasureScaffoldStageIdText,
  hostModuleCheckBadEmitErasureScaffoldReadyText,
  hostModuleCheckBadEmitErasureScaffoldOkText,
  hostModuleCheckBadEmitErasureScaffoldContractText,
  hostModuleCheckEmitErasureScaffoldTermDialectOk,
  hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitErasureScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitErasureScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitErasureScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitErasureScaffold L2 term-surface dual-ok pins (EmitErasureScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitErasureScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitErasureScaffold-only. -/
def checkDepthEmitErasureScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitErasureScaffold.lean only.
    Greppable: checkDepthEmitErasureScaffoldTermSurfaceScope, EmitErasureScaffold-only. -/
def checkDepthEmitErasureScaffoldTermSurfaceScope : String := "EmitErasureScaffold-only"

/-- Dual-ok when EmitErasureScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitErasureScaffold-only. -/
def hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitErasureScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_ERASURE_V0.
    Greppable: emitErasureScaffoldStageIdBodyOk, TERM-SURFACE, EmitErasureScaffold-only. -/
def emitErasureScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_ERASURE_V0\""

/-- hostEmitErasureId body is HOST-EMIT-ERASURE.
    Greppable: emitErasureScaffoldHostIdBodyOk, TERM-SURFACE, EmitErasureScaffold-only. -/
def emitErasureScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitErasureId" with
  | none => false
  | some body => body == "\"HOST-EMIT-ERASURE\""

/-- selfHostEmitErasureId body is SELF-HOST-EMIT-ERASURE.
    Greppable: emitErasureScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitErasureScaffold-only. -/
def emitErasureScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitErasureId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-ERASURE\""

/-- emitErasureReady fail-closed compose.
    Greppable: emitErasureScaffoldReadyBodyOk, TERM-SURFACE, EmitErasureScaffold-only. -/
def emitErasureScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitErasureReady" with
  | none => false
  | some body =>
    body == "emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitErasureOk is definitional alias of emitErasureReady.
    Greppable: emitErasureScaffoldOkBodyOk, TERM-SURFACE, EmitErasureScaffold-only. -/
def emitErasureScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitErasureOk" with
  | none => false
  | some body => body == "emitErasureReady"

/-- EmitErasureScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitErasureScaffoldTermDialect, TERM-SURFACE,
    EmitErasureScaffold-only. -/
def checkEmitErasureScaffoldTermDialect (content : String) : Option String :=
  if !emitErasureScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitErasureScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitErasureScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitErasureScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitErasureScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitErasureScaffold L2 after a structural accept.
    Greppable: refineEmitErasureScaffoldWithTermSurface, TERM-SURFACE,
    EmitErasureScaffold-only. -/
def refineEmitErasureScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitErasureScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitErasureScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitErasure\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitErasure\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitErasureScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitErasureScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "def emitErasureSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitErasureReady : Bool :=\n" ++
  "  emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitErasureOk : Bool := emitErasureReady\n"

/-- Well-typed EmitErasureScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitErasureScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitErasureScaffoldTermText : String :=
  hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitErasureScaffoldTermGoodMid
    ++ hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitErasureScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitErasureScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldStageIdText : String :=
  hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "def emitErasureSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitErasureReady : Bool :=\n" ++
  "  emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitErasureOk : Bool := emitErasureReady\n" ++
  hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix

/-- E2: emitErasureReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitErasureScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldReadyText : String :=
  hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "def emitErasureSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitErasureReady : Bool := true\n" ++
  "def emitErasureOk : Bool := emitErasureReady\n" ++
  hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix

/-- E3: emitErasureOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitErasureScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldOkText : String :=
  hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "def emitErasureSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitErasureReady : Bool :=\n" ++
  "  emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitErasureOk : Bool := true\n" ++
  hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix

/-- E4: emitErasureReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitErasureScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldContractText : String :=
  hostModuleCheckEmitErasureScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "def emitErasureSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitErasureReady : Bool :=\n" ++
  "  emitErasureSurfaceOk && headerHonestyOk\n" ++
  "def emitErasureOk : Bool := emitErasureReady\n" ++
  hostModuleCheckEmitErasureScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitErasureScaffold twin text for L0 dual-pin. -/
def emitErasureScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitErasureScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitErasureScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitErasureScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitErasureScaffoldStageIdText)
    emitErasureExpectedNamespace emitErasureScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitErasureScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitErasureScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitErasureScaffoldReadyText)
    emitErasureExpectedNamespace emitErasureScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitErasureScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitErasureScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitErasureScaffoldOkText)
    emitErasureExpectedNamespace emitErasureScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitErasureScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitErasureScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitErasureScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitErasureScaffoldContractText)
    emitErasureExpectedNamespace emitErasureScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitErasureScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitErasureScaffoldTermDialectOk : Bool :=
  (checkEmitErasureScaffoldTermDialect
    hostModuleCheckGoodEmitErasureScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitErasureScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitErasureScaffoldStageIdDialectReject : Bool :=
  match checkEmitErasureScaffoldTermDialect
      hostModuleCheckBadEmitErasureScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitErasureScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitErasureScaffoldReadyDialectReject : Bool :=
  match checkEmitErasureScaffoldTermDialect
      hostModuleCheckBadEmitErasureScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitErasureScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitErasureScaffoldOkDialectReject : Bool :=
  match checkEmitErasureScaffoldTermDialect
      hostModuleCheckBadEmitErasureScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitErasureScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitErasureScaffoldContractDialectReject : Bool :=
  match checkEmitErasureScaffoldTermDialect
      hostModuleCheckBadEmitErasureScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitErasureScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitErasureScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitErasureScaffold-only. -/
def hostModuleCheckEmitErasureScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk
    && (checkDepthEmitErasureScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitErasureScaffoldTermSurfaceScope == "EmitErasureScaffold-only")
    && hostModuleCheckEmitErasureScaffoldTermDialectOk
    && hostModuleCheckBadEmitErasureScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitErasureScaffoldReadyDialectReject
    && hostModuleCheckBadEmitErasureScaffoldOkDialectReject
    && hostModuleCheckBadEmitErasureScaffoldContractDialectReject
    && hostModuleCheckBadEmitErasureScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitErasureScaffoldReadyL0Accept
    && hostModuleCheckBadEmitErasureScaffoldOkL0Accept
    && hostModuleCheckBadEmitErasureScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitErasureScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitErasureScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitErasureScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_erasure_scaffold_term_surface_ids_eq :
    checkDepthEmitErasureScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitErasureScaffoldTermSurfaceScope = "EmitErasureScaffold-only"
      && hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
