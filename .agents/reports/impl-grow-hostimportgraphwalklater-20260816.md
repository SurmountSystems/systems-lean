# Grow HostImportGraphWalkLater named subset (Name 152)

GREEN. Named closed subset is **26 of about 206**. The twenty-sixth
module on the Slake path is SystemsLean.HostImportGraphWalkLater.
Next Open Name is **Grow HostImportGraphWalk subset**.

IMPL_ID: efffa4b1. New implementer. Did not resume prior LoadOkLater
or ModsLater agents. Did not edit live HostImportGraphWalkLater.lean.

## TDD red (mandatory first)

Four theorem stubs landed in ElabMeetTheorems first, before the four
Bools existed. Same names with `_true`; `= true := by native_decide`.
Theorems were not rewritten later.

Cwd: `/home/hunter/Projects/ai/iso/src/systems` (root Iso umbrella has
no `lean_lib SystemsLean`).

Command:

`lake build SystemsLean.ElabMeetTheorems`

Exit **1**. Elapsed about **1 s**. Fail reason: four free-variable
errors on

- elabMeetDrivesNamedHostImportGraphWalkLaterSubset
- elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset
- elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset
- elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset

That is the observed red for the named contract.

## Implement after red

EXTRACT-FIRST:

- NEW `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean`
- NEW `src/systems/SystemsLean/ElabMeetNamedHostImportGraphWalkLaterProbe.lean`
- Isolation option `#elabMeetNamedHostImportGraphWalkLaterSubsetProbe`

Cloned LoadOkLater wrappers from Seeds walk into the new WalkLater
walk file and retargeted them. Cloned LoadOkLater probe into the new
WalkLater probe. Did not dump wrappers onto Seeds (693) or onto the
LoadOkLater probe. Did not grow ElabMeetSubset (865), NamedWalkLater
(785), NamedWalkTail (863), NamedWalkHostTerm (841), or ElabMeetCompile
(916).

Four Bools (drive = good && !bad && isolation):

- elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset
- elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset
- elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset
- elabMeetDrivesNamedHostImportGraphWalkLaterSubset

Folded those Bools in ElabMeet.lean after the LoadOkLater fold. Wired
walk then probe into SystemsLean.lean barrel after the LoadOkLater
sites. Did not churn compile-path-2.

First probe from the repo root failed (257 s, exit 1): candA
`lakefile.lean` at the repo root is the Iso umbrella, not SystemsLean.
That is a cwd miss, not a rewritten expectation. Remaining lake was
from `src/systems` only.

## TDD green

Cwd: `/home/hunter/Projects/ai/iso/src/systems`.

| Command | Exit | Elapsed |
|---------|-----:|--------:|
| `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater` | 0 | about 1 s |
| `lake build SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe` | 0 | about 781 s |
| `lake build SystemsLean.ElabMeetTheorems` | 0 | about 1 s |
| `lake build SystemsLean.ElabMeet` | 0 | about 1 s |

Same four theorems; `native_decide` green. Theorems were not rewritten.
Oleans present after green:

- ElabMeetNamedHostImportGraphWalkLaterProbe.olean (16:03)
- ElabMeetTheorems.olean (16:04)
- ElabMeet.olean (16:04)

Do not claim 26 without lake exit 0. Those four commands exited 0.

## Line counts after land (`wc -l`)

| Lines | Path |
|------:|------|
| 181 | ElabMeetNamedWalkHostImportGraphWalkLater.lean |
| 212 | ElabMeetNamedHostImportGraphWalkLaterProbe.lean |
| 854 | ElabMeetTheorems.lean |
| 789 | ElabMeet.lean |
| 693 | ElabMeetNamedWalkHostImportGraphSeeds.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |

Live HostImportGraphWalkLater.lean was read only (barrel import 116;
imports only HostImportGraphModel).

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false

AGENTS.md living tip was left alone.

## Nix presence

Added WalkLater walk after Seeds walk and WalkLater probe after
LoadOkLater probe in:

- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`

Did not churn compile-path-2.

## Residual lockstep after green

- RESIDUAL-systems.md: Name 152 done; Name 153 Grow HostImportGraphWalk open
- RESIDUAL.md join board: 152 done / 153 open; living 26 of about 206
- WATCHER.md: next `/implement --effort 2 Grow HostImportGraphWalk`
- doc/SESSION-HANDOFF.md: metric 26 of about 206; next Grow HostImportGraphWalk

Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Skip HostImportGraphTheorems (imports the LoadOk hub). Skip Linear,
IrGraph, HostCompose, HostGraphMain.

Twenty-seventh extract note: WalkLater walk is 181, so wrappers MAY
stay on that file; the twenty-seventh probe MUST be NEW
ElabMeetNamedHostImportGraphWalkProbe.

## Next Open

**Grow HostImportGraphWalk subset**. Barrel import 117. Imports
HostImportGraphModel and HostImportGraphWalkLater. Import-closed on
the 26.

GREEN
