/-
  SYSTEMS_LEAN_HOST partial -- KernelProgram KERNEL-PROGRAM-THEOREM +
  KERNEL-PROGRAM-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.KernelProgram: theorems and behavioral smoke
  live here; stage ids, lowerers, *Ready bars, and programKernelOk stay in
  KernelProgram. Same namespace SystemsLean.KernelProgram so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - KERNEL-PROGRAM-THEOREM / HOST-KERNEL-PROGRAM-THEOREM: stageId_eq /
    kernelProgramId_eq / hostKernelProgramId_eq / programKernelReady_true /
    programKernelOk_true / programPathReady_true / programGraphPathReady_true /
    programComposePathReady_true / lowerProgramKernel_isSome /
    programCompileReady_empty_false / lowerProgramKernel_length_three /
    lowerProgramKernel_isWellTyped / programKernelProgram_length_three /
    programKernelProgram_isWellTyped.
  - KERNEL-PROGRAM-SMOKE: stage / path / product cites / lowerProgramKernel /
    program path / graph path / HostCompose path / programKernelReady
    behavioral examples (lake build fails if example fails).

  These KernelProgram theorems do NOT set SpecProof.proofCompleteClaimed true.
  Program / graph / compose content != freestanding product self-host complete.

  Intentional non-claims:
  - Program kernel canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-PROGRAM-THEOREM,
  HOST-KERNEL-PROGRAM-THEOREM, KERNEL-PROGRAM-SMOKE, stageId_eq,
  kernelProgramId_eq, hostKernelProgramId_eq, programKernelReady_true,
  programKernelOk_true, programPathReady_true, programGraphPathReady_true,
  programComposePathReady_true, lowerProgramKernel_isSome,
  programCompileReady_empty_false, lowerProgramKernel_length_three,
  lowerProgramKernel_isWellTyped, programKernelProgram_length_three,
  programKernelProgram_isWellTyped, KernelProgramTheorems, UNIT_SURFACE host
  surface, RUNTIME-FS.
  Module: SystemsLean.KernelProgramTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelProgramTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.HostCompose
import SystemsLean.CompilePath
import SystemsLean.KernelProgram

namespace SystemsLean.KernelProgram

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph Edge)
open SystemsLean.HostCompose (Host LinearHost)
open SystemsLean.CompilePath (programCompileReady gradeSurfaceOk)

/-! ### KERNEL-PROGRAM-THEOREM / HOST-KERNEL-PROGRAM-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is program /
  graph / compose kernel readiness and empty-program sibling fail-closed only.
  Does not complete SpecProof; does not claim residual free / freestanding
  product self-host complete / PROVABLY / llvm unlock.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_KERNEL_PROGRAM_V0.
    Greppable: stageId_eq, KERNEL-PROGRAM-THEOREM, HOST-KERNEL-PROGRAM-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0" := rfl

/-- Short map id is greppable SELF-HOST-KERNEL-PROGRAM.
    Greppable: kernelProgramId_eq, KERNEL-PROGRAM-THEOREM. -/
theorem kernelProgramId_eq : kernelProgramId = "SELF-HOST-KERNEL-PROGRAM" := rfl

/-- Host map id is greppable HOST-KERNEL-PROGRAM.
    Greppable: hostKernelProgramId_eq, KERNEL-PROGRAM-THEOREM,
    HOST-KERNEL-PROGRAM-THEOREM. -/
theorem hostKernelProgramId_eq : hostKernelProgramId = "HOST-KERNEL-PROGRAM" := rfl

/-- Program kernel lowers to well-typed ordered IR + graph + compose ready.
    Greppable: programKernelReady_true, SELF-HOST-KERNEL-PROGRAM,
    HOST-KERNEL-PROGRAM, KERNEL-PROGRAM-THEOREM, HOST-KERNEL-PROGRAM-THEOREM. -/
theorem programKernelReady_true : programKernelReady = true := by decide

/-- Full SH4 program kernel inventory ok holds.
    Greppable: programKernelOk_true, KERNEL-PROGRAM-THEOREM,
    HOST-KERNEL-PROGRAM-THEOREM. -/
theorem programKernelOk_true : programKernelOk = true := by decide

/-- Ordered IR program path honesty holds.
    Greppable: programPathReady_true, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-PROGRAM-THEOREM. -/
theorem programPathReady_true : programPathReady = true := by decide

/-- Graph path honesty (edges + EMPTY-GRAPH-OK) holds.
    Greppable: programGraphPathReady_true, EMPTY-GRAPH-OK,
    KERNEL-PROGRAM-THEOREM. -/
theorem programGraphPathReady_true : programGraphPathReady = true := by decide

/-- HostCompose mult handles + edges path honesty holds.
    Greppable: programComposePathReady_true, HOST-COMPOSE,
    KERNEL-PROGRAM-THEOREM. -/
theorem programComposePathReady_true : programComposePathReady = true := by decide

/-- lowerProgramKernel succeeds (isSome).
    Greppable: lowerProgramKernel_isSome, KERNEL-PROGRAM-THEOREM. -/
