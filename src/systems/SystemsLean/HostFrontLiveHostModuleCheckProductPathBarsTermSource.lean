/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckProductPathBarsTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckProductPathBarsTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckProductPathBarsTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckProductPathBarsTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPRODUCTPATHBARSTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm

/-- Dual-pinned live HostModuleCheckProductPathBarsTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckProductPathBarsTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPRODUCTPATHBARSTERM. -/
def liveHostModuleCheckProductPathBarsTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ProductPathBars leftover L2 term-surface
  (ProductPathBars TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProductPathBars leftover dialect term checks only. Same
  namespace SystemsLean.HostModuleCheck.

  Freestanding product path bar assembly dialect subset (documented; not
  full Lean 4 elaborator):
  - freestandingProductPathReady compose matches product (nine conjuncts:
    freestandingUnitProductPathReady + freestandingProgramProductPathReady +
    freestandingEmitProductPathReady + freestandingJoinProductPathReady +
    freestandingJoinProgramProductPathReady +
    freestandingSelfHostProductPathReady +
    freestandingSelfHostProgramProductPathReady +
    freestandingMatrixUnitProductPathReady +
    freestandingMatrixProgramProductPathReady).
  - No stageId / hostId / residualFreeClaimed / stillUsesLake / complete / llvm
    L0 pins on this leftover (header non-claims only).
  - No Lake twins on the ready fold.
  - No residual-free twin (not a top-level ready conjunct).
  - No LLVM / cfg / ssa / dominance twins.
  - Not HostFront Mult-first fragment. Not InventoryClose claim board.
  - Not LLVM text. Not ProductPath surface. Not PackageEnv / Soft J2 (later PE
    reuses packageBodyImportsCompilePath).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProductPathBarsTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProductPathBarsTermSurfaceOk.

  Intentional non-claims:
  - Product path bar assembly leftover only -- not package elaborate, not
    FullHost re-true.
  - Not InventoryClose. Not InventoryCloseTheorems. Not ProductPath.
  - Not ProductPathBarsTheorems. Not emit*Ready.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProductPathBarsTerm, TERM-SURFACE, ProductPathBars-only,
  ILL-TYPED-TERM, checkProductPathBarsTermDialect,
  hostModuleCheckProductPathBarsTermDialectOk,
  hostModuleCheckProductPathBarsTermSurfaceDualOk,
  hostModuleCheckProductPathBarsTermSurfaceOk,
  freestandingProductPathReady,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProductPathBarsTerm
  Red/green: lake build SystemsLean.HostModuleCheckProductPathBarsTerm;
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

/-! ### ProductPathBars leftover L2 term-surface dual-ok pins (ProductPathBars-only) -/

def checkDepthProductPathBarsTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProductPathBarsTermSurfaceScope : String := "ProductPathBars-only"
def hostModuleCheckProductPathBarsTermSurfaceDualOk : Bool := true

/-- Product freestandingProductPathReady fold (nine conjuncts only). Same string
    as the collapsed on-disk ProductPathBars leftover body so L0 fixtures and
    product match. No Lake / residual-free / llvm / complete conjuncts. -/
def freestandingProductPathReadyTermBody : String :=
  "freestandingUnitProductPathReady && freestandingProgramProductPathReady && freestandingEmitProductPathReady && freestandingJoinProductPathReady && freestandingJoinProgramProductPathReady && freestandingSelfHostProductPathReady && freestandingSelfHostProgramProductPathReady && freestandingMatrixUnitProductPathReady && freestandingMatrixProgramProductPathReady"

def productPathBarsReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "freestandingProductPathReady" with
  | none => false
  | some body => body == freestandingProductPathReadyTermBody

def checkProductPathBarsTermDialect (content : String) : Option String :=
  if !productPathBarsReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProductPathBarsWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProductPathBarsTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProductPathBarsTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.ProductPath\n"

def hostModuleCheckProductPathBarsTermSkeletonSuffix : String :=
  "end SystemsLean.ProductPath\n"

/-- Honest ProductPathBars leftover TERM mid: required L0 ready decls only.
    No stage / host / residual-free pins on this leftover. -/
def productPathBarsTermGoodPins (readyBody : String) : String :=
  "def freestandingUnitProductPathReady : Bool := true\n" ++
  "def freestandingProgramProductPathReady : Bool := true\n" ++
  "def freestandingEmitProductPathReady : Bool := true\n" ++
  "def freestandingProductPathReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckProductPathBarsTermGoodMid : String :=
  productPathBarsTermGoodPins freestandingProductPathReadyTermBody

def hostModuleCheckGoodProductPathBarsTermText : String :=
  hostModuleCheckProductPathBarsTermSkeletonPrefix
    ++ hostModuleCheckProductPathBarsTermGoodMid
    ++ hostModuleCheckProductPathBarsTermSkeletonSuffix

def hostModuleCheckBadProductPathBarsReadyText : String :=
  hostModuleCheckProductPathBarsTermSkeletonPrefix
    ++ productPathBarsTermGoodPins "true"
    ++ hostModuleCheckProductPathBarsTermSkeletonSuffix

def productPathBarsTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProductPathBars"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def productPathBarsTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (productPathBarsTermSurfaceFrom content)
    productPathBarsExpectedNamespace productPathBarsRequiredDecls
    (some "SystemsLean.CompilePath")).isAccept

