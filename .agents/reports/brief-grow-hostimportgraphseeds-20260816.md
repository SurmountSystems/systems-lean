# Grow HostImportGraphSeeds (21 of about 206)

Date: 2026-08-16. Read-only implement brief. Do not invent the
product module. `SystemsLean.HostImportGraphSeeds` already exists.
Do not plant a type error on the live file. Do not open Grow
HostImportGraph.

Living Open after HostPackageRoots (20 of about 206 GREEN):
**Grow HostImportGraphSeeds** (residual Name: Grow HostImportGraphSeeds
subset). Confirmed on `WATCHER.md` and `RESIDUAL-systems.md` Open
queue item 147 / living Open block. Barrel import 109.

Citations: `.agents/reports/l3-elabmeet-wc-20260816.md`,
`.agents/reports/l3-barrel-seeds-20260816.md`,
`.agents/reports/l3-clone-hostpackageroots-20260816.md`,
`.agents/reports/brief-grow-hostpackageroots-20260816.md`.

## 1. Name and goal

**Name:** Grow HostImportGraphSeeds.

**Goal:** Land `SystemsLean.HostImportGraphSeeds` as the twenty-first
named ElabMeet closed subset. The product module already exists as
barrel import 109 and has no import lines. HostPackageRoots is already
in the closed twenty. Typecheck the live tip via
`tryCompileNamedMemberListIO`. After land the metric is **21 of about
206**.

Trust barrel imports in `src/systems/SystemsLean.lean`, not the header
plus-list. The plus-list may mention HostImportGraph before
HostImportGraphSeeds. Live import order is HostPackageRoots (108),
then HostImportGraphSeeds (109), then HostImportGraphModel (110).
HostImportGraph is import 119. It is a 46-line hub that imports nine
companions. Do not open Grow HostImportGraph.

## 2. Product file facts

Line counts are last content line on disk (same as `wc -l` on a
newline-terminated file). Extract bar for ElabMeet walk files is about
780. Over that bar: do not grow; extract a role module first.

| Path | Lines | Versus about-780 |
|------|------:|------------------|
| `ElabMeetNamedWalk.lean` | 322 | under |
| `ElabMeetNamedWalkLater.lean` | 785 | **over** |
| `ElabMeetNamedWalkTail.lean` | 863 | **over** |
| `ElabMeetNamedWalkHostTerm.lean` | 841 | **over** |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | 191 | under |
| `ElabMeetNamedWalkHostPackageWrite.lean` | 622 | under. Twentieth wrappers live here. No dedicated HostPackageRoots walk. |
| `ElabMeetSubset.lean` | 865 | **over**. Cannot take another thin probe. |
| `ElabMeetCompile.lean` | 916 | **over** |
| `ElabMeet.lean` | 755 | under |
| `ElabMeetTheorems.lean` | 723 | under. Twentieth theorems at 703-721. |
| `ElabMeetNamedHostPackageRootsProbe.lean` | 205 | under. Twentieth probe. |
| `HostImportGraphSeeds.lean` | 713 | under |
| `HostImportGraph.lean` | 46 | under. Import hub only. |
| `ElabMeetNamedHostImportGraphSeedsProbe.lean` | missing | twenty-first probe does not exist yet |
| `ElabMeetNamedWalkHostImportGraphSeeds.lean` | missing | twenty-first walk does not exist yet |
| `HostImportGraphSeedsTheorems.lean` | missing | do not invent it |

### HostImportGraphSeeds import-closed facts

Path: `src/systems/SystemsLean/HostImportGraphSeeds.lean`.

- 713 lines. Last content line is `end SystemsLean.HostImportGraph`.
- Zero `import` lines. Import-closed leaf. Prelude only.
- Namespace is `SystemsLean.HostImportGraph` (same as the hub).
- No Lean `theorem`. No `def main`. No lake exe on this module.
- `HostImportGraphSeedsTheorems` does not exist. Family theorems live
  in `HostImportGraphTheorems.lean`, which does not import Seeds.
- HostImportGraph, ElabMeet, HostCompose, IrGraph, and HostPackageRoots
  are not imports. Those names may appear only as string data in seed
  lists. Do not treat seed strings as Lean imports.
- Lakefile roots `slake-host-import-graph` at
  `SystemsLean.HostImportGraphMain`, which imports the hub. Skip
  HostGraphMain (and HostImportGraphMain): lake exe roots, not barrel
  members.

### Barrel 100-120

`src/systems/SystemsLean.lean` lines 100-120:

HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots (108), HostImportGraphSeeds (109),
HostImportGraphModel (110), HostImportGraphMods,
HostImportGraphModsLater, HostImportGraphLoadOk,
HostImportGraphLoadOkLater, HostImportGraphTheorems,
HostImportGraphWalkLater, HostImportGraphWalk, HostImportGraphDriver,
HostImportGraph (119), HostModuleCheckRequiredDecls.

HostGraphMain is not in the barrel.

Named members today (20 of about 206): Mult, MultTheorems, Types,
TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems,
IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems,
HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots.

Skip Linear as a grow tip. Skip IrGraph as a grow-tip residual Name
(it may still appear as a compile dependency). HostCompose still
imports IrGraph, so HostCompose stays blocked as a grow tip.

## 3. Extract-first decision with arithmetic

Twentieth wrapper block on
`ElabMeetNamedWalkHostPackageWrite.lean` is lines 449-620. That is
**172** lines of defs. The file grew 434 to 622 (**+188** with
comments).

Extract bar for this walk file is **about 780**.

622 + another 169-to-188 family = **791 to 810**. That **passes**
the about-780 extract bar.

Therefore: **YES, extract-first.**

- Do **not** grow `ElabMeetNamedWalkHostPackageWrite.lean` past 622.
- Do **not** grow HostGraphTheorems walk 191, HostTerm 841, Subset
  865, Compile 916, Tail 863, Later 785, or NamedWalk 322.
- Extract-first NEW probe because Subset 865 cannot take another
  thin probe.

The 880 bar in residual and WATCHER applies to Tail and Later leftover
wrappers, not to this HostPackageWrite walk. The HostPackageWrite walk
bar is about 780. The add will not stay under 780.

## 4. New files and expected line counts

**NEW walk:**
`src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

Expect about **169-205** lines: header plus a cloned ten-def wrapper
family (similar to a thin walk). Twentieth function block was 172
lines. A dedicated file needs its own header, so land near 190-205.
Leave HostPackageWrite walk at 622.

**NEW probe:**
`src/systems/SystemsLean/ElabMeetNamedHostImportGraphSeedsProbe.lean`

Expect about **202-205** lines. Clone the twentieth probe (205).
Do not dump onto `ElabMeetNamedHostPackageRootsProbe.lean`.
Do not dump onto ElabMeetSubset.

Namespace for both new files: `SystemsLean.ElabMeet`.

Shared helpers stay in `ElabMeetNamedWalk.lean`:
`tryCompileNamedMemberListIO`, `tryCompileAfterNamedDepsIO`,
`findLiveModulePath`, `barrelListsNamedMembers`,
`leftoverFakePackageLakefileText`. Do not clone those bodies.

Twenty-first wrappers (swap HostPackageRoots to HostImportGraphSeeds):

- `findLiveHostImportGraphSeedsPath`
- `namedClosedHostImportGraphSeedsSubsetNames`
- `namedClosedHostImportGraphSeedsCompileOrder`
- `barrelListsNamedHostImportGraphSeedsSubset`
- `tryCompileNamedHostImportGraphSeedsSubsetIO`
- `tryCompileNamedHostImportGraphSeedsSubsetIOSafe`
- `tryCompileNamedHostImportGraphSeedsSubset`
- `tryCompileAfterHostImportGraphSeedsDepsIO`
- `tryCompileAfterHostImportGraphSeedsDepsIOSafe`
- `tryCompileAfterHostImportGraphSeedsDeps`

New walk imports: `Lean`, `ElabMeetLive`, `ElabMeetNamedWalk`, and
the HostPackageWrite walk (so the prior twenty wrappers remain
visible for the isolation alias check). Clone the twentieth walk
header style. Do not copy `tryCompileNamedMemberListIO` into the
new file.

New probe imports: `Lean`, `ElabMeetLive`, `ElabMeetNamedWalk`,
`ElabMeetNamedWalkHostPackageWrite` (prior twenty wrappers), and
`ElabMeetNamedWalkHostImportGraphSeeds` (this walk).

## 5. Four Bools, four theorems, isolation command

Isolation command (new, not an alias):

```
#elabMeetNamedHostImportGraphSeedsSubsetProbe
```

Greppable companion: `elabMeetNamedHostImportGraphSeedsSubsetProbe`.

Four Bools (drive is `good && !badCompiled && isolation`):

1. `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset`
2. `elabMeetRejectsBadNamedHostImportGraphSeedsSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset`
4. `elabMeetDrivesNamedHostImportGraphSeedsSubset`

Four theorems in `ElabMeetTheorems.lean`, each
`= true := by native_decide` (clone twentieth style at 703-721):

1. `elabMeetDrivesNamedHostImportGraphSeedsSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphSeedsSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset_true`

TDD: land the four theorems **first**, before the Bools exist, so
`lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools /
missing probe. Record that red. Then extract the walk, add the probe,
fold, and Nix. Same theorems green. Do not rewrite the theorems to
finish green. Probe examples use `rfl` on the Bools. Theorems use
`native_decide`.

Fold the four new Bools into `elabMeetReady` in `ElabMeet.lean`
after the twentieth four (lines 728-731). Do not grow
`ElabMeetCompile.lean`.

Good path: `tryCompileNamedHostImportGraphSeedsSubset` on the live
lakefile. Bad path: temp copy of live HostImportGraphSeeds plus
`plantedTypeError`, then `tryCompileAfterHostImportGraphSeedsDeps`
as `ElabMeetNamedHostImportGraphSeedsSubsetBad`. Do not edit live
`HostImportGraphSeeds.lean`.

## 6. Compile order and after-deps

Membership list
`namedClosedHostImportGraphSeedsSubsetNames` is barrel order among
the twenty-one, not compile order. Twentieth names, then
`SystemsLean.HostImportGraphSeeds` last. Skip Linear. Skip IrGraph
as a named member. Skip HostGraphMain.

```
SystemsLean.Mult
SystemsLean.MultTheorems
SystemsLean.Types
SystemsLean.TypesTheorems
SystemsLean.IrProgram
SystemsLean.IrProgramTheorems
SystemsLean.Erasure
SystemsLean.ErasureTheorems
SystemsLean.Extract
SystemsLean.ExtractTheorems
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostFrontTheorems
SystemsLean.HostCheck
SystemsLean.HostGraph
SystemsLean.HostGraphTheorems
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
SystemsLean.HostPackageRoots
SystemsLean.HostImportGraphSeeds
```

Compile order `namedClosedHostImportGraphSeedsCompileOrder` is the
twentieth compile order (`namedClosedHostPackageRootsCompileOrder`,
walk 490-539), then `SystemsLean.HostImportGraphSeeds` last. Mult
first. IrGraph and HostCompose stay compile dependencies only.

Keep this extra-dep block from the twentieth, then add
HostPackageRoots, then HostImportGraphSeeds last. Exact identifier
spellings from the HostPackageRoots walk wrappers:

```
SystemsLean.Mult
SystemsLean.Types
SystemsLean.MultTheorems
SystemsLean.TypesTheorems
SystemsLean.Erasure
SystemsLean.ErasureTheorems
SystemsLean.Extract
SystemsLean.ExtractTheorems
SystemsLean.IrProgram
SystemsLean.IrProgramTheorems
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostFrontTheorems
SystemsLean.HostCheck
SystemsLean.HostGraph
SystemsLean.HostGraphTheorems
SystemsLean.IrGraph
SystemsLean.HostCompose
SystemsLean.CompilePath
SystemsLean.EmitMultScaffold
SystemsLean.EmitLinearScaffold
SystemsLean.EmitTypesScaffold
SystemsLean.EmitProgramScaffold
SystemsLean.EmitGraphScaffold
SystemsLean.EmitComposeScaffold
SystemsLean.EmitMult
SystemsLean.EmitLinear
SystemsLean.EmitTypes
SystemsLean.EmitProgram
SystemsLean.EmitGraph
SystemsLean.EmitCompose
SystemsLean.CompilePathMult
SystemsLean.CompilePathLinear
SystemsLean.CompilePathTypes
SystemsLean.CompilePathProgram
SystemsLean.CompilePathGraph
SystemsLean.CompilePathCompose
SystemsLean.FirstSurface
SystemsLean.MultSubsetEmit
SystemsLean.LinearSubsetEmit
SystemsLean.TypesSubsetEmit
SystemsLean.ProgramSubsetEmit
SystemsLean.GraphSubsetEmit
SystemsLean.ComposeSubsetEmit
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
SystemsLean.HostPackageRoots
SystemsLean.HostImportGraphSeeds
```

After-deps `tryCompileAfterHostImportGraphSeedsDepsIO` = twentieth
after-deps (`tryCompileAfterHostPackageRootsDepsIO`, walk 586-605)
plus `SystemsLean.HostPackageRoots`. HostImportGraphSeeds has no
imports. The planted sidecar still needs the HostPackageWrite /
SubsetEmit / HostPackageRoots closure. Exact identifier spellings:

```
SystemsLean.Mult
SystemsLean.Types
SystemsLean.IrProgram
SystemsLean.IrGraph
SystemsLean.Erasure
SystemsLean.Extract
SystemsLean.HostCompose
SystemsLean.CompilePath
SystemsLean.EmitMultScaffold
SystemsLean.EmitLinearScaffold
SystemsLean.EmitTypesScaffold
SystemsLean.EmitProgramScaffold
SystemsLean.EmitGraphScaffold
SystemsLean.EmitComposeScaffold
SystemsLean.EmitMult
SystemsLean.EmitLinear
SystemsLean.EmitTypes
SystemsLean.EmitProgram
SystemsLean.EmitGraph
SystemsLean.EmitCompose
SystemsLean.CompilePathMult
SystemsLean.CompilePathLinear
SystemsLean.CompilePathTypes
SystemsLean.CompilePathProgram
SystemsLean.CompilePathGraph
SystemsLean.CompilePathCompose
SystemsLean.FirstSurface
SystemsLean.HostTerm
SystemsLean.HostFrontGoldens
SystemsLean.HostFront
SystemsLean.HostGraph
SystemsLean.MultSubsetEmit
SystemsLean.LinearSubsetEmit
SystemsLean.TypesSubsetEmit
SystemsLean.ProgramSubsetEmit
SystemsLean.GraphSubsetEmit
SystemsLean.ComposeSubsetEmit
SystemsLean.HostPackageWrite
SystemsLean.HostPackageWriteTheorems
SystemsLean.HostPackageRoots
```

## 7. Isolation vs twentieth

Clone the twentieth isolation fold (probe 119-156). Drive is
`good && !badCompiled && isolation`.

```
isolation :=
  liveMultStillOk && liveThmStillOk && priorSubsetStillOk
    && !thisOnTempSnippet && !thisOnFakePackage
    && notAliasOfTwentieth
```

| Check | How |
|-------|-----|
| leftover temp `good.lean` | write `isoDir / "good.lean"` as `"def n : Nat := 0"`; `tryCompileNamedHostImportGraphSeedsSubset` on that path must be **false** |
| leftover fake package | write `leftoverFakePackageLakefileText` (`lean_lib ElabMeetRichLib`) to `fakeDir / "lakefile.lean"`; this walk on fake lake must be **false** |
| prior subset still succeeds | `tryCompileNamedHostPackageRootsSubset liveLake subsetIsoDir` must stay **true** |
| not an alias of the twentieth | names != twentieth names **and** compile order != twentieth compile order **and** this names contain `SystemsLean.HostImportGraphSeeds` **and** twentieth names do **not** |
| live Mult / MultTheorems | `tryCompileLiveModule` / `tryCompileLiveTheorems` still **true** |
| do not plant live tip | planted bad is a **temp** copy `ElabMeetNamedHostImportGraphSeedsSubsetBad.lean` with `\ndef plantedTypeError : Nat := true\n` after live text; compile via `tryCompileAfterHostImportGraphSeedsDeps` |

Do not invent a leftover-walk residual Name. Name 113 analog stays
as these leftover checks only.

## 8. Nix sites

Under `nix/systems-host-presence/`. Product
`HostImportGraphSeeds.lean` is already listed. Do not add a second
product import of HostImportGraphSeeds.

### required-files.nix

Walk file already listed at line 460
(`ElabMeetNamedWalkHostPackageWrite.lean`). Twentieth probe at
473-474:

```
  # Twentieth HostPackageRoots named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean"
```

Insert the new walk after the HostPackageWrite walk (after line 460).
Insert the new probe immediately after the twentieth probe (after
line 474). Neighbors after the probe stay `ElabMeetSubset.lean`.

### host-leans.nix

Walk file already listed at line 445. Twentieth probe at 458-459:

```
  # Twentieth HostPackageRoots named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean"
```

Insert the new walk after the HostPackageWrite walk (after line 445).
Insert the new probe immediately after the twentieth probe (after
line 459). Neighbors after the probe stay `ElabMeetSubset.lean`.

### host-specs-hold-close.nix

| Block | Twentieth neighbor | Twenty-first add |
|-------|--------------------|------------------|
| ElabMeet helper Bool names | lines 1173-1176, four `elabMeet*NamedHostPackageRootsSubset` | append the four Seeds Bools after those four |
| Walk helper tokens | HostPackageWrite walk `rel` at 2207-2234 holds 18/19/20 helpers | **NEW** `rel` for `ElabMeetNamedWalkHostImportGraphSeeds.lean` after that walk block (ends 2241). Tokens: `findLiveHostImportGraphSeedsPath`, `namedClosedHostImportGraphSeedsSubsetNames`, `namedClosedHostImportGraphSeedsCompileOrder`, `barrelListsNamedHostImportGraphSeedsSubset`, `tryCompileNamedHostImportGraphSeedsSubset`, `tryCompileAfterHostImportGraphSeedsDeps`, `SystemsLean.HostImportGraphSeeds`. Extract-first: helpers live on the new walk, not on the HostPackageWrite walk. |
| Probe spec | twentieth block 2297-2321 | **NEW** probe spec after 2321 (before the ElabMeetTheorems `rel` at 2323). Four Bools plus `elabMeetNamedHostImportGraphSeedsSubsetProbe` plus tip name plus honesty strings. |
| Theorem name strings | lines 2440-2443, four `theorem elabMeet*NamedHostPackageRootsSubset_true` | append the four Seeds theorem name strings after 2443 |

Do not remove twentieth tokens.

### Barrel and ElabMeet imports

`src/systems/SystemsLean.lean`:

- Line 108: `import SystemsLean.HostPackageRoots` (already there)
- Line 109: `import SystemsLean.HostImportGraphSeeds` (already there;
  not a named-subset member yet)
- Line 325: `import SystemsLean.ElabMeetNamedWalkHostPackageWrite`
- Line 332: `import SystemsLean.ElabMeetNamedHostPackageRootsProbe`

Add `import SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds` after
line 325. Add `import SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe`
after line 332. Do not add a second HostImportGraphSeeds product
import. Do not add HostImportGraphSeedsTheorems.

`ElabMeet.lean` imports the twentieth probe at 406 and the
HostPackageWrite walk at 399. Import the new walk after 399. Import
the new probe after 406. Fold four Bools after 731.

`ElabMeetTheorems.lean` imports the HostPackageWrite walk at 55 and
the twentieth probe at 62. Import the new walk after 55. Import the
new probe after 62. Theorems after 721.

## 9. Pins that stay false

Honesty gap: the job asked for the same **8** stay-false pins as
HostPackageRoots. Disk does **not** name eight stay-false identifiers
as one group.

HostPackageRoots residual Status (`RESIDUAL-systems.md`) names
**six** stay-false pins:

1. `slakeOwnsPackageTypecheck`
2. `elabMeetFullHostElaborateRemains`
3. `FullHostElaborateRemains`
4. `hostResidualShrinkFullHostElaborateRemains`
5. `llvmCfgFixtureDominanceClaimed`
6. `llvmMultSsaFullBackendClaimed`

