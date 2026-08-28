/-
  SYSTEMS_LEAN_HOST partial -- JoinMap JOIN-MAP-THEOREM + JOIN-MAP-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.JoinMap: theorems and behavioral smoke live
  here; stage ids, dual path cites, host use pins, joinAlgContractOk, Verdict,
  and join*Ready bars stay in JoinMap. Same namespace SystemsLean.JoinMap so
  theorem names stay unqualified under that namespace.

  Spec (readable):
  - JOIN-MAP-THEOREM / HOST-JOIN-MAP-THEOREM: stageId_eq / hostJoinMapId_eq /
    joinAlgUseOk_true / joinAlgContractOk_true /
    joinCompileReady_eq_joinUnitCompileReady / joinUnitCompileReady_empty_true /
    joinProgramCompileReady_empty_false / empty_host_ok_ne_empty_program_ok /
    joinUnitCompileReady_eq / joinProgramCompileReady_eq /
    joinUnitCompileReady_mult1_unminted_false /
    joinUnitCompileReady_mult1_minted_true / joinProgramCompileReady_single_value.
  - Dual formal map edges (partial; not isomorphism complete):
    failClosedGradeHostUseOk_true /
    failClosedGrade_host_use_implies_mult_unknown_reject (product edge:
    FailClosedGrade host use + Mult FAIL-CLOSED-UNKNOWN-GRADE reject);
    runtimeExtractHostUseOk_true /
    runtimeExtract_host_use_implies_unknown_runtime_reject (product edge:
    RuntimeExtract host use + Extract unknown runtime tag reject).
  - JOIN-MAP-SMOKE: stage / dual-cite / host-use / empty host OK / empty program
    fail-closed / MULT-1 mint / MULT-0 mark / sibling bar behavioral examples
    (lake build fails if example fails).

  These JoinMap theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial path contracts != full dual-bridge isomorphism != residual free.

  Intentional non-claims:
  - Join surface canaries only -- NOT freestanding residual free.
  - NOT formal dual-bridge theorems. NOT PROVABLY. NOT llvm unlock.
  - NOT proof complete. NOT freestanding product residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM,
  JOIN-MAP-SMOKE, stageId_eq, hostJoinMapId_eq, joinAlgUseOk_true,
  joinAlgContractOk_true, joinCompileReady_eq_joinUnitCompileReady,
  joinUnitCompileReady_empty_true, joinProgramCompileReady_empty_false,
  empty_host_ok_ne_empty_program_ok, joinUnitCompileReady_eq,
  joinProgramCompileReady_eq, joinUnitCompileReady_mult1_unminted_false,
  joinUnitCompileReady_mult1_minted_true, joinProgramCompileReady_single_value,
  JoinMapTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.JoinMapTheorems
  Red/green: just systems-host; lake build SystemsLean.JoinMapTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.MultTheorems
import SystemsLean.Linear
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.Erasure
import SystemsLean.Extract
import SystemsLean.ExtractTheorems
import SystemsLean.HostCompose
import SystemsLean.CompilePath
import SystemsLean.JoinMap

namespace SystemsLean.JoinMap

open SystemsLean.Mult (Mult ofNat? isValidTag ofNat?_fail_closed isValidTag_fail_closed)
open SystemsLean.Extract (ofRuntimeTag? isValidRuntimeTag ofRuntimeTag?_fail_closed
  isValidRuntimeTag_fail_closed)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.HostCompose (Host)

/-! ### JOIN-MAP-THEOREM / HOST-JOIN-MAP-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is join surface
  canaries, host use pins, empty-host unit readiness, and empty-program
  fail-closed only. Does not complete SpecProof; does not claim residual free /
  formal dual-bridge theorems / freestanding product self-host complete /
  PROVABLY.
-/

/-- Primary stage id is greppable SLAKE_JOIN_MAP_V0.
    Greppable: stageId_eq, JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_JOIN_MAP_V0" := rfl

/-- Host alias id is greppable HOST-JOIN-MAP.
    Greppable: hostJoinMapId_eq, JOIN-MAP-THEOREM. -/
theorem hostJoinMapId_eq : hostJoinMapId = "HOST-JOIN-MAP" := rfl

/-- Host use pins for six JOIN-ALG dual algorithms hold
    (ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade,
    LinearPairSwap, RuntimeExtract).
    Greppable: joinAlgUseOk_true, JOIN-ALG-USE, JOIN-MAP-THEOREM,
    HOST-JOIN-MAP-THEOREM, failClosedGradeHostUseOk, runtimeExtractHostUseOk. -/
theorem joinAlgUseOk_true : joinAlgUseOk = true := by decide

/-- JOIN-ALG dual-cite + host-use surface canary holds.
    Greppable: joinAlgContractOk_true, JOIN-ALG, JOIN-MAP-THEOREM,
    HOST-JOIN-MAP-THEOREM. -/
theorem joinAlgContractOk_true : joinAlgContractOk = true := by decide

/-- FailClosedGrade dual host use pin holds.
    Greppable: failClosedGradeHostUseOk_true, FailClosedGrade, JOIN-MAP-THEOREM. -/
theorem failClosedGradeHostUseOk_true : failClosedGradeHostUseOk = true := by decide

/-- Dual formal map edge (product honesty): FailClosedGrade host use implies
    Mult unknown-tag reject (FAIL-CLOSED-UNKNOWN-GRADE).
    Uses Mult.ofNat?_fail_closed / isValidTag_fail_closed for n = 3.
    Partial formal dual-map only -- not isomorphism complete, not full bridge.
    Greppable: failClosedGrade_host_use_implies_mult_unknown_reject,
    dualFormalMapFailClosedEdge, FAIL-CLOSED-UNKNOWN-GRADE, FailClosedGrade. -/
theorem failClosedGrade_host_use_implies_mult_unknown_reject :
    failClosedGradeHostUseOk = true
      /\ ofNat? 3 = none
      /\ isValidTag 3 = false :=
  And.intro failClosedGradeHostUseOk_true
    (And.intro
      (ofNat?_fail_closed 3 (by decide : 2 < 3))
      (isValidTag_fail_closed 3 (by decide : 2 < 3)))

/-- Greppable alias id for the dual formal map FailClosedGrade edge (partial). -/
def dualFormalMapFailClosedEdge : String :=
  "failClosedGrade_host_use_implies_mult_unknown_reject"

/-- RuntimeExtract dual host use pin holds.
    Greppable: runtimeExtractHostUseOk_true, RuntimeExtract, JOIN-MAP-THEOREM. -/
theorem runtimeExtractHostUseOk_true : runtimeExtractHostUseOk = true := by decide

/-- Dual formal map edge (product honesty): RuntimeExtract host use implies
    Extract unknown runtime-tag reject (FAIL-CLOSED unknown runtime).
    Uses ofRuntimeTag?_fail_closed / isValidRuntimeTag_fail_closed for n = 3.
    Second formal dual-map edge -- still not isomorphism complete, not full bridge.
    Greppable: runtimeExtract_host_use_implies_unknown_runtime_reject,
    dualFormalMapRuntimeExtractEdge, RuntimeExtract, RUNTIME-FS. -/
theorem runtimeExtract_host_use_implies_unknown_runtime_reject :
    runtimeExtractHostUseOk = true
      /\ ofRuntimeTag? 3 = none
      /\ isValidRuntimeTag 3 = false :=
  And.intro runtimeExtractHostUseOk_true
    (And.intro
      (ofRuntimeTag?_fail_closed 3 (by decide : 2 < 3))
      (isValidRuntimeTag_fail_closed 3 (by decide : 2 < 3)))

/-- Greppable alias id for the dual formal map RuntimeExtract edge (partial). -/
def dualFormalMapRuntimeExtractEdge : String :=
  "runtimeExtract_host_use_implies_unknown_runtime_reject"

/-- joinCompileReady is definitionally joinUnitCompileReady.
    Greppable: joinCompileReady_eq_joinUnitCompileReady, JOIN-MAP-THEOREM. -/
theorem joinCompileReady_eq_joinUnitCompileReady (hc : Host) :
    joinCompileReady hc = joinUnitCompileReady hc := rfl

/-- Empty HostCompose is join-unit-ready (unit bar + join surface).
    Greppable: joinUnitCompileReady_empty_true, JOIN-MAP-THEOREM,
    HOST-JOIN-MAP-THEOREM. -/
theorem joinUnitCompileReady_empty_true :
    joinUnitCompileReady HostCompose.empty = true := by decide

/-- EMPTY-PROGRAM-FAIL-CLOSED on join program bar.
    Greppable: joinProgramCompileReady_empty_false, EMPTY-PROGRAM-FAIL-CLOSED,
    JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM. -/
theorem joinProgramCompileReady_empty_false :
    joinProgramCompileReady IrProgram.empty = false := by decide

/-- Honesty: empty host join-unit OK is not empty program join-program OK.
    Greppable: empty_host_ok_ne_empty_program_ok, JOIN-MAP-THEOREM,
    HOST-JOIN-MAP-THEOREM. -/
theorem empty_host_ok_ne_empty_program_ok :
    (joinUnitCompileReady HostCompose.empty = true)
      /\ (joinProgramCompileReady IrProgram.empty = false) :=
  And.intro joinUnitCompileReady_empty_true joinProgramCompileReady_empty_false

/-- joinUnitCompileReady is definitionally unitCompileReady && joinAlgContractOk.
    Greppable: joinUnitCompileReady_eq, JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM. -/
theorem joinUnitCompileReady_eq (hc : Host) :
    joinUnitCompileReady hc =
      (CompilePath.unitCompileReady hc && joinAlgContractOk) := rfl

/-- joinProgramCompileReady is definitionally programCompileReady && joinAlgContractOk.
    Greppable: joinProgramCompileReady_eq, JOIN-MAP-THEOREM. -/
theorem joinProgramCompileReady_eq (p : Program) :
    joinProgramCompileReady p =
      (CompilePath.programCompileReady p && joinAlgContractOk) := rfl

/-! ### Non-empty path contracts (beyond empty host vs empty program canaries) -/

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

/-- MULT-1 host without mint fails join-unit-ready (unit bar fail-closed).
    Greppable: joinUnitCompileReady_mult1_unminted_false, MULT-1,
    JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM. -/
theorem joinUnitCompileReady_mult1_unminted_false :
    joinUnitCompileReady thmHostMult1Unminted = false := by decide

/-- MULT-1 host with mint is join-unit-ready (unit bar + join surface).
    Greppable: joinUnitCompileReady_mult1_minted_true, MULT-1,
    JOIN-MAP-THEOREM, HOST-JOIN-MAP-THEOREM. -/
theorem joinUnitCompileReady_mult1_minted_true :
    joinUnitCompileReady thmHostMult1Minted = true := by decide

/-- One well-typed VALUE node is join-program-ready (sibling of empty fail).
    Greppable: joinProgramCompileReady_single_value, JOIN-MAP-THEOREM,
    HOST-JOIN-MAP-THEOREM. -/
theorem joinProgramCompileReady_single_value :
    joinProgramCompileReady thmSingleValueProg = true := by decide

/-! ### Join-map smoke (behavioral; lake build fails if an example does not hold)
    Greppable: JOIN-MAP-SMOKE. Exercises dual-cite surface, host use pins,
    empty host OK, empty program fail-closed, MULT-1 mint path, sibling bars. -/

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

/-- JOIN-MAP-SMOKE: stage / map ids are greppable honesty strings. -/
example : stageId = "SLAKE_JOIN_MAP_V0" := by decide
example : hostJoinMapId = "HOST-JOIN-MAP" := by decide
example : joinMapId = "JOIN-MAP" := by decide
example : joinAlgId = "JOIN-ALG" := by decide
example : joinAlgUseId = "JOIN-ALG-USE" := by decide
example : consumeTokenAlgId = "ConsumeToken" := by decide
example : erasedIndexAlgId = "ErasedIndex" := by decide
example : unrestrictedShareAlgId = "UnrestrictedShare" := by decide
example : failClosedGradeAlgId = "FailClosedGrade" := by decide

/-- JOIN-MAP-SMOKE: six dual path cites match dual-pair layout (inventory). -/
example : dualConsumeTokenIdris = "src/idris2/examples/ConsumeToken.idr" := by decide
example : dualConsumeTokenLean = "src/lean4/examples/ConsumeToken.lean" := by decide
example : dualErasedIndexIdris = "src/idris2/examples/ErasedIndex.idr" := by decide
example : dualErasedIndexLean = "src/lean4/examples/ErasedIndex.lean" := by decide
example : dualUnrestrictedShareIdris = "src/idris2/examples/UnrestrictedShare.idr" :=
  by decide
