# Explore: next-level high-assurance provable performance (2026-08-12)

Kind: analysis only. Not residual invent (Names below are **candidates**).
Not free / complete / PROVABLY / FullHost / DominanceClaimed / FullBackend
claim flips. ASCII only. Plain American English.

**Question:** what does Lean already prove about structural cost and exact-once,
and what is the next honest prove layer with the project lean4 skill
(`.agents/skills/lean4/SKILL.md`)? No mathlib day-one (C4 remains non-goal).

**Companions:**
- User map: `doc/dev/research/perf-prove-user-map-2026-08-12.md`
- Earlier prove inventory: `.agents/reports/explore-perf-prove-tools-2026-08-12.md`
- Skill use: `doc/lean4-skill-use.md`
- Living residual: Track L0-L9 **done**; Open empty done-for-now
  (`RESIDUAL-systems.md`). Do not auto-open the Names below.

**Honest three-way split (do not mash):**

| Claim class | What it is | What it is not |
|-------------|------------|----------------|
| **PROVABLY** | CompCert product matrix (`ccomp` on named wire) | Speed, ns/op, no-GC-in-ELF |
| **Speed** | `just bench-runtime` vs named baselines | A Lean theorem about wall-clock |
| **Structural cost / exact-once** | HostCost Nat steps + HostCompose state machine | Freestanding ns/op or ELF proof |

No policy exception found: **PROVABLY stays CompCert wire correctness.**
HostCost headers, the perf-prove user map, and AGENTS all refuse
PROVABLY-as-speed.

---

## 1. HostCost.lean inventory

**Path:** `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/HostCost.lean`

| Fact | Value |
|------|-------|
| Lines on disk | **723** (header 1-67, defs+theorems 89-721) |
| `sorry` | none |
| Namespace | `SystemsLean.HostCost` |
| Companion theorems file | **none** (defs and theorems share one file) |
| Imports | HostCompose, HostComposeTheorems, IrProgram, IrGraph, Extract, Mult, Types, Erasure |
| Wired | `SystemsLean.lean`; `nix/systems-host-presence/` host-leans + required-files + host-specs-core-1 |
| Proof style | Mostly `rfl` / `simp` / `omega`; surface bools use `native_decide` |
| Dual-ok harness | Not used (seed 206 / harness 99 unchanged by L1-L9) |

### 1.1 What is Nat accounting (not wall-clock)

Every `cost*` def is a **structural step count** on the classic Lean host
model. Header is explicit: not nanoseconds, not cycles, not PROVABLY speed,
not GC-in-ELF.

| Def | Meaning | Value / shape |
|-----|---------|---------------|
| `costMintStep` / `costConsumeStep` | One mint or consume attempt | 1 |
| `costMintConsumeSequential` | Success prefix mint then consume | 2 |
| `costMintConsumeExactOnceAutomaton` | Mint + consume ok + second consume reject | 3 |
| `costNodeMultOk` | One `nodeMultOk` look | 1 |
| `costMultPreScan n` | `n * costNodeMultOk` | n |
| `costHostIsWellTyped` | One well-typed bar | 1 |
| `costCheckFailClosed n` | well-typed + pre-scan | 1 + n |
| `costFreestandingGoal` | `isFreestandingGoal` step | 1 |
| `costExtractOkFs n` | goal + check (fuse shape) | 2 + n |
| `costExtractFuseDelta` | Extra vs check (no second scan) | 1 |
| `costMultPreScanAtCap` | n = `programCap` (8) | 8 |
| `costCheckFailClosedAtCap` | | 9 |
| `costExtractOkFsAtCap` | | 10 |
| `costEdgeLook` / `costEdgeWalk e` | Edge walk | e |
| `costEdgeWalkAtCap` | e = `edgeMax` (16) | 16 |
| `costCheckAndEdgeWalkAtCap` | check at cap + edge walk at cap | 25 |
| `costNaiveDoubleCheck n` | Two independent checks | 2*(1+n) |
| `costFusedCheckExtract n` | Alias of extract under FS | 2+n |
| `costDoubleCheckPath n` | 2 * check | 2*(1+n) |
| `costFuseNatSavings n` | check - 1 | **= n** |
| `costNodeMult0/1/Omega` | Per-grade look | 1 each |
| `costNodeMultByGrade` | Mult -> Nat | always 1 |
| `costStepTwinMintConsume` | RuntimeBenchLean protocol twin | 2 |
| `costStepTwinTotal n` | n timed ops | 2*n |

**L6 no-heap model (not ELF):** `HostCostTokenState` is `{ live : Bool, id : Nat }`.
`hostCost_linearHost_fields_bool_nat` is definitional reconstruct from those
two fields. `hostCostNoHeapModelOk` is a Bool surface (empty live=false, id=0,
unit steps=1). Header: **not** ELF / `ldd` / "no GC in the binary."

**L9 twin:** `RuntimeBenchLean` aliases the same Nats and still times a
**managed-runtime** `MintCell` with `ByteArray` (intentional GC contrast).
Wall-clock stays empirical.

### 1.2 HostCost theorems already landed (L1-L9)

Sixty theorems. Grouped by residual layer.

| Layer | Theorems (names) | What they actually prove |
|-------|------------------|--------------------------|
| L1 unit | `costMintConsumeSequential_eq`, `costMultPreScan_zero`, `costMultPreScan_one`, `costCheckFailClosed_empty`, `costExtractOkFs_eq`, `costExtractOkFs_ge_check` | Unit Nats; extract = goal + check |
| L2 cap | `costMultPreScanAtCap_eq` (=8), `costCheckFailClosedAtCap_eq` (=9), `costExtractOkFsAtCap_eq` (=10), `hostCostProgramCap_eq`, `hostCostEdgeMax_eq`, `costEdgeWalkAtCap_eq` (=16), `costCheckAndEdgeWalkAtCap_eq` (=25), `costMultPreScan_le_atCap`, `costCheckFailClosed_le_atCap`, `costExtractOkFs_le_atCap`, `costEdgeWalk_le_atCap` | Abstract n/e bounded by 8/16 **when hypothesis says so**. Not a proof that `nodes.length` is always <= cap |
| L3 fuse | `costExtractFuseDelta_eq`, `costExtractOkFs_eq_check_plus_one`, `costExtractOkFs_fuse_shape`, `costExtractOkFs_sub_check`, `hostCost_extractOk_def_fuse`, `hostCost_extractOkFs_eq_check` | HostCompose `extractOk = isFreestandingGoal && checkFailClosed`; under FS, `extractOkFs = checkFailClosed` |
| L4 automaton | `costMintConsumeExactOnceAutomaton_eq` (=3), `costMintConsumeSequential_le_automaton`, `costMintConsumeSequential_eq_prefix`, `costConsumeRejectStep_eq`, `hostCost_exact_once_sequential_ref`, `hostCost_double_consume_notLive_ref`, `hostCostAutomatonOk_true` | Re-exports HostCompose exact-once; Nat 2 vs 3 |
| L5 opt preserve | `costFused_le_naive`, `hostCost_fuse_preserves_fail_closed`, `hostCost_fuse_preserves_reject`, `hostCost_opt_preserves_spent_check`, `hostCost_opt_preserves_spent_mult1_reject`, `hostCost_opt_preserves_double_consume_ref`, `hostCostOptPreserveOk_true` | Fuse Nat <= naive; reject implies fused reject; **one** spent MULT-1 fixture via `native_decide` |
| L6 no-heap | `hostCost_linearHost_fields_bool_nat`, `hostCostTokenFromLinear_eq`, `hostCostTokenFromLinear_empty`, `hostCostNoHeapModelOk_true` | Field shape only |
| L7 diff fuse | `costDoubleCheckPath_eq`, `costSingleCheckExtractPath_eq_check_plus_one`, `costFuseNatSavings_eq`, `cost_diff_fuse_vs_double`, `costNaiveDoubleCheck_eq_double`, `hostCostDiffFuseOk_true` | 2*(1+n) = (2+n) + n |
| L8 mult table | `costNodeMultByGrade_eq_one`, `costNodeMult0_eq`, `costNodeMult1_eq`, `costNodeMultOmega_eq`, `costMultPreScan_eq_node_looks`, `costJointMultTableOk_true` | Every grade costs **one look**; mix does not change Nat |
| L9 twin | `costStepTwinMintConsume_eq`, `costStepTwinTotal_eq`, `costStepTwinTotal_zero`, `hostCostStepTwinOk_true` | Protocol 2*n |
| Surface | `hostCostSurfaceOk_true` | Conjunction of the Bool surfaces |

These do **not** set `SpecProof.proofCompleteClaimed`.

---

## 2. HostCompose mint/consume exact-once

**Files:**
- `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/HostCompose.lean` (~232 lines; defs)
- `/home/hunter/Projects/ai/iso/src/systems/SystemsLean/HostComposeTheorems.lean` (**695** lines; theorems + HOST-SMOKE)

**State machine (concrete host, not Linear.Token axioms):**

```
mint  : id=0 -> badId; already live -> alreadyLive; else live=true, id
consume: !live -> notLive; else payload=id, live=false, id=0 (spent scrub)
```

### Exact-once / fail-closed theorem names

| Name | Contract |
|------|----------|
| `mint_zero_badId` | id 0 always badId |
| `consume_empty_notLive` | unminted consume is notLive |
| `mint_empty_one_ok` | mint empty 1 succeeds |
| `consume_minted_one` | consume minted id-1 returns 1, host empty |
| `mint_already_live_one` | no double mint |
| `double_consume_notLive` | first ok /\ second notLive |
| `mint_nonzero_ok` / `consume_live_payload` | any nonzero id |
| `mint_consume_roundtrip` | mint ok /\ consume payload = id |
| **`mint_consume_exact_once_sequential`** | mint 7, consume once (payload 7, !live), second consume notLive |
| `consume_mult1_minted` | MULT-1 graph kept; live scrubbed |
| `mult1_spent_scrub` | after consume: live false, id 0 |
| `consume_mult1_spent_reject` | spent consume notLive + scrub + extract false |
| `multPreScan_mult1_unminted_false` / `extractOkFs_mult1_unminted_false` | MULT-1 needs mint |
| `multPreScan_mult1_minted_true` / `extractOkFs_mult1_minted_true` | minted OK under FS |
| `multPreScan_mult1_spent_false` / `extractOkFs_mult1_spent_false` / `checkFailClosed_mult1_spent_false` | spent fails closed |
| `extractOk_classic_mult1_minted_false` / `extractOk_edge_mult1_minted_false` | EMIT-BOUNDARY |

HostCost L4 **re-exports** `mint_consume_exact_once_sequential` and
`double_consume_notLive` as `hostCost_*_ref`. The live proof home remains
HostComposeTheorems.

**Honesty:** classic Lean does **not** LinearCheck `Linear.Token`.
`LINEAR-AXIOMS-REMAIN`: `Token` / `mkToken` / `consume` stay axioms.
Exact-once proven here is the **Bool+Nat live-flag** machine.

---

## 3. Extract fuse lemmas (two surfaces)

There is no `fuse` identifier in Extract*. Fuse is **definitional reuse** of
`checkFailClosed`.

### Thin Extract (`Extract.lean` + `ExtractTheorems.lean`, 253 theorem lines)

| Name | Fact |
|------|------|
| `extractOk_eq_checkFailClosed` | `Extract.extractOk = Extract.checkFailClosed` (rfl) |
| `isFreestandingGoal_runtimeFs` | FS goal true |
| `isFreestandingGoal_classic_false` / `_edge_false` | non-FS goals |
| `extractOk_classic_reject` / `extractOk_edge_reject` | EMIT-BOUNDARY |
| `extractOk_mult1_fs_true` | **intentional MULT-1 gap:** thin path always true |
| `extractOk_omega_fs_true` | omega always true on thin path |
| `extractOk_mult0_unmarked_false` / `extractOk_mult0_marked_fs_true` | erase bar |

### Compose fuse (HostCompose + HostCost L3/L5/L7)

| Name | Fact |
|------|------|
| HostCompose `extractOk_eq` / `extractOkFs_eq` | claim FS /\ check |
| `hostCost_extractOk_def_fuse` | same, cited from HostCost |
| `hostCost_extractOkFs_eq_check` | under RUNTIME-FS, extract **is** check |
| `costExtractOkFs_eq_check_plus_one` | Nat: extract = check + 1 |
| `costFuseNatSavings_eq` | savings = n (one scan not re-paid) |
| E2 emit (done, not Lean) | C single-walk `HOST_COMPOSE_EXTRACT_FUSE`; empirical compose win |

**Gap:** thin Extract and HostCompose **disagree** on unminted MULT-1
(thin true, compose false). No named contrast theorem yet.

---

## 4. Mult 0 / 1 / omega cost table (L8)

| Grade | Host look | Nat cost | Semantic field |
|-------|-----------|----------|----------------|
| MULT-0 | erasure marked? | 1 | `Erasure.isRuntimeAbsent` |
| MULT-1 | linear.live? | 1 | exact-once token |
| MULT-OMEGA | always ok | 1 | unrestricted; **no** mint required |

Theorems: `costNodeMultByGrade_eq_one`, per-grade `_eq`,
`costMultPreScan_eq_node_looks`. Homogeneous: n nodes cost n looks
**regardless of mix**.

**Contrast already elsewhere, not in HostCost:**
- Omega: `LinearTheorems.shareNat_reuse` (result may be shared again);
  `multPreScan_omega_only_true` / `extractOkFs_omega_only_true` (no mint).
- Exact-once: `mint_consume_exact_once_sequential` (second consume notLive).
- Erase: `nodeMultOk_mult0_eq_absent` (no retain).

No single theorem **names** "omega share is not exact-once" as one statement.

---

## 5. Gaps (honest; L0-L9 closed these only as sketched)

| Gap | What exists | What is missing |
|-----|-------------|-----------------|
| **No-heap ELF** | L6 Bool+Nat field reconstruct | ELF / `ldd` / "no GC in binary" is **measure**, not a Lean theorem. Do not close this as a HostCost Name. Next honest layer is a **token transition relation**, still not ELF |
| **Fail-closed after opt** | L5: fuse = check under FS; one spent fixture `native_decide`; `forall hc, check=false -> extract=false` | No general "MULT-1 present /\ !live -> reject" without fixture. No model of a C rewrite; E2 fuse is emit, not a Lean opt pass |
| **Complexity vs n nodes** | `costMultPreScan n = n`; `n <= programCap -> cost <= 8` | Cost n is a **parameter**, not `hc.graph.prog.nodes.length`. No lemma that `multPreScan` performs exactly `nodes.length` looks. Cap bound is hypothetical, not "every Host is <= 8" |
| **Omega share vs exact-once** | Separate suites | No joint contrast lemma |
| **Cost vs executable walk** | Algebra over n | Not tied to `List.all` / `pushHostNode` full |
| **Thin vs compose fuse** | Both definitional | Disagreement on MULT-1 unminted unstated |
| **native_decide surfaces** | `hostCost*Ok_true` | Cosmetic; not a product gap |
| **Wall-clock / PROVABLY speed** | Explicitly refused | Stay refused |

---

## 6. Grow HostCost or split? (Sub-1-KLOC)

**Recommendation: split before the next prove wave.**

| Evidence | Detail |
|----------|--------|
| Lines | 723 / 1000. Room for ~one small lemma cluster, not a second L-wave |
| Precedent | Linear/LinearTheorems, Extract/ExtractTheorems, HostCompose/HostComposeTheorems (same namespace) |
| Header | Already says "Sub-1-KLOC" |
| Import weight | HostCost already imports HostComposeTheorems; more inductive proofs will grow fast |

**Split shape (if operator reopens):**
- Keep `HostCost.lean`: defs, token structure, cost table, surface Bools.
- New `HostCostTheorems.lean`: same namespace `SystemsLean.HostCost`; move
  L1-L9 theorems; land next Names there.
- Wire: `SystemsLean.lean` + host-leans / required-files / host-specs.
- Do **not** mint `ProductPathFreestanding*` kitchen-sink names.

A 50-line lemma add on 723 is still legal; a second 150-line layer is residual
split first.

---

## 7. How to use the lean4 skill here (no mathlib day-one)

Project skill: `.agents/skills/lean4/SKILL.md`. Repo map: `doc/lean4-skill-use.md`.

| Workflow | Fit on this slice |
|----------|-------------------|
| **draft** then **prove** | New `HostCostTheorems` + next lemma headers |
| **formalize** | Informal gap -> named theorem (contrast, walk-length, transition) |
| **autoprove** | Only after statements are frozen; budgeted sorry-fill |
| **review** | After `lake build SystemsLean.HostCost` (and companion) |
| **golf** | Optional: replace `native_decide` surface bools with `rfl`/`decide` |
| **disprove** | If a proposed statement claims ELF, ns/op, or Token elaborator MULT-1 |
| **doctor** | Lake / elaborator breaks only |
| **checkpoint** | Build + axiom scan; **no agent git commit** |

**Repo constraints the skill must obey:**
- C4 **mathlib day-one is a non-goal**. Do not add mathlib, Big-O libraries,
  or `fun x \mapsto` Unicode. Novel Lean is ASCII (`->`, `omega`).
- Tactic cascade that already works here: `rfl`, `simp`, `omega`, `decide`,
  `cases`, `native_decide` for fixtures. No `exact?`/`leansearch` mathlib hunt.
- Do not grow string-printed C. Product wire stays emit SSOT.
- Quality gate remains project `lake` + `just systems-host` / hygiene, not
  skill `lake build` as a claim flip.

Skill-only pass (no `/lean4:*` host commands): one bounded edit cycle, then
stop and suggest guided prove. Prefer that for HostCost: statements are short
Nat/Bool goals, not mathlib analysis.

---

## 8. Theorem table (already proven vs next)

### Already proven (do not re-prove)

| Kind | Names | Class |
|------|-------|-------|
| Exact-once sequential | `mint_consume_exact_once_sequential`, `double_consume_notLive`, HostCost `*_ref` | Host Bool+Nat machine |
| Fuse definitional | `extractOk_eq_checkFailClosed` (thin); `hostCost_extractOkFs_eq_check` (compose) | Structural |
| Fuse Nat | `costExtractOkFs_eq_check_plus_one`, `costFuseNatSavings_eq` (=n), `costFused_le_naive` | Nat algebra |
| Cap cites | programCap=8, edgeMax=16, check+edge=25, `*_le_atCap` | Hypothetical n |
| Mult table | every grade look = 1 | L8 |
| Token fields | LinearHost = {live, id} | L6 model |
| Omega reuse | `shareNat_reuse` | LinearTheorems, not cost |
| Omega-only extract | `multPreScan_omega_only_true` | HostCompose |
| Step twin | `costStepTwinTotal_eq` | Protocol, not ns |

### Not proven (and must stay unclaimed unless a new bar is written)

| Claim | Status |
|-------|--------|
| PROVABLY speed / ns/op | Forbidden |
| No GC in ELF | Measure only (`ldd`/`nm`) |
| FullHost / mathlib elaborator | Held; C4 non-goal |
| Token elaborator MULT-1 | Axioms remain |
| Cost n = live `nodes.length` | **Next-level candidate** |
| Universal spent MULT-1 reject | Fixture only today |

---

## 9. Candidate next Lean Names (checkable; do not auto-open)

Residual Open is **empty done-for-now**. These are 8 Names an operator can
promote. Each has Goal / Done when / Out of scope / Paths. None flip
free / complete / PROVABLY / FullHost.

### 1. HostCost theorems split

| Field | Content |
|-------|---------|
| **Name** | HostCost theorems split |
| **Goal** | Long-file split: theorems leave `HostCost.lean` before the next prove wave. |
| **Done when** | `SystemsLean/HostCostTheorems.lean` same namespace; HostCost stays defs+docs well under 1000; lake `SystemsLean.HostCost` + companion exit 0; SystemsLean import + presence if required; L1-L9 names still greppable. |
| **Out of scope** | New cost lemmas beyond the move; claim flips; mathlib |
| **Paths** | `HostCost.lean`, new `HostCostTheorems.lean`, `SystemsLean.lean`, `nix/systems-host-presence/` |

### 2. Scan cost vs live nodes

| Field | Content |
|-------|---------|
| **Name** | Scan cost vs live nodes |
| **Goal** | Tie `costMultPreScan` to `hc.graph.prog.nodes.length`, not only abstract n. |
| **Done when** | Theorem: `costMultPreScan hc.graph.prog.nodes.length = hc.graph.prog.nodes.length`; optional `costCheckFailClosed` form; lake green; still not wall-clock. |
| **Out of scope** | Prove every Host has length <= 8 (that is `pushHostNode` full, separate); PROVABLY speed |
| **Paths** | HostCostTheorems (or HostCost if still <1000); HostCompose `multPreScan` |

### 3. Omega share exact-once contrast

| Field | Content |
|-------|---------|
| **Name** | Omega share exact-once contrast |
| **Goal** | One named statement: omega reuse is repeatable; MULT-1 live-flag is not. |
| **Done when** | Theorem conjoining `shareNat_reuse` shape with `mint_consume_exact_once_sequential` (or second consume notLive); docs say this is **not** Token LinearCheck. |
| **Out of scope** | Eliminate Linear axioms; ELF; new mult grades |
| **Paths** | HostCostTheorems and/or a thin cite from LinearTheorems + HostComposeTheorems |

### 4. Token transition machine

| Field | Content |
|-------|---------|
| **Name** | Token transition machine |
| **Goal** | Inductive steps on `HostCostTokenState`: empty -> minted -> spent; spent stays spent. Still not ELF. |
| **Done when** | Relation or match lemmas for mint/consume on the Bool+Nat view; second consume stays `live=false`; lake green; header refuses ELF/`ldd`. |
| **Out of scope** | Binary / linker proof; elaborator MULT-1 on `Token` |
| **Paths** | HostCost defs + HostCostTheorems |

### 5. Universal spent reject

| Field | Content |
|-------|---------|
| **Name** | Universal spent reject |
| **Goal** | Strengthen L5: any host with a MULT-1 node and `!linear.live` fails check and fused extract (no one-off fixture). |
| **Done when** | `forall` theorem (simp/cases on `nodeMultOk` / `List.all`, not only `native_decide` fixture); spent fixture becomes an instance; lake green. |
| **Out of scope** | C opt-pass model; emit fuse re-open; claim flips |
| **Paths** | HostCostTheorems; HostCompose `nodeMultOk` / `multPreScan` |

### 6. Thin extract MULT-1 disagreement

| Field | Content |
|-------|---------|
| **Name** | Thin extract MULT-1 disagreement |
| **Goal** | Honesty: thin `Extract.extractOk` MULT-1 FS is true; HostCompose `extractOkFs` on unminted MULT-1 is false. |
| **Done when** | Named theorem (And or two lemmas + join); comments cite intentional Extract gap vs compose close. |
| **Out of scope** | Closing the thin gap; changing Extract `extractOk_mult1_fs_true` |
| **Paths** | HostCostTheorems or ExtractTheorems + HostComposeTheorems cite |

### 7. Omega-only extract cost

| Field | Content |
|-------|---------|
| **Name** | Omega-only extract cost |
| **Goal** | Omega-only graphs pay scan looks and fuse +1, and **zero** mint/consume automaton steps. |
| **Done when** | Theorem: omega-only fixture `costExtractOkFs n = n+2` and automaton not required (`extractOkFs` true without mint); lake green. |
| **Out of scope** | Claiming omega is "free" in ns; new grades |
| **Paths** | HostCostTheorems; HostCompose omega-only fixtures |

### 8. Push-full scan bound

| Field | Content |
|-------|---------|
| **Name** | Push-full scan bound |
| **Goal** | When `pushHostNode` returns full, live node count is at cap so scan cost is `costMultPreScanAtCap`. |
| **Done when** | Lemma relating `HostPushNodeResult.full` (or `nodes.length = programCap`) to `costMultPreScan_le_atCap` / equality at cap; lake green. |
| **Out of scope** | Changing programCap; llvm; wall-clock |
| **Paths** | HostCostTheorems; HostCompose `pushHostNode`; IrProgram `programCap` |

**Suggested order if promoted:** (1) split, then (2) walk-length, (5) universal
spent, (3) omega contrast, (6) thin disagreement, (7) omega-only cost,
(4) transition machine, (8) push-full bound.

---

## 10. Stop rules

- Do not invent Open Names without operator promote (Open is empty done-for-now).
- Do not sell HostCost Nat as freestanding speed or PROVABLY.
- Do not write a Lean "no GC in ELF" theorem.
- Do not add mathlib to close any Name above.
- Prefer lean4 **draft/prove/review** on companion theorems after the split.
)
