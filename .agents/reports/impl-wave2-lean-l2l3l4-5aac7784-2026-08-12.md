# Implement report: Wave 2 Lean L2 + L3 + L4 (HostCost deepen)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** product Lean + residual lockstep. No claim-bool flips.
**ASCII only.** Plain American English.

**Status:** **GREEN**

---

## Goal

Implement residual Names **L2 Fixed cap complexity**, **L3 Extract fuse cost**, and
**L4 Mint consume automaton** only (Wave 2 Lean track). Leave tools T3/T5/T8 and
L5-L9 / E* for other agents.

---

## Done when (met)

| # | Outcome | Evidence |
|---|---------|----------|
| 1 | L2: scan costs bounded by programCap (8) / edgeMax (16) | Lemmas in HostCost |
| 2 | L3: extract cost >= check; extract = check + 1 under FS | Theorems + HostCompose fuse refs |
| 3 | L4: HostCompose exact-once linked as cost-relevant automaton | Re-export theorems + Nat=3 path |
| 4 | Module under 1000 LOC (~397) | `wc -l HostCost.lean` |
| 5 | `lake build SystemsLean.HostCost` exit 0 | Gates |
| 6 | `just hygiene` + `just systems-host` exit 0 | Gates |
| 7 | Presence tokens for CAP / FUSE / AUTOMATON | `host-specs-core-1.nix` |
| 8 | No dual-ok harness invent; seed/harness 206/99 | No HostModuleCheck companion |
| 9 | Residual L2 L3 L4 **done** only | RESIDUAL-systems / RESIDUAL.md |
| 10 | No free/complete/PROVABLY/FullHost forge | Pins unchanged |
| 11 | This report | path below |

---

## L2 -- Fixed cap complexity

**Path:** `src/systems/SystemsLean/HostCost.lean` (same module as L1)

| Def / theorem | Role |
|---------------|------|
| `hostCostProgramCap` / `_eq` | programCap = 8 (SLAKE_IR_PROGRAM_CAP map) |
| `hostCostEdgeMax` / `_eq` | edgeMax = 16 (SLAKE_IR_EDGE_MAX map) |
| `costEdgeLook` / `costEdgeWalk` / `costEdgeWalkAtCap` | Edge-walk Nat shape |
| `costMultPreScan_le_atCap` | n <= programCap -> scan <= 8 |
| `costCheckFailClosed_le_atCap` | check bounded by cap |
| `costExtractOkFs_le_atCap` | extract FS bounded by cap |
| `costEdgeWalk_le_atCap` | e <= edgeMax -> walk <= 16 |
| `costCheckAndEdgeWalkAtCap_eq` | worst-case check+edge = 25 |
| `costExtractOkFsAtCap_eq` | extract at cap = 10 |

**Honesty:** Nat bounds on fixed-capacity host IR walks. Not freestanding wall-clock.
Not full backend claim.

---

## L3 -- Extract fuse cost

| Def / theorem | Role |
|---------------|------|
| `costExtractFuseDelta` / `_eq` | Fuse delta = 1 (freestanding-goal step only) |
| `costExtractOkFs_eq_check_plus_one` | extract = check + 1 |
| `costExtractOkFs_fuse_shape` | extract = check + fuse delta |
| `costExtractOkFs_sub_check` | extract - check = 1 |
| `costExtractOkFs_ge_check` | (L1 retained) extract >= check |
| `hostCost_extractOk_def_fuse` | HostCompose extractOk = FS-goal && checkFailClosed |
| `hostCost_extractOkFs_eq_check` | under RUNTIME-FS, extractOkFs = checkFailClosed |

**Honesty:** Host model definitional fuse (no second mult pre-scan Nat cost). Supports
later E2 wire fuse honesty. Not emit wire fuse; not wall-clock.

---

## L4 -- Mint consume automaton

| Def / theorem | Role |
|---------------|------|
| `costMintConsumeExactOnceAutomaton` / `_eq` | mint + consume + reject = 3 |
| `costMintConsumeSequential_le_automaton` | success path 2 <= automaton 3 |
| `hostCost_exact_once_sequential_ref` | re-exports HostCompose.mint_consume_exact_once_sequential |
| `hostCost_double_consume_notLive_ref` | re-exports HostCompose.double_consume_notLive |
| `hostCostAutomatonOk` / `_true` | Bool surface for automaton Nat shapes |

**Honesty:** Cost-relevant state machine on host Bool/Nat fields. **Not** a GC-in-ELF
theorem. **Not** elaborator MULT-1 enforcement on Linear.Token axioms.

---

## Wire / presence

- HostCost already imported via `SystemsLean.lean` (Wave 1)
- New imports in HostCost: `HostComposeTheorems`, `Extract`
- `nix/systems-host-presence/host-specs-core-1.nix`: HOST-COST-CAP, HOST-COST-FUSE,
  HOST-COST-AUTOMATON + L2/L3/L4 theorem tokens

**Not done (intentional):** HostModuleCheck dual-ok; seed expand; L5-L9; E1-E4;
wall-clock theorems; PROVABLY-as-speed; GC-in-ELF Lean theorem.

---

## Gates

| Gate | Command | Result |
|------|---------|--------|
| Lake HostCost | `cd src/systems && lake build SystemsLean.HostCost` | **exit 0** |
| Hygiene | `just hygiene` | **exit 0** (ASCII HostCost; professional-tone OK) |
| systems-host | `just systems-host` | **exit 0** (315 required paths) |

No claim-bool flips. Dual-ok harness count **unchanged** (99). HostCost **397** lines
(under Sub-1-KLOC).

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
| `src/systems/SystemsLean/HostCost.lean` | L2/L3/L4 deepen (~171 -> ~397) |
| `nix/systems-host-presence/host-specs-core-1.nix` | CAP/FUSE/AUTOMATON presence tokens |
| `RESIDUAL-systems.md` | L2 L3 L4 done; living Open; Done archive |
| `RESIDUAL.md` | join L2 L3 L4 done; highest value next |
| `.agents/reports/impl-wave2-lean-l2l3l4-5aac7784-2026-08-12.md` | this report |

---

## Next residual (not this slice)

Open remaining: Track T **T3 T5-T9**; Track L **L5-L9**; Track E **E1-E4**.
Highest value next after Wave 2 Lean: tools T3/T5/T8 and/or Wave 3 Lean L5+.
