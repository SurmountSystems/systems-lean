/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitMultScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitMultScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitMultScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitMultScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITMULTSCAFFOLDTERM,
  liveHostModuleCheckEmitMultScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITMULTSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitMultScaffoldTerm.lean bytes.
    One part. Not split. 347 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitMultScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITMULTSCAFFOLDTERM. -/
def liveHostModuleCheckEmitMultScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitMultScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitMultScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitMultScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_MULT_V0".
  - hostEmitMultId body "HOST-EMIT-MULT".
  - selfHostEmitMultId body "SELF-HOST-EMIT-MULT".
  - emitMultReady fail-closed compose emitMultSurfaceOk && gradeNamesOk &&
    headerHonestyOk && bodyHonestyOk.
  - emitMultOk definitional alias emitMultReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitMultScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitMultScaffoldTermSurfaceOk (E-good dialect +
    EM1..EM4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitMultScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitMultScaffold is EmitMultScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitMultScaffoldTerm, TERM-SURFACE, EmitMultScaffold-only,
  ILL-TYPED-TERM, checkEmitMultScaffoldTermDialect,
  hostModuleCheckBadEmitMultScaffoldStageIdText,
  hostModuleCheckBadEmitMultScaffoldReadyText,
  hostModuleCheckBadEmitMultScaffoldOkText,
  hostModuleCheckBadEmitMultScaffoldContractText,
  hostModuleCheckEmitMultScaffoldTermDialectOk,
  hostModuleCheckEmitMultScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitMultScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitMultScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitMultScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitMultScaffold L2 term-surface dual-ok pins (EmitMultScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitMultScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitMultScaffold-only. -/
def checkDepthEmitMultScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitMultScaffold.lean only.
    Greppable: checkDepthEmitMultScaffoldTermSurfaceScope, EmitMultScaffold-only. -/
def checkDepthEmitMultScaffoldTermSurfaceScope : String := "EmitMultScaffold-only"

/-- Dual-ok when EmitMultScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitMultScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitMultScaffold-only. -/
def hostModuleCheckEmitMultScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitMultScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_MULT_V0.
    Greppable: emitMultScaffoldStageIdBodyOk, TERM-SURFACE, EmitMultScaffold-only. -/
def emitMultScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_MULT_V0\""

/-- hostEmitMultId body is HOST-EMIT-MULT.
    Greppable: emitMultScaffoldHostIdBodyOk, TERM-SURFACE, EmitMultScaffold-only. -/
def emitMultScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitMultId" with
  | none => false
  | some body => body == "\"HOST-EMIT-MULT\""

/-- selfHostEmitMultId body is SELF-HOST-EMIT-MULT.
    Greppable: emitMultScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitMultScaffold-only. -/
def emitMultScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitMultId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-MULT\""

/-- emitMultReady fail-closed surface+grade+header+body compose.
    Greppable: emitMultScaffoldReadyBodyOk, TERM-SURFACE, EmitMultScaffold-only. -/
def emitMultScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitMultReady" with
  | none => false
  | some body =>
    body == "emitMultSurfaceOk && gradeNamesOk && headerHonestyOk && bodyHonestyOk"

/-- emitMultOk is definitional alias of emitMultReady.
    Greppable: emitMultScaffoldOkBodyOk, TERM-SURFACE, EmitMultScaffold-only. -/
def emitMultScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitMultOk" with
  | none => false
  | some body => body == "emitMultReady"

/-- EmitMultScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitMultScaffoldTermDialect, TERM-SURFACE,
    EmitMultScaffold-only. -/
def checkEmitMultScaffoldTermDialect (content : String) : Option String :=
  if !emitMultScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitMultScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitMultScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitMultScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitMultScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitMultScaffold L2 after a structural accept.
    Greppable: refineEmitMultScaffoldWithTermSurface, TERM-SURFACE,
    EmitMultScaffold-only. -/
def refineEmitMultScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitMultScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitMultScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix (import Mult required by L0).
    Greppable: hostModuleCheckEmitMultScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitMultScaffoldTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.EmitMult\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitMultScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitMultScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitMult\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitMultScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitMultScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_MULT_V0\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "def emitMultSurfaceOk : Bool := true\n" ++
  "def gradeNamesOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitMultReady : Bool :=\n" ++
  "  emitMultSurfaceOk && gradeNamesOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitMultOk : Bool := emitMultReady\n"

/-- Well-typed EmitMultScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitMultScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitMultScaffoldTermText : String :=
  hostModuleCheckEmitMultScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitMultScaffoldTermGoodMid
    ++ hostModuleCheckEmitMultScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitMultScaffold twins (L0 tokens present; L2 must reject). -/

/-- EM1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitMultScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldStageIdText : String :=
  hostModuleCheckEmitMultScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "def emitMultSurfaceOk : Bool := true\n" ++
  "def gradeNamesOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitMultReady : Bool :=\n" ++
  "  emitMultSurfaceOk && gradeNamesOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitMultOk : Bool := emitMultReady\n" ++
  hostModuleCheckEmitMultScaffoldTermSkeletonSuffix

/-- EM2: emitMultReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitMultScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldReadyText : String :=
  hostModuleCheckEmitMultScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_MULT_V0\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "def emitMultSurfaceOk : Bool := true\n" ++
  "def gradeNamesOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitMultReady : Bool := true\n" ++
  "def emitMultOk : Bool := emitMultReady\n" ++
  hostModuleCheckEmitMultScaffoldTermSkeletonSuffix

/-- EM3: emitMultOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitMultScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldOkText : String :=
  hostModuleCheckEmitMultScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_MULT_V0\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "def emitMultSurfaceOk : Bool := true\n" ++
  "def gradeNamesOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitMultReady : Bool :=\n" ++
  "  emitMultSurfaceOk && gradeNamesOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitMultOk : Bool := true\n" ++
  hostModuleCheckEmitMultScaffoldTermSkeletonSuffix

/-- EM4: emitMultReady drops gradeNamesOk (contract fail-closed).
    Greppable: hostModuleCheckBadEmitMultScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldContractText : String :=
  hostModuleCheckEmitMultScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_MULT_V0\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "def emitMultSurfaceOk : Bool := true\n" ++
  "def gradeNamesOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitMultReady : Bool :=\n" ++
  "  emitMultSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitMultOk : Bool := emitMultReady\n" ++
  hostModuleCheckEmitMultScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitMultScaffold twin text for L0 dual-pin. -/
def emitMultScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitMultScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept EM1 when tokens present.
    Greppable: hostModuleCheckBadEmitMultScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitMultScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitMultScaffoldStageIdText)
    emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept EM2 when tokens present.
    Greppable: hostModuleCheckBadEmitMultScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitMultScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitMultScaffoldReadyText)
    emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept EM3 when tokens present.
    Greppable: hostModuleCheckBadEmitMultScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitMultScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitMultScaffoldOkText)
    emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")).isAccept

