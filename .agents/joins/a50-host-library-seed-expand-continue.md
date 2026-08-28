# Join: Host library seed expand continue (A50 / plan L39)

**Status:** GREEN (lake + without-lake modules=191 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..LlvmProgramText modules=189
to Mult..LlvmProgramText+LlvmGraphText+LlvmComposeText
(modules=**191**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..LlvmProgramText (prior 189) | prior living seed through LlvmProgramText |
| `SystemsLean.LlvmGraphText` | IrGraph + LlvmHold + LlvmEmitPath + LlvmMultText + LlvmLinearText + LlvmTypesText + LlvmProgramText |
| `SystemsLean.LlvmComposeText` | HostCompose + IrProgram + IrGraph + LlvmHold + LlvmEmitPath + LlvmMultText + LlvmLinearText + LlvmTypesText + LlvmProgramText + LlvmGraphText |

**How the band was picked:** preferred light seed-closed band after A49 review
(only two remaining seed-closed: LlvmGraphText, SelfApplyFs). Graph first
unlocks Compose; both landed in one slice. SelfApplyFs is seed-closed on
imports but deferred for maxRecDepth / heavy multi-import risk. *Main skipped.
HostImportGraph / HostModuleCheck* / HostResidualShrink were **not** seeded as
product targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines:

- LlvmGraphText <- IrGraph, LlvmHold, LlvmEmitPath, LlvmMultText, LlvmLinearText, LlvmTypesText, LlvmProgramText
- LlvmComposeText <- HostCompose, IrProgram, IrGraph, LlvmHold, LlvmEmitPath, LlvmMultText, LlvmLinearText, LlvmTypesText, LlvmProgramText, LlvmGraphText

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 191
still open. `set_option maxRecDepth` unchanged this slice.

**Review gate:** A49 modules=189 **APPROVE** (report
`.agents/reports/review-a49-seed-189.md`) before this implement.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +2 modules; seed units label ends +LlvmGraphText+LlvmComposeText; modules=**191** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=191 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=191; L40+; prefer SelfApplyFs dedicated) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +2; RealMod edges honest; acceptCount 191; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=191; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L39 + Open L40+ Host library seed expand continue; Done when >191 |
| `RESIDUAL.md` | Systems Open table + L39 Done + living tip Open floor beyond modules=191 |
| `WATCHER.md` | next `/implement` beyond 191; join a51 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=191 + next Name |
| `doc/goals.md` | Living tip modules=191 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A50 modules=191; Phase L L39 done / L40+ open; Immediate next >191; join a51 |
| `.agents/reports/review-a49-seed-189.md` | A49 APPROVE review (Part 1) |
| `.agents/joins/a50-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=191 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=191 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=189;
  preferred LlvmGraphText + LlvmComposeText band not in seed.
- **After:** modules=191; same expandSliceName; without-Lake measured green;
  RealMod edges honest. Floors lockstep >191 / a51.
- Host free / DualResidual free **not** flipped.
- SelfApplyFs deferred (seed-closed on imports; maxRecDepth / heavy multi-import risk).
- After this band, only SelfApplyFs remains seed-closed product (policy-filtered)
  among ~270 disk modules; light llvm unit-text ladder Mult..Compose complete.

## Next

**Open:** Host library seed expand continue (L40+ beyond modules=191).
Prefer next coherent seed-closed band: **SelfApplyFs** dedicated (only remaining
import seed-closed product leaf; heavy multi-import). Inventory remaining vs
~270 (skip *Main; HostImportGraph / HostModuleCheck* / HostResidualShrink).
After SelfApplyFs, unlock InventoryClose / ProductPathBars / DualResidual /
ProbeWire / SpecProof chains.
