# L3: nineteenth HostPackageWriteTheorems sizes (for twentieth HostPackageRoots)

Measured 2026-08-16. Read-only. Line counts from last line of each file (same as wc -l).

## Measured sizes

Nineteenth (all claimed sizes match):

| File | Lines | Claimed |
|------|------:|--------:|
| src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean | 434 | 434 |
| src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean | 202 | 202 |
| src/systems/SystemsLean/ElabMeetTheorems.lean | 701 | 701 |
| src/systems/SystemsLean/ElabMeet.lean | 750 | 750 |

Family (do not grow; all claimed sizes match):

| File | Lines | Claimed |
|------|------:|--------:|
| ElabMeetCompile.lean | 916 | ~916 |
| ElabMeetSubset.lean | 865 | ~865 |
| ElabMeetNamedWalkTail.lean | 863 | ~863 |
| ElabMeetNamedWalkLater.lean | 785 | ~785 |
| ElabMeetNamedWalkHostTerm.lean | 841 | ~841 |
| ElabMeetNamedWalkHostGraphTheorems.lean | 191 | ~191 |
| ElabMeetNamedWalk.lean | 322 | ~322 |

Exists: ElabMeetNamedWalkHostPackageWrite.lean, ElabMeetNamedHostPackageWriteTheoremsProbe.lean.
Does not exist: ElabMeetNamedWalkHostGraph.lean (headers say do not extract that name).

## Nineteenth probe pattern

File: ElabMeetNamedHostPackageWriteTheoremsProbe.lean (role module so ElabMeetSubset stays under about 880).

- Isolation command: `#elabMeetNamedHostPackageWriteTheoremsSubsetProbe`
- Four Bools (defined by the command, then `rfl` examples):
  - `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset`
  - `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset`
  - `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset`
  - `elabMeetDrivesNamedHostPackageWriteTheoremsSubset`
- Four theorems live in ElabMeetTheorems (not the probe): each `*_true` with `by native_decide`. Probe itself uses `rfl` on the Bools, not `native_decide`.
- `tryCompileNamedMemberListIO`: probe does not call it. The walk wrapper `tryCompileNamedHostPackageWriteTheoremsSubset` is a CommandElab over `tryCompileNamedMemberListIO` (names list + compile order). Probe good path: that wrapper on the live lakefile. Bad path: temp copy of HostPackageWriteTheorems plus `def plantedTypeError : Nat := true`, then `tryCompileAfterHostPackageWriteTheoremsDeps`. Isolation also calls the same wrapper on a temp snippet and a fake lakefile.
- Isolation Name number: **not present**. No "Name 113" in the nineteenth probe or walk. "Name 113" in ElabMeetExe / ElabMeetDesc is older library-only richer lakefile text, not this grow slice.
- Isolation checks (ordinary English): live Mult still compiles; live MultTheorems still compiles; the prior eighteen-module walker `tryCompileNamedHostPackageWriteSubset` still works on the live lakefile; this walker returns false on a leftover temp `good.lean` (`def n : Nat := 0`); this walker returns false on a leftover fake package lakefile whose library is `lean_lib ElabMeetRichLib` (`leftoverFakePackageLakefileText` in ElabMeetNamedWalk); this walk is not an alias of the eighteenth (name lists and compile orders differ; only the nineteenth list contains `SystemsLean.HostPackageWriteTheorems`). Drive is good and not-bad and isolation. Do not plant a live HostPackageWriteTheorems.lean edit.

## Wrapper home

ElabMeetNamedWalkHostPackageWrite.lean is the wrapper home for eighteenth HostPackageWrite and nineteenth HostPackageWriteTheorems.

Header does **not** say 242->434 / ~192. Nineteenth wrappers are lines 264-432 (findLive through after-deps), about 169 lines. Header: do not extract `ElabMeetNamedWalkHostPackageWriteTheorems` unless this file would pass about 780.

Twentieth wrappers can stay here: 434 plus about 169-192 is about 603-626, under 780.

Clone these names, swap WriteTheorems -> Roots:
- `findLiveHostPackageWriteTheoremsPath`
- `namedClosedHostPackageWriteTheoremsSubsetNames`
- `namedClosedHostPackageWriteTheoremsCompileOrder`
- `barrelListsNamedHostPackageWriteTheoremsSubset`
- `tryCompileNamedHostPackageWriteTheoremsSubset` (+ IO / IOSafe)
- `tryCompileAfterHostPackageWriteTheoremsDeps` (+ IO / IOSafe)

Membership: prior eighteen plus HostPackageWriteTheorems last. Compile order: eighteenth compile order plus HostPackageWriteTheorems last. After-deps: eighteenth after-deps plus HostPackageWrite. Shared compile helper stays `tryCompileNamedMemberListIO` in ElabMeetNamedWalk.

## ElabMeetTheorems wiring

Import: `SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe` (and the walk). Tail theorems, each `= true := by native_decide`:

- `elabMeetDrivesNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset_true`

ElabMeet.lean folds the four Bools into `elabMeetReady` (lines 723-726). Honesty theorems stay in ElabMeet.

## Grep hits / no premature HostPackageRoots plant

ElabMeet* HostPackageWriteTheorems hits: probe, walk, ElabMeet ready fold, ElabMeetTheorems. No HostPackageRoots in the nineteenth probe or walk. HostPackageRoots.lean already exists as product (HostModuleCheck / HostImportGraph / barrel). That is not an ElabMeet named-walk plant.

## Recommendation: new walk needed?

**No.** Keep twentieth wrappers on ElabMeetNamedWalkHostPackageWrite. Expected after add: about 603-626 lines (under 780). New probe role module about 202 lines (`ElabMeetNamedHostPackageRootsProbe`). Do not grow Compile / Subset / Tail / Later / HostTerm. Do not extract ElabMeetNamedWalkHostGraph.
