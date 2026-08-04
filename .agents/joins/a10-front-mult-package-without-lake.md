# Join: Front mult package without Lake (A10+)

**Status:** GREEN (lake HostResidualShrink + develop clean-bootstrap +
front-mult-package-without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A10+ / design A10+

## Goal met

Own **slake-front-mult-package** without Lake on measured bin-link and hot path.
HostResidualShrink inventory reseeded. DualResidual host residual remains true /
free claimed false **unchanged**. free/complete/PROVABLY and product Lake pins
**unchanged**. `proofCompleteClaimed` **unchanged** (false).

## Tool owned

| Tool | Clean-bootstrap | Without-Lake hot path |
|------|-----------------|------------------------|
| **slake-front-mult-package** | `just host-develop-tools-clean-bootstrap` (leanc from IR+rsp; with host-front + subset-front) | `just front-mult-package-without-lake` (prebuilt ELF; G1 accept then Mult package write + dual greps on emit/slake_mult_subset) |

Pattern reuses A8/A9/A10 leanc@rsp. Recipes live in `just/host-tool-expand.just`.

## Inventory before / after

| Label | Before (A10) | After (A10+) |
|-------|--------------|--------------|
| **Clean-bootstrap owned** | fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front+subset-front | ...+host-front+subset-front+**front-mult-package** |
| **Develop tools inventory** | host-front+subset-front | host-front+subset-front+**front-mult-package** |
| **Day-to-day candidates remain** | front-mult-package+subset-emit-rebuild+first-surface | **subset-emit-rebuild+first-surface** |
| **Claim/diagnostic Lake-only** | claim-capable-perform-self-host+llvm-text-writers | unchanged |

Foundation six inventory pin **unchanged**:
`fragment-check+graph+package-write+package-roots+import-graph+module-check`.

## Pin table (A10+)

| Pin | Value |
|-----|-------|
| `measuredHostDevelopToolsInventory` | `"host-front+subset-front+front-mult-package"` |
| `measuredHostLakeFreeFrontMultPackage` | `"front-mult-package-without-lake"` |
| `frontMultPackageWithoutLakeDualOk` | **true** |
| `measuredHostToolInventoryCleanBootstrapOwned` | `...+host-front+subset-front+front-mult-package` |
| `measuredHostToolInventoryDayToDayCandidatesRemain` | `"subset-emit-rebuild+first-surface"` |
| `subsetFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostFrontWithoutLakeDualOk` | **true** (unchanged) |
| `hostDevelopToolsBinLinkWithoutLakeDualOk` | **true** (unchanged) |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (unchanged) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (unchanged) |
| DualResidual `hostElaboratorResidualRemains` | **true** (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | **false** (not edited) |
| FrontMultPackage `stillUsesLake` / `dependsOnLake` | **true** (local product honesty; not flipped) |

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

# one-time IR+rsp restore for front-mult (FullHostElaborateRemains policy)
(cd src/systems && lake build slake-front-mult-package)

rm -f src/systems/.lake/build/bin/slake-front-mult-package \
      src/systems/.lake/build/bin/slake-host-front \
      src/systems/.lake/build/bin/slake-subset-front
just host-develop-tools-clean-bootstrap
# GREEN: host-front+subset-front+front-mult-package relinked with leanc; no lake

just front-mult-package-without-lake
# GREEN: G1 accept + Mult package write dual greps; no lake on hot path

just host-residual-shrink   # GREEN A10+ dual-ok
just hygiene                # source-hygiene OK; professional-tone OK
just systems-host           # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A10+ inventory + front-mult-package ownership pins; evidence/ready fold; theorems/smoke |
| `src/systems/SystemsLean/FrontMultPackage.lean` | Header cite A10+ without-Lake path (pins stay in HostResidualShrink) |
| `just/host-tool-expand.just` | develop clean-bootstrap includes front-mult-package; new front-mult-package-without-lake |
| `just/host.just` | residual-shrink greps A10+ recipe/tokens; line count kept under 1000 |
| `just/README.md` | map row A9/A10/A10+ |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A10+ dual-pin tokens |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A10+ Done; Open Subset emit rebuild without Lake |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |
| plan-slake-replaces-lake | A10+ done cite |

## Open next

**Subset emit rebuild without Lake** (A10++ / design remain) -- own
subset-emit-rebuild and/or first-surface without Lake on measured step.
DualResidual free still held. Full Lake-job replacement remains open.

## Watcher next prompt

See `WATCHER.md` fenced block:
`/implement --effort 1 Subset emit rebuild without Lake`
