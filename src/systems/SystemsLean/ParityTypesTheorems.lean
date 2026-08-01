/-
  SYSTEMS_LEAN_HOST partial -- ParityTypes PARITY-TYPES-THEOREM +
  PARITY-TYPES-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ParityTypes: theorems and behavioral smoke
  live here; stage ids, product API name defs, typesContractParityOk,
  typesParityReady, multLinearTypesParityReady, and typesParityOk stay in
  ParityTypes. Same namespace SystemsLean.ParityTypes so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - PARITY-TYPES-THEOREM / HOST-PARITY-TYPES-THEOREM: stageId_eq /
    hostParityTypesId_eq / selfHostParityTypesId_eq /
    typesParityReady_true / typesParityOk_true /
    typesContractParityOk_true / multLinearTypesParityReady_true +
    product*Api_eq / productTypedIrId_eq / productApiSurfaceOk_true
    frozen-ABI surface pins.
  - PARITY-TYPES-SMOKE / HOST-PARITY-TYPES-SMOKE: stage / path / product cites /
    KernelTypes + ParityLinear compose / typesParityReady behavioral examples
    (lake build fails if example fails).

  These ParityTypes theorems do NOT set SpecProof.proofCompleteClaimed true.
  Types freestanding path readiness theorems != freestanding product self-host
  complete.

  Intentional non-claims:
  - Types freestanding path honesty canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - No new EMIT_* C residual stage.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PARITY-TYPES-THEOREM,
  HOST-PARITY-TYPES-THEOREM, PARITY-TYPES-SMOKE, HOST-PARITY-TYPES-SMOKE,
  stageId_eq, hostParityTypesId_eq, selfHostParityTypesId_eq,
  typesParityReady_true, typesParityOk_true, typesContractParityOk_true,
  multLinearTypesParityReady_true, productTypedIrId_eq, productIrNodeApi_eq,
  productIrNodeInitApi_eq, productIrNodeIsWellTypedApi_eq,
  productIrNodeCheckFailClosedApi_eq, productApiSurfaceOk_true,
  ParityTypesTheorems, UNIT_SURFACE host surface, TYPED_IR_V0, slake_ir_node,
  MULT-0, MULT-1, MULT-OMEGA, HOST-PARITY-TYPES, SELF-HOST-PARITY-TYPES,
  SLAKE_SELF_HOST_PARITY_TYPES_V0, HOST-KERNEL-TYPES, HOST-PARITY-LINEAR,
  HOST-PARITY-MULT.
  Module: SystemsLean.ParityTypesTheorems
  Red/green: just systems-host; lake build SystemsLean.ParityTypesTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.KernelTypes
import SystemsLean.ParityLinear
import SystemsLean.ParityTypes

namespace SystemsLean.ParityTypes

/-! ### PARITY-TYPES-THEOREM / HOST-PARITY-TYPES-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Types
  freestanding path readiness + Mult+Linear join only. Does not complete
  SpecProof; does not claim residual free / freestanding product self-host
  complete / PROVABLY / llvm unlock.
  maxRecDepth raised for multLinearParityReady / typesKernelReady unfolds.
-/

set_option maxRecDepth 8192

/-- Primary stage id is greppable SLAKE_SELF_HOST_PARITY_TYPES_V0.
    Greppable: stageId_eq, PARITY-TYPES-THEOREM, HOST-PARITY-TYPES-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_PARITY_TYPES_V0" := rfl

/-- Host map id is greppable HOST-PARITY-TYPES.
    Greppable: hostParityTypesId_eq, PARITY-TYPES-THEOREM. -/
theorem hostParityTypesId_eq : hostParityTypesId = "HOST-PARITY-TYPES" := rfl

/-- Short map id is greppable SELF-HOST-PARITY-TYPES.
    Greppable: selfHostParityTypesId_eq, PARITY-TYPES-THEOREM. -/
theorem selfHostParityTypesId_eq :
    selfHostParityTypesId = "SELF-HOST-PARITY-TYPES" := rfl

/-- Types freestanding path parity host readiness holds.
    Greppable: typesParityReady_true, HOST-PARITY-TYPES, SELF-HOST-PARITY-TYPES,
    PARITY-TYPES-THEOREM, HOST-PARITY-TYPES-THEOREM. -/
theorem typesParityReady_true : typesParityReady = true := by decide

/-- typesParityOk alias of typesParityReady holds.
    Greppable: typesParityOk_true, PARITY-TYPES-THEOREM. -/
theorem typesParityOk_true : typesParityOk = true := by decide

/-- Host Types freestanding path contracts closed.
    Greppable: typesContractParityOk_true, PARITY-TYPES-THEOREM,
    HOST-PARITY-TYPES-THEOREM. -/
theorem typesContractParityOk_true : typesContractParityOk = true := by decide

/-- Mult+Linear+Types joint bar name holds (equivalent to typesParityReady).
    Greppable: multLinearTypesParityReady_true, HOST-PARITY-MULT,
    HOST-PARITY-LINEAR, HOST-PARITY-TYPES, PARITY-TYPES-THEOREM. -/
theorem multLinearTypesParityReady_true :
    multLinearTypesParityReady = true := by decide

/-! ### PARITY-TYPES frozen-ABI product API surface pins (not Mult ofNat depth)

  product*Api_eq / productTypedIrId_eq are intentional greppable frozen-ABI
  surface canaries: local def-literal self-equality only (not Kernel/C/probe
  cross-SSOT). Weaker than ParityMult ofNatRoundTrip_tag* function content.
  Do not treat product*Api_eq volume as remaining algebraic residual.
  Path readiness canaries already held; no definitional alias spam.
-/

/-- Product TYPED_IR stage id surface pin (frozen-ABI canary; local def-literal).
    Greppable: productTypedIrId_eq, PARITY-TYPES-THEOREM. -/
theorem productTypedIrId_eq : productTypedIrId = "TYPED_IR_V0" := rfl

/-- Product ir_node API surface content.
    Greppable: productIrNodeApi_eq, PARITY-TYPES-THEOREM. -/
theorem productIrNodeApi_eq : productIrNodeApi = "slake_ir_node" := rfl

/-- Product ir_node_init API surface content.
    Greppable: productIrNodeInitApi_eq, PARITY-TYPES-THEOREM. -/
theorem productIrNodeInitApi_eq :
    productIrNodeInitApi = "slake_ir_node_init" := rfl

/-- Product ir_node_is_well_typed API surface content.
    Greppable: productIrNodeIsWellTypedApi_eq, PARITY-TYPES-THEOREM. -/
theorem productIrNodeIsWellTypedApi_eq :
    productIrNodeIsWellTypedApi = "slake_ir_node_is_well_typed" := rfl

/-- Product ir_node_check_fail_closed API surface content.
    Greppable: productIrNodeCheckFailClosedApi_eq, PARITY-TYPES-THEOREM. -/
theorem productIrNodeCheckFailClosedApi_eq :
    productIrNodeCheckFailClosedApi = "slake_ir_node_check_fail_closed" := rfl

/-- Product TYPED_IR / slake_ir_node API surface fold holds.
    Greppable: productApiSurfaceOk_true, PARITY-TYPES-THEOREM. -/
theorem productApiSurfaceOk_true : productApiSurfaceOk = true := by decide

/-! ### Types freestanding path parity smoke (behavioral; lake build fails if example fails)
    Greppable: PARITY-TYPES-SMOKE, HOST-PARITY-TYPES-SMOKE.
    maxRecDepth already raised above for multLinearParityReady / typesKernelReady. -/

/-- PARITY-TYPES-SMOKE / HOST-PARITY-TYPES-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_PARITY_TYPES_V0" := by decide
example : hostParityTypesId = "HOST-PARITY-TYPES" := by decide
example : selfHostParityTypesId = "SELF-HOST-PARITY-TYPES" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/ParityTypes.lean" := by decide
example : productProbePath = "src/systems/smoke/slake_behavioral_probe.c" := by decide
example : paritySurfaceOk = true := by decide

/-- PARITY-TYPES-SMOKE: product TYPED_IR / slake_ir_node API names frozen wire. -/
example : productApiSurfaceOk = true := by decide
example : productTypedIrId = "TYPED_IR_V0" := by decide
example : productIrNodeApi = "slake_ir_node" := by decide
example : productIrNodeInitApi = "slake_ir_node_init" := by decide
example : productIrNodeIsWellTypedApi = "slake_ir_node_is_well_typed" := by decide
example : productIrNodeCheckFailClosedApi = "slake_ir_node_check_fail_closed" := by decide

/-- PARITY-TYPES-SMOKE: KernelTypes + Mult+Linear freestanding path compose. -/
example : KernelTypes.typesKernelReady = true := by decide
example : KernelTypes.typesProgramPathReady = true := by decide
example : KernelTypes.kindMultMismatchRejected = true := by decide
example : ParityLinear.linearParityReady = true := by decide
example : ParityLinear.multLinearParityReady = true := by decide
example : typesContractParityOk = true := by decide
example : typesParityReady = true := by decide
example : typesParityOk = true := by decide
example : multLinearTypesParityReady = true := by decide

end SystemsLean.ParityTypes
