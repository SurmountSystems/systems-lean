/-
  SYSTEMS_LEAN_HOST partial -- HostCost HOST-COST-THEOREM L1-L9 surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostCost: theorems live here; cost defs,
  HostCostTokenState, cost table, and surface Bools stay in HostCost.
  Same namespace SystemsLean.HostCost so theorem names stay unqualified
  under that namespace.

  Spec (readable):
  - HOST-COST-THEOREM L1-L9: unit / empty / fuse, fixed cap, extract fuse,
    mint-consume automaton refs, fail-closed opt preserve, no-heap token
    fields, differential fuse, joint mult table, RuntimeBenchLean step twin.
  - Nat steps are structural host-model counts. NOT nanoseconds. NOT cycles.
  - NOT PROVABLY speed. NOT freestanding residual free. NOT GC-in-ELF theorem.

  Intentional non-claims:
  - Partial HostCost theorems only -- NOT SpecProof.proofCompleteClaimed.
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not wall-clock or cycle-count theorems (those are just bench-runtime).
  - Not "no GC in the binary" / not ELF / ldd as Lean theorem (L6 model only).
  - Not FullHost / mathlib invent. Not dual-ok harness invent.
  - Wave 2: costMultPreScan_eq_live_nodes / costCheckFailClosed_eq_live_nodes;
    hostCost_spent_mult1_rejects_check / hostCost_spent_mult1_rejects_extractFs
    (spent fixture is an instance); hostCost_omega_share_vs_mult1_exact_once
    (HostCost contrast, not Token LinearCheck);
    hostCost_thin_extract_mult1_agrees_compose (thin Extract + compose reject).
  - Single-walk Nat: costCheckFailClosed n = costMultPreScan n (Name 9 C).
    costCheckFailClosed_eq_live_nodes is live-node count, not 1 + n.

  Greppable: SYSTEMS_LEAN_HOST, HOST-COST, HOST-COST-THEOREM, HOST-COST-CAP,
  HOST-COST-FUSE, HOST-COST-AUTOMATON, HOST-COST-OPT-PRESERVE, HOST-COST-NO-HEAP,
  HOST-COST-DIFF-FUSE, HOST-COST-MULT-TABLE, HOST-COST-STEP-TWIN,
  costMintConsumeSequential_eq, costMultPreScan_zero, costMultPreScan_one,
  costCheckFailClosed_empty, costExtractOkFs_eq, costExtractOkFs_ge_check,
  costExtractOkFs_eq_check_plus_one, costMultPreScanAtCap_eq,
  costMultPreScan_le_atCap, costCheckFailClosed_le_atCap,
  costEdgeWalk, costEdgeWalkAtCap, costEdgeWalk_le_atCap,
  costMintConsumeExactOnceAutomaton, hostCost_exact_once_sequential_ref,
  hostCost_double_consume_notLive_ref, costFused_le_naive,
  hostCost_fuse_preserves_fail_closed,
  hostCost_opt_preserves_spent_mult1_reject_ref,
  hostCost_opt_preserves_double_consume_ref,
  hostCost_linearHost_fields_bool_nat, hostCostNoHeapModelOk_true,
  costDoubleCheckPath_eq, costFuseNatSavings_eq, cost_diff_fuse_vs_double,
  costNodeMultByGrade_eq_one, costJointMultTableOk_true,
  costStepTwinMintConsume_eq, hostCostSurfaceOk_true,
  costMultPreScan_eq_live_nodes, hostCost_spent_mult1_rejects_check,
  hostCost_spent_mult1_rejects_extractFs,
  hostCost_omega_share_vs_mult1_exact_once,
  hostCost_thin_extract_mult1_agrees_compose,
  HOST-COST-SINGLE-WALK, SINGLE_FAIL_CLOSED_WALK, HOST_COMPOSE_SINGLE_WALK,
  costCheckFailClosed_eq_pre_scan, costFused_le_naive_plus_goal,
  HostCostTheorems,
  UNIT_SURFACE host surface. Module: SystemsLean.HostCostTheorems
  Red/green: just systems-host; lake build SystemsLean.HostCostTheorems.
  Module must stay ASCII. Sub-1-KLOC.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostCost
import SystemsLean.HostCompose
import SystemsLean.HostComposeTheorems
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.Extract
import SystemsLean.ExtractTheorems
import SystemsLean.LinearTheorems
import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.Erasure

namespace SystemsLean.HostCost

