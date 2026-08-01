/-
  SYSTEMS_LEAN_HOST partial -- ParityLinear PARITY-LINEAR-THEOREM +
  PARITY-LINEAR-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ParityLinear: theorems and behavioral smoke
  live here; stage ids, product API name defs, linearContractParityOk,
  linearParityReady, multLinearParityReady, and linearParityOk stay in
  ParityLinear. Same namespace SystemsLean.ParityLinear so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - PARITY-LINEAR-THEOREM / HOST-PARITY-LINEAR-THEOREM: stageId_eq /
    hostParityLinearId_eq / selfHostParityLinearId_eq /
    linearParityReady_true / linearParityOk_true /
    linearContractParityOk_true / multLinearParityReady_true +
    product*Api_eq / productApiSurfaceOk_true frozen-ABI surface pins.
  - PARITY-LINEAR-SMOKE / HOST-PARITY-LINEAR-SMOKE: stage / path / product cites /
    KernelLinear + ParityMult compose / linearParityReady behavioral examples
    (lake build fails if example fails).

  These ParityLinear theorems do NOT set SpecProof.proofCompleteClaimed true.
  Linear freestanding path readiness theorems != freestanding product self-host
  complete.

  Intentional non-claims:
  - Linear freestanding path honesty canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - No new EMIT_* C residual stage.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PARITY-LINEAR-THEOREM,
  HOST-PARITY-LINEAR-THEOREM, PARITY-LINEAR-SMOKE, HOST-PARITY-LINEAR-SMOKE,
  stageId_eq, hostParityLinearId_eq, selfHostParityLinearId_eq,
  linearParityReady_true, linearParityOk_true, linearContractParityOk_true,
  multLinearParityReady_true, productLinearConsumeApi_eq,
  productLinearTokenInitApi_eq, productLinearTokenIsLiveApi_eq,
  productLinearTokenConsumeApi_eq, productConsumeTokenMintApi_eq,
  productConsumeTokenConsumeApi_eq, productConsumeTokenIsLiveApi_eq,
  productConsumeTokenHostId_eq, productApiSurfaceOk_true, ParityLinearTheorems,
  UNIT_SURFACE host surface, LINEAR-EXACT-ONCE, JOIN-ALG, ConsumeToken,
  CONSUME_TOKEN_HOST_V0, HOST-PARITY-LINEAR, SELF-HOST-PARITY-LINEAR,
  SLAKE_SELF_HOST_PARITY_LINEAR_V0, HOST-KERNEL-LINEAR, HOST-PARITY-MULT.
  Module: SystemsLean.ParityLinearTheorems
  Red/green: just systems-host; lake build SystemsLean.ParityLinearTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.KernelLinear
import SystemsLean.ParityMult
import SystemsLean.ParityLinear

namespace SystemsLean.ParityLinear

/-! ### PARITY-LINEAR-THEOREM / HOST-PARITY-LINEAR-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Linear
  freestanding path readiness + Mult closed-loop join only. Does not complete
  SpecProof; does not claim residual free / freestanding product self-host
  complete / PROVABLY / llvm unlock.
  maxRecDepth raised for multParityReady / linearKernelReady String.beq unfolds.
-/

set_option maxRecDepth 4096

/-- Primary stage id is greppable SLAKE_SELF_HOST_PARITY_LINEAR_V0.
    Greppable: stageId_eq, PARITY-LINEAR-THEOREM, HOST-PARITY-LINEAR-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_PARITY_LINEAR_V0" := rfl

/-- Host map id is greppable HOST-PARITY-LINEAR.
    Greppable: hostParityLinearId_eq, PARITY-LINEAR-THEOREM. -/
theorem hostParityLinearId_eq : hostParityLinearId = "HOST-PARITY-LINEAR" := rfl

/-- Short map id is greppable SELF-HOST-PARITY-LINEAR.
    Greppable: selfHostParityLinearId_eq, PARITY-LINEAR-THEOREM. -/
theorem selfHostParityLinearId_eq :
    selfHostParityLinearId = "SELF-HOST-PARITY-LINEAR" := rfl

/-- Linear freestanding path parity host readiness holds.
    Greppable: linearParityReady_true, HOST-PARITY-LINEAR, SELF-HOST-PARITY-LINEAR,
    PARITY-LINEAR-THEOREM, HOST-PARITY-LINEAR-THEOREM. -/
theorem linearParityReady_true : linearParityReady = true := by decide

/-- linearParityOk alias of linearParityReady holds.
    Greppable: linearParityOk_true, PARITY-LINEAR-THEOREM. -/
theorem linearParityOk_true : linearParityOk = true := by decide

/-- Host Linear freestanding path contracts closed (kernel + Mult + product API).
    Greppable: linearContractParityOk_true, PARITY-LINEAR-THEOREM,
    HOST-PARITY-LINEAR-THEOREM. -/
theorem linearContractParityOk_true : linearContractParityOk = true := by decide

/-- Mult+Linear joint bar name holds (equivalent to linearParityReady).
    Greppable: multLinearParityReady_true, HOST-PARITY-MULT, HOST-PARITY-LINEAR,
    PARITY-LINEAR-THEOREM. -/
theorem multLinearParityReady_true : multLinearParityReady = true := by decide

/-! ### PARITY-LINEAR frozen-ABI product API surface pins (not Mult ofNat depth)

  product*Api_eq theorems are intentional greppable frozen-ABI surface canaries:
  each is local def-literal self-equality (def productX := "slake_..." then
  theorem productX_eq : productX = "slake_..." := rfl). They do NOT cross-check
  Kernel/C/probe SSOT and are weaker than ParityMult ofNatRoundTrip_tag* /
  isValidTag_tag* / nameParity_mult* function content. Kept as ABI honesty pins;
  do not treat product*Api_eq volume as remaining algebraic residual.
  Path readiness canaries already held; no definitional alias spam.
  Does NOT forge MULT-1 elaborator enforcement or residual free.
-/

/-- Product Linear consume API surface pin (frozen-ABI canary; local def-literal).
    Greppable: productLinearConsumeApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productLinearConsumeApi_eq :
    productLinearConsumeApi = "slake_linear_consume" := rfl

/-- Product Linear token_init API surface content.
    Greppable: productLinearTokenInitApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productLinearTokenInitApi_eq :
    productLinearTokenInitApi = "slake_linear_token_init" := rfl

/-- Product Linear token_is_live API surface content.
    Greppable: productLinearTokenIsLiveApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productLinearTokenIsLiveApi_eq :
    productLinearTokenIsLiveApi = "slake_linear_token_is_live" := rfl

/-- Product Linear token_consume API surface content.
    Greppable: productLinearTokenConsumeApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productLinearTokenConsumeApi_eq :
    productLinearTokenConsumeApi = "slake_linear_token_consume" := rfl

/-- Product CONSUME_TOKEN mint API surface content.
    Greppable: productConsumeTokenMintApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productConsumeTokenMintApi_eq :
    productConsumeTokenMintApi = "slake_consume_token_mint" := rfl

/-- Product CONSUME_TOKEN consume API surface content.
    Greppable: productConsumeTokenConsumeApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productConsumeTokenConsumeApi_eq :
    productConsumeTokenConsumeApi = "slake_consume_token_consume" := rfl

/-- Product CONSUME_TOKEN is_live API surface content.
    Greppable: productConsumeTokenIsLiveApi_eq, PARITY-LINEAR-THEOREM. -/
theorem productConsumeTokenIsLiveApi_eq :
    productConsumeTokenIsLiveApi = "slake_consume_token_is_live" := rfl

/-- Product CONSUME_TOKEN host stage id surface content.
    Greppable: productConsumeTokenHostId_eq, PARITY-LINEAR-THEOREM. -/
theorem productConsumeTokenHostId_eq :
    productConsumeTokenHostId = "CONSUME_TOKEN_HOST_V0" := rfl

/-- Product Linear / CONSUME_TOKEN API surface fold holds.
    Greppable: productApiSurfaceOk_true, PARITY-LINEAR-THEOREM. -/
theorem productApiSurfaceOk_true : productApiSurfaceOk = true := by decide

/-! ### Linear freestanding path parity smoke (behavioral; lake build fails if example fails)
    Greppable: PARITY-LINEAR-SMOKE, HOST-PARITY-LINEAR-SMOKE.
    maxRecDepth already raised above for multParityReady / linearKernelReady. -/

/-- PARITY-LINEAR-SMOKE / HOST-PARITY-LINEAR-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_PARITY_LINEAR_V0" := by decide
example : hostParityLinearId = "HOST-PARITY-LINEAR" := by decide
example : selfHostParityLinearId = "SELF-HOST-PARITY-LINEAR" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/ParityLinear.lean" := by decide
example : productProbePath = "src/systems/smoke/slake_behavioral_probe.c" := by decide
example : paritySurfaceOk = true := by decide

/-- PARITY-LINEAR-SMOKE: product Linear / CONSUME_TOKEN API names frozen wire. -/
example : productApiSurfaceOk = true := by decide
example : productLinearConsumeApi = "slake_linear_consume" := by decide
example : productLinearTokenInitApi = "slake_linear_token_init" := by decide
example : productLinearTokenIsLiveApi = "slake_linear_token_is_live" := by decide
example : productLinearTokenConsumeApi = "slake_linear_token_consume" := by decide
example : productConsumeTokenMintApi = "slake_consume_token_mint" := by decide
example : productConsumeTokenConsumeApi = "slake_consume_token_consume" := by decide
example : productConsumeTokenIsLiveApi = "slake_consume_token_is_live" := by decide
example : productConsumeTokenHostId = "CONSUME_TOKEN_HOST_V0" := by decide

/-- PARITY-LINEAR-SMOKE: KernelLinear + Mult closed loop compose into readiness. -/
example : KernelLinear.linearKernelReady = true := by decide
example : KernelLinear.linearHostPathReady = true := by decide
example : ParityMult.multParityReady = true := by decide
example : linearContractParityOk = true := by decide
example : linearParityReady = true := by decide
example : linearParityOk = true := by decide
example : multLinearParityReady = true := by decide

end SystemsLean.ParityLinear
