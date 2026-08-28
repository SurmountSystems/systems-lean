# Join: Host library seed expand continue (A41 / plan L30)

**Status:** GREEN (lake + without-lake modules=139 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..CapableRegenerateTheorems modules=135
to Mult..CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots
(modules=**139**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..CapableRegenerateTheorems (prior 135) | prior living seed through CapableRegenerate multi-import |
| `SystemsLean.FreestandingEmitLoad` | pure leaf (no package-local imports; namespace SystemsLean.FreestandingEmit) |
| `SystemsLean.FreestandingEmitLoadScaffold` | FreestandingEmitLoad parent only |
| `SystemsLean.LakeRetireInventory` | pure leaf |
| `SystemsLean.HostPackageRoots` | pure leaf |

**How the band was picked:** preferred freestanding emit load ladder from A40
review inventory. FreestandingEmitLoad is a pure leaf (seed-closed now).
FreestandingEmitLoadScaffold depends only on Load. LakeRetireInventory and
HostPackageRoots are pure leaves (ProductPath/SpecProof are **not** pure leaves;
they need SelfApplyFs / InventoryClose and were skipped). FreestandingEmit itself
was **not** forced this slice (still multi-import emit stack); after this seed
it is fully seed-closed for L31. HostImportGraph / HostModuleCheck* /
HostResidualShrink / *Main were **not** seeded as product targets.

**RealMod import honesty:** FreestandingEmitLoad and pure leaves list empty
package imports matching disk; FreestandingEmitLoadScaffold lists
FreestandingEmitLoad only. Verified with on-disk `import SystemsLean` and live
without-lake order line.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 139
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named FreestandingEmitLoad ladder + pure leaves seed | +4 modules; seed units label ends +HostPackageRoots; modules=**139** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=139 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=139; L31+; FreestandingEmit seed-closed next) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +4; RealMod edges honest; acceptCount 139; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks (ns FreestandingEmit for load helpers); loadOk modules=139 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L30 + Open L31+ Host library seed expand continue; Done when >139 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=139 |
| `WATCHER.md` | next `/implement` beyond 139; join a42 |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=139 + next Name |
| `doc/goals.md` | Living tip modules=139 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A41 modules=139; Phase L L30 done / L31+ open; join a42 next |
| `.agents/joins/a41-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=139 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=139 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=135;
  FreestandingEmitLoad ladder and pure inventory leaves not in seed.
- **After:** modules=139; same expandSliceName; without-Lake measured green;
  RealMod edges honest (Load leaf; Scaffold parent; pure leaves empty).
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L31+ beyond modules=139).
Prefer next coherent seed-closed band. **FreestandingEmit** is now seed-closed
(Load + LoadScaffold + emit product stack all seeded). That unlocks
ProductPathWriteHc after FreestandingEmit. CompilePath* multi-import unit
surfaces remain a volume alternate. Join next:
`.agents/joins/a42-host-library-seed-expand-continue.md`.
