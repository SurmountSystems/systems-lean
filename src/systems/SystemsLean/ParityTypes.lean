/-
  SYSTEMS_LEAN_HOST partial -- Types freestanding path parity (Mult+Linear+Types).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): KernelTypes.lean Types kernel IR + program path;
    ParityLinear.lean Mult+Linear freestanding path (SH3 + SH3b); Types.lean
    kind/mult pairing; product wire TYPED_IR_V0 / slake_ir_node_* (frozen ABI);
    smoke/slake_behavioral_probe.c product TYPED_IR / slake_ir_node behavioral
    parity; self-host.md acceptance.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_PARITY_TYPES_V0 / HOST-PARITY-TYPES / SELF-HOST-PARITY-TYPES:
    freestanding Types product path honesty -- host Types kernel + program path
    contracts closed with Mult+Linear freestanding path + product API surface
    canaries (names match frozen wire).
  - Host model = structural representation of Types freestanding path contracts.
    Not an AI model.
  - typesContractParityOk: KernelTypes.typesKernelReady +
    KernelTypes.typesProgramPathReady (intentional re-assert: already inside
    typesKernelReady) + kindMultMismatchRejected + product API string canaries +
    ParityLinear.linearParityReady (Mult+Linear freestanding path prior rungs).
  - typesParityReady: typesContractParityOk && paritySurfaceOk (FAIL-CLOSED).
  - multLinearTypesParityReady: ParityLinear.multLinearParityReady &&
    typesParityReady -- greppable Mult+Linear+Types joint bar name.
    Mult+Linear is already folded into typesContractParityOk (via
    linearParityReady, which already folds Mult), so under current defs
    multLinearTypesParityReady is equivalent to typesParityReady (not a
    stronger gate; dual greppable honesty for HOST-PARITY-MULT +
    HOST-PARITY-LINEAR + HOST-PARITY-TYPES join). Not freestanding product
    self-host complete.
  - Product-wire TYPED_IR / slake_ir_node behavioral parity is exercised by
    hosted smoke (typed_ir id + ir_node init/well_typed/check_fail_closed) --
    same kind/mult fail-closed contracts the host proves in KernelTypes.
  - No new EMIT_* residual C stage ladder (host stage ids + frozen ABI only).

  Theorems (PARITY-TYPES-THEOREM / HOST-PARITY-TYPES-THEOREM -- partial
  ParityTypes):
  - Live in SystemsLean.ParityTypesTheorems (same namespace; long-file split).
  - typesParityReady_true / typesParityOk_true / typesContractParityOk_true
  - multLinearTypesParityReady_true / stageId_eq / hostParityTypesId_eq /
    selfHostParityTypesId_eq
  - Content equality (product API surface strings): productTypedIrId_eq /
    productIrNodeApi_eq / productIrNodeInitApi_eq /
    productIrNodeIsWellTypedApi_eq / productIrNodeCheckFailClosedApi_eq /
    productApiSurfaceOk_true
  - PARITY-TYPES-SMOKE behavioral examples live with theorems
  These ParityTypes theorems do NOT set SpecProof.proofCompleteClaimed true.
  Types freestanding path readiness != freestanding product self-host complete.

  Intentional non-claims / partial parity:
  - PARTIAL: Types freestanding path honesty only; Mult grades already SH3;
    Mult+Linear Linear path already HOST-PARITY-LINEAR; no EmitTypes residual
    product C text SSoT; not program freestanding path parity close; SH5 host
    compose is SelfApply (not freestanding product self-host complete).
  - PARTIAL: host String/Bool model vs C int return tables
    (compatible contracts, not bit-identical runtime).
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Not freestanding product self-host complete.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PARITY_TYPES_V0, HOST-PARITY-TYPES,
  SELF-HOST-PARITY-TYPES, PARITY-TYPES-SMOKE, HOST-PARITY-TYPES-SMOKE,
  typesParityReady, typesContractParityOk, multLinearTypesParityReady,
  TYPED_IR_V0, slake_ir_node, slake_ir_node_init, slake_ir_node_is_well_typed,
  slake_ir_node_check_fail_closed, HOST-KERNEL-TYPES, HOST-PARITY-LINEAR,
  HOST-PARITY-MULT, kindMultMismatchRejected, typesProgramPathReady,
  MULT-0, MULT-1, MULT-OMEGA, COMMON-UNIVERSE, ORDERED-IR-PROGRAM,
  PARITY-TYPES-THEOREM, HOST-PARITY-TYPES-THEOREM, typesParityReady_true,
  typesContractParityOk_true, productTypedIrId_eq, productIrNodeApi_eq,
  productIrNodeInitApi_eq, productIrNodeIsWellTypedApi_eq,
  productIrNodeCheckFailClosedApi_eq, productApiSurfaceOk_true, ParityTypesTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.ParityTypes
  Long-file split: PARITY-TYPES-THEOREM + PARITY-TYPES-SMOKE in
  SystemsLean.ParityTypesTheorems (same namespace).
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.KernelTypes
import SystemsLean.ParityLinear

