# Join: Host develop tool expand continue (A10)

**Status:** GREEN (lake HostResidualShrink + develop clean-bootstrap +
subset-front-without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A10 / design A10+

## Goal met

Own at least one more day-to-day host tool from A9 remaining-candidates inventory
without Lake on measured bin-link and hot path. Tool owned: **slake-subset-front**.
HostResidualShrink inventory reseeded. DualResidual host residual remains true /
free claimed false **unchanged**. free/complete/PROVABLY and product Lake pins
**unchanged**. `proofCompleteClaimed` **unchanged** (false).

## Tool owned

| Tool | Clean-bootstrap | Without-Lake hot path |
|------|-----------------|------------------------|
| **slake-subset-front** | `just host-develop-tools-clean-bootstrap` (leanc from IR+rsp; with host-front) | `just subset-front-without-lake` (prebuilt ELF; goldens/mult-front G1/G2 accept B1-B3 reject) |

Pattern reuses A8/A9 leanc@rsp. Recipes live in `just/host-tool-expand.just`.

## Inventory before / after

| Label | Before (A9) | After (A10) |
|-------|-------------|-------------|
| **Clean-bootstrap owned** | fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front | ...+host-front+**subset-front** |
| **Develop tools inventory** | host-front | host-front+**subset-front** |
| **Day-to-day candidates remain** | subset-front+front-mult-package+subset-emit-rebuild+first-surface | **front-mult-package+subset-emit-rebuild+first-surface** |
| **Claim/diagnostic Lake-only** | claim-capable-perform-self-host+llvm-text-writers | unchanged |

Foundation six inventory pin **unchanged**:
`fragment-check+graph+package-write+package-roots+import-graph+module-check`.

## Pin table (A10)

| Pin | Value |
|-----|-------|
| `measuredHostDevelopToolsInventory` | `"host-front+subset-front"` |
| `measuredHostLakeFreeSubsetFront` | `"subset-front-without-lake"` |
| `subsetFrontWithoutLakeDualOk` | **true** |
| `measuredHostToolInventoryCleanBootstrapOwned` | `...+host-front+subset-front` |
| `measuredHostToolInventoryDayToDayCandidatesRemain` | `"front-mult-package+subset-emit-rebuild+first-surface"` |
| `hostDevelopToolsBinLinkWithoutLakeDualOk` | **true** (unchanged) |
| `hostFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (unchanged) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (unchanged) |
| DualResidual `hostElaboratorResidualRemains` | **true** (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | **false** (not edited) |

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

rm -f src/systems/.lake/build/bin/slake-subset-front \
      src/systems/.lake/build/bin/slake-host-front
just host-develop-tools-clean-bootstrap
# GREEN: host-front+subset-front relinked with leanc; no lake

just subset-front-without-lake
# GREEN: G1/G2 accept B1-B3 reject; no lake on hot path

just host-residual-shrink   # GREEN A10 dual-ok
just hygiene                # source-hygiene OK; professional-tone OK
just systems-host           # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A10 inventory + subset-front ownership pins; evidence/ready fold; theorems/smoke |
| `src/systems/SystemsLean/SubsetFront.lean` | Header cite A10 without-Lake path (pins stay in HostResidualShrink) |
| `just/host-tool-expand.just` | develop clean-bootstrap includes subset-front; new subset-front-without-lake |
| `just/host.just` | residual-shrink greps A10 recipe/tokens; line count kept under 1000 |
| `just/README.md` | map row A9/A10 |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A10 dual-pin tokens |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A10 Done; Open Front mult package without Lake |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |
| design + plan | A10 done cite |

## Open next

**Front mult package without Lake** (A10+ / design A10+) -- own
slake-front-mult-package (or next remain candidate first-surface /
subset-emit-rebuild) without Lake on measured step. DualResidual free still held.
Full Lake-job replacement remains open.

## Watcher next prompt

See `WATCHER.md` fenced block:
`/implement --effort 1 Front mult package without Lake`
