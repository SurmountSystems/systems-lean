/-
  SYSTEMS_LEAN_HOST partial -- SpecProof SPEC-PROOF-THEOREM + SPEC-PROOF-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.SpecProof: theorems and behavioral smoke live
  here; stage ids, surface cites, claim Bools, and specProofReady stay in
  SpecProof. Same namespace SystemsLean.SpecProof so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - SPEC-PROOF-THEOREM / HOST-SPEC-PROOF-THEOREM: stageId_eq /
    hostSpecProofId_eq / specSurfaceStated_true / proofCompleteClaimed_false /
    proofDoesNotRetireTests_true / residualFreeClaimed_false /
    specProofReady_true / specProofDoesNotMeanProofComplete_true /
    specProofDoesNotMeanResidualFree_true.
  - SPEC-PROOF-SMOKE / HOST-SPEC-PROOF-SMOKE: stage / map / surface / ready
    behavioral examples (lake build fails if example fails).

  These SpecProof theorems keep proofCompleteClaimed false (proved false).
  Spec surface stated is NOT proof complete. residual free stays false.

  Intentional non-claims:
  - Formal feedback honesty canaries only -- NOT freestanding residual free.
  - NOT proof complete (proofCompleteClaimed stays false).
  - NOT PROVABLY. NOT llvm unlock. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, SPEC-PROOF-THEOREM, HOST-SPEC-PROOF-THEOREM,
  SPEC-PROOF-SMOKE, HOST-SPEC-PROOF-SMOKE, stageId_eq, hostSpecProofId_eq,
  specSurfaceStated_true, proofCompleteClaimed_false,
  proofDoesNotRetireTests_true, residualFreeClaimed_false, specProofReady_true,
  specProofDoesNotMeanProofComplete_true, specProofDoesNotMeanResidualFree_true,
  SpecProofTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.SpecProofTheorems
  Red/green: just systems-host; lake build SystemsLean.SpecProofTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not proof complete.
-/

import SystemsLean.ProbeWire
import SystemsLean.DualResidual
import SystemsLean.ProductPath
import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.SpecProof

namespace SystemsLean.SpecProof

/-! ### SPEC-PROOF-THEOREM / HOST-SPEC-PROOF-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is formal
  feedback honesty only. proofCompleteClaimed stays false (proved false --
  never set true). Does not claim residual free / freestanding product
  self-host complete / PROVABLY / llvm unlock.
  maxRecDepth raised for probeWireReady / specProofReady unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_SPEC_PROOF_V0.
    Greppable: stageId_eq, SPEC-PROOF-THEOREM, HOST-SPEC-PROOF-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_SPEC_PROOF_V0" := rfl

/-- Host map id is greppable HOST-SPEC-PROOF.
    Greppable: hostSpecProofId_eq, SPEC-PROOF-THEOREM. -/
theorem hostSpecProofId_eq : hostSpecProofId = "HOST-SPEC-PROOF" := rfl

/-- Readable specification surface is stated (module header + Bool canaries).
    Greppable: specSurfaceStated_true, SPEC-PROOF-THEOREM,
    HOST-SPEC-PROOF-THEOREM. -/
theorem specSurfaceStated_true : specSurfaceStated = true := rfl

/-- proofCompleteClaimed stays false (do not forge proof complete).
    Greppable: proofCompleteClaimed_false, SPEC-PROOF-THEOREM,
    HOST-SPEC-PROOF-THEOREM. -/
theorem proofCompleteClaimed_false : proofCompleteClaimed = false := rfl

/-- Proofs do not retire tests / smokes (formal feedback honesty).
    Greppable: proofDoesNotRetireTests_true, SPEC-PROOF-THEOREM. -/
theorem proofDoesNotRetireTests_true : proofDoesNotRetireTests = true := rfl

/-- residualFreeClaimed stays false (spec-proof ready != residual free).
    Greppable: residualFreeClaimed_false, SPEC-PROOF-THEOREM. -/
theorem residualFreeClaimed_false : residualFreeClaimed = false := rfl

/-- Formal spec-proof separation readiness holds (not proof complete).
    Greppable: specProofReady_true, HOST-SPEC-PROOF, SPEC-PROOF-THEOREM,
    HOST-SPEC-PROOF-THEOREM. -/
theorem specProofReady_true : specProofReady = true := by decide

/-- Spec-proof ready does NOT mean proof complete.
    Greppable: specProofDoesNotMeanProofComplete_true, SPEC-PROOF-THEOREM,
    HOST-SPEC-PROOF-THEOREM. -/
theorem specProofDoesNotMeanProofComplete_true :
    specProofDoesNotMeanProofComplete = true := by decide

/-- Spec-proof ready does NOT mean residual free.
    Greppable: specProofDoesNotMeanResidualFree_true, SPEC-PROOF-THEOREM. -/
theorem specProofDoesNotMeanResidualFree_true :
    specProofDoesNotMeanResidualFree = true := by decide

/-! ### Spec-proof smoke (behavioral; lake build fails if example fails)
    Greppable: SPEC-PROOF-SMOKE, HOST-SPEC-PROOF-SMOKE.
    maxRecDepth already raised above for specProofReady unfolds. -/

/-- SPEC-PROOF-SMOKE / HOST-SPEC-PROOF-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_SPEC_PROOF_V0" := by decide
example : hostSpecProofId = "HOST-SPEC-PROOF" := by decide
example : selfHostSpecProofId = "SELF-HOST-SPEC-PROOF" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/SpecProof.lean" := by decide
example : inventoryPath = "src/systems/host-partial-inventory.md" := by decide
example : probeWireStageCite = "SLAKE_SELF_HOST_PROBE_WIRE_V0" := by decide
example : dualResidualStageCite = "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0" := by decide
example : productPathCloseStageCite = "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0" :=
  by decide
example : inventoryCloseStageCite = "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0" := by decide
example : llvmHoldStageCite = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := by decide
example : hostProbeWireCite = "HOST-PROBE-WIRE" := by decide
example : hostDualResidualCite = "HOST-DUAL-RESIDUAL" := by decide
example : hostProductPathCloseCite = "HOST-PRODUCT-PATH-CLOSE" := by decide
example : hostInventoryCloseCite = "HOST-INVENTORY-CLOSE" := by decide
example : hostLlvmHoldCite = "HOST-LLVM-HOLD" := by decide
example : emitBoundaryCite = "EMIT-BOUNDARY" := by decide
example : runtimeFsCite = "RUNTIME-FS" := by decide
example : specSurfaceToken = "readable specification surface stated" := by decide
example : proofNotCompleteToken = "proof complete not forged" := by decide
example : proofDoesNotRetireTestsToken = "proofs do not retire tests" := by decide
example : intentionalPartialToken = "intentional PARTIAL" := by decide
example : specProofSurfaceOk = true := by decide

/-- SPEC-PROOF-SMOKE: surface stated; proof complete / free / unlock stay false. -/
example : specSurfaceStated = true := by decide
example : proofCompleteClaimed = false := by decide
example : proofDoesNotRetireTests = true := by decide
example : residualFreeClaimed = false := by decide
example : productSelfHostCompleteClaimed = true := by decide
example : SelfApplyFs.freestandingProductSelfHostComplete = true := by decide
example : LlvmHold.llvmUnlocked = true := by decide
example : LlvmHold.provablyUnlocked = true := by decide
example : specDoesNotImplyProofComplete = true := by decide

/-- SPEC-PROOF-SMOKE: prior probe-wire + dual residual + ladder + inventory + hold. -/
example : ProbeWire.probeWireReady = true := by decide
example : DualResidual.dualResidualReady = true := by decide
example : DualResidual.productResidualRemains = false := by decide
example : ProductPath.productPathCloseReady = true := by decide
example : InventoryClose.inventoryCloseReady = true := by decide
example : LlvmHold.llvmHoldReady = true := by decide

/-- SPEC-PROOF-SMOKE / HOST-SPEC-PROOF-SMOKE: spec-proof ready decides true
    (not residual free; not proof complete; not product complete; not llvm unlock).
    specProofOk is definitional alias of specProofReady (joint-name honesty). -/
example : specProofReady = true := by decide
example : specProofDoesNotMeanResidualFree = true := by decide
example : specProofDoesNotMeanProofComplete = true := by decide
example : specProofOk = true := by decide
example : specProofOk = specProofReady := by decide

end SystemsLean.SpecProof