open SystemsLean.IrProgram (programCap)
open SystemsLean.IrGraph (edgeMax)
open SystemsLean.HostCompose (Host LinearHost extractOk checkFailClosed extractOkFs empty mint consume)
open SystemsLean.HostCompose (MintResult ConsumeResult nodeMultOk multPreScan)
open SystemsLean.HostCompose (nodeMultOk_mult1_eq_live)
open SystemsLean.Extract (RuntimeClaim isFreestandingGoal)
open SystemsLean.Erasure (Erased)
open SystemsLean.Linear (shareNat shareNat_reuse)
open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)

/-! ### HOST-COST-THEOREM L1 (unit / empty / fuse base) -/

/-- Mint then consume sequential path is two unit steps.
    Greppable: costMintConsumeSequential_eq, HOST-COST-THEOREM. -/
theorem costMintConsumeSequential_eq : costMintConsumeSequential = 2 := rfl

/-- Empty mult pre-scan costs zero node looks.
    Greppable: costMultPreScan_zero, HOST-COST-THEOREM. -/
theorem costMultPreScan_zero : costMultPreScan 0 = 0 := rfl

/-- One-node mult pre-scan costs one node look.
    Greppable: costMultPreScan_one, HOST-COST-THEOREM. -/
theorem costMultPreScan_one : costMultPreScan 1 = 1 := rfl

/-- Empty-compose checkFailClosed is zero node looks (one live walk of 0).
    Name 9 C: not a leftover well-typed unit. Greppable:
    costCheckFailClosed_empty, HOST-COST-THEOREM, FAIL-CLOSED,
    HOST-COST-SINGLE-WALK. -/
theorem costCheckFailClosed_empty : costCheckFailClosed 0 = 0 := rfl

/-- Definitional: check Nat is the one live walk (not well-typed + scan).
    Greppable: costCheckFailClosed_eq_pre_scan, HOST-COST-SINGLE-WALK,
    SINGLE_FAIL_CLOSED_WALK. -/
theorem costCheckFailClosed_eq_pre_scan (n : Nat) :
    costCheckFailClosed n = costMultPreScan n := rfl

/-- extractOkFs cost is definitionally goal step + check cost.
    Greppable: costExtractOkFs_eq, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractOkFs_eq (n : Nat) :
    costExtractOkFs n = costFreestandingGoal + costCheckFailClosed n := rfl

/-- Extract-under-FS step count is at least checkFailClosed step count.
    Greppable: costExtractOkFs_ge_check, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractOkFs_ge_check (n : Nat) :
    costCheckFailClosed n <= costExtractOkFs n := by
  simp [costExtractOkFs, costFreestandingGoal, Nat.le_add_left]

/-! ### HOST-COST-THEOREM L2 Fixed cap complexity
    Scans over live nodes/edges are O(n)/O(e) with n <= programCap (8) and
    e <= edgeMax (16) by construction. Nat bounds only; not freestanding ns/op. -/

/-- Mult pre-scan at programCap equals 8 (cap honesty / SLAKE_IR_PROGRAM_CAP).
    Greppable: costMultPreScanAtCap_eq, programCap, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costMultPreScanAtCap_eq : costMultPreScanAtCap = 8 := by
  simp [costMultPreScanAtCap, costMultPreScan, costNodeMultOk, programCap]

/-- checkFailClosed at programCap is 8 (one live walk at cap).
    Greppable: costCheckFailClosedAtCap_eq, HOST-COST-THEOREM, HOST-COST-CAP,
    HOST-COST-SINGLE-WALK. -/
theorem costCheckFailClosedAtCap_eq : costCheckFailClosedAtCap = 8 := by
  simp [costCheckFailClosedAtCap, costCheckFailClosed,
    costMultPreScan, costNodeMultOk, programCap]

/-- extractOkFs at programCap is freestanding-goal + check at cap (1 + 8).
    Greppable: costExtractOkFsAtCap_eq, HOST-COST-THEOREM, HOST-COST-CAP, HOST-COST-FUSE. -/
theorem costExtractOkFsAtCap_eq : costExtractOkFsAtCap = 9 := by
  simp [costExtractOkFsAtCap, costExtractOkFs, costFreestandingGoal,
    costCheckFailClosed, costMultPreScan, costNodeMultOk, programCap]

/-- Program cap cite is 8.
    Greppable: hostCostProgramCap_eq, programCap, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem hostCostProgramCap_eq : hostCostProgramCap = 8 := by
  simp [hostCostProgramCap, programCap]

/-- Edge max cite is 16 (SLAKE_IR_EDGE_MAX map).
    Greppable: hostCostEdgeMax_eq, edgeMax, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem hostCostEdgeMax_eq : hostCostEdgeMax = 16 := by
  simp [hostCostEdgeMax, edgeMax]

/-- Edge walk at edgeMax equals 16.
    Greppable: costEdgeWalkAtCap_eq, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costEdgeWalkAtCap_eq : costEdgeWalkAtCap = 16 := by
  simp [costEdgeWalkAtCap, costEdgeWalk, costEdgeLook, edgeMax]

/-- check + edge walk at both caps is 8 + 16.
    Greppable: costCheckAndEdgeWalkAtCap_eq, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costCheckAndEdgeWalkAtCap_eq : costCheckAndEdgeWalkAtCap = 24 := by
  simp [costCheckAndEdgeWalkAtCap, costCheckFailClosedAtCap, costEdgeWalkAtCap,
    costCheckFailClosed, costMultPreScan, costNodeMultOk,
    costEdgeWalk, costEdgeLook, programCap, edgeMax]

/-- Mult pre-scan cost is bounded by programCap when n is within capacity.
    Greppable: costMultPreScan_le_atCap, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costMultPreScan_le_atCap (n : Nat) (h : n <= programCap) :
    costMultPreScan n <= costMultPreScanAtCap := by
  simpa [costMultPreScanAtCap, costMultPreScan, costNodeMultOk] using h

/-- checkFailClosed cost is bounded by programCap when n is within capacity.
    Greppable: costCheckFailClosed_le_atCap, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costCheckFailClosed_le_atCap (n : Nat) (h : n <= programCap) :
    costCheckFailClosed n <= costCheckFailClosedAtCap := by
  simp only [costCheckFailClosedAtCap, costCheckFailClosed,
    costMultPreScan, costNodeMultOk, Nat.mul_one]
  exact h

/-- extractOkFs cost is bounded by programCap when n is within capacity.
    Greppable: costExtractOkFs_le_atCap, HOST-COST-THEOREM, HOST-COST-CAP, HOST-COST-FUSE. -/
theorem costExtractOkFs_le_atCap (n : Nat) (h : n <= programCap) :
    costExtractOkFs n <= costExtractOkFsAtCap := by
  simp only [costExtractOkFsAtCap, costExtractOkFs, costFreestandingGoal,
    costCheckFailClosed, costMultPreScan, costNodeMultOk, Nat.mul_one]
  exact Nat.add_le_add_left h 1

/-- Edge-walk cost is bounded by edgeMax when e is within capacity.
    Greppable: costEdgeWalk_le_atCap, HOST-COST-THEOREM, HOST-COST-CAP. -/
theorem costEdgeWalk_le_atCap (e : Nat) (h : e <= edgeMax) :
    costEdgeWalk e <= costEdgeWalkAtCap := by
  simpa [costEdgeWalkAtCap, costEdgeWalk, costEdgeLook] using h

/-! ### HOST-COST-THEOREM L3 Extract fuse cost
    Under freestanding goal, HostCompose extractOk reuses checkFailClosed
    definitionally (no second mult pre-scan algebra). Nat: extract = check + 1.
    Supports later E2 fuse opt honesty; not emit wire fuse; not wall-clock. -/

/-- Extract fuse delta is one freestanding-goal step.
    Greppable: costExtractFuseDelta_eq, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractFuseDelta_eq : costExtractFuseDelta = 1 := rfl

/-- extract = check + 1 under FS cost model (fuse shape, no second n-node scan).
    Greppable: costExtractOkFs_eq_check_plus_one, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractOkFs_eq_check_plus_one (n : Nat) :
    costExtractOkFs n = costCheckFailClosed n + 1 := by
  simp [costExtractOkFs, costFreestandingGoal, Nat.add_comm]

/-- extract = check + fuse delta (named form of check + 1).
    Greppable: costExtractOkFs_fuse_shape, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractOkFs_fuse_shape (n : Nat) :
    costExtractOkFs n = costCheckFailClosed n + costExtractFuseDelta := by
  simp [costExtractOkFs, costFreestandingGoal, costExtractFuseDelta, Nat.add_comm]

/-- Differential: extract Nat steps minus check is exactly the fuse delta.
    Greppable: costExtractOkFs_sub_check, HOST-COST-THEOREM, HOST-COST-FUSE. -/
theorem costExtractOkFs_sub_check (n : Nat) :
    costExtractOkFs n - costCheckFailClosed n = 1 := by
  simp [costExtractOkFs, costFreestandingGoal]

/-- HostCompose definitional fuse: extractOk is FS-goal and checkFailClosed.
    Cost interpretation: no independent second multPreScan in the host model.
    Greppable: hostCost_extractOk_def_fuse, HOST-COST-THEOREM, HOST-COST-FUSE,
    extractOk, checkFailClosed. -/
