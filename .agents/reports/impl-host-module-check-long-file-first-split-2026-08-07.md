# Implement report: Host module check long-file first split (R4b)

**Date:** 2026-08-07
**Wave:** efc520d0 slice R4b
**SCORE:** fail=0

## Goal

Extract one coherent role module from `SystemsLean/HostModuleCheck.lean` to pay
down long-file debt without bringing the tip under 1000 this slice. Keep dual-ok
and free pins. No free/complete/PROVABLY/FullHost/proof flips.

## Line counts

| File | Before | After |
|------|--------|-------|
| `HostModuleCheck.lean` | **5821** | **3703** |
| `HostModuleCheckSurface.lean` | (new) | **2162** |
| `HostModuleCheckFixtures.lean` | 5273 | 5273 (fixture lag repair only) |
| `HostModuleCheckTheorems.lean` | 612 | 612 |

Net tip reduction **2118** lines (prefer extract >=400: met). Companion over
1000 (honest; further splits later).

## Method

1. Inventory: tip held stage ids / seeds / honesty pins; reject reasons; surface
   model; line helpers; expected namespaces; check*Surface roles; checkRealModule
   dispatcher; dual-pinned good/bad; readiness; driver. Theorems already in
   HostModuleCheckTheorems; fixture texts in HostModuleCheckFixtures.
2. Extracted structural surface band (reject reasons through checkRealModule)
   into `SystemsLean/HostModuleCheckSurface.lean` (same namespace
   `SystemsLean.HostModuleCheck`; imports Fixtures only -- no cycle).
3. Tip imports Fixtures + Surface; keeps seeds, honesty pins, good/bad accepts,
   readiness, driver IO. Restored tip `set_option maxRecDepth 16384` before
   hostModuleCheckLoadOk (option moved with checkRealModule split).
4. Harness partition honesty: measuredHostLibraryOutOfScopeHarness adds
   HostModuleCheckSurface; disk partition harness **6->7** (HostResidualShrink +
   Theorems dual-pin + just host.just greps).
5. Pure Nix: host-leans.nix, required-files.nix, host-specs-compile-path-3 tip +
   Surface companion specs. SystemsLean.lean import order Fixtures / Surface /
   HostModuleCheck / Theorems.
6. Fixture lag repair (on-disk walk honesty, not claim flip): after free claim F1
   and proof complete Track 4c, required-decl dual-pins still named
   hostElaboratorResidualRemains_true / proofCompleteClaimed_false. Updated
   dualResidualTheoremsRequiredDecls + good fixture text to remains_false;
   specProofTheoremsRequiredDecls + good fixture text to proofCompleteClaimed_true.
7. Residual lockstep: Name Done; Open empty done-for-now; further tip/Fixtures
   splits deferred hygiene only.

## Verification

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostModuleCheckSurface SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (GREEN; modules=206 walk) |
| `just host-residual-shrink` | **0** (GREEN) |
| `just systems-host` | **0** (220 required paths) |
| `just hygiene` | **0** (GREEN; banned-token scrub on residual/report) |

## Claim honesty (unchanged)

| Pin | Value |
|-----|-------|
| DualResidual `hostElaboratorResidualRemains` | **false** |
| DualResidual `hostElaboratorResidualFreeClaimed` | **true** |
| HostResidualShrink mirror remains / free | **false** / **true** |
| FullHostElaborateRemains | **false** |
| proofCompleteClaimed | **true** (not flipped this slice) |
| product free / complete / PROVABLY | true / true / true |
| product StillUsesLake / DependsOnLake | false |
| llvm full backend claim | not forged |

## Out of scope (honored)

- Full tip under 1000 this slice.
- HostImportGraph full split.
- free/parity/llvm forge; mass find-replace.
- No stitch/cut marks; surgical extract + hand wire-up.

## Primary paths touched

- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean/HostModuleCheckSurface.lean` (new)
- `src/systems/SystemsLean/HostModuleCheckFixtures.lean` (DualResidual/SpecProof lag)
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean.lean`
- `just/host.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
