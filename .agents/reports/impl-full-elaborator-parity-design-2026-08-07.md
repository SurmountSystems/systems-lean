# Implement report: Full elaborator parity design (R1)

Impl wave id: **efc520d0**
Date: 2026-08-07
SCORE: fail=0

## Name

**Full elaborator parity design**

## Goal

Separate free bar choice (a) host residual free (already claimed F1) from full
Lean 4 / mathlib package typecheck of SystemsLean; publish measured gap list and
honest non-claims; residual Open next only if checkable without forge.

## Done when (evidence)

| # | Requirement | Evidence |
|---|-------------|----------|
| 1 | Research note under `doc/dev/research/` dated 2026-08-07 | `doc/dev/research/full-elaborator-parity-design-2026-08-07.md` (Kind: analysis only) |
| 2 | Free claimed F1 != full elaborator parity; FullHost false; proofCompleteClaimed true orthogonal; Mult..Compose foundation only | Note sections 1-2 explicit |
| 3 | Measured / cited gap list | Note section 4 (HostModuleCheck PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE; seed modules=206 of ~270; without-Lake tools; cold lake diagnostic) |
| 4 | Ordered next Names or held | Note section 5: optional R1a/R1b; held real elaborator / mathlib / LLVM / Rust |
| 5 | Residual lockstep | `RESIDUAL-systems.md` Open empty + Done row; `WATCHER.md` DONE-FOR-NOW; `doc/SESSION-HANDOFF.md` tip; `RESIDUAL.md` join board; surface-matrix Full classic elaborator parity tip reseed |
| 6 | `just hygiene` green | exit 0 (source-hygiene + professional-tone) |
| 7 | No forbidden pin flips | DualResidual free, FullHost, proof complete, product free/complete/PROVABLY, llvm backend **unchanged** |

## Primary paths touched

- `doc/dev/research/full-elaborator-parity-design-2026-08-07.md` (new)
- `RESIDUAL-systems.md`
- `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `RESIDUAL.md`
- `src/systems/surface-matrix.md` (Full classic elaborator parity row tip)
- this report

## Next residual

**DONE-FOR-NOW.** Open empty. Optional R1a check-depth gap inventory / R1b
kind-surface band expand only if operator promotes. Held tracks unchanged.

## Non-claims

Not free flip; not FullHost re-true; not proof complete re-open; not product
free/complete/PROVABLY; not full elaborator parity claim; not full LLVM; not
Rust-native link.

## Gates

```
just hygiene  # exit 0
```
