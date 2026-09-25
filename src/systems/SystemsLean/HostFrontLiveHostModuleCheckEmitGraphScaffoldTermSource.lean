/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitGraphScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitGraphScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitGraphScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitGraphScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM,
  liveHostModuleCheckEmitGraphScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitGraphScaffoldTerm.lean bytes.
    One part. Not split. 340 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitGraphScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM. -/
def liveHostModuleCheckEmitGraphScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitGraphScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitGraphScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitGraphScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_GRAPH_V0".
  - hostEmitGraphId body "HOST-EMIT-GRAPH".
  - selfHostEmitGraphId body "SELF-HOST-EMIT-GRAPH".
  - emitGraphReady fail-closed compose emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitGraphOk definitional alias emitGraphReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitGraphScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitGraphScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitGraphScaffold is EmitGraphScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitGraphScaffoldTerm, TERM-SURFACE, EmitGraphScaffold-only,
  ILL-TYPED-TERM, checkEmitGraphScaffoldTermDialect,
  hostModuleCheckBadEmitGraphScaffoldStageIdText,
  hostModuleCheckBadEmitGraphScaffoldReadyText,
  hostModuleCheckBadEmitGraphScaffoldOkText,
  hostModuleCheckBadEmitGraphScaffoldContractText,
  hostModuleCheckEmitGraphScaffoldTermDialectOk,
  hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitGraphScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitGraphScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitGraphScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitGraphScaffold L2 term-surface dual-ok pins (EmitGraphScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitGraphScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitGraphScaffold-only. -/
def checkDepthEmitGraphScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitGraphScaffold.lean only.
    Greppable: checkDepthEmitGraphScaffoldTermSurfaceScope, EmitGraphScaffold-only. -/
def checkDepthEmitGraphScaffoldTermSurfaceScope : String := "EmitGraphScaffold-only"

/-- Dual-ok when EmitGraphScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitGraphScaffold-only. -/
def hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitGraphScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_GRAPH_V0.
    Greppable: emitGraphScaffoldStageIdBodyOk, TERM-SURFACE, EmitGraphScaffold-only. -/
def emitGraphScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_GRAPH_V0\""

/-- hostEmitGraphId body is HOST-EMIT-GRAPH.
    Greppable: emitGraphScaffoldHostIdBodyOk, TERM-SURFACE, EmitGraphScaffold-only. -/
def emitGraphScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitGraphId" with
  | none => false
  | some body => body == "\"HOST-EMIT-GRAPH\""

/-- selfHostEmitGraphId body is SELF-HOST-EMIT-GRAPH.
    Greppable: emitGraphScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitGraphScaffold-only. -/
def emitGraphScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitGraphId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-GRAPH\""

/-- emitGraphReady fail-closed compose.
    Greppable: emitGraphScaffoldReadyBodyOk, TERM-SURFACE, EmitGraphScaffold-only. -/
def emitGraphScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitGraphReady" with
  | none => false
  | some body =>
    body == "emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitGraphOk is definitional alias of emitGraphReady.
    Greppable: emitGraphScaffoldOkBodyOk, TERM-SURFACE, EmitGraphScaffold-only. -/
def emitGraphScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitGraphOk" with
  | none => false
  | some body => body == "emitGraphReady"

/-- EmitGraphScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitGraphScaffoldTermDialect, TERM-SURFACE,
    EmitGraphScaffold-only. -/
def checkEmitGraphScaffoldTermDialect (content : String) : Option String :=
  if !emitGraphScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitGraphScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitGraphScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitGraphScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitGraphScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitGraphScaffold L2 after a structural accept.
    Greppable: refineEmitGraphScaffoldWithTermSurface, TERM-SURFACE,
    EmitGraphScaffold-only. -/
def refineEmitGraphScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitGraphScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitGraphScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitGraph\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitGraph\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitGraphScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitGraphScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "def emitGraphSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitGraphReady : Bool :=\n" ++
  "  emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitGraphOk : Bool := emitGraphReady\n"

/-- Well-typed EmitGraphScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitGraphScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitGraphScaffoldTermText : String :=
  hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitGraphScaffoldTermGoodMid
    ++ hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitGraphScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitGraphScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldStageIdText : String :=
  hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "def emitGraphSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitGraphReady : Bool :=\n" ++
  "  emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitGraphOk : Bool := emitGraphReady\n" ++
  hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix

/-- E2: emitGraphReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitGraphScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldReadyText : String :=
  hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "def emitGraphSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitGraphReady : Bool := true\n" ++
  "def emitGraphOk : Bool := emitGraphReady\n" ++
  hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix

/-- E3: emitGraphOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitGraphScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldOkText : String :=
  hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "def emitGraphSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitGraphReady : Bool :=\n" ++
  "  emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitGraphOk : Bool := true\n" ++
  hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix

/-- E4: emitGraphReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitGraphScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldContractText : String :=
  hostModuleCheckEmitGraphScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "def emitGraphSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitGraphReady : Bool :=\n" ++
  "  emitGraphSurfaceOk && headerHonestyOk\n" ++
  "def emitGraphOk : Bool := emitGraphReady\n" ++
  hostModuleCheckEmitGraphScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitGraphScaffold twin text for L0 dual-pin. -/
def emitGraphScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitGraphScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitGraphScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitGraphScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitGraphScaffoldStageIdText)
    emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitGraphScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitGraphScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitGraphScaffoldReadyText)
    emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitGraphScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitGraphScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitGraphScaffoldOkText)
    emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitGraphScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitGraphScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitGraphScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitGraphScaffoldContractText)
    emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitGraphScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitGraphScaffoldTermDialectOk : Bool :=
  (checkEmitGraphScaffoldTermDialect
    hostModuleCheckGoodEmitGraphScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitGraphScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitGraphScaffoldStageIdDialectReject : Bool :=
  match checkEmitGraphScaffoldTermDialect
      hostModuleCheckBadEmitGraphScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitGraphScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitGraphScaffoldReadyDialectReject : Bool :=
  match checkEmitGraphScaffoldTermDialect
      hostModuleCheckBadEmitGraphScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitGraphScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitGraphScaffoldOkDialectReject : Bool :=
  match checkEmitGraphScaffoldTermDialect
      hostModuleCheckBadEmitGraphScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitGraphScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitGraphScaffoldContractDialectReject : Bool :=
  match checkEmitGraphScaffoldTermDialect
      hostModuleCheckBadEmitGraphScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitGraphScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitGraphScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitGraphScaffold-only. -/
def hostModuleCheckEmitGraphScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk
    && (checkDepthEmitGraphScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitGraphScaffoldTermSurfaceScope == "EmitGraphScaffold-only")
    && hostModuleCheckEmitGraphScaffoldTermDialectOk
    && hostModuleCheckBadEmitGraphScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitGraphScaffoldReadyDialectReject
    && hostModuleCheckBadEmitGraphScaffoldOkDialectReject
    && hostModuleCheckBadEmitGraphScaffoldContractDialectReject
    && hostModuleCheckBadEmitGraphScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitGraphScaffoldReadyL0Accept
    && hostModuleCheckBadEmitGraphScaffoldOkL0Accept
    && hostModuleCheckBadEmitGraphScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitGraphScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitGraphScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitGraphScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_graph_scaffold_term_surface_ids_eq :
    checkDepthEmitGraphScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitGraphScaffoldTermSurfaceScope = "EmitGraphScaffold-only"
      && hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm
