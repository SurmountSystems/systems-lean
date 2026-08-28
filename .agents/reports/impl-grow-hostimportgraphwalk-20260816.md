# Grow HostImportGraphWalk named subset (Name 153)

GREEN. Named closed subset is **27 of about 206**. The twenty-seventh
module on the Slake path is SystemsLean.HostImportGraphWalk.
Next Open Name is **Grow HostModuleCheckRequiredDecls subset**.

IMPL_ID: efffa4b1. Did not edit live HostImportGraphWalk.lean.

## TDD red (mandatory first)

Four theorem stubs landed in ElabMeetTheorems first, before the four
Bools existed. Same names with `_true`; `= true := by native_decide`.
Theorems were not rewritten later. Header list refreshed to include
LoadOkLater, WalkLater, and Walk.

Cwd: `/home/hunter/Projects/ai/iso/src/systems` (root Iso umbrella has
no `lean_lib SystemsLean`).

Command:

`lake build SystemsLean.ElabMeetTheorems`

Exit **1**. Elapsed about **1 s**. Fail reason: four free-variable
errors on

- elabMeetDrivesNamedHostImportGraphWalkSubset
- elabMeetAcceptsGoodNamedHostImportGraphWalkSubset
- elabMeetRejectsBadNamedHostImportGraphWalkSubset
- elabMeetRejectsOldWalkAsNamedHostImportGraphWalkSubset

That is the observed red for the named contract.

## Implement after red

EXTRACT-FIRST:

- Wrappers stayed on `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean` (181 -> 327, under 780)
- NEW `src/systems/SystemsLean/ElabMeetNamedHostImportGraphWalkProbe.lean`
- Isolation option `#elabMeetNamedHostImportGraphWalkSubsetProbe`

Did not invent a new Walk walk. Did not dump wrappers onto Seeds (693).
Did not grow ElabMeetSubset (865) or ElabMeetCompile (916). Did not plant
live HostImportGraphWalk.lean.

Four Bools (drive = good && !bad && isolation):

- elabMeetAcceptsGoodNamedHostImportGraphWalkSubset
- elabMeetRejectsBadNamedHostImportGraphWalkSubset
- elabMeetRejectsOldWalkAsNamedHostImportGraphWalkSubset
- elabMeetDrivesNamedHostImportGraphWalkSubset

Folded those Bools in ElabMeet.lean after the WalkLater fold. Wired the
new probe into SystemsLean.lean, ElabMeet.lean, and ElabMeetTheorems.

First probe from the repo root failed (257 s, exit 1): candA
`lakefile.lean` at the repo root is the Iso umbrella, not SystemsLean.
That is a cwd miss, not a rewritten expectation. Remaining lake was
from `src/systems` only.

## TDD green

Cwd: `/home/hunter/Projects/ai/iso/src/systems`.

| Command | Exit | Elapsed |
|---------|-----:|--------:|
| `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater` | 0 | about 1 s |
| `lake build SystemsLean.ElabMeetNamedHostImportGraphWalkProbe` | 0 | about 770 s |
| `lake build SystemsLean.ElabMeetTheorems` | 0 | about 1132 s (WalkLaterProbe rebuild 1131 s + theorems 1 s) |
| `lake build SystemsLean.ElabMeet` | 0 | about 1 s |

Same four theorems; `native_decide` green. Theorems were not rewritten.

Root after residual/docs:

| Command | Exit |
|---------|-----:|
| `just hygiene` | 0 |
| `just systems-host` | 0 |

## Line counts after land (`wc -l`)

| Lines | Path |
|------:|------|
| 327 | ElabMeetNamedWalkHostImportGraphWalkLater.lean |
| 215 | ElabMeetNamedHostImportGraphWalkProbe.lean |
| 212 | ElabMeetNamedHostImportGraphWalkLaterProbe.lean |
| 878 | ElabMeetTheorems.lean |
| 794 | ElabMeet.lean |
| 693 | ElabMeetNamedWalkHostImportGraphSeeds.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 589 | HostImportGraphWalk.lean (live barrel; not rewritten) |

Isolation token: `#elabMeetNamedHostImportGraphWalkSubsetProbe`.

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true

AGENTS.md living tip was left alone.

## Nix presence

Added Walk probe AFTER WalkLater probe in:

- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`

Walk wrapper tokens were added on the existing WalkLater walk spec.

## Residual lockstep after green

- RESIDUAL-systems.md: Name 153 done; Name 154 Grow HostModuleCheckRequiredDecls open
- RESIDUAL.md join board: 153 done / 154 open; living 27 of about 206
- WATCHER.md: next `/implement --effort 2 Grow HostModuleCheckRequiredDecls`
- doc/SESSION-HANDOFF.md: metric 27 of about 206; next Grow HostModuleCheckRequiredDecls

Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Do not open Grow HostImportGraphTheorems. Do not open Grow HostImportGraphDriver.
Skip Linear, IrGraph, HostCompose, HostGraphMain.

Twenty-eighth extract note: WalkLater walk is 327, so wrappers MAY
stay on that file; the twenty-eighth probe MUST be NEW
ElabMeetNamedHostModuleCheckRequiredDeclsProbe.

## Next Open

**Grow HostModuleCheckRequiredDecls subset**. Barrel import 120. No
imports. Import-closed on the 27.

GREEN
