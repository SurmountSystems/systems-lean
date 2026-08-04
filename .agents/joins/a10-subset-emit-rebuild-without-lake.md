# Join: Subset emit rebuild without Lake (A10++)

**Status:** GREEN (lake HostResidualShrink + develop clean-bootstrap +
mult-subset-rebuild-without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A10++ / design remain

## Goal met

Own **slake-mult-subset-rebuild** without Lake on measured bin-link and hot path.
HostResidualShrink inventory reseeded. DualResidual host residual remains true /
free claimed false **unchanged**. free/complete/PROVABLY and product Lake pins
**unchanged**. `proofCompleteClaimed` **unchanged** (false).

## Tool owned

| Tool | Clean-bootstrap | Without-Lake hot path |
|------|-----------------|------------------------|
| **slake-mult-subset-rebuild** | `just host-develop-tools-clean-bootstrap` (leanc from IR+rsp; with host-front + subset-front + front-mult-package) | `just mult-subset-rebuild-without-lake` (prebuilt ELF; Mult unit package re-emit dual greps; inventory dual-ok greps HostResidualShrink) |

Pattern reuses A8/A9/A10/A10+ leanc@rsp for bin link. Hot path already existed
(M2); this slice **inventory-owns** it under HostResidualShrink and folds the
ELF into develop clean-bootstrap. Recipes: `just/host-tool-expand.just` (bootstrap),
`just/subset-rebuild.just` (without-lake dual-ok greps).

## Inventory before / after

| Label | Before (A10+) | After (A10++) |
|-------|---------------|---------------|
| **Clean-bootstrap owned** | fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front+subset-front+front-mult-package | ...+front-mult-package+**mult-subset-rebuild** |
| **Develop tools inventory** | host-front+subset-front+front-mult-package | host-front+subset-front+front-mult-package+**mult-subset-rebuild** |
| **Day-to-day candidates remain** | subset-emit-rebuild+first-surface | **first-surface** |
| **Claim/diagnostic Lake-only** | claim-capable-perform-self-host+llvm-text-writers | unchanged |

Foundation six inventory pin **unchanged**:
`fragment-check+graph+package-write+package-roots+import-graph+module-check`.

## Pin table (A10++)

| Pin | Value |
|-----|-------|
| `measuredHostDevelopToolsInventory` | `"host-front+subset-front+front-mult-package+mult-subset-rebuild"` |
| `measuredHostLakeFreeMultSubsetRebuild` | `"mult-subset-rebuild-without-lake"` |
| `multSubsetRebuildWithoutLakeDualOk` | **true** |
| `measuredHostToolInventoryCleanBootstrapOwned` | `...+host-front+subset-front+front-mult-package+mult-subset-rebuild` |
| `measuredHostToolInventoryDayToDayCandidatesRemain` | `"first-surface"` |
| `frontMultPackageWithoutLakeDualOk` | **true** (unchanged) |
| `subsetFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostDevelopToolsBinLinkWithoutLakeDualOk` | **true** (unchanged) |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (unchanged) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (unchanged) |
| DualResidual `hostElaboratorResidualRemains` | **true** (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | **false** (not edited) |
| MultSubsetRebuild `stillUsesLake` / `dependsOnLake` | **true** (local product honesty; not flipped) |
| MultSubsetRebuild `multSubsetRebuildWithoutLakeFinishedClaimed` | **true** (unchanged product M2 pin) |

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

rm -f src/systems/.lake/build/bin/slake-mult-subset-rebuild \
      src/systems/.lake/build/bin/slake-host-front \
      src/systems/.lake/build/bin/slake-subset-front \
      src/systems/.lake/build/bin/slake-front-mult-package
just host-develop-tools-clean-bootstrap
# GREEN: host-front+subset-front+front-mult-package+mult-subset-rebuild relinked with leanc; no lake

just mult-subset-rebuild-without-lake
# GREEN: Mult package re-emit dual greps; inventory dual-ok; no lake on hot path

just host-residual-shrink   # GREEN A10++ dual-ok
just hygiene                # source-hygiene OK; professional-tone OK
just systems-host           # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A10++ inventory + mult-subset-rebuild ownership pins; evidence/ready fold; theorems/smoke; tip doc compress under 1000 |
| `src/systems/SystemsLean/MultSubsetRebuild.lean` | Header cite A10++ inventory dual-ok + clean-bootstrap |
| `just/host-tool-expand.just` | develop clean-bootstrap includes mult-subset-rebuild; inventory greps A10++ |
| `just/subset-rebuild.just` | mult-subset-rebuild-without-lake greps HostResidualShrink dual-ok; prefer clean-bootstrap message |
| `just/host.just` | residual-shrink greps A10++ recipe/tokens; line count kept under 1000 |
| `just/README.md` | map row A9..A10++ |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A10++ dual-pin tokens |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A10++ Done; Open First surface without Lake |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |
| plan-slake-replaces-lake | A10++ done cite (when updated) |

## Open next

**First surface without Lake** -- own slake-first-surface without Lake on
measured step. DualResidual free still held. Full Lake-job replacement remains
open. After first-surface day-to-day empty, prefer **Host real module seed expand**
(beyond Mult..Compose 12, e.g. Erasure+Extract).

## Watcher next prompt

See `WATCHER.md` fenced block:
`/implement --effort 1 First surface without Lake`
