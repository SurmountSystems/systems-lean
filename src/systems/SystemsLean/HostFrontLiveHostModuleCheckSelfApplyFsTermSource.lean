/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckSelfApplyFsTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckSelfApplyFsTermSource.
  Occupancy stays 49. Host tools stay 69 of 69.
  This wrap is HostModuleCheckSelfApplyFsTerm.lean.
  It is not HostModuleCheck.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckSelfApplyFsTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm

/-- Dual-pinned live HostModuleCheckSelfApplyFsTerm.lean bytes.
    One raw string. The product is 190 lines, so this file stays under 780.
    Greppable: liveHostModuleCheckSelfApplyFsTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM. -/
def liveHostModuleCheckSelfApplyFsTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- SelfApply leftover L2 term-surface
  (SelfApplyFs TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SelfApply leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host self-apply deepen / claim SSoT L2 dialect subset (documented; not
  full Lean 4 elaborator):
  - freestandingSelfApplyReady compose matches product (four conjuncts:
    SelfApply.selfApplyReady + freestandingSelfApplyPathReady +
    freestandingParityLadderReady + selfApplyFsSurfaceOk).
  - product-complete honesty pin true (separate def; not a ready conjunct).
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (not a SelfApply leftover ready conjunct).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not PackageEnv / Soft J2 (later PE invents
    packageBodyImportsSelfApply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSelfApplyFsTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSelfApplyFsTermSurfaceOk.

  Intentional non-claims:
  - Host self-apply leftover only -- not package elaborate, not FullHost
    re-true.
  - Not InventoryClose. Not SelfApplyFsTheorems. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Does not flip freestandingProductSelfHostComplete (stays true).

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSelfApplyFsTerm, TERM-SURFACE, SelfApplyFs-only,
  ILL-TYPED-TERM, checkSelfApplyFsTermDialect,
  hostModuleCheckSelfApplyFsTermDialectOk,
  hostModuleCheckSelfApplyFsTermSurfaceDualOk,
  hostModuleCheckSelfApplyFsTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSelfApplyFsTerm
  Red/green: lake build SystemsLean.HostModuleCheckSelfApplyFsTerm;
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

/-! ### SelfApply leftover L2 term-surface dual-ok pins (SelfApplyFs-only) -/

def checkDepthSelfApplyFsTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSelfApplyFsTermSurfaceScope : String := "SelfApplyFs-only"
def hostModuleCheckSelfApplyFsTermSurfaceDualOk : Bool := true

/-- Product freestandingSelfApplyReady fold (four conjuncts only). Same string
    as the collapsed on-disk SelfApply leftover body so L0 fixtures and
    product match. No Lake / residual-free / llvm / dominance conjuncts. -/
def freestandingSelfApplyReadyTermBody : String :=
  "SelfApply.selfApplyReady && freestandingSelfApplyPathReady && freestandingParityLadderReady && selfApplyFsSurfaceOk"

def selfApplyFsReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "freestandingSelfApplyReady" with
  | none => false
  | some body => body == freestandingSelfApplyReadyTermBody

def selfApplyFsCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "freestandingProductSelfHostComplete" with
  | none => false
  | some body => body == "true"

def checkSelfApplyFsTermDialect (content : String) : Option String :=
  if !selfApplyFsReadyBodyOk content then some reasonIllTypedTerm
  else if !selfApplyFsCompleteBodyOk content then some reasonIllTypedTerm
  else none

def refineSelfApplyFsWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSelfApplyFsTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSelfApplyFsTermSkeletonPrefix : String :=
  "import SystemsLean.SelfApply\n" ++
  "namespace SystemsLean.SelfApplyFs\n"

def hostModuleCheckSelfApplyFsTermSkeletonSuffix : String :=
  "end SystemsLean.SelfApplyFs\n"

/-- Honest SelfApply leftover TERM mid: required L0 decls plus living
    complete pin (true). Stage / host ids match product SelfApply leftover. -/
def selfApplyFsTermGoodPins (readyBody complete : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_SELF_APPLY_FS_V0\"\n" ++
  "def hostSelfApplyFsId : String := \"HOST-SELF-APPLY-FS\"\n" ++
  "def selfHostSelfApplyFsId : String := \"SELF-HOST-SELF-APPLY-FS\"\n" ++
  "def freestandingProductSelfHostComplete : Bool := " ++ complete ++ "\n" ++
  "def freestandingSelfApplyReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckSelfApplyFsTermGoodMid : String :=
  selfApplyFsTermGoodPins freestandingSelfApplyReadyTermBody "true"

def hostModuleCheckGoodSelfApplyFsTermText : String :=
  hostModuleCheckSelfApplyFsTermSkeletonPrefix
    ++ hostModuleCheckSelfApplyFsTermGoodMid
    ++ hostModuleCheckSelfApplyFsTermSkeletonSuffix

def hostModuleCheckBadSelfApplyFsReadyText : String :=
  hostModuleCheckSelfApplyFsTermSkeletonPrefix
    ++ selfApplyFsTermGoodPins "true" "true"
    ++ hostModuleCheckSelfApplyFsTermSkeletonSuffix

def hostModuleCheckBadSelfApplyFsCompleteText : String :=
  hostModuleCheckSelfApplyFsTermSkeletonPrefix
    ++ selfApplyFsTermGoodPins freestandingSelfApplyReadyTermBody "false"
    ++ hostModuleCheckSelfApplyFsTermSkeletonSuffix

def selfApplyFsTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SelfApplyFs"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def selfApplyFsTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (selfApplyFsTermSurfaceFrom content)
    selfApplyFsExpectedNamespace selfApplyFsRequiredDecls
    (some "SystemsLean.SelfApply")).isAccept

def selfApplyFsTermDialectReject (content : String) : Bool :=
  match checkSelfApplyFsTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSelfApplyFsReadyL0Accept : Bool :=
  selfApplyFsTermL0Accept hostModuleCheckBadSelfApplyFsReadyText

def hostModuleCheckBadSelfApplyFsReadyDialectReject : Bool :=
  selfApplyFsTermDialectReject hostModuleCheckBadSelfApplyFsReadyText

def hostModuleCheckBadSelfApplyFsCompleteL0Accept : Bool :=
  selfApplyFsTermL0Accept hostModuleCheckBadSelfApplyFsCompleteText

def hostModuleCheckBadSelfApplyFsCompleteDialectReject : Bool :=
  selfApplyFsTermDialectReject hostModuleCheckBadSelfApplyFsCompleteText

def hostModuleCheckSelfApplyFsTermDialectOk : Bool :=
  (checkSelfApplyFsTermDialect hostModuleCheckGoodSelfApplyFsTermText).isNone

/-- On-disk SelfApply leftover freestandingSelfApplyReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodSelfApplyFsReadyMultilineText : String :=
  "def freestandingSelfApplyReady : Bool :=\n" ++
  "  SelfApply.selfApplyReady\n" ++
  "    && freestandingSelfApplyPathReady\n" ++
  "    && freestandingParityLadderReady\n" ++
  "    && selfApplyFsSurfaceOk\n"

/-- Collapse of the on-disk multi-line freestandingSelfApplyReady body. -/
def hostModuleCheckSelfApplyFsReadyMultilineOk : Bool :=
  selfApplyFsReadyBodyOk hostModuleCheckGoodSelfApplyFsReadyMultilineText

def hostModuleCheckSelfApplyFsTermSurfaceOk : Bool :=
  hostModuleCheckSelfApplyFsTermSurfaceDualOk
    && (checkDepthSelfApplyFsTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSelfApplyFsTermSurfaceScope == "SelfApplyFs-only")
    && hostModuleCheckSelfApplyFsTermDialectOk
    && hostModuleCheckBadSelfApplyFsReadyDialectReject
    && hostModuleCheckBadSelfApplyFsCompleteDialectReject
    && hostModuleCheckBadSelfApplyFsReadyL0Accept
    && hostModuleCheckBadSelfApplyFsCompleteL0Accept
    && hostModuleCheckSelfApplyFsReadyMultilineOk

theorem hostModuleCheckSelfApplyFsTermSurfaceOk_true :
    hostModuleCheckSelfApplyFsTermSurfaceOk = true := by native_decide

theorem hostModuleCheckSelfApplyFsReadyMultilineOk_true :
    hostModuleCheckSelfApplyFsReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_selfApplyFs_term_surface_ids_eq :
    checkDepthSelfApplyFsTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSelfApplyFsTermSurfaceScope = "SelfApplyFs-only"
      && hostModuleCheckSelfApplyFsTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm
