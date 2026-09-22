/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live KernelLinearTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelLinearTheoremsSource. Not occupancy name 50. Not mill 70.
  Not HostFrontLiveKernelLinearSource (that wrap dual-pins KernelLinear.lean).
  Unique needles (trailing newline so HostFrontLiveKernelLinearTheoremsSource is
  not a prefix hit on KernelLinear wrap HostFrontLiveKernelLinearSource):
  HostFrontLiveKernelLinearTheoremsSource
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS
  HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS
  liveKernelLinearTheoremsSource
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-KERNEL-LINEAR-THEOREMS,
  liveKernelLinearTheoremsSource, liveRel,
  HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveKernelLinearTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelLinearTheorems

/-- Dual-pinned live KernelLinearTheorems.lean bytes (must match on-disk file).
    Greppable: liveKernelLinearTheoremsSource, PARSE-LIVE-KERNEL-LINEAR-THEOREMS. -/
def liveKernelLinearTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelLinear KERNEL-LINEAR-THEOREM +
  KERNEL-LINEAR-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.KernelLinear: theorems and behavioral smoke
  live here; stage ids, lowerers, *Ready bars, and linearKernelOk stay in
  KernelLinear. Same namespace SystemsLean.KernelLinear so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - KERNEL-LINEAR-THEOREM / HOST-KERNEL-LINEAR-THEOREM: stageId_eq /
    kernelLinearId_eq / hostKernelLinearId_eq / linearKernelReady_true /
    linearKernelOk_true / linearHostPathReady_true / lowerLinearKernel_isSome /
    linearMismatchRejected_true / programCompileReady_empty_false /
    lowerLinearKernel_length_one / lowerLinearKernel_isWellTyped /
    linearKernelProgram_length_one / linearKernelProgram_isWellTyped.
  - KERNEL-LINEAR-SMOKE: stage / path / product cites / lowerLinearKernel /
    HostCompose path / linearKernelReady behavioral examples (lake build fails
    if example fails).

  These KernelLinear theorems do NOT set SpecProof.proofCompleteClaimed true.
  Linear IR + host compose theorems != freestanding product self-host complete.

  Intentional non-claims:
  - Linear kernel canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-LINEAR-THEOREM,
  HOST-KERNEL-LINEAR-THEOREM, KERNEL-LINEAR-SMOKE, stageId_eq,
  kernelLinearId_eq, hostKernelLinearId_eq, linearKernelReady_true,
  linearKernelOk_true, linearHostPathReady_true, lowerLinearKernel_isSome,
  linearMismatchRejected_true, programCompileReady_empty_false,
  lowerLinearKernel_length_one, lowerLinearKernel_isWellTyped,
  linearKernelProgram_length_one, linearKernelProgram_isWellTyped,
  KernelLinearTheorems, UNIT_SURFACE host surface, MULT-1, LINEAR-EXACT-ONCE,
  JOIN-ALG, EMPTY-PROGRAM-FAIL-CLOSED, HOST-COMPOSE, CONSUME_TOKEN_HOST_V0.
  Module: SystemsLean.KernelLinearTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelLinearTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.HostCompose
import SystemsLean.CompilePath
import SystemsLean.KernelLinear

namespace SystemsLean.KernelLinear

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host LinearHost)
open SystemsLean.CompilePath (programCompileReady gradeSurfaceOk)

/-! ### KERNEL-LINEAR-THEOREM / HOST-KERNEL-LINEAR-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is Linear kernel
  readiness, HostCompose mint/consume path, mismatch reject, and empty-program
  sibling fail-closed only. Does not complete SpecProof; does not claim residual
  free / freestanding product self-host complete / PROVABLY / llvm unlock.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_KERNEL_LINEAR_V0.
    Greppable: stageId_eq, KERNEL-LINEAR-THEOREM, HOST-KERNEL-LINEAR-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_KERNEL_LINEAR_V0" := rfl

/-- Short map id is greppable SELF-HOST-KERNEL-LINEAR.
    Greppable: kernelLinearId_eq, KERNEL-LINEAR-THEOREM. -/
theorem kernelLinearId_eq : kernelLinearId = "SELF-HOST-KERNEL-LINEAR" := rfl

/-- Host map id is greppable HOST-KERNEL-LINEAR.
    Greppable: hostKernelLinearId_eq, KERNEL-LINEAR-THEOREM,
    HOST-KERNEL-LINEAR-THEOREM. -/
theorem hostKernelLinearId_eq : hostKernelLinearId = "HOST-KERNEL-LINEAR" := rfl

/-- Linear kernel lowers to well-typed ordered IR + host compose path ready.
    Greppable: linearKernelReady_true, SELF-HOST-KERNEL-LINEAR,
    HOST-KERNEL-LINEAR, KERNEL-LINEAR-THEOREM, HOST-KERNEL-LINEAR-THEOREM. -/
theorem linearKernelReady_true : linearKernelReady = true := by decide

/-- Full SH4 Linear kernel inventory ok holds (ready + mismatch reject).
    Greppable: linearKernelOk_true, KERNEL-LINEAR-THEOREM,
    HOST-KERNEL-LINEAR-THEOREM. -/
theorem linearKernelOk_true : linearKernelOk = true := by decide

/-- HostCompose MULT-1 mint/consume exact-once path holds.
    Greppable: linearHostPathReady_true, HOST-COMPOSE, LINEAR-EXACT-ONCE,
    KERNEL-LINEAR-THEOREM. -/
theorem linearHostPathReady_true : linearHostPathReady = true := by decide

/-- lowerLinearKernel succeeds (isSome).
    Greppable: lowerLinearKernel_isSome, KERNEL-LINEAR-THEOREM. -/
theorem lowerLinearKernel_isSome : lowerLinearKernel.isSome = true := by decide

/-- Kind/mult mismatch for LINEAR fails closed.
    Greppable: linearMismatchRejected_true, KERNEL-LINEAR-THEOREM. -/
theorem linearMismatchRejected_true : linearMismatchRejected = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED sibling: empty program is not program-ready.
    Greppable: programCompileReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    KERNEL-LINEAR-THEOREM, HOST-KERNEL-LINEAR-THEOREM. -/
theorem programCompileReady_empty_false :
    programCompileReady IrProgram.empty = false := rfl

/-- lowerLinearKernel yields a length-1 ordered IR program (content equality).
    Greppable: lowerLinearKernel_length_one, KERNEL-LINEAR-THEOREM,
    HOST-KERNEL-LINEAR-THEOREM. -/
theorem lowerLinearKernel_length_one :
    (match lowerLinearKernel with
     | some p => IrProgram.length p == 1
     | none => false) = true := by decide

/-- lowerLinearKernel yields a well-typed ordered IR program (content equality).
    Greppable: lowerLinearKernel_isWellTyped, KERNEL-LINEAR-THEOREM,
    HOST-KERNEL-LINEAR-THEOREM. -/
theorem lowerLinearKernel_isWellTyped :
    (match lowerLinearKernel with
     | some p => IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- linearKernelProgram (fallback wrapper) has length 1 when lower succeeds.
    Greppable: linearKernelProgram_length_one, KERNEL-LINEAR-THEOREM. -/
theorem linearKernelProgram_length_one :
    IrProgram.length linearKernelProgram = 1 := by decide

/-- linearKernelProgram is well-typed (lower success path content).
    Greppable: linearKernelProgram_isWellTyped, KERNEL-LINEAR-THEOREM. -/
theorem linearKernelProgram_isWellTyped :
    IrProgram.isWellTyped linearKernelProgram = true := by decide

/-! ### Linear kernel smoke (behavioral; lake build fails if an example does not hold)
    Greppable: KERNEL-LINEAR-SMOKE. -/

/-- KERNEL-LINEAR-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_KERNEL_LINEAR_V0" := by decide
example : kernelLinearId = "SELF-HOST-KERNEL-LINEAR" := by decide
example : hostKernelLinearId = "HOST-KERNEL-LINEAR" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/KernelLinear.lean" := by decide
example : productLinearApi = "slake_linear_consume" := by decide
example : productConsumeTokenHostId = "CONSUME_TOKEN_HOST_V0" := by decide
example : linearSurfaceOk = true := by decide

/-- KERNEL-LINEAR-SMOKE: lowerLinearKernel builds a 1-node well-typed program. -/
example : (lowerLinearKernel.isSome) = true := by decide
example : linearKernelProgram.nodes.length = 1 := by decide
example : IrProgram.isWellTyped linearKernelProgram = true := by decide
example : programCompileReady linearKernelProgram = true := by decide

/-- KERNEL-LINEAR-SMOKE: node is MULT-1 LINEAR (LINEAR-EXACT-ONCE resource). -/
example :
    (match linearKernelProgram.nodes with
     | [n] => n.mult == Mult.mult1 && n.kind == NodeKind.linear && n.isWellTyped
     | _ => false) = true := by decide

/-- KERNEL-LINEAR-SMOKE: HostCompose mint/consume exact-once path. -/
example : linearHostPathReady = true := by decide

/-- KERNEL-LINEAR-SMOKE: Linear kernel ready and full inventory ok. -/
example : linearKernelReady = true := by decide
example : linearMismatchRejected = true := by decide
example : linearKernelOk = true := by decide
example : gradeSurfaceOk = true := by decide

/-- KERNEL-LINEAR-SMOKE: empty program is NOT kernel-ready (sibling EMPTY-PROGRAM). -/
example : programCompileReady IrProgram.empty = false := by decide

/-- KERNEL-LINEAR-SMOKE: kind/mult mismatch fails closed. -/
example :
    (Types.mkNode? 0 Mult.mult1 NodeKind.erased).isNone = true := by decide
example :
    (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone = true := by decide

/-- KERNEL-LINEAR-SMOKE: empty LinearHost is not live (JOIN-ALG empty before mint). -/
example : LinearHost.empty.live = false := by decide
example : LinearHost.empty.id = 0 := by decide

end SystemsLean.KernelLinear
"#

end SystemsLean.HostFrontLiveKernelLinearTheorems
