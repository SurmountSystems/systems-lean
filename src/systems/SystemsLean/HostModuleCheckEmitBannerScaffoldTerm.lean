/-
  SYSTEMS_LEAN_HOST partial -- EmitBannerScaffold L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: EmitBannerScaffold dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  EmitBannerScaffold L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_EMIT_BANNER_V0".
  - hostEmitBannerId body "HOST-EMIT-BANNER".
  - selfHostEmitBannerId body "SELF-HOST-EMIT-BANNER".
  - emitBannerReady fail-closed compose emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk.
  - emitBannerOk definitional alias emitBannerReady.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckEmitBannerScaffoldTermSurfaceOk (E-good dialect +
    E1..E4 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - EmitBannerScaffold pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - TERM-SURFACE dual-ok for EmitBannerScaffold is EmitBannerScaffold-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckEmitBannerScaffoldTerm, TERM-SURFACE, EmitBannerScaffold-only,
  ILL-TYPED-TERM, checkEmitBannerScaffoldTermDialect,
  hostModuleCheckBadEmitBannerScaffoldStageIdText,
  hostModuleCheckBadEmitBannerScaffoldReadyText,
  hostModuleCheckBadEmitBannerScaffoldOkText,
  hostModuleCheckBadEmitBannerScaffoldContractText,
  hostModuleCheckEmitBannerScaffoldTermDialectOk,
  hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk,
  hostModuleCheckEmitBannerScaffoldTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckEmitBannerScaffoldTerm
  Red/green: lake build SystemsLean.HostModuleCheckEmitBannerScaffoldTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### EmitBannerScaffold L2 term-surface dual-ok pins (EmitBannerScaffold-only) -/

/-- Named term-surface depth bar. Greppable: checkDepthEmitBannerScaffoldTermSurfaceBar,
    TERM-SURFACE, EmitBannerScaffold-only. -/
def checkDepthEmitBannerScaffoldTermSurfaceBar : String := "TERM-SURFACE"

/-- Honesty scope: EmitBannerScaffold.lean only.
    Greppable: checkDepthEmitBannerScaffoldTermSurfaceScope, EmitBannerScaffold-only. -/
def checkDepthEmitBannerScaffoldTermSurfaceScope : String := "EmitBannerScaffold-only"

/-- Dual-ok when EmitBannerScaffold L2 E-good/E-bad rejects work.
    Greppable: hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk, TERM-SURFACE,
    EmitBannerScaffold-only. -/
def hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk : Bool := true

/-! ### EmitBannerScaffold dialect (reuse EmitPlan collapse helpers) -/

/-- stageId body is SLAKE_SELF_HOST_EMIT_BANNER_V0.
    Greppable: emitBannerScaffoldStageIdBodyOk, TERM-SURFACE, EmitBannerScaffold-only. -/
def emitBannerScaffoldStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_EMIT_BANNER_V0\""

/-- hostEmitBannerId body is HOST-EMIT-BANNER.
    Greppable: emitBannerScaffoldHostIdBodyOk, TERM-SURFACE, EmitBannerScaffold-only. -/
def emitBannerScaffoldHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostEmitBannerId" with
  | none => false
  | some body => body == "\"HOST-EMIT-BANNER\""

/-- selfHostEmitBannerId body is SELF-HOST-EMIT-BANNER.
    Greppable: emitBannerScaffoldSelfHostIdBodyOk, TERM-SURFACE, EmitBannerScaffold-only. -/
def emitBannerScaffoldSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostEmitBannerId" with
  | none => false
  | some body => body == "\"SELF-HOST-EMIT-BANNER\""

/-- emitBannerReady fail-closed compose.
    Greppable: emitBannerScaffoldReadyBodyOk, TERM-SURFACE, EmitBannerScaffold-only. -/
def emitBannerScaffoldReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitBannerReady" with
  | none => false
  | some body =>
    body == "emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk"

/-- emitBannerOk is definitional alias of emitBannerReady.
    Greppable: emitBannerScaffoldOkBodyOk, TERM-SURFACE, EmitBannerScaffold-only. -/
def emitBannerScaffoldOkBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "emitBannerOk" with
  | none => false
  | some body => body == "emitBannerReady"

/-- EmitBannerScaffold L2 term-surface check. None = ok; some reason = reject.
    Greppable: checkEmitBannerScaffoldTermDialect, TERM-SURFACE,
    EmitBannerScaffold-only. -/
def checkEmitBannerScaffoldTermDialect (content : String) : Option String :=
  if !emitBannerScaffoldStageIdBodyOk content then some reasonIllTypedTerm
  else if !emitBannerScaffoldHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitBannerScaffoldSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !emitBannerScaffoldReadyBodyOk content then some reasonIllTypedTerm
  else if !emitBannerScaffoldOkBodyOk content then some reasonIllTypedTerm
  else none

/-- Apply EmitBannerScaffold L2 after a structural accept.
    Greppable: refineEmitBannerScaffoldWithTermSurface, TERM-SURFACE,
    EmitBannerScaffold-only. -/
def refineEmitBannerScaffoldWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkEmitBannerScaffoldTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### EmitBannerScaffold L2 well-typed good fixture (E-good) -/

/-- Shared skeleton prefix.
    Greppable: hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix, TERM-SURFACE. -/
def hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix : String :=
  "namespace SystemsLean.EmitBanner\n"

/-- Shared skeleton suffix.
    Greppable: hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix, TERM-SURFACE. -/
def hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix : String :=
  "end SystemsLean.EmitBanner\n"

/-- Shared good-path mid bodies + L0 tokens.
    Greppable: hostModuleCheckEmitBannerScaffoldTermGoodMid, TERM-SURFACE. -/
def hostModuleCheckEmitBannerScaffoldTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_BANNER_V0\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "def emitBannerSurfaceOk : Bool := true\n" ++
  "def versionStringsOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitBannerReady : Bool :=\n" ++
  "  emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitBannerOk : Bool := emitBannerReady\n"

/-- Well-typed EmitBannerScaffold L2 good text.
    Greppable: hostModuleCheckGoodEmitBannerScaffoldTermText, TERM-SURFACE. -/
def hostModuleCheckGoodEmitBannerScaffoldTermText : String :=
  hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix
    ++ hostModuleCheckEmitBannerScaffoldTermGoodMid
    ++ hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix

/-! ### Ill-typed EmitBannerScaffold twins (L0 tokens present; L2 must reject). -/

/-- E1: wrong stageId string.
    Greppable: hostModuleCheckBadEmitBannerScaffoldStageIdText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldStageIdText : String :=
  hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "def emitBannerSurfaceOk : Bool := true\n" ++
  "def versionStringsOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitBannerReady : Bool :=\n" ++
  "  emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitBannerOk : Bool := emitBannerReady\n" ++
  hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix

/-- E2: emitBannerReady always true (drops fail-closed compose).
    Greppable: hostModuleCheckBadEmitBannerScaffoldReadyText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldReadyText : String :=
  hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_BANNER_V0\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "def emitBannerSurfaceOk : Bool := true\n" ++
  "def versionStringsOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitBannerReady : Bool := true\n" ++
  "def emitBannerOk : Bool := emitBannerReady\n" ++
  hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix

/-- E3: emitBannerOk always true (drops definitional alias).
    Greppable: hostModuleCheckBadEmitBannerScaffoldOkText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldOkText : String :=
  hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_BANNER_V0\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "def emitBannerSurfaceOk : Bool := true\n" ++
  "def versionStringsOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitBannerReady : Bool :=\n" ++
  "  emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitBannerOk : Bool := true\n" ++
  hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix

/-- E4: emitBannerReady drops a fail-closed conjunct.
    Greppable: hostModuleCheckBadEmitBannerScaffoldContractText, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldContractText : String :=
  hostModuleCheckEmitBannerScaffoldTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_BANNER_V0\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "def emitBannerSurfaceOk : Bool := true\n" ++
  "def versionStringsOk : Bool := true\n" ++
  "def headerHonestyOk : Bool := true\n" ++
  "def bodyHonestyOk : Bool := true\n" ++
  "def emitBannerReady : Bool :=\n" ++
  "  emitBannerSurfaceOk && headerHonestyOk && bodyHonestyOk\n" ++
  "def emitBannerOk : Bool := emitBannerReady\n" ++
  hostModuleCheckEmitBannerScaffoldTermSkeletonSuffix

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from EmitBannerScaffold twin text for L0 dual-pin. -/
def emitBannerScaffoldTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.EmitBannerScaffold"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept E1 when tokens present.
    Greppable: hostModuleCheckBadEmitBannerScaffoldStageIdL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldStageIdL0Accept : Bool :=
  (checkNamedSurface (emitBannerScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitBannerScaffoldStageIdText)
    emitBannerExpectedNamespace emitBannerScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E2 when tokens present.
    Greppable: hostModuleCheckBadEmitBannerScaffoldReadyL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldReadyL0Accept : Bool :=
  (checkNamedSurface (emitBannerScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitBannerScaffoldReadyText)
    emitBannerExpectedNamespace emitBannerScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E3 when tokens present.
    Greppable: hostModuleCheckBadEmitBannerScaffoldOkL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldOkL0Accept : Bool :=
  (checkNamedSurface (emitBannerScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitBannerScaffoldOkText)
    emitBannerExpectedNamespace emitBannerScaffoldRequiredDecls
    none).isAccept

/-- L0/L1 still accept E4 when tokens present.
    Greppable: hostModuleCheckBadEmitBannerScaffoldContractL0Accept, TERM-SURFACE. -/
def hostModuleCheckBadEmitBannerScaffoldContractL0Accept : Bool :=
  (checkNamedSurface (emitBannerScaffoldTermSurfaceFrom
      hostModuleCheckBadEmitBannerScaffoldContractText)
    emitBannerExpectedNamespace emitBannerScaffoldRequiredDecls
    none).isAccept

/-- Dialect-only good path.
    Greppable: hostModuleCheckEmitBannerScaffoldTermDialectOk, TERM-SURFACE. -/
def hostModuleCheckEmitBannerScaffoldTermDialectOk : Bool :=
  (checkEmitBannerScaffoldTermDialect
    hostModuleCheckGoodEmitBannerScaffoldTermText).isNone

/-- Dialect rejects E1.
    Greppable: hostModuleCheckBadEmitBannerScaffoldStageIdDialectReject. -/
def hostModuleCheckBadEmitBannerScaffoldStageIdDialectReject : Bool :=
  match checkEmitBannerScaffoldTermDialect
      hostModuleCheckBadEmitBannerScaffoldStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E2.
    Greppable: hostModuleCheckBadEmitBannerScaffoldReadyDialectReject. -/
def hostModuleCheckBadEmitBannerScaffoldReadyDialectReject : Bool :=
  match checkEmitBannerScaffoldTermDialect
      hostModuleCheckBadEmitBannerScaffoldReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E3.
    Greppable: hostModuleCheckBadEmitBannerScaffoldOkDialectReject. -/
def hostModuleCheckBadEmitBannerScaffoldOkDialectReject : Bool :=
  match checkEmitBannerScaffoldTermDialect
      hostModuleCheckBadEmitBannerScaffoldOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects E4.
    Greppable: hostModuleCheckBadEmitBannerScaffoldContractDialectReject. -/
def hostModuleCheckBadEmitBannerScaffoldContractDialectReject : Bool :=
  match checkEmitBannerScaffoldTermDialect
      hostModuleCheckBadEmitBannerScaffoldContractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Combined EmitBannerScaffold L2 dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckEmitBannerScaffoldTermSurfaceOk, TERM-SURFACE,
    EmitBannerScaffold-only. -/
def hostModuleCheckEmitBannerScaffoldTermSurfaceOk : Bool :=
  hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk
    && (checkDepthEmitBannerScaffoldTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthEmitBannerScaffoldTermSurfaceScope == "EmitBannerScaffold-only")
    && hostModuleCheckEmitBannerScaffoldTermDialectOk
    && hostModuleCheckBadEmitBannerScaffoldStageIdDialectReject
    && hostModuleCheckBadEmitBannerScaffoldReadyDialectReject
    && hostModuleCheckBadEmitBannerScaffoldOkDialectReject
    && hostModuleCheckBadEmitBannerScaffoldContractDialectReject
    && hostModuleCheckBadEmitBannerScaffoldStageIdL0Accept
    && hostModuleCheckBadEmitBannerScaffoldReadyL0Accept
    && hostModuleCheckBadEmitBannerScaffoldOkL0Accept
    && hostModuleCheckBadEmitBannerScaffoldContractL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckEmitBannerScaffoldTermSurfaceOk_true, TERM-SURFACE. -/
theorem hostModuleCheckEmitBannerScaffoldTermSurfaceOk_true :
    hostModuleCheckEmitBannerScaffoldTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_emit_banner_scaffold_term_surface_ids_eq :
    checkDepthEmitBannerScaffoldTermSurfaceBar = "TERM-SURFACE"
      && checkDepthEmitBannerScaffoldTermSurfaceScope = "EmitBannerScaffold-only"
      && hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
