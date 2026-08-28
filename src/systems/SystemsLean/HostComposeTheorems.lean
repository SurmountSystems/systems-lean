/-
  SYSTEMS_LEAN_HOST partial -- HostCompose COMPOSE-THEOREM + HOST-SMOKE surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel from SystemsLean.HostCompose: theorems and behavioral smoke
  live here; core Host / LinearHost dialect, mint/consume/markErased,
  pushHostNode/addHostEdge, multPreScan, checkFailClosed, extractOk stay in
  HostCompose. Same namespace SystemsLean.HostCompose so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - COMPOSE-THEOREM / HOST-COMPOSE-THEOREM: empty compose, mint-consume,
    multPreScan MULT-1/MULT-0 gap-close, spent MULT-1 reject, joint mult1+mult0
    multi-node extract (minted+marked success; either-side fail-closed),
    EMIT-BOUNDARY classic/edge reject on non-empty fixtures, markErased
    idempotence, omega-only, push/edge fail-closed + ok.
  - HOST-SMOKE: behavioral examples over push/mint/mark/extract paths.

  Intentional non-claims:
  - Partial HostCompose theorems only -- NOT SpecProof.proofCompleteClaimed.
  - Live-flag model only -- NOT MULT-1 LINEAR-EXACT-ONCE elaborator enforcement.
  - NOT freestanding residual free. NOT PROVABLY. NOT product C residual free.

  Greppable: SYSTEMS_LEAN_HOST, HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-THEOREM,
  HOST-COMPOSE-THEOREM, HOST-SMOKE, multPreScan_empty_true, mint_zero_badId,
  consume_empty_notLive, double_consume_notLive, nodeMultOk_mult1_eq_live,
  checkFailClosed_eq, multPreScan_mult1_unminted_false,
  extractOkFs_mult1_unminted_false, multPreScan_mult1_minted_true,
  consume_mult1_minted, multPreScan_mult1_spent_false,
  extractOkFs_mult1_spent_false, checkFailClosed_mult1_spent_false,
  mult1_spent_scrub, consume_mult1_spent_reject, markErased_idempotent,
  multPreScan_omega_only_true, mint_consume_roundtrip,
  mint_consume_exact_once_sequential, pushHostNode_bad_node,
  pushHostNode_value_one_ok, addHostEdge_empty_badEndpoints,
  addHostEdge_two_values_ok, addHostEdge_one_node_badEndpoints,
  multPreScan_joint_minted_marked_true, extractOkFs_joint_minted_marked_true,
  checkFailClosed_joint_minted_marked_true,
  multPreScan_joint_unminted_marked_false, extractOkFs_joint_unminted_marked_false,
  checkFailClosed_joint_unminted_marked_false,
  multPreScan_joint_minted_unmarked_false, extractOkFs_joint_minted_unmarked_false,
  checkFailClosed_joint_minted_unmarked_false,
  joint_mult1_mult0_extract_ok, joint_mult1_mult0_either_side_fail_closed,
  HostComposeTheorems,
  UNIT_SURFACE host surface. Module: SystemsLean.HostComposeTheorems
  Red/green: just systems-host; lake build SystemsLean.HostComposeTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrGraph
import SystemsLean.IrGraphTheorems
import SystemsLean.Erasure
import SystemsLean.ErasureTheorems
import SystemsLean.Extract
import SystemsLean.HostCompose

namespace SystemsLean.HostCompose

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.Extract (RuntimeClaim)

/-! ### COMPOSE-THEOREM / HOST-COMPOSE-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is empty compose
  multPreScan / mint-consume / RUNTIME-FS extract honesty and nodeMultOk
  contracts only. Does not complete SpecProof; does not claim residual free /
  freestanding product self-host complete / PROVABLY. Live-flag model only --
  does NOT claim MULT-1 LINEAR-EXACT-ONCE elaborator enforcement.
-/

/-- Empty compose mult pre-scan is vacuously true (no live nodes).
    Greppable: multPreScan_empty_true, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem multPreScan_empty_true : multPreScan empty = true := rfl

/-- Empty compose fail-closed bar holds (EMPTY-GRAPH-OK + vacuous multPreScan).
    Greppable: checkFailClosed_empty_true, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_empty_true : checkFailClosed empty = true := rfl

