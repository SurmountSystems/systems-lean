# Grow HostPackageWriteTheorems named subset (Name 145)

GREEN. Named closed subset is **19 of about 206**. The nineteenth
module on the Slake path is SystemsLean.HostPackageWriteTheorems. Next
Open Name is Grow HostPackageRoots subset.

## TDD red then green

Red first: four theorems plus the probe import were added to
ElabMeetTheorems before the Bools existed. `lake build
SystemsLean.ElabMeetTheorems` from `src/systems` exited **1** (missing
probe module / bad import). Red log:
`/tmp/grok-1000/grok-red-grow-hostpackagewritetheorems-20260816.md`.

Green from cwd `/home/hunter/Projects/ai/iso/src/systems`:

- `lake build SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe` exit **0** (1367s)
- `lake build SystemsLean.ElabMeetTheorems` exit **0**
- `lake build SystemsLean.ElabMeet` exit **0**

Same four theorems stay `= true := by native_decide`. Theorems were
not rewritten. Green log:
`/tmp/grok-1000/grok-green-grow-hostpackagewritetheorems-20260816.md`.

## Extract-first

NEW `ElabMeetNamedHostPackageWriteTheoremsProbe.lean` (202). Isolation
command `#elabMeetNamedHostPackageWriteTheoremsSubsetProbe`. Four
Bools. Bad sidecar plantedTypeError. Isolation: leftover temp false,
leftover fake `lean_lib ElabMeetRichLib` false, prior
`tryCompileNamedHostPackageWriteSubset` still succeeds,
notAliasOfEighteenth. Drive is `good && !bad && isolation`.

Nineteenth wrappers stay on `ElabMeetNamedWalkHostPackageWrite.lean`
(434). No new walk file. Shared walker
`tryCompileNamedMemberListIO`. After-deps = 18th after-deps plus
HostPackageWrite. Membership = prior eighteen plus
HostPackageWriteTheorems last.

## Line counts after land (`wc -l`)

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

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true
- SpecProof residualFreeClaimed false
- SpecProof proofCompleteClaimed true

AGENTS.md was left alone.

## Residual tip

Name 145 done. Metric **19 of about 206**. Open next: Grow
HostPackageRoots subset.
