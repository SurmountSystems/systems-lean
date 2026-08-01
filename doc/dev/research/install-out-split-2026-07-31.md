# InstallOut long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

INSTALL-OUT-THEOREM / HOST-INSTALL-OUT-THEOREM + INSTALL-OUT-SMOKE /
HOST-INSTALL-OUT-SMOKE moved to `SystemsLean.InstallOutTheorems`
(same namespace `SystemsLean.InstallOut`).

Parent keeps: stage ids, claim Bools (AuthorityNotEmit / DependsOnLake /
InstallOutOpen closed / Full false), install IO
(`freestandingCapableInstallFreestandingOut`), Ok / PartialReady folds,
filterArgs, main.

## Sizes

| File | Lines |
|------|------:|
| InstallOut.lean before | 279 |
| InstallOut.lean after | 272 |
| InstallOutTheorems.lean | 249 |
| SelfApplyFs tip | 1902 (import +1) |

## Gates

lake InstallOut + Theorems + Main + SelfApplyFs green; just hygiene;
systems-host; systems-emit-wire; complete true; free/llvm/PROVABLY false.

## Next never-split cold

Capable **258** (then OfficialPath **256**, PerformEvidence **255**;
skip CompilePath*; skip already-split).
