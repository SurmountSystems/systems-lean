# ElabMeet family line counts (2026-08-16)

Read-only disk measure. No product edits.

**How counted:** this L3 tool set has no shell, so `wc -l` was not invoked as a process. Counts are the last 1-indexed content line on disk from `read_file`. That matches `wc -l` on a newline-terminated file. The reader also reports "the file has N lines" as last-content plus one (trailing-newline split). The table uses last content line, except `ElabMeetNamedHostCheckProbe.lean` and `HostImportGraphWalk.lean`, which have a real trailing blank line, so those counts include it.

**Extract bar:** about 780. Over that bar: do not grow; extract a role module first.

## Requested paths

| Path | Lines | Status vs about-780 |
|---|---:|---|
| `src/systems/SystemsLean/ElabMeetNamedWalk.lean` | 322 | under |
| `src/systems/SystemsLean/ElabMeetNamedWalkLater.lean` | 785 | **over** |
| `src/systems/SystemsLean/ElabMeetNamedWalkTail.lean` | 863 | **over** |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` | 841 | **over** (prompt 428 is stale) |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean` | 191 | under |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` | 622 | under. **Confirms** the 622 claim after HostPackageRoots landed on this walk file |
| `src/systems/SystemsLean/ElabMeetSubset.lean` | 865 | **over** |
| `src/systems/SystemsLean/ElabMeetCompile.lean` | 916 | **over** (largest ElabMeet file) |
| `src/systems/SystemsLean/ElabMeet.lean` | 755 | under (prompt 692 is stale) |
| `src/systems/SystemsLean/ElabMeetTheorems.lean` | 723 | under (prompt 570 is stale) |
| `src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean` | 205 | under |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageRoots.lean` | -- | **missing** (roots live on HostPackageWrite walk, not a separate walk file) |
| `src/systems/SystemsLean/ElabMeetNamedHostImportGraphSeedsProbe.lean` | -- | **missing** (not extracted yet) |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` | -- | **missing** (not extracted yet) |
| `src/systems/SystemsLean/HostImportGraphSeeds.lean` | 713 | under |
| `src/systems/SystemsLean/HostImportGraphSeedsTheorems.lean` | -- | **missing** |
| `src/systems/SystemsLean/HostImportGraph.lean` | 46 | under (import hub only) |
| `src/systems/SystemsLean/HostImportGraphTheorems.lean` | 172 | under |
| `src/systems/SystemsLean/HostPackageRoots.lean` | 435 | under |
| `src/systems/SystemsLean/HostPackageRootsTheorems.lean` | -- | **missing** |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWriteTheorems.lean` | -- | **missing** (nineteenth wrapper lives on HostPackageWrite walk plus its probe) |

## Every `ElabMeetNamed*Probe.lean` on disk

| Path | Lines |
|---|---:|
| `ElabMeetNamedHostCheckProbe.lean` | 200 (trailing blank) |
| `ElabMeetNamedHostFrontTheoremsProbe.lean` | 198 |
| `ElabMeetNamedHostGraphProbe.lean` | 200 |
| `ElabMeetNamedHostGraphTheoremsProbe.lean` | 201 |
| `ElabMeetNamedHostPackageWriteProbe.lean` | 205 |
| `ElabMeetNamedHostPackageWriteTheoremsProbe.lean` | 202 |
| `ElabMeetNamedHostPackageRootsProbe.lean` | 205 |

No other `ElabMeetNamed*Probe.lean` files exist. There is no HostImportGraphSeeds named probe.

## Every `ElabMeetNamedWalk*.lean` on disk

| Path | Lines | vs about-780 |
|---|---:|---|
| `ElabMeetNamedWalk.lean` | 322 | under |
| `ElabMeetNamedWalkLater.lean` | 785 | **over** |
| `ElabMeetNamedWalkTail.lean` | 863 | **over** |
| `ElabMeetNamedWalkHostTerm.lean` | 841 | **over** |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | 191 | under |
| `ElabMeetNamedWalkHostPackageWrite.lean` | 622 | under |

No other `ElabMeetNamedWalk*.lean` files exist.

## Related HostImportGraph walk / companion files

| Path | Lines | vs about-780 |
|---|---:|---|
| `HostImportGraphSeeds.lean` | 713 | under |
| `HostImportGraphModel.lean` | 236 | under |
| `HostImportGraphMods.lean` | 774 | under (close) |
| `HostImportGraphModsLater.lean` | 768 | under |
| `HostImportGraphLoadOk.lean` | 498 | under |
| `HostImportGraphLoadOkLater.lean` | 526 | under |
| `HostImportGraphTheorems.lean` | 172 | under |
| `HostImportGraphWalkLater.lean` | 433 | under |
| `HostImportGraphWalk.lean` | 590 (trailing blank) | under |
| `HostImportGraphDriver.lean` | 137 | under |
| `HostImportGraphMain.lean` | 18 | under |
| `HostImportGraph.lean` | 46 | under |

## HostPackageWrite claim

`ElabMeetNamedWalkHostPackageWrite.lean` is **622** lines. The claim that this walk file is 622 after HostPackageRoots is **correct**.

Do not confuse that with product `HostPackageWrite.lean`, which is **784** and is already over the about-780 bar.

## Files already over the about-780 extract bar

| File | Lines |
|---|---:|
| `ElabMeetCompile.lean` | 916 |
| `ElabMeetSubset.lean` | 865 |
| `ElabMeetNamedWalkTail.lean` | 863 |
| `ElabMeetNamedWalkHostTerm.lean` | 841 |
| `ElabMeetNamedWalkLater.lean` | 785 |
| `HostPackageWrite.lean` (product, not a walk) | 784 |

`ElabMeet.lean` is 755 (under). `ElabMeetTheorems.lean` is 723 (under). `HostImportGraphSeeds.lean` is 713 (under; room before 780). `ElabMeetNamedWalkHostPackageWrite.lean` is 622 (under; can absorb a twenty-first HostImportGraphSeeds wrapper only if the add stays well under 780).

## Stale prompt numbers to drop

- HostTerm walk is **841**, not 428.
- ElabMeet is **755**, not 692.
- ElabMeetTheorems is **723**, not 570.
- Later 785, Tail 863, Subset 865, Compile 916 match the prompt band.

## Next-slice implication

There is **no** `ElabMeetNamedWalkHostImportGraphSeeds` or `ElabMeetNamedHostImportGraphSeedsProbe` yet. HostPackageRoots already lives on the 622-line HostPackageWrite walk plus a 205-line probe. A HostImportGraphSeeds named-walk extract would be a new pair of files, not a grow of Compile / Subset / Tail / HostTerm / Later.