example : dualUnrestrictedShareLean = "src/lean4/examples/UnrestrictedShare.lean" :=
  by decide
example : dualFailClosedGradeIdris = "src/idris2/examples/FailClosedGrade.idr" :=
  by decide
example : dualFailClosedGradeLean = "src/lean4/examples/FailClosedGrade.lean" :=
  by decide
example : dualIdrisPath = "src/idris2/examples/ConsumeToken.idr" := by decide
example : dualLeanPath = "src/lean4/examples/ConsumeToken.lean" := by decide
example : joinLinearCiteOk = true := by decide
example : joinDualCiteOk = true := by decide

/-- JOIN-MAP-SMOKE: host use pins (use vs dual-cite distinction; six duals). -/
example : consumeTokenHostUseOk = true := by decide
example : erasedIndexHostUseOk = true := by decide
example : unrestrictedShareHostUseOk = true := by decide
example : failClosedGradeHostUseOk = true := by decide
example : linearPairSwapHostUseOk = true := by decide
example : runtimeExtractHostUseOk = true := by decide
example : joinAlgUseOk = true := by decide
example : joinAlgContractOk = true := by decide
example : hostMintConsumeOnceOk = true := by decide
example : Mult.name Mult.multOmega = "MULT-OMEGA" := by decide
example : Erasure.isRuntimeAbsent Erasure.unmarked = false := by decide
example : productConsumeTokenMintApi = "slake_consume_token_mint" := by decide
example : productErasureRuntimeAbsentApi = "slake_erasure_is_runtime_absent" :=
  by decide
example : productMultOmegaGrade = "MULT-OMEGA" := by decide
example : productFailClosedUnknownGradeId = "FAIL-CLOSED-UNKNOWN-GRADE" := by decide
example : dualFormalMapRuntimeExtractEdge
    = "runtimeExtract_host_use_implies_unknown_runtime_reject" := by decide

/-- JOIN-MAP-SMOKE: empty HostCompose is join-unit-ready (unit bar + join). -/
example : joinCompileReady HostCompose.empty = true := by decide
example : joinUnitCompileReady HostCompose.empty = true := by decide
example :
    (let v := verdictOf HostCompose.empty
     v.ok && v.joinOk && v.unitReady) = true := by decide

/-- JOIN-MAP-SMOKE: empty ordered program is NOT join-program-ready.
    Sibling bar: empty host OK != empty program OK (P3 residual lesson). -/
example : joinProgramCompileReady IrProgram.empty = false := by decide

/-- JOIN-MAP-SMOKE: MULT-OMEGA-only host is join-unit-ready without mint. -/
example :
    joinUnitCompileReady (smokePush HostCompose.empty smokeValueNode) = true := by
  decide

/-- JOIN-MAP-SMOKE: MULT-1 without mint fails join-unit-ready (multPreScan). -/
example :
    joinCompileReady (smokePush HostCompose.empty smokeLinearNode) = false := by
  decide
example :
    (let v := verdictOf (smokePush HostCompose.empty smokeLinearNode)
     !v.ok && v.joinOk && !v.unitReady) = true := by decide

/-- JOIN-MAP-SMOKE: MULT-1 with mint is join-unit-ready. -/
example :
    joinUnitCompileReady
      (smokeMint (smokePush HostCompose.empty smokeLinearNode) 4) = true := by
  decide

/-- JOIN-MAP-SMOKE: MULT-0 without mark fails; with markErased ok. -/
example :
    joinCompileReady (smokePush HostCompose.empty smokeErasedNode) = false := by
  decide
example :
    joinCompileReady
      (HostCompose.markErased (smokePush HostCompose.empty smokeErasedNode))
      = true := by decide

/-- JOIN-MAP-SMOKE: well-typed non-empty program is join-program-ready. -/
example :
    (let p := smokePushProg IrProgram.empty smokeValueNode
     joinProgramCompileReady p) = true := by decide

/-- JOIN-MAP-SMOKE: failClosed verdict is not ok. -/
example : Verdict.failClosed.ok = false := by decide

/-- JOIN-MAP-SMOKE: unit bar does not imply program bar on empty program
    (sibling APIs; do not conflate). -/
example :
    (joinUnitCompileReady HostCompose.empty
      && !joinProgramCompileReady IrProgram.empty) = true := by decide

end SystemsLean.JoinMap
