/-
  SYSTEMS_LEAN_HOST partial -- KernelTypes KERNEL-TYPES-THEOREM +
  KERNEL-TYPES-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.KernelTypes: theorems and behavioral smoke
  live here; stage ids, lowerers, *Ready bars, and typesKernelOk stay in
  KernelTypes. Same namespace SystemsLean.KernelTypes so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - KERNEL-TYPES-THEOREM / HOST-KERNEL-TYPES-THEOREM: stageId_eq /
    kernelTypesId_eq / hostKernelTypesId_eq / typesKernelReady_true /
    typesKernelOk_true / typesProgramPathReady_true / lowerTypesKernel_isSome /
    unknownKindRejected_true / kindMultMismatchRejected_true /
    programCompileReady_empty_false / lowerTypesKernel_length_three /
    lowerTypesKernel_isWellTyped / typesKernelProgram_length_three /
    typesKernelProgram_isWellTyped.
  - KERNEL-TYPES-SMOKE: stage / path / product cites / lowerTypesKernel /
    program path / typesKernelReady behavioral examples (lake build fails if
    example fails).

  These KernelTypes theorems do NOT set SpecProof.proofCompleteClaimed true.
  Types IR + program path theorems != freestanding product self-host complete.

  Intentional non-claims:
  - Types kernel canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-TYPES-THEOREM,
  HOST-KERNEL-TYPES-THEOREM, KERNEL-TYPES-SMOKE, stageId_eq,
  kernelTypesId_eq, hostKernelTypesId_eq, typesKernelReady_true,
  typesKernelOk_true, typesProgramPathReady_true, lowerTypesKernel_isSome,
  unknownKindRejected_true, kindMultMismatchRejected_true,
  programCompileReady_empty_false, lowerTypesKernel_length_three,
  lowerTypesKernel_isWellTyped, typesKernelProgram_length_three,
  typesKernelProgram_isWellTyped, KernelTypesTheorems, UNIT_SURFACE host
  surface, MULT-0, MULT-1, MULT-OMEGA, TYPED_IR_V0, EMPTY-PROGRAM-FAIL-CLOSED.
  Module: SystemsLean.KernelTypesTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelTypesTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.CompilePath
import SystemsLean.KernelTypes

namespace SystemsLean.KernelTypes

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)
open SystemsLean.CompilePath (programCompileReady gradeSurfaceOk)

/-! ### KERNEL-TYPES-THEOREM / HOST-KERNEL-TYPES-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Types kernel
  readiness, program-path honesty, unknown-kind / kind-mult mismatch reject, and
  empty-program sibling fail-closed only. Does not complete SpecProof; does not
  claim residual free / freestanding product self-host complete / PROVABLY /
  llvm unlock.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_KERNEL_TYPES_V0.
    Greppable: stageId_eq, KERNEL-TYPES-THEOREM, HOST-KERNEL-TYPES-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_KERNEL_TYPES_V0" := rfl

/-- Short map id is greppable SELF-HOST-KERNEL-TYPES.
    Greppable: kernelTypesId_eq, KERNEL-TYPES-THEOREM. -/
theorem kernelTypesId_eq : kernelTypesId = "SELF-HOST-KERNEL-TYPES" := rfl

/-- Host map id is greppable HOST-KERNEL-TYPES.
    Greppable: hostKernelTypesId_eq, KERNEL-TYPES-THEOREM,
    HOST-KERNEL-TYPES-THEOREM. -/
theorem hostKernelTypesId_eq : hostKernelTypesId = "HOST-KERNEL-TYPES" := rfl

/-- Types kernel lowers to well-typed ordered IR + program path ready.
    Greppable: typesKernelReady_true, SELF-HOST-KERNEL-TYPES,
    HOST-KERNEL-TYPES, KERNEL-TYPES-THEOREM, HOST-KERNEL-TYPES-THEOREM. -/
theorem typesKernelReady_true : typesKernelReady = true := by decide

/-- Full SH4 Types kernel inventory ok holds.
    Greppable: typesKernelOk_true, KERNEL-TYPES-THEOREM,
    HOST-KERNEL-TYPES-THEOREM. -/
theorem typesKernelOk_true : typesKernelOk = true := by decide

/-- Program path honesty (empty fail-closed + foldWellTyped) holds.
    Greppable: typesProgramPathReady_true, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-TYPES-THEOREM. -/
theorem typesProgramPathReady_true : typesProgramPathReady = true := by decide

/-- lowerTypesKernel succeeds (isSome).
    Greppable: lowerTypesKernel_isSome, KERNEL-TYPES-THEOREM. -/
theorem lowerTypesKernel_isSome : lowerTypesKernel.isSome = true := by decide

/-- FAIL-CLOSED-UNKNOWN-KIND on raw kind tag 3.
    Greppable: unknownKindRejected_true, FAIL-CLOSED-UNKNOWN-KIND,
    KERNEL-TYPES-THEOREM. -/
theorem unknownKindRejected_true : unknownKindRejected = true := by decide

/-- Kind/mult pairing mismatches fail closed.
    Greppable: kindMultMismatchRejected_true, KERNEL-TYPES-THEOREM. -/
theorem kindMultMismatchRejected_true :
    kindMultMismatchRejected = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED sibling: empty program is not program-ready.
    Greppable: programCompileReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-TYPES-THEOREM, HOST-KERNEL-TYPES-THEOREM. -/
theorem programCompileReady_empty_false :
    programCompileReady IrProgram.empty = false := rfl

/-- lowerTypesKernel yields a length-3 ordered IR program (content equality).
    Greppable: lowerTypesKernel_length_three, KERNEL-TYPES-THEOREM,
    HOST-KERNEL-TYPES-THEOREM. -/
theorem lowerTypesKernel_length_three :
    (match lowerTypesKernel with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerTypesKernel yields a well-typed ordered IR program (content equality).
    Greppable: lowerTypesKernel_isWellTyped, KERNEL-TYPES-THEOREM,
    HOST-KERNEL-TYPES-THEOREM. -/
theorem lowerTypesKernel_isWellTyped :
    (match lowerTypesKernel with
     | some p => IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- typesKernelProgram (fallback wrapper) has length 3 when lower succeeds.
    Greppable: typesKernelProgram_length_three, KERNEL-TYPES-THEOREM. -/
theorem typesKernelProgram_length_three :
    IrProgram.length typesKernelProgram = 3 := by decide

/-- typesKernelProgram is well-typed (lower success path content).
    Greppable: typesKernelProgram_isWellTyped, KERNEL-TYPES-THEOREM. -/
theorem typesKernelProgram_isWellTyped :
    IrProgram.isWellTyped typesKernelProgram = true := by decide

/-! ### Types kernel smoke (behavioral; lake build fails if an example does not hold)
    Greppable: KERNEL-TYPES-SMOKE. -/

/-- KERNEL-TYPES-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_KERNEL_TYPES_V0" := by decide
example : kernelTypesId = "SELF-HOST-KERNEL-TYPES" := by decide
example : hostKernelTypesId = "HOST-KERNEL-TYPES" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/KernelTypes.lean" := by decide
example : productTypedIrId = "TYPED_IR_V0" := by decide
example : productIrNodeApi = "slake_ir_node" := by decide
example : typesSurfaceOk = true := by decide

/-- KERNEL-TYPES-SMOKE: lowerTypesKernel builds a 3-node well-typed program. -/
example : (lowerTypesKernel.isSome) = true := by decide
example : typesKernelProgram.nodes.length = 3 := by decide
example : IrProgram.isWellTyped typesKernelProgram = true := by decide
example : programCompileReady typesKernelProgram = true := by decide

/-- KERNEL-TYPES-SMOKE: nodes pair kind with mult (TYPED_IR_V0 structural host). -/
example :
    (match typesKernelProgram.nodes with
     | [n0, n1, n2] =>
         n0.mult == Mult.mult0 && n0.kind == NodeKind.erased && n0.isWellTyped
           && n1.mult == Mult.mult1 && n1.kind == NodeKind.linear && n1.isWellTyped
           && n2.mult == Mult.multOmega && n2.kind == NodeKind.value && n2.isWellTyped
     | _ => false) = true := by decide

/-- KERNEL-TYPES-SMOKE: program path honesty (empty fail-closed + fold). -/
example : typesProgramPathReady = true := by decide
example : programCompileReady IrProgram.empty = false := by decide
example : IrProgram.isWellTyped IrProgram.empty = false := by decide
example :
    (IrProgram.foldWellTyped IrProgram.empty (0 : Nat) (fun acc _ => acc + 1)).isNone
      = true := by decide
example :
    (match IrProgram.foldWellTyped typesKernelProgram (0 : Nat)
        (fun acc _ => acc + 1) with
     | some n => n == 3
     | none => false) = true := by decide

/-- KERNEL-TYPES-SMOKE: Types kernel ready and full inventory ok. -/
example : typesKernelReady = true := by decide
example : unknownKindRejected = true := by decide
example : kindMultMismatchRejected = true := by decide
example : typesKernelOk = true := by decide
example : gradeSurfaceOk = true := by decide

/-- KERNEL-TYPES-SMOKE: FAIL-CLOSED-UNKNOWN-KIND / kind-mult mismatch. -/
example : Types.isValidKindTag 0 = true := by decide
example : Types.isValidKindTag 1 = true := by decide
example : Types.isValidKindTag 2 = true := by decide
example : Types.isValidKindTag 3 = false := by decide
example :
    (Types.mkNode? 0 Mult.mult1 NodeKind.erased).isNone = true := by decide
example :
    (Types.mkNodeFromTags? 0 0 3).isNone = true := by decide

end SystemsLean.KernelTypes
