/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckProductOutKernelTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckProductOutKernelTermSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckProductOutKernelTerm.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckProductOutKernelTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPRODUCTOUTKERNELTERM, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm

/-- Dual-pinned live HostModuleCheckProductOutKernelTerm.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckProductOutKernelTermSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPRODUCTOUTKERNELTERM. -/
def liveHostModuleCheckProductOutKernelTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ProductOutKernel L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProductOutKernel dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ProductOutKernel L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_PRODUCT_OUT_V0".
  - hostId body "HOST-SELF-HOST-PRODUCT-OUT".
  - selfHostId body "SELF-HOST-PRODUCT-OUT".
  - productOutKernelModuleCite body "ProductOutKernel".
  - productOutKernelEvidencePartialReady definitional alias productOutKernelBarSurfaceOk.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProductOutKernelTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProductOutKernelTermSurfaceOk.

  Intentional non-claims:
  - ProductOutKernel pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProductOutKernelTerm, TERM-SURFACE, ProductOutKernel-only,
  ILL-TYPED-TERM, checkProductOutKernelTermDialect,
  hostModuleCheckBadProductOutKernelStageIdText,
  hostModuleCheckBadProductOutKernelReadyText,
  hostModuleCheckBadProductOutKernelOkText,
  hostModuleCheckBadProductOutKernelCiteText,
  hostModuleCheckProductOutKernelTermDialectOk,
  hostModuleCheckProductOutKernelTermSurfaceDualOk,
  hostModuleCheckProductOutKernelTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProductOutKernelTerm
  Red/green: lake build SystemsLean.HostModuleCheckProductOutKernelTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### ProductOutKernel L2 term-surface dual-ok pins (ProductOutKernel-only) -/

def checkDepthProductOutKernelTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProductOutKernelTermSurfaceScope : String := "ProductOutKernel-only"
def hostModuleCheckProductOutKernelTermSurfaceDualOk : Bool := true

def productOutKernelStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_PRODUCT_OUT_V0\""

def productOutKernelHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostId" with
  | none => false
  | some body => body == "\"HOST-SELF-HOST-PRODUCT-OUT\""

def productOutKernelSelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostId" with
  | none => false
  | some body => body == "\"SELF-HOST-PRODUCT-OUT\""

def productOutKernelCiteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "productOutKernelModuleCite" with
  | none => false
  | some body => body == "\"ProductOutKernel\""

def productOutKernelReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "productOutKernelEvidencePartialReady" with
  | none => false
  | some body => body == "productOutKernelBarSurfaceOk"

def checkProductOutKernelTermDialect (content : String) : Option String :=
  if !productOutKernelStageIdBodyOk content then some reasonIllTypedTerm
  else if !productOutKernelHostIdBodyOk content then some reasonIllTypedTerm
  else if !productOutKernelSelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !productOutKernelCiteBodyOk content then some reasonIllTypedTerm
  else if !productOutKernelReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProductOutKernelWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProductOutKernelTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProductOutKernelTermSkeletonPrefix : String :=
  "namespace SystemsLean.ProductOutKernel\n"

def hostModuleCheckProductOutKernelTermSkeletonSuffix : String :=
  "end SystemsLean.ProductOutKernel\n"

def hostModuleCheckProductOutKernelTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n" ++
  "def productOutPath : String := \"out/freestanding-c/\"\n" ++
  "def productOutApiMult : String := \"slake_mult_is_valid\"\n" ++
  "def productOutApiLinear : String := \"slake_linear_consume\"\n" ++
  "def productOutApiErasure : String := \"slake_erasure_is_runtime_absent\"\n" ++
  "def productOutApiTypes : String := \"slake_type_tag\"\n" ++
  "def productOutApiProgram : String := \"slake_ir_program\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := productOutKernelBarSurfaceOk\n"

def hostModuleCheckGoodProductOutKernelTermText : String :=
  hostModuleCheckProductOutKernelTermSkeletonPrefix
    ++ hostModuleCheckProductOutKernelTermGoodMid
    ++ hostModuleCheckProductOutKernelTermSkeletonSuffix

def hostModuleCheckBadProductOutKernelStageIdText : String :=
  hostModuleCheckProductOutKernelTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := productOutKernelBarSurfaceOk\n" ++
  hostModuleCheckProductOutKernelTermSkeletonSuffix

def hostModuleCheckBadProductOutKernelReadyText : String :=
  hostModuleCheckProductOutKernelTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := true\n" ++
  hostModuleCheckProductOutKernelTermSkeletonSuffix

def hostModuleCheckBadProductOutKernelOkText : String :=
  hostModuleCheckProductOutKernelTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n" ++
  "def hostId : String := \"WRONG_HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := productOutKernelBarSurfaceOk\n" ++
  hostModuleCheckProductOutKernelTermSkeletonSuffix

def hostModuleCheckBadProductOutKernelCiteText : String :=
  hostModuleCheckProductOutKernelTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"WrongCite\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := productOutKernelBarSurfaceOk\n" ++
  hostModuleCheckProductOutKernelTermSkeletonSuffix

def productOutKernelTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProductOutKernel"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadProductOutKernelStageIdL0Accept : Bool :=
  (checkNamedSurface (productOutKernelTermSurfaceFrom
      hostModuleCheckBadProductOutKernelStageIdText)
    productOutKernelExpectedNamespace productOutKernelRequiredDecls none).isAccept

def hostModuleCheckBadProductOutKernelReadyL0Accept : Bool :=
  (checkNamedSurface (productOutKernelTermSurfaceFrom
      hostModuleCheckBadProductOutKernelReadyText)
    productOutKernelExpectedNamespace productOutKernelRequiredDecls none).isAccept

def hostModuleCheckBadProductOutKernelOkL0Accept : Bool :=
  (checkNamedSurface (productOutKernelTermSurfaceFrom
      hostModuleCheckBadProductOutKernelOkText)
    productOutKernelExpectedNamespace productOutKernelRequiredDecls none).isAccept

def hostModuleCheckBadProductOutKernelCiteL0Accept : Bool :=
  (checkNamedSurface (productOutKernelTermSurfaceFrom
      hostModuleCheckBadProductOutKernelCiteText)
    productOutKernelExpectedNamespace productOutKernelRequiredDecls none).isAccept

def hostModuleCheckProductOutKernelTermDialectOk : Bool :=
  (checkProductOutKernelTermDialect hostModuleCheckGoodProductOutKernelTermText).isNone

def hostModuleCheckBadProductOutKernelStageIdDialectReject : Bool :=
  match checkProductOutKernelTermDialect hostModuleCheckBadProductOutKernelStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProductOutKernelReadyDialectReject : Bool :=
  match checkProductOutKernelTermDialect hostModuleCheckBadProductOutKernelReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProductOutKernelOkDialectReject : Bool :=
  match checkProductOutKernelTermDialect hostModuleCheckBadProductOutKernelOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProductOutKernelCiteDialectReject : Bool :=
  match checkProductOutKernelTermDialect hostModuleCheckBadProductOutKernelCiteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckProductOutKernelTermSurfaceOk : Bool :=
  hostModuleCheckProductOutKernelTermSurfaceDualOk
    && (checkDepthProductOutKernelTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProductOutKernelTermSurfaceScope == "ProductOutKernel-only")
    && hostModuleCheckProductOutKernelTermDialectOk
    && hostModuleCheckBadProductOutKernelStageIdDialectReject
    && hostModuleCheckBadProductOutKernelReadyDialectReject
    && hostModuleCheckBadProductOutKernelOkDialectReject
    && hostModuleCheckBadProductOutKernelCiteDialectReject
    && hostModuleCheckBadProductOutKernelStageIdL0Accept
    && hostModuleCheckBadProductOutKernelReadyL0Accept
    && hostModuleCheckBadProductOutKernelOkL0Accept
    && hostModuleCheckBadProductOutKernelCiteL0Accept

theorem hostModuleCheckProductOutKernelTermSurfaceOk_true :
    hostModuleCheckProductOutKernelTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_product_out_kernel_term_surface_ids_eq :
    checkDepthProductOutKernelTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProductOutKernelTermSurfaceScope = "ProductOutKernel-only"
      && hostModuleCheckProductOutKernelTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckProductOutKernelTerm
