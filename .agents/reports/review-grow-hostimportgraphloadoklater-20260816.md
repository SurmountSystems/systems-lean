# Review: Grow HostImportGraphLoadOkLater

Date: 2026-08-16
Reviewer: single L3 general review (product contract, TDD honesty, residual lockstep)
Workspace: `/home/hunter/Projects/ai/iso`

## Verdict

**APPROVE WITH NITS**

Zero blockers. Grow HostImportGraphWalkLater may start.

This review did not start WalkLater, did not flip pins, and did not edit product Lean.

## Sources checked (not reports alone)

- `src/systems/SystemsLean/HostImportGraphLoadOkLater.lean`
- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean`
- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` (wrapper tail)
- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean` (clone source)
- `src/systems/SystemsLean/ElabMeet.lean` (import, pins, drive fold)
- `src/systems/SystemsLean/ElabMeetTheorems.lean` (four `_true` theorems)
- `src/systems/SystemsLean.lean` (barrel import of the new probe)
- Residual: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
- Pins: `ElabMeet.lean`, `HostResidualShrink.lean`, `LlvmCfgHonesty.lean`, `LlvmMultSsa.lean`, `DualResidual.lean`
- Impl report: `.agents/reports/impl-grow-hostimportgraphloadoklater-20260816.md`
- Mop report: `.agents/reports/mop-grow-hostimportgraphloadoklater-20260816.md`

Lake was not re-run in this review. Implementer and mop both recorded exit 0 from `src/systems`. Probe `.olean` artifacts exist under `src/systems/.lake/build/lib/lean/SystemsLean/`.

## Line counts (`wc -l`)

| Path | Lines | Contract |
|------|------:|----------|
| `HostImportGraphLoadOkLater.lean` | 526 | Live module not planted. Still the original import-edge fold. |
| `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` | 210 | New probe exists. |
| `ElabMeetNamedWalkHostImportGraphSeeds.lean` | 693 | Wrappers on Seeds, under about 780. |
| `ElabMeet.lean` | 783 | Fold only. |
| `ElabMeetTheorems.lean` | 833 | Four `_true` theorems at the end. |
| `ElabMeetCompile.lean` | 916 | Not grown. No LoadOkLater tokens. |
| `ElabMeetSubset.lean` | 865 | Not grown past about 880. No LoadOkLater tokens. |
| `ElabMeetNamedWalkHostPackageWrite.lean` | 622 | Unchanged home for earlier wrappers. |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | 191 | Unchanged. |
| `ElabMeetNamedWalkHostTerm.lean` | 841 | Unchanged. |
| `ElabMeetNamedWalk.lean` | 322 | Helpers only. |
| `ElabMeetNamedWalkLater.lean` | 785 | Unchanged. |
| `ElabMeetNamedWalkTail.lean` | 863 | Unchanged. |

There is **no** `ElabMeetNamedWalkHostImportGraphLoadOkLater.lean`. Grep for `elabMeetNamedWalkHostImportGraphLoadOkLater` / `WalkHostImportGraphLoadOkLater` finds only residual extract-first prose, not a new walk module.

`HostImportGraphLoadOkLater.lean` still imports only `SystemsLean.HostImportGraphModsLater`, ends at the original `end SystemsLean.HostImportGraph` fold, and has no `plantedTypeError`. File mtime is 2026-08-11; the probe and Seeds walk are 2026-08-16.

## Isolation command

`#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe` exists only in the new probe:

- Header cite: probe line 56
- Elaborator: probe line 98
- Invocation: probe line 203

Good path calls `tryCompileNamedHostImportGraphLoadOkLaterSubset`, not the ModsLater walker. Bad path plants a temp copy and calls `tryCompileAfterHostImportGraphLoadOkLaterDeps`. Isolation still *checks* the prior ModsLater walker (`tryCompileNamedHostImportGraphModsLaterSubset`) and that the LoadOkLater name lists are not aliases of the ModsLater lists. That is isolation against the prior subset, not the isolation command deciding ModsLater.

## Four Bools (ModsLater clone, retargeted)

Recorded by the isolation command via `mkIdent` then `def ... : Bool` (probe lines 194-201), with `rfl` examples at 205-208:

- `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset`
- `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset`
- `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset`
- `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset`

Compared to `ElabMeetNamedHostImportGraphModsLaterProbe.lean`, this is the same command shape with names, live path, walker, after-deps, and alias check retargeted from ModsLater to LoadOkLater.

Folded into `ElabMeet.lean` lines 755-758.

## Drive formula

Probe lines 189-193:

```
if good && !badCompiled && isolation then
  `(true)
else
  `(false)
```

That is good && !bad && isolation. Header comments at probe lines 41 and 94-95 state the same formula.

## Four theorems

`ElabMeetTheorems.lean` lines 814-831. Each is `= true := by native_decide`:

- `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset_true`
- `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset_true`
- `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset_true`

Expectations were not rewritten to a weaker shape.

## TDD honesty

Product files match the implementer story.

- Theorems live at the same line numbers the red log cites (814, 819, 824, 829).
- Impl report shows `lake build SystemsLean.ElabMeetTheorems` from `/home/hunter/Projects/ai/iso/src/systems` exit 1 with free-variable errors on the four `... = true` types before the Bools existed.
- Same four theorems remain `= true := by native_decide`.
- Green lake: implementer exit 0 on the probe (1144s), ElabMeetTheorems (1235s), and ElabMeet (668ms). Mop re-ran ElabMeetTheorems and ElabMeet from `src/systems` exit 0 (cached). Probe `.olean` is present.

This review did not delete the Bools to replay red. That would be a product edit. The on-disk theorems, probe Bools, and written red log are consistent.

## Pins still false (living defs)

| Name | File:line | Value |
|------|-----------|-------|
| `slakeOwnsPackageTypecheck` | `ElabMeet.lean:436` | `false` |
| `elabMeetFullHostElaborateRemains` | `ElabMeet.lean:440` | `false` |
| `hostResidualShrinkFullHostElaborateRemains` | `HostResidualShrink.lean:227` | `false` |
| `llvmCfgFixtureDominanceClaimed` | `LlvmCfgHonesty.lean:86` | `false` |
| `llvmMultSsaFullBackendClaimed` | `LlvmMultSsa.lean:142` | `false` |

`DualResidual.residualFreeClaimed` remains `true` (`DualResidual.lean:227`). Not flipped.

## Residual lockstep

- Grow HostImportGraphLoadOkLater is **done** (`RESIDUAL-systems.md` Name table row 151 and the done write-up).
- Living Open is **Grow HostImportGraphWalkLater** (row 152; `WATCHER.md` next `/implement`; `SESSION-HANDOFF.md` next after LoadOkLater).
- Residual text says do not open Grow HostImportGraph and do not open Grow HostImportGraphLoadOk. Those hub Names are not Open rows.
- Grow HostImportGraphTheorems is not Open.
- Named closed subset is **25 of about 206**, including SystemsLean.HostImportGraphLoadOkLater.
- ElabMeetCompile was not grown. ElabMeetSubset stays 865.

## WalkLater extract-first (do not start here)

Seeds is **693**. The last two wrapper families on that file added about 137 (ModsLater) and about 115 (LoadOkLater). Another twelfth-sized family of about 110 to 169 would land near 803 to 862, which **passes the Seeds extract bar of about 780**.

**Recommendation: yes. WalkLater needs a NEW walk and a NEW probe.**

- New walk: `ElabMeetNamedWalkHostImportGraphWalkLater.lean`
- New probe: `ElabMeetNamedHostImportGraphWalkLaterProbe.lean`
- Do not dump WalkLater onto the LoadOkLater probe.
- Do not add another wrapper family onto Seeds.

Residual Open and `WATCHER.md` already state that extract-first rule.

## Issues

### Issue 1. Severity: nit
- File: `AGENTS.md:341`
- Description: The living remaining-work tip still says Slake typechecks 13 of about 206 and that the next remaining work is Grow HostFrontTheorems. Living residual and handoff correctly say 25 of about 206 and Grow HostImportGraphWalkLater. The implement contract allowed leaving `AGENTS.md` alone.
- Suggestion: A later hygiene slice may refresh that tip to 25 of about 206 and name Grow HostImportGraphWalkLater. Not required before WalkLater starts.
- Status: open

## What this review did not do

- Did not start Grow HostImportGraphWalkLater.
- Did not flip pins.
- Did not edit product Lean.
- Did not re-run lake or `just hygiene` (mop already recorded exit 0).
