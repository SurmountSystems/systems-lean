# ParityProgram long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**PARITY-PROGRAM-THEOREM + PARITY-PROGRAM-SMOKE** split into
`SystemsLean.ParityProgramTheorems` (same namespace `SystemsLean.ParityProgram`).

Parent keeps stage ids, product API name defs, `*Ready` bars, and
`programParityOk`. Theorems and behavioral `example` smokes live in the child
module. Pattern matches `ParityEmitTheorems` / `IrGraphTheorems`.

## Before / after

| Path | Lines |
|------|------:|
| `ParityProgram.lean` before | 407 |
| `ParityProgram.lean` after | 231 |
| `ParityProgramTheorems.lean` new | 239 |
| Delta parent | -176 |

## Gates

- `lake build SystemsLean.ParityProgram SystemsLean.ParityProgramTheorems` green
- `just hygiene` green
- `just systems-host` green (new host-presence entry + required-files / host-leans)
- Tip not touched; freestanding-self-host-complete not re-run

## Claims (untouched)

- complete true (SelfHostComplete / SelfApplyFs)
- residual free false
- llvm / PROVABLY false

## Next Open

`ProductPathOwnershipRegenerate long-file split` (cold **390** by `wc -l` among
never-split primaries; skip tip / *Scaffold/*Theorems/*Load/*Bars / CompilePath /
already-split-once).
