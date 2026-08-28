# Review: Grow HostImportGraphSeeds (2026-08-16)

Verdict: APPROVE WITH NITS
Blocker count: 0
Grow HostImportGraphModel may start: yes

## Summary

Grow HostImportGraphSeeds landed as the twenty-first named ElabMeet closed subset. Disk matches the implementer and mop reports. Extract-first produced a new 170-line walk and a new 203-line probe. HostPackageWrite walk stayed 622. Isolation command is live. Live `HostImportGraphSeeds.lean` was not planted. The four theorems still close with `native_decide`. The eight claim pins keep their required polarities. Living Open is Grow HostImportGraphModel. Metric is 21 of about 206. Zero blockers.

This review did not re-run Lake. It did not edit product Lean, residual, WATCHER, AGENTS, or Nix.

## TDD

Red was recorded before the Bools and probe existed. Red log: `/tmp/grok-1000/grok-red-grow-hostimportgraphseeds-20260816.md`.

- cwd `/home/hunter/Projects/ai/iso/src/systems`
- `lake build SystemsLean.ElabMeetTheorems` started 2026-08-16T13:42:06Z, finished 2026-08-16T13:42:08Z, wall about 1.7s
- Exit 1. Fail reason: expected type must not contain free variables
- Named sites still on disk at the same lines:
  - `ElabMeetTheorems.lean:727` `elabMeetDrivesNamedHostImportGraphSeedsSubset = true`
  - `ElabMeetTheorems.lean:732` `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset = true`
  - `ElabMeetTheorems.lean:737` `elabMeetRejectsBadNamedHostImportGraphSeedsSubset = true`
  - `ElabMeetTheorems.lean:742` `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset = true`

Theorems were not rewritten to finish green. Each remains `= true := by native_decide`.

Green is recorded in the implementer summary (no standalone `grok-green-grow-hostimportgraphseeds` file, unlike the twentieth slice). Same lake command, cwd `src/systems`, exit 0 at 2026-08-16T14:08:09Z. Walk 882ms. Probe 1360s. Theorems 3.5s. Total 1365.73s. `lake build SystemsLean.ElabMeet` exit 0 in 940ms.

On-disk probe examples at `ElabMeetNamedHostImportGraphSeedsProbe.lean:198-201` use `rfl` on all four Bools equal to true. That only typechecks if the isolation command minted those Bools as `true`.

## Extract-first

NEW walk and NEW probe exist. HostPackageWrite walk did not absorb the twenty-first wrappers. `HostImportGraphSeeds` does not appear in `ElabMeetNamedWalkHostPackageWrite.lean`. Shared walker is `tryCompileNamedMemberListIO` (called, not cloned). `HostImportGraphSeedsTheorems.lean` was not invented. `ElabMeetNamedHostImportGraphModelProbe.lean` was not started.

Line counts (last content line on a newline-terminated file):

| Lines | Path |
|------:|------|
| 170 | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` (NEW) |
| 203 | `src/systems/SystemsLean/ElabMeetNamedHostImportGraphSeedsProbe.lean` (NEW) |
| 622 | `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` (must stay) |
| 191 | `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean` |
| 841 | `src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` |
| 322 | `src/systems/SystemsLean/ElabMeetNamedWalk.lean` |
| 785 | `src/systems/SystemsLean/ElabMeetNamedWalkLater.lean` |
| 863 | `src/systems/SystemsLean/ElabMeetNamedWalkTail.lean` |
| 865 | `src/systems/SystemsLean/ElabMeetSubset.lean` |
| 916 | `src/systems/SystemsLean/ElabMeetCompile.lean` |
| 761 | `src/systems/SystemsLean/ElabMeet.lean` |
| 746 | `src/systems/SystemsLean/ElabMeetTheorems.lean` |

Membership is `namedClosedHostPackageRootsSubsetNames ++ ["SystemsLean.HostImportGraphSeeds"]`. Compile order is `namedClosedHostPackageRootsCompileOrder ++ ["SystemsLean.HostImportGraphSeeds"]`. After-deps are the twentieth after-deps plus `SystemsLean.HostPackageRoots` last. HostImportGraphSeeds is not in after-deps.

Barrel already had `import SystemsLean.HostImportGraphSeeds` at `SystemsLean.lean:109`. New helper imports sit after the HostPackageWrite walk and after the twentieth probe in the barrel, `ElabMeet.lean`, and `ElabMeetTheorems.lean`. Nix required-files, host-leans, helper Bools, walk spec, probe spec, and theorem name strings include the twenty-first tokens.

## Isolation

Isolation command `#elabMeetNamedHostImportGraphSeedsSubsetProbe` is declared at `ElabMeetNamedHostImportGraphSeedsProbe.lean:91` and invoked at line 196. Greppable companion `elabMeetNamedHostImportGraphSeedsSubsetProbe` is present.

Drive is `good && !badCompiled && isolation` (probe lines 182-186). Isolation fold is live Mult, live MultTheorems, prior `tryCompileNamedHostPackageRootsSubset`, leftover temp `good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false, and not-an-alias-of-the-twentieth (names differ, compile order differs, this names contain `SystemsLean.HostImportGraphSeeds`, twentieth names do not).

Bad path writes a temp `ElabMeetNamedHostImportGraphSeedsSubsetBad.lean` with `plantedTypeError : Nat := true` after a copy of live text. Live `src/systems/SystemsLean/HostImportGraphSeeds.lean` has no `import` lines, no `plantedTypeError`, and still ends at `end SystemsLean.HostImportGraph` (713).

## Pins 8/8

Confirmed on disk. Not flipped.

| Pin | Required | Actual | Site |
|-----|----------|--------|------|
| `slakeOwnsPackageTypecheck` | false | false | `ElabMeet.lean:431` |
| `elabMeetFullHostElaborateRemains` | false | false | `ElabMeet.lean:435` |
| `hostResidualShrinkFullHostElaborateRemains` | false | false | `HostResidualShrink.lean:227` |
| `llvmCfgFixtureDominanceClaimed` | false | false | `LlvmCfgHonesty.lean:86` |
| `llvmMultSsaFullBackendClaimed` | false | false | `LlvmMultSsa.lean:142` |
| DualResidual `residualFreeClaimed` | true | true | `DualResidual.lean:227` |
| SpecProof `residualFreeClaimed` | false | false | `SpecProof.lean:406` |
| SpecProof `proofCompleteClaimed` | true | true | `SpecProof.lean:389` |

Honesty theorems `slakeOwnsPackageTypecheck_false` and `elabMeetFullHostElaborateRemains_false` still close with `native_decide`. There is no `def FullHostElaborateRemains`. The greppable FullHost token stays on the HostResidualShrink comment and remains false via `hostResidualShrinkFullHostElaborateRemains`. DualResidual `hostElaboratorResidualFreeClaimed` stays true (`DualResidual.lean:222`).

## Residual lockstep

Living Open is **Grow HostImportGraphModel**. Metric is **21 of about 206**.

- `RESIDUAL.md` Open row 148 is open. Highest value next at line 1268 names Grow HostImportGraphModel and 21 of about 206.
- `RESIDUAL-systems.md` Open Name card at line 740 is Grow HostImportGraphModel. Seeds Status at line 738 is done, 21 of about 206, living next Grow HostImportGraphModel. Highest value next table row at line 3918 agrees.
- `WATCHER.md` fenced block is `/implement --effort 2 Grow HostImportGraphModel`. Remaining-work table is 21 of about 206 including HostImportGraphSeeds.
- `doc/SESSION-HANDOFF.md` metric is 21 of about 206. Next is Grow HostImportGraphModel. Do not open Grow HostImportGraph.
- `AGENTS.md:341` still says 13 of about 206 and Grow HostFrontTheorems. That lag is allowed.

Grow HostImportGraph was not opened. Next-after after Model remains Grow HostImportGraphMods (barrel import 111).

## Prior nits / Highest-value-next

Prior HostPackageRoots review nits at `RESIDUAL.md` about 1267 and `RESIDUAL-systems.md` about 3906 (walk 434, twentieth wrappers still phrased as future work) were folded. Those living cells now say HostPackageWrite walk 622, Seeds walk 170, metric 21 of about 206, and next Grow HostImportGraphModel.

Leftovers that remain are archive soup, not a wrong living Open. See Nits.

## Hygiene

No new C or shell. No leftover-walk slang in the new walk or probe. No pin forge. Probe and walk stay ASCII. `just hygiene` and `just systems-host` are recorded exit 0 in the implementer and mop reports. This review did not re-run those gates.

First hygiene pass failed on pre-existing reports `l3-barrel-seeds-20260816.md` and `l3-elabmeet-wc-20260816.md` (banned whole-token). Implementer rewrote those two words to companion and re-ran hygiene green. That is report hygiene, not a product miss.

## Blockers

None.

## Nits

1. `RESIDUAL-systems.md:3918` (and the same long Highest-value-next cell) still appends older ElabMeet line-count snapshots after the current 761 / 746 facts. Example: ElabMeet 822 appears later in the same cell. Living Open and metric at the front of the cell are current. Fold the stale snapshots when that cell is next rewritten. Not a blocker.

2. Closed HostPackageRoots Status archive at `RESIDUAL-systems.md:727` still says living next was Grow HostImportGraphSeeds. That is land-time archive for the closed twentieth Name. Do not treat it as the living tip.

3. `ElabMeetNamedWalkHostImportGraphSeeds.lean:71` says "Not import-closed on these twenty-one alone." Live `HostImportGraphSeeds.lean` has zero import lines. Residual Status says it is import-closed on the 20. The comment is a clone leftover from the HostPackageRoots walk. Behavior is correct (after-deps still close the planted sidecar). Fix the comment when that file is next edited.

4. `AGENTS.md:341` still says 13 of about 206 and Grow HostFrontTheorems. Allowed lag. Bring the living metric table up when a later hygiene slice touches that paragraph.

## Next-after note

Grow HostImportGraphModel may start: yes.

New probe must be `ElabMeetNamedHostImportGraphModelProbe.lean`. Wrappers MAY grow the Seeds walk from 170 (lands about 339-375, under 780). Next-after after Model is Grow HostImportGraphMods (import 111). Do not open Grow HostImportGraph.
