/-
  SYSTEMS_LEAN_HOST partial -- InventoryClose leftover L2 term-surface
  (InventoryClose TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: InventoryClose leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host inventory-close leftover / claim-board dialect subset (documented; not
  full Lean 4 elaborator):
  - inventoryCloseReady compose matches product (five conjuncts:
    SelfApplyFs.freestandingSelfApplyReady + LlvmHold.llvmHoldReady +
    inventoryCloseSurfaceOk + inventoryPartialCarryHonest +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is L0 presence only (false). Not a ready conjunct.
  - inventoryCloseOk aliases inventoryCloseReady.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (not a top-level ready conjunct).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not PackageEnv / Soft J2 (later PE invents
    packageBodyImportsSelfApplyFs).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckInventoryCloseTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckInventoryCloseTermSurfaceOk.

  Intentional non-claims:
  - Host inventory-close leftover only -- not package elaborate, not FullHost
    re-true.
  - Not ProductPathBars. Not InventoryCloseTheorems. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckInventoryCloseTerm, TERM-SURFACE, InventoryClose-only,
  ILL-TYPED-TERM, checkInventoryCloseTermDialect,
  hostModuleCheckInventoryCloseTermDialectOk,
  hostModuleCheckInventoryCloseTermSurfaceDualOk,
  hostModuleCheckInventoryCloseTermSurfaceOk,
  inventoryCloseReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckInventoryCloseTerm
  Red/green: lake build SystemsLean.HostModuleCheckInventoryCloseTerm;
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

/-! ### InventoryClose leftover L2 term-surface dual-ok pins (InventoryClose-only) -/

def checkDepthInventoryCloseTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthInventoryCloseTermSurfaceScope : String := "InventoryClose-only"
def hostModuleCheckInventoryCloseTermSurfaceDualOk : Bool := true

/-- Product inventoryCloseReady fold (five conjuncts only). Same string
    as the collapsed on-disk InventoryClose leftover body so L0 fixtures and
    product match. No Lake / residual-free / llvm / dominance conjuncts. -/
def inventoryCloseReadyTermBody : String :=
  "SelfApplyFs.freestandingSelfApplyReady && LlvmHold.llvmHoldReady && inventoryCloseSurfaceOk && inventoryPartialCarryHonest && SelfApplyFs.freestandingProductSelfHostComplete"

def inventoryCloseReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "inventoryCloseReady" with
  | none => false
  | some body => body == inventoryCloseReadyTermBody

def checkInventoryCloseTermDialect (content : String) : Option String :=
  if !inventoryCloseReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineInventoryCloseWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkInventoryCloseTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckInventoryCloseTermSkeletonPrefix : String :=
  "import SystemsLean.SelfApplyFs\n" ++
  "import SystemsLean.LlvmHold\n" ++
  "namespace SystemsLean.InventoryClose\n"

def hostModuleCheckInventoryCloseTermSkeletonSuffix : String :=
  "end SystemsLean.InventoryClose\n"

/-- Honest InventoryClose leftover TERM mid: required L0 decls. Stage /
    host ids match product InventoryClose leftover. residualFreeClaimed
    stays false (L0 presence only; not a DualResidual ILL). -/
def inventoryCloseTermGoodPins (readyBody : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_INVENTORY_CLOSE_V0\"\n" ++
  "def hostInventoryCloseId : String := \"HOST-INVENTORY-CLOSE\"\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def inventoryCloseReady : Bool := " ++ readyBody ++ "\n" ++
  "def inventoryCloseOk : Bool := inventoryCloseReady\n"

def hostModuleCheckInventoryCloseTermGoodMid : String :=
  inventoryCloseTermGoodPins inventoryCloseReadyTermBody

def hostModuleCheckGoodInventoryCloseTermText : String :=
  hostModuleCheckInventoryCloseTermSkeletonPrefix
    ++ hostModuleCheckInventoryCloseTermGoodMid
    ++ hostModuleCheckInventoryCloseTermSkeletonSuffix

def hostModuleCheckBadInventoryCloseReadyText : String :=
  hostModuleCheckInventoryCloseTermSkeletonPrefix
    ++ inventoryCloseTermGoodPins "true"
    ++ hostModuleCheckInventoryCloseTermSkeletonSuffix

def inventoryCloseTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.InventoryClose"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def inventoryCloseTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (inventoryCloseTermSurfaceFrom content)
    inventoryCloseExpectedNamespace inventoryCloseRequiredDecls
    (some "SystemsLean.SelfApplyFs")).isAccept

def inventoryCloseTermDialectReject (content : String) : Bool :=
  match checkInventoryCloseTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadInventoryCloseReadyL0Accept : Bool :=
  inventoryCloseTermL0Accept hostModuleCheckBadInventoryCloseReadyText

def hostModuleCheckBadInventoryCloseReadyDialectReject : Bool :=
  inventoryCloseTermDialectReject hostModuleCheckBadInventoryCloseReadyText

def hostModuleCheckInventoryCloseTermDialectOk : Bool :=
  (checkInventoryCloseTermDialect hostModuleCheckGoodInventoryCloseTermText).isNone

/-- On-disk InventoryClose leftover inventoryCloseReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodInventoryCloseReadyMultilineText : String :=
  "def inventoryCloseReady : Bool :=\n" ++
  "  SelfApplyFs.freestandingSelfApplyReady\n" ++
  "    && LlvmHold.llvmHoldReady\n" ++
  "    && inventoryCloseSurfaceOk\n" ++
  "    && inventoryPartialCarryHonest\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line inventoryCloseReady body. -/
def hostModuleCheckInventoryCloseReadyMultilineOk : Bool :=
  inventoryCloseReadyBodyOk hostModuleCheckGoodInventoryCloseReadyMultilineText

def hostModuleCheckInventoryCloseTermSurfaceOk : Bool :=
  hostModuleCheckInventoryCloseTermSurfaceDualOk
    && (checkDepthInventoryCloseTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthInventoryCloseTermSurfaceScope == "InventoryClose-only")
    && hostModuleCheckInventoryCloseTermDialectOk
    && hostModuleCheckBadInventoryCloseReadyDialectReject
    && hostModuleCheckBadInventoryCloseReadyL0Accept
    && hostModuleCheckInventoryCloseReadyMultilineOk

theorem hostModuleCheckInventoryCloseTermSurfaceOk_true :
    hostModuleCheckInventoryCloseTermSurfaceOk = true := by native_decide

theorem hostModuleCheckInventoryCloseReadyMultilineOk_true :
    hostModuleCheckInventoryCloseReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_inventoryClose_term_surface_ids_eq :
    checkDepthInventoryCloseTermSurfaceBar = "TERM-SURFACE"
      && checkDepthInventoryCloseTermSurfaceScope = "InventoryClose-only"
      && hostModuleCheckInventoryCloseTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
