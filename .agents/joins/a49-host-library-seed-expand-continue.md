# Join: Host library seed expand continue (A49 / plan L38)

**Status:** GREEN (lake + without-lake modules=189 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..HostPackageWrite modules=187
to Mult..HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText
(modules=**189**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..HostPackageWrite (prior 187) | prior living seed through HostPackageWrite |
| `SystemsLean.HostPackageWriteTheorems` | HostPackageWrite (theorem companion; ns HostPackageWrite on disk) |
| `SystemsLean.LlvmProgramText` | IrProgram + LlvmHold + LlvmEmitPath + LlvmMultText + LlvmLinearText + LlvmTypesText |

**How the band was picked:** preferred light seed-closed band after A48 (only
three remaining seed-closed: HostPackageWriteTheorems, LlvmProgramText,
SelfApplyFs). SelfApplyFs is seed-closed on imports but deferred for
maxRecDepth / heavy multi-import risk. *Main skipped. HostImportGraph /
HostModuleCheck* / HostResidualShrink were **not** seeded as product targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- HostPackageWriteTheorems <- HostPackageWrite
- LlvmProgramText <- IrProgram, LlvmHold, LlvmEmitPath, LlvmMultText, LlvmLinearText, LlvmTypesText

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 189
still open. `set_option maxRecDepth` unchanged this slice.

**Nit scrub:** `RESIDUAL.md` living tip lag A1-A47 / modules=183 corrected to
A1-A49 / modules=189 through this slice lockstep.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +2 modules; seed units label ends +HostPackageWriteTheorems+LlvmProgramText; modules=**189** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=189 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=189; L39+; prefer LlvmGraphText then SelfApplyFs dedicated) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +2; RealMod edges honest; acceptCount 189; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=189; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L38 + Open L39+ Host library seed expand continue; Done when >189 |
| `RESIDUAL.md` | Systems Open table + L38 Done + living tip Open floor beyond modules=189; A1-A49 scrub |
| `WATCHER.md` | next `/implement` beyond 189; join a50 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=189 + next Name |
| `doc/goals.md` | Living tip modules=189 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A49 modules=189; Phase L L38 done / L39+ open; Immediate next >189; join a50 |
| `.agents/joins/a49-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=189 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=189 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=187;
  preferred HostPackageWriteTheorems + LlvmProgramText band not in seed.
- **After:** modules=189; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >189 / a50.
- Host free / DualResidual free **not** flipped.
- SelfApplyFs deferred (seed-closed on imports; maxRecDepth / heavy multi-import risk).
- Next light seed-closed after this band: LlvmGraphText (then LlvmComposeText
  after Graph); SelfApplyFs remains dedicated heavy leaf.

## Next

**Open:** Host library seed expand continue (L39+ beyond modules=189).
Prefer next coherent seed-closed band: **LlvmGraphText** first, then
LlvmComposeText when Graph is in seed; **SelfApplyFs** as dedicated slice when
light band empty. Inventory remaining vs ~270 (skip *Main; HostImportGraph /
HostModuleCheck* / HostResidualShrink).
