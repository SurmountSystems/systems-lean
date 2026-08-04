# Join: Host real module seed expand (A11)

**Status:** GREEN (lake + without-lake modules=16 + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Expand the real-module seed set beyond Mult..Compose foundation (modules=12) to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems**
(modules=16) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Erasure/Extract seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..HostComposeTheorems (prior 12) | Mult..Compose foundation |
| `SystemsLean.Erasure` | Erasure (imports Mult) |
| `SystemsLean.ErasureTheorems` | Erasure theorems (imports Mult + Erasure) |
| `SystemsLean.Extract` | Extract (imports Mult + Erasure) |
| `SystemsLean.ExtractTheorems` | Extract theorems (imports Mult + Erasure + Extract) |

**HostCompose seed-local edges:** after this slice, `filterSeedImports` keeps
real Erasure + Extract (and HostComposeTheorems keeps Erasure / ErasureTheorems /
Extract) because those modules are seed members.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role. Erasure: unmarked/mark/isRuntimeAbsent/isErasureGrade/markForGrade?/checkFailClosed;
Extract: RuntimeClaim/isFreestandingGoal/ofRuntimeTag?/isValidRuntimeTag/checkFailClosed/extractOk;
*Theorems corpus ErasureTheorems=8 + ExtractTheorems=8. **Not** full Lean 4
elaborator typecheck. Remaining library ~271 - 16 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Erasure/Extract seed | +4 modules; seed units label ends +Erasure+ErasureTheorems+Extract+ExtractTheorems |
| expandSliceName | `Host real module seed expand` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=16 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + theorem corpus counts reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=16) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +Erasure/Extract band; HostCompose seed-local Erasure/Extract edges; expandSliceName; acceptCount 16; driver edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Erasure/Extract surface checks; expandSliceName; loadOk modules=16 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Erasure/Extract required decls + good fixtures; theorem corpus dual-pin |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Erasure/Extract good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name + theorem counts inventory reseed |
| `just/host-without-lake.just` | seed / expand Name greps |
| `just/host.just` | host-residual-shrink greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed / expand tokens |
| `RESIDUAL-systems.md` | Done + Open Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=16 + next Name |
| `.agents/joins/a11-host-real-module-seed-expand.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=16 expand=Host real module seed expand
just host-module-check-without-lake   # GREEN modules=16 expand=Host real module seed expand
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
just systems-host                     # GREEN
```

## Open next

**Host library seed expand continue** -- next real library band beyond modules=16
(inventory remaining vs ~271). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
