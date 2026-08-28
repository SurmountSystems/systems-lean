# Grow HostImportGraphLoadOkLater (25 of about 206)

This is an inventory brief only. Do not implement from this file until
a later implement pass. Do not plant live HostImportGraphLoadOkLater.lean.
Do not open Grow HostImportGraph (hub 119). Do not open Grow
HostImportGraphLoadOk (hub 113).

The GREEN decision is extract-first **no** for a new walk (reuse the
Seeds walk) and **yes** for a new probe. Live
`SystemsLean.HostImportGraphLoadOkLater` becomes the twenty-fifth named
ElabMeet closed subset. Clone HostImportGraphModsLater / HostImportGraphMods.

## Extract-first table

| Decision | Value |
|----------|-------|
| New probe | **yes** |
| New walk | **no** |
| Wrapper home | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` |
| Seeds walk now | **578** (after ModsLater wrappers; last content line is `end SystemsLean.ElabMeet`) |
| Projected Seeds walk after LoadOkLater wrappers | **712 to 715** from 578 plus about 134 to 137. Range **688 to 783** if wrappers are 110 to 205. Measured last delta was **137** (441 to 578). 578 plus 137 is **715**, under the walk bar of about 780. |
| Extract-first walk | **no** (715 stays under about 780; do not add a new walk file) |
| Next-after Name | **Grow HostImportGraphWalkLater** |

Do **not** create `ElabMeetNamedWalkHostImportGraphLoadOkLater.lean`.
Seeds 578 plus a ModsLater-sized wrapper family stays under 780.
Subset 865 plus a ~207 probe would pass about 880, so the probe must be
a new file.

## What already shipped (ModsLater clone source)

Grow HostImportGraphModsLater is on disk as the twenty-fourth named
subset. Isolation is `#elabMeetNamedHostImportGraphModsLaterSubsetProbe`.
The Seeds walk is 578 lines. The ModsLater probe is 207 lines. The
HostPackageWrite walk stayed 622 lines. ElabMeet is 776 lines,
ElabMeetTheorems is 811, Subset is 865, and Compile is 916.

Live product `HostImportGraphLoadOkLater.lean` already exists (526
lines). One import: `import SystemsLean.HostImportGraphModsLater`.
Namespace: `SystemsLean.HostImportGraph`. LoadOk later fold is
`hostImportGraphLoadOkImportEdges` (expand-seed per-module import
edges). No `HostImportGraphLoadOkLaterTheorems` sidecar exists. Do not
invent one. Do not plant a type error on the live file.

The hub `HostImportGraphLoadOk.lean` (498 lines) imports both
`SystemsLean.HostImportGraphModsLater` and
`SystemsLean.HostImportGraphLoadOkLater`. Do **not** add that hub to
this membership list. Extra-deps and compile order are ModsLater, then
LoadOkLater last.

## Live measurements

Barrel `src/systems/SystemsLean.lean` (comment on line 7 lists the same
names; product imports at 109-119):

| Line | Import |
|-----:|--------|
| 109 | `SystemsLean.HostImportGraphSeeds` |
| 110 | `SystemsLean.HostImportGraphModel` |
| 111 | `SystemsLean.HostImportGraphMods` |
| 112 | `SystemsLean.HostImportGraphModsLater` |
| 113 | `SystemsLean.HostImportGraphLoadOk` (hub; do not open) |
| 114 | `SystemsLean.HostImportGraphLoadOkLater` |
| 115 | `SystemsLean.HostImportGraphTheorems` |
| 116 | `SystemsLean.HostImportGraphWalkLater` |
| 117 | `SystemsLean.HostImportGraphWalk` |
| 118 | `SystemsLean.HostImportGraphDriver` |
| 119 | `SystemsLean.HostImportGraph` (hub; do not open) |

Barrel probe imports already stop at ModsLater:

| Line | Import |
|-----:|--------|
| 326 | `SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds` |
| 336 | `SystemsLean.ElabMeetNamedHostImportGraphModsProbe` |
| 337 | `SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe` |
| 338 | `SystemsLean.ElabMeetSubset` |

`HostImportGraphLoadOkLater.lean` exists. Do not plant it. Last line is
526 (`end SystemsLean.HostImportGraph`). Header import is
`import SystemsLean.HostImportGraphModsLater` only. Product path is
already listed in `required-files.nix` (132) and `host-leans.nix` (120).
Do not add a second product import.

`ElabMeetNamedWalkHostImportGraphLoadOkLater.lean` is missing. Leave it
missing. `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` is missing
and is required. Isolation
`#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe` is unused (zero
hits in the tree). There is no committed Bad sidecar.

### Line counts (last content line)

| Path | Lines |
|------|------:|
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 578 |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 (must stay) |
| ElabMeetNamedWalkHostGraphTheorems.lean | 191 |
| ElabMeetNamedWalkHostTerm.lean | 841 (do not grow) |
| ElabMeetSubset.lean | 865 (cannot take another ~200 probe) |
| ElabMeetCompile.lean | 916 (do not grow) |
| ElabMeetNamedWalkTail.lean | 863 (do not grow) |
| ElabMeetNamedWalkLater.lean | 785 (do not grow) |
| ElabMeetNamedWalk.lean | 322 |
| ElabMeetTheorems.lean | 811 |
| ElabMeet.lean | 776 |
| ElabMeetNamedHostImportGraphModsLaterProbe.lean | 207 |
| ElabMeetNamedHostImportGraphModsProbe.lean | 207 |
| HostImportGraphLoadOkLater.lean | 526 (live; already on disk) |
| HostImportGraphLoadOk.lean | 498 (hub; do not open) |
| HostImportGraphModsLater.lean | 768 |
| HostImportGraphMods.lean | 774 |
| HostImportGraphTheorems.lean | 173 (imports LoadOk hub; not this Name) |

ModsLater wrapper delta on Seeds was **137** (441 before ModsLater, 578
after). That is the measured clone size for the next ten wrappers.

## Extract-first (walk no, probe yes)

The walk bar is about 780 lines. Seeds walk 578 plus about 110 to 205
LoadOkLater wrappers is **688 to 783**. Measured last wrapper growth on
that same walk was 137, so 578 plus 137 is **715**. The prompt's ~134
gives 578 plus 134 = **712**. All of those stay under about 780. Wrappers
**may** go on the Seeds walk. Extract-first for a **new** walk file is
**no**.

If a later add would pass about 780, stop and extract then. This add
does not pass 780.

The leftover / Subset bar is about 880 lines. Subset 865 plus about
200 to 207 probe is **1065 to 1072**, over 880. A **new probe file is
required.** Tail 863 and Later 785 cannot absorb another leftover
wrapper without passing about 880. HostTerm 841 must stay.

## Clone contract (retarget ModsLater to LoadOkLater)

**NEW probe only** (about 203 to 207 lines; clone ModsLater probe 207):

`src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean`

Namespace: `SystemsLean.ElabMeet`. Clone ModsLater probe imports (`Lean`,
`ElabMeetLive`, `ElabMeetNamedWalk`, `ElabMeetNamedWalkHostPackageWrite`,
`ElabMeetNamedWalkHostImportGraphSeeds`). Do **not** import a new walk
module. Do not dump onto the ModsLater probe, the Mods probe, the Model
probe, the Seeds probe, or onto `ElabMeetSubset`.

**Grow wrappers** on the existing Seeds walk (578 plus about 134 to 137
= 712 to 715, under 780):

`src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

Do **not** add `ElabMeetNamedWalkHostImportGraphLoadOkLater.lean`.

Swap ModsLater to LoadOkLater on the ten wrappers:

- `findLiveHostImportGraphLoadOkLaterPath`
- `namedClosedHostImportGraphLoadOkLaterSubsetNames`
- `namedClosedHostImportGraphLoadOkLaterCompileOrder`
- `barrelListsNamedHostImportGraphLoadOkLaterSubset`
- `tryCompileNamedHostImportGraphLoadOkLaterSubsetIO`
- `tryCompileNamedHostImportGraphLoadOkLaterSubsetIOSafe`
- `tryCompileNamedHostImportGraphLoadOkLaterSubset`
- `tryCompileAfterHostImportGraphLoadOkLaterDepsIO`
- `tryCompileAfterHostImportGraphLoadOkLaterDepsIOSafe`
- `tryCompileAfterHostImportGraphLoadOkLaterDeps`

Shared helpers stay in `ElabMeetNamedWalk.lean`
(`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`,
`findLiveModulePath`, `barrelListsNamedMembers`,
`leftoverFakePackageLakefileText`). Do not clone those bodies.

**Fold / imports (no second product LoadOkLater import):**

- `src/systems/SystemsLean.lean`: walk already imported at line 326.
  Add only `import SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe`
  after line 337 (after the ModsLater probe). Product
  `import SystemsLean.HostImportGraphLoadOkLater` already exists at line
  114. Do not add it again. Do not add a LoadOk hub import to the
  membership list.
- `ElabMeet.lean`: walk already at 400. Import the new probe after 411
  (after the ModsLater probe). Fold the four Bools after 752 (after the
  ModsLater four).
- `ElabMeetTheorems.lean`: walk already at 59. Import the new probe
  after 70. Four theorems after 809.

### Isolation, four Bools, four theorems

Isolation command (new, not an alias; confirmed unused):

```
#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe
```

Greppable companion: `elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe`.

The drive is `good && !badCompiled && isolation`. Clone the ModsLater
fold. The prior subset is `tryCompileNamedHostImportGraphModsLaterSubset`.
The alias check is `notAliasOfTwentyFourth` versus ModsLater names and
compile order. These names must contain
`SystemsLean.HostImportGraphLoadOkLater`. ModsLater names must not
contain that module. Do **not** put `SystemsLean.HostImportGraphLoadOk`
on the twenty-fifth list.

Isolation versus the twenty-fourth (HostImportGraphModsLater) must hold:

- leftover temp `good.lean` is false (this walker rejects the leftover snippet)
- leftover fake package is false (this walker rejects
  `leftoverFakePackageLakefileText`)
- `tryCompileNamedHostImportGraphModsLaterSubset` still succeeds
- twenty-fifth walk is not an alias of the twenty-fourth (only the
  twenty-fifth list contains `SystemsLean.HostImportGraphLoadOkLater`)
- live `HostImportGraphLoadOkLater.lean` is not planted
- live Mult and MultTheorems still compile

Four Bools (retarget ModsLater names; defined by the new probe):

1. `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset`
2. `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset`
4. `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset`

Four theorems in `ElabMeetTheorems.lean`, each
`= true := by native_decide` (do not rewrite):

1. `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset_true`

Good path: `tryCompileNamedHostImportGraphLoadOkLaterSubset` on the live
lakefile. Bad path: temp copy of live HostImportGraphLoadOkLater plus
`plantedTypeError`, then `tryCompileAfterHostImportGraphLoadOkLaterDeps`
as `ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad`. Do not edit live
`HostImportGraphLoadOkLater.lean`. Do not commit a Bad sidecar.

### Compile list and after-deps

Membership `namedClosedHostImportGraphLoadOkLaterSubsetNames` =
`namedClosedHostImportGraphModsLaterSubsetNames ++
["SystemsLean.HostImportGraphLoadOkLater"]`. Barrel order among the
twenty-five. Skip Linear. Skip IrGraph as a named member. Skip
HostGraphMain. Skip HostCompose as a named member. Do **not** add
`SystemsLean.HostImportGraphLoadOk`. Last seven: HostPackageWriteTheorems,
HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel,
HostImportGraphMods, HostImportGraphModsLater,
HostImportGraphLoadOkLater.

Compile order `namedClosedHostImportGraphLoadOkLaterCompileOrder` =
ModsLater compile order, then `SystemsLean.HostImportGraphLoadOkLater`
last. Keep the ModsLater extra-dep block (IrGraph, HostCompose,
CompilePath, six Emit*Scaffold, six Emit*, six CompilePath*,
FirstSurface, six *SubsetEmit, HostPackageWrite,
HostPackageWriteTheorems, HostPackageRoots, HostImportGraphSeeds,
HostImportGraphModel, HostImportGraphMods), then HostImportGraphModsLater,
then HostImportGraphLoadOkLater **last**. Mult first. IrGraph and
HostCompose stay compile dependencies only.

After-deps `tryCompileAfterHostImportGraphLoadOkLaterDepsIO` = ModsLater
after-deps plus `SystemsLean.HostImportGraphModsLater`. LoadOkLater
imports ModsLater, so the planted sidecar needs that closure. Last six:

HostPackageWriteTheorems, HostPackageRoots, HostImportGraphSeeds,
HostImportGraphModel, HostImportGraphMods, HostImportGraphModsLater.

Live ModsLater after-deps list (clone and append HostImportGraphModsLater):

```
SystemsLean.Mult, SystemsLean.Types, SystemsLean.IrProgram,
SystemsLean.IrGraph, SystemsLean.Erasure, SystemsLean.Extract,
SystemsLean.HostCompose, SystemsLean.CompilePath,
six Emit*Scaffold, six Emit*, six CompilePath*,
SystemsLean.FirstSurface, SystemsLean.HostTerm,
SystemsLean.HostFrontGoldens, SystemsLean.HostFront,
SystemsLean.HostGraph, six *SubsetEmit,
SystemsLean.HostPackageWrite,
SystemsLean.HostPackageWriteTheorems,
SystemsLean.HostPackageRoots,
SystemsLean.HostImportGraphSeeds,
SystemsLean.HostImportGraphModel,
SystemsLean.HostImportGraphMods
```

Then add `SystemsLean.HostImportGraphModsLater`. Do not add
`SystemsLean.HostImportGraphLoadOk`.

## TDD order

1. Land the four theorems first in `ElabMeetTheorems.lean` so
   `lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools
   or a missing probe import.
2. Record that red (command, exit 1, unknown names). Lake cwd is
   `/home/hunter/Projects/ai/iso/src/systems` only.
3. Grow the Seeds walk wrappers. Add the new probe. Fold imports and
   four Bools. Update Nix presence.
4. Re-run the same lake filter. Same four theorems green via
   `native_decide`. Do not rewrite theorems. Probe examples use `rfl`.

## Nix / barrel sites (same neighbors as ModsLater)

Product LoadOkLater is already listed. Do not add a second product import.
LoadOkLater probe is **not** listed yet.

`required-files.nix` product neighbors (130-133):

```
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOk.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean"
  "src/systems/SystemsLean/HostImportGraphTheorems.lean"
```

`required-files.nix` probe neighbors (481-486):

```
  # Twenty-third HostImportGraphMods named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean"
  # Twenty-fourth HostImportGraphModsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean"
  # Named closed subset from the real package description.
  "src/systems/SystemsLean/ElabMeetSubset.lean"
```

`host-leans.nix` product neighbors (118-121):

```
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOk.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean"
  "src/systems/SystemsLean/HostImportGraphTheorems.lean"
```

`host-leans.nix` probe neighbors (466-471):

```
  # Twenty-third HostImportGraphMods named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean"
  # Twenty-fourth HostImportGraphModsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean"
  # Named closed subset from the real package description.
  "src/systems/SystemsLean/ElabMeetSubset.lean"
```

Insert the new probe **after** the ModsLater probe and **before**
`ElabMeetSubset.lean`. Next neighbor stays `ElabMeetSubset.lean`. Do not
add a LoadOkLater walk path. Do not add the LoadOk hub as a named
subset member.

`host-specs-hold-close.nix` already has ModsLater Bools (1189-1192),
ModsLater wrapper tokens (2288-2294), and ModsLater probe `rel`
(2465-2490). There is no LoadOkLater probe `rel`. Add four LoadOkLater
Bools after ModsLater, grow the existing Seeds walk `rel` with
LoadOkLater wrapper tokens, add a new probe spec after the ModsLater
probe `rel`, and add four `_true` theorem strings. Do not add a new
walk `rel`.

## Next-after Name

After this lands, the count is **25 of about 206**.

The honest Next Open Name is **Grow HostImportGraphWalkLater**
(barrel import **116**). That is the next barrel *Later companion after
slot 114. `HostImportGraphWalkLater.lean` has one import:
`import SystemsLean.HostImportGraphModel`. Model is already a named
member, so WalkLater is import-closed on the twenty-five without the
LoadOk hub.

Do **not** open Grow HostImportGraphLoadOk (barrel 113 hub). Do **not**
open Grow HostImportGraph (import 119 hub). Do **not** open Grow
HostImportGraphTheorems next: live `HostImportGraphTheorems.lean`
imports `SystemsLean.HostImportGraphLoadOk`, and that hub stays out.

Skip Linear. Skip IrGraph as a grow-tip. Skip HostGraphMain. Skip
HostCompose (still imports IrGraph). Do not invent leftover-walk Names.

## Pins / non-claims

Leave `AGENTS.md` alone. Do not flip free / complete / PROVABLY.

Stay **false**:

- `slakeOwnsPackageTypecheck`
- `elabMeetFullHostElaborateRemains`
- `hostResidualShrinkFullHostElaborateRemains`
- `llvmCfgFixtureDominanceClaimed`
- `llvmMultSsaFullBackendClaimed`
- SpecProof `residualFreeClaimed`

Stay **true**:

- DualResidual `residualFreeClaimed`
- SpecProof `proofCompleteClaimed`

Still not whole-package typecheck. Still not Lake gone.
Lake cwd is `src/systems`.

## Out of scope / skips

Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain.
Do not invent leftover-walk Names. Do not plant live
`HostImportGraphLoadOkLater.lean`. Do not invent
`HostImportGraphLoadOkLaterTheorems`. Do not add
`ElabMeetNamedWalkHostImportGraphLoadOkLater.lean` on this slice.
Do not grow HostPackageWrite past 622. Do not grow Compile 916,
Subset 865, Tail 863, Later 785, NamedWalk 322, HostTerm 841,
HostGraphTheorems walk 191. Do not clone `tryCompileNamedMemberListIO`.
No product C. No new shell. ASCII only. Leave AGENTS.md alone.

## Primary paths implementer may touch

- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` (NEW)
- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` (wrappers)
- `src/systems/SystemsLean/ElabMeet.lean` (import + four Bools fold)
- `src/systems/SystemsLean/ElabMeetTheorems.lean` (import + four theorems first)
- `src/systems/SystemsLean.lean` (probe import only)
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`
- residual / watcher / handoff after GREEN (not AGENTS.md)

Do not edit live `HostImportGraphLoadOkLater.lean`.
Do not edit live `HostImportGraphLoadOk.lean`.

## Done when

The named closed subset typechecks live HostImportGraphLoadOkLater via
`tryCompileNamedMemberListIO`. Twenty-four-plus-HostImportGraphLoadOkLater
becomes **25 of about 206**. Accept good / reject planted error.
Isolation vs the prior twenty-four-module walk. Leftover temp good.lean
and leftover fake lean_lib ElabMeetRichLib stay false. Four theorems
FIRST, all `= true := by native_decide`, before the Bools exist. TDD
red then extract-first (reuse Seeds walk) then implement then green.
Theorems not rewritten. Pins stay false. Hygiene plus focused lake
(cwd `src/systems`) and `just systems-host` green.
