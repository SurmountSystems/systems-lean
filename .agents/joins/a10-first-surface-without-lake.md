# Join: First surface without Lake (A10+++)

**Status:** GREEN (lake HostResidualShrink + develop clean-bootstrap +
first-surface-without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A10+++ / design remain

## Goal met

Own **slake-first-surface** without Lake on measured bin-link and hot path.
HostResidualShrink inventory reseeded. DualResidual host residual remains true /
free claimed false **unchanged**. free/complete/PROVABLY and product Lake pins
**unchanged**. `proofCompleteClaimed` **unchanged** (false).

## Tool owned

| Tool | Clean-bootstrap | Without-Lake hot path |
|------|-----------------|------------------------|
| **slake-first-surface** | `just host-develop-tools-clean-bootstrap` (leanc from IR+rsp; with host-front + subset-front + front-mult-package + mult-subset-rebuild) | `just first-surface-without-lake` (prebuilt ELF; Mult unit firstSurfaceReady print; inventory dual-ok greps HostResidualShrink) |

Pattern reuses A8/A9/A10/A10+/A10++ leanc@rsp for bin link. Recipes:
`just/host-tool-expand.just` (bootstrap + without-lake).

## Inventory before / after

| Label | Before (A10++) | After (A10+++) |
|-------|----------------|----------------|
| **Clean-bootstrap owned** | ...+front-mult-package+mult-subset-rebuild | ...+front-mult-package+mult-subset-rebuild+**first-surface** |
| **Develop tools inventory** | host-front+subset-front+front-mult-package+mult-subset-rebuild | host-front+subset-front+front-mult-package+mult-subset-rebuild+**first-surface** |
| **Day-to-day candidates remain** | first-surface | **empty** |
| **Claim/diagnostic Lake-only** | claim-capable-perform-self-host+llvm-text-writers | unchanged |

Foundation six inventory pin **unchanged**:
`fragment-check+graph+package-write+package-roots+import-graph+module-check`.

## Pin table (A10+++)

| Pin | Value |
|-----|-------|
| `measuredHostDevelopToolsInventory` | `"host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface"` |
| `measuredHostLakeFreeFirstSurface` | `"first-surface-without-lake"` |
| `firstSurfaceWithoutLakeDualOk` | **true** |
| `measuredHostToolInventoryCleanBootstrapOwned` | `...+host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface` |
| `measuredHostToolInventoryDayToDayCandidatesRemain` | `"empty"` |
| `multSubsetRebuildWithoutLakeDualOk` | **true** (unchanged) |
| `frontMultPackageWithoutLakeDualOk` | **true** (unchanged) |
| `subsetFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostDevelopToolsBinLinkWithoutLakeDualOk` | **true** (unchanged) |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (unchanged) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (unchanged) |
| DualResidual `hostElaboratorResidualRemains` | **true** (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | **false** (not edited) |
| FirstSurface `stillUsesLake` / `dependsOnLake` | **true** (local product honesty; not flipped) |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean. No free/complete/PROVABLY or product Lake pin flips.
`proofCompleteClaimed` not touched.

## Gates evidence

```bash
cd /home/hunter/Projects/ai/iso
(cd src/systems && lake build SystemsLean.HostResidualShrink)
# exit 0 -- Built SystemsLean.HostResidualShrink

# one-time IR/rsp for first-surface if missing:
(cd src/systems && lake build slake-first-surface)

rm -f src/systems/.lake/build/bin/slake-first-surface \
      src/systems/.lake/build/bin/slake-host-front \
      src/systems/.lake/build/bin/slake-subset-front \
      src/systems/.lake/build/bin/slake-front-mult-package \
      src/systems/.lake/build/bin/slake-mult-subset-rebuild
just host-develop-tools-clean-bootstrap
# GREEN: host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface
# relinked with leanc; no lake

just first-surface-without-lake
# GREEN: firstSurfaceReady print; inventory dual-ok; no lake on hot path

just host-residual-shrink   # GREEN A10+++ dual-ok
just hygiene                # source-hygiene OK; professional-tone OK
just systems-host           # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A10+++ inventory + first-surface ownership pins; day-to-day empty; evidence/ready fold; theorems/smoke |
| `src/systems/SystemsLean/FirstSurface.lean` | Header cite A10+++ without-lake + clean-bootstrap |
| `just/host-tool-expand.just` | develop clean-bootstrap includes first-surface; first-surface-without-lake recipe; inventory greps A10+++ |
| `just/host.just` | residual-shrink greps A10+++ recipe/tokens; dual-ok loop compress under 1000 |
| `just/subset-rebuild.just` | mult-subset-rebuild-without-lake inventory string A10+++ |
| `just/subset-emit.just` | first-surface Lake path note; without-lake pointer |
| `just/README.md` | map row A9..A10+++ |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A10+++ dual-pin tokens |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A10+++ Done; Open Host real module seed expand |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |

## Open next

**Host real module seed expand** -- grow HostImportGraph + HostModuleCheck
PARTIAL-STRUCTURAL seed beyond Mult..Compose 12 (e.g. Erasure+Extract+Theorems).
DualResidual free still held. Full Lake-job replacement remains open. Day-to-day
develop tool candidates empty; claim/diagnostic Lake-only remain.

## Watcher next prompt

See `WATCHER.md` fenced block:
`/implement --effort 1 Host real module seed expand`
