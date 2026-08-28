# GREEN -- Grow HostImportGraphSeeds (21 of about 206)

Date: 2026-08-16. Replaces the IN FLIGHT start note.

## Status

GREEN. Live `SystemsLean.HostImportGraphSeeds` is the twenty-first named ElabMeet
closed subset. Next Open is **Grow HostImportGraphModel**.

## Red first

`cd /home/hunter/Projects/ai/iso/src/systems && lake build SystemsLean.ElabMeetTheorems`

Exit 1 at 2026-08-16T13:42:08Z (wall ~1.7s). Four theorems existed; Bools and
probe did not. Lean: expected type must not contain free variables on

- elabMeetDrivesNamedHostImportGraphSeedsSubset
- elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset
- elabMeetRejectsBadNamedHostImportGraphSeedsSubset
- elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset

Red log: `/tmp/grok-1000/grok-red-grow-hostimportgraphseeds-20260816.md`

Theorems were not rewritten. Each stays `= true := by native_decide`.

## Green same theorems

Same lake command, cwd `src/systems`. Exit 0 at 2026-08-16T14:08:09Z.

- walk 882ms
- probe **1360s**
- theorems 3.5s
- total **1365.73s**

`lake build SystemsLean.ElabMeet` exit 0 in 940ms.

Isolation command: `#elabMeetNamedHostImportGraphSeedsSubsetProbe`.

## Line counts

- NEW walk `ElabMeetNamedWalkHostImportGraphSeeds.lean` **170**
- NEW probe `ElabMeetNamedHostImportGraphSeedsProbe.lean` **203**
- HostPackageWrite walk still **622**
- ElabMeet 761, ElabMeetTheorems 746, Subset 865, Compile 916

## Pins 8/8 unchanged

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true
- SpecProof residualFreeClaimed false
- SpecProof proofCompleteClaimed true

## Gates

- `just hygiene` exit 0
- `just systems-host` exit 0 (394 required paths)

## Next

Open **Grow HostImportGraphModel**. Do not open Grow HostImportGraph.
AGENTS.md left alone.
