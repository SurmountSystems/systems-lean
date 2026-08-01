# ProductPathOwnershipRegenerate long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**OWNERSHIP-REGENERATE-THEOREM + OWNERSHIP-REGENERATE-SMOKE** split into
`SystemsLean.ProductPathOwnershipRegenerateTheorems` (same namespace
`SystemsLean.ProductPathOwnershipRegenerate`).

Parent keeps stage ids, Lake-free bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `ParityProgramTheorems` / `DualResidualTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease (theorem
move alone was small; greppable honesty tokens stay on parent for emit-wire).

## Before / after

| Path | Lines |
|------|------:|
| `ProductPathOwnershipRegenerate.lean` before | 390 |
| `ProductPathOwnershipRegenerate.lean` after | 328 |
| `ProductPathOwnershipRegenerateTheorems.lean` new | 304 |
| Delta parent | -62 |

## Gates

- `lake build SystemsLean.ProductPathOwnershipRegenerate SystemsLean.ProductPathOwnershipRegenerateTheorems SystemsLean.ProductPathOwnershipRegenerateMain` green
- `just hygiene` green
- `just systems-host` green (new host-presence entry for Theorems)
- `just systems-emit-wire` green (UNIT_SURFACE RUNTIME-FS on Theorems; also fixed pre-existing IrGraphTheorems / ParityProgramTheorems RUNTIME-FS gaps)
- Tip not primary (SelfApplyFs import only); freestanding-self-host-complete not re-run

## Claims (untouched)

- complete true (SelfHostComplete / SelfApplyFs)
- residual free false
- llvm / PROVABLY false

## Next Open

`StepContractFull long-file split` (cold **382** by `wc -l` among never-split
primaries; ParityMult also **382**; skip tip / *Scaffold/*Theorems/*Load/*Bars/*Main /
CompilePath 458 / CompilePathGraph / already-split-once including OwnershipRegenerate).
