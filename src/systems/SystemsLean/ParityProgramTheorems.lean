/-
  SYSTEMS_LEAN_HOST partial -- ParityProgram PARITY-PROGRAM-THEOREM +
  PARITY-PROGRAM-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.ParityProgram: theorems and behavioral smoke
  live here; stage ids, product API name defs, *Ready bars, and programParityOk
  stay in ParityProgram. Same namespace SystemsLean.ParityProgram so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - PARITY-PROGRAM-THEOREM / HOST-PARITY-PROGRAM-THEOREM: stageId_eq /
    hostParityProgramId_eq / selfHostParityProgramId_eq /
    programParityReady_true / programParityOk_true /
    programContractParityOk_true / multLinearTypesProgramParityReady_true +
    product*Api_eq / productApiSurfaceOk_true frozen-ABI surface pins.
  - PARITY-PROGRAM-SMOKE / HOST-PARITY-PROGRAM-SMOKE: stage / path / product
    cites / KernelProgram + ParityTypes compose / programParityReady behavioral
    examples (lake build fails if example fails).

  These ParityProgram theorems do NOT set SpecProof.proofCompleteClaimed true.
  Program freestanding path readiness theorems != freestanding product self-host
  complete.

  Intentional non-claims:
  - Program freestanding path honesty canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - No new EMIT_* C residual stage.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PARITY-PROGRAM-THEOREM,
  HOST-PARITY-PROGRAM-THEOREM, PARITY-PROGRAM-SMOKE, HOST-PARITY-PROGRAM-SMOKE,
  stageId_eq, hostParityProgramId_eq, selfHostParityProgramId_eq,
  programParityReady_true, programParityOk_true, programContractParityOk_true,
  multLinearTypesProgramParityReady_true, productIrProgramId_eq,
  productIrGraphId_eq, productHostComposeId_eq, productIrProgramApi_eq,
  productIrProgramInitApi_eq, productIrProgramPushApi_eq,
  productIrProgramIsWellTypedApi_eq, productIrProgramCheckFailClosedApi_eq,
  productIrGraphApi_eq, productIrGraphInitApi_eq, productIrGraphPushNodeApi_eq,
  productIrGraphAddEdgeApi_eq, productHostComposeApi_eq,
  productHostComposeInitApi_eq, productHostComposeMintApi_eq,
  productHostComposeConsumeApi_eq, productApiSurfaceOk_true,
  ParityProgramTheorems, UNIT_SURFACE host surface, RUNTIME-FS,
  IR_PROGRAM_V0, IR_GRAPH_EDGES_V0, HOST_COMPOSE_V0, HOST-PARITY-PROGRAM,
  SELF-HOST-PARITY-PROGRAM.
  Module: SystemsLean.ParityProgramTheorems
  Red/green: just systems-host; lake build SystemsLean.ParityProgramTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.KernelProgram
import SystemsLean.ParityTypes
import SystemsLean.ParityProgram

namespace SystemsLean.ParityProgram

/-! ### PARITY-PROGRAM-THEOREM / HOST-PARITY-PROGRAM-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Program
  freestanding path readiness + Mult+Linear+Types join only. Does not complete
  SpecProof; does not claim residual free / freestanding product self-host
  complete / PROVABLY / llvm unlock.
  maxRecDepth raised for programKernelReady / typesParityReady unfolds.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_PARITY_PROGRAM_V0.
    Greppable: stageId_eq, PARITY-PROGRAM-THEOREM, HOST-PARITY-PROGRAM-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_PARITY_PROGRAM_V0" := rfl

/-- Host map id is greppable HOST-PARITY-PROGRAM.
    Greppable: hostParityProgramId_eq, PARITY-PROGRAM-THEOREM. -/
theorem hostParityProgramId_eq :
    hostParityProgramId = "HOST-PARITY-PROGRAM" := rfl

/-- Short map id is greppable SELF-HOST-PARITY-PROGRAM.
    Greppable: selfHostParityProgramId_eq, PARITY-PROGRAM-THEOREM. -/
theorem selfHostParityProgramId_eq :
    selfHostParityProgramId = "SELF-HOST-PARITY-PROGRAM" := rfl

/-- Program freestanding path parity host readiness holds.
    Greppable: programParityReady_true, HOST-PARITY-PROGRAM,
    SELF-HOST-PARITY-PROGRAM, PARITY-PROGRAM-THEOREM,
    HOST-PARITY-PROGRAM-THEOREM. -/
theorem programParityReady_true : programParityReady = true := by decide

/-- programParityOk alias of programParityReady holds.
    Greppable: programParityOk_true, PARITY-PROGRAM-THEOREM. -/
theorem programParityOk_true : programParityOk = true := by decide

/-- Host Program freestanding path contracts closed.
    Greppable: programContractParityOk_true, PARITY-PROGRAM-THEOREM,
    HOST-PARITY-PROGRAM-THEOREM. -/
theorem programContractParityOk_true :
    programContractParityOk = true := by decide

/-- Mult+Linear+Types+Program joint bar name holds.
    Greppable: multLinearTypesProgramParityReady_true, HOST-PARITY-PROGRAM,
    PARITY-PROGRAM-THEOREM. -/
theorem multLinearTypesProgramParityReady_true :
    multLinearTypesProgramParityReady = true := by decide

/-! ### PARITY-PROGRAM frozen-ABI product API surface pins (not Mult ofNat depth)

  product*Api_eq theorems are intentional greppable frozen-ABI surface canaries:
  local def-literal self-equality only (not Kernel/C/probe cross-SSOT). Weaker
  than ParityMult ofNatRoundTrip_tag* function content. Do not treat
  product*Api_eq volume as remaining algebraic residual.
  Path readiness canaries already held; no definitional alias spam.
-/

/-- Product IR_PROGRAM stage id surface pin (frozen-ABI canary; local def-literal).
    Greppable: productIrProgramId_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramId_eq : productIrProgramId = "IR_PROGRAM_V0" := rfl

/-- Product IR_GRAPH_EDGES stage id surface content.
    Greppable: productIrGraphId_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrGraphId_eq : productIrGraphId = "IR_GRAPH_EDGES_V0" := rfl

/-- Product HOST_COMPOSE stage id surface content.
    Greppable: productHostComposeId_eq, PARITY-PROGRAM-THEOREM. -/
theorem productHostComposeId_eq : productHostComposeId = "HOST_COMPOSE_V0" := rfl

/-- Product ir_program API surface content.
    Greppable: productIrProgramApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramApi_eq : productIrProgramApi = "slake_ir_program" := rfl

/-- Product ir_program_init API surface content.
    Greppable: productIrProgramInitApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramInitApi_eq :
    productIrProgramInitApi = "slake_ir_program_init" := rfl

/-- Product ir_program_push API surface content.
    Greppable: productIrProgramPushApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramPushApi_eq :
    productIrProgramPushApi = "slake_ir_program_push" := rfl

/-- Product ir_program_is_well_typed API surface content.
    Greppable: productIrProgramIsWellTypedApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramIsWellTypedApi_eq :
    productIrProgramIsWellTypedApi = "slake_ir_program_is_well_typed" := rfl

/-- Product ir_program_check_fail_closed API surface content.
    Greppable: productIrProgramCheckFailClosedApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrProgramCheckFailClosedApi_eq :
    productIrProgramCheckFailClosedApi =
      "slake_ir_program_check_fail_closed" := rfl

/-- Product ir_graph API surface content.
    Greppable: productIrGraphApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrGraphApi_eq : productIrGraphApi = "slake_ir_graph" := rfl

/-- Product ir_graph_init API surface content.
    Greppable: productIrGraphInitApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrGraphInitApi_eq :
    productIrGraphInitApi = "slake_ir_graph_init" := rfl

/-- Product ir_graph_push_node API surface content.
    Greppable: productIrGraphPushNodeApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrGraphPushNodeApi_eq :
    productIrGraphPushNodeApi = "slake_ir_graph_push_node" := rfl

