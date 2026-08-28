# L3: HostPackageRoots barrel + compile deps (twentieth named subset)

Date: 2026-08-16. Read-only. Grow HostPackageRoots is the next named closed subset.

## Barrel neighbors

`src/systems/SystemsLean.lean` import order (not the header plus-list):

```
104 import SystemsLean.HostGraph
105 import SystemsLean.HostGraphTheorems
106 import SystemsLean.HostPackageWrite
107 import SystemsLean.HostPackageWriteTheorems
108 import SystemsLean.HostPackageRoots
109 import SystemsLean.HostImportGraphSeeds
110 import SystemsLean.HostImportGraphModel
```

- Before: `HostPackageWriteTheorems` (nineteenth named member).
- Tip: `HostPackageRoots` (twentieth). Confirmed neighbor after HostPackageWriteTheorems.
- After: `HostImportGraphSeeds`. That is the 21st Open residual Name.

Header comment (lines 6-7) lists `HostImportGraph` before `HostImportGraphSeeds`. Real imports put `HostImportGraph` later (line 119), after Seeds/Model/Mods/LoadOk/Theorems/Walk/Driver. Do not grow HostImportGraph as the 21st Name.

Nearby HostPackage* / HostGraph* barrel imports: HostGraph, HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots; later HostModuleCheckHostGraphTerm, HostModuleCheckHostPackageWriteTerm, ElabMeetNamedWalkHostGraphTheorems, ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostGraph*Probe, ElabMeetNamedHostPackageWrite*Probe. No HostPackageRootsTheorems import.

## HostPackageRoots imports

File: `src/systems/SystemsLean/HostPackageRoots.lean`. Exact import list: **none**. No `import` lines. Implicit prelude / stdlib only (`String`, `Nat`, `IO`, `System.FilePath`).

Import-closed: yes. Does not import ElabMeet, HostCompose, IrGraph, HostPackageWrite, HostPackageWriteTheorems, HostGraph, or any other package-local SystemsLean module.

`HostImportGraphModsLater.hostPackageRootsMod` already records this as a pure leaf (`imports := []`).

## Compile-order extras

Nineteenth compile order (`namedClosedHostPackageWriteTheoremsCompileOrder` in `ElabMeetNamedWalkHostPackageWrite.lean`) already ends with HostPackageWrite, then HostPackageWriteTheorems, and already includes IrGraph and HostCompose as **compile dependencies only** (not named-member Names).

HostPackageRoots imports **fewer** than HostPackageWriteTheorems (which imports HostPackageWrite). Extra compile-order members required by HostPackageRoots itself: **none**.

Twentieth lists should be: membership = nineteen names + `SystemsLean.HostPackageRoots` last; compile order = nineteenth compile order + `SystemsLean.HostPackageRoots` last. Do **not** add IrGraph or HostCompose as grow-tip residual Names. They stay compile-deps from the prior subset only.

## Line counts

| Path | Lines |
|------|------:|
| `src/systems/SystemsLean/HostPackageRoots.lean` | 435 |
| `src/systems/SystemsLean/HostPackageWriteTheorems.lean` | 300 |
| `src/systems/SystemsLean/HostPackageWrite.lean` | 784 |

Counts from last line of each file (read; no `wc` in this specialist).

## Surprises

1. HostPackageRoots already holds theorems and the `main` driver in one 435-line file (under 1000). No sister Theorems module in the barrel.
2. Barrel header plus-list order disagrees with import order for HostImportGraph vs HostImportGraphSeeds. Trust imports.
3. HostPackageWrite (784) is the heavy import fan-out; HostPackageRoots does not ride that fan-out.
