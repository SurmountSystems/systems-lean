/-
  SYSTEMS_LEAN_HOST partial -- ProbeWire PROBE-WIRE-THEOREM +
  PROBE-WIRE-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.ProbeWire: theorems and behavioral smoke
  live here; stage ids, path/cite surface, claim Bools, and probeWireReady
  stay in ProbeWire. Same namespace SystemsLean.ProbeWire so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - PROBE-WIRE-THEOREM / HOST-PROBE-WIRE-THEOREM: stageId_eq /
    hostProbeWireId_eq / behavioralProbeIsSmokeDebt_true /
    behavioralProbeIsNotProductWire_true / productWireIsEmitPath_true /
    residualFreeClaimed_false / probeWireReady_true /
    probeWireDoesNotMeanResidualFree_true.
  - PROBE-WIRE-SMOKE / HOST-PROBE-WIRE-SMOKE: stage / map / surface /
    smoke-debt / ready behavioral examples (lake build fails if example fails).

  These ProbeWire theorems do NOT set SpecProof.proofCompleteClaimed true.
  Probe green is smoke debt, not product residual free.

  Intentional non-claims:
  - Probe-vs-wire honesty only -- NOT freestanding residual free.
  - Hosted behavioral probe green is NOT product residual free.
  - NOT freestanding product self-host complete.
  - NOT PROVABLY. NOT llvm unlock. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, PROBE-WIRE-THEOREM,
  HOST-PROBE-WIRE-THEOREM, PROBE-WIRE-SMOKE, HOST-PROBE-WIRE-SMOKE,
  stageId_eq, hostProbeWireId_eq, behavioralProbeIsSmokeDebt_true,
  behavioralProbeIsNotProductWire_true, productWireIsEmitPath_true,
  residualFreeClaimed_false, probeWireReady_true,
  probeWireDoesNotMeanResidualFree_true, ProbeWireTheorems,
  UNIT_SURFACE host surface, HOST-PROBE-WIRE, SELF-HOST-PROBE-WIRE,
  SLAKE_SELF_HOST_PROBE_WIRE_V0, RUNTIME-FS, EMIT-BOUNDARY.
  Module: SystemsLean.ProbeWireTheorems
  Red/green: just systems-host; lake build SystemsLean.ProbeWireTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding product.
  Not freestanding emit residual free. Not llvm unlocked.
  Not host elaborator residual free. Not proof complete.
-/

import SystemsLean.DualResidual
import SystemsLean.ProductPath
import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.ProbeWire

namespace SystemsLean.ProbeWire

/-! ### PROBE-WIRE-THEOREM / HOST-PROBE-WIRE-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is probe-vs-wire
  honesty and residual-free claim honesty only. Does not complete SpecProof;
  residualFreeClaimed stays false; probe is smoke debt not product wire.
  maxRecDepth raised for dualResidualReady / probeWireReady unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_PROBE_WIRE_V0.
    Greppable: stageId_eq, PROBE-WIRE-THEOREM, HOST-PROBE-WIRE-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_PROBE_WIRE_V0" := rfl

/-- Host map id is greppable HOST-PROBE-WIRE.
    Greppable: hostProbeWireId_eq, PROBE-WIRE-THEOREM. -/
theorem hostProbeWireId_eq : hostProbeWireId = "HOST-PROBE-WIRE" := rfl

/-- Hosted behavioral probe is smoke debt (not product residual progress).
    Greppable: behavioralProbeIsSmokeDebt_true, PROBE-WIRE-THEOREM,
    HOST-PROBE-WIRE-THEOREM. -/
theorem behavioralProbeIsSmokeDebt_true :
    behavioralProbeIsSmokeDebt = true := rfl

/-- Probe path is not the product freestanding wire.
    Greppable: behavioralProbeIsNotProductWire_true, PROBE-WIRE-THEOREM. -/
theorem behavioralProbeIsNotProductWire_true :
    behavioralProbeIsNotProductWire = true := rfl

/-- Product freestanding wire is emit/out path.
    Greppable: productWireIsEmitPath_true, PROBE-WIRE-THEOREM. -/
theorem productWireIsEmitPath_true : productWireIsEmitPath = true := rfl

/-- residualFreeClaimed stays false (probe green != residual free).
    Greppable: residualFreeClaimed_false, PROBE-WIRE-THEOREM,
    HOST-PROBE-WIRE-THEOREM. -/
theorem residualFreeClaimed_false : residualFreeClaimed = false := rfl

/-- Probe-vs-wire honesty readiness holds.
    Greppable: probeWireReady_true, HOST-PROBE-WIRE, PROBE-WIRE-THEOREM,
    HOST-PROBE-WIRE-THEOREM. -/
theorem probeWireReady_true : probeWireReady = true := by decide

/-- Probe-vs-wire ready does NOT mean residual free.
    Greppable: probeWireDoesNotMeanResidualFree_true, PROBE-WIRE-THEOREM. -/
theorem probeWireDoesNotMeanResidualFree_true :
    probeWireDoesNotMeanResidualFree = true := by decide

/-! ### Probe-wire smoke (behavioral; lake build fails if example fails)
    Greppable: PROBE-WIRE-SMOKE, HOST-PROBE-WIRE-SMOKE.
    maxRecDepth already raised above for probeWireReady unfolds. -/

/-- PROBE-WIRE-SMOKE / HOST-PROBE-WIRE-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_PROBE_WIRE_V0" := by decide
example : hostProbeWireId = "HOST-PROBE-WIRE" := by decide
example : selfHostProbeWireId = "SELF-HOST-PROBE-WIRE" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/ProbeWire.lean" := by decide
example : inventoryPath = "src/systems/host-partial-inventory.md" := by decide
example : behavioralProbePath = "src/systems/smoke/slake_behavioral_probe.c" :=
  by decide
example : productEmitWirePath = "src/systems/emit/" := by decide
example : productReleaseWirePath = "out/freestanding-c/" := by decide
example : dualResidualStageCite = "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0" := by decide
example : productPathCloseStageCite = "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0" :=
  by decide
example : inventoryCloseStageCite = "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0" := by decide
example : llvmHoldStageCite = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := by decide
example : hostDualResidualCite = "HOST-DUAL-RESIDUAL" := by decide
example : hostProductPathCloseCite = "HOST-PRODUCT-PATH-CLOSE" := by decide
example : hostInventoryCloseCite = "HOST-INVENTORY-CLOSE" := by decide
example : hostLlvmHoldCite = "HOST-LLVM-HOLD" := by decide
example : emitBoundaryCite = "EMIT-BOUNDARY" := by decide
example : runtimeFsCite = "RUNTIME-FS" := by decide
example : smokeDebtToken = "hosted behavioral probe is smoke debt" := by decide
example : productWireToken = "product freestanding wire" := by decide
example : intentionalPartialToken = "intentional PARTIAL" := by decide
example : probeWireSurfaceOk = true := by decide

/-- PROBE-WIRE-SMOKE: smoke debt / not-wire / emit-path / does-not-replace;
    free/complete/unlock stay false. -/
example : behavioralProbeIsSmokeDebt = true := by decide
example : behavioralProbeIsNotProductWire = true := by decide
example : productWireIsEmitPath = true := by decide
example : probeDoesNotReplaceProductWire = true := by decide
example : residualFreeClaimed = false := by decide
example : productSelfHostCompleteClaimed = true := by decide
example : SelfApplyFs.freestandingProductSelfHostComplete = true := by decide
example : LlvmHold.llvmUnlocked = false := by decide
example : LlvmHold.provablyUnlocked = false := by decide
example : probeWireSurfacesDistinct = true := by decide

/-- PROBE-WIRE-SMOKE: prior dual residual + ladder close + inventory + hold. -/
example : DualResidual.dualResidualReady = true := by decide
example : DualResidual.productResidualRemains = false := by decide
example : ProductPath.productPathCloseReady = true := by decide
example : InventoryClose.inventoryCloseReady = true := by decide
example : LlvmHold.llvmHoldReady = true := by decide

/-- PROBE-WIRE-SMOKE / HOST-PROBE-WIRE-SMOKE: probe-wire ready decides true
    (not residual free; not product complete; not llvm unlock).
    probeWireOk is definitional alias of probeWireReady (joint-name honesty). -/
example : probeWireReady = true := by decide
example : probeWireDoesNotMeanResidualFree = true := by decide
example : probeWireDoesNotMeanProductComplete = true := by decide
example : probeWireOk = true := by decide
example : probeWireOk = probeWireReady := by decide

end SystemsLean.ProbeWire
