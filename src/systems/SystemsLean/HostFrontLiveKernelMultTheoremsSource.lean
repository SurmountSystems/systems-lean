/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live KernelMultTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelMultTheoremsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-KERNEL-MULT-THEOREMS, liveKernelMultTheoremsSource,
  HOST-FRONT-LIVE-KERNEL-MULT-THEOREMS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveKernelMultTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelMultTheorems

/-- Dual-pinned live KernelMultTheorems.lean bytes (must match on-disk file).
    Greppable: liveKernelMultTheoremsSource, PARSE-LIVE-KERNEL-MULT-THEOREMS. -/
def liveKernelMultTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelMult KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.KernelMult: theorems and behavioral smoke
  live here; stage ids, path cites, lowerMultKernel, multKernelProgram,
  multKernelReady, kernelSurfaceOk, kernelOk stay in KernelMult. Same namespace
  SystemsLean.KernelMult so theorem names stay unqualified under that namespace.

  Spec (readable):
  - KERNEL-MULT-THEOREM / HOST-KERNEL-MULT-THEOREM: stageId_eq /
    kernelMultId_eq / multKernelReady_true / kernelOk_true /
    unknownTagRejected_true / lowerMultKernel_isSome /
    programCompileReady_empty_false / lowerMultKernel_length_three /
    lowerMultKernel_isWellTyped / multKernelProgram_length_three /
    multKernelProgram_isWellTyped.
  - KERNEL-MULT-SMOKE: stage / map / lower / ready / empty-sibling /
    kind-mult pairing behavioral examples (lake build fails if example fails).

  These KernelMult theorems do NOT set SpecProof.proofCompleteClaimed true.
  Mult IR fixture theorems != freestanding product self-host complete.

  Intentional non-claims:
  - Mult kernel IR fixture only -- not freestanding product self-host complete.
  - NOT freestanding residual free.
  - NOT PROVABLY. NOT llvm unlock.
  - Lake example smokes are NOT full proofs.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-MULT-THEOREM, HOST-KERNEL-MULT-THEOREM,
  KERNEL-MULT-SMOKE, stageId_eq, kernelMultId_eq, multKernelReady_true,
  kernelOk_true, unknownTagRejected_true, lowerMultKernel_isSome,
  programCompileReady_empty_false, lowerMultKernel_length_three,
  lowerMultKernel_isWellTyped, multKernelProgram_length_three,
  multKernelProgram_isWellTyped, KernelMultTheorems, UNIT_SURFACE host surface,
  SELF-HOST-KERNEL-MULT, SLAKE_SELF_HOST_KERNEL_MULT_V0, MULT-0, MULT-1,
  MULT-OMEGA, FAIL-CLOSED-UNKNOWN-GRADE, EMPTY-PROGRAM-FAIL-CLOSED,
  ORDERED-IR-PROGRAM, HOST-COMPILE-PATH.
  Module: SystemsLean.KernelMultTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelMultTheorems.
  Module must stay ASCII.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding product. Not freestanding emit residual free.
  Not llvm unlocked. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.CompilePath
import SystemsLean.KernelMult

namespace SystemsLean.KernelMult

open SystemsLean.Mult (Mult)
open SystemsLean.Types (NodeKind)
open SystemsLean.CompilePath (programCompileReady)

/-! ### KERNEL-MULT-THEOREM / HOST-KERNEL-MULT-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Mult kernel
  readiness, surface canaries, unknown-tag reject, and empty-program sibling
  fail-closed only. Does not complete SpecProof; does not claim residual free /
  freestanding product self-host complete / PROVABLY / llvm unlock.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_KERNEL_MULT_V0.
    Greppable: stageId_eq, KERNEL-MULT-THEOREM, HOST-KERNEL-MULT-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_KERNEL_MULT_V0" := rfl

/-- Short map id is greppable SELF-HOST-KERNEL-MULT.
    Greppable: kernelMultId_eq, KERNEL-MULT-THEOREM. -/
theorem kernelMultId_eq : kernelMultId = "SELF-HOST-KERNEL-MULT" := rfl

/-- Mult kernel lowers to a well-typed ordered IR program.
    Greppable: multKernelReady_true, SELF-HOST-KERNEL-MULT, KERNEL-MULT-THEOREM,
    HOST-KERNEL-MULT-THEOREM. -/
theorem multKernelReady_true : multKernelReady = true := by decide

/-- Full SH1 inventory ok holds (kernel + surface + unknown-tag reject).
    Greppable: kernelOk_true, KERNEL-MULT-THEOREM, HOST-KERNEL-MULT-THEOREM. -/
theorem kernelOk_true : kernelOk = true := by decide

/-- FAIL-CLOSED-UNKNOWN-GRADE on raw tag 3.
    Greppable: unknownTagRejected_true, FAIL-CLOSED-UNKNOWN-GRADE,
    KERNEL-MULT-THEOREM. -/
theorem unknownTagRejected_true : unknownTagRejected = true := by decide

/-- lowerMultKernel succeeds (isSome).
    Greppable: lowerMultKernel_isSome, KERNEL-MULT-THEOREM. -/
theorem lowerMultKernel_isSome : lowerMultKernel.isSome = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED sibling: empty program is not program-ready.
    Greppable: programCompileReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-MULT-THEOREM, HOST-KERNEL-MULT-THEOREM. -/
theorem programCompileReady_empty_false :
    programCompileReady IrProgram.empty = false := rfl

/-- lowerMultKernel yields a length-3 ordered IR program (content equality).
    Greppable: lowerMultKernel_length_three, KERNEL-MULT-THEOREM,
    HOST-KERNEL-MULT-THEOREM. -/
theorem lowerMultKernel_length_three :
    (match lowerMultKernel with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerMultKernel yields a well-typed ordered IR program (content equality).
    Greppable: lowerMultKernel_isWellTyped, KERNEL-MULT-THEOREM,
    HOST-KERNEL-MULT-THEOREM. -/
theorem lowerMultKernel_isWellTyped :
    (match lowerMultKernel with
     | some p => IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- multKernelProgram (fallback wrapper) has length 3 when lower succeeds.
    Greppable: multKernelProgram_length_three, KERNEL-MULT-THEOREM. -/
theorem multKernelProgram_length_three :
    IrProgram.length multKernelProgram = 3 := by decide

/-- multKernelProgram is well-typed (lower success path content).
    Greppable: multKernelProgram_isWellTyped, KERNEL-MULT-THEOREM. -/
theorem multKernelProgram_isWellTyped :
    IrProgram.isWellTyped multKernelProgram = true := by decide

/-! ### Mult kernel smoke (behavioral; lake build fails if an example does not hold)
    Greppable: KERNEL-MULT-SMOKE. -/

/-- KERNEL-MULT-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_KERNEL_MULT_V0" := by decide
example : kernelMultId = "SELF-HOST-KERNEL-MULT" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/KernelMult.lean" := by decide
example : kernelSurfaceOk = true := by decide

/-- KERNEL-MULT-SMOKE: lowerMultKernel builds a 3-node well-typed program. -/
example : (lowerMultKernel.isSome) = true := by decide
example : multKernelProgram.nodes.length = 3 := by decide
example : IrProgram.isWellTyped multKernelProgram = true := by decide
example : programCompileReady multKernelProgram = true := by decide

/-- KERNEL-MULT-SMOKE: Mult kernel ready and full inventory ok. -/
example : multKernelReady = true := by decide
example : unknownTagRejected = true := by decide
example : kernelOk = true := by decide

/-- KERNEL-MULT-SMOKE: empty program is NOT kernel-ready (sibling EMPTY-PROGRAM). -/
example : programCompileReady IrProgram.empty = false := by decide

/-- KERNEL-MULT-SMOKE: grade nodes pair kind with mult (structural host model). -/
example :
    (match Types.mkNode? 0 Mult.mult0 NodeKind.erased with
     | some n => n.isWellTyped
     | none => false) = true := by decide
example :
    (match Types.mkNode? 1 Mult.mult1 NodeKind.linear with
     | some n => n.isWellTyped
     | none => false) = true := by decide
example :
    (match Types.mkNode? 2 Mult.multOmega NodeKind.value with
     | some n => n.isWellTyped
     | none => false) = true := by decide

/-- KERNEL-MULT-SMOKE: kind/mult mismatch fails closed (not a Mult kernel node). -/
example :
    (Types.mkNode? 0 Mult.mult1 NodeKind.erased).isNone = true := by decide

end SystemsLean.KernelMult
"#

end SystemsLean.HostFrontLiveKernelMultTheorems
