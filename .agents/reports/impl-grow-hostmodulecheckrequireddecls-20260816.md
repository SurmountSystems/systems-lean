# Grow HostModuleCheckRequiredDecls named subset (Name 154)

GREEN. Named closed subset is **28 of about 206**. The twenty-eighth
module on the Slake path is SystemsLean.HostModuleCheckRequiredDecls.
Next Open Name is **Grow HostModuleCheckRequiredDeclsProduct subset**.

IMPL_ID: efffa4b1. Did not edit live HostModuleCheckRequiredDecls.lean.
Did not edit live HostImportGraphWalk.lean.

## TDD red (mandatory first)

Four theorem stubs landed in ElabMeetTheorems first, before the four
Bools existed. Same names with `_true`; `= true := by native_decide`.
Theorems were not rewritten later. Header list refreshed to include
HostModuleCheckRequiredDecls-subset.

Cwd: `/home/hunter/Projects/ai/iso/src/systems` (root Iso umbrella has
no `lean_lib SystemsLean`).

Command:

`lake build SystemsLean.ElabMeetTheorems`

Exit **1**. Elapsed about **1 s**. Verbatim fail reason:

```
error: SystemsLean/ElabMeetTheorems.lean:882:2: Expected type must not contain free variables
  elabMeetDrivesNamedHostModuleCheckRequiredDeclsSubset = true
error: SystemsLean/ElabMeetTheorems.lean:887:2: Expected type must not contain free variables
  elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsSubset = true
error: SystemsLean/ElabMeetTheorems.lean:892:2: Expected type must not contain free variables
  elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsSubset = true
error: SystemsLean/ElabMeetTheorems.lean:897:2: Expected type must not contain free variables
  elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsSubset = true
```

That is the observed red for the named contract.

## Implement after red

EXTRACT-FIRST:

- Wrappers stayed on `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean` (327 -> 470, under 780)
- NEW `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean`
- Isolation option `#elabMeetNamedHostModuleCheckRequiredDeclsSubsetProbe`

Did not invent a new walk. Did not dump wrappers onto Seeds (693).
Did not grow ElabMeetSubset (865) or ElabMeetCompile (916). Did not plant
live HostModuleCheckRequiredDecls.lean. Did not plant live
HostImportGraphWalk.lean.

Four Bools (drive = good && !bad && isolation):

- elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsSubset
- elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsSubset
- elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsSubset
- elabMeetDrivesNamedHostModuleCheckRequiredDeclsSubset

Folded those Bools in ElabMeet.lean after the Walk fold. Wired the
new probe into SystemsLean.lean, ElabMeet.lean, and ElabMeetTheorems.

## TDD green

Cwd: `/home/hunter/Projects/ai/iso/src/systems`.

| Command | Exit | Elapsed |
|---------|-----:|--------:|
| `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater` | 0 | about 1 s |
| `lake build SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProbe` | 0 | about 818 s |
| `lake build SystemsLean.ElabMeetTheorems` | 0 | about 1263 s (WalkProbe rebuild 1256 s + WalkLaterProbe rebuild 1259 s + theorems 3.2 s) |
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
| 470 | ElabMeetNamedWalkHostImportGraphWalkLater.lean |
| 216 | ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean |
| 215 | ElabMeetNamedHostImportGraphWalkProbe.lean |
| 900 | ElabMeetTheorems.lean |
| 799 | ElabMeet.lean |
| 693 | ElabMeetNamedWalkHostImportGraphSeeds.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |
| 589 | HostImportGraphWalk.lean (live barrel; not rewritten) |
| 667 | HostModuleCheckRequiredDecls.lean (live; not rewritten) |

Isolation token: `#elabMeetNamedHostModuleCheckRequiredDeclsSubsetProbe`.

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true

AGENTS.md living tip was left alone.

## Nix presence

Added HostModuleCheckRequiredDecls probe AFTER Walk probe in:

- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`

RequiredDecls wrapper tokens were added on the existing WalkLater walk spec.
Did not churn compile-path-2.

## Residual lockstep after green

- RESIDUAL-systems.md: Name 154 done; Name 155 Grow HostModuleCheckRequiredDeclsProduct open
- RESIDUAL.md join board: 154 done / 155 open; living 28 of about 206
- WATCHER.md: next `/implement --effort 2 Grow HostModuleCheckRequiredDeclsProduct`
- doc/SESSION-HANDOFF.md: metric 28 of about 206; next Grow HostModuleCheckRequiredDeclsProduct

Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Do not open Grow HostImportGraphTheorems. Do not open Grow HostImportGraphDriver.
Skip Linear, IrGraph, HostCompose, HostGraphMain.

Twenty-ninth extract note: WalkLater walk is 470, so wrappers MAY
stay on that file; the twenty-ninth probe MUST be NEW
ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.

## Next Open

**Grow HostModuleCheckRequiredDeclsProduct subset**. Barrel import 121. No
imports. Import-closed on the 28.

GREEN
