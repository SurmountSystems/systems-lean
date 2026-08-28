# Residual -- Idris side (`src/idris2/`)

Owned by the Idris-side implement fork (`doc/fork-idris.md`). Coordinator reads this file; it does not drive the Lean side or freestanding treadmill.

**Status vocabulary:** `open` | `in progress` | `done` | `blocked` | `wontfix`

Re-read `doc/fork-guidance-idris.md` at the start of every implement loop.

**Honesty:** green milestones on `doc/PROGRESS.md` are not residual closed. Keep this ledger current.

**Language:** say **Idris side** / **Lean side** / **coordinator**. Do not use banned metaphor names (see `AGENTS.md`).

---

## Done

| Item | Status | Paths |
|------|--------|--------|
| Scaffold README | **done** | `src/idris2/README.md` |
| Multiplicity correspondence (Idris side) | **done** (first cut) | `src/idris2/multiplicity-map.md` |
| Native ConsumeToken + trust notes | **done** | `examples/ConsumeToken.idr`, `TRUST.md` |
| Native ErasedIndex (MULT-0) | **done** | `examples/ErasedIndex.idr` |
| Native UnrestrictedShare (MULT-OMEGA) | **done** | `examples/UnrestrictedShare.idr` |
| Native FailClosedGrade (unknown Mult tag reject) | **done** | `examples/FailClosedGrade.idr` (Phase C 2026-08-08) |
| Native LinearPairSwap (two MULT-1 resources) | **done** | `examples/LinearPairSwap.idr` |
| Native RuntimeExtract (RUNTIME-FS vs classic/edge) | **done** | `examples/RuntimeExtract.idr` |
| Native AffineDrop (EDGE-AFFINE single drop honesty) | **done** (Wave 1 B) | `examples/AffineDrop.idr` |
| Native AffineOwn (EDGE-AFFINE product ownership deepen) | **done** (2026-08-11) | `examples/AffineOwn.idr`; PRODUCT-OWN multi-resource sketches; report `.agents/reports/impl-affine-product-dual-deepen-2026-08-11.md` |
| JOIN greppable join points (JOIN-ALG + EDGE-AFFINE) | **done** | `src/idris2/JOIN.md` (six JOIN-ALG + AffineDrop + AffineOwn) |
| Presence red/green gate | **done** | pure Nix `just idris-side`; optional elaborator `just idris-elaborate` (check.sh deleted) |
| Optional elaborator covers JOIN-ALG + EDGE-AFFINE duals | **done** (2026-08-11) | `just idris-elaborate` runs `idris2 --check` on six JOIN-ALG + AffineDrop + AffineOwn; skip if idris2 missing; RED if present and any dual fails |
| EDGE-* join aliases to Lean map ids | **done** | multiplicity-map Join aliases + JOIN MULT-MAP claim |
| Language pass on Idris-owned surfaces | **done** | no banned jargon in `.idr` modules |

**Living tip (JOIN-ALG):** six JOIN-ALG duals on disk both sides with Lean under `src/lean4/examples/`. EDGE-AFFINE duals: AffineDrop + AffineOwn **documented** (product ownership deepen 2026-08-11). Dual formal map is Systems host **present-partial** (two edges). Full product affine ABI remains **held**.

**LOC honesty:** eight `.idr` dual modules (six JOIN-ALG + two EDGE-AFFINE).

---

## Priority residual (Idris side only)

| Priority | Item | Status | Acceptance / notes |
|----------|------|--------|--------------------|
| 1 | Six native duals (JOIN-ALG) | **done** | ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap, RuntimeExtract + Lean duals |
| 2 | Optional `idris2 --check` path honesty | **done** | skip if missing; RED if present and fails; all six JOIN-ALG `.idr` duals in the loop (2026-08-10) |
| 3 | Wire `idris2` into project devShell for stronger CI | **done** | Flake `devShells.default` includes `pkgs.idris2`; `just idris-elaborate` skips if binary absent outside the shell |
| 4 | Further native duals only when product map needs them | **held** (operator promote) | Six JOIN-ALG + AffineDrop + AffineOwn EDGE-AFFINE duals landed; do not pad LOC; further algorithm ids only with product map need and Lean dual |
| 5 | Merge imperfect edges into `doc/divergence.md` | **done** (coordinator) | Greppable imperfect edges merged under `doc/divergence.md` section **Greppable imperfect edges (dual pair)**; join board `RESIDUAL.md` Join done row |

---

## Not this fork

- `src/lean4/**` product edits (read-only for dual check)
- `src/systems/` freestanding Slake body
- `out/llvm-ir`, CompCert PROVABLY claims
- Git commits
- Freestanding C emit as substitute for Idris depth

---

## Highest-value next (after this ledger)

1. **Systems finish program:** Package 1 **Full backend claim true** under
   `src/systems/` (not Idris-fork duty; not more dual invent unless map needs it).
2. **Idris side:** only new duals when a named correspondence gap requires them
   (AffineDrop / AffineOwn dual honesty documented; full product affine ABI held).
3. **Bridge formal work** lives on Lean residual (L-FORMAL-ISO), not more Idris sketches.

---

## Next residual implement prompt (Idris side)

```
blocked (Idris side): dual depth residual for this fork is current
(six JOIN-ALG: ConsumeToken, ErasedIndex, UnrestrictedShare, FailClosedGrade,
LinearPairSwap, RuntimeExtract). Further duals held (operator promote).
Imperfect edges coordinator merge is done (doc/divergence.md).
idris2 is in flake devShell.
Do not invent more examples without a named map gap.
Do not edit src/lean4 or src/systems. Follow AGENTS.md language rules.
```
