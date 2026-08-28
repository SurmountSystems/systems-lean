# Lean-side join points (for coordinator)

Greppable one-liners. Update when this workspace lands slices. Residual board: `RESIDUAL-lean.md`.

| Id | Path | Claim (honest) |
|----|------|----------------|
| MULT-MAP | `src/lean4/multiplicity-map.md` | Lean-side MULT-0/1/OMEGA map + edges ERASE-PROP, RUNTIME-CLASSIC + crosswalk to Idris EDGE-* |
| EX-CONSUME | `src/lean4/examples/ConsumeToken.lean` | Classic Lean dual of algorithm ConsumeToken; not freestanding |
| EX-ERASED | `src/lean4/examples/ErasedIndex.lean` | Classic Lean dual of algorithm ErasedIndex (MULT-0 structure walk); not freestanding |
| EX-SHARE | `src/lean4/examples/UnrestrictedShare.lean` | Classic Lean dual of algorithm UnrestrictedShare (MULT-OMEGA); not freestanding |
| EX-FAIL-CLOSED | `src/lean4/examples/FailClosedGrade.lean` | Classic Lean dual of algorithm FailClosedGrade (unknown Mult tag reject); not freestanding |
| EX-PAIR-SWAP | `src/lean4/examples/LinearPairSwap.lean` | Classic Lean dual of algorithm LinearPairSwap (two MULT-1 resources swap); not freestanding |
| EX-RUNTIME | `src/lean4/examples/RuntimeExtract.lean` | Classic Lean dual of algorithm RuntimeExtract (RUNTIME-FS vs classic/edge); not freestanding |
| EX-AFFINE-DROP | `src/lean4/examples/AffineDrop.lean` | Classic Lean dual of AffineDrop (EDGE-AFFINE honesty); not freestanding; not product affine ABI |
| EX-AFFINE-OWN | `src/lean4/examples/AffineOwn.lean` | Classic Lean dual of AffineOwn (EDGE-AFFINE product ownership deepen); not freestanding; not product affine ABI |
| EX-TRUST | `src/lean4/examples/TRUST.md` | Trusted computing base notes for dual examples; pairs Idris TRUST |
| JOIN-ALG | algorithm ids `ConsumeToken`, `ErasedIndex`, `UnrestrictedShare`, `FailClosedGrade`, `LinearPairSwap`, `RuntimeExtract` | Six host JOIN-ALG-USE foundation duals; paired with Idris under `src/idris2/examples/` |
| JOIN-EDGE | algorithm ids `AffineDrop`, `AffineOwn` | Dual-tree EDGE-AFFINE honesty pairs; not host JOIN-ALG-USE pins; not freestanding product affine ABI |
| CHECK | `just lean-side` / `just lean-elaborate` | Pure Nix presence + optional Lake elaborator when pin installed |
| LAKE | `src/lean4/lakefile.toml`, `lean-toolchain` | Minimal classic Lean package for dual examples (no freestanding claim) |

## Paired status (Idris duals present)

| Join need | Status |
|-----------|--------|
| Idris MULT-MAP | Present at `src/idris2/multiplicity-map.md` |
| Idris EX-CONSUME | Present at `src/idris2/examples/ConsumeToken.idr` |
| Idris EX-ERASED | Present at `src/idris2/examples/ErasedIndex.idr` |
| Idris EX-SHARE | Present at `src/idris2/examples/UnrestrictedShare.idr` |
| Idris EX-FAIL-CLOSED | Present at `src/idris2/examples/FailClosedGrade.idr` |
| Idris EX-PAIR-SWAP | Present at `src/idris2/examples/LinearPairSwap.idr` |
| Idris EX-RUNTIME | Present at `src/idris2/examples/RuntimeExtract.idr` |
| Idris EX-AFFINE-DROP | Present at `src/idris2/examples/AffineDrop.idr` |
| Idris EX-AFFINE-OWN | Present at `src/idris2/examples/AffineOwn.idr` |
| Edge naming | Crosswalk in Lean multiplicity-map; coordinator may merge into `doc/divergence.md` |

## What the Idris side should do next

1. Align MULT-* / EDGE-* with Lean crosswalk if drift appears (Idris residual owns Idris files).
2. Optional real `idris2 --check` gate when toolchain available (`just idris-elaborate`).
3. Stay out of `src/systems/` freestanding body unless reassigned.

## What the coordinator should do next

1. Merge imperfect edges from both JOIN files into `doc/divergence.md` / coordinator residual when ready.
2. Prefer real dual depth over freestanding C emit ladder growth.
3. Steer forks via `doc/fork-guidance-lean.md` / `doc/fork-guidance-idris.md`.

## Non-claims

- Freestanding product residual free
- CompCert PROVABLY
- Formal isomorphism theorem