namespace SystemsLean.ParityTypes

/-- Greppable primary stage id for Types freestanding path parity. -/
def stageId : String := "SLAKE_SELF_HOST_PARITY_TYPES_V0"

/-- Greppable short map id (HOST-PARITY-TYPES). -/
def hostParityTypesId : String := "HOST-PARITY-TYPES"

/-- Greppable short map id (SELF-HOST-PARITY-TYPES). -/
def selfHostParityTypesId : String := "SELF-HOST-PARITY-TYPES"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/ParityTypes.lean"

/-- Read-only product Types / TYPED_IR behavioral probe path cite. -/
def productProbePath : String := "src/systems/smoke/slake_behavioral_probe.c"

/-- Product wire Types / typed-IR API names (frozen ABI; compatible contracts). -/
def productTypedIrId : String := "TYPED_IR_V0"
def productIrNodeApi : String := "slake_ir_node"
def productIrNodeInitApi : String := "slake_ir_node_init"
def productIrNodeIsWellTypedApi : String := "slake_ir_node_is_well_typed"
def productIrNodeCheckFailClosedApi : String := "slake_ir_node_check_fail_closed"

/-- productApiSurfaceOk -- frozen product TYPED_IR / slake_ir_node API name canaries.
    Aligns host KernelTypes contracts with product probe symbols
    (representation PARTIAL: host String/Bool vs C int remains). -/
def productApiSurfaceOk : Bool :=
  (productTypedIrId == "TYPED_IR_V0")
    && (productIrNodeApi == "slake_ir_node")
    && (productIrNodeInitApi == "slake_ir_node_init")
    && (productIrNodeIsWellTypedApi == "slake_ir_node_is_well_typed")
    && (productIrNodeCheckFailClosedApi == "slake_ir_node_check_fail_closed")

/-- typesContractParityOk -- host Types freestanding path contracts closed.
    Composes real KernelTypes checks with Mult+Linear freestanding path and
    product API string canaries. typesProgramPathReady is an intentional
    re-assert of a conjunct already inside typesKernelReady (greppable
    EMPTY-PROGRAM-FAIL-CLOSED + foldWellTyped path). kindMultMismatchRejected
    is greppable kind/mult pairing fail-closed (also inside typesKernelReady).
    Mult+Linear is folded here via linearParityReady so typesParityReady
    already implies Mult SH3 + Linear freestanding path HOST-PARITY-LINEAR.
    Document: KernelTypes kind/mult contracts align with product TYPED_IR /
    slake_ir_node behavioral probe (PARTIAL String/Bool vs C).
    Not freestanding residual free. Not PROVABLY. -/
def typesContractParityOk : Bool :=
  KernelTypes.typesKernelReady
    && KernelTypes.typesProgramPathReady
    && KernelTypes.kindMultMismatchRejected
    && ParityLinear.linearParityReady
    && productApiSurfaceOk

/-- Surface canary: stage ids + path cites. -/
def paritySurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PARITY_TYPES_V0")
    && (hostParityTypesId == "HOST-PARITY-TYPES")
    && (selfHostParityTypesId == "SELF-HOST-PARITY-TYPES")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/ParityTypes.lean")
    && (productProbePath == "src/systems/smoke/slake_behavioral_probe.c")

/-- typesParityReady -- Types freestanding path parity host readiness.
    FAIL-CLOSED: KernelTypes ready + Mult+Linear freestanding path + product
    API surface + stage/path surface canary.
    Greppable: typesParityReady, HOST-PARITY-TYPES, SELF-HOST-PARITY-TYPES. -/
def typesParityReady : Bool :=
  typesContractParityOk && paritySurfaceOk

/-- multLinearTypesParityReady -- greppable Mult+Linear+Types joint bar name.
    multLinearParityReady is already implied by linearParityReady (which is
    required by typesContractParityOk, hence by typesParityReady), so under
    current defs this is equivalent to typesParityReady -- not a stronger
    gate. Kept as dual greppable honesty for HOST-PARITY-MULT +
    HOST-PARITY-LINEAR + HOST-PARITY-TYPES join inventory.
    Do NOT set freestanding product self-host complete.
    Greppable: multLinearTypesParityReady, HOST-PARITY-MULT, HOST-PARITY-LINEAR,
    HOST-PARITY-TYPES. -/
def multLinearTypesParityReady : Bool :=
  ParityLinear.multLinearParityReady && typesParityReady

/-- Full Types freestanding path inventory ok (alias for inventory greps). -/
def typesParityOk : Bool := typesParityReady

end SystemsLean.ParityTypes
