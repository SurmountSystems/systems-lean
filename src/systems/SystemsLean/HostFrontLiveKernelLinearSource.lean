/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live KernelLinear.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveKernelLinearSource. Not occupancy name 50. Not mill 70.
  Not occupancy leftover HostFrontLiveKernelLinearTerm (that wrap is Term).
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-KERNEL-LINEAR, liveKernelLinearSource,
  HOST-FRONT-LIVE-KERNEL-LINEAR, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveKernelLinearSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveKernelLinear

/-- Dual-pinned live KernelLinear.lean bytes (must match on-disk file).
    Greppable: liveKernelLinearSource, PARSE-LIVE-KERNEL-LINEAR. -/
def liveKernelLinearSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Linear self-host kernel IR + host compose path (SH4 start).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Linear.lean JOIN-ALG ConsumeToken axioms; HostCompose
    LinearHost mint/consume; Types LINEAR/MULT-1 pairing; IrProgram ordered IR;
    CompilePath.programCompileReady; Mult closed-loop SH3 (ParityMult) as prior
    ladder rung; self-host.md acceptance; product CONSUME_TOKEN_HOST_V0 /
    slake_linear_consume (frozen ABI; no new EMIT_* residual C stage).

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_KERNEL_LINEAR_V0 / SELF-HOST-KERNEL-LINEAR / HOST-KERNEL-LINEAR:
    first SH4 ladder growth -- Linear exact-once resource as real ordered IR
    plus HostCompose mint/consume fail-closed path (not a Bool canary alone).
  - lowerLinearKernel: fail-closed build of a 1-node ordered IR program
    (LINEAR kind + MULT-1) via Types.mkNode? + IrProgram.push.
  - linearHostPathReady: HostCompose MULT-1 node requires mint; consume clears
    live (LINEAR-EXACT-ONCE); unminted MULT-1 fails checkFailClosed; id 0 mint
    rejected; double mint rejected.
  - linearKernelReady: programCompileReady on lowered IR + linearHostPathReady
    + gradeSurfaceOk (closed Mult surface; LINEAR pairs MULT-1) + surface canary.
  - Host model = structural representation of Linear consume/token contracts as
    IR + host compose. Not an AI/ML model. Not product C. Not self-host complete.

  Theorems (KERNEL-LINEAR-THEOREM / HOST-KERNEL-LINEAR-THEOREM -- partial
  KernelLinear):
  - Live in SystemsLean.KernelLinearTheorems (same namespace; long-file split).
  - linearKernelReady_true / linearKernelOk_true / linearHostPathReady_true
  - lowerLinearKernel_isSome / linearMismatchRejected_true
  - programCompileReady_empty_false (sibling EMPTY-PROGRAM)
  - lowerLinearKernel_length_one / lowerLinearKernel_isWellTyped /
    linearKernelProgram_length_one / linearKernelProgram_isWellTyped (content)
  - stageId_eq / kernelLinearId_eq / hostKernelLinearId_eq
  - KERNEL-LINEAR-SMOKE behavioral examples live with theorems
  These KernelLinear theorems do NOT set SpecProof.proofCompleteClaimed true.
  Linear IR + host compose theorems != freestanding product self-host complete.

  Intentional non-claims / partial parity:
  - PARTIAL: Linear kernel IR fixture + host compose path only; host-owned Linear
    C text is EmitLinear (HOST-EMIT-LINEAR); not types/program/compose full
    ladder close; SH5 host compose is SelfApply (not freestanding product
    self-host complete).
  - Linear end-to-end compile path (MULT-1 -> IR -> compose mint/consume ->
    HOST-EMIT-LINEAR) is CompilePath.linearFixtureCompilePathReady
    (COMPILE-PATH-LINEAR / LINEAR-FIXTURE); this module stays IR kernel + host
    path only (import cycle: KernelLinear imports CompilePath).
  - Mult closed loop remains SH3 (ParityMult); this module grows the next rung.
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Product wire bulk still frozen at EMIT_BODY_V0; existing Linear ABI only.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_KERNEL_LINEAR_V0,
  SELF-HOST-KERNEL-LINEAR, HOST-KERNEL-LINEAR, SELF-HOST, KERNEL-LINEAR-SMOKE,
  LINEAR-EXACT-ONCE, JOIN-ALG, ConsumeToken, MULT-1, HOST-COMPOSE,
  CONSUME_TOKEN_HOST_V0, EMPTY-PROGRAM-FAIL-CLOSED, ORDERED-IR-PROGRAM,
  HOST-COMPILE-PATH, slake_linear_consume, KERNEL-LINEAR-THEOREM,
  HOST-KERNEL-LINEAR-THEOREM, linearKernelReady_true, linearKernelOk_true,
  linearHostPathReady_true, lowerLinearKernel_isSome,
  linearMismatchRejected_true, programCompileReady_empty_false, stageId_eq,
  kernelLinearId_eq, hostKernelLinearId_eq, KernelLinearTheorems
  UNIT_SURFACE host surface. Module: SystemsLean.KernelLinear
  Long-file split: KERNEL-LINEAR-THEOREM + KERNEL-LINEAR-SMOKE in
  SystemsLean.KernelLinearTheorems (same namespace). Core dialect stays here.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.HostCompose
import SystemsLean.CompilePath

namespace SystemsLean.KernelLinear

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host LinearHost)
open SystemsLean.CompilePath (programCompileReady gradeSurfaceOk)

/-- Greppable primary stage id for Linear self-host kernel IR (SH4 start). -/
def stageId : String := "SLAKE_SELF_HOST_KERNEL_LINEAR_V0"

/-- Greppable short map id (SELF-HOST-KERNEL-LINEAR). -/
def kernelLinearId : String := "SELF-HOST-KERNEL-LINEAR"

/-- Greppable host map id (HOST-KERNEL-LINEAR). -/
def hostKernelLinearId : String := "HOST-KERNEL-LINEAR"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/KernelLinear.lean"

/-- Read-only product Linear / consume-token host cite (frozen wire; no new stage). -/
def productLinearApi : String := "slake_linear_consume"
def productConsumeTokenHostId : String := "CONSUME_TOKEN_HOST_V0"

/-- Fixed type tag for the Linear kernel node (deterministic fixture). -/
def tagLinear : Nat := 1

/-- Fixed mint id for host-compose path smokes (nonzero; emit id==0 fail). -/
def smokeMintId : Nat := 7

/-- mkLinearNode -- fail-closed typed MULT-1 LINEAR node. -/
def mkLinearNode (tag : Nat) : Option IrNode :=
  Types.mkNode? tag Mult.mult1 NodeKind.linear

/-- pushNode p n? -- push when some well-typed node; none propagates fail-closed. -/
def pushNode (p : Program) (n? : Option IrNode) : Option Program :=
  match n? with
  | none => none
  | some n =>
    match IrProgram.push p n with
    | IrProgram.PushResult.ok p' => some p'
    | _ => none

/-- lowerLinearKernel -- build ordered IR for Linear exact-once resource
    (SELF-HOST-KERNEL-LINEAR). One node: MULT-1 linear (LINEAR-EXACT-ONCE).
    FAIL-CLOSED: none if node or push fails.
    Host structural model of Linear contracts as IR -- not product C,
    not an AI model, not freestanding residual free. -/
def lowerLinearKernel : Option Program :=
  let p0 : Program := IrProgram.empty
  pushNode p0 (mkLinearNode tagLinear)

/-- linearKernelProgram -- Linear kernel IR when lower succeeds; empty on fail.
    Prefer linearKernelReady / lowerLinearKernel for fail-closed checks. -/
def linearKernelProgram : Program :=
  match lowerLinearKernel with
  | some p => p
  | none => IrProgram.empty

/-- smokeLinearNode -- well-typed MULT-1 LINEAR fixture for HostCompose path. -/
def smokeLinearNode : IrNode :=
  { ty := typeTagInit tagLinear, mult := Mult.mult1, kind := NodeKind.linear }

/-- pushLinearHost hc -- push MULT-1 LINEAR onto compose-owned graph; none on fail. -/
def pushLinearHost (hc : Host) : Option Host :=
  match HostCompose.pushHostNode hc smokeLinearNode with
  | HostCompose.HostPushNodeResult.ok hc' => some hc'
  | _ => none

/-- mintHost hc id -- mint MULT-1 live token; none on badId / alreadyLive. -/
def mintHost (hc : Host) (id : Nat) : Option Host :=
  match HostCompose.mint hc id with
  | HostCompose.MintResult.ok hc' => some hc'
  | _ => none

/-- linearHostPathReady -- HostCompose Linear exact-once path (SH4 host honesty).
    FAIL-CLOSED checks:
      1) MULT-1 node without mint fails checkFailClosed
      2) mint + MULT-1 checkFailClosed / extractOkFs OK
      3) consume clears live; MULT-1 fails again (LINEAR-EXACT-ONCE)
      4) mint id 0 rejected; double mint rejected
    Greppable: linearHostPathReady, HOST-COMPOSE, LINEAR-EXACT-ONCE, JOIN-ALG. -/
def linearHostPathReady : Bool :=
  match pushLinearHost HostCompose.empty with
  | none => false
  | some hcUnminted =>
    let unmintedFails := !HostCompose.checkFailClosed hcUnminted
    match mintHost hcUnminted smokeMintId with
    | none => false
    | some hcLive =>
      let liveOk :=
        HostCompose.checkFailClosed hcLive
          && HostCompose.extractOkFs hcLive
          && hcLive.linear.live
          && hcLive.linear.id == smokeMintId
      let afterConsumeOk :=
        match HostCompose.consume hcLive with
        | HostCompose.ConsumeResult.ok hcSpent payload =>
            !HostCompose.checkFailClosed hcSpent
              && !hcSpent.linear.live
              && hcSpent.linear.id == 0
              && payload == smokeMintId
        | HostCompose.ConsumeResult.notLive => false
      let badIdOk :=
        match HostCompose.mint HostCompose.empty 0 with
        | HostCompose.MintResult.badId => true
        | _ => false
      let doubleMintOk :=
        match HostCompose.mint hcLive 9 with
        | HostCompose.MintResult.alreadyLive => true
        | _ => false
      unmintedFails && liveOk && afterConsumeOk && badIdOk && doubleMintOk

/-- Kernel surface canary: stage ids + path cites + product API names. -/
def linearSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_KERNEL_LINEAR_V0")
    && (kernelLinearId == "SELF-HOST-KERNEL-LINEAR")
    && (hostKernelLinearId == "HOST-KERNEL-LINEAR")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/KernelLinear.lean")
    && (productLinearApi == "slake_linear_consume")
    && (productConsumeTokenHostId == "CONSUME_TOKEN_HOST_V0")

/-- linearKernelReady -- SH4 Linear kernel bar.
    FAIL-CLOSED: lowerLinearKernel succeeds and programCompileReady holds
    (non-empty well-typed ordered IR) and linearHostPathReady (HostCompose
    mint/consume exact-once) and gradeSurfaceOk (closed Mult surface) and
    surface canary.
    Greppable: linearKernelReady, SELF-HOST-KERNEL-LINEAR, HOST-KERNEL-LINEAR. -/
def linearKernelReady : Bool :=
  match lowerLinearKernel with
  | none => false
  | some p =>
      programCompileReady p
        && linearHostPathReady
        && gradeSurfaceOk
        && linearSurfaceOk

/-- Kind/mult mismatch for LINEAR fails closed (not a Linear kernel node). -/
def linearMismatchRejected : Bool :=
  (Types.mkNode? 0 Mult.mult0 NodeKind.linear).isNone
    && (Types.mkNode? 0 Mult.multOmega NodeKind.linear).isNone

/-- Full SH4 Linear kernel inventory ok. -/
def linearKernelOk : Bool :=
  linearKernelReady && linearMismatchRejected

/- Theorems and KERNEL-LINEAR-SMOKE live in SystemsLean.KernelLinearTheorems
   (same namespace SystemsLean.KernelLinear; long-file split). Parent keeps
   dialect only -- do not import KernelLinearTheorems here (import cycle). -/

end SystemsLean.KernelLinear
"#

end SystemsLean.HostFrontLiveKernelLinear
