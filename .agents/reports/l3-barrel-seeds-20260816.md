# Barrel import order and HostImportGraphSeeds (2026-08-16)

Read-only measure. Product Lean was not edited.

## Barrel excerpt (SystemsLean.lean lines 100-120)

Residual names these as barrel import numbers (file line numbers, not 1-based ordinals). First `import` is line 40.

```
100  HostFrontGoldens
101  HostFront
102  HostFrontTheorems
103  HostCheck
104  HostGraph
105  HostGraphTheorems
106  HostPackageWrite
107  HostPackageWriteTheorems
108  HostPackageRoots
109  HostImportGraphSeeds
110  HostImportGraphModel
111  HostImportGraphMods
112  HostImportGraphModsLater
113  HostImportGraphLoadOk
114  HostImportGraphLoadOkLater
115  HostImportGraphTheorems
116  HostImportGraphWalkLater
117  HostImportGraphWalk
118  HostImportGraphDriver
119  HostImportGraph
120  HostModuleCheckRequiredDecls
```

| Question | On disk |
|----------|---------|
| HostPackageRoots import number | **108** |
| Immediately after HostPackageRoots | **HostImportGraphSeeds** (109) |
| HostImportGraphSeeds import number | **109** (present) |
| Immediately after HostImportGraphSeeds | **HostImportGraphModel** (110) |
| HostImportGraph vs Seeds | **After.** Seeds 109; hub HostImportGraph 119 |
| HostGraphMain in the barrel | **No.** No `import SystemsLean.HostGraphMain`. Lake exe root `SystemsLean.HostGraphMain` (`slake-host-graph`) exists as its own file and is not a barrel member. HostImportGraphMain is also not in the barrel (`slake-host-import-graph` roots there). |

Header comment at the top of `SystemsLean.lean` lists `HostPackageRoots + HostImportGraph + HostImportGraphSeeds`. That comment is stale. Live import order is Roots, then Seeds, then Model through Driver, then the hub.

## HostImportGraphSeeds

Path: `src/systems/SystemsLean/HostImportGraphSeeds.lean`

| Fact | Value |
|------|--------|
| Line count | **713** |
| Import list | **empty.** Zero `import` lines. File opens the header, then `namespace SystemsLean.HostImportGraph`. |
| Import-closed | **Yes.** It does not import ElabMeet, HostCompose, IrGraph, HostPackageRoots, or HostImportGraph. Those names appear only as **string data** in `hostImportGraphSeedModules` / seed path lists (HostPackageRoots is a seed string; IrGraph and HostCompose are seed strings; ElabMeet and HostImportGraph are not even in the seed list). |
| HostImportGraphSeedsTheorems | **Does not exist.** No file, no barrel import, no hit under `src/systems`. Family theorems live in `HostImportGraphTheorems.lean` (imports `HostImportGraphLoadOk`, not Seeds). |
| Theorems / main in this file | **Neither.** No Lean `theorem`. No `def main`. Honesty `def`s, seed lists, and reject-reason strings only. |
| Namespace | `SystemsLean.HostImportGraph` (same as the hub) |
| Lake exe | **No exe on this module.** Header names `slake-host-import-graph` as a string. Lakefile roots that exe at `SystemsLean.HostImportGraphMain`, which imports the hub. |
| Public defs (role) | Stage/host ids, lake/just names, `hostImportGraphSeedModules` (206 dotted names, Mult through SpecProofTheorems), matching relative paths, expand-slice name, seed-units label, Lake-honesty bools, reject tokens (`MISSING-IMPORT`, `IMPORT-CYCLE`, and so on). |

## Next-after Name (twenty-second Open)

After **Grow HostImportGraphSeeds subset** (twenty-first named member; currently Open), the next barrel neighbor is **HostImportGraphModel**.

**Twenty-second Open Name:** Grow HostImportGraphModel subset.

Model is not a leaf: it has one import, `SystemsLean.HostImportGraphSeeds`. Once Seeds is in the closed twenty-one, Model is import-closed on that twenty-one.

## Why skip Grow HostImportGraph

`src/systems/SystemsLean/HostImportGraph.lean` is **46 lines**. It is an import hub only (no defs). Imports:

1. HostImportGraphSeeds
2. HostImportGraphModel
3. HostImportGraphMods
4. HostImportGraphModsLater
5. HostImportGraphLoadOk
6. HostImportGraphTheorems
7. HostImportGraphWalkLater
8. HostImportGraphWalk
9. HostImportGraphDriver

Opening Grow HostImportGraph now would pull that whole companion stack, not one import-closed companion. Residual and watcher already say skip it. Grow Seeds first. HostGraphMain stays skipped: lake exe root, not in the barrel.
