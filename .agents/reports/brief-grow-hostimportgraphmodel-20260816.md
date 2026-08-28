# Grow HostImportGraphModel (22 of about 206)

GREEN decision: extract-first no for the walk (grow the Seeds walk),
new probe yes. Live `SystemsLean.HostImportGraphModel` becomes the
twenty-second named ElabMeet closed subset. Do not plant the live tip.

## What just shipped

Grow HostImportGraphSeeds is GREEN. Named closed subset is **21 of
about 206**. Isolation was `#elabMeetNamedHostImportGraphSeedsSubsetProbe`.
New walk landed at 170 lines. New Seeds probe landed at 203. HostPackageWrite
walk stayed 622. ElabMeet 761, ElabMeetTheorems 746, Subset 865, Compile 916.

Live product `HostImportGraphModel.lean` already exists (236 lines). One
import: `SystemsLean.HostImportGraphSeeds`. Namespace:
`SystemsLean.HostImportGraph`. No `HostImportGraphModelTheorems` sidecar
exists. Do not invent one. Do not plant a type error on the live file.

## Measured line counts (wc -l)

| Path | Lines |
|------|------:|
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 170 |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 (must stay) |
| ElabMeetNamedWalkHostGraphTheorems.lean | 191 |
| ElabMeetNamedWalkHostTerm.lean | 841 |
| ElabMeetSubset.lean | 865 |
| ElabMeetCompile.lean | 916 |
| ElabMeetNamedWalkTail.lean | 863 |
| ElabMeetNamedWalkLater.lean | 785 |
| ElabMeetNamedWalk.lean | 322 |
| ElabMeetTheorems.lean | 746 |
| ElabMeet.lean | 761 |
| ElabMeetNamedHostImportGraphSeedsProbe.lean | 203 |
| ElabMeetNamedHostPackageRootsProbe.lean | 205 |
| HostImportGraphModel.lean | 236 |
| HostImportGraphSeeds.lean | 713 |
| ElabMeetNamedWalkHostImportGraphModel.lean | missing (do not add) |
| ElabMeetNamedHostImportGraphModelProbe.lean | missing (required) |

`#elabMeetNamedHostImportGraphModelSubsetProbe` does not exist yet.

## Extract-first (walk no, probe yes)

Walk bar is about 780. Seeds walk 170 plus about 169-205 Model wrappers
is **339 to 375**, under 780. Wrappers **may** go on the Seeds walk.
Extract-first for a **new** walk file is **no**.

The Seeds brief sentence that said "170 + 169-188 would pass 780 / Model
needs its own walk" is wrong (that sum is 339-358). This brief uses
measured math.

Leftover / Subset bar is about 880. Subset 865 plus about 200-205 probe
is **1065 to 1070**, over 880. **New probe file is required.**

Do not grow HostPackageWrite 622, HostTerm 841, Compile 916, Tail 863,
Later 785 leftover wrappers, NamedWalk 322, or HostGraphTheorems walk 191.

## Exact new and changed files

**NEW probe only** (about 202-205 lines; clone Seeds probe 203):

`src/systems/SystemsLean/ElabMeetNamedHostImportGraphModelProbe.lean`

Namespace: `SystemsLean.ElabMeet`. Clone Seeds probe imports (`Lean`,
`ElabMeetLive`, `ElabMeetNamedWalk`, `ElabMeetNamedWalkHostPackageWrite`,
`ElabMeetNamedWalkHostImportGraphSeeds`). Do **not** import
`ElabMeetNamedWalkHostImportGraphModel`. Do not dump onto the Seeds
probe or onto `ElabMeetSubset`.

**Grow wrappers** on the existing Seeds walk (170 plus about 169-205 =
339-375, under 780):

`src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

Do **not** add `ElabMeetNamedWalkHostImportGraphModel.lean` unless a
later remeasure of that walk would pass 780.

Swap Seeds to Model on the ten wrappers:

- `findLiveHostImportGraphModelPath`
- `namedClosedHostImportGraphModelSubsetNames`
- `namedClosedHostImportGraphModelCompileOrder`
- `barrelListsNamedHostImportGraphModelSubset`
- `tryCompileNamedHostImportGraphModelSubsetIO`
- `tryCompileNamedHostImportGraphModelSubsetIOSafe`
- `tryCompileNamedHostImportGraphModelSubset`
- `tryCompileAfterHostImportGraphModelDepsIO`
- `tryCompileAfterHostImportGraphModelDepsIOSafe`
- `tryCompileAfterHostImportGraphModelDeps`

Shared helpers stay in `ElabMeetNamedWalk.lean`
(`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`,
`findLiveModulePath`, `barrelListsNamedMembers`,
`leftoverFakePackageLakefileText`). Do not clone those bodies.

**Fold / imports (no second product Model import):**

- `src/systems/SystemsLean.lean`: walk already imported at line 326.
  Add only `import SystemsLean.ElabMeetNamedHostImportGraphModelProbe`
  after line 334. Product `import SystemsLean.HostImportGraphModel`
  already exists at line 110. Do not add it again.
- `ElabMeet.lean`: walk already at 400. Import the new probe after 408.
  Fold the four Bools after 737 (after the Seeds four).
- `ElabMeetTheorems.lean`: walk already at 57. Import the new probe
  after 65. Four theorems after 744.

## Isolation, four Bools, four theorems

Isolation command (new, not an alias; confirmed unused):

```
#elabMeetNamedHostImportGraphModelSubsetProbe
```

Greppable companion: `elabMeetNamedHostImportGraphModelSubsetProbe`.

Drive is `good && !badCompiled && isolation`. Clone the Seeds fold
(probe 151-154). Prior subset is
`tryCompileNamedHostImportGraphSeedsSubset`. Alias check is
`notAliasOfTwentyFirst` versus Seeds names and compile order. This
names must contain `SystemsLean.HostImportGraphModel`. Seeds names
must not.

Four Bools:

1. `elabMeetAcceptsGoodNamedHostImportGraphModelSubset`
2. `elabMeetRejectsBadNamedHostImportGraphModelSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset`
4. `elabMeetDrivesNamedHostImportGraphModelSubset`

Four theorems in `ElabMeetTheorems.lean`, each
`= true := by native_decide` (do not rewrite):

1. `elabMeetDrivesNamedHostImportGraphModelSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphModelSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphModelSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset_true`

TDD: land the four theorems first so
`lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools.
Then grow the Seeds walk, add the probe, fold, and Nix. Same theorems
green. Probe examples use `rfl`. Lake cwd:
`/home/hunter/Projects/ai/iso/src/systems` only.

Good path: `tryCompileNamedHostImportGraphModelSubset` on the live
lakefile. Bad path: temp copy of live HostImportGraphModel plus
`plantedTypeError`, then `tryCompileAfterHostImportGraphModelDeps` as
`ElabMeetNamedHostImportGraphModelSubsetBad`. Do not edit live
`HostImportGraphModel.lean`.

## Compile list and after-deps

Membership `namedClosedHostImportGraphModelSubsetNames` =
`namedClosedHostImportGraphSeedsSubsetNames ++
["SystemsLean.HostImportGraphModel"]`. Barrel order among the
twenty-two. Skip Linear. Skip IrGraph as a named member. Skip
HostGraphMain. Last four: HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel.

Compile order `namedClosedHostImportGraphModelCompileOrder` =
Seeds compile order, then `SystemsLean.HostImportGraphModel` last.
Keep the twentieth extra-dep block (IrGraph, HostCompose, CompilePath,
six Emit*Scaffold, six Emit*, six CompilePath*, FirstSurface, six
*SubsetEmit, HostPackageWrite, HostPackageWriteTheorems), then
HostPackageRoots, then HostImportGraphSeeds, then HostImportGraphModel
**last**. Mult first. IrGraph and HostCompose stay compile
dependencies only.

After-deps `tryCompileAfterHostImportGraphModelDepsIO` = Seeds
after-deps plus `SystemsLean.HostImportGraphSeeds`. Model imports
Seeds, so the planted sidecar needs that closure. Last four:
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds.

## Live tip (already on disk)

Path: `src/systems/SystemsLean/HostImportGraphModel.lean` (236).
Header import is `import SystemsLean.HostImportGraphSeeds` only.
Once Seeds is the named twenty-first, Model is import-closed on that
twenty-one. Barrel import 110. Trust barrel imports, not the header
plus-list. HostImportGraph is import 119 (hub). Do not open it.

## Nix / barrel sites (same neighbors as Seeds)

Product Model is already listed (`required-files.nix` 128,
`host-leans.nix` 116). Do not add a second product import.

- `required-files.nix`: walk already at 461-462. Insert the new probe
  after the twenty-first probe (after 477-478). Next neighbor stays
  `ElabMeetSubset.lean`. Do not add a Model walk path.
- `host-leans.nix`: same (walk 446-447; probe after 462-463).
- `host-specs-hold-close.nix`:
  - Four Model Bools after Seeds Bools (1177-1180).
  - Grow the existing Seeds walk `rel` (2247-2268): add the Model
    wrapper tokens and `SystemsLean.HostImportGraphModel`. Do not add
    a new walk `rel`.
  - New probe spec after Seeds probe (2351-2376), before
    ElabMeetTheorems `rel` at 2378. Four Bools plus
    `elabMeetNamedHostImportGraphModelSubsetProbe` plus tip name plus
    honesty strings.
  - Four Model `_true` theorem strings after Seeds (2498-2501).

## Next-after Name

After land: **22 of about 206**.

Next Open Name: **Grow HostImportGraphMods** (barrel import **111**).
`HostImportGraphMods.lean` has one import:
`import SystemsLean.HostImportGraphModel`. Once Model is named, Mods
is import-closed on that twenty-two.

Do **not** recommend Grow HostImportGraph (import 119 hub). Skip
Linear. Skip IrGraph as a grow-tip. Skip HostGraphMain. Skip
HostCompose (still imports IrGraph).

## Out of scope / non-claims

Do not plant live `HostImportGraphModel.lean`. Do not invent
`HostImportGraphModelTheorems`. Do not add
`ElabMeetNamedWalkHostImportGraphModel.lean` on this slice. Do not
grow HostPackageWrite past 622. Do not grow Compile 916, Subset 865,
Tail 863, Later 785, NamedWalk 322, HostTerm 841, HostGraphTheorems
walk 191. Do not clone `tryCompileNamedMemberListIO`. Do not invent a
leftover-walk Name. Do not flip free / complete / PROVABLY. Stay
false: `slakeOwnsPackageTypecheck`,
`elabMeetFullHostElaborateRemains`,
`hostResidualShrinkFullHostElaborateRemains`,
`llvmCfgFixtureDominanceClaimed`, `llvmMultSsaFullBackendClaimed`,
SpecProof `residualFreeClaimed`. Stay true: DualResidual
`residualFreeClaimed`, SpecProof `proofCompleteClaimed`. Leave
`AGENTS.md` alone. No product C. No new shell. ASCII only. Still not
whole-package typecheck. Still not Lake gone.

## Done when

Named closed subset typechecks live HostImportGraphModel via
`tryCompileNamedMemberListIO`. Metric is **22 of about 206**. Accept
good. Reject planted error on a temp sidecar. Isolation versus the
twenty-first walk holds. Four theorems landed first, all
`= true := by native_decide`, not rewritten. Wrappers live on the
Seeds walk at about 339-375 lines (under 780). New probe about
202-205. HostPackageWrite walk stays 622. Live tip unchanged. Pins
unchanged. `just hygiene` and `just systems-host` green. Next Open
Name is **Grow HostImportGraphMods**.

GREEN: extract-first no (walk), new probe yes. Probe:
src/systems/SystemsLean/ElabMeetNamedHostImportGraphModelProbe.lean.
Wrapper home:
src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean.
Next-after: Grow HostImportGraphMods. Compile-list last:
SystemsLean.HostImportGraphModel. Isolation:
#elabMeetNamedHostImportGraphModelSubsetProbe.
