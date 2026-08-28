# Implement report: Host module check long-file second split

**Date:** 2026-08-07
**Impl id:** 52205c48
**SCORE:** fail=0

## Goal

Continue Sub-1-KLOC paydown on `SystemsLean/HostModuleCheck.lean` after the
Surface first split by extracting one more coherent role companion. Keep dual-ok
and free pins. No free/complete/PROVABLY/FullHost/proof flips.

## Line counts

| File | Before | After |
|------|--------|-------|
| `HostModuleCheck.lean` | **3703** | **2489** |
| `HostModuleCheckAccepts.lean` | (new) | **1255** |
| `HostModuleCheckSurface.lean` | 2162 | 2162 |
| `HostModuleCheckFixtures.lean` | 5273 | 5273 |
| `HostModuleCheckTheorems.lean` | 612 | 612 |

Net tip reduction **1214** lines (prefer extract >=400: met). Companion over
1000 (honest; further splits later). Tip still over Sub-1-KLOC bar.

## Method

1. Inventory after Surface split: tip held stage ids / seeds / honesty pins;
   dual-pinned good/bad accepts; hostModuleCheckLoadOk fold; readiness; driver.
   Surface owns reject reasons, surface model, check*Surface, checkRealModule.
   Fixtures owns fixture texts.
2. Extracted dual-pinned good/bad accept band (`hostModuleCheckGood*` /
   `hostModuleCheckBad*` ModuleCheckResult defs) into
   `SystemsLean/HostModuleCheckAccepts.lean` (same namespace
   `SystemsLean.HostModuleCheck`; imports Fixtures + Surface -- no cycle).
3. Tip imports Fixtures + Surface + Accepts; keeps seeds, honesty pins, LoadOk
   fold, readiness, driver IO. `set_option maxRecDepth 16384` stays on tip before
   LoadOk.
4. Harness partition honesty: measuredHostLibraryOutOfScopeHarness adds
   HostModuleCheckAccepts; disk partition harness **7->8** (HostResidualShrink +
   Theorems dual-pin + just host.just greps).
5. Pure Nix: host-leans.nix, required-files.nix, host-specs-compile-path-3 tip +
   Accepts companion specs. SystemsLean.lean import order Fixtures / Surface /
   Accepts / HostModuleCheck / Theorems.
6. Presence lag repair (not claim flip): DualResidualTheorems greppable
   `Not proof complete` restored for systems-host token (SpecProof owns
   proofCompleteClaimed true; DualResidualTheorems does not set it).
7. Residual lockstep: Name Done; Open empty done-for-now; further tip/Fixtures
   splits deferred hygiene only.

## Verification

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostModuleCheckAccepts SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (GREEN; modules=206 walk) |
| `just host-residual-shrink` | **0** (GREEN) |
| `just systems-host` | **0** (221 required paths) |
| `just hygiene` | **0** (GREEN after module-split-jargon scrub) |

## Claim honesty (unchanged)

| Pin | Value |
|-----|-------|
| DualResidual `hostElaboratorResidualRemains` | **false** |
| DualResidual `hostElaboratorResidualFreeClaimed` | **true** |
| HostResidualShrink FullHostElaborateRemains | **false** |
| SpecProof `proofCompleteClaimed` | **true** (not flipped this slice) |
| product free / complete / PROVABLY | true / true / true |
| product StillUsesLake / DependsOnLake | false |
| modules=206 seed | unchanged |
| llvm full backend claim | not forged |

## Out of scope (honored)

- Full tip under 1000 this slice.
- HostImportGraph full rewrite.
- free/parity/llvm forge; mass find-replace.
- No stitch/cut marks; surgical extract + hand wire-up.
