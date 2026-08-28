/-
  SYSTEMS_LEAN_HOST partial -- ProductPath leftover L2 term-surface
  (ProductPath TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProductPath leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Host product-path claim-board leftover dialect subset (documented; not
  full Lean 4 elaborator):
  - productPathReady compose matches product (fourteen conjuncts:
    InventoryClose.inventoryCloseReady +
    freestandingUnitProductPathReady + freestandingProgramProductPathReady +
    freestandingEmitProductPathReady + freestandingJoinProductPathReady +
    freestandingJoinProgramProductPathReady +
    freestandingSelfHostProductPathReady +
    freestandingSelfHostProgramProductPathReady +
    freestandingMatrixUnitProductPathReady +
    freestandingMatrixProgramProductPathReady + productPathSurfaceOk +
    !residualFreeClaimed + productSelfHostCompleteClaimed +
    SelfApplyFs.freestandingProductSelfHostComplete).
  - residualFreeClaimed is L0 presence false and a ready conjunct
    (!residualFreeClaimed). Not a DualResidual ILL.
  - productPathOk aliases productPathReady.
  - No Lake twins on the ready fold (no stillUsesLake / dependsOnLake).
  - No residual-free twin (L0 requires the name present as false).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not FirstSurface. Not HostPackageWrite.
  - Not LLVM text. Not ProductPathBars. Not PackageEnv / Soft J2 (later PE
    invents packageBodyImportsInventoryClose).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProductPathTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProductPathTermSurfaceOk.

  Intentional non-claims:
  - Host product-path leftover only -- not package elaborate, not FullHost
    re-true.
  - Not ProductPathBars. Not ProductPathTheorems. Not InventoryCloseTheorems.
  - Not DualResidual. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Does not flip residualFreeClaimed (stays false).
  - Does not flip productSelfHostCompleteClaimed or
    SelfApplyFs.freestandingProductSelfHostComplete.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProductPathTerm, TERM-SURFACE, ProductPath-only,
  ILL-TYPED-TERM, checkProductPathTermDialect,
  hostModuleCheckProductPathTermDialectOk,
  hostModuleCheckProductPathTermSurfaceDualOk,
  hostModuleCheckProductPathTermSurfaceOk,
  productPathReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProductPathTerm
  Red/green: lake build SystemsLean.HostModuleCheckProductPathTerm;
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

/-! ### ProductPath leftover L2 term-surface dual-ok pins (ProductPath-only) -/

def checkDepthProductPathTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProductPathTermSurfaceScope : String := "ProductPath-only"
def hostModuleCheckProductPathTermSurfaceDualOk : Bool := true

/-- Product productPathReady fold (fourteen conjuncts only). Same string
    as the collapsed on-disk ProductPath leftover body so L0 fixtures and
    product match. No Lake / llvm / dominance conjuncts. residual-free
    stays a false conjunct, not an ILL twin. -/
def productPathReadyTermBody : String :=
  "InventoryClose.inventoryCloseReady && freestandingUnitProductPathReady && freestandingProgramProductPathReady && freestandingEmitProductPathReady && freestandingJoinProductPathReady && freestandingJoinProgramProductPathReady && freestandingSelfHostProductPathReady && freestandingSelfHostProgramProductPathReady && freestandingMatrixUnitProductPathReady && freestandingMatrixProgramProductPathReady && productPathSurfaceOk && !residualFreeClaimed && productSelfHostCompleteClaimed && SelfApplyFs.freestandingProductSelfHostComplete"

def productPathReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "productPathReady" with
  | none => false
  | some body => body == productPathReadyTermBody

def checkProductPathTermDialect (content : String) : Option String :=
  if !productPathReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProductPathWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProductPathTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProductPathTermSkeletonPrefix : String :=
  "import SystemsLean.InventoryClose\n" ++
  "namespace SystemsLean.ProductPath\n"

def hostModuleCheckProductPathTermSkeletonSuffix : String :=
  "end SystemsLean.ProductPath\n"

/-- Honest ProductPath leftover TERM mid: required L0 decls. Stage /
    host ids match product ProductPath leftover. residualFreeClaimed
    stays false (L0 presence and ready conjunct; not a DualResidual ILL). -/
def productPathTermGoodPins (readyBody : String) : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_V0\"\n" ++
  "def hostProductPathId : String := \"HOST-PRODUCT-PATH\"\n" ++
  "def residualFreeClaimed : Bool := false\n" ++
  "def productPathReady : Bool := " ++ readyBody ++ "\n" ++
  "def productPathOk : Bool := productPathReady\n"

def hostModuleCheckProductPathTermGoodMid : String :=
  productPathTermGoodPins productPathReadyTermBody

def hostModuleCheckGoodProductPathTermText : String :=
  hostModuleCheckProductPathTermSkeletonPrefix
    ++ hostModuleCheckProductPathTermGoodMid
    ++ hostModuleCheckProductPathTermSkeletonSuffix

def hostModuleCheckBadProductPathReadyText : String :=
  hostModuleCheckProductPathTermSkeletonPrefix
    ++ productPathTermGoodPins "true"
    ++ hostModuleCheckProductPathTermSkeletonSuffix

def productPathTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProductPath"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def productPathTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (productPathTermSurfaceFrom content)
    productPathExpectedNamespace productPathRequiredDecls
    (some "SystemsLean.InventoryClose")).isAccept

