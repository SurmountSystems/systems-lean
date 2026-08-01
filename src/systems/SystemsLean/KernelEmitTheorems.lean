/-
  SYSTEMS_LEAN_HOST partial -- KernelEmit KERNEL-EMIT-THEOREM +
  KERNEL-EMIT-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.KernelEmit: theorems and behavioral smoke
  live here; stage ids, lowerers, *Ready bars, and emitKernelOk stay in
  KernelEmit. Same namespace SystemsLean.KernelEmit so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - KERNEL-EMIT-THEOREM / HOST-KERNEL-EMIT-THEOREM: stageId_eq /
    kernelEmitId_eq / hostKernelEmitId_eq / emitKernelReady_true /
    emitKernelOk_true / emitPlanPathReady_true / emitApplyPathReady_true /
    emitBodyPathReady_true / lowerEmitCompose_isSome /
    lowerEmitCompose_plan_counts / lowerEmitCompose_apply_tags /
    lowerEmitCompose_body_fragment.
  - KERNEL-EMIT-SMOKE: stage / path / product cites / lowerEmitCompose /
    plan/apply/body path / Mult emit / emitKernelReady behavioral examples
    (lake build fails if example fails).

  These KernelEmit theorems do NOT set SpecProof.proofCompleteClaimed true.
  Codegen host honesty theorems != freestanding product self-host complete.

  Intentional non-claims:
  - Codegen host honesty canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - No new EMIT_* C residual stage.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, KERNEL-EMIT-THEOREM,
  HOST-KERNEL-EMIT-THEOREM, KERNEL-EMIT-SMOKE, stageId_eq,
  kernelEmitId_eq, hostKernelEmitId_eq, emitKernelReady_true,
  emitKernelOk_true, emitPlanPathReady_true, emitApplyPathReady_true,
  emitBodyPathReady_true, lowerEmitCompose_isSome,
  lowerEmitCompose_plan_counts, lowerEmitCompose_apply_tags,
  lowerEmitCompose_body_fragment, KernelEmitTheorems, UNIT_SURFACE host
  surface, RUNTIME-FS, EMIT-PLAN, EMIT-APPLY, EMIT-BODY, HOST-EMIT-SSOT,
  HOST-EMIT-MULT.
  Module: SystemsLean.KernelEmitTheorems
  Red/green: just systems-host; lake build SystemsLean.KernelEmitTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.HostCompose
import SystemsLean.EmitPlan
import SystemsLean.EmitApply
import SystemsLean.EmitBody
import SystemsLean.EmitMult
import SystemsLean.KernelProgram
import SystemsLean.KernelEmit

namespace SystemsLean.KernelEmit

open SystemsLean.HostCompose (Host)

/-! ### KERNEL-EMIT-THEOREM / HOST-KERNEL-EMIT-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is freestanding
  codegen host honesty (plan/apply/body + Mult emit over program kernel) only.
  Does not complete SpecProof; does not claim residual free / freestanding
  product self-host complete / PROVABLY / llvm unlock. No new EMIT_* C stage.
  maxRecDepth raised for programKernelReady / emitKernelReady unfolds.
-/

set_option maxRecDepth 8192

/-- Primary stage id is greppable SLAKE_SELF_HOST_KERNEL_EMIT_V0.
    Greppable: stageId_eq, KERNEL-EMIT-THEOREM, HOST-KERNEL-EMIT-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_KERNEL_EMIT_V0" := rfl

/-- Short map id is greppable SELF-HOST-KERNEL-EMIT.
    Greppable: kernelEmitId_eq, KERNEL-EMIT-THEOREM. -/
theorem kernelEmitId_eq : kernelEmitId = "SELF-HOST-KERNEL-EMIT" := rfl

/-- Host map id is greppable HOST-KERNEL-EMIT.
    Greppable: hostKernelEmitId_eq, KERNEL-EMIT-THEOREM,
    HOST-KERNEL-EMIT-THEOREM. -/
theorem hostKernelEmitId_eq : hostKernelEmitId = "HOST-KERNEL-EMIT" := rfl

/-- Emit / codegen kernel readiness holds (program + plan/apply/body + Mult).
    Greppable: emitKernelReady_true, SELF-HOST-KERNEL-EMIT, HOST-KERNEL-EMIT,
    KERNEL-EMIT-THEOREM, HOST-KERNEL-EMIT-THEOREM. -/
theorem emitKernelReady_true : emitKernelReady = true := by decide

/-- Full SH4 emit kernel inventory ok holds.
    Greppable: emitKernelOk_true, KERNEL-EMIT-THEOREM,
    HOST-KERNEL-EMIT-THEOREM. -/
theorem emitKernelOk_true : emitKernelOk = true := by decide

/-- EMIT-PLAN path honesty over program kernel surface holds.
    Greppable: emitPlanPathReady_true, EMIT-PLAN, KERNEL-EMIT-THEOREM. -/
theorem emitPlanPathReady_true : emitPlanPathReady = true := by decide

/-- EMIT-APPLY path honesty over program kernel surface holds.
    Greppable: emitApplyPathReady_true, EMIT-APPLY, KERNEL-EMIT-THEOREM. -/
theorem emitApplyPathReady_true : emitApplyPathReady = true := by decide

/-- EMIT-BODY / HOST-EMIT-SSOT path honesty holds.
    Greppable: emitBodyPathReady_true, EMIT-BODY, HOST-EMIT-SSOT,
    KERNEL-EMIT-THEOREM. -/
theorem emitBodyPathReady_true : emitBodyPathReady = true := by decide

/-- lowerEmitCompose succeeds (isSome).
    Greppable: lowerEmitCompose_isSome, KERNEL-EMIT-THEOREM,
    HOST-KERNEL-EMIT-THEOREM. -/
theorem lowerEmitCompose_isSome : lowerEmitCompose.isSome = true := by decide

/-- lowerEmitCompose plan inventory content: 3 nodes, 2 edges, 2 runtime, 1 erased.
    Greppable: lowerEmitCompose_plan_counts, EMIT-PLAN, KERNEL-EMIT-THEOREM,
    HOST-KERNEL-EMIT-THEOREM. -/
theorem lowerEmitCompose_plan_counts :
    (match lowerEmitCompose with
     | some hc =>
         let p := EmitPlan.planFromCompose hc
         p.nodeCount == 3 && p.edgeCount == 2 && p.runtimeNodes == 2
           && p.erasedNodes == 1 && EmitPlan.isReady p
     | none => false) = true := by decide

/-- lowerEmitCompose apply tag buffer content: [2, 17, 32] order erased/linear/value.
    Greppable: lowerEmitCompose_apply_tags, EMIT-APPLY, KERNEL-EMIT-THEOREM,
    HOST-KERNEL-EMIT-THEOREM. -/
theorem lowerEmitCompose_apply_tags :
    (match lowerEmitCompose with
     | some hc =>
         let a := EmitApply.applyFromCompose hc
         a.count == 3
           && a.tags == [expectedTagErased, expectedTagLinear, expectedTagValue]
           && EmitApply.applyIsValid a
     | none => false) = true := by decide

/-- lowerEmitCompose body fragment equals expected HOST-EMIT-SSOT text.
    Greppable: lowerEmitCompose_body_fragment, EMIT-BODY, HOST-EMIT-SSOT,
    KERNEL-EMIT-THEOREM, HOST-KERNEL-EMIT-THEOREM. -/
theorem lowerEmitCompose_body_fragment :
    (match lowerEmitCompose with
     | some hc =>
         let b := EmitBody.bodyFromCompose hc
         b.buf == expectedBodyFragment && EmitBody.bodyIsValid b
     | none => false) = true := by decide

/-! ### Emit kernel smoke (behavioral; lake build fails if an example does not hold)
    Greppable: KERNEL-EMIT-SMOKE.
    maxRecDepth already raised above for programKernelReady / emitKernelReady. -/

/-- KERNEL-EMIT-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_KERNEL_EMIT_V0" := by decide
example : kernelEmitId = "SELF-HOST-KERNEL-EMIT" := by decide
example : hostKernelEmitId = "HOST-KERNEL-EMIT" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/KernelEmit.lean" := by decide
example : programKernelStageCite = "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0" := by decide
example : productEmitPlanId = "EMIT_PLAN_V0" := by decide
example : productEmitApplyId = "EMIT_APPLY_V0" := by decide
example : productEmitBodyId = "EMIT_BODY_V0" := by decide
example : productHostEmitSsotId = "HOST-EMIT-SSOT" := by decide
example : productHostEmitMultId = "HOST-EMIT-MULT" := by decide
example : productEmitPlanApi = "slake_emit_plan" := by decide
example : productEmitApplyApi = "slake_emit_apply" := by decide
example : productEmitBodyApi = "slake_emit_body" := by decide
example : emitSurfaceOk = true := by decide

/-- KERNEL-EMIT-SMOKE: lowerEmitCompose succeeds; program kernel ready. -/
example : (lowerEmitCompose.isSome) = true := by decide
example : KernelProgram.programKernelReady = true := by decide

/-- KERNEL-EMIT-SMOKE: plan path honesty (empty / unminted / emit host). -/
example : emitPlanPathReady = true := by decide
example : EmitPlan.planOk HostCompose.empty = true := by decide
example : EmitPlan.planOk unmintedEmitCompose = false := by decide
example :
    (match lowerEmitCompose with
     | some hc =>
         let p := EmitPlan.planFromCompose hc
         EmitPlan.isReady p && p.nodeCount == 3 && p.edgeCount == 2
           && p.runtimeNodes == 2 && p.erasedNodes == 1
     | none => false) = true := by decide

/-- KERNEL-EMIT-SMOKE: apply path honesty (tags + packing). -/
example : emitApplyPathReady = true := by decide
example : EmitApply.applyOk HostCompose.empty = true := by decide
example : EmitApply.applyOk unmintedEmitCompose = false := by decide
example :
    (match lowerEmitCompose with
     | some hc =>
         let a := EmitApply.applyFromCompose hc
         EmitApply.applyIsValid a && a.count == 3
           && a.tags == [expectedTagErased, expectedTagLinear, expectedTagValue]
     | none => false) = true := by decide

/-- KERNEL-EMIT-SMOKE: body path honesty (HOST-EMIT-SSOT fragment). -/
example : emitBodyPathReady = true := by decide
example : EmitBody.bodyOk HostCompose.empty = true := by decide
example : EmitBody.bodyOk unmintedEmitCompose = false := by decide
example :
    (match lowerEmitCompose with
     | some hc =>
         let b := EmitBody.bodyFromCompose hc
         EmitBody.bodyIsValid b && b.runtimeNodes == 2 && b.erasedNodes == 1
           && b.tagCount == 3 && b.buf == expectedBodyFragment
     | none => false) = true := by decide
example :
    EmitBody.emptyComposeFragmentSsot
      == "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */\n" := by decide

/-- KERNEL-EMIT-SMOKE: Mult product text honesty composes (HOST-EMIT-MULT). -/
example : EmitMult.emitMultReady = true := by decide

/-- KERNEL-EMIT-SMOKE: emit kernel ready and full inventory ok. -/
example : emitKernelReady = true := by decide
example : emitKernelOk = true := by decide

/-- KERNEL-EMIT-SMOKE: capacity honesty cites (frozen wire). -/
example : EmitApply.applyCap = 32 := by decide
example : EmitBody.bodyCap = 256 := by decide

end SystemsLean.KernelEmit
