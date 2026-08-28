# Implement summary -- Grow HostPackageRoots

Date: 2026-08-16
Status: GREEN
Lake cwd: `/home/hunter/Projects/ai/iso/src/systems`

## TDD red then green

Red (theorems only; no wrappers; no probe):

- Command: `lake build SystemsLean.ElabMeetTheorems`
- Exit: 1
- Fail reason: expected types contained free variables because
  `elabMeetDrivesNamedHostPackageRootsSubset`,
  `elabMeetAcceptsGoodNamedHostPackageRootsSubset`,
  `elabMeetRejectsBadNamedHostPackageRootsSubset`, and
  `elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset` did not exist.
- Log: `/tmp/grok-1000/grok-red-grow-hostpackageroots-20260816.md`

Green (same theorems, not rewritten; still `= true := by native_decide`):

- `lake build SystemsLean.ElabMeetNamedHostPackageRootsProbe` exit 0 (1339s)
- `lake build SystemsLean.ElabMeetTheorems` exit 0
- `lake build SystemsLean.ElabMeet` exit 0
- Log: `/tmp/grok-1000/grok-green-grow-hostpackageroots-20260816.md`

## Extract-first

NEW `src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean` **205**.
Isolation command `#elabMeetNamedHostPackageRootsSubsetProbe`.
Wrappers stayed on `ElabMeetNamedWalkHostPackageWrite.lean` **622**
(under extract bar about 780). No
`ElabMeetNamedWalkHostPackageRoots.lean`. No
`ElabMeetNamedWalkHostGraph.lean`. Forbidden files not grown:
Subset **865**, Compile **916**, Tail **863**, Later **785**,
NamedWalk **322**, HostTerm walk **841**, HostGraphTheorems walk **191**.

Live `HostPackageRoots.lean` was not edited. No HostPackageRootsTheorems
module.

## Isolation

Drive is `good && !bad && isolation`. Isolation keeps leftover temp
`good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false,
`tryCompileNamedHostPackageWriteTheoremsSubset` still succeeding,
twentieth walk not an alias of the nineteenth (only the twentieth list
contains `SystemsLean.HostPackageRoots`), live Mult and MultTheorems
still compiling, and the planted error only on a temp sidecar.

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true
- SpecProof residualFreeClaimed false
- SpecProof proofCompleteClaimed true

## Residual tip

Named subset **20 of about 206**. Grow HostPackageRoots is **done**.
Next Open Name is **Grow HostImportGraphSeeds** (barrel import 109).
Do not open Grow HostImportGraph.

Updated: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
`doc/SESSION-HANDOFF.md`, `.agents/plans/plan-slake-replaces-lake.md`.

## Gates

From repo root: `just hygiene` exit 0; `just professional-tone` exit 0;
`just systems-host` exit 0.
