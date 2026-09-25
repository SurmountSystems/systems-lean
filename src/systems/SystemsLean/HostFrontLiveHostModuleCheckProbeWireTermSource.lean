/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckProbeWireTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckProbeWireTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckProbeWireTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckProbeWireTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPROBEWIRETERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckProbeWireTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm

/-- Dual-pinned live HostModuleCheckProbeWireTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckProbeWireTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPROBEWIRETERM. -/
def liveHostModuleCheckProbeWireTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ProbeWire leftover L2 term-surface
  (ProbeWire TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProbeWire leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host probe-wire leftover dialect subset (documented; not full Lean 4
  elaborator):
  - probeWireReady compose matches product (ten conjuncts:
    DualResidual.dualResidualReady + probeWireSurfaceOk +
    probeWireSurfacesDistinct + behavioralProbeIsSmokeDebt +
    behavioralProbeIsNotProductWire + productWireIsEmitPath +
    probeDoesNotReplaceProductWire + !residualFreeClaimed +
    productSelfHostCompleteClaimed +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is L0 presence false and a ready conjunct
    (!residualFreeClaimed). Not a DualResidual ILL.
  - probeWireOk aliases probeWireReady. L0 does not require the alias.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (L0 requires the name present as false).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not ProbeWireTheorems. Not PackageEnv / Soft J2
    (later PE invents packageBodyImportsDualResidual).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProbeWireTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProbeWireTermSurfaceOk.

  Intentional non-claims:
  - Host probe-wire leftover only -- not package elaborate, not FullHost
    re-true.
  - Not ProbeWireTheorems. Not DualResidual rewrite. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip DualResidual residualFreeClaimed (stays true).
  - Does not flip DualResidual hostElaboratorResidualFreeClaimed (stays true).
  - Does not flip DualResidual remains pins (stay false).
  - Does not flip productSelfHostCompleteClaimed or
    SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProbeWireTerm, TERM-SURFACE, ProbeWire-only,
  ILL-TYPED-TERM, checkProbeWireTermDialect,
  hostModuleCheckProbeWireTermDialectOk,
  hostModuleCheckProbeWireTermSurfaceDualOk,
  hostModuleCheckProbeWireTermSurfaceOk,
  probeWireReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProbeWireTerm
  Red/green: lake build SystemsLean.HostModuleCheckProbeWireTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### ProbeWire leftover L2 term-surface dual-ok pins (ProbeWire-only) -/

def checkDepthProbeWireTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProbeWireTermSurfaceScope : String := "ProbeWire-only"
def hostModuleCheckProbeWireTermSurfaceDualOk : Bool := true

/-- Product probeWireReady fold (ten conjuncts only). Same string
    as the collapsed on-disk ProbeWire leftover body so L0 fixtures and
    product match. No Lake / llvm / dominance conjuncts. residual-free
    stays a false conjunct, not an ILL twin. -/
def probeWireReadyTermBody : String :=
  "DualResidual.dualResidualReady && probeWireSurfaceOk && probeWireSurfacesDistinct && behavioralProbeIsSmokeDebt && behavioralProbeIsNotProductWire && productWireIsEmitPath && probeDoesNotReplaceProductWire && !residualFreeClaimed && productSelfHostCompleteClaimed && SelfApplyFs.freestandingProductSelfHostComplete"

def probeWireReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "probeWireReady" with
  | none => false
  | some body => body == probeWireReadyTermBody

def checkProbeWireTermDialect (content : String) : Option String :=
  if !probeWireReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProbeWireWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProbeWireTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProbeWireTermSkeletonPrefix : String :=
  "import SystemsLean.DualResidual\n" ++
  "namespace SystemsLean.ProbeWire\n"

def hostModuleCheckProbeWireTermSkeletonSuffix : String :=
  "end SystemsLean.ProbeWire\n"

/-- Honest ProbeWire leftover TERM mid: required L0 decls. Stage /
    host ids match product ProbeWire leftover. residualFreeClaimed
    stays false (L0 presence and ready conjunct; not a DualResidual ILL). -/
def probeWireTermGoodPins (readyBody : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PROBE_WIRE_V0\"\n" ++
  "def hostProbeWireId : String := \"HOST-PROBE-WIRE\"\n" ++
  "def behavioralProbeIsSmokeDebt : Bool := true\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def probeWireReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckProbeWireTermGoodMid : String :=
  probeWireTermGoodPins probeWireReadyTermBody

def hostModuleCheckGoodProbeWireTermText : String :=
  hostModuleCheckProbeWireTermSkeletonPrefix
    ++ hostModuleCheckProbeWireTermGoodMid
    ++ hostModuleCheckProbeWireTermSkeletonSuffix

def hostModuleCheckBadProbeWireReadyText : String :=
  hostModuleCheckProbeWireTermSkeletonPrefix
    ++ probeWireTermGoodPins "true"
    ++ hostModuleCheckProbeWireTermSkeletonSuffix

def probeWireTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProbeWire"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def probeWireTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (probeWireTermSurfaceFrom content)
    probeWireExpectedNamespace probeWireRequiredDecls
    (some "SystemsLean.DualResidual")).isAccept

def probeWireTermDialectReject (content : String) : Bool :=
  match checkProbeWireTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProbeWireReadyL0Accept : Bool :=
  probeWireTermL0Accept hostModuleCheckBadProbeWireReadyText

def hostModuleCheckBadProbeWireReadyDialectReject : Bool :=
  probeWireTermDialectReject hostModuleCheckBadProbeWireReadyText

def hostModuleCheckProbeWireTermDialectOk : Bool :=
  (checkProbeWireTermDialect hostModuleCheckGoodProbeWireTermText).isNone

/-- On-disk ProbeWire leftover probeWireReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodProbeWireReadyMultilineText : String :=
  "def probeWireReady : Bool :=\n" ++
  "  DualResidual.dualResidualReady\n" ++
  "    && probeWireSurfaceOk\n" ++
  "    && probeWireSurfacesDistinct\n" ++
  "    && behavioralProbeIsSmokeDebt\n" ++
  "    && behavioralProbeIsNotProductWire\n" ++
  "    && productWireIsEmitPath\n" ++
  "    && probeDoesNotReplaceProductWire\n" ++
  "    && !residualFreeClaimed\n" ++
  "    && productSelfHostCompleteClaimed\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line probeWireReady body. -/
def hostModuleCheckProbeWireReadyMultilineOk : Bool :=
  probeWireReadyBodyOk hostModuleCheckGoodProbeWireReadyMultilineText

def hostModuleCheckProbeWireTermSurfaceOk : Bool :=
  hostModuleCheckProbeWireTermSurfaceDualOk
    && (checkDepthProbeWireTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProbeWireTermSurfaceScope == "ProbeWire-only")
    && hostModuleCheckProbeWireTermDialectOk
    && hostModuleCheckBadProbeWireReadyDialectReject
    && hostModuleCheckBadProbeWireReadyL0Accept
    && hostModuleCheckProbeWireReadyMultilineOk

theorem hostModuleCheckProbeWireTermSurfaceOk_true :
    hostModuleCheckProbeWireTermSurfaceOk = true := by native_decide

theorem hostModuleCheckProbeWireReadyMultilineOk_true :
    hostModuleCheckProbeWireReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_probeWire_term_surface_ids_eq :
    checkDepthProbeWireTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProbeWireTermSurfaceScope = "ProbeWire-only"
      && hostModuleCheckProbeWireTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckProbeWireTerm
