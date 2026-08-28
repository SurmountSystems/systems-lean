# Grow HostGraphTheorems named subset (Name 143)

GREEN. Named closed subset is **17 of about 206**. The seventeenth
module on the Slake path is SystemsLean.HostGraphTheorems. Next Open
Name is Grow HostPackageWrite subset.

## TDD red

Command: `cd /home/hunter/Projects/ai/iso/src/systems && lake build SystemsLean.ElabMeetTheorems`

Exit 1. Fail reason: expected type must not contain free variables
for the four HostGraphTheorems Bool names at
ElabMeetTheorems.lean:638, 643, 648, 653. Theorems were
`BOOL = true := by native_decide` before those Bools existed.

Quoted Lake errors live in
`/tmp/grok-1000/grok-red-grow-hostgraphtheorems-20260816.md`.

## TDD green

Same command exit 0 (24 jobs). `lake build SystemsLean.ElabMeet`
exit 0 (25 jobs). Theorems were not rewritten.

Extract first: new `ElabMeetNamedHostGraphTheoremsProbe.lean` (201)
and new `ElabMeetNamedWalkHostGraphTheorems.lean` (191). Not Subset.
Not the HostGraph probe. Not the HostTerm walk. Four-line IO wrapper
over `tryCompileNamedMemberListIO`. No cloned walker. Drive fold is
`good && !badCompiled && isolation`. Leftover temp and leftover fake
package stay false. Prior HostGraph subset still succeeds.
Seventeenth walk is not an alias of the sixteenth.

## Line counts after land

| Lines | Path |
|------:|------|
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 322 | ElabMeetNamedWalk.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |
| 191 | ElabMeetNamedWalkHostGraphTheorems.lean |
| 200 | ElabMeetNamedHostGraphProbe.lean |
| 201 | ElabMeetNamedHostGraphTheoremsProbe.lean |
| 199 | ElabMeetNamedHostCheckProbe.lean |
| 198 | ElabMeetNamedHostFrontTheoremsProbe.lean |
| 734 | ElabMeet.lean |
| 657 | ElabMeetTheorems.lean |

## Pins (unchanged)

- slakeOwnsPackageTypecheck false (ElabMeet.lean)
- elabMeetFullHostElaborateRemains false (ElabMeet.lean)
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true
- SpecProof residualFreeClaimed false
- SpecProof proofCompleteClaimed true

AGENTS.md was left alone. HostGraph review nit 1 (stale 13 /
HostFrontTheorems sentence in RESIDUAL.md Systems Open) is fixed.
`just hygiene`, `just professional-tone`, and `just systems-host`
exited 0.

Eighteenth wrappers MAY fit on ElabMeetNamedWalkHostGraphTheorems
(191 plus about 108 is near 299). Eighteenth probe must be NEW
ElabMeetNamedHostPackageWriteProbe.lean.
