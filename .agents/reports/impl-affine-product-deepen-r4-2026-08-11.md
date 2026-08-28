# Implement report: Affine product deepen (R4)

**Date:** 2026-08-11
**Name:** Affine product deepen (R4)
**Decision:** Honest sufficient closeout -- no third dual invent.
**Scope:** Dual inventory + residual/docs lockstep only. No HostModuleCheck*. No Llvm*.
Pins free/complete/PROVABLY true and FullHost false **unchanged**. DominanceClaimed false.

ASCII only. Plain American English.

---

## Decision algorithm (ran)

1. Inventory whether a product-meaningful next affine dual exists that is not theater.
2. Prefer a small honest dual pair if one is available.
3. Else honest closeout with evidence that AffineDrop + AffineOwn are sufficient.

**Result:** step 3 -- honest closeout.

---

## Inventory of affine / ownership dual surface

| Dual | Role | Product meaning | Status |
|------|------|-----------------|--------|
| **AffineDrop** | Single-resource EDGE-AFFINE | Live / use once / drop unused | **Present** both sides |
| **AffineOwn** | Multi-resource PRODUCT-OWN | AffPair: use-one-drop-other, drop both, reject double-use / use-after-drop | **Present** both sides |
| **LinearPairSwap** | Two MULT-1 resources | Exact once; no free drop (contrast to affine) | Present (JOIN-ALG) |
| **ConsumeToken** | Single MULT-1 | Mint/consume exact once | Present (JOIN-ALG) |
| **UnrestrictedShare** | MULT-OMEGA | Free multi-use / drop | Present (JOIN-ALG) |

### Candidates rejected as non-product or theater

| Candidate | Why rejected |
|-----------|----------------|
| AffineShare / AffineCopy | Freestanding linear story forbids inventing shareable affine as product dual; would rebrand MULT-OMEGA / GC theater. UnrestrictedShare already covers free multi-use. |
| AffTriple / N-tuple AffPair | Same PRODUCT-OWN story as AffPair with more components; no new ownership rule. |
| AffineBorrow | Temporary loan without transfer. No product residual opens freestanding borrow ABI; would invent scope. |
| Host JOIN-ALG-USE for AffineDrop/Own | Held on purpose; not dual-tree invent. Prior AffineOwn report: host pins intentionally not expanded. |
| Full freestanding product affine ABI | Held until operator opens product wire residual; not a dual-tree Name. |

### Product freestanding grade story (unchanged)

Systems Lean freestanding minimum grades remain **0 / 1 / omega**. Product **talk** includes affine (at most once) as EDGE-AFFINE honesty. Idris public grades have no first-class affine (`AFFINE-NOT-FIRST-CLASS`). Dual sketches document the edge; they do not ship freestanding affine ABI.

---

## Why AffineDrop + AffineOwn are sufficient

| Layer | Covered by |
|-------|------------|
| At-most-once single inventory (drop or use once; reject double-use) | AffineDrop |
| Multi-resource ownership choices (keep one payload and drop the other; drop both unused; fail closed after drop/use) | AffineOwn |
| Exact-once contrast (no free drop) | LinearPairSwap / ConsumeToken |
| Free multi-use contrast | UnrestrictedShare |

There is no remaining dual-tree gap that is both (a) product-meaningful for freestanding ownership and (b) not already covered or held as product ABI work. R4 Done when allows honest closeout with why; this report is that evidence.

---

## What landed this slice

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | R4 removed from Open; Done archive entry; living tip / Living Open four Names |
| `RESIDUAL.md` | Systems Open join: R4 done; four open; ranked next without R4 |
| `WATCHER.md` | Multi-track R1/R2/R3/R5 only; R4 closed note |
| `doc/SESSION-HANDOFF.md` | Active open: four Names; R4 closed |
| `src/systems/join-map.md` | EDGE-AFFINE dual pair sufficient paragraph |
| `doc/divergence.md` | R4 sufficient pair honesty + non-claim third dual |
| This report + `/tmp` summary | Evidence |

### Not changed

- No new files under `src/idris2/examples` or `src/lean4/examples`
- No dual-side pure Nix token edits (no new duals)
- No HostModuleCheck* / package-env (R1)
- No Llvm* / systems-llvm-ir (R5)
- free / complete / PROVABLY / FullHostElaborateRemains / DominanceClaimed / band FullBackend **unchanged**

---

## Done when checklist

| # | Outcome | Met |
|---|---------|-----|
| 1 | Dual pair files **or** honest closeout residual with why | **yes** (honest closeout) |
| 2 | dual-side Nix if duals added | **n/a** (no duals) |
| 3 | residual lockstep | **yes** |
| 4 | free/complete/PROVABLY/FullHost unchanged | **yes** |
| 5 | hygiene | **yes** (see gates) |
| 6 | report under `.agents/reports/` | **yes** |

---

## Gates

| Command | Result |
|---------|--------|
| `just hygiene` | **GREEN** (source-hygiene 1128 files; professional-tone 541 md) |

---

## Non-claims remaining (still held)

- Full product affine ABI on freestanding wire
- Host JOIN-ALG-USE pins for AffineDrop / AffineOwn
- Isomorphism of Idris and Lean ownership
- Free invent of third EDGE-AFFINE dual without product need
