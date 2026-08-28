/-
  SYSTEMS_LEAN_HOST partial -- DualResidual leftover L2 term-surface
  (DualResidual TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: DualResidual leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host dual-residual leftover dialect subset (documented; not full Lean 4
  elaborator):
  - dualResidualReady compose matches product (eleven conjuncts:
    ProductPath.productPathCloseReady + dualResidualSurfaceOk +
    dualResidualSurfacesDistinct + !hostElaboratorResidualRemains +
    !productResidualRemains + productResidualFreeMeasureCited +
    residualFreeMeasureAgreesFree + hostElaboratorResidualFreeClaimed +
    residualFreeClaimed + productSelfHostCompleteClaimed +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is a named top-level ready conjunct that must stay
    true (DualResidual residual-free claimed class ILL).
  - hostElaboratorResidualFreeClaimed body must stay true (same class).
  - dualResidualOk aliases dualResidualReady. L0 does not require the alias.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not DualResidualTheorems. Not PackageEnv / Soft J2
    (later PE invents packageBodyImportsProductPath).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckDualResidualTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckDualResidualTermSurfaceOk.

  Intentional non-claims:
  - Host dual-residual leftover only -- not package elaborate, not FullHost
    re-true.
  - Not DualResidualTheorems. Not ProbeWire. Not emit*Ready.
  - Not full elaborator typecheck. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays true).
  - Does not flip hostElaboratorResidualFreeClaimed (stays true).
  - Does not flip DualResidual remains pins (stay false).
  - Does not flip ProductPath residualFreeClaimed (stays false).
  - Does not flip productSelfHostCompleteClaimed or
    SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckDualResidualTerm, TERM-SURFACE, DualResidual-only,
  ILL-TYPED-TERM, checkDualResidualTermDialect,
  hostModuleCheckDualResidualTermDialectOk,
  hostModuleCheckDualResidualTermSurfaceDualOk,
  hostModuleCheckDualResidualTermSurfaceOk,
  dualResidualReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckDualResidualTerm
  Red/green: lake build SystemsLean.HostModuleCheckDualResidualTerm;
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

/-! ### DualResidual leftover L2 term-surface dual-ok pins (DualResidual-only) -/

def checkDepthDualResidualTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthDualResidualTermSurfaceScope : String := "DualResidual-only"
def hostModuleCheckDualResidualTermSurfaceDualOk : Bool := true

/-- Product dualResidualReady fold (eleven conjuncts only). Same string
    as the collapsed on-disk DualResidual leftover body so L0 fixtures and
    product match. No Lake / llvm / dominance conjuncts. residual-free
    and host-free stay named true conjuncts (ILL twins). -/
def dualResidualReadyTermBody : String :=
  "ProductPath.productPathCloseReady && dualResidualSurfaceOk && dualResidualSurfacesDistinct && !hostElaboratorResidualRemains && !productResidualRemains && productResidualFreeMeasureCited && residualFreeMeasureAgreesFree && hostElaboratorResidualFreeClaimed && residualFreeClaimed && productSelfHostCompleteClaimed && SelfApplyFs.freestandingProductSelfHostComplete"

def dualResidualReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dualResidualReady" with
  | none => false
  | some body => body == dualResidualReadyTermBody

def dualResidualResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "residualFreeClaimed" with
  | none => false
  | some body => body == "true"

def dualResidualHostFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostElaboratorResidualFreeClaimed" with
  | none => false
  | some body => body == "true"

def checkDualResidualTermDialect (content : String) : Option String :=
  if !dualResidualReadyBodyOk content then some reasonIllTypedTerm
  else if !dualResidualResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !dualResidualHostFreeBodyOk content then some reasonIllTypedTerm
  else none

def refineDualResidualWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkDualResidualTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckDualResidualTermSkeletonPrefix : String :=
  "import SystemsLean.ProductPath\n" ++
  "namespace SystemsLean.DualResidual\n"

def hostModuleCheckDualResidualTermSkeletonSuffix : String :=
  "end SystemsLean.DualResidual\n"

/-- Honest DualResidual leftover TERM mid: required L0 decls plus living
    residual-free / host-free pins (true). Stage / host ids match product.
    remains stays false. Ready body is the eleven-fold, not `true`. -/
def dualResidualTermGoodPins (readyBody residualFree hostFree : String) :
    String :=
  "def stageId : String := \"SLAKE_SELF_HOST_DUAL_RESIDUAL_V0\"\n" ++
  "def hostDualResidualId : String := \"HOST-DUAL-RESIDUAL\"\n" ++
  "def selfHostDualResidualId : String := \"SELF-HOST-DUAL-RESIDUAL\"\n" ++
  "def hostElaboratorResidualRemains : Bool := false\n" ++
  "def hostElaboratorResidualFreeClaimed : Bool := " ++ hostFree ++ "\n" ++
  "def residualFreeClaimed : Bool := " ++ residualFree ++ "\n" ++
  "def dualResidualReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckDualResidualTermGoodMid : String :=
  dualResidualTermGoodPins dualResidualReadyTermBody "true" "true"

def hostModuleCheckGoodDualResidualTermText : String :=
  hostModuleCheckDualResidualTermSkeletonPrefix
    ++ hostModuleCheckDualResidualTermGoodMid
    ++ hostModuleCheckDualResidualTermSkeletonSuffix

def hostModuleCheckBadDualResidualReadyText : String :=
  hostModuleCheckDualResidualTermSkeletonPrefix
    ++ dualResidualTermGoodPins "true" "true" "true"
    ++ hostModuleCheckDualResidualTermSkeletonSuffix

def hostModuleCheckBadDualResidualResidualFreeText : String :=
  hostModuleCheckDualResidualTermSkeletonPrefix
    ++ dualResidualTermGoodPins dualResidualReadyTermBody "false" "true"
    ++ hostModuleCheckDualResidualTermSkeletonSuffix

def hostModuleCheckBadDualResidualHostFreeText : String :=
  hostModuleCheckDualResidualTermSkeletonPrefix
    ++ dualResidualTermGoodPins dualResidualReadyTermBody "true" "false"
    ++ hostModuleCheckDualResidualTermSkeletonSuffix

def dualResidualTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.DualResidual"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def dualResidualTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (dualResidualTermSurfaceFrom content)
    dualResidualExpectedNamespace dualResidualRequiredDecls
    (some "SystemsLean.ProductPath")).isAccept

def dualResidualTermDialectReject (content : String) : Bool :=
  match checkDualResidualTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadDualResidualReadyL0Accept : Bool :=
  dualResidualTermL0Accept hostModuleCheckBadDualResidualReadyText

def hostModuleCheckBadDualResidualReadyDialectReject : Bool :=
  dualResidualTermDialectReject hostModuleCheckBadDualResidualReadyText

def hostModuleCheckBadDualResidualResidualFreeL0Accept : Bool :=
  dualResidualTermL0Accept hostModuleCheckBadDualResidualResidualFreeText

def hostModuleCheckBadDualResidualResidualFreeDialectReject : Bool :=
  dualResidualTermDialectReject hostModuleCheckBadDualResidualResidualFreeText

def hostModuleCheckBadDualResidualHostFreeL0Accept : Bool :=
  dualResidualTermL0Accept hostModuleCheckBadDualResidualHostFreeText

def hostModuleCheckBadDualResidualHostFreeDialectReject : Bool :=
  dualResidualTermDialectReject hostModuleCheckBadDualResidualHostFreeText

def hostModuleCheckDualResidualTermDialectOk : Bool :=
  (checkDualResidualTermDialect hostModuleCheckGoodDualResidualTermText).isNone

/-- On-disk DualResidual leftover dualResidualReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodDualResidualReadyMultilineText : String :=
  "def dualResidualReady : Bool :=\n" ++
  "  ProductPath.productPathCloseReady\n" ++
  "    && dualResidualSurfaceOk\n" ++
  "    && dualResidualSurfacesDistinct\n" ++
  "    && !hostElaboratorResidualRemains\n" ++
  "    && !productResidualRemains\n" ++
  "    && productResidualFreeMeasureCited\n" ++
  "    && residualFreeMeasureAgreesFree\n" ++
  "    && hostElaboratorResidualFreeClaimed\n" ++
  "    && residualFreeClaimed\n" ++
  "    && productSelfHostCompleteClaimed\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line dualResidualReady body. -/
def hostModuleCheckDualResidualReadyMultilineOk : Bool :=
  dualResidualReadyBodyOk hostModuleCheckGoodDualResidualReadyMultilineText

def hostModuleCheckDualResidualTermSurfaceOk : Bool :=
  hostModuleCheckDualResidualTermSurfaceDualOk
    && (checkDepthDualResidualTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthDualResidualTermSurfaceScope == "DualResidual-only")
    && hostModuleCheckDualResidualTermDialectOk
    && hostModuleCheckBadDualResidualReadyDialectReject
    && hostModuleCheckBadDualResidualResidualFreeDialectReject
    && hostModuleCheckBadDualResidualHostFreeDialectReject
    && hostModuleCheckBadDualResidualReadyL0Accept
    && hostModuleCheckBadDualResidualResidualFreeL0Accept
    && hostModuleCheckBadDualResidualHostFreeL0Accept
    && hostModuleCheckDualResidualReadyMultilineOk

theorem hostModuleCheckDualResidualTermSurfaceOk_true :
    hostModuleCheckDualResidualTermSurfaceOk = true := by native_decide

theorem hostModuleCheckDualResidualReadyMultilineOk_true :
    hostModuleCheckDualResidualReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_dual_residual_term_surface_ids_eq :
    checkDepthDualResidualTermSurfaceBar = "TERM-SURFACE"
      && checkDepthDualResidualTermSurfaceScope = "DualResidual-only"
      && hostModuleCheckDualResidualTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
