# Implement report: Affine product dual deepen

**Date:** 2026-08-11
**Name:** Affine product dual deepen
**Scope:** Idris + Lean dual-tree EDGE-AFFINE product ownership deepen beyond Wave 1 B AffineDrop. Not freestanding product C. Not full product affine ABI. Not HostModuleCheck* product Lean. Pins free/complete/PROVABLY true and FullHost false **unchanged**.

---

## Inventory (before edits)

| Surface | Finding |
|---------|---------|
| Wave 1 B AffineDrop | Single-resource EDGE-AFFINE honesty pair present both sides |
| Multi-resource MULT-1 | LinearPairSwap covers exact-once pair swap |
| Multi-resource affine product ownership | Missing dual before this slice |
| Host JOIN-ALG-USE | Six host use pins only; EDGE-AFFINE duals intentionally not expanded |

---

## What landed

### Dual pair (checkable)

| Side | Path | Role |
|------|------|------|
| Idris | `src/idris2/examples/AffineOwn.idr` | EDGE-AFFINE product ownership deepen: AffPair, useLeftDropRight, useRightDropLeft, dropBoth, double-use / use-after-drop reject |
| Lean | `src/lean4/examples/AffineOwn.lean` | Classic dual sketch; same contracts; `SystemsLean.LeanBridge.AffineOwn` |

**Greppable honesty tokens (both):** `AffineOwn`, `EDGE-AFFINE`, `AFFINE-NOT-FIRST-CLASS`, `PRODUCT-OWN`, `useLeftDropRight`.

**Deepen vs AffineDrop:** AffineDrop is single live/consumed/dropped inventory. AffineOwn is multi-resource product ownership (two affine resources): keep one payload and drop the other, or drop both unused. Contrast LinearPairSwap (exact once; no free drop) remains documented in module headers.

### Gates / process glue

| Path | Change |
|------|--------|
| `just/dual-side.just` | `idris-elaborate` checks `AffineOwn.idr` when `idris2` present |
| `src/lean4/lakefile.toml` | `AffineOwn` lean_lib + defaultTargets |
| `nix/idris-side-presence/specs.nix` | required file + content tokens for AffineOwn |
| `nix/lean-side-presence/specs.nix` | same for Lean dual |

### Honesty docs

| Path | Honesty update |
|------|----------------|
| `doc/divergence.md` | AffineOwn dual **documented**; table row + JOIN-EDGE + non-claims |
| `src/systems/join-map.md` | Dual path inventory + PRODUCT-OWN deepen; full product affine ABI remains held |
| `src/idris2/JOIN.md`, `src/lean4/JOIN.md` | EX-AFFINE-OWN + JOIN-EDGE AffineOwn |
| Both `multiplicity-map.md` | AffineOwn row; EDGE-AFFINE crosswalk |
| Both `examples/TRUST.md` | AffineOwn listed |
| `RESIDUAL-idris.md`, `RESIDUAL-lean.md` | Done archive + living tip (no thrash of other Open Names) |

### Not changed (pins / out of scope)

- No `HostModuleCheck*` or product Lean under `src/systems/SystemsLean/`
- No host `joinAlgUseOk` / JOIN-ALG-USE pins for AffineOwn
- No freestanding emit C / product affine ABI
- free / complete / PROVABLY / FullHostElaborateRemains **unchanged**

---

## Verification (ran)

| Command | Result |
|---------|--------|
| `just idris-side` | GREEN (11 required paths; jargon ban files=8) |
| `just lean-side` | GREEN (14 required paths; jargon ban files=8) |
| `just idris-elaborate` | GREEN (idris2 not on PATH; skip check; presence still required) |
| `just lean-elaborate` | GREEN (`lake build` lean-side including AffineOwn) |
| `just hygiene` | GREEN (source-hygiene + professional-tone) |

---

## Done when checklist

1. New dual pair Idris + Lean with EDGE-AFFINE / product ownership story -- **yes** (AffineOwn / PRODUCT-OWN)
2. divergence / join-map / dual residual honesty updated -- **yes**
3. just idris-side / lean-side / elaborate / hygiene green -- **yes**
4. free/complete/PROVABLY/FullHost unchanged -- **yes** (no pin edits)
5. This report -- **yes**

---

## Non-claims remaining

- Full product affine ABI on freestanding wire
- Host JOIN-ALG-USE for AffineDrop / AffineOwn
- Freestanding affine checks on product C
- Isomorphism of Idris and Lean ownership
- HostModuleCheck* product Lean for affine
