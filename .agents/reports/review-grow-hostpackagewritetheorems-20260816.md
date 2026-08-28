# Review: Grow HostPackageWriteTheorems (19 of about 206)

Date: 2026-08-16
Reviewer: L3 general-purpose. Read-only. No product, residual, or Nix edits.

## Verdict

APPROVE WITH NITS

Grow HostPackageRoots may proceed.

## Blockers

None.

## Nits

1. `AGENTS.md` still says **13 of about 206** and names Grow HostFrontTheorems as next remaining work. Living residual, watcher, and handoff already say **19 of about 206** and Grow HostPackageRoots. This lag is allowed and is not a blocker.

2. `src/systems/SystemsLean/ElabMeetTheorems.lean` header spec still lists drive Bools through HostPackageWrite-subset. The four HostPackageWriteTheorems theorems are present at the file tail. The header was not brought up to the nineteenth name.

3. `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` header still says not to extract a HostPackageWriteTheorems walk unless this file would pass about 780. The same header later uses the extract-first bar of about 880. The file is 434 lines either way. Comment only.

None of these nits change the product contract.

## TDD evidence

Observed red first. Theorems were not rewritten after red.

Red log `/tmp/grok-1000/grok-red-grow-hostpackagewritetheorems-20260816.md`:

- cwd `/home/hunter/Projects/ai/iso/src/systems`
- `lake build SystemsLean.ElabMeetTheorems` exit **1**
- Fail reason: no such file `ElabMeetNamedHostPackageWriteTheoremsProbe.lean`; bad import `SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe`
- The four theorem names were already in `ElabMeetTheorems.lean` before the Bools existed

Green log `/tmp/grok-1000/grok-green-grow-hostpackagewritetheorems-20260816.md` and implementer report:

- cwd `/home/hunter/Projects/ai/iso/src/systems` (root Iso lakefile has no single `lean_lib SystemsLean`; a first probe attempt from repo root failed Bools and was not recorded as the green)
- `lake build SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe` exit **0**
- `lake build SystemsLean.ElabMeetTheorems` exit **0**
- `lake build SystemsLean.ElabMeet` exit **0**

Current four theorems in `ElabMeetTheorems.lean` (lines 682-699) remain `= true := by native_decide`:

- `elabMeetDrivesNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset_true`

Process mop re-checked `lake build SystemsLean.ElabMeetTheorems` and `lake build SystemsLean.ElabMeet` from `src/systems` at exit 0. This review did not re-run lake.

## Extract-first evidence

NEW `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean` exists at **202** lines.

Isolation command `#elabMeetNamedHostPackageWriteTheoremsSubsetProbe` is declared and invoked in that file. Four Bools are defined by that command. Drive is `good && !bad && isolation`.

The nineteenth probe is not on `ElabMeetSubset.lean` (still **865**; no nineteenth identifiers). It is not on the eighteenth probe `ElabMeetNamedHostPackageWriteProbe.lean` (still **205**; no nineteenth identifiers).

Nineteenth wrappers sit on existing `ElabMeetNamedWalkHostPackageWrite.lean` (**434**). There is no `ElabMeetNamedWalkHostPackageWriteTheorems.lean`. Shared walker is `tryCompileNamedMemberListIO`.

Line counts (`wc -l`):

| Lines | Path |
|------:|------|
| 202 | ElabMeetNamedHostPackageWriteTheoremsProbe.lean |
| 434 | ElabMeetNamedWalkHostPackageWrite.lean |
| 205 | ElabMeetNamedHostPackageWriteProbe.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |
| 191 | ElabMeetNamedWalkHostGraphTheorems.lean |
| 750 | ElabMeet.lean |
| 701 | ElabMeetTheorems.lean |
| 322 | ElabMeetNamedWalk.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 300 | HostPackageWriteTheorems.lean (existing theorems helper) |

Compile stayed 916. Subset stayed 865. HostTerm walk stayed 841. HostGraphTheorems walk stayed 191. Tail stayed 863. Later stayed 785.

Membership is the prior eighteen plus `SystemsLean.HostPackageWriteTheorems` last. Compile order is the eighteenth compile order, then HostPackageWriteTheorems last. After-deps is the eighteenth after-deps list plus `SystemsLean.HostPackageWrite`.

## Isolation evidence

Name 113 versus the eighteenth HostPackageWrite walk is implemented in the nineteenth probe:

- leftover temp `good.lean`: write a snippet, then `tryCompileNamedHostPackageWriteTheoremsSubset` on it must be false
- leftover fake `lean_lib ElabMeetRichLib`: `leftoverFakePackageLakefileText` from `ElabMeetNamedWalk.lean` (`lean_lib ElabMeetRichLib`); this walk on that fake lake must be false
- prior `tryCompileNamedHostPackageWriteSubset` still runs and must succeed (`priorSubsetStillOk`)
- `notAliasOfEighteenth`: nineteenth name list and compile order differ from the eighteenth, nineteenth contains `SystemsLean.HostPackageWriteTheorems`, eighteenth does not

Drive isolation fold is `liveMultStillOk && liveThmStillOk && priorSubsetStillOk && !thisOnTempSnippet && !thisOnFakePackage && notAliasOfEighteenth`.

"Live HostPackageWriteTheorems.lean was not planted" means the planted type error is a temp sidecar (`ElabMeetNamedHostPackageWriteTheoremsSubsetBad.lean` under a temp dir), not an overwrite of the live theorems helper. The live product module `HostPackageWriteTheorems.lean` **does** exist. It is the import-closed theorems helper (mtime older than this slice). It is not a new live walk module.

`HostPackageWriteTheorems.lean` has one import: `import SystemsLean.HostPackageWrite`. Barrel already imports `SystemsLean.HostPackageWriteTheorems` (`SystemsLean.lean:107`). Probe import is `SystemsLean.lean:331`. ElabMeet and ElabMeetTheorems import the nineteenth probe.

Nix presence lists the new probe and the four Bool / theorem names. No new C or shell. Product is Lean. No leftover module-split slang in the new probe. Pins were not flipped.

## Pin table

| Pin | Required | File:line | Actual | Result |
|-----|----------|-----------|--------|--------|
| slakeOwnsPackageTypecheck | false | SystemsLean/ElabMeet.lean:428 | false | pass |
| elabMeetFullHostElaborateRemains | false | SystemsLean/ElabMeet.lean:432 | false | pass |
| hostResidualShrinkFullHostElaborateRemains | false | SystemsLean/HostResidualShrink.lean:227 | false | pass |
| llvmCfgFixtureDominanceClaimed | false | SystemsLean/LlvmCfgHonesty.lean:86 | false | pass |
| llvmMultSsaFullBackendClaimed | false | SystemsLean/LlvmMultSsa.lean:142 | false | pass |
| DualResidual residualFreeClaimed | true | SystemsLean/DualResidual.lean:227 | true | pass |
| SpecProof residualFreeClaimed | false | SystemsLean/SpecProof.lean:406 | false | pass |
| SpecProof proofCompleteClaimed | true | SystemsLean/SpecProof.lean:389 | true | pass |

## Residual-tip check

Pass.

- Named closed subset is **19 of about 206**, including HostPackageWriteTheorems
- Name 145 Grow HostPackageWriteTheorems is **done** in `RESIDUAL-systems.md` and `RESIDUAL.md` Systems Open table
- Living Open next is **Grow HostPackageRoots** (Name 146), not Grow HostImportGraph
- `WATCHER.md` fenced next action is `/implement --effort 2 Grow HostPackageRoots`
- `doc/SESSION-HANDOFF.md` metric is 19 of about 206; next is Grow HostPackageRoots
- Highest-value next in `RESIDUAL.md` is Grow HostPackageRoots
- `AGENTS.md` still lags at 13 / HostFrontTheorems (allowed nit)

Process mop already reported `just hygiene`, `just professional-tone`, and `just systems-host` exit 0 from repo root.

## Whether Grow HostPackageRoots may proceed

Yes. The nineteenth named closed subset is landed. Isolation versus the eighteenth walk is in place. Pins are unchanged. Residual lockstep names Grow HostPackageRoots as the next Open. No product blocker.

Twentieth probe must be a new `ElabMeetNamedHostPackageRootsProbe.lean`. Do not dump HostPackageRoots onto the nineteenth probe. HostPackageWrite walk is 434; twentieth wrappers may stay there unless that add would pass about 880. Do not grow ElabMeetCompile (916). Skip Linear, skip IrGraph, skip HostGraphMain. Do not flip slakeOwnsPackageTypecheck.
