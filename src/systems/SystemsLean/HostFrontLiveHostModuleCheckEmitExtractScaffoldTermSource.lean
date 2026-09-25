/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckEmitExtractScaffoldTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckEmitExtractScaffoldTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckEmitExtractScaffoldTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckEmitExtractScaffoldTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM,
  liveHostModuleCheckEmitExtractScaffoldTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm

/-- Dual-pinned live HostModuleCheckEmitExtractScaffoldTerm.lean bytes.
    One part. Not split. 340 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckEmitExtractScaffoldTermSource,
    PARSE-LIVE-HOSTMODULECHECKEMITEXTRACTSCAFFOLDTERM. -/
def liveHostModuleCheckEmitExtractScaffoldTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- EmitExtractScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitExtractScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitExtractScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_EXTRACT_V0".
  - hostEmitExtractId body "HOST-EMIT-EXTRACT".
  - selfHostEmitExtractId body "SELF-HOST-EMIT-EXTRACT".
  - emitExtractReady fail-closed compose emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk.
  - emitExtractOk definitional alias emitExtractReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitExtractScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitExtractScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitExtractScaffold is EmitExtractScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitExtractScaffoldTerm, TERM-SURFACE, EmitExtractScaffold-only,
  ILL-TYPED-TERM, checkEmitExtractScaffoldTermDialect,
  hostModuleCheckBadEmitExtractScaffoldStageIdText,
  hostModuleCheckBadEmitExtractScaffoldReadyText,
  hostModuleCheckBadEmitExtractScaffoldOkText,
  hostModuleCheckBadEmitExtractScaffoldContractText,
  hostModuleCheckEmitExtractScaffoldTermDialectOk,
  hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitExtractScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitExtractScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitExtractScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitExtractScaffold L2 term-surface dual-ok pins (EmitExtractScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitExtractScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitExtractScaffold-only. -/
def checkDepthEmitExtractScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitExtractScaffold.lean only.
    Greppable: checkDepthEmitExtractScaffoldTermSurfaceScope, EmitExtractScaffold-only. -/
def checkDepthEmitExtractScaffoldTermSurfaceScope : String := "EmitExtractScaffold-only"

/-- Dual-ok when EmitExtractScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitExtractScaffold-only. -/
def hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitExtractScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_EXTRACT_V0.
    Greppable: emitExtractScaffoldStageIdBodyOk, TERM-SURFACE, EmitExtractScaffold-only. -/
def emitExtractScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\""

/-- hostEmitExtractId body is HOST-EMIT-EXTRACT.
    Greppable: emitExtractScaffoldHostIdBodyOk, TERM-SURFACE, EmitExtractScaffold-only. -/
def emitExtractScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitExtractId" with
  | none => false
  | some body => body == "\"HOST-EMIT-EXTRACT\""

/-- selfHostEmitExtractId body is SELF-HOST-EMIT-EXTRACT.
    Greppable: emitExtractScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitExtractScaffold-only. -/
def emitExtractScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitExtractId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-EXTRACT\""

/-- emitExtractReady fail-closed compose.
    Greppable: emitExtractScaffoldReadyBodyOk, TERM-SURFACE, EmitExtractScaffold-only. -/
def emitExtractScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitExtractReady" with
  | none => false
  | some body =>
    body == "emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk"

/-- emitExtractOk is definitional alias of emitExtractReady.
    Greppable: emitExtractScaffoldOkBodyOk, TERM-SURFACE, EmitExtractScaffold-only. -/
def emitExtractScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitExtractOk" with
  | none => false
  | some body => body == "emitExtractReady"

/-- EmitExtractScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitExtractScaffoldTermDialect, TERM-SURFACE,
    EmitExtractScaffold-only. -/
def checkEmitExtractScaffoldTermDialect (content : String) : Option String :=
  if !emitExtractScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitExtractScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitExtractScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitExtractScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitExtractScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitExtractScaffold L2 after a structural accept.
    Greppable: refineEmitExtractScaffoldWithTermSurface, TERM-SURFACE,
    EmitExtractScaffold-only. -/
def refineEmitExtractScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitExtractScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitExtractScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitExtract\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitExtract\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitExtractScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitExtractScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "def emitExtractSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitExtractReady : Bool :=\n" ++
  "  emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitExtractOk : Bool := emitExtractReady\n"

/-- Well-typed EmitExtractScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitExtractScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitExtractScaffoldTermText : String :=
  hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitExtractScaffoldTermGoodMid
    ++ hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitExtractScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitExtractScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldStageIdText : String :=
  hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "def emitExtractSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitExtractReady : Bool :=\n" ++
  "  emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitExtractOk : Bool := emitExtractReady\n" ++
  hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix

/-- E2: emitExtractReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitExtractScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldReadyText : String :=
  hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "def emitExtractSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitExtractReady : Bool := true\n" ++
  "def emitExtractOk : Bool := emitExtractReady\n" ++
  hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix

/-- E3: emitExtractOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitExtractScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldOkText : String :=
  hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "def emitExtractSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitExtractReady : Bool :=\n" ++
  "  emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitExtractOk : Bool := true\n" ++
  hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix

/-- E4: emitExtractReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitExtractScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldContractText : String :=
  hostModuleCheckEmitExtractScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "def emitExtractSurfaceOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitExtractReady : Bool :=\n" ++
  "  emitExtractSurfaceOk && headerHonestyOk\n" ++
  "def emitExtractOk : Bool := emitExtractReady\n" ++
  hostModuleCheckEmitExtractScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitExtractScaffold twin text for L0 dual-pin. -/
def emitExtractScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitExtractScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitExtractScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitExtractScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitExtractScaffoldStageIdText)
    emitExtractExpectedNamespace emitExtractScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitExtractScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitExtractScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitExtractScaffoldReadyText)
    emitExtractExpectedNamespace emitExtractScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitExtractScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitExtractScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitExtractScaffoldOkText)
    emitExtractExpectedNamespace emitExtractScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitExtractScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitExtractScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitExtractScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitExtractScaffoldContractText)
    emitExtractExpectedNamespace emitExtractScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitExtractScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitExtractScaffoldTermDialectOk : Bool :=
  (checkEmitExtractScaffoldTermDialect
    hostModuleCheckGoodEmitExtractScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitExtractScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitExtractScaffoldStageIdDialectReject : Bool :=
  match checkEmitExtractScaffoldTermDialect
      hostModuleCheckBadEmitExtractScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitExtractScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitExtractScaffoldReadyDialectReject : Bool :=
  match checkEmitExtractScaffoldTermDialect
      hostModuleCheckBadEmitExtractScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitExtractScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitExtractScaffoldOkDialectReject : Bool :=
  match checkEmitExtractScaffoldTermDialect
      hostModuleCheckBadEmitExtractScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitExtractScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitExtractScaffoldContractDialectReject : Bool :=
  match checkEmitExtractScaffoldTermDialect
      hostModuleCheckBadEmitExtractScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitExtractScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitExtractScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitExtractScaffold-only. -/
def hostModuleCheckEmitExtractScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk
    && (checkDepthEmitExtractScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitExtractScaffoldTermSurfaceScope == "EmitExtractScaffold-only")
    && hostModuleCheckEmitExtractScaffoldTermDialectOk
    && hostModuleCheckBadEmitExtractScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitExtractScaffoldReadyDialectReject
    && hostModuleCheckBadEmitExtractScaffoldOkDialectReject
    && hostModuleCheckBadEmitExtractScaffoldContractDialectReject
    && hostModuleCheckBadEmitExtractScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitExtractScaffoldReadyL0Accept
    && hostModuleCheckBadEmitExtractScaffoldOkL0Accept
    && hostModuleCheckBadEmitExtractScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitExtractScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitExtractScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitExtractScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_extract_scaffold_term_surface_ids_eq :
    checkDepthEmitExtractScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitExtractScaffoldTermSurfaceScope = "EmitExtractScaffold-only"
      && hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckEmitExtractScaffoldTerm
