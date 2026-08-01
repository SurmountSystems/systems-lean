/-
  SYSTEMS_LEAN_HOST partial -- SelfHost SELF-HOST-THEOREM + HOST-SELF-HOST-THEOREM
  + SELF-HOST-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.SelfHost: theorems and behavioral smoke live
  here; stage ids, hostSurfaceOk, Verdict, selfHost*Ready bars stay in SelfHost.
  Same namespace SystemsLean.SelfHost so theorem names stay unqualified under
  that namespace.

  Spec (readable):
  - SELF-HOST-THEOREM / HOST-SELF-HOST-THEOREM: hostSurfaceOk_true / stageId_eq /
    hostSelfHostId_eq / selfHostUnitReady_empty_true /
    selfHostProgramReady_empty_false / selfHostReady_eq_selfHostUnitReady /
    empty_host_ok_ne_empty_program_ok / selfHostUnitReady_mult1_unminted_false /
    selfHostUnitReady_mult1_minted_true / selfHostProgramReady_single_value.
  - SELF-HOST-SMOKE: stage / path / empty host OK / empty program fail-closed /
    MULT-1 mint path / sibling bars not conflated (lake build fails if example
    fails).

  These SelfHost theorems do NOT set SpecProof.proofCompleteClaimed true.
  Direction readiness canaries != freestanding product self-host complete.

  Intentional non-claims:
  - Host surface + join-informed readiness canaries only -- NOT freestanding
    residual free. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM,
  SELF-HOST-SMOKE, stageId_eq, hostSelfHostId_eq, hostSurfaceOk_true,
  selfHostReady_eq_selfHostUnitReady, selfHostUnitReady_empty_true,
  selfHostProgramReady_empty_false, empty_host_ok_ne_empty_program_ok,
  selfHostUnitReady_mult1_unminted_false, selfHostUnitReady_mult1_minted_true,
  selfHostProgramReady_single_value, SelfHostTheorems, UNIT_SURFACE host surface,
  EMPTY-PROGRAM-FAIL-CLOSED, FAIL-CLOSED, MULT-1, HOST-JOIN-MAP, HOST-COMPILE-PATH.
  Module: SystemsLean.SelfHostTheorems
  Red/green: just systems-host; lake build SystemsLean.SelfHostTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.Erasure
import SystemsLean.HostCompose
import SystemsLean.JoinMap
import SystemsLean.SelfHost

namespace SystemsLean.SelfHost

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-! ### SELF-HOST-THEOREM / HOST-SELF-HOST-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is host surface
  canaries, empty-host unit readiness, and empty-program fail-closed only. Does
  not complete SpecProof; does not claim residual free / freestanding product
  self-host complete / PROVABLY / llvm unlock.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_V0.
    Greppable: stageId_eq, SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_V0" := rfl

/-- Host alias id is greppable HOST-SELF-HOST.
    Greppable: hostSelfHostId_eq, SELF-HOST-THEOREM. -/
theorem hostSelfHostId_eq : hostSelfHostId = "HOST-SELF-HOST" := rfl

/-- Package / stage-id surface canary holds.
    Greppable: hostSurfaceOk_true, SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM. -/
theorem hostSurfaceOk_true : hostSurfaceOk = true := by decide

/-- selfHostReady is definitionally selfHostUnitReady.
    Greppable: selfHostReady_eq_selfHostUnitReady, SELF-HOST-THEOREM. -/
theorem selfHostReady_eq_selfHostUnitReady (hc : Host) :
    selfHostReady hc = selfHostUnitReady hc := rfl

/-- Empty HostCompose is self-host unit-ready (join + surface).
    Greppable: selfHostUnitReady_empty_true, SELF-HOST-THEOREM,
    HOST-SELF-HOST-THEOREM. -/
theorem selfHostUnitReady_empty_true :
    selfHostUnitReady HostCompose.empty = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED on self-host program bar.
    Greppable: selfHostProgramReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM. -/
theorem selfHostProgramReady_empty_false :
    selfHostProgramReady IrProgram.empty = false := by decide

/-- Honesty: empty host self-host unit OK is not empty program self-host OK.
    Greppable: empty_host_ok_ne_empty_program_ok, SELF-HOST-THEOREM,
    HOST-SELF-HOST-THEOREM. -/
theorem empty_host_ok_ne_empty_program_ok :
    (selfHostUnitReady HostCompose.empty = true)
      /\ (selfHostProgramReady IrProgram.empty = false) :=
  And.intro selfHostUnitReady_empty_true selfHostProgramReady_empty_false

/-! ### Non-empty path fixtures (beyond empty host vs empty program canaries)
    JoinMap / CompilePath sibling pattern: MULT-1 mint + single-value program. -/

private def thmValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def thmLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

private def thmSingleValueProg : Program := { nodes := [thmValueNode] }

private def thmHostMult1Unminted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := HostCompose.LinearHost.empty
  erased := Erasure.unmarked
}

private def thmHostMult1Minted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := { live := true, id := 4 }
  erased := Erasure.unmarked
}

/-- MULT-1 host without mint fails self-host unit-ready (join unit fail-closed).
    Greppable: selfHostUnitReady_mult1_unminted_false, MULT-1,
    SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM. -/
theorem selfHostUnitReady_mult1_unminted_false :
    selfHostUnitReady thmHostMult1Unminted = false := by decide

/-- MULT-1 host with mint is self-host unit-ready (join unit + host surface).
    Greppable: selfHostUnitReady_mult1_minted_true, MULT-1,
    SELF-HOST-THEOREM, HOST-SELF-HOST-THEOREM. -/
theorem selfHostUnitReady_mult1_minted_true :
    selfHostUnitReady thmHostMult1Minted = true := by decide

/-- One well-typed VALUE node is self-host program-ready (sibling of empty fail).
    Greppable: selfHostProgramReady_single_value, SELF-HOST-THEOREM,
    HOST-SELF-HOST-THEOREM. -/
theorem selfHostProgramReady_single_value :
    selfHostProgramReady thmSingleValueProg = true := by decide

/-! ### Self-host smoke (behavioral; lake build fails if an example does not hold)
    Greppable: SELF-HOST-SMOKE. Exercises surface canary, empty host OK,
    empty program fail-closed, MULT-1 mint path, sibling bars not conflated. -/

private def smokeLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

private def smokeErasedNode : IrNode :=
  { ty := typeTagInit 0, mult := Mult.mult0, kind := NodeKind.erased }

private def smokeValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def smokePush (hc : Host) (n : IrNode) : Host :=
  match HostCompose.pushHostNode hc n with
  | HostCompose.HostPushNodeResult.ok hc' => hc'
  | _ => hc

private def smokeMint (hc : Host) (id : Nat) : Host :=
  match HostCompose.mint hc id with
  | HostCompose.MintResult.ok hc' => hc'
  | _ => hc

private def smokePushProg (p : Program) (n : IrNode) : Program :=
  match IrProgram.push p n with
  | IrProgram.PushResult.ok p' => p'
  | _ => p

/-- SELF-HOST-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_SELF_HOST_V0" := by decide
example : hostSelfHostId = "HOST-SELF-HOST" := by decide
example : selfHostId = "SELF-HOST" := by decide

/-- SELF-HOST-SMOKE: package / module path cites match host layout (surface). -/
example : packageRootPath = "src/systems/SystemsLean.lean" := by decide
example : hostModulePath = "src/systems/SystemsLean/SelfHost.lean" := by decide
example : hostSurfaceOk = true := by decide

/-- SELF-HOST-SMOKE: empty HostCompose is self-host unit-ready (join + surface). -/
example : selfHostReady HostCompose.empty = true := by decide
example : selfHostUnitReady HostCompose.empty = true := by decide
example :
    (let v := verdictOf HostCompose.empty
     v.ok && v.joinReady && v.unitReady && v.hostSurface) = true := by decide

/-- SELF-HOST-SMOKE: empty ordered program is NOT self-host program-ready.
    Sibling bar: empty host OK != empty program OK (P3 residual lesson). -/
example : selfHostProgramReady IrProgram.empty = false := by decide

/-- SELF-HOST-SMOKE: MULT-OMEGA-only host is self-host unit-ready without mint. -/
example :
    selfHostUnitReady (smokePush HostCompose.empty smokeValueNode) = true := by
  decide

/-- SELF-HOST-SMOKE: MULT-1 without mint fails self-host unit-ready (multPreScan). -/
example :
    selfHostReady (smokePush HostCompose.empty smokeLinearNode) = false := by
  decide
example :
    (let v := verdictOf (smokePush HostCompose.empty smokeLinearNode)
     !v.ok && v.joinReady && !v.unitReady && v.hostSurface) = true := by decide

/-- SELF-HOST-SMOKE: MULT-1 with mint is self-host unit-ready. -/
example :
    selfHostUnitReady
      (smokeMint (smokePush HostCompose.empty smokeLinearNode) 4) = true := by
  decide

/-- SELF-HOST-SMOKE: MULT-0 without mark fails; with markErased ok. -/
example :
    selfHostReady (smokePush HostCompose.empty smokeErasedNode) = false := by
  decide
example :
    selfHostReady
      (HostCompose.markErased (smokePush HostCompose.empty smokeErasedNode))
      = true := by decide

/-- SELF-HOST-SMOKE: well-typed non-empty program is self-host program-ready. -/
example :
    (let p := smokePushProg IrProgram.empty smokeValueNode
     selfHostProgramReady p) = true := by decide

/-- SELF-HOST-SMOKE: failClosed verdict is not ok. -/
example : Verdict.failClosed.ok = false := by decide

/-- SELF-HOST-SMOKE: unit bar does not imply program bar on empty program
    (sibling APIs; do not conflate). -/
example :
    (selfHostUnitReady HostCompose.empty
      && !selfHostProgramReady IrProgram.empty) = true := by decide

/-- SELF-HOST-SMOKE: self-host unit bar matches join unit bar under host surface. -/
example :
    (selfHostUnitReady HostCompose.empty
      = JoinMap.joinUnitCompileReady HostCompose.empty) = true := by decide

end SystemsLean.SelfHost
