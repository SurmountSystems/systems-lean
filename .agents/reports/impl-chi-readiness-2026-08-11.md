# Implement report -- T0 CHI readiness (Idris-Lean and Lean-Rust)

**Date:** 2026-08-11
**Tree:** `/home/hunter/Projects/ai/iso`
**Status:** GREEN
**Residual:** CHI readiness (Idris-Lean and Lean-Rust) -- **done**

---

## Goal

Cross-host integrity (CHI): all correspondence interfaces finished and ready under
the honesty bar -- dual gates green, living tips lockstep, value prose polished.
Do **not** forge full isomorphism of Idris with Lean or Systems Lean with all of Rust.

---

## Gates (observed exit codes)

| Command | Exit | Notes |
|---------|------|-------|
| `just idris-side` | **0** | 11 required paths; content tokens; jargon ban files=8 |
| `just lean-side` | **0** | 14 required paths; content tokens; jargon ban files=8 |
| `just systems-llvm-ir` | **0** | 186 required paths; hold unlock true; Mult..Graph foreign + DF + rust interop presence; DominanceClaimed false; band FullBackendClaimed false |
| `just rust-ir-interop-partial` | **0** | lake RustIrInterop + Mult-class /tmp rustc dogfood GREEN (size=4 align=4) |
| `just rust-ir-interop-full` | **0** | lake + multi-band Mult+Linear+Types+Program+Graph /tmp rustc dogfood GREEN |
| `just hygiene` | **0** | after prose + residual lockstep (ASCII + professional tone) |

No product Lean claim-bool flips. No product Rust under `src/`.

---

## Living tip pins (unchanged)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed | **false** |
| band FullBackend | **false** |
| seed / harness | **206** / **59** |
| formal dual-map | **present-partial** (two edges) |
| rustIrInteropPartialClaimed / FullClaimed | **true** / **true** (measured under named bars) |

---

## What CHI readiness means (plain English)

1. **Idris-Lean JOIN-ALG:** six real dual pairs on both sides; AffineDrop + AffineOwn
   EDGE-AFFINE dual-tree honesty **documented** (not freestanding product affine ABI);
   pure Nix presence gates green; formal host map remains present-partial.
2. **Lean-Rust:** Mult..Graph layout size/align parity, band-local foreign success,
   joint partial + multi-band full dual-pins green under named bars.
3. **Not claimed:** isomorphism complete; "Idris equals Lean"; formalization of all of
   rustc; product Rust under `src/`; freestanding product affine ABI shipped; FullHost
   true; DominanceClaimed true.

---

## Prose lockstep (lag fixed)

| Path | Change |
|------|--------|
| `README.md` | Living tip date 2026-08-11; dual maps marked CHI ready; gate table adds idris-side / lean-side / systems-llvm-ir; AffineDrop dual held -> freestanding product affine ABI held (dual-tree documented) |
| `doc/goals.md` | Dual rows CHI ready + gate names; Dual map status CHI readiness section; Must-not-claim list expanded |
| `src/systems/join-map.md` | CHI readiness one-liner on dual map value |
| `doc/divergence.md` | JOIN-ALG section CHI readiness lead-in |
| `doc/rust-entry.md` | Lean-Rust CHI readiness lead-in under value section |
| `doc/SESSION-HANDOFF.md` | Dual maps CHI ready; Open T1-T5; T0 done + report path |
| `RESIDUAL-systems.md` | T0 removed from Open; Done archive row; living tip Next product work T1-T5 |
| `RESIDUAL.md` | T0 done in Open Names + archive; living tip T1-T5 |
| `WATCHER.md` | Multi-track T1-T5; T0 done note |

JOIN maps under `src/idris2/JOIN.md` and `src/lean4/JOIN.md` already list six JOIN-ALG
ids + AffineDrop/AffineOwn; no invent duals this slice.

---

## Out of scope (honored)

- HostModuleCheck package-env (T1)
- FullHost flip (T2)
- New TERM units (T3)
- DominanceClaimed forge (T4)
- Product Rust under `src/`
- Git commit
- Full isomorphism forge

---

## Primary paths touched

```
README.md
doc/goals.md
doc/divergence.md
doc/rust-entry.md
doc/SESSION-HANDOFF.md
src/systems/join-map.md
RESIDUAL-systems.md
RESIDUAL.md
WATCHER.md
.agents/reports/impl-chi-readiness-2026-08-11.md
```

---

## Summary

**GREEN.** Correspondence interfaces are ready under the honesty bar: all listed dual
and Lean-Rust gates exit 0; living tips lockstep; value prose polished; free/complete/
PROVABLY true and FullHost/DominanceClaimed false unchanged. Not full isomorphism.

---

*Implementer report. T0 closed. Next Open: T1-T5 (WATCHER multi-track).*
