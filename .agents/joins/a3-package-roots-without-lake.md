# Join: A3 Package roots without Lake

**Status:** IMPLEMENT complete + residual lockstep; verify gates (lake + without-lake recipe + hygiene + systems-host) for full GREEN
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A3 / design S1 Package load

## Goal met

First full-package host surface beyond six-unit Mult..Compose foundation:
load package library roots and SystemsLean module list for `src/systems/`
**without calling Lake on the measured step**. Inventory lists package map +
live module-count source. HostResidualShrink cites coverage. DualResidual host
residual remains true / free claimed false **unchanged**. free/complete/PROVABLY
and product Lake pins **unchanged**.

## Done when checklist

| Item | Evidence |
|------|----------|
| Measured recipe without Lake on hot path | `just host-package-roots-without-lake` (prebuilt `.lake/build/bin/slake-host-package-roots`; no lake build/exe/env on hot path) |
| Inventory lists roots / module-count source | Driver prints package name, library root, config path, library dir, `moduleCount`, `moduleCountSource=IO.FS.readDir ...`, sorted basenames |
| HostResidualShrink cites coverage | `measuredHostLakeFreePackageRoots = "host-package-roots-without-lake"`; `hostPackageRootsLoadDualOk = true`; folded into `hostDevelopMeasuredPathsLakeFreeEvidence` / `hostResidualShrinkReady` |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual lockstep | RESIDUAL-systems Done A3 + Open **Real Mult import graph**; RESIDUAL.md; WATCHER; SESSION-HANDOFF; self-host living tip |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostPackageRoots.lean` | **New** package map dual-pin + `loadPackageRoots` / `runPackageRoots` walk; without-Lake pins; theorems/smoke |
| `src/systems/SystemsLean/HostPackageRootsMain.lean` | **New** thin lake exe main |
| `src/systems/SystemsLean.lean` | Import HostPackageRoots |
| `src/systems/lakefile.lean` | `lean_exe "slake-host-package-roots"`; inventory 49 |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A3 recipe + dual-ok pins in evidence inventory |
| `just/host-without-lake.just` | `host-package-roots` + `host-package-roots-without-lake` |
| `just/host.just` | `host-residual-shrink` greps A3 tokens + recipe presence |
| `nix/systems-host-presence/required-files.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-leans.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | HostPackageRoots + Main + HostResidualShrink A3 tokens |
| `RESIDUAL-systems.md` | A3 Done; Open Real Mult import graph |
| `RESIDUAL.md` | Systems Open table A3 done / A4 open |
| `WATCHER.md` | next `/implement` Real Mult import graph |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual reseed; module count 264 |
| `src/systems/self-host.md` | Living tip A3 done + next Name |

## Surface summary

- **Package map (no lake):** package `SystemsLean`, library root `SystemsLean`,
  config `src/systems/lakefile.lean`, library dir `src/systems/SystemsLean`,
  package root shell `src/systems/SystemsLean.lean`.
- **Module list:** live `readDir` of library `.lean` files + package root shell;
  floor 200; seeds Mult / DualResidual / HostResidualShrink / HostPackageRoots.
- **Bootstrap:** one-time `lake build slake-host-package-roots` still required
  after clean (same honesty as other foundation without-Lake bins).
- **Not claimed:** full elaborate; full import graph; host free; Lake gone.

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates (operator / implementer verify)

```bash
cd /home/hunter/Projects/ai/iso
# Bootstrap once (not measured hot path):
(cd src/systems && lake build SystemsLean.HostPackageRoots SystemsLean.HostPackageRootsMain SystemsLean.HostResidualShrink slake-host-package-roots)
just host-package-roots-without-lake
just host-residual-shrink
just hygiene
just systems-host   # dual-pin presence (flake sees tracked files only until HITL stage)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that package.

## Open next

**Real Mult import graph** (A4 / design S2) -- checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Real Mult import graph
```

(see `WATCHER.md` for full body)
