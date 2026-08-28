# Plan inventory: finish line (2026-08-16)

Read-only join for rewriting the session plan. No claim-bool flips.
Living residual still owns the metric. Product Lean may be ahead of residual.

## Living tip

**23 of about 206** live modules on the named ElabMeet path.

Open Name: **Grow HostImportGraphModsLater subset**.

| Surface | Status |
|---------|--------|
| `RESIDUAL-systems.md` Open / queue row 150 | **open**; 23 of about 206 |
| `RESIDUAL.md` Highest-value next | **Grow HostImportGraphModsLater subset**; 23 of about 206 |
| `WATCHER.md` | `/implement --effort 2 Grow HostImportGraphModsLater` |
| `doc/SESSION-HANDOFF.md` | Next is Grow HostImportGraphModsLater; metric 23 of about 206 |
| `.agents/plans/plan-slake-replaces-lake.md` | Same next; 23 of about 206 |

Closed named subset (23): Mult, Types, MultTheorems, TypesTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems,
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods.

### ModsLater residual GREEN

**No.** There is no implement report at
`.agents/reports/impl-grow-hostimportgraphmodslater-20260816.md`
and no `/tmp` summary
`/tmp/grok-1000/grok-impl-summary-grow-hostimportgraphmodslater-20260816.md`.
Living docs still say 23 and still queue the Name.

Product Lean already contains a twenty-fourth land that residual has **not**
closed: `ElabMeetNamedHostImportGraphModsLaterProbe.lean` exists (207 lines),
barrel import 337, walk wrappers in
`ElabMeetNamedWalkHostImportGraphSeeds.lean`, four `native_decide` theorems
in `ElabMeetTheorems.lean`, and `ElabMeet.lean` folds the four bools into
`elabMeetReady`. This inventory does **not** treat that as residual GREEN.
No lake build was run this turn. Do not bump the living count until residual
closeout with lake proof.

### Line counts (on disk now)

| File | Lines |
|------|------:|
| `ElabMeetNamedWalkHostImportGraphSeeds.lean` | 575 (docs still say 441) |
| `ElabMeetSubset.lean` | 865 |
| `ElabMeetTheorems.lean` | 811 (docs still say 789) |
| `ElabMeet.lean` | 775 (docs still say 771) |
| `ElabMeetNamedWalk.lean` | 322 (from living docs) |
| `ElabMeetNamedWalkLater.lean` | 785 (from living docs) |
| `ElabMeetNamedWalkTail.lean` | 863 (from living docs) |
| `ElabMeetCompile.lean` | 916 (do not grow) |
| `ElabMeetNamedHostImportGraphModsLaterProbe.lean` | 207 |

Seeds walk 575 is under the about-780 extract bar. Subset 865 is under
about 880. Tail 863 and Later 785 still cannot take another leftover
wrapper.

### Barrel around the family (`SystemsLean.lean`)

| Import | Module | Grow rule |
|-------:|--------|-----------|
| 112 | HostImportGraphModsLater | in flight; product file exists; one import HostImportGraphMods |
| 113 | HostImportGraphLoadOk | do **not** open the hub |
| 114 | HostImportGraphLoadOkLater | next locked grow after ModsLater residual closes; imports ModsLater |
| 119 | HostImportGraph (hub) | do **not** open |

## Already true (do not flip)

- Product residual free (claim A): **true**. DualResidual
  `residualFreeClaimed` **true**. `productResidualRemains` **false**.
- Freestanding product self-host complete (claim B): **true**.
- Product `StillUsesLake` / `DependsOnLake` on the official path: **false**
  (`SelfHostComplete.productPathOfficialPathStillUsesLake` false;
  `productPathPerformDependsOnLake` false).
- **PROVABLY** (`provablyUnlocked`): **true**. Evidence is the CompCert
  product matrix in `just check` (`product-compcert-matrix` / real `ccomp`).
  That is wire correctness, not speed, and not a linear-binder use-check.
- Host residual free: **claimed** under free bar (a). DualResidual
  `hostElaboratorResidualFreeClaimed` **true**;
  `hostElaboratorResidualRemains` **false**. That is **not** Lake gone.
- SpecProof `proofCompleteClaimed`: **true** (Track 4c bar only).
  SpecProof `residualFreeClaimed`: **false** (local; DualResidual owns
  product free).
- Linear / affine ownership is product law. HOST-EMIT-LINEAR owns
  ConsumeToken C text. No product garbage collection. No Lean managed
  runtime on `out/freestanding-c`. `just build` writes emit and installs
  the release surface. Lake is not required on that product step.
- LLVM unlocked: **true** (partial SSA). Fixture A-light fullBackend may
  be true; band FullBackend stays false.
- ElabMeet already drives tiny-fixture package load, import follow,
  compile order, cycle reject, theorem check, oleans reuse,
  rebuild-when-changed, richer descriptions, libraries, executables,
  and source directories. Six-unit Mult through Compose checkers are
  foundation only.
- Same-job Lake idle-hot: **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`).
  Slake cannot run that full-package job.

`src/systems/lakefile.lean` has **69** `lean_exe` registrations
(71 greps minus two comment lines).

## Still false (do not flip)

| Pin | Value |
|-----|-------|
| `ElabMeet.slakeOwnsPackageTypecheck` | **false** |
| `ElabMeet.elabMeetFullHostElaborateRemains` | **false** |
| `HostResidualShrink.hostResidualShrinkFullHostElaborateRemains` | **false** |
| `LlvmCfgHonesty.llvmCfgFixtureDominanceClaimed` | **false** |
| `LlvmMultSsa.llvmMultSsaFullBackendClaimed` | **false** |

## Remaining work map

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **23 of about 206** |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check (binder QTT / MULT-1 exact-once) | **not started** |
| Same-job time | Lake idle-hot **0.459 s**. Slake cannot do that job. |

What Lake still owns: whole-package typecheck of `src/systems`, and
building the about 69 host tools. Slake owns a 23-module named subset
plus tiny fixture jobs. After the named develop seed, about **183**
modules remain, then the 69 tools, then linear use-check.

### Skip as grow-tip

Linear as a named membership member. IrGraph. HostCompose. HostGraphMain
(lake exe root). Grow HostImportGraph hub. Grow HostImportGraphLoadOk
hub. Do not invent a leftover-walk Name.

### Next after Approve

Locked next Name is still **Grow HostImportGraphModsLater subset**
(residual closeout or finish; living count stays 23 until residual
closes). After that closes: **Grow HostImportGraphLoadOkLater subset**
(barrel 114; imports ModsLater).

Extract-first bars stay: Tail / Later about 880 leftover wrappers;
Seeds walk about 780; Subset about 880.

### Finish-line phases (ordinary English)

The operator finish line is four linked layers: Slake owns every Lake
job; Systems Lean has linear types; Slake emits runtimeless freestanding
C; CompCert compiles that C and rules out undefined behavior on the
product wire.

1. **Grow the named develop seed.** One live module per slice. Nearby
   import-graph family is days to a couple of weeks. Do not claim the
   whole seed from ModsLater.
2. **Whole-package typecheck stays unowned.** About 183 of 206 modules
   still need the Slake path. `slakeOwnsPackageTypecheck` stays false.
   Full Lean 4 / mathlib elaborator parity stays held. Weeks to months
   after the seed, not one Name.
3. **About 69 host tools still need Lake on the build step.** Zero of
   those tools build without Lake today.
4. **Linear binder Quantitative Type Theory plus grade-1 use-check is
   not started.** Product C already carries HOST-EMIT-LINEAR and CompCert
   seal. What remains is a real exact-once use-check so compilation
   proves memory safety instead of only emitting a linear API.
5. **Preserve what is already sealed.** Do not re-open free, complete,
   or PROVABLY. Do not flip FullHost, package-typecheck, Dominance, or
   FullBackend.

Estimate: seed family is **days to weeks**. Full package typecheck plus
the 69 tools plus linear use-check is **weeks to months**.

Prior inventory (same day, agrees on 23 / not residual GREEN):
`.agents/reports/plan-update-accomplished-remaining-20260816.md`.
This finish-line pass adds CompCert / use-check honesty and notes the
unclosed ModsLater product land.

## Report paths

- `/tmp/grok-1000/grok-plan-inventory-finish-line-20260816.md`
- `/home/hunter/Projects/ai/iso/.agents/reports/plan-update-finish-line-20260816.md`
