# Implement report: Wave 1 Lean L0 + L1 (perf-prove map + HostCost)

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** product Lean + research map + residual lockstep. No claim-bool flips.
**ASCII only.** Plain American English.

**Status:** **GREEN**

---

## Goal

Implement residual Names **L0 Perf-prove user map** and **L1 Host cost steps** only
(Wave 1 Lean track). Leave T1/T2/T4 and other Tracks for parallel agents.

---

## Done when (met)

| # | Outcome | Evidence |
|---|---------|----------|
| 1 | L0 research note on disk | `doc/dev/research/perf-prove-user-map-2026-08-12.md` |
| 2 | Map: HostCost/structural vs bench-runtime; PROVABLY = CompCert only; no GC-in-ELF theorem | Sections in user map |
| 3 | `SystemsLean/HostCost.lean` Nat mint/consume + check/extract shapes + simple lemmas | Module under 1000 LOC (~170) |
| 4 | SystemsLean import + pure Nix presence (leans / required / host-spec) | Surgical dual-pin |
| 5 | `lake build SystemsLean.HostCost` exit 0 | See Gates |
| 6 | No dual-ok harness invent; seed/harness 206/99 | HostCost alone; no HostModuleCheck companion |
| 7 | Residual L0 L1 **done**; T1/T2/T4 not marked done | `RESIDUAL-systems.md`, `RESIDUAL.md` |
| 8 | WATCHER multi-track honest (Lean done; tools open) | `WATCHER.md` |
| 9 | No free/complete/PROVABLY/FullHost forge | Pins unchanged |
| 10 | This report | path below |

---

## L0 -- Perf-prove user map

**Path:** `doc/dev/research/perf-prove-user-map-2026-08-12.md`

Plain American English split:

| Class | Meaning |
|-------|---------|
| PROVABLY | CompCert product matrix wire correctness only |
| Speed | Empirical `just bench-runtime` / living `doc/BENCH-RUNTIME-latest.md` |
| Structural cost | HostCompose exact-once + HostCost Nat steps; not wall-clock; not GC-in-ELF |

Cites explore reports and residual after land.

---

## L1 -- Host cost steps

**Path:** `src/systems/SystemsLean/HostCost.lean`

| Def / theorem | Role |
|---------------|------|
| `costMintStep` / `costConsumeStep` | Unit Nat steps for mint/consume shapes |
| `costMintConsumeSequential` + `_eq` | Sequential exact-once path = 2 |
| `costMultPreScan` / `costCheckFailClosed` | Compose check shape over n nodes |
| `costExtractOkFs` + `_eq` / `_ge_check` | Extract under FS = goal step + check; ge check |
| `costMultPreScanAtCap_eq` / `costCheckFailClosedAtCap_eq` | Cap cite (programCap = 8) |
| `hostCostEdgeMax_eq` | edgeMax = 16 cite for L2 |
| `hostCostSurfaceOk` / `_true` | Bool surface ready by construction |

**Wire:**

- `import SystemsLean.HostCost` in `src/systems/SystemsLean.lean`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-core-1.nix` (HOST-COST tokens)

**Not done (intentional):** HostModuleCheck dual-ok companion; seed 206 expand;
wall-clock theorems; PROVABLY-as-speed.

---

## Gates

| Gate | Command | Result |
|------|---------|--------|
| Lake HostCost | `cd src/systems && lake build SystemsLean.HostCost` | **exit 0** (Built SystemsLean.HostCost; 9 jobs) |
| Hygiene | `just hygiene` | **exit 0** (ASCII scrub fixed `<=` in HostCost; professional-tone OK) |
| systems-host | `just systems-host` | **exit 0** (315 required paths; HostCost presence) |

No claim-bool flips (no lake claim exe required). Dual-ok harness count **unchanged** (99).

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
| `doc/dev/research/perf-prove-user-map-2026-08-12.md` | **new** L0 map |
| `src/systems/SystemsLean/HostCost.lean` | **new** L1 module |
| `src/systems/SystemsLean.lean` | import HostCost |
| `nix/systems-host-presence/host-leans.nix` | HostCost path |
| `nix/systems-host-presence/required-files.nix` | HostCost path |
| `nix/systems-host-presence/host-specs-core-1.nix` | HostCost presence tokens |
| `RESIDUAL-systems.md` | L0 L1 done; Living Open; Done archive |
| `RESIDUAL.md` | join L0 L1 done; highest value next |
| `WATCHER.md` | multi-track: Lean Wave 1 done; tools open |
| `doc/SESSION-HANDOFF.md` | Active open L0 L1 done |
| `.agents/reports/impl-wave1-lean-l0l1-5aac7784-2026-08-12.md` | this report |

---

## Out of scope (honored)

- T1 / T2 / T4 (other agent multi-track)
- L2-L9, E1-E4
- Wall-clock / PROVABLY speed theorems
- FullHost / mathlib invent
- Dual-ok harness invent for HostCost
- Git add / commit
- free/complete/PROVABLY/FullHost claim flips

---

## Residual lockstep

- `RESIDUAL-systems.md`: L0 and L1 status **done** with Status detail; Living Open updated
- `RESIDUAL.md`: L0 L1 rows **done**
- `WATCHER.md`: Wave 1 Lean done; tools still open; `/implement` points at T1 (or peers)
- `doc/SESSION-HANDOFF.md`: Active open table L0 L1 **done**

---

## Next

Wave 1 tools (T1 T2 T4) if still open; Wave 2 Lean **L2 Fixed cap complexity**
(lemmas on HostCost + programCap/edgeMax). Do not forge pins.
