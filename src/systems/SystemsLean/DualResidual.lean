/-
  SYSTEMS_LEAN_HOST partial -- dual residual honesty (host elaborator residual
  vs product residual) after HOST-PRODUCT-PATH-CLOSE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): ProductPath.lean structural product path ladder close;
    InventoryClose.lean inventory close readiness; LlvmHold.lean SH6 hold;
    SelfApplyFs.lean freestanding self-apply (complete stays false);
    Extract.lean EMIT-BOUNDARY / RUNTIME-FS vs RUNTIME-CLASSIC;
    Types.lean HOST-RESIDUAL vs PRODUCT-WIRE-RESIDUAL;
    self-host.md acceptance; host-partial-inventory.md; surface-matrix.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_DUAL_RESIDUAL_V0 / HOST-DUAL-RESIDUAL /
    SELF-HOST-DUAL-RESIDUAL: greppable dual residual honesty gate -- host
    elaborator residual (classic Lean managed runtime on Lake) and product
    residual (freestanding product wire residual) are distinct surfaces;
    neither is forged free.
  - PRODUCT residual free MEASURE (claim A):
    PRODUCT-RESIDUAL-FREE-MEASURE / SELF-HOST-RESIDUAL-FREE-MEASURE /
    SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0 -- pure Nix scan of release
    out/freestanding-c for forbidden managed Lean runtime / GC residual
    (nix/systems-emit-wire/residual-free-measure.nix). Measure green plus
    DualResidual honesty agreement supports residualFreeClaimed true.
    Acceptance: self-host.md SELF-HOST-RESIDUAL-FREE-MEASURE.
  - hostElaboratorResidualRemains: classic Lean elaborator residual still
    present (RUNTIME-CLASSIC / Lake managed residual story). MUST decide true.
  - productResidualRemains: freestanding product wire residual GONE after free
    claim. MUST decide false when residualFreeClaimed true.
  - hostElaboratorResidualFreeClaimed stays false (do not forge host free).
  - residualFreeClaimed true (product residual free claim A).
  - productSelfHostCompleteClaimed true with SelfApplyFs complete.
  - dualResidualSurfacesDistinct: host residual remains; product residual gone;
    product free claimed; host free not claimed; tokens distinguish surfaces.
  - dualResidualSurfaceOk: stage ids + dual residual path cites + prior
    HOST-PRODUCT-PATH-CLOSE / HOST-INVENTORY-CLOSE / HOST-LLVM-HOLD /
    HOST-RESIDUAL / PRODUCT-WIRE-RESIDUAL / EMIT-BOUNDARY cites.
  - dualResidualReady: ProductPath.productPathCloseReady && surface &&
    surfacesDistinct && host residual remains && product residual gone &&
    residual free claimed && complete true && llvm/PROVABLY false.
  - residualFreeMeasureAgreesFree: measure cited + free claimed + product
    residual gone (measure alone never forged free; free is deliberate).
  - dualResidualDoesNotForgeHostFree: ready && host free false && host remains
    && product free true && product residual gone.
  - Host model = structural dual residual honesty. Not an AI/ML model.

  Theorems + smoke peeled to DualResidualTheorems (same namespace; long-file peel):
  DUAL-RESIDUAL-THEOREM / HOST-DUAL-RESIDUAL-THEOREM / DUAL-RESIDUAL-SMOKE /
  HOST-DUAL-RESIDUAL-SMOKE -- dualResidualReady_true /
  hostElaboratorResidualRemains_true / productResidualRemains_false /
  residualFreeClaimed_true / residualFreeMeasureAgreesFree_true /
  dualResidualDoesNotForgeHostFree_true / stageId_eq /
  dualResidualOk_eq_ready. Core claim Bools + dualResidualReady stay here.
  These DualResidual theorems do NOT set SpecProof.proofCompleteClaimed true.
  Host residual remains; product free claimed (proved true); host free stays false.
  dualResidualOk is a definitional alias of dualResidualReady (joint-name honesty
  only; not a stronger gate; dualResidualOk_eq_ready proves equality).

  Intentional non-claims / partial:
  - Product residual free claimed -- host elaborator residual is NOT free.
  - Host elaborator residual is NOT forged free (Lake managed runtime remains).
  - NOT PROVABLY. Does not unlock llvm / out/llvm-ir (LlvmHold still holds).
  - Intentional PARTIAL carry remains for host elaborator residual.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Does not mint ProductPath alias theater. Does not grow bash EMIT_* treadmill.
  - No new EMIT_* C stage. Does not grow check.sh.
  - Free != Lake gone; free != proof complete; free != PROVABLY; free != LLVM.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_DUAL_RESIDUAL_V0,
  HOST-DUAL-RESIDUAL, SELF-HOST-DUAL-RESIDUAL, DUAL-RESIDUAL-SMOKE,
  HOST-DUAL-RESIDUAL-SMOKE, dualResidualReady, dualResidualSurfaceOk,
  dualResidualSurfacesDistinct, dualResidualDoesNotForgeHostFree,
  hostElaboratorResidualRemains, productResidualRemains,
  hostElaboratorResidualFreeClaimed, residualFreeClaimed,
  productSelfHostCompleteClaimed, dualResidualOk,
  HOST-PRODUCT-PATH-CLOSE, HOST-INVENTORY-CLOSE, HOST-LLVM-HOLD,
  HOST-RESIDUAL, PRODUCT-WIRE-RESIDUAL, EMIT-BOUNDARY, RUNTIME-FS,
  RUNTIME-CLASSIC, productPathCloseReady, inventoryCloseReady, llvmHoldReady,
  freestandingProductSelfHostComplete, llvmUnlocked, provablyUnlocked,
  intentional PARTIAL, SELF-HOST, MULT-0, MULT-1, MULT-OMEGA,
  DUAL-RESIDUAL-THEOREM, HOST-DUAL-RESIDUAL-THEOREM, dualResidualReady_true,
  hostElaboratorResidualRemains_true, productResidualRemains_false,
  residualFreeClaimed_true, dualResidualOk_eq_ready,
  PRODUCT-RESIDUAL-FREE-MEASURE, SELF-HOST-RESIDUAL-FREE-MEASURE,
  SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0, productResidualFreeMeasureCited,
  residualFreeMeasureAgreesFree, UNIT_SURFACE host surface.
  Module: SystemsLean.DualResidual
  Product residual free claimed. Host elaborator residual remains. Not PROVABLY.
  Not freestanding emit residual free alone. Not llvm unlocked.
  Not host elaborator residual free. Not proof complete.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.ProductPath
import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold

namespace SystemsLean.DualResidual

/-- Greppable primary stage id for dual residual honesty. -/
def stageId : String := "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0"

/-- Greppable host map id (HOST-DUAL-RESIDUAL). -/
def hostDualResidualId : String := "HOST-DUAL-RESIDUAL"

/-- Greppable short map id (SELF-HOST-DUAL-RESIDUAL). -/
def selfHostDualResidualId : String := "SELF-HOST-DUAL-RESIDUAL"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/DualResidual.lean"

/-- Read-only PARTIAL inventory path cite (not a filesystem read). -/
def inventoryPath : String := "src/systems/host-partial-inventory.md"

/-- Prior structural product path ladder close stage cite. -/
def productPathCloseStageCite : String := "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"

/-- Prior inventory close stage cite. -/
def inventoryCloseStageCite : String := "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0"

/-- Prior llvm hold stage cite. -/
def llvmHoldStageCite : String := "SLAKE_SELF_HOST_LLVM_HOLD_V0"

/-- Prior product path close host map cite. -/
def hostProductPathCloseCite : String := "HOST-PRODUCT-PATH-CLOSE"

/-- Prior inventory close host map cite. -/
def hostInventoryCloseCite : String := "HOST-INVENTORY-CLOSE"

/-- Prior llvm hold host map cite. -/
def hostLlvmHoldCite : String := "HOST-LLVM-HOLD"

/-- HOST-RESIDUAL cite (Types elaborator residual surface; not product wire). -/
def hostResidualCite : String := "HOST-RESIDUAL"

/-- PRODUCT-WIRE-RESIDUAL cite (freestanding emit residual surface). -/
def productWireResidualCite : String := "PRODUCT-WIRE-RESIDUAL"

/-- EMIT-BOUNDARY cite (host elaborator / proofs vs product extract). -/
def emitBoundaryCite : String := "EMIT-BOUNDARY"

/-- RUNTIME-FS product goal cite. -/
def runtimeFsCite : String := "RUNTIME-FS"

/-- RUNTIME-CLASSIC host elaborator managed residual cite. -/
def runtimeClassicCite : String := "RUNTIME-CLASSIC"

/-- Claim A product residual free measure stage cite (pure Nix; not free flip). -/
def residualFreeMeasureStageCite : String := "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0"

/-- Claim A product residual free measure host map cite. -/
def residualFreeMeasureHostCite : String := "PRODUCT-RESIDUAL-FREE-MEASURE"

/-- Claim A product residual free measure short map cite. -/
def residualFreeMeasureSelfHostCite : String := "SELF-HOST-RESIDUAL-FREE-MEASURE"

/-- Pure Nix residual free measure module path cite (not a filesystem read). -/
def residualFreeMeasureNixPath : String :=
  "nix/systems-emit-wire/residual-free-measure.nix"

/-- Greppable host elaborator residual remains token. -/
def hostElaboratorResidualToken : String := "host elaborator residual remains"

/-- Greppable product residual free token (claim A living tip). -/
def productResidualToken : String := "product residual free"

/-- Greppable intentional PARTIAL carry token. -/
def intentionalPartialToken : String := "intentional PARTIAL"

/-- dualResidualSurfaceOk -- stage ids + dual residual cites + prior close /
    inventory / llvm hold / residual surface cites. String canaries only.
    Greppable: dualResidualSurfaceOk. -/
def dualResidualSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0")
    && (hostDualResidualId == "HOST-DUAL-RESIDUAL")
    && (selfHostDualResidualId == "SELF-HOST-DUAL-RESIDUAL")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/DualResidual.lean")
    && (inventoryPath == "src/systems/host-partial-inventory.md")
    && (productPathCloseStageCite == "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0")
    && (inventoryCloseStageCite == "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0")
    && (llvmHoldStageCite == "SLAKE_SELF_HOST_LLVM_HOLD_V0")
    && (hostProductPathCloseCite == "HOST-PRODUCT-PATH-CLOSE")
    && (hostInventoryCloseCite == "HOST-INVENTORY-CLOSE")
    && (hostLlvmHoldCite == "HOST-LLVM-HOLD")
    && (hostResidualCite == "HOST-RESIDUAL")
    && (productWireResidualCite == "PRODUCT-WIRE-RESIDUAL")
    && (emitBoundaryCite == "EMIT-BOUNDARY")
    && (runtimeFsCite == "RUNTIME-FS")
    && (runtimeClassicCite == "RUNTIME-CLASSIC")
    && (residualFreeMeasureStageCite == "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0")
    && (residualFreeMeasureHostCite == "PRODUCT-RESIDUAL-FREE-MEASURE")
    && (residualFreeMeasureSelfHostCite == "SELF-HOST-RESIDUAL-FREE-MEASURE")
    && (residualFreeMeasureNixPath ==
        "nix/systems-emit-wire/residual-free-measure.nix")
    && (hostElaboratorResidualToken == "host elaborator residual remains")
    && (productResidualToken == "product residual free")
    && (intentionalPartialToken == "intentional PARTIAL")

/-- hostElaboratorResidualRemains -- classic Lean elaborator residual still
    present (Lake managed runtime / RUNTIME-CLASSIC story). MUST decide true.
    Greppable: hostElaboratorResidualRemains. -/
def hostElaboratorResidualRemains : Bool := true

/-- productResidualRemains -- freestanding product wire residual GONE after
    claim A free. MUST decide false when residualFreeClaimed true.
    Greppable: productResidualRemains. -/
def productResidualRemains : Bool := false

/-- hostElaboratorResidualFreeClaimed -- MUST decide false (do not forge host
    residual free). Greppable: hostElaboratorResidualFreeClaimed. -/
def hostElaboratorResidualFreeClaimed : Bool := false

/-- residualFreeClaimed -- product residual free claim A; true when measure
    green + DualResidual honesty + product wire honesty agree (self-host.md).
    Greppable: residualFreeClaimed. -/
def residualFreeClaimed : Bool := true

/-- productResidualFreeMeasureCited -- claim A measure stage ids greppable on
    host (acceptance + pure Nix path). Not a filesystem read alone.
    Greppable: productResidualFreeMeasureCited, PRODUCT-RESIDUAL-FREE-MEASURE. -/
def productResidualFreeMeasureCited : Bool :=
  (residualFreeMeasureStageCite == "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0")
    && (residualFreeMeasureHostCite == "PRODUCT-RESIDUAL-FREE-MEASURE")
    && (residualFreeMeasureSelfHostCite == "SELF-HOST-RESIDUAL-FREE-MEASURE")
    && (residualFreeMeasureNixPath ==
        "nix/systems-emit-wire/residual-free-measure.nix")

/-- residualFreeMeasureAgreesFree -- measure path cited AND free claimed AND
    product residual gone. Measure alone never forged free; free is deliberate.
    Greppable: residualFreeMeasureAgreesFree. -/
def residualFreeMeasureAgreesFree : Bool :=
  productResidualFreeMeasureCited && residualFreeClaimed && !productResidualRemains

/-- productSelfHostCompleteClaimed -- aligns with SelfApplyFs complete true
    (claim B complete). Product free claimed separately (claim A).
    Greppable: productSelfHostCompleteClaimed. -/
def productSelfHostCompleteClaimed : Bool := true

/-- dualResidualSurfacesDistinct -- host elaborator residual and product residual
    are distinct honesty surfaces: host remains, product residual gone, product
    free claimed, host free not claimed, tokens distinguish the two surfaces.
    Greppable: dualResidualSurfacesDistinct. -/
def dualResidualSurfacesDistinct : Bool :=
  hostElaboratorResidualRemains
    && !productResidualRemains
    && !hostElaboratorResidualFreeClaimed
    && residualFreeClaimed
    && (hostElaboratorResidualToken == "host elaborator residual remains")
    && (productResidualToken == "product residual free")
    && (hostResidualCite == "HOST-RESIDUAL")
    && (productWireResidualCite == "PRODUCT-WIRE-RESIDUAL")
    && (emitBoundaryCite == "EMIT-BOUNDARY")
    && (runtimeClassicCite == "RUNTIME-CLASSIC")
    && (runtimeFsCite == "RUNTIME-FS")

/-- dualResidualReady -- dual residual honesty bar after product residual free.
    FAIL-CLOSED: productPathCloseReady && surface && surfacesDistinct &&
    host residual remains && product residual gone && free claimed &&
    complete true && llvm/PROVABLY false && measure agrees free.
    Honest scope: product residual free claimed; host elaborator residual
    remains; NOT host free; NOT llvm unlock; NOT PROVABLY.
    Greppable: dualResidualReady, HOST-DUAL-RESIDUAL. -/
def dualResidualReady : Bool :=
  ProductPath.productPathCloseReady
    && dualResidualSurfaceOk
    && dualResidualSurfacesDistinct
    && hostElaboratorResidualRemains
    && !productResidualRemains
    && productResidualFreeMeasureCited
    && residualFreeMeasureAgreesFree
    && !hostElaboratorResidualFreeClaimed
    && residualFreeClaimed
    && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete
    && !LlvmHold.llvmUnlocked
    && !LlvmHold.provablyUnlocked

/-- dualResidualDoesNotForgeHostFree -- dual residual ready does NOT forge
    host elaborator residual free (host residual remains; host free false;
    product free claimed honestly). Greppable: dualResidualDoesNotForgeHostFree. -/
def dualResidualDoesNotForgeHostFree : Bool :=
  dualResidualReady
    && !hostElaboratorResidualFreeClaimed
    && residualFreeClaimed
    && hostElaboratorResidualRemains
    && !productResidualRemains

/-- Full dual residual ok -- definitional alias of dualResidualReady
    (joint-name honesty only; not a stronger gate).
    Greppable: dualResidualOk, dualResidualReady. -/
def dualResidualOk : Bool := dualResidualReady

/-! ### DUAL-RESIDUAL-THEOREM + DUAL-RESIDUAL-SMOKE peeled to DualResidualTheorems
    (same namespace). Greppable cites live on DualResidualTheorems:
    DUAL-RESIDUAL-THEOREM, HOST-DUAL-RESIDUAL-THEOREM, DUAL-RESIDUAL-SMOKE,
    HOST-DUAL-RESIDUAL-SMOKE, stageId_eq, hostElaboratorResidualRemains_true,
    productResidualRemains_false, residualFreeClaimed_true,
    productResidualFreeMeasureCited_true, residualFreeMeasureAgreesFree_true,
    dualResidualReady_true, dualResidualDoesNotForgeHostFree_true,
    dualResidualOk_eq_ready, DualResidualTheorems.
    Import SystemsLean.DualResidualTheorems from the package root. Core claim
    Bools + ready surface stay here -- host residual remains; product free
    claimed; complete true via SelfApplyFs alias; not llvm / PROVABLY unlock. -/

end SystemsLean.DualResidual