/-- Product ir_graph_add_edge API surface content.
    Greppable: productIrGraphAddEdgeApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productIrGraphAddEdgeApi_eq :
    productIrGraphAddEdgeApi = "slake_ir_graph_add_edge" := rfl

/-- Product host_compose API surface content.
    Greppable: productHostComposeApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productHostComposeApi_eq :
    productHostComposeApi = "slake_host_compose" := rfl

/-- Product host_compose_init API surface content.
    Greppable: productHostComposeInitApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productHostComposeInitApi_eq :
    productHostComposeInitApi = "slake_host_compose_init" := rfl

/-- Product host_compose_mint API surface content.
    Greppable: productHostComposeMintApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productHostComposeMintApi_eq :
    productHostComposeMintApi = "slake_host_compose_mint" := rfl

/-- Product host_compose_consume API surface content.
    Greppable: productHostComposeConsumeApi_eq, PARITY-PROGRAM-THEOREM. -/
theorem productHostComposeConsumeApi_eq :
    productHostComposeConsumeApi = "slake_host_compose_consume" := rfl

/-- Product program / graph / compose API surface fold holds.
    Greppable: productApiSurfaceOk_true, PARITY-PROGRAM-THEOREM. -/
theorem productApiSurfaceOk_true : productApiSurfaceOk = true := by decide

/-! ### Program freestanding path parity smoke (behavioral; lake build fails if example fails)
    Greppable: PARITY-PROGRAM-SMOKE, HOST-PARITY-PROGRAM-SMOKE.
    maxRecDepth already raised above for programKernelReady / typesParityReady. -/

/-- PARITY-PROGRAM-SMOKE / HOST-PARITY-PROGRAM-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_PARITY_PROGRAM_V0" := by decide
example : hostParityProgramId = "HOST-PARITY-PROGRAM" := by decide
example : selfHostParityProgramId = "SELF-HOST-PARITY-PROGRAM" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/ParityProgram.lean" := by decide
example : productProbePath = "src/systems/smoke/slake_behavioral_probe.c" := by decide
example : paritySurfaceOk = true := by decide

/-- PARITY-PROGRAM-SMOKE: product program / graph / compose API names frozen wire. -/
example : productApiSurfaceOk = true := by decide
example : productIrProgramId = "IR_PROGRAM_V0" := by decide
example : productIrGraphId = "IR_GRAPH_EDGES_V0" := by decide
example : productHostComposeId = "HOST_COMPOSE_V0" := by decide
example : productIrProgramApi = "slake_ir_program" := by decide
example : productIrProgramInitApi = "slake_ir_program_init" := by decide
example : productIrProgramPushApi = "slake_ir_program_push" := by decide
example : productIrProgramIsWellTypedApi = "slake_ir_program_is_well_typed" := by decide
example : productIrProgramCheckFailClosedApi = "slake_ir_program_check_fail_closed" := by decide
example : productIrGraphApi = "slake_ir_graph" := by decide
example : productIrGraphInitApi = "slake_ir_graph_init" := by decide
example : productIrGraphPushNodeApi = "slake_ir_graph_push_node" := by decide
example : productIrGraphAddEdgeApi = "slake_ir_graph_add_edge" := by decide
example : productHostComposeApi = "slake_host_compose" := by decide
example : productHostComposeInitApi = "slake_host_compose_init" := by decide
example : productHostComposeMintApi = "slake_host_compose_mint" := by decide
example : productHostComposeConsumeApi = "slake_host_compose_consume" := by decide

/-- PARITY-PROGRAM-SMOKE: KernelProgram + Mult+Linear+Types freestanding path compose. -/
example : KernelProgram.programKernelReady = true := by decide
example : KernelProgram.programPathReady = true := by decide
example : KernelProgram.programGraphPathReady = true := by decide
example : KernelProgram.programComposePathReady = true := by decide
example : ParityTypes.typesParityReady = true := by decide
example : ParityTypes.multLinearTypesParityReady = true := by decide
example : programContractParityOk = true := by decide
example : programParityReady = true := by decide
example : programParityOk = true := by decide
example : multLinearTypesProgramParityReady = true := by decide

end SystemsLean.ParityProgram