def productPathTermDialectReject (content : String) : Bool :=
  match checkProductPathTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProductPathReadyL0Accept : Bool :=
  productPathTermL0Accept hostModuleCheckBadProductPathReadyText

def hostModuleCheckBadProductPathReadyDialectReject : Bool :=
  productPathTermDialectReject hostModuleCheckBadProductPathReadyText

def hostModuleCheckProductPathTermDialectOk : Bool :=
  (checkProductPathTermDialect hostModuleCheckGoodProductPathTermText).isNone

/-- On-disk ProductPath leftover productPathReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodProductPathReadyMultilineText : String :=
  "def productPathReady : Bool :=\n" ++
  "  InventoryClose.inventoryCloseReady\n" ++
  "    && freestandingUnitProductPathReady\n" ++
  "    && freestandingProgramProductPathReady\n" ++
  "    && freestandingEmitProductPathReady\n" ++
  "    && freestandingJoinProductPathReady\n" ++
  "    && freestandingJoinProgramProductPathReady\n" ++
  "    && freestandingSelfHostProductPathReady\n" ++
  "    && freestandingSelfHostProgramProductPathReady\n" ++
  "    && freestandingMatrixUnitProductPathReady\n" ++
  "    && freestandingMatrixProgramProductPathReady\n" ++
  "    && productPathSurfaceOk\n" ++
  "    && !residualFreeClaimed\n" ++
  "    && productSelfHostCompleteClaimed\n" ++
  "    && SelfApplyFs.freestandingProductSelfHostComplete\n"

/-- Collapse of the on-disk multi-line productPathReady body. -/
def hostModuleCheckProductPathReadyMultilineOk : Bool :=
  productPathReadyBodyOk hostModuleCheckGoodProductPathReadyMultilineText

def hostModuleCheckProductPathTermSurfaceOk : Bool :=
  hostModuleCheckProductPathTermSurfaceDualOk
    && (checkDepthProductPathTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProductPathTermSurfaceScope == "ProductPath-only")
    && hostModuleCheckProductPathTermDialectOk
    && hostModuleCheckBadProductPathReadyDialectReject
    && hostModuleCheckBadProductPathReadyL0Accept
    && hostModuleCheckProductPathReadyMultilineOk

theorem hostModuleCheckProductPathTermSurfaceOk_true :
    hostModuleCheckProductPathTermSurfaceOk = true := by native_decide

theorem hostModuleCheckProductPathReadyMultilineOk_true :
    hostModuleCheckProductPathReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_productPath_term_surface_ids_eq :
    checkDepthProductPathTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProductPathTermSurfaceScope = "ProductPath-only"
      && hostModuleCheckProductPathTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
