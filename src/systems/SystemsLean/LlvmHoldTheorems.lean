/-
  SYSTEMS_LEAN_HOST partial -- LlvmHold LLVM-HOLD-THEOREM + HOST-LLVM-HOLD-THEOREM
  + LLVM-HOLD-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.LlvmHold: theorems and smoke live here;
  stage ids, unlock Bools, holdHonestyOk, llvmHoldReady / sh6HoldReady stay in
  LlvmHold. Same namespace SystemsLean.LlvmHold so theorem names stay unqualified
  under that namespace.

  Spec (readable):
  - LLVM-HOLD-THEOREM / HOST-LLVM-HOLD-THEOREM: stageId_eq / hostLlvmHoldId_eq /
    llvmUnlocked_false / provablyUnlocked_false /
    freestandingProductSelfHostComplete_false / selfApplyDoesNotUnlockLlvm_true /
    llvmHoldReady_true / sh6HoldReady_eq_llvmHoldReady.
  - LLVM-HOLD-SMOKE / HOST-LLVM-HOLD-SMOKE: surface + unlock false + hold ready.
  - Partial LlvmHold only: not SpecProof complete. Hold is not unlock.

  These LlvmHold theorems do NOT set SpecProof.proofCompleteClaimed true.
  Unlock flags stay false (proved false, not set true). Hold is not unlock.

  Intentional non-claims:
  - SH6 is held (documented), NOT done as llvm unlock or PROVABLY achieved.
  - Does not create product emit into out/llvm-ir.
  - Still not residual free. Still not freestanding product self-host complete.
  - Still not PROVABLY. Not proof complete.
  - Not freestanding residual free. Not freestanding emit residual free.
  - Not llvm unlocked.

  Greppable: SYSTEMS_LEAN_HOST, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM,
  LLVM-HOLD-SMOKE, HOST-LLVM-HOLD-SMOKE,
  llvmHoldReady_true, llvmUnlocked_false, provablyUnlocked_false,
  freestandingProductSelfHostComplete_false, selfApplyDoesNotUnlockLlvm_true,
  sh6HoldReady_eq_llvmHoldReady, stageId_eq, hostLlvmHoldId_eq,
  LlvmHoldTheorems, UNIT_SURFACE host surface, HOST-LLVM-HOLD,
  SELF-HOST-LLVM-HOLD, HOST-PROVABLY-HOLD, SLAKE_SELF_HOST_LLVM_HOLD_V0,
  MULT-0, MULT-1, MULT-OMEGA, JOIN-ALG, ConsumeToken, RUNTIME-FS.
  Module: SystemsLean.LlvmHoldTheorems
  Red/green: just systems-host; lake build SystemsLean.LlvmHoldTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete. Not llvm unlocked.
-/

import SystemsLean.SelfApply
import SystemsLean.LlvmHold

namespace SystemsLean.LlvmHold

/-! ### LLVM-HOLD-THEOREM / HOST-LLVM-HOLD-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is SH6 hold
  readiness and unlock-flag honesty only. Does not complete SpecProof; unlock
  flags stay false (proved false). Hold is not unlock.
  maxRecDepth raised for selfApplyReady / llvmHoldReady String.beq unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_LLVM_HOLD_V0.
    Greppable: stageId_eq, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := rfl

/-- Host map id is greppable HOST-LLVM-HOLD.
    Greppable: hostLlvmHoldId_eq, LLVM-HOLD-THEOREM. -/
theorem hostLlvmHoldId_eq : hostLlvmHoldId = "HOST-LLVM-HOLD" := rfl

/-- llvmUnlocked stays false under current evidence (hold, not unlock).
    Greppable: llvmUnlocked_false, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM. -/
theorem llvmUnlocked_false : llvmUnlocked = false := rfl

/-- provablyUnlocked stays false (real CompCert ccomp still required).
    Greppable: provablyUnlocked_false, LLVM-HOLD-THEOREM, HOST-PROVABLY-HOLD. -/
theorem provablyUnlocked_false : provablyUnlocked = false := rfl

/-- freestandingProductSelfHostComplete stays false (still open).
    Greppable: freestandingProductSelfHostComplete_false, LLVM-HOLD-THEOREM. -/
theorem freestandingProductSelfHostComplete_false :
    freestandingProductSelfHostComplete = false := rfl

/-- SH5 selfApplyReady does NOT unlock llvm.
    Greppable: selfApplyDoesNotUnlockLlvm_true, LLVM-HOLD-THEOREM. -/
theorem selfApplyDoesNotUnlockLlvm_true :
    selfApplyDoesNotUnlockLlvm = true := by decide

/-- SH6 hold gate ready holds (hold active, not unlock).
    Greppable: llvmHoldReady_true, HOST-LLVM-HOLD, LLVM-HOLD-THEOREM,
    HOST-LLVM-HOLD-THEOREM. -/
theorem llvmHoldReady_true : llvmHoldReady = true := by decide

/-- Joint-name honesty: sh6HoldReady is definitional alias of llvmHoldReady.
    Greppable: sh6HoldReady_eq_llvmHoldReady, LLVM-HOLD-THEOREM. -/
theorem sh6HoldReady_eq_llvmHoldReady : sh6HoldReady = llvmHoldReady := rfl

/-! ### Llvm hold smoke (behavioral; lake build fails if an example fails)
    Greppable: LLVM-HOLD-SMOKE, HOST-LLVM-HOLD-SMOKE.
    maxRecDepth already raised above for llvmHoldReady unfolds. -/

/-- LLVM-HOLD-SMOKE / HOST-LLVM-HOLD-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := by decide
example : hostLlvmHoldId = "HOST-LLVM-HOLD" := by decide
example : selfHostLlvmHoldId = "SELF-HOST-LLVM-HOLD" := by decide
example : hostProvablyHoldId = "HOST-PROVABLY-HOLD" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/LlvmHold.lean" := by decide
example : selfApplyStageCite = "SLAKE_SELF_HOST_SELF_APPLY_V0" := by decide
example : llvmIrPathCite = "out/llvm-ir" := by decide
example : llvmHoldSurfaceOk = true := by decide

/-- LLVM-HOLD-SMOKE: unlock / complete flags decide false (hold honesty). -/
example : llvmUnlocked = false := by decide
example : provablyUnlocked = false := by decide
example : freestandingProductSelfHostComplete = false := by decide
example : holdHonestyOk = true := by decide

/-- LLVM-HOLD-SMOKE: SH5 self-apply present does not unlock llvm. -/
example : SelfApply.selfApplyReady = true := by decide
example : selfApplyDoesNotUnlockLlvm = true := by decide

/-- LLVM-HOLD-SMOKE / HOST-LLVM-HOLD-SMOKE: hold ready decides true (not unlock). -/
example : llvmHoldReady = true := by decide
example : sh6HoldReady = true := by decide
example : llvmHoldOk = true := by decide

end SystemsLean.LlvmHold