/-- L0/L1 still accept EM4 when tokens present.
    Greppable: hostModuleCheckBadEmitMultScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitMultScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitMultScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitMultScaffoldContractText)
    emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitMultScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitMultScaffoldTermDialectOk : Bool :=
  (checkEmitMultScaffoldTermDialect
    hostModuleCheckGoodEmitMultScaffoldTermText).isNone

/-- Dialect rejects EM1.
    Greppable: hostModuleCheckBadEmitMultScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitMultScaffoldStageIdDialectReject : Bool :=
  match checkEmitMultScaffoldTermDialect
      hostModuleCheckBadEmitMultScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EM2.
    Greppable: hostModuleCheckBadEmitMultScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitMultScaffoldReadyDialectReject : Bool :=
  match checkEmitMultScaffoldTermDialect
      hostModuleCheckBadEmitMultScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EM3.
    Greppable: hostModuleCheckBadEmitMultScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitMultScaffoldOkDialectReject : Bool :=
  match checkEmitMultScaffoldTermDialect
      hostModuleCheckBadEmitMultScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects EM4.
    Greppable: hostModuleCheckBadEmitMultScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitMultScaffoldContractDialectReject : Bool :=
  match checkEmitMultScaffoldTermDialect
      hostModuleCheckBadEmitMultScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitMultScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitMultScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitMultScaffold-only. -/
def hostModuleCheckEmitMultScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitMultScaffoldTermSurfaceDualOk
    && (checkDepthEmitMultScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitMultScaffoldTermSurfaceScope == "EmitMultScaffold-only")
    && hostModuleCheckEmitMultScaffoldTermDialectOk
    && hostModuleCheckBadEmitMultScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitMultScaffoldReadyDialectReject
    && hostModuleCheckBadEmitMultScaffoldOkDialectReject
    && hostModuleCheckBadEmitMultScaffoldContractDialectReject
    && hostModuleCheckBadEmitMultScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitMultScaffoldReadyL0Accept
    && hostModuleCheckBadEmitMultScaffoldOkL0Accept
    && hostModuleCheckBadEmitMultScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitMultScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitMultScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitMultScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_mult_scaffold_term_surface_ids_eq :
    checkDepthEmitMultScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitMultScaffoldTermSurfaceScope = "EmitMultScaffold-only"
      && hostModuleCheckEmitMultScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm
