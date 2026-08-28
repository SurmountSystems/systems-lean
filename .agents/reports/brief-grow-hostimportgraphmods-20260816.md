# Grow HostImportGraphMods (23 of about 206)

The GREEN decision is extract-first no for the walk (grow the Seeds walk)
and yes for a new probe. Live `SystemsLean.HostImportGraphMods` becomes the
twenty-third named ElabMeet closed subset. Do not plant the live tip.

## What just shipped

Grow HostImportGraphModel is GREEN. The named closed subset count is **22 of
about 206**. Isolation was `#elabMeetNamedHostImportGraphModelSubsetProbe`.
The Seeds walk grew to 305 lines. The new Model probe landed at 207 lines.
The HostPackageWrite walk stayed 622 lines. ElabMeet is 766 lines,
ElabMeetTheorems is 767, Subset is 866, and Compile is 917.

Live product `HostImportGraphMods.lean` already exists (about 775 lines; live
wc -l today 774). One import: `SystemsLean.HostImportGraphModel`. Namespace:
`SystemsLean.HostImportGraph`. Product RealMod fixtures only
(`multLeafMod` through `stepContractFullTheoremsMod`). No
`HostImportGraphModsTheorems` sidecar exists. Do not invent one. Do
not plant a type error on the live file.

## Measured line counts (wc -l)

| Path | Lines |
|------|------:|
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 305 |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 (must stay) |
| ElabMeetNamedWalkHostGraphTheorems.lean | 191 |
| ElabMeetNamedWalkHostTerm.lean | 841 |
| ElabMeetSubset.lean | 866 |
| ElabMeetCompile.lean | 917 |
| ElabMeetNamedWalkTail.lean | 864 |
| ElabMeetNamedWalkLater.lean | 786 |
| ElabMeetNamedWalk.lean | 322 |
| ElabMeetTheorems.lean | 767 |
| ElabMeet.lean | 766 |
| ElabMeetNamedHostImportGraphModelProbe.lean | 207 |
| ElabMeetNamedHostImportGraphSeedsProbe.lean | 203 |
| ElabMeetNamedHostPackageRootsProbe.lean | 205 |
| HostImportGraphMods.lean | 775 (live 774) |
| HostImportGraphModel.lean | 236 |
| HostImportGraphSeeds.lean | 713 |
| HostImportGraphModsLater.lean | 769 |
| ElabMeetNamedWalkHostImportGraphMods.lean | missing (do not add) |
| ElabMeetNamedHostImportGraphModsProbe.lean | missing (required) |

`#elabMeetNamedHostImportGraphModsSubsetProbe` does not exist yet.

## Extract-first (walk no, probe yes)

The walk bar is about 780 lines. Seeds walk 305 plus about 169-205 Mods wrappers
is **474 to 510**, under 780. Measured Model wrapper growth on that
same walk was about 110 (Seeds 196-305), so 305 plus 110 is **415**.
Wrappers **may** go on the Seeds walk. Extract-first for a **new**
walk file is **no**.

The leftover / Subset bar is about 880 lines. Subset 866 plus about 200-207 probe
is **1066 to 1073**, over 880. A **new probe file is required.**

Do not grow HostPackageWrite 622, HostTerm 841, Compile 917, Tail 864,
Later 786 leftover wrappers, NamedWalk 322, or HostGraphTheorems walk 191.

## Exact new and changed files

**NEW probe only** (about 203-207 lines; clone Model probe 207):

`src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean`

Namespace: `SystemsLean.ElabMeet`. Clone Model probe imports (`Lean`,
`ElabMeetLive`, `ElabMeetNamedWalk`, `ElabMeetNamedWalkHostPackageWrite`,
`ElabMeetNamedWalkHostImportGraphSeeds`). Do **not** import
`ElabMeetNamedWalkHostImportGraphMods`. Do not dump onto the Model
probe, the Seeds probe, or onto `ElabMeetSubset`.

**Grow wrappers** on the existing Seeds walk (305 plus about 110-205 =
415-510, under 780):

`src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

Do **not** add `ElabMeetNamedWalkHostImportGraphMods.lean` unless a
later remeasure of that walk would pass 780.

Swap Model to Mods on the ten wrappers:

- `findLiveHostImportGraphModsPath`
- `namedClosedHostImportGraphModsSubsetNames`
- `namedClosedHostImportGraphModsCompileOrder`
- `barrelListsNamedHostImportGraphModsSubset`
- `tryCompileNamedHostImportGraphModsSubsetIO`
- `tryCompileNamedHostImportGraphModsSubsetIOSafe`
- `tryCompileNamedHostImportGraphModsSubset`
- `tryCompileAfterHostImportGraphModsDepsIO`
- `tryCompileAfterHostImportGraphModsDepsIOSafe`
- `tryCompileAfterHostImportGraphModsDeps`

Shared helpers stay in `ElabMeetNamedWalk.lean`
(`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`,
`findLiveModulePath`, `barrelListsNamedMembers`,
`leftoverFakePackageLakefileText`). Do not clone those bodies.

**Fold / imports (no second product Mods import):**

- `src/systems/SystemsLean.lean`: walk already imported at line 326.
  Add only `import SystemsLean.ElabMeetNamedHostImportGraphModsProbe`
  after line 335 (after the Model probe). Product
  `import SystemsLean.HostImportGraphMods` already exists at line 111.
  Do not add it again.
- `ElabMeet.lean`: walk already at 400. Import the new probe after 409
  (after the Model probe). Fold the four Bools after 742 (after the
  Model four).
- `ElabMeetTheorems.lean`: walk already at 57. Import the new probe
  after 66. Four theorems after 765.

## Isolation, four Bools, four theorems

Isolation command (new, not an alias; confirmed unused):

```
#elabMeetNamedHostImportGraphModsSubsetProbe
```

Greppable companion: `elabMeetNamedHostImportGraphModsSubsetProbe`.

The drive is `good && !badCompiled && isolation`. Clone the Model fold.
The prior subset is `tryCompileNamedHostImportGraphModelSubset`. The alias
check is `notAliasOfTwentySecond` versus Model names and compile
order. These names must contain `SystemsLean.HostImportGraphMods`.
Model names must not contain that module.

Isolation versus the twenty-second (HostImportGraphModel) must hold:

- leftover temp `good.lean` is false (this walker rejects the
  leftover snippet)
- leftover fake package is false (this walker rejects
  `leftoverFakePackageLakefileText`)
- `tryCompileNamedHostImportGraphModelSubset` still succeeds
- twenty-third walk is not an alias of the twenty-second (only the
  twenty-third list contains `SystemsLean.HostImportGraphMods`)
- live `HostImportGraphMods.lean` is not planted
- live Mult and MultTheorems still compile

Four Bools:

1. `elabMeetAcceptsGoodNamedHostImportGraphModsSubset`
2. `elabMeetRejectsBadNamedHostImportGraphModsSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset`
4. `elabMeetDrivesNamedHostImportGraphModsSubset`

Four theorems in `ElabMeetTheorems.lean`, each
`= true := by native_decide` (do not rewrite):

1. `elabMeetDrivesNamedHostImportGraphModsSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphModsSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphModsSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset_true`

TDD: land the four theorems first so
`lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools.
Then grow the Seeds walk, add the probe, fold, and Nix. Same theorems
green. Probe examples use `rfl`. Lake cwd:
`/home/hunter/Projects/ai/iso/src/systems` only.

Good path: `tryCompileNamedHostImportGraphModsSubset` on the live
lakefile. Bad path: temp copy of live HostImportGraphMods plus
`plantedTypeError`, then `tryCompileAfterHostImportGraphModsDeps` as
`ElabMeetNamedHostImportGraphModsSubsetBad`. Do not edit live
`HostImportGraphMods.lean`.

## Compile list and after-deps

Membership `namedClosedHostImportGraphModsSubsetNames` =
`namedClosedHostImportGraphModelSubsetNames ++
["SystemsLean.HostImportGraphMods"]`. Barrel order among the
twenty-three. Skip Linear. Skip IrGraph as a named member. Skip
HostGraphMain. Last five: HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods.

Compile order `namedClosedHostImportGraphModsCompileOrder` =
Model compile order, then `SystemsLean.HostImportGraphMods` last.
Keep the Model extra-dep block (IrGraph, HostCompose, CompilePath,
six Emit*Scaffold, six Emit*, six CompilePath*, FirstSurface, six
*SubsetEmit, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel), then
HostImportGraphMods **last**. Mult first. IrGraph and HostCompose stay
compile dependencies only.

After-deps `tryCompileAfterHostImportGraphModsDepsIO` = Model
after-deps plus `SystemsLean.HostImportGraphModel`. Mods imports
Model, so the planted sidecar needs that closure. Last five:
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel.

## Live tip (already on disk)

Path: `src/systems/SystemsLean/HostImportGraphMods.lean` (about 775 lines; live wc -l today 774).
Header import is `import SystemsLean.HostImportGraphModel` only.
Once Model is the named twenty-second, Mods is import-closed on that
twenty-two. Barrel import 111. Trust barrel imports, not the header
plus-list. HostImportGraph is import 119 (hub). Do not open it.

## Nix / barrel sites (same neighbors as Model)

Product Mods is already listed (`required-files.nix` 129,
`host-leans.nix` 117). Do not add a second product import.

- `required-files.nix`: walk already at 461-462. Insert the new probe
  after the twenty-second probe (after 479-480). Next neighbor stays
  `ElabMeetSubset.lean`. Do not add a Mods walk path.
- `host-leans.nix`: same (walk 446-447; probe after 464-465).
- `host-specs-hold-close.nix`:
  - Four Mods Bools after Model Bools (1181-1184).
  - Grow the existing Seeds walk `rel` (2251-2272): add the Mods
    wrapper tokens and `SystemsLean.HostImportGraphMods`. Do not add
    a new walk `rel`.
  - New probe spec after Model probe (2388-2414), before
    ElabMeetTheorems `rel` at 2415. Four Bools plus
    `elabMeetNamedHostImportGraphModsSubsetProbe` plus tip name plus
    honesty strings.
  - Four Mods `_true` theorem strings after Model (2540-2543).

## Next-after Name

After this lands, the count is **23 of about 206**.

The Next Open Name is **Grow HostImportGraphModsLater** (barrel import **112**).
`HostImportGraphModsLater.lean` has one import:
`import SystemsLean.HostImportGraphMods`. Once Mods is named,
ModsLater is import-closed on that twenty-three.

Do **not** recommend Grow HostImportGraph (import 119 hub). Skip
Linear. Skip IrGraph as a grow-tip. Skip HostGraphMain. Skip
HostCompose (still imports IrGraph).

## Out of scope / non-claims

Do not plant live `HostImportGraphMods.lean`. Do not invent
`HostImportGraphModsTheorems`. Do not add
`ElabMeetNamedWalkHostImportGraphMods.lean` on this slice. Do not
grow HostPackageWrite past 622. Do not grow Compile 917, Subset 866,
Tail 864, Later 786, NamedWalk 322, HostTerm 841, HostGraphTheorems
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

The named closed subset typechecks live HostImportGraphMods via
`tryCompileNamedMemberListIO`. The metric is **23 of about 206**. Accept
the good path. Reject a planted error on a temp sidecar. Isolation versus the
twenty-second walk holds. Four theorems landed first, all
`= true := by native_decide`, and they were not rewritten. Wrappers live on the
Seeds walk at about 415-510 lines (under 780). The new probe is about
203-207 lines. The HostPackageWrite walk stays 622 lines. The live tip is
unchanged. The pins are unchanged. `just hygiene` and `just systems-host` are
green. The Next Open Name is **Grow HostImportGraphModsLater**.

Extract-first for the walk is no, and a new probe is yes. The probe path is
src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean.
The wrapper home is
src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean.
The Next-after Name is Grow HostImportGraphModsLater. The compile list ends
with SystemsLean.HostImportGraphMods. Isolation is
#elabMeetNamedHostImportGraphModsSubsetProbe.
