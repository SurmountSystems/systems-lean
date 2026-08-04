# Join: Host tool build expand (A9)

**Status:** GREEN (lake HostResidualShrink + develop clean-bootstrap + host-front-without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A9 / design L6-L7 tool expand

## Goal met

Inventory of host lean_exe still Lake-built vs clean-bootstrap / without-Lake
owned; first non-foundation day-to-day develop tool (**slake-host-front**) owned
without Lake on measured bin-link and hot path. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. `proofCompleteClaimed` **unchanged** (false).

## Inventory summary (~51 lean_exe in `src/systems/lakefile.lean`)

| Class | Tools / labels | Status |
|-------|----------------|--------|
| **Clean-bootstrap + without-Lake owned (A8 foundation six)** | slake-host-fragment-check, slake-host-graph, slake-host-package-write, slake-host-package-roots, slake-host-import-graph, slake-host-module-check | A8: `host-foundation-tools-clean-bootstrap` + without-Lake recipes |
| **Clean-bootstrap + without-Lake owned (A9 develop expand)** | slake-host-front | A9: `host-develop-tools-clean-bootstrap` + `host-front-without-lake` |
| **Day-to-day candidates remain** | subset-front, front-mult-package, subset emit/rebuild family, first-surface | Still Lake for bin build / measured hot path (A10+) |
| **Claim / diagnostic Lake-only honesty** | freestanding capable/perform/ownership/self-host claim exes; llvm-*-text writers | Not day-one free bar; stay Lake honesty |

Greppable inventory labels in `HostResidualShrink`:

- `measuredHostToolInventoryCleanBootstrapOwned` =
  `fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front`
- `measuredHostToolInventoryDayToDayCandidatesRemain` =
  `subset-front+front-mult-package+subset-emit-rebuild+first-surface`
- `measuredHostToolInventoryClaimDiagnosticLakeOnly` =
  `claim-capable-perform-self-host+llvm-text-writers`

Foundation six inventory pin **unchanged**:
`fragment-check+graph+package-write+package-roots+import-graph+module-check`.

## Extra tool owned (non-foundation)

| Tool | Recipe (no lake on step) | Hot path |
|------|--------------------------|----------|
| **slake-host-front** | `just host-develop-tools-clean-bootstrap` (leanc from IR+rsp) | `just host-front-without-lake` (exec prebuilt ELF; goldens G1..G7 + B1..B4) |

Pattern reuses A8 leanc@rsp clean-bootstrap. New modular just:
`just/host-tool-expand.just` (imported from root justfile).

## Pin table (A9)

| Pin | Value |
|-----|-------|
| `measuredHostToolBuildExpand` | `"Host tool build expand"` |
| `measuredHostDevelopToolsCleanBootstrap` | `"host-develop-tools-clean-bootstrap"` |
| `measuredHostDevelopToolsInventory` | `"host-front"` |
| `hostDevelopToolsBinLinkWithoutLakeDualOk` | **true** |
| `measuredHostLakeFreeHostFront` | `"host-front-without-lake"` |
| `hostFrontWithoutLakeDualOk` | **true** |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (unchanged from A8) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (unchanged) |
| DualResidual `hostElaboratorResidualRemains` | **true** (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | **false** (not edited) |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean. No free/complete/PROVABLY or product Lake pin flips.

## Gates evidence

```bash
cd /home/hunter/Projects/ai/iso
(cd src/systems && lake build SystemsLean.HostResidualShrink)
# exit 0 -- Built SystemsLean.HostResidualShrink

rm -f src/systems/.lake/build/bin/slake-host-front
just host-develop-tools-clean-bootstrap
# GREEN: host-front relinked with leanc; no lake

just host-front-without-lake
# GREEN: goldens G1..G7 accept B1-B4 reject; no lake on hot path

just host-residual-shrink   # GREEN A9 dual-ok
just hygiene                # source-hygiene OK; professional-tone OK
just systems-host           # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A9 inventory + host-front ownership pins; evidence/ready fold; theorems/smoke |
| `src/systems/SystemsLean/HostFront.lean` | Header cite A9 without-Lake path (pins stay in HostResidualShrink) |
| `just/host-tool-expand.just` | **new** develop clean-bootstrap + host-front-without-lake |
| `justfile` / `just/README.md` | import + map row |
| `just/host.just` | residual-shrink greps A9 recipes/tokens |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A9 dual-pin tokens |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A9 Done; Open A10 |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |
| design + plan | A9 done cite |

## Open next

**Host develop tool expand continue** (A10 / design A10+) -- own at least one more
day-to-day tool from remaining-candidates inventory (subset-front, front-mult-package,
first-surface, or named subset emit/rebuild) without Lake on measured step.
DualResidual free still held.

## Watcher next prompt

See `WATCHER.md` fenced block:
`/implement --effort 1 Host develop tool expand continue`