theorem lowerProgramKernel_isSome : lowerProgramKernel.isSome = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED sibling: empty program is not program-ready.
    Greppable: programCompileReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-PROGRAM-THEOREM, HOST-KERNEL-PROGRAM-THEOREM. -/
theorem programCompileReady_empty_false :
    programCompileReady IrProgram.empty = false := rfl

/-- lowerProgramKernel yields a length-3 ordered IR program (content equality).
    Greppable: lowerProgramKernel_length_three, KERNEL-PROGRAM-THEOREM,
    HOST-KERNEL-PROGRAM-THEOREM. -/
theorem lowerProgramKernel_length_three :
    (match lowerProgramKernel with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerProgramKernel yields a well-typed ordered IR program (content equality).
    Greppable: lowerProgramKernel_isWellTyped, KERNEL-PROGRAM-THEOREM,
    HOST-KERNEL-PROGRAM-THEOREM. -/
theorem lowerProgramKernel_isWellTyped :
    (match lowerProgramKernel with
     | some p => IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- programKernelProgram (fallback wrapper) has length 3 when lower succeeds.
    Greppable: programKernelProgram_length_three, KERNEL-PROGRAM-THEOREM. -/
theorem programKernelProgram_length_three :
    IrProgram.length programKernelProgram = 3 := by decide

/-- programKernelProgram is well-typed (lower success path content).
    Greppable: programKernelProgram_isWellTyped, KERNEL-PROGRAM-THEOREM. -/
theorem programKernelProgram_isWellTyped :
    IrProgram.isWellTyped programKernelProgram = true := by decide

/-! ### Program kernel smoke (behavioral; lake build fails if an example does not hold)
    Greppable: KERNEL-PROGRAM-SMOKE. -/

/-- KERNEL-PROGRAM-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0" := by decide
example : kernelProgramId = "SELF-HOST-KERNEL-PROGRAM" := by decide
example : hostKernelProgramId = "HOST-KERNEL-PROGRAM" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/KernelProgram.lean" := by decide
example : productIrProgramId = "IR_PROGRAM_V0" := by decide
example : productIrGraphId = "IR_GRAPH_EDGES_V0" := by decide
example : productHostComposeId = "HOST_COMPOSE_V0" := by decide
example : productIrProgramApi = "slake_ir_program" := by decide
example : productIrGraphApi = "slake_ir_graph" := by decide
example : productHostComposeApi = "slake_host_compose" := by decide
example : programSurfaceOk = true := by decide

/-- KERNEL-PROGRAM-SMOKE: lowerProgramKernel builds a 3-node well-typed program. -/
example : (lowerProgramKernel.isSome) = true := by decide
example : programKernelProgram.nodes.length = 3 := by decide
example : IrProgram.isWellTyped programKernelProgram = true := by decide
example : programCompileReady programKernelProgram = true := by decide

/-- KERNEL-PROGRAM-SMOKE: nodes pair kind with mult. -/
example :
    (match programKernelProgram.nodes with
     | [n0, n1, n2] =>
         n0.mult == Mult.mult0 && n0.kind == NodeKind.erased && n0.isWellTyped
           && n1.mult == Mult.mult1 && n1.kind == NodeKind.linear && n1.isWellTyped
           && n2.mult == Mult.multOmega && n2.kind == NodeKind.value && n2.isWellTyped
     | _ => false) = true := by decide

/-- KERNEL-PROGRAM-SMOKE: program path honesty (empty fail-closed + fold + push). -/
example : programPathReady = true := by decide
example : programCompileReady IrProgram.empty = false := by decide
example : IrProgram.isWellTyped IrProgram.empty = false := by decide
example :
    (IrProgram.foldWellTyped IrProgram.empty (0 : Nat) (fun acc _ => acc + 1)).isNone
      = true := by decide
example :
    (match IrProgram.foldWellTyped programKernelProgram (0 : Nat)
        (fun acc _ => acc + 1) with
     | some n => n == 3
     | none => false) = true := by decide

/-- KERNEL-PROGRAM-SMOKE: graph path honesty (edges + EMPTY-GRAPH-OK). -/
example : programGraphPathReady = true := by decide
example : IrGraph.isWellTyped IrGraph.empty = true := by decide
example : (lowerProgramGraph.isSome) = true := by decide
example :
    (match lowerProgramGraph with
     | some g => IrGraph.edgeCount g == 2 && IrGraph.nodeCount g == 3
     | none => false) = true := by decide

/-- KERNEL-PROGRAM-SMOKE: HostCompose path honesty. -/
example : programComposePathReady = true := by decide
example : LinearHost.empty.live = false := by decide

/-- KERNEL-PROGRAM-SMOKE: program kernel ready and full inventory ok. -/
example : programKernelReady = true := by decide
example : programKernelOk = true := by decide
example : gradeSurfaceOk = true := by decide

/-- KERNEL-PROGRAM-SMOKE: capacity honesty cites. -/
example : IrProgram.programCap = 8 := by decide
example : IrGraph.edgeMax = 16 := by decide

end SystemsLean.KernelProgram
