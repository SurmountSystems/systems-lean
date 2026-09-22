/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live KernelMult.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelMultSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-KERNELMULT, liveKernelMultSource,
  HOST-FRONT-LIVE-KERNELMULT, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveKernelMultSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelMult

/-- Dual-pinned live KernelMult.lean bytes (must match on-disk file).
    Greppable: liveKernelMultSource, PARSE-LIVE-KERNELMULT. -/
def liveKernelMultSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult self-host kernel IR fixture (SH1 start).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Mult.lean grades; Types kind/mult pairing; IrProgram
    ordered IR; CompilePath.programCompileReady; self-host.md acceptance.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_KERNEL_MULT_V0 / SELF-HOST-KERNEL-MULT: first freestanding
    self-host kernel unit -- Mult grades as a real ordered IR program, not a
    Bool canary alone.
  - multKernelProgram: three well-typed nodes, one per grade, with correct
    kind/mult pairing (ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA).
  - lowerMultKernel: fail-closed build via Types.mkNode? + IrProgram.push;
    none if any push fails.
  - multKernelReady: programCompileReady on the lowered program (implies
    non-empty, well-typed, EMPTY-PROGRAM-FAIL-CLOSED on empty).
  - unknownTagRejected: Mult.isValidTag 3 is false (FAIL-CLOSED-UNKNOWN-GRADE).
  - Host model = structural representation of Mult contracts as IR.
    Not an AI/ML model. Not product C. Not self-host complete.

  Theorems + smoke live in SystemsLean.KernelMultTheorems (same namespace;
  long-file split):
  KERNEL-MULT-THEOREM / HOST-KERNEL-MULT-THEOREM / KERNEL-MULT-SMOKE --
  multKernelReady_true / kernelOk_true / unknownTagRejected_true /
  lowerMultKernel_isSome / programCompileReady_empty_false (sibling) /
  lowerMultKernel_length_three / lowerMultKernel_isWellTyped /
  multKernelProgram_length_three / multKernelProgram_isWellTyped (content) /
  stageId_eq / kernelMultId_eq.
  Core claim Bools + lowerMultKernel stay here.
  These KernelMult theorems do NOT set SpecProof.proofCompleteClaimed true.
  Mult IR fixture theorems != freestanding product self-host complete.

  Intentional non-claims / partial parity:
  - PARTIAL: IR fixture for Mult only; host-owned Mult C text is EmitMult (SH2);
    closed-loop Mult parity is ParityMult (SH3). Not compiler self-application.
  - Mult end-to-end compile path (grades -> IR -> compose -> HOST-EMIT-MULT) is
    CompilePath.multFixtureCompilePathReady (COMPILE-PATH-MULT / MULT-FIXTURE);
    this module stays IR kernel only (import cycle: KernelMult imports CompilePath).
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_KERNEL_MULT_V0,
  SELF-HOST-KERNEL-MULT, SELF-HOST, KERNEL-MULT-SMOKE, MULT-0, MULT-1,
  MULT-OMEGA, FAIL-CLOSED-UNKNOWN-GRADE, EMPTY-PROGRAM-FAIL-CLOSED,
  ORDERED-IR-PROGRAM, HOST-COMPILE-PATH, KERNEL-MULT-THEOREM,
  HOST-KERNEL-MULT-THEOREM, multKernelReady_true, kernelOk_true,
  lowerMultKernel_length_three, lowerMultKernel_isWellTyped,
  multKernelProgram_length_three, multKernelProgram_isWellTyped,
  KernelMultTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.KernelMult
  Long-file split: KERNEL-MULT-THEOREM / KERNEL-MULT-SMOKE in
  SystemsLean.KernelMultTheorems (same namespace). Core readiness stays here.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.CompilePath

namespace SystemsLean.KernelMult

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)
open SystemsLean.CompilePath (programCompileReady gradeSurfaceOk)

/-- Greppable primary stage id for Mult self-host kernel IR (SH1). -/
def stageId : String := "SLAKE_SELF_HOST_KERNEL_MULT_V0"

/-- Greppable short map id (SELF-HOST-KERNEL-MULT). -/
def kernelMultId : String := "SELF-HOST-KERNEL-MULT"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/KernelMult.lean"

/-- Fixed type tags for the three Mult kernel nodes (deterministic fixture). -/
def tagErased : Nat := 0
def tagLinear : Nat := 1
def tagValue : Nat := 2

/-- mkGradeNode tag m k -- fail-closed typed node (kind/mult pairing). -/
def mkGradeNode (tag : Nat) (m : Mult) (k : NodeKind) : Option IrNode :=
  Types.mkNode? tag m k

/-- pushNode p n? -- push when some well-typed node; none propagates fail-closed. -/
def pushNode (p : Program) (n? : Option IrNode) : Option Program :=
  match n? with
  | none => none
  | some n =>
    match IrProgram.push p n with
    | IrProgram.PushResult.ok p' => some p'
    | _ => none

/-- lowerMultKernel -- build ordered IR for Mult grades (SELF-HOST-KERNEL-MULT).
    Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value.
    FAIL-CLOSED: none if any node or push fails.
    This is a host structural model of Mult contracts as IR -- not product C,
    not an AI model, not freestanding residual free. -/
def lowerMultKernel : Option Program :=
  let p0 : Program := IrProgram.empty
  let n0 := mkGradeNode tagErased Mult.mult0 NodeKind.erased
  let n1 := mkGradeNode tagLinear Mult.mult1 NodeKind.linear
  let n2 := mkGradeNode tagValue Mult.multOmega NodeKind.value
  match pushNode p0 n0 with
  | none => none
  | some p1 =>
    match pushNode p1 n1 with
    | none => none
    | some p2 => pushNode p2 n2

/-- multKernelProgram -- the Mult kernel IR when lower succeeds; empty on fail.
    Prefer multKernelReady / lowerMultKernel for fail-closed checks. -/
def multKernelProgram : Program :=
  match lowerMultKernel with
  | some p => p
  | none => IrProgram.empty

/-- multKernelReady -- SH1 Mult kernel bar.
    FAIL-CLOSED: lowerMultKernel succeeds and programCompileReady holds
    (non-empty well-typed ordered IR) and gradeSurfaceOk (closed Mult surface).
    Greppable: multKernelReady, SELF-HOST-KERNEL-MULT, HOST-COMPILE-PATH. -/
def multKernelReady : Bool :=
  match lowerMultKernel with
  | none => false
  | some p => programCompileReady p && gradeSurfaceOk

/-- unknownTagRejected -- FAIL-CLOSED-UNKNOWN-GRADE on raw tag 3. -/
def unknownTagRejected : Bool := !Mult.isValidTag 3

/-- Kernel surface canary: stage ids + acceptance path cites. -/
def kernelSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_KERNEL_MULT_V0")
    && (kernelMultId == "SELF-HOST-KERNEL-MULT")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/KernelMult.lean")

/-- Full SH1 inventory ok: kernel ready + surface + unknown-tag reject. -/
def kernelOk : Bool :=
  multKernelReady && kernelSurfaceOk && unknownTagRejected

/-! ### KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE split to KernelMultTheorems
    (same namespace). Greppable cites live on KernelMultTheorems:
    KERNEL-MULT-THEOREM, HOST-KERNEL-MULT-THEOREM, KERNEL-MULT-SMOKE,
    multKernelReady_true, kernelOk_true, unknownTagRejected_true,
    lowerMultKernel_isSome, programCompileReady_empty_false,
    lowerMultKernel_length_three, lowerMultKernel_isWellTyped,
    multKernelProgram_length_three, multKernelProgram_isWellTyped,
    stageId_eq, kernelMultId_eq, KernelMultTheorems.
    Import SystemsLean.KernelMultTheorems from the package root. Core claim
    Bools + lowerMultKernel stay here -- Mult IR fixture only; free claims
    stay false; not llvm / PROVABLY unlock. -/

end SystemsLean.KernelMult
"#

end SystemsLean.HostFrontLiveKernelMult
