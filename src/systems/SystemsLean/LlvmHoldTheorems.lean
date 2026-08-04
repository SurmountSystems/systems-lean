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
    llvmUnlocked_true / provablyUnlocked_true /
    freestandingProductSelfHostComplete_false / selfApplyDoesNotUnlockLlvm_true /
    llvmHoldReady_true / sh6HoldReady_eq_llvmHoldReady.
  - LLVM-HOLD-SMOKE / HOST-LLVM-HOLD-SMOKE: surface + llvm true + PROVABLY true
    + hold ready after unlock residual.
  - Partial LlvmHold only: not SpecProof complete. Unlock is not full backend.

  These LlvmHold theorems do NOT set SpecProof.proofCompleteClaimed true.
  llvmUnlocked true with evidence (proved true). PROVABLY true after matrix
  evidence residual. Unlock is not full CFG/SSA or Rust link.

  Intentional non-claims:
  - Unlock claimed with Mult..Graph text ladder + lake proof.
  - Does not invent full CFG/SSA or production opt pipeline.
  - Still not freestanding residual free forge on hold module. Still not
    freestanding product self-host complete on LlvmHold local pin.
  - PROVABLY claimed. Not proof complete.
  - Not freestanding emit residual free.
  - Not full LLVM backend. Not Rust-native link success.

  Greppable: SYSTEMS_LEAN_HOST, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM,
  LLVM-HOLD-SMOKE, HOST-LLVM-HOLD-SMOKE,
  llvmHoldReady_true, llvmUnlocked_true, provablyUnlocked_true,
  freestandingProductSelfHostComplete_false, selfApplyDoesNotUnlockLlvm_true,
  sh6HoldReady_eq_llvmHoldReady, stageId_eq, hostLlvmHoldId_eq,
  LlvmHoldTheorems, UNIT_SURFACE host surface, HOST-LLVM-HOLD,
  SELF-HOST-LLVM-HOLD, HOST-PROVABLY-HOLD, SLAKE_SELF_HOST_LLVM_HOLD_V0,
  MULT-0, MULT-1, MULT-OMEGA, JOIN-ALG, ConsumeToken, RUNTIME-FS.
  Module: SystemsLean.LlvmHoldTheorems
  Red/green: just systems-host; lake build SystemsLean.LlvmHoldTheorems.
  Module must stay ASCII.
  Not freestanding residual free forge. PROVABLY claimed. Not freestanding emit
  residual free. Not freestanding emit. Not proof complete. Not full LLVM backend.
-/

import SystemsLean.SelfApply
import SystemsLean.LlvmHold

namespace SystemsLean.LlvmHold

/-! ### LLVM-HOLD-THEOREM / HOST-LLVM-HOLD-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is SH6 hold
  readiness and unlock-flag honesty after unlock residual. Does not complete
  SpecProof; llvmUnlocked true with evidence; PROVABLY true. Unlock is not
  full backend.
  maxRecDepth raised for selfApplyReady / llvmHoldReady String.beq unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_LLVM_HOLD_V0.
    Greppable: stageId_eq, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_LLVM_HOLD_V0" := rfl

/-- Host map id is greppable HOST-LLVM-HOLD.
    Greppable: hostLlvmHoldId_eq, LLVM-HOLD-THEOREM. -/
theorem hostLlvmHoldId_eq : hostLlvmHoldId = "HOST-LLVM-HOLD" := rfl

/-- llvmUnlocked true after unlock residual (living SSoT; not full backend).
    Greppable: llvmUnlocked_true, LLVM-HOLD-THEOREM, HOST-LLVM-HOLD-THEOREM. -/
theorem llvmUnlocked_true : llvmUnlocked = true := rfl

/-- provablyUnlocked true after PROVABLY evidence residual (product CompCert
    matrix + lake proof). Greppable: provablyUnlocked_true, LLVM-HOLD-THEOREM,
    HOST-PROVABLY-HOLD. -/
theorem provablyUnlocked_true : provablyUnlocked = true := rfl

/-- freestandingProductSelfHostComplete stays false (local pin; tip on SelfApplyFs).
    Greppable: freestandingProductSelfHostComplete_false, LLVM-HOLD-THEOREM. -/
theorem freestandingProductSelfHostComplete_false :
    freestandingProductSelfHostComplete = false := rfl

/-- SH5 selfApplyReady composition honesty still holds after unlock.
    Greppable: selfApplyDoesNotUnlockLlvm_true, LLVM-HOLD-THEOREM. -/
theorem selfApplyDoesNotUnlockLlvm_true :
    selfApplyDoesNotUnlockLlvm = true := by decide

/-- SH6 hold gate ready holds after unlock residual.
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

/-- LLVM-HOLD-SMOKE: llvm unlock true; local complete false; PROVABLY true; hold ok. -/
example : llvmUnlocked = true := by decide
example : provablyUnlocked = true := by decide
example : freestandingProductSelfHostComplete = false := by decide
example : holdHonestyOk = true := by decide

/-- LLVM-HOLD-SMOKE: SH5 self-apply composition honesty after unlock. -/
example : SelfApply.selfApplyReady = true := by decide
example : selfApplyDoesNotUnlockLlvm = true := by decide

/-- LLVM-HOLD-SMOKE / HOST-LLVM-HOLD-SMOKE: hold ready decides true after unlock. -/
example : llvmHoldReady = true := by decide
example : sh6HoldReady = true := by decide
example : llvmHoldOk = true := by decide

end SystemsLean.LlvmHold
