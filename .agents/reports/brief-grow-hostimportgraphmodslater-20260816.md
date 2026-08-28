# Grow HostImportGraphModsLater (24 of about 206)

The GREEN decision is extract-first no for the walk (grow the Seeds walk)
and yes for a new probe. Live `SystemsLean.HostImportGraphModsLater` becomes
the twenty-fourth named ElabMeet closed subset. Do not plant the live tip.

## Extract-first table

| Decision | Value |
|----------|-------|
| New probe | **yes** |
| New walk | **no** |
| Wrapper home | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` |
| Projected Seeds walk after wrappers | **577** from measured last delta (441 + 136). Range **551 to 646** if wrappers are 110 to 205. All under the walk bar of about 780. |
| Next-after Name | **Grow HostImportGraphLoadOkLater** |

Do **not** create `ElabMeetNamedWalkHostImportGraphModsLater.lean`. Seeds 441
plus a Mods-sized wrapper family stays under 780. Subset 865 plus a ~207
probe would pass about 880, so the probe must be a new file.

## What just shipped

Grow HostImportGraphMods is GREEN. The named closed subset count is **23 of
about 206**. Isolation was `#elabMeetNamedHostImportGraphModsSubsetProbe`.
The Seeds walk is 441 lines. The Mods probe is 207 lines. The
HostPackageWrite walk stayed 622 lines. ElabMeet is 771 lines,
ElabMeetTheorems is 789, Subset is 865, and Compile is 916.

Live product `HostImportGraphModsLater.lean` already exists (768 lines).
One import: `SystemsLean.HostImportGraphMods`. Namespace:
`SystemsLean.HostImportGraph`. Later RealMod fixtures plus good or bad
seeds. No `HostImportGraphModsLaterTheorems` sidecar exists. Do not invent
one. Do not plant a type error on the live file.

## Live measurements

Barrel `src/systems/SystemsLean.lean`:

| Line | Import |
|-----:|--------|
| 111 | `SystemsLean.HostImportGraphMods` |
| 112 | `SystemsLean.HostImportGraphModsLater` |
| 113 | `SystemsLean.HostImportGraphLoadOk` |
| 114 | `SystemsLean.HostImportGraphLoadOkLater` |
| 115 | `SystemsLean.HostImportGraphTheorems` |
| 116 | `SystemsLean.HostImportGraphWalkLater` |
| 117 | `SystemsLean.HostImportGraphWalk` |
| 118 | `SystemsLean.HostImportGraphDriver` |
| 119 | `SystemsLean.HostImportGraph` (hub; do not open) |

`HostImportGraphModsLater.lean` exists. Do not plant it. Last line is 768
(`end SystemsLean.HostImportGraph`). Header import is
`import SystemsLean.HostImportGraphMods` only. Product path is already
listed in `required-files.nix` (130) and `host-leans.nix` (118). Do not
add a second product import.

`ElabMeetNamedWalkHostImportGraphModsLater.lean` is missing. Leave it
missing. `ElabMeetNamedHostImportGraphModsLaterProbe.lean` is missing
and is required. Isolation
`#elabMeetNamedHostImportGraphModsLaterSubsetProbe` is unused.

### Line counts (last content line)

| Path | Lines |
|------|------:|
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 441 |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 (must stay) |
| ElabMeetNamedWalkHostGraphTheorems.lean | 191 |
| ElabMeetNamedWalkHostTerm.lean | 841 |
| ElabMeetSubset.lean | 865 |
| ElabMeetCompile.lean | 916 |
| ElabMeetNamedWalkTail.lean | 863 |
| ElabMeetNamedWalkLater.lean | 785 |
| ElabMeetNamedWalk.lean | 322 |
| ElabMeetTheorems.lean | 789 |
| ElabMeet.lean | 771 |
| ElabMeetNamedHostImportGraphModsProbe.lean | 207 |
| HostImportGraphModsLater.lean | 768 (live; already on disk) |
| HostImportGraphMods.lean | 774 (untouched product) |

Mods wrapper delta on Seeds was **136** (305 before Mods, 441 after).
That is the measured clone size for the next ten wrappers.

## Extract-first (walk no, probe yes)

The walk bar is about 780 lines. Seeds walk 441 plus about 110 to 205
ModsLater wrappers is **551 to 646**, under 780. Measured last wrapper
growth on that same walk was 136, so 441 plus 136 is **577**. Wrappers
**may** go on the Seeds walk. Extract-first for a **new** walk file is
**no**.

The leftover / Subset bar is about 880 lines. Subset 865 plus about
200 to 207 probe is **1065 to 1072**, over 880. A **new probe file is
required.**

Do not grow HostPackageWrite 622, HostTerm 841, Compile 916, Tail 863,
Later 785 leftover wrappers, NamedWalk 322, or HostGraphTheorems walk 191.

## Clone contract (retarget Mods to ModsLater)

**NEW probe only** (about 203 to 207 lines; clone Mods probe 207):

`src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean`

Namespace: `SystemsLean.ElabMeet`. Clone Mods probe imports (`Lean`,
`ElabMeetLive`, `ElabMeetNamedWalk`, `ElabMeetNamedWalkHostPackageWrite`,
`ElabMeetNamedWalkHostImportGraphSeeds`). Do **not** import
`ElabMeetNamedWalkHostImportGraphModsLater`. Do not dump onto the Mods
probe, the Model probe, the Seeds probe, or onto `ElabMeetSubset`.

**Grow wrappers** on the existing Seeds walk (441 plus about 110 to 205
= 551 to 646, under 780):

`src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

Do **not** add `ElabMeetNamedWalkHostImportGraphModsLater.lean`.

Swap Mods to ModsLater on the ten wrappers:

- `findLiveHostImportGraphModsLaterPath`
- `namedClosedHostImportGraphModsLaterSubsetNames`
- `namedClosedHostImportGraphModsLaterCompileOrder`
- `barrelListsNamedHostImportGraphModsLaterSubset`
- `tryCompileNamedHostImportGraphModsLaterSubsetIO`
- `tryCompileNamedHostImportGraphModsLaterSubsetIOSafe`
- `tryCompileNamedHostImportGraphModsLaterSubset`
- `tryCompileAfterHostImportGraphModsLaterDepsIO`
- `tryCompileAfterHostImportGraphModsLaterDepsIOSafe`
- `tryCompileAfterHostImportGraphModsLaterDeps`

Shared helpers stay in `ElabMeetNamedWalk.lean`
(`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`,
`findLiveModulePath`, `barrelListsNamedMembers`,
`leftoverFakePackageLakefileText`). Do not clone those bodies.

**Fold / imports (no second product ModsLater import):**

- `src/systems/SystemsLean.lean`: walk already imported at line 326.
  Add only `import SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe`
  after line 336 (after the Mods probe). Product
  `import SystemsLean.HostImportGraphModsLater` already exists at line 112.
  Do not add it again.
- `ElabMeet.lean`: walk already at 400. Import the new probe after 410
  (after the Mods probe). Fold the four Bools after 747 (after the
  Mods four).
- `ElabMeetTheorems.lean`: walk already at 58. Import the new probe
  after 68. Four theorems after 787.

### Isolation, four Bools, four theorems

Isolation command (new, not an alias; confirmed unused):

```
#elabMeetNamedHostImportGraphModsLaterSubsetProbe
```

Greppable companion: `elabMeetNamedHostImportGraphModsLaterSubsetProbe`.

The drive is `good && !badCompiled && isolation`. Clone the Mods fold.
The prior subset is `tryCompileNamedHostImportGraphModsSubset`. The alias
check is `notAliasOfTwentyThird` versus Mods names and compile order.
These names must contain `SystemsLean.HostImportGraphModsLater`.
Mods names must not contain that module.

Isolation versus the twenty-third (HostImportGraphMods) must hold:

- leftover temp `good.lean` is false (this walker rejects the leftover snippet)
- leftover fake package is false (this walker rejects
  `leftoverFakePackageLakefileText`)
- `tryCompileNamedHostImportGraphModsSubset` still succeeds
- twenty-fourth walk is not an alias of the twenty-third (only the
  twenty-fourth list contains `SystemsLean.HostImportGraphModsLater`)
- live `HostImportGraphModsLater.lean` is not planted
- live Mult and MultTheorems still compile

Four Bools:

1. `elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset`
2. `elabMeetRejectsBadNamedHostImportGraphModsLaterSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset`
4. `elabMeetDrivesNamedHostImportGraphModsLaterSubset`

Four theorems in `ElabMeetTheorems.lean`, each
`= true := by native_decide` (do not rewrite):

1. `elabMeetDrivesNamedHostImportGraphModsLaterSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphModsLaterSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset_true`

Good path: `tryCompileNamedHostImportGraphModsLaterSubset` on the live
lakefile. Bad path: temp copy of live HostImportGraphModsLater plus
`plantedTypeError`, then `tryCompileAfterHostImportGraphModsLaterDeps` as
`ElabMeetNamedHostImportGraphModsLaterSubsetBad`. Do not edit live
`HostImportGraphModsLater.lean`.

### Compile list and after-deps

Membership `namedClosedHostImportGraphModsLaterSubsetNames` =
`namedClosedHostImportGraphModsSubsetNames ++
["SystemsLean.HostImportGraphModsLater"]`. Barrel order among the
twenty-four. Skip Linear. Skip IrGraph as a named member. Skip
HostGraphMain. Last six: HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods,
HostImportGraphModsLater.

Compile order `namedClosedHostImportGraphModsLaterCompileOrder` =
Mods compile order, then `SystemsLean.HostImportGraphModsLater` last.
Keep the Mods extra-dep block (IrGraph, HostCompose, CompilePath,
six Emit*Scaffold, six Emit*, six CompilePath*, FirstSurface, six
*SubsetEmit, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel,
HostImportGraphMods), then HostImportGraphModsLater **last**. Mult first.
IrGraph and HostCompose stay compile dependencies only.

After-deps `tryCompileAfterHostImportGraphModsLaterDepsIO` = Mods
after-deps plus `SystemsLean.HostImportGraphMods`. ModsLater imports
Mods, so the planted sidecar needs that closure. Last six:
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods.

Live Mods after-deps list (clone and append HostImportGraphMods):

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
SystemsLean.HostImportGraphModel
```

Then add `SystemsLean.HostImportGraphMods`.

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

## Nix / barrel sites (same neighbors as Mods)

Product ModsLater is already listed. Do not add a second product import.

- `required-files.nix`: walk already at 461-462. Insert the new probe
  after the twenty-third probe (after 481-482). Next neighbor stays
  `ElabMeetSubset.lean`. Do not add a ModsLater walk path.
- `host-leans.nix`: same (walk 446-447; probe after 466-467).
- `host-specs-hold-close.nix`:
  - Four ModsLater Bools after Mods Bools (1185-1188).
  - Grow the existing Seeds walk `rel` (2255-2289): add the ModsLater
    wrapper tokens and `SystemsLean.HostImportGraphModsLater`. Do not
    add a new walk `rel`.
  - New probe spec after Mods probe (2427-2452), before
    ElabMeetTheorems `rel` at 2454. Four Bools plus
    `elabMeetNamedHostImportGraphModsLaterSubsetProbe` plus tip name
    plus honesty strings.
  - Four ModsLater `_true` theorem strings after Mods (2582-2585).

## Next-after Name

After this lands, the count is **24 of about 206**.

The honest Next Open Name is **Grow HostImportGraphLoadOkLater**
(barrel import **114**). `HostImportGraphLoadOkLater.lean` has one
import: `import SystemsLean.HostImportGraphModsLater`. Once ModsLater
is named, LoadOkLater is import-closed on that twenty-four.

Do **not** open Grow HostImportGraphLoadOk next (barrel 113). Live
`HostImportGraphLoadOk.lean` imports both
`SystemsLean.HostImportGraphModsLater` and
`SystemsLean.HostImportGraphLoadOkLater`. It is not import-closed
until LoadOkLater is a named member.

Do **not** recommend Grow HostImportGraph (import 119 hub). Skip
Linear. Skip IrGraph as a grow-tip. Skip HostGraphMain. Skip
HostCompose (still imports IrGraph).

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

## Out of scope / skips

Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain.
Do not invent leftover-walk Names. Do not plant live
`HostImportGraphModsLater.lean`. Do not invent
`HostImportGraphModsLaterTheorems`. Do not add
`ElabMeetNamedWalkHostImportGraphModsLater.lean` on this slice.
Do not grow HostPackageWrite past 622. Do not grow Compile 916,
Subset 865, Tail 863, Later 785, NamedWalk 322, HostTerm 841,
HostGraphTheorems walk 191. Do not clone `tryCompileNamedMemberListIO`.
No product C. No new shell. ASCII only.

## Primary paths implementer may touch

- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean` (NEW)
- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` (wrappers)
- `src/systems/SystemsLean/ElabMeet.lean` (import + four Bools fold)
- `src/systems/SystemsLean/ElabMeetTheorems.lean` (import + four theorems first)
- `src/systems/SystemsLean.lean` (probe import only)
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`
- residual / watcher / handoff after GREEN (not AGENTS.md)

Do not edit live `HostImportGraphModsLater.lean`.

## Done when

The named closed subset typechecks live HostImportGraphModsLater via
`tryCompileNamedMemberListIO`. The metric is **24 of about 206**. Accept
the good path. Reject a planted error on a temp sidecar. Isolation versus
the twenty-third walk holds. Four theorems landed first, all
`= true := by native_decide`, and they were not rewritten. Wrappers live
on the Seeds walk at about 551 to 646 lines (under 780). The new probe
is about 203 to 207 lines. The HostPackageWrite walk stays 622 lines.
The live tip is unchanged. The pins are unchanged. `just hygiene` and
`just systems-host` are green. The Next Open Name is
**Grow HostImportGraphLoadOkLater**.

Extract-first for the walk is no, and a new probe is yes. The probe path
is src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean.
The wrapper home is
src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean.
The Next-after Name is Grow HostImportGraphLoadOkLater. The compile list
ends with SystemsLean.HostImportGraphModsLater. Isolation is
#elabMeetNamedHostImportGraphModsLaterSubsetProbe.
