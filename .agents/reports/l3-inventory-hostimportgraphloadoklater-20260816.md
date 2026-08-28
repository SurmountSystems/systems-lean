# Inventory -- Grow HostImportGraphLoadOkLater (25 of about 206)

Date: 2026-08-16.
Scope: inventory only. No product Lean edits. No lake. No residual edit.

Conclusion: **IMPLEMENT-READY**. Product tip already exists. Probe,
wrappers, isolation token, four Bools, four theorems, and Nix probe
rows are missing. Extract-first walk is **no**. New probe is **yes**.

## Expected files

| Path | Exists | Lines | Notes |
|------|--------|------:|-------|
| src/systems/SystemsLean/HostImportGraphLoadOkLater.lean | yes | 526 | live; import SystemsLean.HostImportGraphModsLater only; namespace SystemsLean.HostImportGraph; last line end SystemsLean.HostImportGraph |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean | **no** | -- | REQUIRED new probe |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad.lean | no (correct) | -- | runtime temp only; do not commit |
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphLoadOkLater.lean | no (correct) | -- | must stay missing |
| src/systems/SystemsLean/HostImportGraphLoadOkLaterTheorems.lean | no (correct) | -- | do not invent |
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean | yes | 578 | ModsLater wrappers already here; reuse for LoadOkLater |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean | yes | 207 | clone template |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean | yes | 207 | prior clone |
| src/systems/SystemsLean/HostImportGraphModsLater.lean | yes | 768 | import HostImportGraphMods only |
| src/systems/SystemsLean/HostImportGraphMods.lean | yes | 774 | import HostImportGraphModel only |
| src/systems/SystemsLean/HostImportGraphLoadOk.lean | yes | 498 | hub 113; imports ModsLater and LoadOkLater; do not open |
| src/systems/SystemsLean/HostImportGraphTheorems.lean | yes | 173 | barrel 115; imports LoadOk hub; not this Name |
| src/systems/SystemsLean/ElabMeetTheorems.lean | yes | 811 | ModsLater four theorems at 791-809; no LoadOkLater |
| src/systems/SystemsLean/ElabMeet.lean | yes | 776 | ModsLater four Bools at 749-752; no LoadOkLater |
| src/systems/SystemsLean.lean | yes | 340 | product import 114; no LoadOkLater probe import |

## Isolation token

`#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe` -- **does not
exist anywhere**. Companion `elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe`
is also unused. No Bad sidecar file is committed.

## Four Bools to retarget (ModsLater sources)

Defined in `ElabMeetNamedHostImportGraphModsLaterProbe.lean` (elab at
191-198) and folded in `ElabMeet.lean` (749-752). Theorems in
`ElabMeetTheorems.lean` (791-809).

1. elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset
2. elabMeetRejectsBadNamedHostImportGraphModsLaterSubset
3. elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset
4. elabMeetDrivesNamedHostImportGraphModsLaterSubset

Retarget to HostImportGraphLoadOkLater on the new probe.

## Line math (extract-first walk = no)

| File | Lines | Bar | Grow? |
|------|------:|----:|-------|
| Seeds walk | 578 | ~780 | yes, wrappers only (578+137=715) |
| Subset | 865 | ~880 | no; new probe required |
| Tail | 863 | ~880 leftover | no |
| Later | 785 | ~880 leftover | no |
| HostTerm | 841 | near 841 | no |
| PackageWrite walk | 622 | ~780 | no |
| GraphTheorems walk | 191 | -- | no |
| Compile | 916 | do not grow | no |

## Nix

Product LoadOkLater already listed. Probe not listed.

- required-files.nix 130-132: ModsLater, LoadOk, LoadOkLater
- required-files.nix 483-484: twenty-fourth ModsLater probe; next is Subset
- host-leans.nix 118-120: same product trio
- host-leans.nix 468-469: twenty-fourth ModsLater probe; next is Subset

Insert LoadOkLater probe after ModsLater probe.

## Next-after

Grow HostImportGraphWalkLater (barrel 116). Skip Linear, IrGraph,
HostCompose, HostGraphMain. Skip hubs LoadOk (113) and HostImportGraph
(119). Do not invent leftover-walk Names.

## Hard constraints

Lake cwd is src/systems. Pins stay false. Leave AGENTS.md alone.