/-- Empty compose extracts under RUNTIME-FS (EMIT-BOUNDARY product path).
    Greppable: extractOkFs_empty_true, RUNTIME-FS, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_empty_true : extractOkFs empty = true := rfl

/-- RUNTIME-CLASSIC rejects even empty compose (EMIT-BOUNDARY).
    Greppable: extractOk_classic_empty_false, RUNTIME-CLASSIC, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOk_classic_empty_false :
    extractOk empty RuntimeClaim.runtimeClassic = false := rfl

/-- EDGE-RUNTIME rejects even empty compose (EMIT-BOUNDARY).
    Greppable: extractOk_edge_empty_false, EDGE-RUNTIME, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOk_edge_empty_false :
    extractOk empty RuntimeClaim.edgeRuntime = false := rfl

/-- extractOk is definitionally freestanding goal and checkFailClosed.
    Greppable: extractOk_eq, COMPOSE-THEOREM. -/
theorem extractOk_eq (hc : Host) (c : RuntimeClaim) :
    extractOk hc c = (Extract.isFreestandingGoal c && checkFailClosed hc) := rfl

/-- extractOkFs is definitionally extractOk under RUNTIME-FS.
    Greppable: extractOkFs_eq, RUNTIME-FS, COMPOSE-THEOREM. -/
theorem extractOkFs_eq (hc : Host) :
    extractOkFs hc = extractOk hc RuntimeClaim.runtimeFs := rfl

/-- mint id 0 is always badId (FAIL-CLOSED; emit-map id==0 reject).
    Greppable: mint_zero_badId, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_zero_badId (hc : Host) : mint hc 0 = MintResult.badId := rfl

/-- consume on empty/unminted host is notLive (FAIL-CLOSED).
    Greppable: consume_empty_notLive, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem consume_empty_notLive : consume empty = ConsumeResult.notLive := rfl

/-- mint id 1 on empty compose succeeds and sets live with that id.
    Greppable: mint_empty_one_ok, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_empty_one_ok :
    mint empty 1 =
      MintResult.ok { empty with linear := { live := true, id := 1 } } := rfl

/-- consume of a minted id-1 host returns payload 1 and clears live (spent scrub).
    Greppable: consume_minted_one, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem consume_minted_one :
    consume { empty with linear := { live := true, id := 1 } } =
      ConsumeResult.ok empty 1 := rfl

/-- mint on already-live host is alreadyLive (no double mint; FAIL-CLOSED).
    Greppable: mint_already_live_one, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_already_live_one :
    mint { empty with linear := { live := true, id := 1 } } 2 =
      MintResult.alreadyLive := rfl

/-- MULT-OMEGA nodes always pass nodeMultOk (no live/mark handle required).
    Greppable: nodeMultOk_omega, MULT-OMEGA, COMPOSE-THEOREM. -/
theorem nodeMultOk_omega (n : IrNode) (hc : Host)
    (h : n.mult = Mult.multOmega) : nodeMultOk n hc = true := by
  unfold nodeMultOk
  rw [h]

/-- MULT-1 nodeMultOk tracks linear.live (closes Extract MULT-1 live gap).
    Greppable: nodeMultOk_mult1_eq_live, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem nodeMultOk_mult1_eq_live (n : IrNode) (hc : Host)
    (h : n.mult = Mult.mult1) : nodeMultOk n hc = hc.linear.live := by
  unfold nodeMultOk
  rw [h]

/-- MULT-0 nodeMultOk tracks isRuntimeAbsent erased (ERASE-NO-RUNTIME).
    Greppable: nodeMultOk_mult0_eq_absent, MULT-0, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem nodeMultOk_mult0_eq_absent (n : IrNode) (hc : Host)
    (h : n.mult = Mult.mult0) :
    nodeMultOk n hc = Erasure.isRuntimeAbsent hc.erased := by
  unfold nodeMultOk
  rw [h]

/-- checkFailClosed is definitionally hostIsWellTyped and multPreScan.
    Greppable: checkFailClosed_eq, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_eq (hc : Host) :
    checkFailClosed hc = (hostIsWellTyped hc && multPreScan hc) := rfl

