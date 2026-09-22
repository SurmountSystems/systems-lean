/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostCompose.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostComposeSource. Not occupancy name 50. Not mill 70.
  This wrap is HostCompose.lean. It is not HostComposeTheorems.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostComposeSource,
  HOST-FRONT-LIVE-HOST-COMPOSE, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostComposeSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostCompose

/-- Dual-pinned live HostCompose.lean bytes (must match on-disk file).
    Greppable: liveHostComposeSource, HOST-FRONT-LIVE-HOST-COMPOSE. -/
def liveHostComposeSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- host compose (graph + linear host + erasure) on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Extract.slake / extract.md HOST_COMPOSE_V0 notes,
    Linear.slake / linear.md host side, Types.slake graph side,
    emit slake_host_compose_* (frozen wire honesty only).

  Spec (readable, separate from any future proof):
  - Thin host compose: owns IR graph + linear host handle (ConsumeToken-class
    live flag honesty) + erasure mark + extract path honesty.
  - HOST-COMPOSE surface: mint / consume / markErased / pushHostNode / addHostEdge
    fail-closed helpers; checkFailClosed mult pre-scan then graph bar.
    Compose names are distinct from IrGraph.pushNode / addEdge (no open clash).
  - MULT-1 live-token gap closed here (relative to Extract partial path):
      any MULT-1 node in the owned graph requires hc.linear.live;
      any MULT-0 node requires marked erased (ERASE-NO-RUNTIME);
      MULT-OMEGA nodes need neither handle.
  - Empty well-typed compose (no nodes) check/extract OK (matches emit).
  - extractOk requires RUNTIME-FS claim (EMIT-BOUNDARY); classic / edge reject.
  - Linear host here is a concrete live-flag model for fail-closed checks.
    SystemsLean.Linear axioms remain the JOIN-ALG ConsumeToken dual cite;
    classic Lean still does not enforce exact-once at the elaborator.

  Theorems (COMPOSE-THEOREM / HOST-COMPOSE-THEOREM -- partial HostCompose only):
  - Live in SystemsLean.HostComposeTheorems (same namespace; long-file peel).
  - multPreScan_empty_true / checkFailClosed_empty_true / extractOkFs_empty_true
  - extractOk_classic_empty_false / extractOk_edge_empty_false (EMIT-BOUNDARY)
  - extractOk_classic_mult1_minted_false / extractOk_edge_mult1_minted_false
  - extractOk_classic_mult0_marked_false / extractOk_edge_mult0_marked_false
  - mint_zero_badId / consume_empty_notLive / mint_empty_one_ok /
    consume_minted_one / mint_already_live_one / double_consume_notLive
  - mint_consume_exact_once_sequential (mint then consume once then second notLive)
  - nodeMultOk_omega / nodeMultOk_mult1_eq_live / nodeMultOk_mult0_eq_absent
  - multPreScan / extractOkFs MULT-1 and MULT-0 gap-close; extractOk_eq family
  - consume_mult1_minted / multPreScan_mult1_spent_false /
    extractOkFs_mult1_spent_false / checkFailClosed_mult1_spent_false /
    mult1_spent_scrub / consume_mult1_spent_reject (spent MULT-1 graph)
  - joint mult1+mult0 multi-node: multPreScan_joint_minted_marked_true /
    extractOkFs_joint_minted_marked_true / checkFailClosed_joint_minted_marked_true /
    multPreScan_joint_unminted_marked_false / extractOkFs_joint_unminted_marked_false /
    checkFailClosed_joint_unminted_marked_false /
    multPreScan_joint_minted_unmarked_false / extractOkFs_joint_minted_unmarked_false /
    checkFailClosed_joint_minted_unmarked_false /
    joint_mult1_mult0_extract_ok / joint_mult1_mult0_either_side_fail_closed
  - markErased_idempotent / multPreScan_omega_only_true / mint_consume_roundtrip
  - pushHostNode_* / addHostEdge_* fail-closed + ok; HOST-SMOKE examples
  These HostCompose theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on HostCompose != host proof complete != residual free.
  Live-flag model only -- does NOT claim MULT-1 LINEAR-EXACT-ONCE elaborator
  enforcement (SystemsLean.Linear axioms remain; classic Lean cannot enforce).

  Intentional non-claims / partial parity:
  - PARTIAL vs full C HOST_COMPOSE_V0: host does not model null pointers,
    uint8 wire widths, or exact C return-code tables (codes -1 and -2); uses typed
    result inductives and Bool checks instead.
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not a full elaborator. Not full emit reimplementation. Not residual free.

  Greppable: SYSTEMS_LEAN_HOST, HOST_COMPOSE_V0, HOST-COMPOSE, FAIL-CLOSED,
  EMIT-BOUNDARY, RUNTIME-FS, JOIN-ALG, ConsumeToken, MULT-0, MULT-1, MULT-OMEGA,
  IR-GRAPH-EDGES, slake_host_compose, COMPOSE-THEOREM, HOST-COMPOSE-THEOREM,
  HostComposeTheorems, UNIT_SURFACE host surface. Module: SystemsLean.HostCompose
  Long-file peel: COMPOSE-THEOREM + HOST-SMOKE in SystemsLean.HostComposeTheorems
  (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrGraph
import SystemsLean.Erasure
import SystemsLean.Extract

namespace SystemsLean.HostCompose

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrGraph (Graph)
open SystemsLean.Erasure (Erased)
open SystemsLean.Extract (RuntimeClaim)

/-- Linear host handle (CONSUME_TOKEN_HOST_V0 / JOIN-ALG ConsumeToken honesty).
    live true means a MULT-1 resource is available for checkFailClosed.
    id is unrestricted payload (mint rejects id 0, matching emit id==0 fail).
    Classic Lean does not enforce LINEAR-EXACT-ONCE; live flag is contract state. -/
structure LinearHost where
  live : Bool
  id : Nat
  deriving DecidableEq, Repr

/-- Empty / unminted linear host (not live). -/
def LinearHost.empty : LinearHost := { live := false, id := 0 }

/-- HOST-COMPOSE: graph + linear host + erasure under one extract entry.
    Emit map: slake_host_compose. -/
structure Host where
  graph : Graph
  linear : LinearHost
  erased : Erased
  deriving DecidableEq, Repr

/-- Empty compose: empty graph, unminted host, unmarked erased.
    EMPTY-GRAPH-OK at graph surface; checkFailClosed OK when no nodes. -/
def empty : Host := {
  graph := IrGraph.empty
  linear := LinearHost.empty
  erased := Erasure.unmarked
}

/-- Result of mint: ok, bad id (0), or already live.
    Emit map: 0 ok; -1 id==0 / invalid; -2 already live. -/
inductive MintResult where
  | ok (hc : Host)
  | badId
  | alreadyLive
  deriving DecidableEq, Repr

/-- mint hc id -- mint a MULT-1 live token on the host (ConsumeToken-class).
    FAIL-CLOSED: id 0 rejected; already-live rejected (no double mint). -/
def mint (hc : Host) (id : Nat) : MintResult :=
  if id = 0 then
    MintResult.badId
  else if hc.linear.live then
    MintResult.alreadyLive
  else
    MintResult.ok { hc with linear := { live := true, id := id } }

/-- Result of consume: ok with payload, or not live (empty / already spent).
    Emit map: 0 success; -1 empty; -2 already spent / LINEAR-EXACT-ONCE. -/
inductive ConsumeResult where
  | ok (hc : Host) (payload : Nat)
  | notLive
  deriving DecidableEq, Repr

/-- consume hc -- use the live token once (contract); clear live.
    FAIL-CLOSED: notLive when host is not live (includes double consume).
    After spend: live false and id scrubbed to 0 (emit-map honesty: spent scrub).
    Payload is returned in ConsumeResult.ok; checkFailClosed only reads live. -/
def consume (hc : Host) : ConsumeResult :=
  if !hc.linear.live then
    ConsumeResult.notLive
  else
    let payload := hc.linear.id
    ConsumeResult.ok { hc with linear := { live := false, id := 0 } } payload

/-- markErased hc -- mark owned erasure handle (ERASE-NO-RUNTIME path).
    Emit map honesty: slake_host_compose_mark_erased / slake_erased_mark.
    Always succeeds on host (no null compose); returns marked handle. -/
def markErased (hc : Host) : Host :=
  { hc with erased := Erasure.mark hc.erased }

/-- Result of pushHostNode: ok with new host, bad node, or full.
    Named Host* to stay distinct from IrGraph.PushNodeResult. -/
inductive HostPushNodeResult where
  | ok (hc : Host)
  | badNode
  | full
  deriving DecidableEq, Repr

/-- Result of addHostEdge: ok, full, or bad endpoints.
    Named Host* to stay distinct from IrGraph.AddEdgeResult. -/
inductive HostAddEdgeResult where
  | ok (hc : Host)
  | full
  | badEndpoints
  deriving DecidableEq, Repr

/-- pushHostNode hc n -- call-through IrGraph.pushNode (compose-owned graph).
    FAIL-CLOSED: same badNode / full as graph / program.
    Distinct name from IrGraph.pushNode so clients need not FQN when both open. -/
def pushHostNode (hc : Host) (n : IrNode) : HostPushNodeResult :=
  match IrGraph.pushNode hc.graph n with
  | IrGraph.PushNodeResult.ok g => HostPushNodeResult.ok { hc with graph := g }
  | IrGraph.PushNodeResult.badNode => HostPushNodeResult.badNode
  | IrGraph.PushNodeResult.full => HostPushNodeResult.full

/-- addHostEdge hc fromIdx toIdx -- call-through IrGraph.addEdge.
    FAIL-CLOSED: full / badEndpoints.
    Distinct name from IrGraph.addEdge. -/
def addHostEdge (hc : Host) (fromIdx toIdx : Nat) : HostAddEdgeResult :=
  match IrGraph.addEdge hc.graph fromIdx toIdx with
  | IrGraph.AddEdgeResult.ok g => HostAddEdgeResult.ok { hc with graph := g }
  | IrGraph.AddEdgeResult.full => HostAddEdgeResult.full
  | IrGraph.AddEdgeResult.badEndpoints => HostAddEdgeResult.badEndpoints

/-- nodeMultOk n hc -- mult pre-scan for one owned node (HOST-COMPOSE boundary).
    MULT-0 needs marked erased; MULT-1 needs hc.linear.live; MULT-OMEGA always ok.
    Minted MULT-1 live-token path for nodes present in the graph. -/
def nodeMultOk (n : IrNode) (hc : Host) : Bool :=
  match n.mult with
  | Mult.mult0 => Erasure.isRuntimeAbsent hc.erased
  | Mult.mult1 => hc.linear.live
  | Mult.multOmega => true

/-- multPreScan hc -- FAIL-CLOSED mult pre-scan over all live graph nodes.
    Empty node list is vacuously true (empty compose OK). -/
def multPreScan (hc : Host) : Bool :=
  hc.graph.prog.nodes.all (fun n => nodeMultOk n hc)

/-- hostIsWellTyped hc -- graph well-typed (EMPTY-GRAPH-OK included).
    Distinct from IrGraph.isWellTyped. Host may be unminted; well-typed does not
    require live token until mult pre-scan. -/
def hostIsWellTyped (hc : Host) : Bool := IrGraph.isWellTyped hc.graph

/-- checkFailClosed hc -- HOST-COMPOSE fail-closed bar (partial vs full C).
    1) graph must be well-typed (empty graph OK)
    2) mult pre-scan: MULT-1 needs linear.live; MULT-0 marked erased; MULT-OMEGA free
    Not full C return-code table; Bool host honesty only.
    Greppable: FAIL-CLOSED, HOST-COMPOSE, MULT-0, MULT-1, nodeMultOk, multPreScan. -/
def checkFailClosed (hc : Host) : Bool :=
  hostIsWellTyped hc && multPreScan hc

/-- extractOk hc claim -- extract path honesty (EMIT-BOUNDARY).
    Requires RuntimeClaim.runtimeFs and checkFailClosed.
    Any MULT-1 node needs linear.live; any MULT-0 needs marked erased;
    empty compose and MULT-OMEGA-only graphs may extract under FS without mint.
    EDGE-RUNTIME / RUNTIME-CLASSIC reject.
    On OK product wire would set out_rt to RUNTIME-FS (not modeled as mutation).
    PARTIAL vs full C HOST_COMPOSE_V0 extract (no null out_rt path on host). -/
def extractOk (hc : Host) (claim : RuntimeClaim) : Bool :=
  Extract.isFreestandingGoal claim && checkFailClosed hc

/-- extractOkFs hc -- product extract under RUNTIME-FS only (common path). -/
def extractOkFs (hc : Host) : Bool :=
  extractOk hc RuntimeClaim.runtimeFs

end SystemsLean.HostCompose
"#

end SystemsLean.HostFrontLiveHostCompose
