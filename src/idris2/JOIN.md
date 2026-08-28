# Idris-side join points (for coordinator)

Greppable one-liners. Update when this side lands slices.

| Id | Path | Claim (honest) |
|----|------|----------------|
| MULT-MAP | `src/idris2/multiplicity-map.md` | Idris MULT-0/1/OMEGA map + edges EDGE-NAME, EDGE-PROP, EDGE-AFFINE, EDGE-RUNTIME, EDGE-CLASSIC-LEAN; aliases ERASE-PROP, RUNTIME-CLASSIC, RUNTIME-FS |
| EX-CONSUME | `src/idris2/examples/ConsumeToken.idr` | Native Idris ConsumeToken with (1 t) LinearCheck surface; not freestanding |
| EX-ERASED | `src/idris2/examples/ErasedIndex.idr` | Native Idris ErasedIndex MULT-0 length/index patterns; not freestanding |
| EX-SHARE | `src/idris2/examples/UnrestrictedShare.idr` | Native Idris UnrestrictedShare MULT-OMEGA copy/drop/multi-use; not freestanding |
| EX-FAIL-CLOSED | `src/idris2/examples/FailClosedGrade.idr` | Native Idris FailClosedGrade unknown Mult tag reject; not freestanding |
| EX-PAIR-SWAP | `src/idris2/examples/LinearPairSwap.idr` | Native Idris LinearPairSwap two MULT-1 resources swap; not freestanding |
| EX-RUNTIME | `src/idris2/examples/RuntimeExtract.idr` | Native Idris RuntimeExtract RUNTIME-FS vs classic/edge; not freestanding |
| EX-AFFINE-DROP | `src/idris2/examples/AffineDrop.idr` | EDGE-AFFINE honesty dual (single affine at-most-once vs Idris public grades); not freestanding; not product affine ABI |
| EX-AFFINE-OWN | `src/idris2/examples/AffineOwn.idr` | EDGE-AFFINE product ownership deepen (two affine resources; PRODUCT-OWN); not freestanding; not product affine ABI |
| EX-TRUST | `src/idris2/examples/TRUST.md` | Trusted computing base notes for dual examples |
| JOIN-ALG | algorithm ids `ConsumeToken`, `ErasedIndex`, `UnrestrictedShare`, `FailClosedGrade`, `LinearPairSwap`, `RuntimeExtract` | Six host JOIN-ALG-USE foundation duals; mirror Lean side under `src/lean4/examples/` |
| JOIN-EDGE | algorithm ids `AffineDrop`, `AffineOwn` | Dual-tree EDGE-AFFINE honesty pairs; not host JOIN-ALG-USE pins; not freestanding product affine ABI |
| CHECK | `just idris-side` / `just idris-elaborate` | Pure Nix presence + optional idris2 --check process glue |

## What Lean side should do next

1. Keep duals of EX-CONSUME / EX-ERASED / EX-SHARE / EX-FAIL-CLOSED / EX-PAIR-SWAP / EX-RUNTIME / EX-AFFINE-DROP / EX-AFFINE-OWN matched on algorithm ids.
2. Keep ERASE-PROP / RUNTIME-* / EDGE-AFFINE greppable; optional note of EDGE-* aliases from Idris map.
3. Stay out of `src/systems/` freestanding body unless reassigned.

## Coordinator

Join imperfect edges into residual / `doc/divergence.md` when both sides greppable. Prefer listing both EDGE-* and ERASE-*/RUNTIME-* ids. Dual depth (multiple algorithm ids) is now the join bar -- not a single example forever.
