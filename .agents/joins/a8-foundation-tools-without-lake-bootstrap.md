# Join: Foundation tools without Lake bootstrap (A8)

**Status:** GREEN (lake HostResidualShrink + clean-bootstrap + without-lake hot
paths + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A8 / design L10 / S9

## Goal met

Build or run foundation host tools without requiring Lake peer **exe** prebuild
after a bin-only clean, with documented clean-tree policy. DualResidual host
residual remains true / free claimed false **unchanged**. free/complete/PROVABLY
and product Lake pins **unchanged**. `proofCompleteClaimed` **unchanged** (false).

## What bootstrap-prebuild meant before

| Item | Before A8 |
|------|-----------|
| Pin | `hostResidualShrinkBootstrapPrebuildRemains := true` |
| Meaning | Without-Lake hot paths required a prior `lake build slake-host-*` to produce foundation ELFs under `.lake/build/bin/` |
| Tools | slake-host-fragment-check, slake-host-graph, slake-host-package-write, slake-host-package-roots, slake-host-import-graph, slake-host-module-check |
| After clean bins | Recipes failed with "bootstrap once: lake build ..." |

## What landed (Path A)

Measured recipe **`just host-foundation-tools-clean-bootstrap`** (`just/host.just`):

1. Does **not** call `lake build` / `lake exe` / `lake env`.
2. For each of the six foundation tools: reads existing `.lake/build/bin/<tool>.rsp`,
   verifies listed `.c.o.export` IR objects exist, runs **`leanc -o bin @rsp`**.
3. Fail-closed if rsp or IR missing (total `.lake` wipe still needs classic Lake
   library elaborate once -- honesty pin `hostResidualShrinkFullHostElaborateRemains`
   stays **true**).

Without-Lake hot path recipes now prefer clean-bootstrap in error text before
suggesting lake.

## Pin table (before -> after)

| Pin | Before | After |
|-----|--------|-------|
| `hostResidualShrinkBootstrapPrebuildRemains` | true | **false** |
| `hostResidualShrinkFullHostElaborateRemains` | true | **true** (unchanged) |
| `hostFoundationToolsBinLinkWithoutLakeDualOk` | (new) | **true** |
| `measuredHostFoundationToolsCleanBootstrap` | (new) | `host-foundation-tools-clean-bootstrap` |
| `measuredHostFoundationToolsInventory` | (new) | `fragment-check+graph+package-write+package-roots+import-graph+module-check` |
| DualResidual `hostElaboratorResidualRemains` | true | true (not edited) |
| DualResidual `hostElaboratorResidualFreeClaimed` | false | false (not edited) |

## Clean-tree policy (documented)

| Situation | Action |
|-----------|--------|
| Foundation bins missing; IR + `.rsp` present | `just host-foundation-tools-clean-bootstrap` (no lake) then without-Lake hot paths |
| Total wipe of `.lake/` | Classic Lake library/exe elaborate once to restore IR + rsp (`FullHostElaborateRemains`); then clean-bootstrap |
| Day-to-day measured host develop | Without-Lake recipes exec prebuilt ELFs only (no lake on hot path) |

**Not claimed:** freestanding rebuild of Lean-native tools from zero IR without
any prior Lake elaborate. That remains full host elaborate residual.

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates evidence

```bash
cd /home/hunter/Projects/ai/iso
(cd src/systems && lake build SystemsLean.HostResidualShrink)
# exit 0 -- Built SystemsLean.HostResidualShrink

# Bin-only clean then clean-bootstrap (no lake):
rm -f src/systems/.lake/build/bin/slake-host-{fragment-check,graph,package-write,package-roots,import-graph,module-check}
just host-foundation-tools-clean-bootstrap
# GREEN: 6 foundation tools relinked with leanc; no lake

just host-package-roots-without-lake   # GREEN
just host-import-graph-without-lake    # GREEN modules=12
just host-module-check-without-lake    # GREEN PARTIAL-STRUCTURAL modules=12
just host-residual-shrink              # GREEN A8 clean-bootstrap dual-ok

just hygiene        # source-hygiene OK; professional-tone OK
just systems-host   # systems-host-presence OK
```

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostResidualShrink.lean` | A8 pins; BootstrapPrebuildRemains false; ready/evidence fold; theorems |
| `just/host.just` | `host-foundation-tools-clean-bootstrap`; residual-shrink greps A8 |
| `just/host-without-lake.just` | prefer clean-bootstrap in missing-bin errors |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | A8 dual-pin tokens |
| `src/systems/SystemsLean/HostImportGraph.lean` | next residual cite A9 |
| `src/systems/SystemsLean/HostModuleCheck.lean` | next residual cite A9 |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | A8 Done; Open A9 |
| `WATCHER.md` / `doc/SESSION-HANDOFF.md` / `src/systems/self-host.md` | lockstep |
| design + plan | A8 done cite |

## Open next

**Host tool build expand** (A9 / design queue tool expand) -- inventory of host
tools still Lake vs clean-bootstrap/without-Lake owned; grow ownership beyond
foundation six. DualResidual free still held.

## Watcher next prompt

See `WATCHER.md` fenced block: `/implement --effort 1 Host tool build expand`
