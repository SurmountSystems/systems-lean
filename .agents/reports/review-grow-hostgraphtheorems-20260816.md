# Independent review: Grow HostGraphTheorems (Name 143)

**Verdict:** APPROVE WITH NITS
**Blocker count:** 0
**Nit count:** 1
**HostPackageWrite may proceed:** yes

## One-paragraph summary

The seventeenth named closed subset lands on disk as claimed. Four HostGraphTheorems theorems in `ElabMeetTheorems.lean` still say `= true := by native_decide` and match the observed-red free-variable names. Isolation Name 113 is in the new probe (leftover temp `good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false, prior sixteen-module HostGraph walker still succeeds, seventeenth walk is not an alias of the sixteenth, live `HostGraphTheorems.lean` was not planted). Drive fold is `good && !badCompiled && isolation`. Ready fold still starts with `!slakeOwnsPackageTypecheck`. Pins are unchanged. Line counts match the mop. Wrappers are four-line calls over `tryCompileNamedMemberListIO` with no cloned walker. Extract-first used a new probe and a new walk named `ElabMeetNamedWalkHostGraphTheorems`, not `ElabMeetNamedWalkHostGraph`. Living residual, watcher, handoff, and plan tip say **17 of about 206** and next **Grow HostPackageWrite**. The only nit is the expected `AGENTS.md` lag at 13 / HostFrontTheorems, which was not a grow surface.

## Verdict block

| Field | Value |
|-------|-------|
| Verdict | APPROVE WITH NITS |
| Blockers | 0 |
| Nits | 1 |
| HostPackageWrite may proceed | yes (APPROVE or APPROVE WITH NITS) |

## 1. TDD theorems

**Result:** pass. Theorems were not rewritten to finish green.

File: `src/systems/SystemsLean/ElabMeetTheorems.lean`

| Lines | Theorem | Proof |
|------:|---------|-------|
| 638-640 | `elabMeetDrivesNamedHostGraphTheoremsSubset_true` | `= true := by native_decide` |
| 643-645 | `elabMeetAcceptsGoodNamedHostGraphTheoremsSubset_true` | `= true := by native_decide` |
| 648-650 | `elabMeetRejectsBadNamedHostGraphTheoremsSubset_true` | `= true := by native_decide` |
| 653-655 | `elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset_true` | `= true := by native_decide` |

Observed red (`/tmp/grok-1000/grok-red-grow-hostgraphtheorems-20260816.md`):

```
Expected type must not contain free variables
  elabMeetDrivesNamedHostGraphTheoremsSubset = true
  elabMeetAcceptsGoodNamedHostGraphTheoremsSubset = true
  elabMeetRejectsBadNamedHostGraphTheoremsSubset = true
  elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset = true
```

Command at red: `cd /home/hunter/Projects/ai/iso/src/systems && lake build SystemsLean.ElabMeetTheorems` exit 1.

Green form is the same four names and the same `= true := by native_decide`. No `rfl` swap, no dropped theorem, no renamed Bool to dodge the fail. Header spec now names HostGraphTheorems-subset drive Bools. Probe elaborates the four Bools via `#elabMeetNamedHostGraphTheoremsSubsetProbe` and `rfl` examples.

Mop: `lake build SystemsLean.ElabMeetTheorems` and `lake build SystemsLean.ElabMeet` exit 0. This review did not re-run the Lake suite.

## 2. Isolation Name 113

**Result:** pass.

New probe: `src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean`

| Contract | Evidence |
|----------|----------|
| leftover temp `good.lean` false | writes `isoDir / "good.lean"` then `tryCompileNamedHostGraphTheoremsSubset goodIso isoDir`; fold uses `!thisOnTempSnippet` |
| leftover fake `lean_lib ElabMeetRichLib` false | writes `leftoverFakePackageLakefileText` (`lean_lib ElabMeetRichLib` in `ElabMeetNamedWalk.lean:319-320`); fold uses `!thisOnFakePackage` |
| prior sixteen-module HostGraph walker still succeeds | `priorSubsetStillOk` calls `tryCompileNamedHostGraphSubset` (sixteenth walker in `ElabMeetNamedWalkHostTerm.lean`) |
| seventeenth walk is not an alias of the sixteenth | `notAliasOfSixteenth`: names and compile orders differ; seventeenth list contains `SystemsLean.HostGraphTheorems`; sixteenth list does not |
| live `HostGraphTheorems.lean` was not planted | bad path is temp `ElabMeetNamedHostGraphTheoremsSubsetBad.lean` plus `plantedTypeError`; live `HostGraphTheorems.lean` still only `import SystemsLean.HostGraph` and has no planted error |

Isolation fold (probe lines 149-152):

`liveMultStillOk && liveThmStillOk && priorSubsetStillOk && !thisOnTempSnippet && !thisOnFakePackage && notAliasOfSixteenth`

That matches residual Done when for Name 143.

## 3. Drive fold and ready fold

**Result:** pass.

Drive (probe lines 180-184): `good && !badCompiled && isolation`. The drive Bool `elabMeetDrivesNamedHostGraphTheoremsSubset` is that conjunction.

Ready (`ElabMeet.lean:529-530`) still starts with `!slakeOwnsPackageTypecheck` then `!elabMeetFullHostElaborateRemains`. Ready then folds the four new HostGraphTheorems Bools at lines 707-710.

## 4. Pins unchanged

**Result:** pass.

| Pin | Value | Path |
|-----|-------|------|
| `slakeOwnsPackageTypecheck` | false | `ElabMeet.lean:423` |
| `elabMeetFullHostElaborateRemains` | false | `ElabMeet.lean:427` |
| `hostResidualShrinkFullHostElaborateRemains` | false | `HostResidualShrink.lean:227` |
| `llvmCfgFixtureDominanceClaimed` | false | `LlvmCfgHonesty.lean:86` |
| `llvmMultSsaFullBackendClaimed` | false | `LlvmMultSsa.lean:142` |
| DualResidual `residualFreeClaimed` | true | `DualResidual.lean:227` |
| SpecProof `residualFreeClaimed` | false | `SpecProof.lean:406` |
| SpecProof `proofCompleteClaimed` | true | `SpecProof.lean:389` |

Ready still starts with `!slakeOwnsPackageTypecheck`. Grow did not flip these living tips.

## 5. Line counts

**Result:** pass. Independent `wc -l` matches the mop and the implementer claim.

| Path | Lines |
|------|------:|
| `ElabMeetSubset.lean` | 865 |
| `ElabMeetCompile.lean` | 916 |
| `ElabMeetNamedWalk.lean` | 322 |
| `ElabMeetNamedWalkLater.lean` | 785 |
| `ElabMeetNamedWalkTail.lean` | 863 |
| `ElabMeetNamedWalkHostTerm.lean` | 841 |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | 191 |
| `ElabMeetNamedHostGraphTheoremsProbe.lean` | 201 |
| `ElabMeetNamedHostGraphProbe.lean` | 200 (prior sixteenth probe; not grown as the seventeenth) |
| `ElabMeetTheorems.lean` | 657 |
| `ElabMeet.lean` | 734 |

Subset stayed 865. Compile stayed 916. HostTerm walk stayed 841. Seventeenth extract-first did not dump onto those files.

## 6. Wrappers

**Result:** pass.

`tryCompileNamedHostGraphTheoremsSubsetIO` is four lines over `tryCompileNamedMemberListIO` (`ElabMeetNamedWalkHostGraphTheorems.lean:139-143`). After-deps is a thin wrap of `tryCompileAfterNamedDepsIO` (Mult, HostTerm, HostFrontGoldens, HostFront, HostGraph). No cloned walker body. Shared helpers stay on `ElabMeetNamedWalk`. HostGraph wrappers stay on the HostTerm walk. Linear and IrGraph are not members.

Membership is the prior sixteen plus `SystemsLean.HostGraphTheorems` last. Compile order is the prior sixteen compile order then HostGraphTheorems last. HostGraphTheorems imports only HostGraph. Barrel `SystemsLean.lean:105` lists `import SystemsLean.HostGraphTheorems`.

## 7. Lockstep

**Result:** pass for living grow surfaces. AGENTS.md lag is the nit below.

| Surface | 17 of about 206 | Next Grow HostPackageWrite |
|---------|-----------------|----------------------------|
| `WATCHER.md` | yes | yes (fenced `/implement` Name) |
| `doc/SESSION-HANDOFF.md` | yes (lines 111-113, 134) | yes |
| `RESIDUAL.md` Systems Open (~292) | yes | yes; HostGraphTheorems done |
| `RESIDUAL-systems.md` Open / table 143-144 | yes; 143 done; 144 open | yes |
| `.agents/plans/plan-slake-replaces-lake.md` living tip | yes (lines 31-38, 65) | yes |
| `AGENTS.md` | still 13 / HostFrontTheorems | not updated (not grow surface) |

HostGraph review nit (a) is fixed: `RESIDUAL.md:292` no longer sells 13 of about 206 or HostFrontTheorems as next work.

HostGraph review nit (c) is met: new probe `ElabMeetNamedHostGraphTheoremsProbe.lean` and new walk `ElabMeetNamedWalkHostGraphTheorems.lean`. File `ElabMeetNamedWalkHostGraph.lean` does not exist.

## 8. HostGraph review nits (this slice)

| Nit | Status |
|-----|--------|
| (a) `RESIDUAL.md:292` stale 13 / HostFrontTheorems | fixed |
| (b) `AGENTS.md` not grow surface | honored; leftover 13 remains as the only nit |
| (c) seventeenth extract-first new probe + new walk, do not name walk `ElabMeetNamedWalkHostGraph` | met |

## Issues

### Issue 1 -- Severity: nit
- File: AGENTS.md:341
- Description: Progress-every-turn metric still says Slake typechecks 13 of about 206 and that next work is Grow HostFrontTheorems. Living residual, watcher, handoff, and plan tip say 17 of about 206 and Grow HostPackageWrite. This file was not a grow surface, so the lag is expected.
- Suggestion: A later lockstep or hygiene pass may refresh the metric sentence. Do not block HostPackageWrite on it.
- Status: open

## Evidence paths

- Implementer: `.agents/reports/impl-grow-hostgraphtheorems-20260816.md`
- Mop: `.agents/reports/mop-grow-hostgraphtheorems-20260816.md` and `/tmp/grok-1000/grok-process-mop-grow-hostgraphtheorems-20260816.md`
- Red log: `/tmp/grok-1000/grok-red-grow-hostgraphtheorems-20260816.md`
- Probe: `src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean`
- Walk: `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean`
- Theorems: `src/systems/SystemsLean/ElabMeetTheorems.lean:637-655`
- Ready / pins: `src/systems/SystemsLean/ElabMeet.lean:423-427, 529-530, 707-710`

## Final return

- Verdict: APPROVE WITH NITS
- Blocker count: 0
- Nit count: 1
- HostPackageWrite may proceed: yes
- Summary: Seventeenth HostGraphTheorems subset is on disk with observed-red then native_decide green, isolation Name 113, unchanged pins, extract-first new probe and new walk, and lockstep at 17 of about 206 next HostPackageWrite. Only leftover is the expected AGENTS.md metric lag.
