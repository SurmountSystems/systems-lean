# Grow HostPackageWrite named subset (Name 144)

GREEN. Named closed subset is **18 of about 206**. The eighteenth
module on the Slake path is SystemsLean.HostPackageWrite. Next Open
Name is Grow HostPackageWriteTheorems subset.

## TDD red

Red already existed earlier (free-variable errors on the four
HostPackageWrite Bool names before those Bools existed). Theorems
were `BOOL = true := by native_decide` first. Theorems were not
rewritten.

Quoted Lake errors live in
`/tmp/grok-1000/grok-red-grow-hostpackagewrite-20260816.md`.

## TDD green

Cwd for the proving lake commands: `/home/hunter/Projects/ai/iso/src/systems`.

- `lake build SystemsLean.ElabMeetNamedHostPackageWriteProbe` exit **0**
- `lake build SystemsLean.ElabMeetTheorems` exit **0**
- `lake build SystemsLean.ElabMeet` exit **0**

Same four theorems; native_decide green. Theorems were not rewritten.
Product Lean was not rewritten for this lockstep. Green log:
`/tmp/grok-1000/grok-green-grow-hostpackagewrite-20260816.md`.

## Line counts after land (`wc -l`)

| Lines | Path |
|------:|------|
| 205 | ElabMeetNamedHostPackageWriteProbe.lean |
| 242 | ElabMeetNamedWalkHostPackageWrite.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |
| 191 | ElabMeetNamedWalkHostGraphTheorems.lean |
| 745 | ElabMeet.lean |
| 680 | ElabMeetTheorems.lean |
| 322 | ElabMeetNamedWalk.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |

Extract first: new `ElabMeetNamedHostPackageWriteProbe.lean` (205)
and new `ElabMeetNamedWalkHostPackageWrite.lean` (242). Not Subset.
Not the HostGraphTheorems probe. Not the HostTerm walk. HostGraphTheorems
walk stayed 191. Four-line IO wrapper over
`tryCompileNamedMemberListIO`. No cloned walker. Drive fold is
`good && !bad && isolation`. Leftover temp and leftover fake
package stay false. Prior HostGraphTheorems subset still succeeds.
Eighteenth walk is not an alias of the seventeenth.

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

## Nix presence

Already present (no Nix edit this lockstep):

- `nix/systems-host-presence/host-specs-hold-close.nix` (walk, probe,
  four Bools, four theorem names)
- `nix/systems-host-presence/host-leans.nix` (probe and walk paths)
- `nix/systems-host-presence/required-files.nix` (same paths)
- `nix/systems-host-presence/host-specs-compile-path-2.nix` (product
  HostPackageWrite / HostPackageWriteTheorems dual-pin already listed)

## Residual lockstep paths updated

- `RESIDUAL-systems.md` (Name 144 done; Name 145 Grow
  HostPackageWriteTheorems open; metric 18 of about 206)
- `RESIDUAL.md` Systems Open table and living tip (18 /
  HostPackageWriteTheorems)
- `WATCHER.md` fenced next `/implement` Grow HostPackageWriteTheorems
- `doc/SESSION-HANDOFF.md` Active / Next
- `.agents/plans/plan-slake-replaces-lake.md` living tip

## Gates (repo root)

- `just hygiene` exit 0
- `just professional-tone` exit 0
- `just systems-host` exit 0
