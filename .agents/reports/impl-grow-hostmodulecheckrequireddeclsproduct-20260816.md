# Grow HostModuleCheckRequiredDeclsProduct named subset (Name 155)

GREEN. Named closed subset is **29 of about 206**. The twenty-ninth
module on the Slake path is SystemsLean.HostModuleCheckRequiredDeclsProduct.
Next Open Name is **Grow HostModuleCheckRequiredDeclsLater subset**.

Did not edit live HostModuleCheckRequiredDeclsProduct.lean.
Did not plant ElabMeet wrappers into that barrel.

## TDD red (mandatory first)

Four theorem stubs landed in ElabMeetTheorems first, before the four
Bools existed. Same names with `_true`; `= true := by native_decide`.
Theorems were not rewritten later. Header list refreshed to include
HostModuleCheckRequiredDeclsProduct-subset.

Cwd: `/home/hunter/Projects/ai/iso/src/systems` (root Iso umbrella has
no `lean_lib SystemsLean`).

Command:

`lake build SystemsLean.ElabMeetTheorems`

Exit **1**. Elapsed about **1 s**. Verbatim fail reason:

```
error: SystemsLean/ElabMeetTheorems.lean:904:2: Expected type must not contain free variables
  elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset = true
error: SystemsLean/ElabMeetTheorems.lean:909:2: Expected type must not contain free variables
  elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset = true
error: SystemsLean/ElabMeetTheorems.lean:914:2: Expected type must not contain free variables
  elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset = true
error: SystemsLean/ElabMeetTheorems.lean:919:2: Expected type must not contain free variables
  elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset = true
```

That is the observed red for the named contract.

## Implement after red

EXTRACT-FIRST:

- Wrappers stayed on `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean` (470 -> 615, under 780)
- NEW `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean`
- Isolation option `#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe`

Did not invent a new walk. Did not dump wrappers onto Seeds (693).
Did not grow ElabMeetSubset (865) or ElabMeetCompile (916). Did not plant
live HostModuleCheckRequiredDeclsProduct.lean.

Four Bools (drive = good && !bad && isolation):

- elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset
- elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset
- elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset
- elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset

Folded those Bools in ElabMeet.lean after the RequiredDecls fold. Wired the
new probe into SystemsLean.lean, ElabMeet.lean, and ElabMeetTheorems.

## TDD green

Cwd: `/home/hunter/Projects/ai/iso/src/systems`.

| Command | Exit | Elapsed |
|---------|-----:|--------:|
| `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater` | 0 | about 1 s |
| `lake build SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe` | 0 | about 943 s |
| `lake build SystemsLean.ElabMeetTheorems` | 0 | about 1362 s (WalkLaterProbe rebuild 1351 s + WalkProbe rebuild 1352 s + RequiredDeclsProbe rebuild 1358 s + theorems 3.1 s) |
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
| 615 | ElabMeetNamedWalkHostImportGraphWalkLater.lean |
| 220 | ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean |
| 216 | ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean |
| 922 | ElabMeetTheorems.lean |
| 804 | ElabMeet.lean |
| 693 | ElabMeetNamedWalkHostImportGraphSeeds.lean |
| 865 | ElabMeetSubset.lean |
| 916 | ElabMeetCompile.lean |
| 785 | ElabMeetNamedWalkLater.lean |
| 863 | ElabMeetNamedWalkTail.lean |
| 841 | ElabMeetNamedWalkHostTerm.lean |

Isolation token: `#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe`.

Live HostModuleCheckRequiredDeclsProduct.lean has no elabMeet / wrapper /
ElabMeetNamed plants.

## Pins (unchanged)

- slakeOwnsPackageTypecheck false
- elabMeetFullHostElaborateRemains false
- hostResidualShrinkFullHostElaborateRemains false
- llvmCfgFixtureDominanceClaimed false
- llvmMultSsaFullBackendClaimed false
- DualResidual residualFreeClaimed true

AGENTS.md living tip was left alone.

## Nix presence

Added HostModuleCheckRequiredDeclsProduct probe AFTER RequiredDecls probe in:

- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`

Product wrapper tokens were added on the existing WalkLater walk spec.
Did not churn compile-path-2.

## Residual lockstep after green

- RESIDUAL-systems.md: Name 155 done; Name 156 Grow HostModuleCheckRequiredDeclsLater open
- RESIDUAL.md join board: 155 done / 156 open; living 29 of about 206
- WATCHER.md: next `/implement --effort 2 Grow HostModuleCheckRequiredDeclsLater`
- doc/SESSION-HANDOFF.md: metric 29 of about 206; next Grow HostModuleCheckRequiredDeclsLater

Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Do not open Grow HostImportGraphTheorems. Do not open Grow HostImportGraphDriver.
Skip Linear, IrGraph, HostCompose, HostGraphMain.

Thirtieth extract note: WalkLater walk is 615; extract bar about 780;
another twelfth-sized wrapper family of about 110 to 169 would land about
725 to 784, so wrappers MAY stay on that file unless adding them would
pass about 780. The thirtieth probe MUST be NEW
ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.

## Next Open

**Grow HostModuleCheckRequiredDeclsLater subset**. Barrel import 122. No
imports. Import-closed on the 29.

GREEN
