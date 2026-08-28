# Implement report: Wave 3 Lean L5-L9 (HostCost deepen + RuntimeBenchLean twin)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** product Lean + residual lockstep. No claim-bool flips.
**ASCII only.** Plain American English.

**Status:** **GREEN**

---

## Goal

Implement residual Names **L5 Fail-closed opt preserve**, **L6 No-heap host machine**,
**L7 Differential fuse model**, **L8 Joint mult cost table**, and **L9 RuntimeBenchLean
step twin** only (Wave 3 Lean track). Leave Track E emit speed E1-E4 for Wave 4.

---

## Done when (met)

| # | Outcome | Evidence |
|---|---------|----------|
| 1 | L5: fused path le naive; fuse preserves fail-closed; spent MULT-1 reject; double-consume ref | Lemmas in HostCost |
| 2 | L6: HostCostTokenState Bool+Nat; LinearHost fields theorem; not ELF docs | Structure + theorems |
| 3 | L7: double-check vs single check+extract Nat differential; savings = n | cost_diff_fuse_vs_double |
| 4 | L8: MULT-0/1/OMEGA node look cost table (each = 1) | costNodeMultByGrade |
| 5 | L9: RuntimeBenchLean stepTwin* aligned with HostCost; main prints step_twin_* | Companion + HostCost |
| 6 | HostCost under 1000 LOC (~723) | `wc -l` |
| 7 | `lake build SystemsLean.HostCost` exit 0 | Gates |
| 8 | `lake build SystemsLean.RuntimeBenchLean` exit 0 | Gates |
| 9 | `just hygiene` + `just systems-host` exit 0 | Gates |
| 10 | Presence tokens OPT-PRESERVE / NO-HEAP / DIFF-FUSE / MULT-TABLE / STEP-TWIN | host-specs-core-1 |
| 11 | Residual L5-L9 **done**; no free/complete/PROVABLY/FullHost forge | Residual lockstep |
| 12 | This report | path below |

---

## L5 -- Fail-closed opt preserve

**Path:** `src/systems/SystemsLean/HostCost.lean`

| Def / theorem | Role |
|---------------|------|
| `costNaiveDoubleCheck` / `costFusedCheckExtract` | Naive 2x check vs fused extract FS |
| `costFused_le_naive` | Cost-reducing rewrite shape |
| `hostCost_fuse_preserves_fail_closed` | extractOkFs = checkFailClosed |
| `hostCost_fuse_preserves_reject` | check false => extract false under fuse |
| `hostCostSpentMult1` fixture + spent check/extract false | Ill mult reject under opt |
| `hostCost_opt_preserves_double_consume_ref` | Re-export double_consume_notLive |
| `hostCostOptPreserveOk` / `_true` | Bool surface |

**Honesty:** Supports E2 wire fuse honesty without wall-clock. Not emit wire fuse.

---

## L6 -- No-heap host machine

| Def / theorem | Role |
|---------------|------|
| `HostCostTokenState` | live : Bool; id : Nat only |
| `hostCostTokenFromLinear` | Project LinearHost |
| `hostCost_linearHost_fields_bool_nat` | LinearHost = {live, id} only |
| `hostCostNoHeapModelOk` / `_true` | Surface |

**Honesty:** Structural host model. **Not** ELF / ldd / "no GC in binary" Lean theorem.
Contrast: RuntimeBenchLean MintCell uses ByteArray (managed RT measure arm).

---

## L7 -- Differential fuse model

| Def / theorem | Role |
|---------------|------|
| `costDoubleCheckPath` | 2 * costCheckFailClosed n |
| `costSingleCheckExtractPath` | costExtractOkFs n (fused) |
| `costFuseNatSavings` / `_eq` | savings = n (check - 1) |
| `costSingleCheckExtractPath_eq_check_plus_one` | Align L3 family |
| `cost_diff_fuse_vs_double` | double = single + savings |
| `costNaiveDoubleCheck_eq_double` | Alias equality |
| `hostCostDiffFuseOk` / `_true` | Surface |

**Honesty:** Nat relation for E2 emit fuse design. Not wall-clock; not product C edit.

---

## L8 -- Joint mult cost table

| Def / theorem | Role |
|---------------|------|
| `costNodeMult0` / `costNodeMult1` / `costNodeMultOmega` | Per-grade look unit (= 1) |
| `costNodeMultByGrade` | Mult -> Nat table |
| `costNodeMultByGrade_eq_one` | All freestanding grades cost 1 look |
| `costMultPreScan_eq_node_looks` | Homogeneous n * unit |
| `costJointMultTableOk` / `_true` | Surface |

**Honesty:** Grades differ in *which* field is inspected (erasure / live / constant), not
Nat step count. No grades beyond MULT-0 / MULT-1 / MULT-OMEGA.

---

## L9 -- RuntimeBenchLean step twin

| Path | Change |
|------|--------|
| HostCost | `costStepTwinMintConsume` / `costStepTwinTotal` (= n * 2) |
| `RuntimeBenchLean.lean` | Import HostCost; `stepTwinMintConsume` / `stepTwinTotal` / lemmas; main prints `step_twin_per_op` / `step_twin_total` / `step_twin_not=wall_clock` |

**Honesty:** Protocol alignment only. Wall-clock remains empirical measure. Not freestanding
product claim change. Not PROVABLY-as-speed.

---

## Wire / presence

- `nix/systems-host-presence/host-specs-core-1.nix`: HOST-COST-OPT-PRESERVE,
  HOST-COST-NO-HEAP, HOST-COST-DIFF-FUSE, HOST-COST-MULT-TABLE, HOST-COST-STEP-TWIN
  + key L5-L9 theorem tokens
- HostCost already imported via SystemsLean.lean (prior waves)
- No dual-ok harness invent; seed/harness **206/99** unchanged

---

## Gates

| Gate | Command | Result |
|------|---------|--------|
| Lake HostCost | `cd src/systems && lake build SystemsLean.HostCost` | **exit 0** |
| Lake RuntimeBenchLean | `cd src/systems && lake build SystemsLean.RuntimeBenchLean` | **exit 0** |
| Hygiene | `just hygiene` | **exit 0** |
| systems-host | `just systems-host` | **exit 0** (315 required paths) |

HostCost **723** lines (under Sub-1-KLOC). RuntimeBenchLean **141** lines.

---

## Pins unchanged

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | true |
| FullHostElaborateRemains | false |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (free bar a) | true |
| tip fullBackend | true A-light |
| band FullBackend | false |
| DominanceClaimed | false |
| seed / harness | 206 / 99 |
| TERM dual-ok | 46 |
| FULLHOST_FLIP | no |

---

## Paths touched

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostCost.lean` | L5-L9 deepen (~397 -> ~723) |
| `src/systems/SystemsLean/RuntimeBenchLean.lean` | L9 step twin + metrics lines |
| `nix/systems-host-presence/host-specs-core-1.nix` | L5-L9 presence tokens |
| `RESIDUAL-systems.md` | L5-L9 done; living Open; Done archive |
| `RESIDUAL.md` | join L5-L9 done; highest value next Wave 4 |
| `.agents/reports/impl-wave3-lean-l5l9-5aac7784-2026-08-12.md` | this report |

---

## Next residual (not this slice)

Open remaining: Track E **E1-E4** (emit speed Wave 4). Track T tools and Track L Lean
**all done** for the perf program. Highest value next: **E1 Mint path inline emit** /
**E2 Compose check extract fuse** (HostCost L5/L7 support E2 honesty).

Do **not** forge free/complete/PROVABLY/FullHost/DominanceClaimed/band FullBackend.
