# Grow HostGraph named subset (Name 142)

GREEN. Named closed subset is **16 of about 206**. The sixteenth
module on the Slake path is SystemsLean.HostGraph. Next Open Name
is Grow HostGraphTheorems subset.

TDD red: `cd src/systems && lake build SystemsLean.ElabMeetTheorems`
exit 1. Four free-variable errors on
`elabMeetDrivesNamedHostGraphSubset`,
`elabMeetAcceptsGoodNamedHostGraphSubset`,
`elabMeetRejectsBadNamedHostGraphSubset`, and
`elabMeetRejectsOldWalkAsNamedHostGraphSubset`. Theorems were
`BOOL = true := by native_decide` before those Bools existed.

TDD green: the same command exit 0. `lake build SystemsLean.ElabMeet`
exit 0. Theorems were not rewritten.

Extract first: new `ElabMeetNamedHostGraphProbe.lean`. Not Subset.
Not the HostCheck probe. Four-line IO wrapper over
`tryCompileNamedMemberListIO`. No cloned walker. Drive fold is
`good && !badCompiled && isolation`. Leftover temp and leftover fake
package stay false. Prior HostCheck subset still succeeds. Sixteenth
walk is not an alias of the fifteenth.

| Lines | Path |
|------:|------|
| 865 | ElabMeetSubset.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |
| 200 | ElabMeetNamedHostGraphProbe.lean |
| 199 | ElabMeetNamedHostCheckProbe.lean |
| 198 | ElabMeetNamedHostFrontTheoremsProbe.lean |
| 916 | ElabMeetCompile.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 322 | ElabMeetNamedWalk.lean |

HostTerm walk is 841. Seventeenth wrappers must extract (adding them
there would pass about 880). Pins stay: DualResidual residualFreeClaimed
true; SpecProof residualFreeClaimed false; SpecProof
proofCompleteClaimed true; slakeOwnsPackageTypecheck and
FullHostElaborateRemains false. AGENTS.md was left alone.
`just hygiene`, `just professional-tone`, and `just systems-host` exited 0.
