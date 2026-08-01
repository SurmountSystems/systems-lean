/-
  SYSTEMS_LEAN_HOST partial -- KernelSelfApply KERNEL-SELF-APPLY-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.KernelSelfApply: theorems and behavioral
  smoke live here; stage ids, B-bar Mult..Program HOST-EMIT cites, Ok /
  PartialReady folds stay in KernelSelfApply. Same namespace
  SystemsLean.KernelSelfApply so theorem names stay unqualified under that
  namespace.

  Spec (readable):
  - KERNEL-SELF-APPLY-THEOREM / HOST-KERNEL-SELF-APPLY-THEOREM:
    productKernelSelfApplyPartialReady_true.
  - KERNEL-SELF-APPLY-SMOKE / HOST-KERNEL-SELF-APPLY-SMOKE: PartialReady /
    BarSurfaceOk / stage / host / Mult..Program cite behavioral examples
    (lake build fails if example fails).

  These KERNEL-SELF-APPLY theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time module does not define living-tip complete / perform /
  ownership claim bools true (emit-wire forbid). Complete true lives on tip /
  SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - KERNEL-SELF-APPLY B-bar surface honesty only -- NOT freestanding residual free.
  - NOT freestanding product self-host complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Host Lake FreestandingEmit + just build remain the live full-path performers.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-SELF-APPLY-THEOREM,
  HOST-KERNEL-SELF-APPLY-THEOREM, KERNEL-SELF-APPLY-SMOKE,
  HOST-KERNEL-SELF-APPLY-SMOKE, productKernelSelfApplyPartialReady_true,
  theorem productKernelSelfApplyPartialReady_true,
  productKernelBarSurfaceOk, productKernelBarMult, productKernelBarLinear,
  productKernelBarErasure, productKernelBarTypes, productKernelBarProgram,
  KernelSelfApplyTheorems, UNIT_SURFACE host surface, RUNTIME-FS,
  SELF-HOST-KERNEL-SELF-APPLY, product kernel self-application,
  SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0, HOST-SELF-HOST-KERNEL-SELF-APPLY,
  HOST-EMIT-MULT, HOST-EMIT-LINEAR, HOST-EMIT-ERASURE, HOST-EMIT-TYPES,
  HOST-EMIT-PROGRAM, KernelSelfApply.
  Module: SystemsLean.KernelSelfApplyTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelSelfApplyTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.KernelSelfApply

namespace SystemsLean.KernelSelfApply

/-! ### KERNEL-SELF-APPLY-THEOREM / HOST-KERNEL-SELF-APPLY-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B2
  product kernel self-application surface honesty only. Does not flip residual
  free / llvm / PROVABLY; does not claim freestanding product self-host complete.
-/

/-- KERNEL-SELF-APPLY PartialReady holds. Greppable:
    productKernelSelfApplyPartialReady_true,
    theorem productKernelSelfApplyPartialReady_true,
    KERNEL-SELF-APPLY-THEOREM, HOST-KERNEL-SELF-APPLY-THEOREM. -/
theorem productKernelSelfApplyPartialReady_true :
    productKernelSelfApplyPartialReady = true := by
  decide

/-! ### KERNEL-SELF-APPLY-SMOKE / HOST-KERNEL-SELF-APPLY-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example : productKernelSelfApplyPartialReady = true := by
  decide

example : productKernelBarSurfaceOk = true := by
  decide

example : stageId = "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0" := by
  decide

example : hostId = "HOST-SELF-HOST-KERNEL-SELF-APPLY" := by
  decide

example : selfHostId = "SELF-HOST-KERNEL-SELF-APPLY" := by
  decide

example : productKernelBarMult = "HOST-EMIT-MULT" := by
  decide

example : productKernelBarLinear = "HOST-EMIT-LINEAR" := by
  decide

example : productKernelBarErasure = "HOST-EMIT-ERASURE" := by
  decide

example : productKernelBarTypes = "HOST-EMIT-TYPES" := by
  decide

example : productKernelBarProgram = "HOST-EMIT-PROGRAM" := by
  decide

end SystemsLean.KernelSelfApply