theorem hostCost_extractOk_def_fuse (hc : Host) (claim : RuntimeClaim) :
    extractOk hc claim = (isFreestandingGoal claim && checkFailClosed hc) := rfl

/-- Product extract under RUNTIME-FS reuses checkFailClosed (FS claim true).
    Greppable: hostCost_extractOkFs_eq_check, HOST-COST-THEOREM, HOST-COST-FUSE,
    extractOkFs. -/
theorem hostCost_extractOkFs_eq_check (hc : Host) :
    extractOkFs hc = checkFailClosed hc := by
  simp [extractOkFs, extractOk, isFreestandingGoal]

/-! ### HOST-COST-THEOREM L4 Mint consume automaton
    Link HostCompose exact-once state machine to HostCost Nat steps.
    Live once, spend once, second spend fails closed -- cost-relevant automaton.
    NOT a GC-in-ELF theorem. NOT elaborator MULT-1 enforcement on Linear.Token. -/

/-- Exact-once automaton is three unit steps (mint, consume ok, consume notLive).
    Greppable: costMintConsumeExactOnceAutomaton_eq, HOST-COST-THEOREM,
    HOST-COST-AUTOMATON. -/
theorem costMintConsumeExactOnceAutomaton_eq :
    costMintConsumeExactOnceAutomaton = 3 := rfl

/-- Success prefix (mint+consume) is at most the full exact-once automaton cost.
    Greppable: costMintConsumeSequential_le_automaton, HOST-COST-THEOREM,
    HOST-COST-AUTOMATON. -/
theorem costMintConsumeSequential_le_automaton :
    costMintConsumeSequential <= costMintConsumeExactOnceAutomaton := by
  simp [costMintConsumeSequential, costMintConsumeExactOnceAutomaton,
    costMintStep, costConsumeStep]

/-- Success path is two of the three automaton steps (prefix equality).
    Greppable: costMintConsumeSequential_eq_prefix, HOST-COST-THEOREM,
    HOST-COST-AUTOMATON. -/
theorem costMintConsumeSequential_eq_prefix :
    costMintConsumeSequential =
      costMintStep + costConsumeStep := rfl

/-- Reject step after spend is one consume attempt (second consume notLive).
    Greppable: costConsumeRejectStep_eq, HOST-COST-THEOREM, HOST-COST-AUTOMATON. -/
theorem costConsumeRejectStep_eq : costConsumeStep = 1 := rfl

/-- Re-export: HostCompose mint_consume_exact_once_sequential holds.
    Cost-relevant state machine on host Bool/Nat fields; not GC-in-ELF.
    Greppable: hostCost_exact_once_sequential_ref, HOST-COST-AUTOMATON,
    mint_consume_exact_once_sequential, LINEAR-EXACT-ONCE, HOST-COST-THEOREM. -/
theorem hostCost_exact_once_sequential_ref :
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
     | MintResult.alreadyLive => false) = true :=
  HostCompose.mint_consume_exact_once_sequential

/-- Re-export: HostCompose double_consume_notLive (first ok, second notLive).
    Greppable: hostCost_double_consume_notLive_ref, HOST-COST-AUTOMATON,
    double_consume_notLive, HOST-COST-THEOREM. -/
theorem hostCost_double_consume_notLive_ref :
    (consume { empty with linear := { live := true, id := 1 } } =
      ConsumeResult.ok empty 1)
      /\ (consume empty = ConsumeResult.notLive) :=
  HostCompose.double_consume_notLive

/-- hostCostAutomatonOk holds by construction.
    Greppable: hostCostAutomatonOk_true, HOST-COST-THEOREM, HOST-COST-AUTOMATON. -/
theorem hostCostAutomatonOk_true : hostCostAutomatonOk = true := by native_decide

/-! ### HOST-COST-THEOREM L5 Fail-closed opt preserve
    Cost-reducing rewrite (extract fuse / single check+extract) must not open
    fail-closed bars. Fused path still equals checkFailClosed under FS; spent
    MULT-1 and double-consume still reject. Supports E2 honesty without wall-clock. -/

/-- Fused path cost is at most naive double-check when there is a live walk.
    Empty: fuse pays the freestanding-goal step; two empty walks cost 0.
    Greppable: costFused_le_naive, HOST-COST-THEOREM, HOST-COST-OPT-PRESERVE. -/
theorem costFused_le_naive (n : Nat) (h : 1 <= n) :
    costFusedCheckExtract n <= costNaiveDoubleCheck n := by
  simp only [costFusedCheckExtract, costNaiveDoubleCheck, costExtractOkFs,
    costFreestandingGoal, costCheckFailClosed, costMultPreScan, costNodeMultOk]
  -- fused = 1 + n; naive = n + n
  omega

/-- Slack form: fuse never exceeds naive plus the freestanding-goal step.
    Holds at empty. Greppable: costFused_le_naive_plus_goal, HOST-COST-OPT-PRESERVE. -/
theorem costFused_le_naive_plus_goal (n : Nat) :
    costFusedCheckExtract n <= costNaiveDoubleCheck n + costFreestandingGoal := by
  simp only [costFusedCheckExtract, costNaiveDoubleCheck, costExtractOkFs,
    costFreestandingGoal, costCheckFailClosed, costMultPreScan, costNodeMultOk]
  omega

/-- Definitional fuse preserves the fail-closed predicate (extractOkFs = check).
    Cost rewrite does not change acceptance. Greppable:
    hostCost_fuse_preserves_fail_closed, HOST-COST-OPT-PRESERVE, FAIL-CLOSED. -/
theorem hostCost_fuse_preserves_fail_closed (hc : Host) :
    extractOkFs hc = checkFailClosed hc :=
  hostCost_extractOkFs_eq_check hc

/-- If checkFailClosed rejects, fused extractOkFs rejects (opt cannot open bar).
    Greppable: hostCost_fuse_preserves_reject, HOST-COST-OPT-PRESERVE, FAIL-CLOSED. -/
theorem hostCost_fuse_preserves_reject (hc : Host)
    (h : checkFailClosed hc = false) : extractOkFs hc = false := by
  rw [hostCost_extractOkFs_eq_check, h]

/-- Local MULT-1 node for spent-host opt-preserve fixture (HostCost-owned).
    Greppable: hostCostLinearNode, HOST-COST-OPT-PRESERVE, MULT-1. -/
private def hostCostLinearNode : IrNode :=
  { ty := typeTagInit 1, mult := Mult.mult1, kind := NodeKind.linear }

/-- Spent MULT-1 host: graph keeps MULT-1 node; linear scrubbed (not live).
    Greppable: hostCostSpentMult1, HOST-COST-OPT-PRESERVE, MULT-1, FAIL-CLOSED. -/
private def hostCostSpentMult1 : Host := {
  graph := { prog := { nodes := [hostCostLinearNode] }, edges := [] }
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- Spent MULT-1 fails checkFailClosed (ill mult / no live token).
    Greppable: hostCost_opt_preserves_spent_check, HOST-COST-OPT-PRESERVE,
    FAIL-CLOSED, MULT-1. -/
theorem hostCost_opt_preserves_spent_check :
    checkFailClosed hostCostSpentMult1 = false := by native_decide

/-- Spent MULT-1 fails fused extractOkFs (opt preserve: fuse still rejects).
    Greppable: hostCost_opt_preserves_spent_mult1_reject, HOST-COST-OPT-PRESERVE,
    FAIL-CLOSED, MULT-1, extractOkFs. -/
theorem hostCost_opt_preserves_spent_mult1_reject :
    extractOkFs hostCostSpentMult1 = false := by native_decide

/-- Re-export: double-consume still rejects (opt does not revive spent token).
    Greppable: hostCost_opt_preserves_double_consume_ref, HOST-COST-OPT-PRESERVE,
    double_consume_notLive, HOST-COST-AUTOMATON. -/
theorem hostCost_opt_preserves_double_consume_ref :
    (consume { empty with linear := { live := true, id := 1 } } =
      ConsumeResult.ok empty 1)
      /\ (consume empty = ConsumeResult.notLive) :=
  hostCost_double_consume_notLive_ref

/-- hostCostOptPreserveOk holds by construction.
    Greppable: hostCostOptPreserveOk_true, HOST-COST-THEOREM, HOST-COST-OPT-PRESERVE. -/
theorem hostCostOptPreserveOk_true : hostCostOptPreserveOk = true := by native_decide

/-! ### HOST-COST-THEOREM L6 No-heap host machine
    Honest model: linear token state is Bool + Nat fields only.
    No heap allocator, no ByteArray, no String in the host token model.
    NOT an ELF / ldd / "no GC in binary" proof. Structural model only. -/

/-- LinearHost reconstructs from its Bool and Nat fields only (no heap).
    Greppable: hostCost_linearHost_fields_bool_nat, HOST-COST-THEOREM,
    HOST-COST-NO-HEAP. -/
theorem hostCost_linearHost_fields_bool_nat (lh : LinearHost) :
    lh = { live := lh.live, id := lh.id } := rfl

/-- Projection preserves live and id.
    Greppable: hostCostTokenFromLinear_eq, HOST-COST-THEOREM, HOST-COST-NO-HEAP. -/
theorem hostCostTokenFromLinear_eq (lh : LinearHost) :
    hostCostTokenFromLinear lh = { live := lh.live, id := lh.id } := rfl

/-- Empty LinearHost maps to empty token state.
    Greppable: hostCostTokenFromLinear_empty, HOST-COST-THEOREM, HOST-COST-NO-HEAP. -/
theorem hostCostTokenFromLinear_empty :
    hostCostTokenFromLinear LinearHost.empty = hostCostTokenStateEmpty := rfl

/-- hostCostNoHeapModelOk holds by construction.
    Greppable: hostCostNoHeapModelOk_true, HOST-COST-THEOREM, HOST-COST-NO-HEAP. -/
theorem hostCostNoHeapModelOk_true : hostCostNoHeapModelOk = true := by native_decide

/-! ### HOST-COST-THEOREM L7 Differential fuse model
    Single check+extract (fused) vs double-check (naive) as Nat relation.
    Aligns with costExtractOkFs_eq_check_plus_one; supports E2 emit fuse honesty.
    Not emit wire fuse; not wall-clock. -/

/-- Double-check path is definitionally twice check.
    Greppable: costDoubleCheckPath_eq, HOST-COST-THEOREM, HOST-COST-DIFF-FUSE. -/
theorem costDoubleCheckPath_eq (n : Nat) :
    costDoubleCheckPath n = 2 * costCheckFailClosed n := rfl

/-- Single path equals check + 1 (reuse L3 fuse equality).
    Greppable: costSingleCheckExtractPath_eq_check_plus_one, HOST-COST-THEOREM,
    HOST-COST-DIFF-FUSE, HOST-COST-FUSE. -/
theorem costSingleCheckExtractPath_eq_check_plus_one (n : Nat) :
    costSingleCheckExtractPath n = costCheckFailClosed n + 1 :=
  costExtractOkFs_eq_check_plus_one n

/-- Fuse savings equals n - 1 (one-walk check minus the goal step).
    Greppable: costFuseNatSavings_eq, HOST-COST-THEOREM, HOST-COST-DIFF-FUSE. -/
theorem costFuseNatSavings_eq (n : Nat) : costFuseNatSavings n = n - 1 := by
  simp [costFuseNatSavings, costCheckFailClosed, costMultPreScan, costNodeMultOk]

/-- Differential: double-check = single fused path + fuse savings when n >= 1.
    2*n = (1+n) + (n-1). Empty: fuse pays the goal step; two empty walks cost 0.
    Greppable: cost_diff_fuse_vs_double, HOST-COST-THEOREM, HOST-COST-DIFF-FUSE. -/
theorem cost_diff_fuse_vs_double (n : Nat) (h : 1 <= n) :
    costDoubleCheckPath n =
      costSingleCheckExtractPath n + costFuseNatSavings n := by
  simp only [costDoubleCheckPath, costSingleCheckExtractPath, costFuseNatSavings,
    costExtractOkFs, costFreestandingGoal, costCheckFailClosed,
    costMultPreScan, costNodeMultOk]
  -- 2 * n = (1 + n) + (n - 1)
  omega

/-- Naive double-check alias equals differential double-check path.
    Greppable: costNaiveDoubleCheck_eq_double, HOST-COST-THEOREM, HOST-COST-DIFF-FUSE. -/
theorem costNaiveDoubleCheck_eq_double (n : Nat) :
    costNaiveDoubleCheck n = costDoubleCheckPath n := by
  simp only [costNaiveDoubleCheck, costDoubleCheckPath]
  omega

/-- hostCostDiffFuseOk holds by construction.
    Greppable: hostCostDiffFuseOk_true, HOST-COST-THEOREM, HOST-COST-DIFF-FUSE. -/
theorem hostCostDiffFuseOk_true : hostCostDiffFuseOk = true := by native_decide

/-! ### HOST-COST-THEOREM L8 Joint mult cost table
    Per-node multPreScan look costs for MULT-0 / MULT-1 / MULT-OMEGA.
    Each grade costs one structural node look; grades differ in which host
    field is inspected (erasure / live / constant), not Nat step count.
    No grades beyond 0/1/omega. -/

/-- Every freestanding grade costs one node look.
    Greppable: costNodeMultByGrade_eq_one, HOST-COST-THEOREM, HOST-COST-MULT-TABLE. -/
theorem costNodeMultByGrade_eq_one (m : Mult) : costNodeMultByGrade m = 1 := by
  cases m <;> rfl

/-- MULT-0 table entry is 1.
    Greppable: costNodeMult0_eq, HOST-COST-THEOREM, HOST-COST-MULT-TABLE, MULT-0. -/
theorem costNodeMult0_eq : costNodeMult0 = 1 := rfl

/-- MULT-1 table entry is 1.
    Greppable: costNodeMult1_eq, HOST-COST-THEOREM, HOST-COST-MULT-TABLE, MULT-1. -/
theorem costNodeMult1_eq : costNodeMult1 = 1 := rfl

/-- MULT-OMEGA table entry is 1.
    Greppable: costNodeMultOmega_eq, HOST-COST-THEOREM, HOST-COST-MULT-TABLE,
    MULT-OMEGA. -/
theorem costNodeMultOmega_eq : costNodeMultOmega = 1 := rfl

/-- Homogeneous multPreScan: n nodes cost n looks regardless of grade mix.
    Greppable: costMultPreScan_eq_node_looks, HOST-COST-THEOREM, HOST-COST-MULT-TABLE. -/
theorem costMultPreScan_eq_node_looks (n : Nat) :
    costMultPreScan n = n * costNodeMultOk := rfl

/-- costJointMultTableOk holds by construction.
    Greppable: costJointMultTableOk_true, HOST-COST-THEOREM, HOST-COST-MULT-TABLE. -/
theorem costJointMultTableOk_true : costJointMultTableOk = true := by native_decide

/-! ### HOST-COST-THEOREM L9 RuntimeBenchLean step twin
    Protocol step counts aligned with RuntimeBenchLean mint/consume arm.
    Each managed-runtime op twins costMintConsumeSequential (2 Nat steps).
    Companion arm documents the same protocol; not freestanding speed proof.
    Greppable: HOST-COST-STEP-TWIN (defs also in RuntimeBenchLean). -/

/-- One op twin is two unit steps.
    Greppable: costStepTwinMintConsume_eq, HOST-COST-THEOREM, HOST-COST-STEP-TWIN. -/
theorem costStepTwinMintConsume_eq : costStepTwinMintConsume = 2 := rfl

/-- Total twin scales linearly with op count.
    Greppable: costStepTwinTotal_eq, HOST-COST-THEOREM, HOST-COST-STEP-TWIN. -/
theorem costStepTwinTotal_eq (n : Nat) : costStepTwinTotal n = n * 2 := by
  simp [costStepTwinTotal, costStepTwinMintConsume, costMintConsumeSequential,
    costMintStep, costConsumeStep]

/-- Zero ops cost zero structural steps.
    Greppable: costStepTwinTotal_zero, HOST-COST-THEOREM, HOST-COST-STEP-TWIN. -/
theorem costStepTwinTotal_zero : costStepTwinTotal 0 = 0 := rfl

/-- hostCostStepTwinOk holds by construction.
    Greppable: hostCostStepTwinOk_true, HOST-COST-THEOREM, HOST-COST-STEP-TWIN. -/
theorem hostCostStepTwinOk_true : hostCostStepTwinOk = true := by native_decide

/-- hostCostSurfaceOk holds by construction.
    Greppable: hostCostSurfaceOk_true, HOST-COST-THEOREM. -/
theorem hostCostSurfaceOk_true : hostCostSurfaceOk = true := by native_decide

/-! ### HOST-COST-THEOREM Wave 2
    Live-node scan cost, universal spent MULT-1 reject, omega-vs-exact-once
    contrast, thin Extract vs compose honesty. Structural Nat / Bool only.
    NOT nanoseconds. NOT PROVABLY speed. NOT Token LinearCheck. -/

/-- Mult pre-scan Nat cost equals the live node list length (not abstract n only).
    Greppable: costMultPreScan_eq_live_nodes, HOST-COST-THEOREM. Not wall-clock. -/
theorem costMultPreScan_eq_live_nodes (hc : Host) :
    costMultPreScan hc.graph.prog.nodes.length = hc.graph.prog.nodes.length := by
  simp [costMultPreScan, costNodeMultOk]

/-- checkFailClosed Nat cost is one live fail-closed walk (node list length).
    Name 9 C: not well-typed plus pre-scan (retired 1 + n).
    Greppable: costCheckFailClosed_eq_live_nodes, HOST-COST-THEOREM, FAIL-CLOSED,
    SINGLE_FAIL_CLOSED_WALK, HOST-COST-SINGLE-WALK. -/
theorem costCheckFailClosed_eq_live_nodes (hc : Host) :
    costCheckFailClosed hc.graph.prog.nodes.length =
      hc.graph.prog.nodes.length := by
  simp [costCheckFailClosed, costMultPreScan, costNodeMultOk]

/-- Any host with a MULT-1 node and spent (not live) token fails checkFailClosed.
    Forall on Host + List.any; spent fixture is an instance, not the only proof.
    Greppable: hostCost_spent_mult1_rejects_check, HOST-COST-THEOREM, MULT-1,
    FAIL-CLOSED. -/
theorem hostCost_spent_mult1_rejects_check (hc : Host)
    (hAny : hc.graph.prog.nodes.any (fun n => decide (n.mult = Mult.mult1)) = true)
    (hSpent : hc.linear.live = false) :
    checkFailClosed hc = false := by
  cases (List.any_eq_true).mp hAny with
  | intro n hn =>
    cases hn with
    | intro hMem hDec =>
      have hMult : n.mult = Mult.mult1 := of_decide_eq_true hDec
      have hFail : nodeMultOk n hc = false := by
        rw [nodeMultOk_mult1_eq_live n hc hMult, hSpent]
      have hScan : hc.graph.prog.nodes.all (fun m => nodeMultOk m hc) = false := by
        refine (List.all_eq_false).mpr ?_
        exact Exists.intro n (And.intro hMem (by simp [hFail]))
      simp [checkFailClosed, multPreScan, hScan]

/-- Fused extract under FS also rejects any spent MULT-1 host (opt cannot open bar).
    Greppable: hostCost_spent_mult1_rejects_extractFs, HOST-COST-THEOREM, MULT-1,
    extractOkFs, FAIL-CLOSED. -/
theorem hostCost_spent_mult1_rejects_extractFs (hc : Host)
    (hAny : hc.graph.prog.nodes.any (fun n => decide (n.mult = Mult.mult1)) = true)
    (hSpent : hc.linear.live = false) :
    extractOkFs hc = false :=
  hostCost_fuse_preserves_reject hc
    (hostCost_spent_mult1_rejects_check hc hAny hSpent)

/-- L5 spent fixture is an instance of the universal check reject.
    Greppable: hostCost_spent_mult1_rejects_check_instance, HOST-COST-THEOREM. -/
theorem hostCost_spent_mult1_rejects_check_instance :
    checkFailClosed hostCostSpentMult1 = false :=
  hostCost_spent_mult1_rejects_check hostCostSpentMult1 (by native_decide) rfl

/-- L5 spent fixture is an instance of the universal fused-extract reject.
    Greppable: hostCost_spent_mult1_rejects_extractFs_instance, HOST-COST-THEOREM. -/
theorem hostCost_spent_mult1_rejects_extractFs_instance :
    extractOkFs hostCostSpentMult1 = false :=
  hostCost_spent_mult1_rejects_extractFs hostCostSpentMult1 (by native_decide) rfl

/-- HostCost contrast: MULT-OMEGA shareNat reuse is repeatable; MULT-1 live-flag
    mint/consume is exact-once. This is NOT Token LinearCheck and does NOT
    claim elaborator LINEAR-EXACT-ONCE on SystemsLean.Linear.Token axioms.
    Greppable: hostCost_omega_share_vs_mult1_exact_once, HOST-COST-THEOREM,
    MULT-OMEGA, LINEAR-EXACT-ONCE. -/
theorem hostCost_omega_share_vs_mult1_exact_once (n : Nat) :
    (shareNat (shareNat n) = (n + n) + (n + n))
      /\ ((match mint empty 7 with
           | MintResult.ok hc =>
             match consume hc with
             | ConsumeResult.ok hc' p =>
               (p == 7) && (!hc'.linear.live) &&
                 (match consume hc' with
                  | ConsumeResult.notLive => true
                  | ConsumeResult.ok _ _ => false)
             | ConsumeResult.notLive => false
           | MintResult.badId => false
           | MintResult.alreadyLive => false) = true) :=
  And.intro (shareNat_reuse n) hostCost_exact_once_sequential_ref

/-- Agreement: thin Extract.extractOk MULT-1 under RUNTIME-FS is false
    (no live-token evidence). HostCompose extractOkFs on unminted/spent
    MULT-1 is false (compose close via multPreScan). Same reject.
    Greppable: hostCost_thin_extract_mult1_agrees_compose, HOST-COST-THEOREM,
    MULT-1, EXTRACT-THEOREM. -/
theorem hostCost_thin_extract_mult1_agrees_compose (e : Erased) :
    (Extract.extractOk Mult.mult1 e RuntimeClaim.runtimeFs = false)
      /\ (extractOkFs hostCostSpentMult1 = false) :=
  And.intro (Extract.extractOk_mult1_fs_false e)
    hostCost_opt_preserves_spent_mult1_reject

end SystemsLean.HostCost