The clone inventory listed those same six. The twentieth brief
section 9 listed those six as stay false.

A **seventh** stay-false appears on the same Status paragraph, listed
separately: SpecProof `residualFreeClaimed`. Keep it false.

There is **no eighth stay-false identifier** on that Status line.

Stay **true** (do not flip; twentieth brief and residual Status):

- DualResidual `residualFreeClaimed`
- `hostElaboratorResidualFreeClaimed` (twentieth brief; not on the
  six-name Status list)
- SpecProof `proofCompleteClaimed`

Also stay true: product residual free, freestanding product self-host
complete, PROVABLY. Product Lake pins stay false (product path does
not require Lake on the normal step). Leftover seed walk stays
**closed**. Still not whole-package typecheck. Still not Lake gone.
Honesty theorems in `ElabMeet.lean` 735-740 stay
`= false := by native_decide`.

If an implementer is counting "eight pins" as the twentieth brief
do-not-flip block, that block mixes polarity. It is the six stay-false
above, plus DualResidual `residualFreeClaimed` true, plus
`hostElaboratorResidualFreeClaimed` true, plus SpecProof
`residualFreeClaimed` false, plus SpecProof `proofCompleteClaimed`
true. That is ten polarities, not eight stay-false pins.

## 10. Next-after Name

After land: **21 of about 206**.

Next Open Name is **Grow HostImportGraphModel** (barrel neighbor
after HostImportGraphSeeds, import 110). Model has one import,
`SystemsLean.HostImportGraphSeeds`. Once Seeds is in the closed
twenty-one, Model is import-closed on that twenty-one.

Do not open Grow HostImportGraph as the next Name.

## 11. Do-not list

- Do not open **Grow HostImportGraph**. Hub is 46 lines, import 119,
  nine companions.
- Do not skip to HostImportGraph because the header plus-list names
  it first.
- Skip HostGraphMain (lake exe root, not in the barrel).
- Skip Linear as a grow tip.
- Skip IrGraph as a grow-tip residual Name.
- Do not open Grow HostCompose (still imports IrGraph).
- Do not plant live `HostImportGraphSeeds.lean`.
- Do not invent `HostImportGraphSeedsTheorems`.
- Do not grow HostPackageWrite walk past 622 / about 780.
- Do not grow Compile 916, Subset 865, Tail 863, Later 785,
  NamedWalk 322, HostTerm 841, or HostGraphTheorems walk 191.
- Do not dump this probe onto the twentieth probe or onto
  ElabMeetSubset.
- Do not clone `tryCompileNamedMemberListIO` into a new file.
- Do not invent a leftover-walk Name.
- Do not flip the pins in section 9.
- Do not flip free / complete / PROVABLY.
- Leave `AGENTS.md` alone.
- No product C. No new shell. ASCII only.
- Do not edit residual, WATCHER, or SESSION-HANDOFF until after land
  (this brief does not edit them).

## 12. TDD / gates

1. Four theorems first in `ElabMeetTheorems.lean` (after 721) so
   `lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools
   or a missing probe. Record that red.
2. Extract-first NEW walk, then NEW probe, then ElabMeet ready fold,
   then Nix presence, then barrel / ElabMeet / ElabMeetTheorems
   imports.
3. Same lake command exit 0. Do not rewrite theorems to finish green.

Lake cwd: `/home/hunter/Projects/ai/iso/src/systems` only.

```
lake build SystemsLean.ElabMeetTheorems
lake build SystemsLean.ElabMeet
lake build SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe
```

Repo root:

```
just hygiene
just professional-tone
just systems-host
```

Done when: named closed subset typechecks live HostImportGraphSeeds
via `tryCompileNamedMemberListIO`. Metric is **21 of about 206**.
Accept good. Reject planted error on a temp sidecar. Isolation versus
the twentieth walk holds (section 7). Four theorems landed first, all
`= true := by native_decide`, not rewritten. Wrappers live on the new
walk at about 169-205 lines. HostPackageWrite walk stays 622. Pins
stay as section 9. Gates green. Next Open Name is **Grow
HostImportGraphModel**.
