Verdict: APPROVE WITH NITS

# Review closeout: Grow HostGraph subset (Name 142)

Slice: sixteenth named closed subset on the Slake typecheck path.
Blocker count: 0
Nit count: 3
HostGraphTheorems implementer may proceed: yes

Date: 2026-08-16
This closeout matches the official review under `/tmp/grok-1000/`.
Sources: slice findings and pins/residual findings. Product files were
not edited. Lake was not re-run.

There is no `bug`. The named contract holds. Nits are allowed docs lag
plus the next-slice extract-first reminder.

## Summary

HostGraph landed as the sixteenth named closed subset. The probe is a new
role module `src/systems/SystemsLean/ElabMeetNamedHostGraphProbe.lean`
(last line 200). Wrappers sit on
`src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` (last line 841)
and reuse `tryCompileNamedMemberListIO`. Four theorems in
`ElabMeetTheorems.lean` stay `= true := by native_decide`. Linear and
IrGraph stay skipped. Pins were not flipped. Living residual, WATCHER,
handoff, and the plan living tip say 16 of about 206 and next is Grow
HostGraphTheorems subset.

## Contract checklist

1. The sixteenth probe is a real new module.
   Result: PASS. New file ends at line 200. Barrel import at
   `SystemsLean.lean:326`. Marker `#elabMeetNamedHostGraphSubsetProbe` is
   live at probe lines 49, 88, and 193. Isolation and drive folds are
   real code. Drive is `good && !badCompiled && isolation`.

2. Sixteenth wrappers sit on the HostTerm walk at about 841 lines.
   Result: PASS. `tryCompileNamedHostGraphSubsetIO` at
   `ElabMeetNamedWalkHostTerm.lean:792-796` is a short wrapper over
   `tryCompileNamedMemberListIO`. No cloned walker.

3. Line counts stay inside the extract-first bar.
   Result: PASS. Subset 865, HostTerm walk 841, HostGraph probe 200,
   HostCheck probe 199, HostFrontTheorems probe 198, Compile 916, Tail
   863, Later 785, NamedWalk 322. No file past about 880.

4. Four HostGraph Bools and four theorems close by `native_decide`.
   Result: PASS. Theorems at `ElabMeetTheorems.lean:615-633` on the same
   names and the same line numbers as the red errors (616, 621, 626,
   631). No `sorry`. No rewritten statements.

5. Test-driven development was red, then the same command green.
   Result: PASS. Command:
   `cd /home/hunter/Projects/ai/iso/src/systems && lake build SystemsLean.ElabMeetTheorems`
   Red: exit 1, four unknown-identifier / free-variable errors because
   the Bools were not defined yet. Green: same command exit 0, 22 jobs.
   Theorems were not rewritten to finish green.

6. The sixteen-member list skips Linear and skips IrGraph.
   Result: PASS. Membership at `ElabMeetNamedWalkHostTerm.lean:734-751`
   ends with HostGraph. No Linear, IrGraph, HostGraphMain, or
   HostGraphTheorems in that list.

7. New HostGraph reports do not use leftover module-split slang.
   Result: PASS. Living Open surfaces and new reports use extract-first
   and role module.

8. No product C or shell growth.
   Result: PASS.

9. HostGraphTheorems is not already parked on the wrong file.
   Result: PASS. Seventeenth probe and wrapper files do not exist. The
   forbidden wrapper name `ElabMeetNamedWalkHostGraph` does not exist.

10. Living claim-bool pins were not flipped.
    Result: PASS. See Pins.

11. Residual lockstep on living Open, WATCHER, handoff, and plan tip.
    Result: PASS, with Nit 1 on the join-board living-tip paragraph.

## TDD

Red was a real unknown-identifier fail, then the same command went green.
Red notes name `ElabMeetTheorems.lean` lines 616, 621, 626, and 631.
Theorems still close by `native_decide` on those lines. This reviewer
did not re-run Lake.

## Pins

| Pin | Required | Verified |
|-----|----------|----------|
| `slakeOwnsPackageTypecheck` | false | `ElabMeet.lean:419` |
| `elabMeetFullHostElaborateRemains` | false | `ElabMeet.lean:423` |
| `hostResidualShrinkFullHostElaborateRemains` | false | `HostResidualShrink.lean:227` |
| `llvmCfgFixtureDominanceClaimed` | false | `LlvmCfgHonesty.lean:86` |
| `llvmMultSsaFullBackendClaimed` | false | `LlvmMultSsa.lean:142` |
| DualResidual `residualFreeClaimed` | true | `DualResidual.lean:227` |
| SpecProof `residualFreeClaimed` | false | `SpecProof.lean:406` |
| SpecProof `proofCompleteClaimed` | true | `SpecProof.lean:389` |
| Ready fold first conjunct | `!slakeOwnsPackageTypecheck` | `ElabMeet.lean:522-524` |

## Findings

### Blocking

None.

### Nits

1. Status: open. `RESIDUAL.md:292` Systems Open living tip still has a
   stale 13 of about 206 / Grow HostFrontTheorems sentence. Later in the
   same paragraph (`RESIDUAL.md:330`) and the Highest value next cell
   (`RESIDUAL.md:338`) are current. WATCHER, `RESIDUAL-systems.md`,
   handoff, and the plan living tip are current.

2. Status: open. `AGENTS.md` lines 341-348 still say 13 of about 206 and
   next Grow HostFrontTheorems subset. Living residual is the authority.
   Do not make `AGENTS.md` the grow surface for Name 143.

3. Status: open. Next-slice extract-first reminder. The seventeenth
   probe MUST be new
   `src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean`.
   The seventeenth wrappers MUST be new
   `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean`.
   Do NOT name the wrapper `ElabMeetNamedWalkHostGraph`. Do not put them
   on `ElabMeetSubset.lean` (about 865),
   `ElabMeetNamedHostGraphProbe.lean` (about 200),
   `ElabMeetNamedHostCheckProbe.lean` (about 199),
   `ElabMeetNamedHostFrontTheoremsProbe.lean` (about 198), or
   `ElabMeetNamedWalkHostTerm.lean` (about 841).

## HostGraphTheorems implementer may proceed

yes
