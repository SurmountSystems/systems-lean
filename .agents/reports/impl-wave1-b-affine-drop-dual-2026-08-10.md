# Implement report: Affine drop dual honesty (Wave 1 Track B)

**Date:** 2026-08-10
**Name:** Affine drop dual honesty
**Scope:** Idris + Lean dual-tree EDGE-AFFINE honesty only. Not freestanding product C. Not full product affine ABI. Not HostModuleCheck*. Pins free/complete/PROVABLY true and FullHost false **unchanged**.

---

## Inventory (before edits)

| Surface | Finding |
|---------|---------|
| Six JOIN-ALG duals | Present both sides: ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap, RuntimeExtract under `src/idris2/examples/` and `src/lean4/examples/` |
| EDGE-AFFINE | Documented in `doc/divergence.md`, both multiplicity maps, product `Linear` AFFINE-NOT-FIRST-CLASS pin; **no** dual pair files before this slice |
| AffineDrop status | Residual / join-map / divergence said **held** until product affine ABI; Wave 1 B promotes **dual honesty** only (not ABI) |
| Host JOIN-ALG-USE | Six host use pins only; intentionally **not** expanded to AffineDrop (not product affine ABI) |
| HostModuleCheck* | Untouched |

---

## What landed

### Dual pair (checkable)

| Side | Path | Role |
|------|------|------|
| Idris | `src/idris2/examples/AffineDrop.idr` | EDGE-AFFINE honesty: pins, unrestricted free-drop contrast, behavioral AffineRes at-most-once sketch, intentional MULT-1 drop non-examples |
| Lean | `src/lean4/examples/AffineDrop.lean` | Classic dual sketch; same contracts; `SystemsLean.LeanBridge.AffineDrop` |

**Greppable honesty tokens (both):** `AffineDrop`, `EDGE-AFFINE`, `AFFINE-NOT-FIRST-CLASS`, `dropAffine`.

**Behavioral sketch (not a fourth Idris grade):** `Live` / `Consumed` / `Dropped` with `useOnce`, `dropAffine`, double-use reject demos. Documents product talk "at most once" vs Idris public grades 0 / exact-once 1 / unrestricted.

### Gates / process glue

| Path | Change |
|------|--------|
| `just/dual-side.just` | `idris-elaborate` checks `AffineDrop.idr` when `idris2` present |
| `src/lean4/lakefile.toml` | `AffineDrop` lean_lib + defaultTargets |
| `nix/idris-side-presence/specs.nix` | required file + content tokens for AffineDrop; JOIN + multiplicity-map tokens |
| `nix/lean-side-presence/specs.nix` | same for Lean dual |

### Honesty docs

| Path | Honesty update |
|------|----------------|
| `doc/divergence.md` | AffineDrop dual **documented**; table row + non-claims (not product affine ABI; not seventh host JOIN-ALG-USE) |
| `src/systems/join-map.md` | Dual path inventory + EDGE-AFFINE documented; full product affine ABI remains held; not joinAlgUseOk |
| `src/idris2/JOIN.md`, `src/lean4/JOIN.md` | EX-AFFINE-DROP + JOIN-EDGE vs six JOIN-ALG foundation |
| Both `multiplicity-map.md` | AffineDrop row; EDGE-AFFINE crosswalk |
| Both `examples/TRUST.md` | AffineDrop listed |

### Not changed (pins / out of scope)

- No `HostModuleCheck*` or product Lean under `src/systems/SystemsLean/` (except `join-map.md` prose)
- No host `joinAlgUseOk` / seventh JOIN-ALG-USE pin
- No freestanding emit C / product affine ABI
- free / complete / PROVABLY / FullHostElaborateRemains **unchanged**

---

## Verification (ran)

| Command | Result |
|---------|--------|
| `just idris-side` | GREEN (10 required paths; jargon ban files=7) |
| `just lean-side` | GREEN (13 required paths; jargon ban files=7) |
| `just idris-elaborate` | GREEN (idris2 not on PATH; skip check; presence still required) |
| `just lean-elaborate` | GREEN (`lake build` lean-side including AffineDrop) |
| `just hygiene` | GREEN (source-hygiene + professional-tone) |

---

## Done when checklist

1. Dual pair files Idris + Lean -- **yes**
2. Dual gates green for new duals -- **yes** (presence + lean-elaborate; idris2 optional skip)
3. divergence.md / join-map AffineDrop dual **documented** honestly -- **yes** (not free/complete forge; not freestanding C)
4. No HostModuleCheck* product Lean edits -- **yes**
5. `just hygiene` green -- **yes**
6. This report -- **yes**

---

## Residual note (closeout mop)

Open Name **Affine drop dual honesty** substance is delivered in dual trees + honesty docs + gates. Residual join / WATCHER / SESSION-HANDOFF lockstep left for coordinator closeout mop per Wave 1 B handoff (report preferred; avoid residual thrash here).

**Non-claims remaining after this dual:** full product affine ABI; host JOIN-ALG-USE for AffineDrop; freestanding affine checks on product wire; isomorphism of Idris and Lean ownership.
