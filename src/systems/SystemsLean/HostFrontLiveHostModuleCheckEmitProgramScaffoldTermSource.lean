/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitProgramScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitProgramScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitProgramScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitProgramScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM,
  liveHostModuleCheckEmitProgramScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitProgramScaffoldTerm.lean bytes.
    One part. Not split. 340 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitProgramScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM. -/
def liveHostModuleCheckEmitProgramScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitProgramScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitProgramScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitProgramScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_PROGRAM_V0".
  - hostEmitProgramId body "HOST-EMIT-PROGRAM".
  - selfHostEmitProgramId body "SELF-HOST-EMIT-PROGRAM".
  - emitProgramReady fail-closed compose emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitProgramOk definitional alias emitProgramReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitProgramScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitProgramScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitProgramScaffold is EmitProgramScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitProgramScaffoldTerm, TERM-SURFACE, EmitProgramScaffold-only,
  ILL-TYPED-TERM, checkEmitProgramScaffoldTermDialect,
  hostModuleCheckBadEmitProgramScaffoldStageIdText,
  hostModuleCheckBadEmitProgramScaffoldReadyText,
  hostModuleCheckBadEmitProgramScaffoldOkText,
  hostModuleCheckBadEmitProgramScaffoldContractText,
  hostModuleCheckEmitProgramScaffoldTermDialectOk,
  hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitProgramScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitProgramScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitProgramScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitProgramScaffold L2 term-surface dual-ok pins (EmitProgramScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitProgramScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitProgramScaffold-only. -/
def checkDepthEmitProgramScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitProgramScaffold.lean only.
    Greppable: checkDepthEmitProgramScaffoldTermSurfaceScope, EmitProgramScaffold-only. -/
def checkDepthEmitProgramScaffoldTermSurfaceScope : String := "EmitProgramScaffold-only"

/-- Dual-ok when EmitProgramScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitProgramScaffold-only. -/
def hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitProgramScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_PROGRAM_V0.
    Greppable: emitProgramScaffoldStageIdBodyOk, TERM-SURFACE, EmitProgramScaffold-only. -/
def emitProgramScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\""

/-- hostEmitProgramId body is HOST-EMIT-PROGRAM.
    Greppable: emitProgramScaffoldHostIdBodyOk, TERM-SURFACE, EmitProgramScaffold-only. -/
def emitProgramScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitProgramId" with
  | none => false
  | some body => body == "\"HOST-EMIT-PROGRAM\""

/-- selfHostEmitProgramId body is SELF-HOST-EMIT-PROGRAM.
    Greppable: emitProgramScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitProgramScaffold-only. -/
def emitProgramScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitProgramId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-PROGRAM\""

/-- emitProgramReady fail-closed compose.
    Greppable: emitProgramScaffoldReadyBodyOk, TERM-SURFACE, EmitProgramScaffold-only. -/
def emitProgramScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitProgramReady" with
  | none => false
  | some body =>
    body == "emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitProgramOk is definitional alias of emitProgramReady.
    Greppable: emitProgramScaffoldOkBodyOk, TERM-SURFACE, EmitProgramScaffold-only. -/
def emitProgramScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitProgramOk" with
  | none => false
  | some body => body == "emitProgramReady"

/-- EmitProgramScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitProgramScaffoldTermDialect, TERM-SURFACE,
    EmitProgramScaffold-only. -/
def checkEmitProgramScaffoldTermDialect (content : String) : Option String :=
  if !emitProgramScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitProgramScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitProgramScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitProgramScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitProgramScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitProgramScaffold L2 after a structural accept.
    Greppable: refineEmitProgramScaffoldWithTermSurface, TERM-SURFACE,
    EmitProgramScaffold-only. -/
def refineEmitProgramScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitProgramScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitProgramScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitProgram\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitProgram\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitProgramScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitProgramScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "def emitProgramSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitProgramReady : Bool :=\n" ++
  "  emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitProgramOk : Bool := emitProgramReady\n"

/-- Well-typed EmitProgramScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitProgramScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitProgramScaffoldTermText : String :=
  hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitProgramScaffoldTermGoodMid
    ++ hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitProgramScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitProgramScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldStageIdText : String :=
  hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "def emitProgramSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitProgramReady : Bool :=\n" ++
  "  emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitProgramOk : Bool := emitProgramReady\n" ++
  hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix

/-- E2: emitProgramReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitProgramScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldReadyText : String :=
  hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "def emitProgramSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitProgramReady : Bool := true\n" ++
  "def emitProgramOk : Bool := emitProgramReady\n" ++
  hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix

/-- E3: emitProgramOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitProgramScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldOkText : String :=
  hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "def emitProgramSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitProgramReady : Bool :=\n" ++
  "  emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitProgramOk : Bool := true\n" ++
  hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix

/-- E4: emitProgramReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitProgramScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldContractText : String :=
  hostModuleCheckEmitProgramScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "def emitProgramSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitProgramReady : Bool :=\n" ++
  "  emitProgramSurfaceOk && headerHonestyOk\n" ++
  "def emitProgramOk : Bool := emitProgramReady\n" ++
  hostModuleCheckEmitProgramScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitProgramScaffold twin text for L0 dual-pin. -/
def emitProgramScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitProgramScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitProgramScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitProgramScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitProgramScaffoldStageIdText)
    emitProgramExpectedNamespace emitProgramScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitProgramScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitProgramScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitProgramScaffoldReadyText)
    emitProgramExpectedNamespace emitProgramScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitProgramScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitProgramScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitProgramScaffoldOkText)
    emitProgramExpectedNamespace emitProgramScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitProgramScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitProgramScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitProgramScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitProgramScaffoldContractText)
    emitProgramExpectedNamespace emitProgramScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitProgramScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitProgramScaffoldTermDialectOk : Bool :=
  (checkEmitProgramScaffoldTermDialect
    hostModuleCheckGoodEmitProgramScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitProgramScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitProgramScaffoldStageIdDialectReject : Bool :=
  match checkEmitProgramScaffoldTermDialect
      hostModuleCheckBadEmitProgramScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitProgramScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitProgramScaffoldReadyDialectReject : Bool :=
  match checkEmitProgramScaffoldTermDialect
      hostModuleCheckBadEmitProgramScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitProgramScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitProgramScaffoldOkDialectReject : Bool :=
  match checkEmitProgramScaffoldTermDialect
      hostModuleCheckBadEmitProgramScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitProgramScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitProgramScaffoldContractDialectReject : Bool :=
  match checkEmitProgramScaffoldTermDialect
      hostModuleCheckBadEmitProgramScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitProgramScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitProgramScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitProgramScaffold-only. -/
def hostModuleCheckEmitProgramScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk
    && (checkDepthEmitProgramScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitProgramScaffoldTermSurfaceScope == "EmitProgramScaffold-only")
    && hostModuleCheckEmitProgramScaffoldTermDialectOk
    && hostModuleCheckBadEmitProgramScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitProgramScaffoldReadyDialectReject
    && hostModuleCheckBadEmitProgramScaffoldOkDialectReject
    && hostModuleCheckBadEmitProgramScaffoldContractDialectReject
    && hostModuleCheckBadEmitProgramScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitProgramScaffoldReadyL0Accept
    && hostModuleCheckBadEmitProgramScaffoldOkL0Accept
    && hostModuleCheckBadEmitProgramScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitProgramScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitProgramScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitProgramScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_program_scaffold_term_surface_ids_eq :
    checkDepthEmitProgramScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitProgramScaffoldTermSurfaceScope = "EmitProgramScaffold-only"
      && hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm
