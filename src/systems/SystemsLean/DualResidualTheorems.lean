/-
  SYSTEMS_LEAN_HOST partial -- DualResidual DUAL-RESIDUAL-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.DualResidual: theorems and behavioral smoke
  live here; stage ids, path/cite surface, claim Bools, and dualResidualReady
  stay in DualResidual. Same namespace SystemsLean.DualResidual so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - DUAL-RESIDUAL-THEOREM / HOST-DUAL-RESIDUAL-THEOREM: stageId_eq /
    hostElaboratorResidualRemains_true / productResidualRemains_false /
    residualFreeClaimed_true / productResidualFreeMeasureCited_true /
    residualFreeMeasureAgreesFree_true / dualResidualReady_true /
    dualResidualDoesNotForgeHostFree_true / dualResidualOk_eq_ready.
  - DUAL-RESIDUAL-SMOKE / HOST-DUAL-RESIDUAL-SMOKE: stage / map / surface /
    residual / ready behavioral examples (lake build fails if example fails).

  Product residual free claimed (claim A). Host elaborator residual remains.
  freestanding product self-host complete true (claim B; SelfApplyFs alias).
  Dual residual honesty is NOT host residual free and NOT llvm / PROVABLY unlock.

  Intentional non-claims:
  - Host elaborator residual is NOT forged free.
  - NOT PROVABLY. NOT llvm unlock.
  - Free != Lake gone; free != proof complete; free != PROVABLY; free != LLVM.
  - Lake example smokes are NOT full proofs.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, DUAL-RESIDUAL-THEOREM,
  HOST-DUAL-RESIDUAL-THEOREM, DUAL-RESIDUAL-SMOKE, HOST-DUAL-RESIDUAL-SMOKE,
  stageId_eq, hostElaboratorResidualRemains_true, productResidualRemains_false,
  residualFreeClaimed_true, productResidualFreeMeasureCited_true,
  residualFreeMeasureAgreesFree_true, dualResidualReady_true,
  dualResidualDoesNotForgeHostFree_true, dualResidualOk_eq_ready,
  DualResidualTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.DualResidualTheorems
  Red/green: just systems-host; lake build SystemsLean.DualResidualTheorems.
  Module must stay ASCII.
  Product residual free claimed. Host elaborator residual remains. Not PROVABLY.
  Not freestanding emit residual free alone. Not llvm unlocked.
  Not host elaborator residual free. Not proof complete.
-/

import SystemsLean.ProductPath
import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.DualResidual

namespace SystemsLean.DualResidual

/-! ### DUAL-RESIDUAL-THEOREM / HOST-DUAL-RESIDUAL-THEOREM (readable statements,
    then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is dual residual
  honesty with product free claimed and host free not forged.
  maxRecDepth raised for productPathCloseReady / dualResidualReady unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_DUAL_RESIDUAL_V0.
    Greppable: stageId_eq, DUAL-RESIDUAL-THEOREM, HOST-DUAL-RESIDUAL-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0" := rfl

/-- Host elaborator residual still remains (Lake managed / RUNTIME-CLASSIC).
    Greppable: hostElaboratorResidualRemains_true, DUAL-RESIDUAL-THEOREM,
    HOST-DUAL-RESIDUAL-THEOREM. -/
theorem hostElaboratorResidualRemains_true :
    hostElaboratorResidualRemains = true := rfl

/-- Product freestanding wire residual is gone (product residual free claimed).
    Greppable: productResidualRemains_false, DUAL-RESIDUAL-THEOREM,
    HOST-DUAL-RESIDUAL-THEOREM. -/
theorem productResidualRemains_false : productResidualRemains = false := rfl

/-- residualFreeClaimed true (product residual free claim A).
    Greppable: residualFreeClaimed_true, DUAL-RESIDUAL-THEOREM. -/
theorem residualFreeClaimed_true : residualFreeClaimed = true := rfl

/-- Claim A residual free measure stage cites are present.
    Greppable: productResidualFreeMeasureCited_true, DUAL-RESIDUAL-THEOREM,
    PRODUCT-RESIDUAL-FREE-MEASURE. -/
theorem productResidualFreeMeasureCited_true :
    productResidualFreeMeasureCited = true := by decide

/-- Measure path agrees with free claim (cited + free + product residual gone).
    Greppable: residualFreeMeasureAgreesFree_true, DUAL-RESIDUAL-THEOREM. -/
theorem residualFreeMeasureAgreesFree_true :
    residualFreeMeasureAgreesFree = true := by decide

/-- Dual residual honesty readiness holds (product free claimed; host remains).
    Greppable: dualResidualReady_true, HOST-DUAL-RESIDUAL,
    DUAL-RESIDUAL-THEOREM, HOST-DUAL-RESIDUAL-THEOREM. -/
theorem dualResidualReady_true : dualResidualReady = true := by decide

/-- Dual residual ready does NOT forge host elaborator residual free.
    Greppable: dualResidualDoesNotForgeHostFree_true, DUAL-RESIDUAL-THEOREM,
    HOST-DUAL-RESIDUAL-THEOREM. -/
theorem dualResidualDoesNotForgeHostFree_true :
    dualResidualDoesNotForgeHostFree = true := by decide

/-- Joint-name honesty: dualResidualOk is definitional alias of dualResidualReady
    (not a stronger gate). Greppable: dualResidualOk_eq_ready,
    DUAL-RESIDUAL-THEOREM, HOST-DUAL-RESIDUAL-THEOREM. -/
theorem dualResidualOk_eq_ready : dualResidualOk = dualResidualReady := rfl

/-! ### Dual residual smoke (behavioral; lake build fails if example fails)
    Greppable: DUAL-RESIDUAL-SMOKE, HOST-DUAL-RESIDUAL-SMOKE.
    maxRecDepth already raised above for dualResidualReady unfolds. -/

/-- DUAL-RESIDUAL-SMOKE / HOST-DUAL-RESIDUAL-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0" := by decide
example : hostDualResidualId = "HOST-DUAL-RESIDUAL" := by decide
example : selfHostDualResidualId = "SELF-HOST-DUAL-RESIDUAL" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/DualResidual.lean" := by decide
example : inventoryPath = "src/systems/host-partial-inventory.md" := by decide
example : productPathCloseStageCite = "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0" :=
  by decide
example : inventoryCloseStageCite = "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0" := by decide
example : llvmHoldStageCite = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := by decide
example : hostProductPathCloseCite = "HOST-PRODUCT-PATH-CLOSE" := by decide
example : hostInventoryCloseCite = "HOST-INVENTORY-CLOSE" := by decide
example : hostLlvmHoldCite = "HOST-LLVM-HOLD" := by decide
example : hostResidualCite = "HOST-RESIDUAL" := by decide
example : productWireResidualCite = "PRODUCT-WIRE-RESIDUAL" := by decide
example : emitBoundaryCite = "EMIT-BOUNDARY" := by decide
example : runtimeFsCite = "RUNTIME-FS" := by decide
example : runtimeClassicCite = "RUNTIME-CLASSIC" := by decide
example : residualFreeMeasureStageCite =
    "SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0" := by decide
example : residualFreeMeasureHostCite = "PRODUCT-RESIDUAL-FREE-MEASURE" := by decide
example : residualFreeMeasureSelfHostCite =
    "SELF-HOST-RESIDUAL-FREE-MEASURE" := by decide
example : residualFreeMeasureNixPath =
    "nix/systems-emit-wire/residual-free-measure.nix" := by decide
example : hostElaboratorResidualToken = "host elaborator residual remains" := by decide
example : productResidualToken = "product residual free" := by decide
example : intentionalPartialToken = "intentional PARTIAL" := by decide
example : dualResidualSurfaceOk = true := by decide
example : productResidualFreeMeasureCited = true := by decide
example : residualFreeMeasureAgreesFree = true := by decide

/-- DUAL-RESIDUAL-SMOKE: host residual remains; product free claimed; unlocks false. -/
example : hostElaboratorResidualRemains = true := by decide
example : productResidualRemains = false := by decide
example : hostElaboratorResidualFreeClaimed = false := by decide
example : residualFreeClaimed = true := by decide
example : productSelfHostCompleteClaimed = true := by decide
example : SelfApplyFs.freestandingProductSelfHostComplete = true := by decide
example : LlvmHold.llvmUnlocked = false := by decide
example : LlvmHold.provablyUnlocked = false := by decide
example : dualResidualSurfacesDistinct = true := by decide

/-- DUAL-RESIDUAL-SMOKE: prior ladder close + inventory close + hold ready. -/
example : ProductPath.productPathCloseReady = true := by decide
example : InventoryClose.inventoryCloseReady = true := by decide
example : LlvmHold.llvmHoldReady = true := by decide

/-- DUAL-RESIDUAL-SMOKE / HOST-DUAL-RESIDUAL-SMOKE: dual residual ready decides
    true (product free claimed; host residual remains; not llvm / PROVABLY).
    dualResidualOk is definitional alias of dualResidualReady (joint-name honesty). -/
example : dualResidualReady = true := by decide
example : dualResidualDoesNotForgeHostFree = true := by decide
example : dualResidualOk = true := by decide
example : dualResidualOk = dualResidualReady := by decide

end SystemsLean.DualResidual
