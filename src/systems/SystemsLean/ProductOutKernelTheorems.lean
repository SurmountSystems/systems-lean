/-
  SYSTEMS_LEAN_HOST partial -- ProductOutKernel PRODUCT-OUT-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ProductOutKernel: theorems and behavioral
  smoke live here; stage ids, Out path + B-bar Mult..IR API cites, Ok /
  PartialReady folds stay in ProductOutKernel. Same namespace
  SystemsLean.ProductOutKernel so theorem names stay unqualified under that
  namespace.

  Spec (readable):
  - PRODUCT-OUT-THEOREM / HOST-PRODUCT-OUT-THEOREM:
    productOutKernelEvidencePartialReady_true.
  - PRODUCT-OUT-SMOKE / HOST-PRODUCT-OUT-SMOKE: PartialReady / BarSurfaceOk /
    stage / host / Out path / Mult..IR API cite behavioral examples
    (lake build fails if example fails).

  These PRODUCT-OUT theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time module does not define living-tip complete / perform /
  ownership claim bools true (emit-wire forbid). Complete true lives on tip /
  SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - PRODUCT-OUT kernel evidence surface honesty only -- NOT freestanding residual free.
  - NOT freestanding product self-host complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Host Lake FreestandingEmit + just build remain the live full-path performers.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PRODUCT-OUT-THEOREM,
  HOST-PRODUCT-OUT-THEOREM, PRODUCT-OUT-SMOKE,
  HOST-PRODUCT-OUT-SMOKE, productOutKernelEvidencePartialReady_true,
  theorem productOutKernelEvidencePartialReady_true,
  productOutKernelBarSurfaceOk, productOutPath, productOutApiMult,
  productOutApiLinear, productOutApiErasure, productOutApiTypes,
  productOutApiProgram, ProductOutKernelTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-OUT, product Out kernel evidence,
  SLAKE_SELF_HOST_PRODUCT_OUT_V0, HOST-SELF-HOST-PRODUCT-OUT,
  out/freestanding-c/, slake_mult_is_valid, slake_linear_consume,
  slake_erasure_is_runtime_absent, slake_type_tag, slake_ir_program,
  ProductOutKernel.
  Module: SystemsLean.ProductOutKernelTheorems
  Red/green: just systems-host; lake build SystemsLean.ProductOutKernelTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.ProductOutKernel

namespace SystemsLean.ProductOutKernel

/-! ### PRODUCT-OUT-THEOREM / HOST-PRODUCT-OUT-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B3
  product Out kernel evidence surface honesty only. Does not flip residual
  free / llvm / PROVABLY; does not claim freestanding product self-host complete.
-/

/-- PRODUCT-OUT PartialReady holds. Greppable:
    productOutKernelEvidencePartialReady_true,
    theorem productOutKernelEvidencePartialReady_true,
    PRODUCT-OUT-THEOREM, HOST-PRODUCT-OUT-THEOREM. -/
theorem productOutKernelEvidencePartialReady_true :
    productOutKernelEvidencePartialReady = true := by
  decide

/-! ### PRODUCT-OUT-SMOKE / HOST-PRODUCT-OUT-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example : productOutKernelEvidencePartialReady = true := by
  decide

example : productOutKernelBarSurfaceOk = true := by
  decide

example : stageId = "SLAKE_SELF_HOST_PRODUCT_OUT_V0" := by
  decide

example : hostId = "HOST-SELF-HOST-PRODUCT-OUT" := by
  decide

example : selfHostId = "SELF-HOST-PRODUCT-OUT" := by
  decide

example : productOutPath = "out/freestanding-c/" := by
  decide

example : productOutApiMult = "slake_mult_is_valid" := by
  decide

example : productOutApiLinear = "slake_linear_consume" := by
  decide

example : productOutApiErasure = "slake_erasure_is_runtime_absent" := by
  decide

example : productOutApiTypes = "slake_type_tag" := by
  decide

example : productOutApiProgram = "slake_ir_program" := by
  decide

end SystemsLean.ProductOutKernel
