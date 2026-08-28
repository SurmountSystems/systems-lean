/-
  SYSTEMS_LEAN_HOST partial -- host structural step cost (Nat accounting).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): HostCompose mint/consume/checkFailClosed/extractOk;
    HostComposeTheorems exact-once suite; IrProgram.programCap; IrGraph.edgeMax;
    RuntimeBenchLean (measure only).

  Spec (readable, separate from wall-clock measure):
  - HOST-COST / HOST-COST-STEP: explicit Nat step costs for mint, consume,
    mult pre-scan over n nodes, one-walk check_fail_closed, and extract-under-FS.
  - costCheckFailClosed n = costMultPreScan n (Name 9 C single live walk).
    Not well-typed plus a second pre-scan. NOT nanoseconds. NOT cycles.
  - NOT PROVABLY speed. NOT freestanding residual free. NOT GC-in-ELF theorem.
  - Extract under freestanding goal reuses checkFailClosed in HostCompose;
    costExtractOkFs is freestanding-goal step + costCheckFailClosed (fuse shape).
  - L2 Fixed cap: programCap (8) / edgeMax (16) bound worst-case node/edge walks.
  - L3 Extract fuse: extract cost = check + 1 (no second mult pre-scan Nat cost).
  - L4 Mint consume automaton: Nat steps + HostCompose exact-once theorem refs.
  - L5 Fail-closed opt preserve: fuse/cost rewrite still rejects spent/ill mult.
  - L6 No-heap host machine: token state Bool+Nat fields only (not ELF proof).
  - L7 Differential fuse model: double-check vs single check+extract Nat savings.
  - L8 Joint mult cost table: MULT-0 / MULT-1 / MULT-OMEGA node look costs.
  - L9 RuntimeBenchLean step twin: protocol step counts (companion arm notes).

  Theorems (HOST-COST-THEOREM -- partial HostCost only):
  - Live in SystemsLean.HostCostTheorems (same namespace; long-file split).
  - costMintConsumeSequential_eq (mint+consume = 2)
  - costMultPreScan_zero / costMultPreScan_one
  - costCheckFailClosed_empty
  - costExtractOkFs_eq / costExtractOkFs_ge_check / costExtractOkFs_eq_check_plus_one
  - costMultPreScanAtCap_eq / costMultPreScan_le_atCap / costCheckFailClosed_le_atCap
  - costEdgeWalkAtCap_eq / costEdgeWalk_le_atCap
  - costMintConsumeExactOnceAutomaton_eq / hostCost_exact_once_sequential_ref
  - costFused_le_naive / hostCost_fuse_preserves_fail_closed
  - hostCost_opt_preserves_spent_mult1_reject_ref / hostCost_opt_preserves_double_consume_ref
  - hostCost_linearHost_fields_bool_nat / hostCostNoHeapModelOk_true
  - costDoubleCheckPath_eq / costFuseNatSavings_eq / cost_diff_fuse_vs_double
  - costNodeMultByGrade_eq_one / costJointMultTableOk_true
  - costStepTwinMintConsume_eq / costStepTwinTotal_eq
  - costMultPreScan_eq_live_nodes / costCheckFailClosed_eq_live_nodes
  - hostCost_spent_mult1_rejects_check / hostCost_spent_mult1_rejects_extractFs
  - hostCost_omega_share_vs_mult1_exact_once (not Token LinearCheck)
  - hostCost_thin_extract_mult1_agrees_compose (thin Extract + compose reject)
  These do NOT set SpecProof.proofCompleteClaimed true.
  Partial Nat accounting != wall-clock proof != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not wall-clock or cycle-count theorems (those are just bench-runtime).
  - Not "no GC in the binary" / not ELF / ldd as Lean theorem (L6 model only).
  - Not FullHost / mathlib invent. Not dual-ok harness invent.
  - Live HostCompose exact-once theorems remain the mint/consume state machine;
    this module names Nat step shapes and re-exports cost-relevant refs.

  Greppable: SYSTEMS_LEAN_HOST, HOST-COST, HOST-COST-STEP, HOST-COST-THEOREM,
  HOST-COST-CAP, HOST-COST-FUSE, HOST-COST-AUTOMATON,
  HOST-COST-OPT-PRESERVE, HOST-COST-NO-HEAP, HOST-COST-DIFF-FUSE,
  HOST-COST-MULT-TABLE, HOST-COST-STEP-TWIN, HostCostTheorems,
  costMintStep, costConsumeStep, costMintConsumeSequential,
  costMultPreScan, costCheckFailClosed, costExtractOkFs,
  costMintConsumeSequential_eq, costExtractOkFs_eq, costExtractOkFs_ge_check,
  costExtractOkFs_eq_check_plus_one, costMultPreScanAtCap_eq,
  costMultPreScan_le_atCap, costCheckFailClosed_le_atCap,
  costEdgeWalk, costEdgeWalkAtCap, costEdgeWalk_le_atCap,
  costMintConsumeExactOnceAutomaton, hostCost_exact_once_sequential_ref,
  hostCost_double_consume_notLive_ref, costNaiveDoubleCheck, costFusedCheckExtract,
  costDoubleCheckPath, costFuseNatSavings, costNodeMultByGrade,
  costStepTwinMintConsume_eq, costStepTwinTotal_eq,
  hostCostTokenState, hostCostSurfaceOk, hostCostSurfaceOk_true,
  costMultPreScan_eq_live_nodes, hostCost_spent_mult1_rejects_check,
  hostCost_spent_mult1_rejects_extractFs,
  hostCost_omega_share_vs_mult1_exact_once,
  hostCost_thin_extract_mult1_agrees_compose,
  HOST-COST-SINGLE-WALK, SINGLE_FAIL_CLOSED_WALK, HOST_COMPOSE_SINGLE_WALK,
  costCheckFailClosed_eq_pre_scan, costFused_le_naive_plus_goal,
  FAIL-CLOSED, HOST-COMPOSE, RUNTIME-FS,
  UNIT_SURFACE host surface. Module: SystemsLean.HostCost
  Long-file split: HOST-COST-THEOREM L1-L9 + Wave 2 in SystemsLean.HostCostTheorems
  (same namespace). Cost defs, token structure, cost table, surface Bools stay here.
  Red/green: lake build SystemsLean.HostCost; lake build SystemsLean.HostCostTheorems;
  just systems-host when present.
  Module must stay ASCII. Sub-1-KLOC.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostCompose
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.Mult

namespace SystemsLean.HostCost

open SystemsLean.IrProgram (programCap)
open SystemsLean.IrGraph (edgeMax)
open SystemsLean.HostCompose (LinearHost)
open SystemsLean.Mult (Mult)

/-! ### HOST-COST-STEP unit costs (mint / consume) -/

/-- One structural step for a mint attempt (ok, badId, or alreadyLive).
    Greppable: costMintStep, HOST-COST-STEP. -/
def costMintStep : Nat := 1

/-- One structural step for a consume attempt (ok or notLive).
    Greppable: costConsumeStep, HOST-COST-STEP. -/
def costConsumeStep : Nat := 1

/-- Sequential mint then consume exact-once success path (two unit steps).
    Matches HostCompose mint_consume_exact_once_sequential success prefix as Nat.
    Greppable: costMintConsumeSequential, HOST-COST-STEP. -/
def costMintConsumeSequential : Nat := costMintStep + costConsumeStep

/-- Full exact-once automaton: mint + consume ok + second consume reject (3 steps).
    Cost of the HostCompose mint_consume_exact_once_sequential / double_consume path.
    Greppable: costMintConsumeExactOnceAutomaton, HOST-COST-AUTOMATON, HOST-COST-STEP. -/
def costMintConsumeExactOnceAutomaton : Nat :=
  costMintStep + costConsumeStep + costConsumeStep

/-! ### HOST-COST-STEP compose check / extract shapes -/

/-- One structural step for a single nodeMultOk look.
    Greppable: costNodeMultOk, HOST-COST-STEP. -/
def costNodeMultOk : Nat := 1

/-- Mult pre-scan cost for n live nodes (n * costNodeMultOk).
    HostCompose.multPreScan walks live graph nodes once.
    Greppable: costMultPreScan, HOST-COST-STEP, multPreScan. -/
def costMultPreScan (n : Nat) : Nat := n * costNodeMultOk

/-- Public is_well_typed API unit (graph well-typed walk if called separately).
    Name 9 C check does not add this: one live walk types and fail-closes.
    Greppable: costHostIsWellTyped, HOST-COST-STEP. -/
def costHostIsWellTyped : Nat := 1

/-- checkFailClosed shape: one live fail-closed walk over n nodes.
    Name 9 C (SINGLE_FAIL_CLOSED_WALK / HOST_COMPOSE_SINGLE_WALK): types and
    fail-closes in one pass. Not well-typed plus a second pre-scan.
    HostCompose Lean predicate is still hostIsWellTyped && multPreScan
    (Boolean conjunction). Nat cost matches product C, not two nested walks.
    costHostIsWellTyped stays the public is_well_typed API unit only.
    Greppable: costCheckFailClosed, HOST-COST-STEP, FAIL-CLOSED,
    SINGLE_FAIL_CLOSED_WALK, HOST_COMPOSE_SINGLE_WALK, HOST-COST-SINGLE-WALK. -/
def costCheckFailClosed (n : Nat) : Nat :=
  costMultPreScan n

/-- Freestanding-goal check as one structural step (isFreestandingGoal claim).
    Greppable: costFreestandingGoal, HOST-COST-STEP, RUNTIME-FS. -/
def costFreestandingGoal : Nat := 1

/-- extractOk under FS: freestanding-goal step + checkFailClosed cost.
    HostCompose: extractOk = isFreestandingGoal && checkFailClosed (fuse shape).
    Greppable: costExtractOkFs, HOST-COST-STEP, extractOk, HOST-COST-FUSE. -/
def costExtractOkFs (n : Nat) : Nat :=
  costFreestandingGoal + costCheckFailClosed n

/-- Extract fuse delta under FS: only the freestanding-goal step (no second scan).
    Greppable: costExtractFuseDelta, HOST-COST-FUSE, HOST-COST-STEP. -/
def costExtractFuseDelta : Nat := costFreestandingGoal

/-- Worst-case mult pre-scan at ordered IR program capacity (SLAKE_IR_PROGRAM_CAP).
    Greppable: costMultPreScanAtCap, programCap, HOST-COST-STEP, HOST-COST-CAP. -/
def costMultPreScanAtCap : Nat := costMultPreScan programCap

/-- Worst-case checkFailClosed at program capacity.
    Greppable: costCheckFailClosedAtCap, HOST-COST-STEP, HOST-COST-CAP. -/
def costCheckFailClosedAtCap : Nat := costCheckFailClosed programCap

/-- Worst-case extract under FS at program capacity.
    Greppable: costExtractOkFsAtCap, HOST-COST-STEP, HOST-COST-CAP, HOST-COST-FUSE. -/
def costExtractOkFsAtCap : Nat := costExtractOkFs programCap

/-- Program capacity cite (emit SLAKE_IR_PROGRAM_CAP map). Not wall-clock.
    Greppable: hostCostProgramCap, programCap, HOST-COST-CAP. -/
def hostCostProgramCap : Nat := programCap

/-- Edge capacity cite (emit SLAKE_IR_EDGE_MAX map). Not a wall-clock claim.
    Greppable: hostCostEdgeMax, edgeMax, HOST-COST-CAP. -/
def hostCostEdgeMax : Nat := edgeMax

/-- One structural step for a single edge look (graph edge walk unit).
    Greppable: costEdgeLook, HOST-COST-STEP, HOST-COST-CAP. -/
def costEdgeLook : Nat := 1

/-- Edge-walk cost for e live edges (e * costEdgeLook).
    Bound by edgeMax (16) by construction on product IR.
    Greppable: costEdgeWalk, HOST-COST-STEP, HOST-COST-CAP. -/
def costEdgeWalk (e : Nat) : Nat := e * costEdgeLook

/-- Worst-case edge walk at edgeMax capacity.
    Greppable: costEdgeWalkAtCap, edgeMax, HOST-COST-STEP, HOST-COST-CAP. -/
def costEdgeWalkAtCap : Nat := costEdgeWalk edgeMax

/-- Worst-case checkFailClosed plus full edge walk at both caps.
    Greppable: costCheckAndEdgeWalkAtCap, HOST-COST-CAP, HOST-COST-STEP. -/
def costCheckAndEdgeWalkAtCap : Nat :=
  costCheckFailClosedAtCap + costEdgeWalkAtCap

/-! ### HOST-COST automaton / opt-preserve / no-heap / diff-fuse / mult / twin defs
    Theorem statements L1-L9 live in SystemsLean.HostCostTheorems (same namespace). -/

/-- Automaton surface: sequential path is 2 and full path is 3; exact-once holds.
    Greppable: hostCostAutomatonOk, HOST-COST-AUTOMATON, HOST-COST. -/
def hostCostAutomatonOk : Bool :=
  decide (costMintConsumeSequential = 2)
    && decide (costMintConsumeExactOnceAutomaton = 3)
    && decide (costConsumeStep = 1)

/-! ### HOST-COST-THEOREM L5 Fail-closed opt preserve
    Cost-reducing rewrite (extract fuse / single check+extract) must not open
    fail-closed bars. Fused path still equals checkFailClosed under FS; spent
    MULT-1 and double-consume still reject. Supports E2 honesty without wall-clock. -/

/-- Naive double-check path: two independent checkFailClosed walks over n nodes.
    Greppable: costNaiveDoubleCheck, HOST-COST-OPT-PRESERVE, HOST-COST-STEP. -/
def costNaiveDoubleCheck (n : Nat) : Nat :=
  costCheckFailClosed n + costCheckFailClosed n

/-- Fused check+extract under FS (alias of costExtractOkFs; no second scan).
    Greppable: costFusedCheckExtract, HOST-COST-OPT-PRESERVE, HOST-COST-FUSE. -/
def costFusedCheckExtract (n : Nat) : Nat := costExtractOkFs n

/-- Opt-preserve surface: fuse le naive + spent reject tokens present as Nat shapes.
    Greppable: hostCostOptPreserveOk, HOST-COST-OPT-PRESERVE, HOST-COST. -/
def hostCostOptPreserveOk : Bool :=
  decide (costFusedCheckExtract 1 <= costNaiveDoubleCheck 1)
    && decide (costFusedCheckExtract 3 <= costNaiveDoubleCheck 3)
    && decide (costExtractOkFs 3 = costCheckFailClosed 3 + 1)

/-! ### HOST-COST-THEOREM L6 No-heap host machine
    Honest model: linear token state is Bool + Nat fields only.
    No heap allocator, no ByteArray, no String in the host token model.
    NOT an ELF / ldd / "no GC in binary" proof. Structural model only. -/

/-- Host-cost view of linear token fields (Bool live + Nat id only).
    Mirrors HostCompose.LinearHost; documents no-heap token machine.
    Greppable: HostCostTokenState, hostCostTokenState, HOST-COST-NO-HEAP. -/
structure HostCostTokenState where
  live : Bool
  id : Nat
  deriving DecidableEq, Repr

/-- Empty / unminted token state (not live, id 0).
    Greppable: hostCostTokenStateEmpty, HOST-COST-NO-HEAP. -/
def hostCostTokenStateEmpty : HostCostTokenState := { live := false, id := 0 }

/-- Project LinearHost into HostCostTokenState (field-for-field Bool+Nat).
    Greppable: hostCostTokenFromLinear, HOST-COST-NO-HEAP. -/
def hostCostTokenFromLinear (lh : LinearHost) : HostCostTokenState :=
  { live := lh.live, id := lh.id }

/-- No-heap model surface: empty state fields and unit mint/consume steps.
    Docs: not ELF proof. Greppable: hostCostNoHeapModelOk, HOST-COST-NO-HEAP. -/
def hostCostNoHeapModelOk : Bool :=
  decide (hostCostTokenStateEmpty.live = false)
    && decide (hostCostTokenStateEmpty.id = 0)
    && decide (costMintStep = 1)
    && decide (costConsumeStep = 1)

/-! ### HOST-COST-THEOREM L7 Differential fuse model
    Single check+extract (fused) vs double-check (naive) as Nat relation.
    Aligns with costExtractOkFs_eq_check_plus_one; supports E2 emit fuse honesty.
    Not emit wire fuse; not wall-clock. -/

/-- Double-check path: two full checkFailClosed walks (no fuse).
    Greppable: costDoubleCheckPath, HOST-COST-DIFF-FUSE, HOST-COST-STEP. -/
def costDoubleCheckPath (n : Nat) : Nat := 2 * costCheckFailClosed n

/-- Single fused check+extract path under FS (goal step + one check).
    Greppable: costSingleCheckExtractPath, HOST-COST-DIFF-FUSE, HOST-COST-FUSE. -/
def costSingleCheckExtractPath (n : Nat) : Nat := costExtractOkFs n

/-- Nat savings of fuse vs double-check: one full check minus the goal step.
    Equal to n - 1 when check is one n-node walk (Nat sub; 0 at empty).
    Greppable: costFuseNatSavings, HOST-COST-DIFF-FUSE, HOST-COST-STEP. -/
def costFuseNatSavings (n : Nat) : Nat := costCheckFailClosed n - 1

/-- Diff-fuse surface: savings at 0/3 and path equality at 3.
    Greppable: hostCostDiffFuseOk, HOST-COST-DIFF-FUSE, HOST-COST. -/
def hostCostDiffFuseOk : Bool :=
  decide (costFuseNatSavings 0 = 0)
    && decide (costFuseNatSavings 3 = 2)
    && decide (costDoubleCheckPath 3 = costSingleCheckExtractPath 3 + 2)
    && decide (costSingleCheckExtractPath 3 = costCheckFailClosed 3 + 1)

/-! ### HOST-COST-THEOREM L8 Joint mult cost table
    Per-node multPreScan look costs for MULT-0 / MULT-1 / MULT-OMEGA.
    Each grade costs one structural node look; grades differ in which host
    field is inspected (erasure / live / constant), not Nat step count.
    No grades beyond 0/1/omega. -/

/-- MULT-0 node look cost (erasure-absent check unit).
    Greppable: costNodeMult0, HOST-COST-MULT-TABLE, MULT-0, HOST-COST-STEP. -/
def costNodeMult0 : Nat := costNodeMultOk

/-- MULT-1 node look cost (linear.live check unit).
    Greppable: costNodeMult1, HOST-COST-MULT-TABLE, MULT-1, HOST-COST-STEP. -/
def costNodeMult1 : Nat := costNodeMultOk

/-- MULT-OMEGA node look cost (always-ok constant unit).
    Greppable: costNodeMultOmega, HOST-COST-MULT-TABLE, MULT-OMEGA, HOST-COST-STEP. -/
def costNodeMultOmega : Nat := costNodeMultOk

/-- Joint mult cost table: grade -> node look Nat cost.
    Greppable: costNodeMultByGrade, HOST-COST-MULT-TABLE, multPreScan. -/
def costNodeMultByGrade : Mult -> Nat
  | Mult.mult0 => costNodeMult0
  | Mult.mult1 => costNodeMult1
  | Mult.multOmega => costNodeMultOmega

/-- Joint mult table surface ready.
    Greppable: costJointMultTableOk, HOST-COST-MULT-TABLE, HOST-COST. -/
def costJointMultTableOk : Bool :=
  decide (costNodeMult0 = 1)
    && decide (costNodeMult1 = 1)
    && decide (costNodeMultOmega = 1)
    && decide (costNodeMultByGrade Mult.mult0 = 1)
    && decide (costNodeMultByGrade Mult.mult1 = 1)
    && decide (costNodeMultByGrade Mult.multOmega = 1)
    && decide (costMultPreScan 3 = 3)

/-! ### HOST-COST-THEOREM L9 RuntimeBenchLean step twin
    Protocol step counts aligned with RuntimeBenchLean mint/consume arm.
    Each managed-runtime op twins costMintConsumeSequential (2 Nat steps).
    Companion arm documents the same protocol; not freestanding speed proof.
    Greppable: HOST-COST-STEP-TWIN (defs also in RuntimeBenchLean). -/

/-- Structural steps for one mint+consume op (RuntimeBenchLean protocol twin).
    Greppable: costStepTwinMintConsume, HOST-COST-STEP-TWIN, HOST-COST-STEP. -/
def costStepTwinMintConsume : Nat := costMintConsumeSequential

/-- Total structural steps for n timed ops (not wall-clock ns).
    Greppable: costStepTwinTotal, HOST-COST-STEP-TWIN, HOST-COST-STEP. -/
def costStepTwinTotal (n : Nat) : Nat := n * costStepTwinMintConsume

/-- Step-twin surface ready.
    Greppable: hostCostStepTwinOk, HOST-COST-STEP-TWIN, HOST-COST. -/
def hostCostStepTwinOk : Bool :=
  decide (costStepTwinMintConsume = 2)
    && decide (costStepTwinTotal 0 = 0)
    && decide (costStepTwinTotal 3 = 6)

/-! ### HOST-COST surface ready (L1-L9) -/

/-- HostCost surface ready: unit costs, caps, fuse, automaton, opt-preserve,
    no-heap, diff-fuse, mult table, step twin Nat shapes.
    Greppable: hostCostSurfaceOk, HOST-COST. Not residual free. Not PROVABLY. -/
def hostCostSurfaceOk : Bool :=
  decide (costMintStep = 1)
    && decide (costConsumeStep = 1)
    && decide (costMintConsumeSequential = 2)
    && decide (costMintConsumeExactOnceAutomaton = 3)
    && decide (costCheckFailClosed 0 = 0)
    && decide (costExtractOkFs 0 = 1)
    && decide (costMultPreScanAtCap = 8)
    && decide (hostCostProgramCap = 8)
    && decide (hostCostEdgeMax = 16)
    && decide (costEdgeWalkAtCap = 16)
    && decide (costExtractFuseDelta = 1)
    && decide (costExtractOkFs 3 = costCheckFailClosed 3 + 1)
    && hostCostAutomatonOk
    && hostCostOptPreserveOk
    && hostCostNoHeapModelOk
    && hostCostDiffFuseOk
    && costJointMultTableOk
    && hostCostStepTwinOk

end SystemsLean.HostCost
