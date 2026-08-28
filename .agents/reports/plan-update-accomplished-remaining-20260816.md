# Plan inventory: accomplished and remaining (2026-08-16)

Short reseed for rewriting the session plan. No claim-bool flips. Living
docs and reports agree. Grow HostImportGraphModsLater is **not** GREEN yet.
There is no ModsLater implement report and no `/tmp` ModsLater summary.

## Living metric

**23 of about 206** live modules typecheck on the Slake named ElabMeet path.

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **23 of about 206** |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s**. Slake cannot run that full-package job. |

Open Name: **Grow HostImportGraphModsLater subset**.
WATCHER, residual, handoff, and `plan-slake-replaces-lake.md` all name that
slice as the twenty-fourth member (barrel import 112). That is the locked
next Name. The count is still 23. Not BLOCKED.

## Already true (do not re-open)

- Product residual free is **true**. Freestanding product self-host complete
  is **true**. Product StillUsesLake / DependsOnLake are **false**.
- **PROVABLY** is **true** (CompCert product matrix in `just check`).
  That is wire correctness, not speed.
- Host residual free is **claimed** under free bar (a). DualResidual
  residualFreeClaimed is **true**. Host remaining is still false. That is
  **not** Lake gone.
- FullHostElaborateRemains is **false**. slakeOwnsPackageTypecheck is
  **false**. DominanceClaimed is **false**. Band FullBackend is **false**.
  llvmUnlocked is **true** (partial SSA, not a full backend).
- Linear / affine ownership is product law on the freestanding C wire.
  No product garbage collection. No Lean managed runtime on the consumer
  link.
- ElabMeet already drives package load, import follow, compile order,
  cycle reject, theorem check, oleans reuse, rebuild-when-changed, richer
  descriptions, libraries, executables, and source directories on **tiny
  fixtures**. Six-unit Mult through Compose checkers and writers are
  foundation only.

Closed named subset (23): Mult, Types, MultTheorems, TypesTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems,
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods.

## In flight and next grow Names

In flight: **Grow HostImportGraphModsLater** toward **24 of about 206**.
Live `HostImportGraphModsLater.lean` already exists (one import:
HostImportGraphMods). Brief next-after Name:
**Grow HostImportGraphLoadOkLater** (barrel import 114).

Barrel around the family:

| Import | Module | Grow rule |
|-------:|--------|-----------|
| 112 | HostImportGraphModsLater | in flight; becomes 24 |
| 113 | HostImportGraphLoadOk | do **not** open |
| 114 | HostImportGraphLoadOkLater | next after ModsLater |
| 119 | HostImportGraph (hub) | do **not** open |

Skip Linear, IrGraph, and HostCompose as grow-tip. Skip HostGraphMain
(lake exe root).

## Remaining finish line (ordinary English)

The operator finish line is four linked layers: Slake owns every Lake
job; Systems Lean has linear types; Slake emits runtimeless freestanding
C; CompCert actually compiles that C and rules out undefined behavior.

1. **Keep growing the named develop seed.** One live module per slice.
   Days to a couple of weeks for the nearby import-graph family after
   ModsLater. Do not claim the whole seed from this next slice.
2. **Whole-package typecheck stays unowned.** About 183 of 206 modules
   still need the Slake path. slakeOwnsPackageTypecheck stays false.
   Full Lean 4 / mathlib elaborator parity stays held. Weeks to months
   after the seed, not one Name.
3. **About 69 host tools still need Lake on the build step.** Zero of
   those tools build without Lake today. Larger than the seed grow.
4. **Linear binder Quantitative Type Theory (QTT) plus grade-1 use-check
   is not started.** Product C already carries linear types and CompCert
   seal. What remains is a real exact-once use-check so compilation
   proves memory safety instead of only emitting a linear API. That is
   the missing layer-2 deepen. Larger than the seed grow.
5. **Preserve what is already sealed.** Do not re-open free, complete,
   or PROVABLY. Do not flip FullHost, package-typecheck, Dominance, or
   FullBackend. Keep validating the CompCert matrix. Do not grow
   hand-written product C.

Estimate: seed family is **days to weeks**. Full package typecheck plus
the 69 tools plus linear use-check is **weeks to months**.
