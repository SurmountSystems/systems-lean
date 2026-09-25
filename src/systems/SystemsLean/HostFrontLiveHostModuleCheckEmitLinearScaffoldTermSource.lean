/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitLinearScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitLinearScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitLinearScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitLinearScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM,
  liveHostModuleCheckEmitLinearScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitLinearScaffoldTerm.lean bytes.
    One part. Not split. 340 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitLinearScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM. -/
def liveHostModuleCheckEmitLinearScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitLinearScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitLinearScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitLinearScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_LINEAR_V0".
  - hostEmitLinearId body "HOST-EMIT-LINEAR".
  - selfHostEmitLinearId body "SELF-HOST-EMIT-LINEAR".
  - emitLinearReady fail-closed compose emitLinearSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitLinearOk definitional alias emitLinearReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitLinearScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitLinearScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitLinearScaffold is EmitLinearScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitLinearScaffoldTerm, TERM-SURFACE, EmitLinearScaffold-only,
  ILL-TYPED-TERM, checkEmitLinearScaffoldTermDialect,
  hostModuleCheckBadEmitLinearScaffoldStageIdText,
  hostModuleCheckBadEmitLinearScaffoldReadyText,
  hostModuleCheckBadEmitLinearScaffoldOkText,
  hostModuleCheckBadEmitLinearScaffoldContractText,
  hostModuleCheckEmitLinearScaffoldTermDialectOk,
  hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitLinearScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitLinearScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitLinearScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitLinearScaffold L2 term-surface dual-ok pins (EmitLinearScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitLinearScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitLinearScaffold-only. -/
def checkDepthEmitLinearScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitLinearScaffold.lean only.
    Greppable: checkDepthEmitLinearScaffoldTermSurfaceScope, EmitLinearScaffold-only. -/
def checkDepthEmitLinearScaffoldTermSurfaceScope : String := "EmitLinearScaffold-only"

/-- Dual-ok when EmitLinearScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitLinearScaffold-only. -/
def hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitLinearScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_LINEAR_V0.
    Greppable: emitLinearScaffoldStageIdBodyOk, TERM-SURFACE, EmitLinearScaffold-only. -/
def emitLinearScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_LINEAR_V0\""

/-- hostEmitLinearId body is HOST-EMIT-LINEAR.
    Greppable: emitLinearScaffoldHostIdBodyOk, TERM-SURFACE, EmitLinearScaffold-only. -/
def emitLinearScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitLinearId" with
  | none => false
  | some body => body == "\"HOST-EMIT-LINEAR\""

/-- selfHostEmitLinearId body is SELF-HOST-EMIT-LINEAR.
    Greppable: emitLinearScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitLinearScaffold-only. -/
def emitLinearScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitLinearId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-LINEAR\""

/-- emitLinearReady fail-closed compose.
    Greppable: emitLinearScaffoldReadyBodyOk, TERM-SURFACE, EmitLinearScaffold-only. -/
def emitLinearScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitLinearReady" with
  | none => false
  | some body =>
    body == "emitLinearSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitLinearOk is definitional alias of emitLinearReady.
    Greppable: emitLinearScaffoldOkBodyOk, TERM-SURFACE, EmitLinearScaffold-only. -/
def emitLinearScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitLinearOk" with
  | none => false
  | some body => body == "emitLinearReady"

/-- EmitLinearScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitLinearScaffoldTermDialect, TERM-SURFACE,
    EmitLinearScaffold-only. -/
def checkEmitLinearScaffoldTermDialect (content : String) : Option String :=
  if !emitLinearScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitLinearScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitLinearScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitLinearScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitLinearScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitLinearScaffold L2 after a structural accept.
    Greppable: refineEmitLinearScaffoldWithTermSurface, TERM-SURFACE,
    EmitLinearScaffold-only. -/
def refineEmitLinearScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitLinearScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitLinearScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitLinear\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitLinear\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitLinearScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitLinearScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "def emitLinearSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitLinearReady : Bool :=\n" ++
  "  emitLinearSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitLinearOk : Bool := emitLinearReady\n"

/-- Well-typed EmitLinearScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitLinearScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitLinearScaffoldTermText : String :=
  hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitLinearScaffoldTermGoodMid
    ++ hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitLinearScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitLinearScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldStageIdText : String :=
  hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "def emitLinearSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitLinearReady : Bool :=\n" ++
  "  emitLinearSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitLinearOk : Bool := emitLinearReady\n" ++
  hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix

/-- E2: emitLinearReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitLinearScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldReadyText : String :=
  hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "def emitLinearSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitLinearReady : Bool := true\n" ++
  "def emitLinearOk : Bool := emitLinearReady\n" ++
  hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix

/-- E3: emitLinearOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitLinearScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldOkText : String :=
  hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "def emitLinearSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitLinearReady : Bool :=\n" ++
  "  emitLinearSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitLinearOk : Bool := true\n" ++
  hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix

/-- E4: emitLinearReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitLinearScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldContractText : String :=
  hostModuleCheckEmitLinearScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "def emitLinearSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitLinearReady : Bool :=\n" ++
  "  emitLinearSurfaceOk && headerHonestyOk\n" ++
  "def emitLinearOk : Bool := emitLinearReady\n" ++
  hostModuleCheckEmitLinearScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitLinearScaffold twin text for L0 dual-pin. -/
def emitLinearScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitLinearScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitLinearScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitLinearScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitLinearScaffoldStageIdText)
    emitLinearExpectedNamespace emitLinearScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitLinearScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitLinearScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitLinearScaffoldReadyText)
    emitLinearExpectedNamespace emitLinearScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitLinearScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitLinearScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitLinearScaffoldOkText)
    emitLinearExpectedNamespace emitLinearScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitLinearScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitLinearScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitLinearScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitLinearScaffoldContractText)
    emitLinearExpectedNamespace emitLinearScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitLinearScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitLinearScaffoldTermDialectOk : Bool :=
  (checkEmitLinearScaffoldTermDialect
    hostModuleCheckGoodEmitLinearScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitLinearScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitLinearScaffoldStageIdDialectReject : Bool :=
  match checkEmitLinearScaffoldTermDialect
      hostModuleCheckBadEmitLinearScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitLinearScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitLinearScaffoldReadyDialectReject : Bool :=
  match checkEmitLinearScaffoldTermDialect
      hostModuleCheckBadEmitLinearScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitLinearScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitLinearScaffoldOkDialectReject : Bool :=
  match checkEmitLinearScaffoldTermDialect
      hostModuleCheckBadEmitLinearScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitLinearScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitLinearScaffoldContractDialectReject : Bool :=
  match checkEmitLinearScaffoldTermDialect
      hostModuleCheckBadEmitLinearScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitLinearScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitLinearScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitLinearScaffold-only. -/
def hostModuleCheckEmitLinearScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk
    && (checkDepthEmitLinearScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitLinearScaffoldTermSurfaceScope == "EmitLinearScaffold-only")
    && hostModuleCheckEmitLinearScaffoldTermDialectOk
    && hostModuleCheckBadEmitLinearScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitLinearScaffoldReadyDialectReject
    && hostModuleCheckBadEmitLinearScaffoldOkDialectReject
    && hostModuleCheckBadEmitLinearScaffoldContractDialectReject
    && hostModuleCheckBadEmitLinearScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitLinearScaffoldReadyL0Accept
    && hostModuleCheckBadEmitLinearScaffoldOkL0Accept
    && hostModuleCheckBadEmitLinearScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitLinearScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitLinearScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitLinearScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_linear_scaffold_term_surface_ids_eq :
    checkDepthEmitLinearScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitLinearScaffoldTermSurfaceScope = "EmitLinearScaffold-only"
      && hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm
