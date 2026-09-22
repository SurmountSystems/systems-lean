/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SelfApply.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfApplySource. Not occupancy name 50. Not mill 70.
  This wrap is SelfApply.lean. It is not SelfApplyTheorems.lean.
  It is not SelfApplyFsClose.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveSelfApplySource,
  HOST-FRONT-LIVE-SELF-APPLY, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSelfApplySource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSelfApply

/-- Dual-pinned live SelfApply.lean bytes (must match on-disk file).
    Greppable: liveSelfApplySource, HOST-FRONT-LIVE-SELF-APPLY. -/
def liveSelfApplySource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- compiler self-application readiness (SH5 partial).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): ParityMult.lean Mult closed-loop (SH3); KernelLinear.lean
    Linear kernel IR + HostCompose path (SH4 start); KernelTypes.lean Types
    kernel IR + program path (SH4 growth); KernelProgram.lean program / graph /
    compose path (SH4 remainder); KernelEmit.lean emit plan/apply/body path
    (SH4 freestanding codegen host honesty); KernelMult / EmitMult prior Mult
    ladder; SelfHost.lean direction canary (P5); self-host.md acceptance.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_SELF_APPLY_V0 / HOST-SELF-APPLY / SELF-HOST-SELF-APPLY:
    first honest SH5 rung -- host self-application readiness composed from Mult
    closed loop + Linear kernel + Types kernel + Program kernel + Emit kernel
    evidence (not empty docs; not presence-only).
  - kernelRebuildsKernel (this stage): Mult side = Mult closed-loop readiness
    (ParityMult.multParityReady: Mult kernel IR + EmitMult product text +
    gradeParityOk); Linear side = Linear kernel readiness
    (KernelLinear.linearKernelReady: Linear ordered IR + HostCompose path);
    Types side = Types kernel readiness
    (KernelTypes.typesKernelReady: typed IR + program path fold);
    Program side = Program kernel readiness
    (KernelProgram.programKernelReady: ordered IR + graph edges + HostCompose);
    Emit side = Emit / codegen kernel readiness
    (KernelEmit.emitKernelReady: program kernel + plan/apply/body + Mult emit);
    all readiness paths decide true on the classic elaborator -- structural
    self-application of host kernel modules. NOT "product freestanding C
    recompiles full Slake compiler end-to-end".
  - selfApplyReady: ParityMult.multParityReady && KernelLinear.linearKernelReady
    && KernelTypes.typesKernelReady && KernelProgram.programKernelReady &&
    KernelEmit.emitKernelReady && selfApplySurfaceOk.
  - Host model = structural readiness compose. Not an AI/ML model. Not product C.

  Theorems + smoke live in SystemsLean.SelfApplyTheorems (same namespace;
  long-file split):
  SELF-APPLY-THEOREM / HOST-SELF-APPLY-THEOREM /
  SELF-APPLY-SMOKE / HOST-SELF-APPLY-SMOKE --
  selfApplyReady_true / kernelRebuildsKernel_true / selfApplySurfaceOk_true /
  stageId_eq / hostSelfApplyId_eq / selfApplyOk_true / selfApplyOk_eq_ready.
  Core claim Bools + selfApplyReady stay here.
  These SelfApply theorems do NOT set SpecProof.proofCompleteClaimed true.
  Host structural self-apply readiness != freestanding product self-host complete.
  selfApplyOk is a definitional alias of selfApplyReady (joint-name honesty only;
  not a stronger gate; selfApplyOk_eq_ready proves equality).

  Intentional non-claims / partial parity:
  - PARTIAL: host structural kernel-rebuilds-kernel only; not freestanding product
    self-host complete; not residual free; not full Slake body compile.
  - SH4 freestanding codegen host honesty is KernelEmit (partial; product wire
    bulk still frozen at EMIT_BODY_V0 except HOST-EMIT-SSOT + HOST-EMIT-MULT).
  - Not PROVABLY. Does not unlock llvm / out/llvm-ir as done (SH6 held
    documented in LlvmHold.lean -- hold gate, not unlock).
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not grow bash EMIT_* residual treadmill. No new EMIT_* C stage.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_SELF_APPLY_V0, HOST-SELF-APPLY,
  SELF-HOST-SELF-APPLY, SELF-APPLY-SMOKE, HOST-SELF-APPLY-SMOKE, selfApplyReady,
  kernelRebuildsKernel, HOST-PARITY-MULT, SELF-HOST-KERNEL-LINEAR,
  SELF-HOST-KERNEL-TYPES, SELF-HOST-KERNEL-PROGRAM, SELF-HOST-KERNEL-EMIT,
  multParityReady, linearKernelReady, typesKernelReady, programKernelReady,
  emitKernelReady, SELF-APPLY-THEOREM, HOST-SELF-APPLY-THEOREM,
  selfApplyReady_true, kernelRebuildsKernel_true, selfApplySurfaceOk_true,
  selfApplyOk_true, selfApplyOk_eq_ready, stageId_eq, hostSelfApplyId_eq,
  SelfApplyTheorems, SELF-HOST, MULT-0, MULT-1, MULT-OMEGA, JOIN-ALG,
  ConsumeToken, UNIT_SURFACE host surface. Module: SystemsLean.SelfApply
  Long-file split: SELF-APPLY-THEOREM / SELF-APPLY-SMOKE in
  SystemsLean.SelfApplyTheorems (same namespace). Core readiness stays here.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.ParityMult
import SystemsLean.KernelLinear
import SystemsLean.KernelTypes
import SystemsLean.KernelProgram
import SystemsLean.KernelEmit

namespace SystemsLean.SelfApply

/-- Greppable primary stage id for host self-application readiness (SH5 partial). -/
def stageId : String := "SLAKE_SELF_HOST_SELF_APPLY_V0"

/-- Greppable host map id (HOST-SELF-APPLY). -/
def hostSelfApplyId : String := "HOST-SELF-APPLY"

/-- Greppable short map id (SELF-HOST-SELF-APPLY). -/
def selfHostSelfApplyId : String := "SELF-HOST-SELF-APPLY"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/SelfApply.lean"

/-- Prior Mult closed-loop stage cite (SH3; composed into self-apply). -/
def multParityStageCite : String := "SLAKE_SELF_HOST_PARITY_MULT_V0"

/-- Prior Linear kernel stage cite (SH4; composed into self-apply). -/
def linearKernelStageCite : String := "SLAKE_SELF_HOST_KERNEL_LINEAR_V0"

/-- Prior Types kernel stage cite (SH4 growth; composed into self-apply). -/
def typesKernelStageCite : String := "SLAKE_SELF_HOST_KERNEL_TYPES_V0"

/-- Prior Program kernel stage cite (SH4 remainder; composed into self-apply). -/
def programKernelStageCite : String := "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0"

/-- Prior Emit / codegen kernel stage cite (SH4 remainder; composed into self-apply). -/
def emitKernelStageCite : String := "SLAKE_SELF_HOST_KERNEL_EMIT_V0"

/-- Surface canary: stage ids + path cites + prior ladder stage cites. -/
def selfApplySurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_SELF_APPLY_V0")
    && (hostSelfApplyId == "HOST-SELF-APPLY")
    && (selfHostSelfApplyId == "SELF-HOST-SELF-APPLY")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/SelfApply.lean")
    && (multParityStageCite == "SLAKE_SELF_HOST_PARITY_MULT_V0")
    && (linearKernelStageCite == "SLAKE_SELF_HOST_KERNEL_LINEAR_V0")
    && (typesKernelStageCite == "SLAKE_SELF_HOST_KERNEL_TYPES_V0")
    && (programKernelStageCite == "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0")
    && (emitKernelStageCite == "SLAKE_SELF_HOST_KERNEL_EMIT_V0")

/-- multKernelSideReady -- Mult closed-loop side of self-application (SH3 bar).
    Greppable: multKernelSideReady, HOST-PARITY-MULT, multParityReady. -/
def multKernelSideReady : Bool :=
  ParityMult.multParityReady

/-- linearKernelSideReady -- Linear kernel side of self-application (SH4 bar).
    Greppable: linearKernelSideReady, SELF-HOST-KERNEL-LINEAR, linearKernelReady. -/
def linearKernelSideReady : Bool :=
  KernelLinear.linearKernelReady

/-- typesKernelSideReady -- Types kernel side of self-application (SH4 growth).
    Greppable: typesKernelSideReady, SELF-HOST-KERNEL-TYPES, typesKernelReady. -/
def typesKernelSideReady : Bool :=
  KernelTypes.typesKernelReady

/-- programKernelSideReady -- Program kernel side of self-application (SH4 remainder).
    Greppable: programKernelSideReady, SELF-HOST-KERNEL-PROGRAM, programKernelReady. -/
def programKernelSideReady : Bool :=
  KernelProgram.programKernelReady

/-- emitKernelSideReady -- Emit / codegen kernel side of self-application (SH4).
    Greppable: emitKernelSideReady, SELF-HOST-KERNEL-EMIT, emitKernelReady. -/
def emitKernelSideReady : Bool :=
  KernelEmit.emitKernelReady

/-- kernelRebuildsKernel -- SH5 partial meaning of "kernel rebuilds kernel".
    FAIL-CLOSED: Mult closed-loop AND Linear kernel AND Types kernel AND
    Program kernel AND Emit / codegen kernel readiness.
    Honest scope: host elaborator lowers Mult / Linear / Types / Program / Emit
    kernel IR and readiness predicates decide true (structural self-application
    of host kernel modules over themselves). Not freestanding product C
    recompiling full Slake. Not residual free. Not PROVABLY.
    Greppable: kernelRebuildsKernel, SELF-HOST-SELF-APPLY. -/
def kernelRebuildsKernel : Bool :=
  multKernelSideReady && linearKernelSideReady && typesKernelSideReady
    && programKernelSideReady && emitKernelSideReady

/-- selfApplyReady -- SH5 partial compiler self-application host readiness.
    FAIL-CLOSED: Mult closed loop + Linear + Types + Program + Emit kernel + surface.
    Composes SH3 (ParityMult) + SH4 (KernelLinear + KernelTypes + KernelProgram
    + KernelEmit) into one bar.
    Greppable: selfApplyReady, HOST-SELF-APPLY, SELF-HOST-SELF-APPLY. -/
def selfApplyReady : Bool :=
  kernelRebuildsKernel && selfApplySurfaceOk

/-- Full SH5 partial inventory ok -- definitional alias of selfApplyReady
    (joint-name honesty only; not a stronger gate).
    Greppable: selfApplyOk, selfApplyReady. -/
def selfApplyOk : Bool := selfApplyReady

/-! ### SELF-APPLY-THEOREM + SELF-APPLY-SMOKE split to SelfApplyTheorems
    (same namespace). Greppable cites live on SelfApplyTheorems:
    SELF-APPLY-THEOREM, HOST-SELF-APPLY-THEOREM, SELF-APPLY-SMOKE,
    HOST-SELF-APPLY-SMOKE, stageId_eq, hostSelfApplyId_eq,
    selfApplySurfaceOk_true, kernelRebuildsKernel_true, selfApplyReady_true,
    selfApplyOk_true, selfApplyOk_eq_ready, SelfApplyTheorems.
    Import SystemsLean.SelfApplyTheorems from the package root. Core claim
    Bools + ready surface stay here -- host structural self-apply readiness only;
    free claims stay false; freestanding product complete is SelfApplyFs tip;
    not llvm / PROVABLY unlock. -/

end SystemsLean.SelfApply
"#

end SystemsLean.HostFrontLiveSelfApply