def productPathBarsTermDialectReject (content : String) : Bool :=
  match checkProductPathBarsTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProductPathBarsReadyL0Accept : Bool :=
  productPathBarsTermL0Accept hostModuleCheckBadProductPathBarsReadyText

def hostModuleCheckBadProductPathBarsReadyDialectReject : Bool :=
  productPathBarsTermDialectReject hostModuleCheckBadProductPathBarsReadyText

def hostModuleCheckProductPathBarsTermDialectOk : Bool :=
  (checkProductPathBarsTermDialect hostModuleCheckGoodProductPathBarsTermText).isNone

/-- On-disk ProductPathBars leftover freestandingProductPathReady is multi-line.
    Collapse must accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodProductPathBarsReadyMultilineText : String :=
  "def freestandingProductPathReady : Bool :=\n" ++
  "  freestandingUnitProductPathReady\n" ++
  "    && freestandingProgramProductPathReady\n" ++
  "    && freestandingEmitProductPathReady\n" ++
  "    && freestandingJoinProductPathReady\n" ++
  "    && freestandingJoinProgramProductPathReady\n" ++
  "    && freestandingSelfHostProductPathReady\n" ++
  "    && freestandingSelfHostProgramProductPathReady\n" ++
  "    && freestandingMatrixUnitProductPathReady\n" ++
  "    && freestandingMatrixProgramProductPathReady\n"

/-- Collapse of the on-disk multi-line freestandingProductPathReady body. -/
def hostModuleCheckProductPathBarsReadyMultilineOk : Bool :=
  productPathBarsReadyBodyOk hostModuleCheckGoodProductPathBarsReadyMultilineText

def hostModuleCheckProductPathBarsTermSurfaceOk : Bool :=
  hostModuleCheckProductPathBarsTermSurfaceDualOk
    && (checkDepthProductPathBarsTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProductPathBarsTermSurfaceScope == "ProductPathBars-only")
    && hostModuleCheckProductPathBarsTermDialectOk
    && hostModuleCheckBadProductPathBarsReadyDialectReject
    && hostModuleCheckBadProductPathBarsReadyL0Accept
    && hostModuleCheckProductPathBarsReadyMultilineOk

theorem hostModuleCheckProductPathBarsTermSurfaceOk_true :
    hostModuleCheckProductPathBarsTermSurfaceOk = true := by native_decide

theorem hostModuleCheckProductPathBarsReadyMultilineOk_true :
    hostModuleCheckProductPathBarsReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_productPathBars_term_surface_ids_eq :
    checkDepthProductPathBarsTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProductPathBarsTermSurfaceScope = "ProductPathBars-only"
      && hostModuleCheckProductPathBarsTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm
