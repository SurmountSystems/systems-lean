# SurfaceMatrix long-file split -- 2026-07-31

Kind: analysis only. Not residual.

## Summary

Cold split of `SystemsLean/SurfaceMatrix.lean` (**475** lines) into
`SystemsLean/SurfaceMatrixTheorems.lean` (**266** lines). Parent dialect remains
**271** lines. Same namespace `SystemsLean.SurfaceMatrix` so theorem names stay
unqualified. Pattern matches JoinMap / KernelProgram / SpecProof / HostCompose
theorems splits.

## Seam

| Module | Owns |
|--------|------|
| `SurfaceMatrix.lean` | Stage ids, dual cites, row status vocabulary, `matrixSurfaceOk`, `Verdict`, `matrixUnitReady` / `matrixReady` / `matrixProgramReady` / `verdictOf` |
| `SurfaceMatrixTheorems.lean` | `SURFACE-MATRIX-THEOREM` / `HOST-SURFACE-MATRIX-THEOREM` theorems + `SURFACE-MATRIX-SMOKE` examples + path fixtures |

Import edge: Theorems imports SurfaceMatrix; parent does **not** import Theorems
(no cycle). Root `SystemsLean.lean` imports both.

## Before / after

| Path | Lines |
|------|------:|
| SurfaceMatrix.lean (before) | 475 |
| SurfaceMatrix.lean (after) | 271 |
| SurfaceMatrixTheorems.lean (new) | 266 |
| Delta parent | -204 |

## Nix host presence

- `host-leans.nix` / `required-files.nix`: added `SurfaceMatrixTheorems.lean`
- `host-specs-join-surface.nix`: split like JoinMap vs JoinMapTheorems (parent
  dialect tokens; Theorems owns theorem/example structural forms)

## Gates

- `lake build SystemsLean.SurfaceMatrix SystemsLean.SurfaceMatrixTheorems` green
- `just systems-host` green
- `just hygiene` green
- systems-emit-wire skipped (no emit wire token move)
- freestanding-self-host-complete skipped (tip not touched)

## Claims

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

Largest honest still-cold **never-split** primary by `wc` (skip tip 1888; skip
*Scaffold/*Theorems/*Load/*Bars role scaffolds; DualEqWriteApi already split
once; EmitBody already split):

**EmitTypes.lean 466** (then EmitLinear 462, CompilePath 458, SelfHostBody 456).

## Non-claims

Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not proof complete.
Not full dual parity. Not day-one superset complete.