/-- Double consume: first spend of minted id-1 must succeed (ok empty payload 1),
    then second consume on spent host is notLive. Conjoins consume_minted_one and
    consume_empty_notLive so a broken first-consume path fails the theorem
    (no match escape masking first-arm failure). Live-flag honesty only -- does
    NOT claim elaborator LINEAR-EXACT-ONCE.
    Greppable: double_consume_notLive, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem double_consume_notLive :
    (consume { empty with linear := { live := true, id := 1 } } =
      ConsumeResult.ok empty 1)
      /\ (consume empty = ConsumeResult.notLive) :=
  And.intro consume_minted_one consume_empty_notLive

/-! ### Non-empty multPreScan / extract fixtures (theorem surface, not only smoke)
    Concrete one-node hosts so MULT-1 gap-close / MULT-0 mark claims reduce
    without push match escapes. -/

private def thmLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

private def thmErasedNode : IrNode :=
  { ty := typeTagInit 0, mult := Mult.mult0, kind := NodeKind.erased }

/-- One MULT-1 node, unminted linear host. -/
private def thmHostMult1Unminted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- One MULT-1 node with live token (mint evidence). -/
private def thmHostMult1Minted : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := { live := true, id := 1 }
  erased := Erasure.unmarked
}

/-- One MULT-1 node after spend: live scrubbed false, id scrubbed 0; graph
    still carries the MULT-1 node (net-new vs empty-host consume scrub). -/
