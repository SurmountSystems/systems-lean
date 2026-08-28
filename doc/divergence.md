# Divergence

Honest differences between sides of the meet-in-the-middle bridge.
The point of this document is to prevent false "they're the same" claims.

Related: [vocabulary.md](vocabulary.md), [architecture.md](architecture.md), [idris-entry.md](idris-entry.md), [lean-entry.md](lean-entry.md).

---

## Erasure and multiplicity

| Concern | Idris 2 | Lean 4 (classic) | Systems Lean / Slake goal |
|---------|---------|------------------|---------------------------|
| Erasure model | Multiplicity **0** on binders; quantities visible in types/holes | **Prop** vs **Type**; proof erasure; not full Idris-style 0/1/omega on every binder | QTT **0 / 1 / omega** first-class on freestanding path |
| Linearity | Multiplicity **1** + linear libraries + LinearCheck | No full Idris-style linear core | Linear/affine checks on product-relevant resources |
| Unrestricted | Unrestricted quantity (omega-class) | Ordinary runtime values under RC | Multiplicity **omega** for ordinary data |

**Imperfect edges (expected):**

- Lean `Prop` erasure is not identical to Idris multiplicity `0` in all cases.
- "Same algorithm in both languages" does not imply the same runtime residual.
- A correspondence table is progressive work -- document known mismatches; do not paper over them.

---

## Runtime and product wire

| Path | Runtime on the wire | Honest residual |
|------|---------------------|-----------------|
| Idris **RefC** | C + reference-counting support | Managed RC remains in trusted computing base |
| Idris Scheme backends | Scheme runtime | Not freestanding bare metal |
| Classic Lean **AOT** | Lean object runtime / shared libs | Managed runtime remains in trusted computing base |
| **Freestanding** product goal | No Lean managed runtime on product wire | Host elaborator may still use managed runtime until residual is **earned** |

**Never claim** that RefC or classic Lean AOT is freestanding.

---

## Compiler architecture shapes

### Idris 2 (high level)

Source -> desugar -> TTImp elaboration -> core **TT** (multiplicities) -> linear check -> compile (case trees / ANF / VMCode) -> backend (Chez, Racket, Gambit, JS, RefC).

Entry: `ref/Idris2/docs/source/implementation/overview.rst`.

### Lean 4 (high level)

Source -> elaborator -> kernel-checked environment -> AOT / interpreter; Lake for packages; optional classic LLVM work is not freestanding Systems product codegen by default.

Entry: `ref/lean4/README.md`, `ref/lean4/doc/`.

### Slake (intended)

Systems Lean host implements shared core checks + freestanding extract + CompCert and LLVM backends. Surface grows toward superset of both sides under progressive gates.

---

## Proof vs runtime split

| Tradition | Typical split |
|-----------|----------------|
| Idris | Programs and proofs share QTT; quantities decide runtime presence |
| Lean | Heavy proof ecosystem; extract/AOT still often carries runtime residual |
| Slake goal | Host proofs erased from product trusted computing base; product wire freestanding; dual residual honesty |

---

## What "isomorphism" does *not* mean here

- Not "byte-identical compilers."
- Not "every Lean theorem is an Idris program and vice versa on day one."
- Not "marketing isomorphism" without a written map and tests.

It means a **deliberate correspondence** of core notions (types, proofs, multiplicities, extract) that both sides can meet, implemented and checked in Slake over time.

---

## Greppable imperfect edges (dual pair)

Coordinator join of imperfect edges from both side multiplicity maps and JOIN files.
Sources (read-only for this section): `src/idris2/multiplicity-map.md`, `src/lean4/multiplicity-map.md`,
`src/idris2/JOIN.md`, `src/lean4/JOIN.md`. Dual example algorithm id: **ConsumeToken**.

This is a **working map with listed exceptions**, not a formal isomorphism and not freestanding residual free.

### Shared multiplicity row ids

| Id | Topic | Both sides |
|----|--------|------------|
| MULT-0 | Erased / compile-time-only | Same greppable id on Idris and Lean maps |
| MULT-1 | Use-once / linear | Same greppable id; classic Lean is sketch until Systems Lean mult-1 host |
| MULT-OMEGA | Unrestricted / ordinary data | Same greppable id; labels differ (see EDGE-NAME) |

### Edge aliases (keep both naming families greppable)

| Idris-named id | Lean-named id | One-line meaning |
|----------------|---------------|------------------|
| EDGE-PROP | ERASE-PROP | Lean `Prop` erasure is not the same mechanism as Idris quantity 0 |
| EDGE-RUNTIME | RUNTIME-CLASSIC | Stock hosts leave managed runtime in the trusted computing base |
| EDGE-CLASSIC-LEAN | RUNTIME-FS (product goal; see note) | Not a single clean 1:1 alias -- overloaded across side maps (below) |

**EDGE-CLASSIC-LEAN honesty (not 1:1 yet):** this id carries more than one sense until sides normalize naming.

1. **Classic Lean binder-algebra gap** -- stock Lean has no full Idris-style 0/1/omega binder algebra; Lean duals remain sketches until Systems Lean mult checks are host.
2. **RUNTIME-FS (product goal)** -- freestanding product C is out of scope for side forks; lives under `src/systems/` later. Idris map aliases EDGE-CLASSIC-LEAN partly to this out-of-scope freestanding goal.
3. **Lean crosswalk co-name with RUNTIME-CLASSIC** -- Lean map also attaches EDGE-CLASSIC-LEAN to EDGE-RUNTIME / RUNTIME-CLASSIC (managed runtime residual on stock hosts). Greppable on both maps; do not collapse to one clean pairing yet.

### Idris-named edges (Lean may lack dedicated rows)

| Id | Meaning |
|----|---------|
| EDGE-NAME | Join docs say **omega**; Idris users say **unrestricted** / compiler `RigW`. Same three-way shape, different labels. |
| EDGE-AFFINE | Systems Lean product talk includes affine (at most once). Idris public grades are 0 / exact-once 1 / unrestricted -- no first-class affine quantity. |

### Dual example join (JOIN-ALG -- six algorithm ids + EDGE-AFFINE duals)

**CHI readiness (2026-08-11):** Idris-Lean JOIN-ALG correspondence interfaces are
ready under the honesty bar -- six real dual pairs, EDGE-AFFINE dual-tree
honesty documented, pure Nix presence gates green (`just idris-side`,
`just lean-side`) -- without claiming full formal isomorphism.

All six JOIN-ALG algorithm ids have a real Idris source and a real Lean source.
**AffineDrop** and **AffineOwn** are separate dual-tree EDGE-AFFINE honesty pairs
(not host JOIN-ALG-USE pins). Paths below. This is a working dual map, not a
finished proof that the two languages are the same.

| Algorithm id | Grade / focus | Idris side | Lean side |
|--------------|---------------|------------|-----------|
| **ConsumeToken** | MULT-1 linear token mint and consume | `src/idris2/examples/ConsumeToken.idr` | `src/lean4/examples/ConsumeToken.lean` |
| **ErasedIndex** | MULT-0 erased length / index | `src/idris2/examples/ErasedIndex.idr` | `src/lean4/examples/ErasedIndex.lean` |
| **UnrestrictedShare** | MULT-OMEGA unrestricted share | `src/idris2/examples/UnrestrictedShare.idr` | `src/lean4/examples/UnrestrictedShare.lean` |
| **FailClosedGrade** | unknown Mult tag reject | `src/idris2/examples/FailClosedGrade.idr` | `src/lean4/examples/FailClosedGrade.lean` |
| **LinearPairSwap** | two MULT-1 resources swap | `src/idris2/examples/LinearPairSwap.idr` | `src/lean4/examples/LinearPairSwap.lean` |
| **RuntimeExtract** | RUNTIME-FS vs classic / edge extract | `src/idris2/examples/RuntimeExtract.idr` | `src/lean4/examples/RuntimeExtract.lean` |
| **AffineDrop** | EDGE-AFFINE honesty (single affine at most once vs Idris public grades) | `src/idris2/examples/AffineDrop.idr` | `src/lean4/examples/AffineDrop.lean` |
| **AffineOwn** | EDGE-AFFINE product ownership deepen (two affine resources; use one drop other; drop both) | `src/idris2/examples/AffineOwn.idr` | `src/lean4/examples/AffineOwn.lean` |

| Supporting | Path / claim |
|------------|----------------|
| JOIN-ALG (greppable id) | Six foundation names above; both JOINs under `src/idris2/JOIN.md` and `src/lean4/JOIN.md` |
| JOIN-EDGE AffineDrop | Dual-tree EDGE-AFFINE honesty; **documented** (2026-08-10 Wave 1 B); not host JOIN-ALG-USE; not freestanding affine ABI |
| JOIN-EDGE AffineOwn | Product ownership deepen of EDGE-AFFINE; **documented** (2026-08-11); multi-resource PRODUCT-OWN sketches; not host JOIN-ALG-USE; not freestanding affine ABI |
| EX-TRUST (Idris side) | `src/idris2/examples/TRUST.md` -- trusted computing base notes for the dual |
| EX-TRUST (Lean side) | `src/lean4/examples/TRUST.md` -- trusted computing base notes for the dual |

**Honesty:** dual examples are managed-host sketches (or native Idris under a stock backend). They are **not** freestanding product C. Classic Lean duals do **not** enforce exact-once use the way Idris LinearCheck does. Host formal map of dual uses is **present-partial** (two named edges on the Systems host), not isomorphism complete. **AffineDrop** documents single-resource EDGE-AFFINE: product talk includes affine (at most once); Idris public grades have no first-class affine quantity (`AFFINE-NOT-FIRST-CLASS`). **AffineOwn** deepens that with multi-resource product ownership (`PRODUCT-OWN`: use-one-drop-other, drop both). Behavioral sketches are not freestanding product affine ABI.

**R4 sufficient pair (2026-08-11):** AffineDrop + AffineOwn are the sufficient product EDGE-AFFINE dual-tree pair for dual honesty. Single-resource inventory plus multi-resource ownership choices cover freestanding affine product talk without inventing share/copy duals (MULT-OMEGA already has UnrestrictedShare) or freestanding affine ABI. Next affine work is product residual on freestanding wire / JOIN-ALG-USE only if operator opens it -- not a third dual-tree theater Name.

### What this section does not claim

- Freestanding product residual free of managed runtime (product residual free is a separate Systems claim elsewhere)
- That dual examples equal freestanding emit under `out/freestanding-c`
- CompCert PROVABLY as a dual-side property
- Complete formal isomorphism of erasure or runtime models ("Idris = Lean")
- Full product affine ABI on freestanding wire or host JOIN-ALG-USE pins for AffineDrop / AffineOwn
- A third EDGE-AFFINE dual beyond AffineDrop+AffineOwn without product affine ABI residual
- Permission for side forks to implement freestanding body under `src/systems/`

---

## Isolation note

This document compares **upstream refs** and **Systems Lean** goals. It does not require browsing residual mills in other trees. Keep divergence notes here.
