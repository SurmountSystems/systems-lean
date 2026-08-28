# Join: Host library seed expand continue (A55 / plan L44)

**Status:** GREEN (lake + without-lake modules=206 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ProductPath+ProductPathTheorems+DualResidual
modules=199 to Mult..DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody
+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems
(modules=**206**, full product library excluding *Main and host harness) on both
import graph and PARTIAL-STRUCTURAL module check **without Lake on the measured
hot path**. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..DualResidual (prior 199) | prior living seed through DualResidual |
| `SystemsLean.DualResidualTheorems` | ProductPath+InventoryClose+SelfApplyFs+LlvmHold+DualResidual (namespace DualResidual) |
| `SystemsLean.ProbeWire` | DualResidual+ProductPath+InventoryClose+SelfApplyFs+LlvmHold |
| `SystemsLean.SelfHostBody` | Emit Mult..Body stack + scaffolds + SelfApplyFs+LlvmHold+DualResidual |
| `SystemsLean.ProbeWireTheorems` | parent ProbeWire + deps (namespace ProbeWire) |
| `SystemsLean.SelfHostBodyTheorems` | parent SelfHostBody + emit deps (namespace SelfHostBody) |
| `SystemsLean.SpecProof` | ProbeWire+DualResidual+ProductPath+InventoryClose+SelfApplyFs+LlvmHold |
| `SystemsLean.SpecProofTheorems` | parent SpecProof + deps (namespace SpecProof) |

**How the band was picked:** A54 left DualResidualTheorems as preferred seed-closed
after DualResidual (skip *Main / HostImportGraph / HostModuleCheck /
HostResidualShrink). Inventory of remaining product modules (exclude *Main and
host harness) was exactly seven, all seed-closed in topological order once
DualResidual was seeded. Effort-2 slice took the full remaining product library
band to modules=206 (~206 product target in plan).

**RealMod import honesty:** verified with live without-lake order lines and
dual-pin `*.imports` equality checks matching on-disk `import SystemsLean.*`.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Product library seed closed;
*Main modules and host harness remain out of seed by design.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +7 modules; seed units label ends +DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems; modules=**206** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=206 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual free false | No free flip; `hostElaboratorResidualFreeClaimed := false` unchanged |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Check depth deepen** (plan Phase T after full product library seed modules=206; DualResidual free stays false) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +7; RealMod honesty; acceptCount 206; order edge checks; dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=206; good fixture wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture text for new seven |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smoke for new seven |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L44 + Open Check depth deepen |
| `RESIDUAL.md` | Systems Open + L44 Done + living tip modules=206 |
| `WATCHER.md` | next `/implement` Check depth deepen; join a56 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=206 |
| `doc/goals.md` | Living tip Open Check depth deepen |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A55 modules=206; L44 done / T2 open; join a56 |
| `.agents/joins/a55-host-library-seed-expand-continue.md` | this join |

## DualResidual free unchanged false (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

DualResidual.lean not flipped. **Do not flip free.**

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=206 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=206 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=199;
  DualResidualTheorems / ProbeWire / SelfHostBody / SpecProof chain not in seed.
- **After:** modules=206; same expandSliceName; without-Lake measured green;
  RealMod edges honest for all seven. Floors lockstep next a56 Check depth deepen.
- Host free / DualResidual free **not** flipped.
- maxRecDepth stayed 16384; no timeout/OOM/maxRecDepth failure.
- Product library seed closed at Mult..SpecProofTheorems. Next is check-depth
  deepen (plan Phase T), not DualResidual free.

## Next

**Open:** Check depth deepen (plan Phase T after L44 modules=206).
Do **not** flip DualResidual free. Skip *Main seed theater.
Join next: `.agents/joins/a56-check-depth-deepen.md`.