private def thmHostMult1Spent : Host := {
  graph := { prog := { nodes := [thmLinearNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- One MULT-0 node without erasure mark. -/
private def thmHostMult0Unmarked : Host := {
  graph := { prog := { nodes := [thmErasedNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- One MULT-0 node with marked erasure (ERASE-NO-RUNTIME). -/
private def thmHostMult0Marked : Host := {
  graph := { prog := { nodes := [thmErasedNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.mark Erasure.unmarked
}

/-- MULT-1 graph node without mint fails multPreScan (closes Extract MULT-1 gap).
    Greppable: multPreScan_mult1_unminted_false, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_mult1_unminted_false :
    multPreScan thmHostMult1Unminted = false := rfl

/-- MULT-1 graph node without mint fails extract under RUNTIME-FS.
    Greppable: extractOkFs_mult1_unminted_false, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_mult1_unminted_false :
    extractOkFs thmHostMult1Unminted = false := rfl

/-- MULT-1 graph node with live token passes multPreScan.
    Greppable: multPreScan_mult1_minted_true, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_mult1_minted_true :
    multPreScan thmHostMult1Minted = true := rfl

/-- MULT-1 graph node with live token extracts under RUNTIME-FS.
    Greppable: extractOkFs_mult1_minted_true, MULT-1, RUNTIME-FS, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_mult1_minted_true :
    extractOkFs thmHostMult1Minted = true := rfl

/-- consume of MULT-1 minted host returns spent host + payload 1 (graph kept;
    live false, id scrubbed 0). Net-new vs empty-host consume_minted_one.
    Greppable: consume_mult1_minted, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem consume_mult1_minted :
    consume thmHostMult1Minted =
      ConsumeResult.ok thmHostMult1Spent 1 := rfl

/-- MULT-1 graph node after spend fails multPreScan (live cleared; node remains).
    Greppable: multPreScan_mult1_spent_false, MULT-1, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_mult1_spent_false :
    multPreScan thmHostMult1Spent = false := rfl

/-- MULT-1 graph node after spend fails extract under RUNTIME-FS.
    Greppable: extractOkFs_mult1_spent_false, MULT-1, RUNTIME-FS, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_mult1_spent_false :
    extractOkFs thmHostMult1Spent = false := rfl

/-- MULT-1 graph node after spend fails checkFailClosed (fail-closed bar).
    Greppable: checkFailClosed_mult1_spent_false, MULT-1, FAIL-CLOSED,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_mult1_spent_false :
    checkFailClosed thmHostMult1Spent = false := rfl

/-- Spent scrub honesty on MULT-1 graph host: live false and id 0 after consume.
    Greppable: mult1_spent_scrub, MULT-1, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mult1_spent_scrub :
    thmHostMult1Spent.linear.live = false
      /\ thmHostMult1Spent.linear.id = 0 :=
  And.intro rfl rfl

/-- Consume minted MULT-1 host: fail-closed reject on spent host + scrub.
    Starts from already-minted fixture (not a mint arm); conjoins consume path,
    multPreScan / extractOkFs / checkFailClosed false, and spent scrub so a
    broken intermediate cannot green alone (And.intro honesty; promotes
    HOST-SMOKE consume-after-mint path then !extractOkFs + scrub). Live-flag
    only -- does NOT claim elaborator LINEAR-EXACT-ONCE.
    Greppable: consume_mult1_spent_reject, MULT-1, FAIL-CLOSED,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem consume_mult1_spent_reject :
    (consume thmHostMult1Minted =
      ConsumeResult.ok thmHostMult1Spent 1)
      /\ (multPreScan thmHostMult1Spent = false)
      /\ (extractOkFs thmHostMult1Spent = false)
      /\ (checkFailClosed thmHostMult1Spent = false)
      /\ (thmHostMult1Spent.linear.live = false)
      /\ (thmHostMult1Spent.linear.id = 0) :=
  And.intro consume_mult1_minted
    (And.intro multPreScan_mult1_spent_false
      (And.intro extractOkFs_mult1_spent_false
        (And.intro checkFailClosed_mult1_spent_false mult1_spent_scrub)))

/-- MULT-0 graph node without mark fails multPreScan (ERASE-NO-RUNTIME).
    Greppable: multPreScan_mult0_unmarked_false, MULT-0, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_mult0_unmarked_false :
    multPreScan thmHostMult0Unmarked = false := rfl

/-- MULT-0 graph node with markErased passes multPreScan.
    Greppable: multPreScan_mult0_marked_true, MULT-0, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_mult0_marked_true :
    multPreScan thmHostMult0Marked = true := rfl

/-- MULT-0 graph node without mark fails extract under RUNTIME-FS.
    Greppable: extractOkFs_mult0_unmarked_false, MULT-0, COMPOSE-THEOREM. -/
theorem extractOkFs_mult0_unmarked_false :
    extractOkFs thmHostMult0Unmarked = false := rfl

/-- MULT-0 graph node with mark extracts under RUNTIME-FS.
    Greppable: extractOkFs_mult0_marked_true, MULT-0, RUNTIME-FS, COMPOSE-THEOREM. -/
theorem extractOkFs_mult0_marked_true :
    extractOkFs thmHostMult0Marked = true := rfl

/-- MULT-1 minted still rejects RUNTIME-CLASSIC (EMIT-BOUNDARY).
    Conjoins extractOkFs true so a broken multPreScan / checkFailClosed path
    fails this theorem (not claim-side false alone; same And.intro honesty as
    double_consume_notLive / mint_consume_roundtrip).
    Greppable: extractOk_classic_mult1_minted_false, RUNTIME-CLASSIC, MULT-1,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOk_classic_mult1_minted_false :
    (extractOkFs thmHostMult1Minted = true)
      /\ (extractOk thmHostMult1Minted RuntimeClaim.runtimeClassic = false) :=
  And.intro extractOkFs_mult1_minted_true rfl

/-- MULT-1 minted still rejects EDGE-RUNTIME (EMIT-BOUNDARY non-empty).
    Conjoins extractOkFs true (hard intermediate; not claim-side alone).
    Greppable: extractOk_edge_mult1_minted_false, EDGE-RUNTIME, MULT-1,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOk_edge_mult1_minted_false :
    (extractOkFs thmHostMult1Minted = true)
      /\ (extractOk thmHostMult1Minted RuntimeClaim.edgeRuntime = false) :=
  And.intro extractOkFs_mult1_minted_true rfl

/-- MULT-0 marked still rejects RUNTIME-CLASSIC (EMIT-BOUNDARY).
    Conjoins extractOkFs true so mult0 mark / checkFailClosed cannot silently
    regress while classic reject stays green.
    Greppable: extractOk_classic_mult0_marked_false, RUNTIME-CLASSIC, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOk_classic_mult0_marked_false :
    (extractOkFs thmHostMult0Marked = true)
      /\ (extractOk thmHostMult0Marked RuntimeClaim.runtimeClassic = false) :=
  And.intro extractOkFs_mult0_marked_true rfl

/-- MULT-0 marked still rejects EDGE-RUNTIME (EMIT-BOUNDARY non-empty).
    Conjoins extractOkFs true (hard intermediate; not claim-side alone).
    Greppable: extractOk_edge_mult0_marked_false, EDGE-RUNTIME, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOk_edge_mult0_marked_false :
    (extractOkFs thmHostMult0Marked = true)
      /\ (extractOk thmHostMult0Marked RuntimeClaim.edgeRuntime = false) :=
  And.intro extractOkFs_mult0_marked_true rfl

/-! ### Joint MULT-1 + MULT-0 multi-node extract (net-new vs single-grade)
    Host carries both a MULT-1 graph node and a MULT-0 graph node. Success needs
    mint AND mark together; either-side fail-closed when unminted (MULT-1) or
    unmarked (MULT-0). Net-new vs mult1_spent / mult0_marked families alone and
    vs EmitPlan/EmitBody linear_and_erased inventory alone (those inventory counts;
    these prove multPreScan / extractOkFs / checkFailClosed on the joint host). -/

/-- Joint graph node list: MULT-1 then MULT-0 (shared by joint fixtures). -/
private def thmJointNodes : List IrNode := [thmLinearNode, thmErasedNode]

/-- Joint host: minted MULT-1 + marked MULT-0 (joint success path). -/
private def thmHostJointMintedMarked : Host := {
  graph := { prog := { nodes := thmJointNodes }, edges := [] }
  linear := { live := true, id := 1 }
  erased := Erasure.mark Erasure.unmarked
}

/-- Joint host: unminted MULT-1 + marked MULT-0 (MULT-1 side fail-closed). -/
private def thmHostJointUnmintedMarked : Host := {
  graph := { prog := { nodes := thmJointNodes }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.mark Erasure.unmarked
}

/-- Joint host: minted MULT-1 + unmarked MULT-0 (MULT-0 side fail-closed). -/
private def thmHostJointMintedUnmarked : Host := {
  graph := { prog := { nodes := thmJointNodes }, edges := [] }
  linear := { live := true, id := 1 }
  erased := Erasure.unmarked
}

/-- Joint MULT-1 minted + MULT-0 marked passes multPreScan.
    Greppable: multPreScan_joint_minted_marked_true, MULT-1, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem multPreScan_joint_minted_marked_true :
    multPreScan thmHostJointMintedMarked = true := rfl

/-- Joint MULT-1 minted + MULT-0 marked extracts under RUNTIME-FS.
    Greppable: extractOkFs_joint_minted_marked_true, MULT-1, MULT-0, RUNTIME-FS,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_joint_minted_marked_true :
    extractOkFs thmHostJointMintedMarked = true := rfl

/-- Joint MULT-1 minted + MULT-0 marked passes checkFailClosed.
    Greppable: checkFailClosed_joint_minted_marked_true, MULT-1, MULT-0,
    FAIL-CLOSED, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_joint_minted_marked_true :
    checkFailClosed thmHostJointMintedMarked = true := rfl

/-- Joint unminted MULT-1 + marked MULT-0 fails multPreScan (MULT-1 side).
    Greppable: multPreScan_joint_unminted_marked_false, MULT-1, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem multPreScan_joint_unminted_marked_false :
    multPreScan thmHostJointUnmintedMarked = false := rfl

/-- Joint unminted MULT-1 + marked MULT-0 fails extract under RUNTIME-FS.
    Greppable: extractOkFs_joint_unminted_marked_false, MULT-1, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_joint_unminted_marked_false :
    extractOkFs thmHostJointUnmintedMarked = false := rfl

/-- Joint unminted MULT-1 + marked MULT-0 fails checkFailClosed.
    Greppable: checkFailClosed_joint_unminted_marked_false, MULT-1, MULT-0,
    FAIL-CLOSED, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_joint_unminted_marked_false :
    checkFailClosed thmHostJointUnmintedMarked = false := rfl

/-- Joint minted MULT-1 + unmarked MULT-0 fails multPreScan (MULT-0 side).
    Greppable: multPreScan_joint_minted_unmarked_false, MULT-1, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem multPreScan_joint_minted_unmarked_false :
    multPreScan thmHostJointMintedUnmarked = false := rfl

/-- Joint minted MULT-1 + unmarked MULT-0 fails extract under RUNTIME-FS.
    Greppable: extractOkFs_joint_minted_unmarked_false, MULT-1, MULT-0,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_joint_minted_unmarked_false :
    extractOkFs thmHostJointMintedUnmarked = false := rfl

/-- Joint minted MULT-1 + unmarked MULT-0 fails checkFailClosed.
    Greppable: checkFailClosed_joint_minted_unmarked_false, MULT-1, MULT-0,
    FAIL-CLOSED, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem checkFailClosed_joint_minted_unmarked_false :
    checkFailClosed thmHostJointMintedUnmarked = false := rfl

/-- Joint success: minted MULT-1 + marked MULT-0 conjoins multPreScan /
    extractOkFs / checkFailClosed true (no single-surface green alone).
    Greppable: joint_mult1_mult0_extract_ok, MULT-1, MULT-0, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem joint_mult1_mult0_extract_ok :
    (multPreScan thmHostJointMintedMarked = true)
      /\ (extractOkFs thmHostJointMintedMarked = true)
      /\ (checkFailClosed thmHostJointMintedMarked = true) :=
  And.intro multPreScan_joint_minted_marked_true
    (And.intro extractOkFs_joint_minted_marked_true
      checkFailClosed_joint_minted_marked_true)

/-- Either-side fail-closed on joint host: unminted+marked fails AND
    minted+unmarked fails on multPreScan / extractOkFs / checkFailClosed.
    Conjoins both sides so a broken single-grade path cannot green alone.
    Greppable: joint_mult1_mult0_either_side_fail_closed, MULT-1, MULT-0,
    FAIL-CLOSED, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem joint_mult1_mult0_either_side_fail_closed :
    (multPreScan thmHostJointUnmintedMarked = false)
      /\ (extractOkFs thmHostJointUnmintedMarked = false)
      /\ (checkFailClosed thmHostJointUnmintedMarked = false)
      /\ (multPreScan thmHostJointMintedUnmarked = false)
      /\ (extractOkFs thmHostJointMintedUnmarked = false)
      /\ (checkFailClosed thmHostJointMintedUnmarked = false) :=
  And.intro multPreScan_joint_unminted_marked_false
    (And.intro extractOkFs_joint_unminted_marked_false
      (And.intro checkFailClosed_joint_unminted_marked_false
        (And.intro multPreScan_joint_minted_unmarked_false
          (And.intro extractOkFs_joint_minted_unmarked_false
            checkFailClosed_joint_minted_unmarked_false))))

/-! ### Algebraic / fail-closed deepen (beyond empty canaries)
    mark idempotence, MULT-OMEGA-only pre-scan, mint-consume payload honesty. -/

private def thmValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

/-- One MULT-OMEGA value node, unminted/unmarked (no live handle required). -/
private def thmHostOmegaOnly : Host := {
  graph := { prog := { nodes := [thmValueNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- markErased is idempotent (ERASE-NO-RUNTIME mark twice equals mark once).
    Greppable: markErased_idempotent, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem markErased_idempotent (hc : Host) :
    markErased (markErased hc) = markErased hc := by
  unfold markErased
  rw [Erasure.mark_idempotent]

/-- MULT-OMEGA-only graph passes multPreScan without mint or mark.
    Greppable: multPreScan_omega_only_true, MULT-OMEGA, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem multPreScan_omega_only_true :
    multPreScan thmHostOmegaOnly = true := rfl

/-- MULT-OMEGA-only graph extracts under RUNTIME-FS without mint or mark.
    Greppable: extractOkFs_omega_only_true, MULT-OMEGA, RUNTIME-FS,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem extractOkFs_omega_only_true :
    extractOkFs thmHostOmegaOnly = true := rfl

/-- Live host with any id yields consume payload equal to that id (spent scrub).
    Greppable: consume_live_payload, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem consume_live_payload (id : Nat) :
    consume { empty with linear := { live := true, id := id } } =
      ConsumeResult.ok empty id := rfl

/-- mint nonempty id on empty compose succeeds with that live id.
    Greppable: mint_nonzero_ok, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_nonzero_ok (id : Nat) (h : Not (id = 0)) :
    mint empty id =
      MintResult.ok { empty with linear := { live := true, id := id } } := by
  unfold mint
  rw [if_neg h]
  rfl

/-- mint then consume payload honesty for nonzero id (live-flag only).
    Conjoins mint_nonzero_ok and consume_live_payload so a broken mint path
    fails the theorem (no match escape masking first-arm failure; same pattern
    as double_consume_notLive).
    Greppable: mint_consume_roundtrip, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_consume_roundtrip (id : Nat) (h : Not (id = 0)) :
    (mint empty id =
      MintResult.ok { empty with linear := { live := true, id := id } })
      /\ (consume { empty with linear := { live := true, id := id } } =
           ConsumeResult.ok empty id) :=
  And.intro (mint_nonzero_ok id h) (consume_live_payload id)

/-- Sequential exact-once: mint then consume once clears live and second consume
    is notLive (HostCompose live-flag model of LINEAR-EXACT-ONCE). Does NOT claim
    elaborator MULT-1 on SystemsLean.Linear.Token axioms.
    Greppable: mint_consume_exact_once_sequential, LINEAR-EXACT-ONCE, MULT-1,
    COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem mint_consume_exact_once_sequential :
    (match mint empty 7 with
     | MintResult.ok hc =>
       match consume hc with
       | ConsumeResult.ok hc' p =>
         (p == 7) && (!hc'.linear.live) &&
           (match consume hc' with
            | ConsumeResult.notLive => true
            | ConsumeResult.ok _ _ => false)
       | ConsumeResult.notLive => false
     | MintResult.badId => false
     | MintResult.alreadyLive => false) = true := by decide

/-! ### pushHostNode / addHostEdge fail-closed + ok (beyond mint-consume)
    Hand-built fixtures so push/edge match escapes are not required. -/

/-- Kind/mult mismatch (VALUE with MULT-1) is not well-typed. -/
private def thmBadNode : IrNode :=
  { ty := typeTagInit 9, mult := Mult.mult1, kind := NodeKind.value }

/-- One MULT-OMEGA value node host (graph only; unminted linear). -/
private def thmHostOneValue : Host := {
  graph := { prog := { nodes := [thmValueNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- Two MULT-OMEGA value nodes, no edges. -/
private def thmHostTwoValues : Host := {
  graph := {
    prog := { nodes := [thmValueNode, thmValueNode] }
    edges := []
  }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- pushHostNode fails closed on a bad (kind/mult mismatch) node.
    Greppable: pushHostNode_bad_node, FAIL-CLOSED, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem pushHostNode_bad_node :
    pushHostNode empty thmBadNode = HostPushNodeResult.badNode := rfl

/-- pushHostNode empty with well-typed VALUE yields one-node host.
    Greppable: pushHostNode_value_one_ok, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem pushHostNode_value_one_ok :
    pushHostNode empty thmValueNode = HostPushNodeResult.ok thmHostOneValue := rfl

/-- addHostEdge on empty compose fails closed (no valid endpoints).
    Greppable: addHostEdge_empty_badEndpoints, FAIL-CLOSED, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem addHostEdge_empty_badEndpoints (fromIdx toIdx : Nat) :
    addHostEdge empty fromIdx toIdx = HostAddEdgeResult.badEndpoints := by
  unfold addHostEdge
  have h :
      IrGraph.addEdge empty.graph fromIdx toIdx =
        IrGraph.AddEdgeResult.badEndpoints :=
    IrGraph.addEdge_empty_badEndpoints fromIdx toIdx
  rw [h]

/-- addHostEdge 0->1 on two-value host succeeds.
    Greppable: addHostEdge_two_values_ok, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM. -/
theorem addHostEdge_two_values_ok :
    addHostEdge thmHostTwoValues 0 1 =
      HostAddEdgeResult.ok {
        graph := {
          prog := thmHostTwoValues.graph.prog
          edges := [{ fromIdx := 0, toIdx := 1 }]
        }
        linear := LinearHost.empty
        erased := Erasure.unmarked
      } := rfl

/-- addHostEdge out-of-range on one-node host fails closed.
    Greppable: addHostEdge_one_node_badEndpoints, FAIL-CLOSED, COMPOSE-THEOREM,
    HOST-COMPOSE-THEOREM. -/
theorem addHostEdge_one_node_badEndpoints :
    addHostEdge thmHostOneValue 0 1 = HostAddEdgeResult.badEndpoints := by
  unfold addHostEdge
  have h :
      IrGraph.addEdge thmHostOneValue.graph 0 1 =
        IrGraph.AddEdgeResult.badEndpoints := by
    -- Hand-built one-node length-1 fixture; prove graph addEdge badEndpoints
    -- then rewrite match (IrGraph.addEdge_one_node_badEndpoints is private-fixture
    -- and not reused here -- empty path reuses IrGraph theorem instead).
    unfold IrGraph.addEdge
    rw [if_neg (by decide :
        Not (thmHostOneValue.graph.edges.length >= IrGraph.edgeMax))]
    have hends :
        IrGraph.edgeEndpointsOk { fromIdx := 0, toIdx := 1 }
          (IrProgram.length thmHostOneValue.graph.prog) = false := by
      simp [IrGraph.edgeEndpointsOk, thmHostOneValue, IrProgram.length]
    simp [hends]
  rw [h]

/-! ### Host smoke (behavioral; lake build fails if an example does not hold)
    Greppable: HOST-SMOKE. Exercises MULT-1 live, MULT-0 mark, empty OK, FS reject. -/

private def smokeLinearNode : IrNode := thmLinearNode

private def smokeErasedNode : IrNode := thmErasedNode

private def smokeValueNode : IrNode :=
  { ty := typeTagInit 2, mult := Mult.multOmega, kind := NodeKind.value }

private def smokePush (hc : Host) (n : IrNode) : Host :=
  match pushHostNode hc n with
  | HostPushNodeResult.ok hc' => hc'
  | _ => hc

private def smokeMint (hc : Host) (id : Nat) : Host :=
  match mint hc id with
  | MintResult.ok hc' => hc'
  | _ => hc

/-- HOST-SMOKE: empty compose extract under RUNTIME-FS is OK. -/
example : extractOkFs empty = true := by decide

/-- HOST-SMOKE: MULT-1 node without mint fails extract. -/
example : extractOkFs (smokePush empty smokeLinearNode) = false := by decide

/-- HOST-SMOKE: MULT-1 node with mint extracts OK. -/
example : extractOkFs (smokeMint (smokePush empty smokeLinearNode) 7) = true := by decide

/-- HOST-SMOKE: MULT-0 node without mark fails extract. -/
example : extractOkFs (smokePush empty smokeErasedNode) = false := by decide

/-- HOST-SMOKE: MULT-0 node with markErased extracts OK. -/
example : extractOkFs (markErased (smokePush empty smokeErasedNode)) = true := by decide

/-- HOST-SMOKE: MULT-OMEGA-only extract under FS without mint/mark. -/
example : extractOkFs (smokePush empty smokeValueNode) = true := by decide

/-- HOST-SMOKE: RUNTIME-CLASSIC reject even on empty compose. -/
example : extractOk empty RuntimeClaim.runtimeClassic = false := by decide

/-- HOST-SMOKE: mint then consume then MULT-1 extract fails (live cleared);
    spent scrub sets id to 0 while returning payload (emit-map honesty). -/
example :
    (match consume (smokeMint (smokePush empty smokeLinearNode) 3) with
     | ConsumeResult.ok hc' payload =>
         !extractOkFs hc' && !hc'.linear.live && hc'.linear.id == 0 && payload == 3
     | ConsumeResult.notLive => false) = true := by decide

/-- HOST-SMOKE: mint id 0 is badId. -/
example :
    (match mint empty 0 with
     | MintResult.badId => true
     | _ => false) = true := by decide

/-- HOST-SMOKE: multPreScan / nodeMultOk on MULT-1 path. -/
example : multPreScan (smokePush empty smokeLinearNode) = false := by decide
example : multPreScan (smokeMint (smokePush empty smokeLinearNode) 1) = true := by decide


end SystemsLean.HostCompose
