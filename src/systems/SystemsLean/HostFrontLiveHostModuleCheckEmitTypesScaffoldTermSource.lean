/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitTypesScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitTypesScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitTypesScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitTypesScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM,
  liveHostModuleCheckEmitTypesScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitTypesScaffoldTerm.lean bytes.
    One part. Not split. 340 product lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitTypesScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM. -/
def liveHostModuleCheckEmitTypesScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitTypesScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitTypesScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitTypesScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_TYPES_V0".
  - hostEmitTypesId body "HOST-EMIT-TYPES".
  - selfHostEmitTypesId body "SELF-HOST-EMIT-TYPES".
  - emitTypesReady fail-closed compose emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitTypesOk definitional alias emitTypesReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitTypesScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitTypesScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitTypesScaffold is EmitTypesScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitTypesScaffoldTerm, TERM-SURFACE, EmitTypesScaffold-only,
  ILL-TYPED-TERM, checkEmitTypesScaffoldTermDialect,
  hostModuleCheckBadEmitTypesScaffoldStageIdText,
  hostModuleCheckBadEmitTypesScaffoldReadyText,
  hostModuleCheckBadEmitTypesScaffoldOkText,
  hostModuleCheckBadEmitTypesScaffoldContractText,
  hostModuleCheckEmitTypesScaffoldTermDialectOk,
  hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitTypesScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitTypesScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitTypesScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitTypesScaffold L2 term-surface dual-ok pins (EmitTypesScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitTypesScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitTypesScaffold-only. -/
def checkDepthEmitTypesScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitTypesScaffold.lean only.
    Greppable: checkDepthEmitTypesScaffoldTermSurfaceScope, EmitTypesScaffold-only. -/
def checkDepthEmitTypesScaffoldTermSurfaceScope : String := "EmitTypesScaffold-only"

/-- Dual-ok when EmitTypesScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitTypesScaffold-only. -/
def hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitTypesScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_TYPES_V0.
    Greppable: emitTypesScaffoldStageIdBodyOk, TERM-SURFACE, EmitTypesScaffold-only. -/
def emitTypesScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_TYPES_V0\""

/-- hostEmitTypesId body is HOST-EMIT-TYPES.
    Greppable: emitTypesScaffoldHostIdBodyOk, TERM-SURFACE, EmitTypesScaffold-only. -/
def emitTypesScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitTypesId" with
  | none => false
  | some body => body == "\"HOST-EMIT-TYPES\""

/-- selfHostEmitTypesId body is SELF-HOST-EMIT-TYPES.
    Greppable: emitTypesScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitTypesScaffold-only. -/
def emitTypesScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitTypesId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-TYPES\""

/-- emitTypesReady fail-closed compose.
    Greppable: emitTypesScaffoldReadyBodyOk, TERM-SURFACE, EmitTypesScaffold-only. -/
def emitTypesScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitTypesReady" with
  | none => false
  | some body =>
    body == "emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitTypesOk is definitional alias of emitTypesReady.
    Greppable: emitTypesScaffoldOkBodyOk, TERM-SURFACE, EmitTypesScaffold-only. -/
def emitTypesScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitTypesOk" with
  | none => false
  | some body => body == "emitTypesReady"

/-- EmitTypesScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitTypesScaffoldTermDialect, TERM-SURFACE,
    EmitTypesScaffold-only. -/
def checkEmitTypesScaffoldTermDialect (content : String) : Option String :=
  if !emitTypesScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitTypesScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitTypesScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitTypesScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitTypesScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitTypesScaffold L2 after a structural accept.
    Greppable: refineEmitTypesScaffoldWithTermSurface, TERM-SURFACE,
    EmitTypesScaffold-only. -/
def refineEmitTypesScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitTypesScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitTypesScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitTypes\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitTypes\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitTypesScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitTypesScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_TYPES_V0\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "def emitTypesSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitTypesReady : Bool :=\n" ++
  "  emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitTypesOk : Bool := emitTypesReady\n"

/-- Well-typed EmitTypesScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitTypesScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitTypesScaffoldTermText : String :=
  hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitTypesScaffoldTermGoodMid
    ++ hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitTypesScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitTypesScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldStageIdText : String :=
  hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "def emitTypesSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitTypesReady : Bool :=\n" ++
  "  emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitTypesOk : Bool := emitTypesReady\n" ++
  hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix

/-- E2: emitTypesReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitTypesScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldReadyText : String :=
  hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_TYPES_V0\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "def emitTypesSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitTypesReady : Bool := true\n" ++
  "def emitTypesOk : Bool := emitTypesReady\n" ++
  hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix

/-- E3: emitTypesOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitTypesScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldOkText : String :=
  hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_TYPES_V0\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "def emitTypesSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitTypesReady : Bool :=\n" ++
  "  emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitTypesOk : Bool := true\n" ++
  hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix

/-- E4: emitTypesReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitTypesScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldContractText : String :=
  hostModuleCheckEmitTypesScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_TYPES_V0\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "def emitTypesSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitTypesReady : Bool :=\n" ++
  "  emitTypesSurfaceOk && headerHonestyOk\n" ++
  "def emitTypesOk : Bool := emitTypesReady\n" ++
  hostModuleCheckEmitTypesScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitTypesScaffold twin text for L0 dual-pin. -/
def emitTypesScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitTypesScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitTypesScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitTypesScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitTypesScaffoldStageIdText)
    emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitTypesScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitTypesScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitTypesScaffoldReadyText)
    emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitTypesScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitTypesScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitTypesScaffoldOkText)
    emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitTypesScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitTypesScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitTypesScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitTypesScaffoldContractText)
    emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitTypesScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitTypesScaffoldTermDialectOk : Bool :=
  (checkEmitTypesScaffoldTermDialect
    hostModuleCheckGoodEmitTypesScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitTypesScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitTypesScaffoldStageIdDialectReject : Bool :=
  match checkEmitTypesScaffoldTermDialect
      hostModuleCheckBadEmitTypesScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitTypesScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitTypesScaffoldReadyDialectReject : Bool :=
  match checkEmitTypesScaffoldTermDialect
      hostModuleCheckBadEmitTypesScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitTypesScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitTypesScaffoldOkDialectReject : Bool :=
  match checkEmitTypesScaffoldTermDialect
      hostModuleCheckBadEmitTypesScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitTypesScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitTypesScaffoldContractDialectReject : Bool :=
  match checkEmitTypesScaffoldTermDialect
      hostModuleCheckBadEmitTypesScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitTypesScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitTypesScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitTypesScaffold-only. -/
def hostModuleCheckEmitTypesScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk
    && (checkDepthEmitTypesScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitTypesScaffoldTermSurfaceScope == "EmitTypesScaffold-only")
    && hostModuleCheckEmitTypesScaffoldTermDialectOk
    && hostModuleCheckBadEmitTypesScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitTypesScaffoldReadyDialectReject
    && hostModuleCheckBadEmitTypesScaffoldOkDialectReject
    && hostModuleCheckBadEmitTypesScaffoldContractDialectReject
    && hostModuleCheckBadEmitTypesScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitTypesScaffoldReadyL0Accept
    && hostModuleCheckBadEmitTypesScaffoldOkL0Accept
    && hostModuleCheckBadEmitTypesScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitTypesScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitTypesScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitTypesScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_types_scaffold_term_surface_ids_eq :
    checkDepthEmitTypesScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitTypesScaffoldTermSurfaceScope = "EmitTypesScaffold-only"
      && hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm
