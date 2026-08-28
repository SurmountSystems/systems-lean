# Inventory -- Grow HostImportGraphModsLater (24 of about 206)

Date: 2026-08-16.
Scope: inventory only. No product Lean edits. No lake. No residual edit.

Conclusion: **CLOSEOUT-READY** (no product Lean edits).
Live product plus the twenty-fourth probe, wrappers, folds, theorems,
and Nix presence are already on disk. Do not plant
HostImportGraphModsLater.lean. Do not add a new walk file.

Lake was not run on this pass. No impl GREEN report exists yet.

## Expected files

| Path | Exists | Lines | Stub or live | Key tokens |
|------|--------|------:|--------------|------------|
| src/systems/SystemsLean/HostImportGraphModsLater.lean | yes | 768 | live (RealMod fixtures, good/bad seeds; not a stub) | import SystemsLean.HostImportGraphMods; namespace SystemsLean.HostImportGraph; last line end SystemsLean.HostImportGraph |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean | yes | 207 | live (full probe, not a stub; no sorry) | #elabMeetNamedHostImportGraphModsLaterSubsetProbe; four Bools; drive good && !bad && isolation; temp sidecar write |
| src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean | no (correct) | -- | runtime temp only | Probe writes badDir / that basename + plantedTypeError. Same pattern as Mods. Do not commit. |
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean | yes | 578 | live wrappers (under about 780) | ten ModsLater wrappers; compile order ends HostImportGraphModsLater; after-deps = Mods extra-deps plus HostImportGraphMods |
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphModsLater.lean | no (correct) | -- | must stay missing | Do not invent a leftover walk Name or a new 575-line walk. |
| src/systems/SystemsLean/HostImportGraphModsLaterTheorems.lean | no (correct) | -- | do not invent | Brief forbids a Theorems sidecar. |
| src/systems/SystemsLean/ElabMeetTheorems.lean | yes | 811 | live | import probe at 70; four _true theorems at 791-809, each = true := by native_decide |
| src/systems/SystemsLean/ElabMeet.lean | yes | 776 | live | import probe at 411; four Bools folded into elabMeetReady at 749-752 |
| src/systems/SystemsLean.lean | yes | 340 | live | product import at 112; probe import at 337 after Mods probe |

## Four Bools (probe defines; ElabMeet folds)

All four exist on the probe (elab command + examples via rfl) and in ElabMeet.lean:

1. elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset -- present
2. elabMeetRejectsBadNamedHostImportGraphModsLaterSubset -- present
3. elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset -- present
4. elabMeetDrivesNamedHostImportGraphModsLaterSubset -- present (good && !bad && isolation)

## Four theorems (ElabMeetTheorems.lean)

All four exist. Each is `= true := by native_decide`. Not rewritten.

1. elabMeetDrivesNamedHostImportGraphModsLaterSubset_true
2. elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset_true
3. elabMeetRejectsBadNamedHostImportGraphModsLaterSubset_true
4. elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset_true

## Isolation

Token `#elabMeetNamedHostImportGraphModsLaterSubsetProbe` is live (elab
command + invocation at probe line 200). Companion
`elabMeetNamedHostImportGraphModsLaterSubsetProbe` is in the probe
header and in host-specs. Isolation vs twenty-third (Mods) is encoded:
leftover temp good.lean false; leftover fake package false; prior Mods
subset still succeeds; only the twenty-fourth list contains
SystemsLean.HostImportGraphModsLater.

## Barrel / extra-deps / compile order

- Barrel product: `import SystemsLean.HostImportGraphModsLater` at line 112
  (after HostImportGraphMods at 111). Not doubled.
- Barrel probe: `import SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe`
  at line 337 (after Mods probe).
- Named compile order: Mods compile order ++
  ["SystemsLean.HostImportGraphModsLater"] last.
- Named membership: Mods names ++ HostImportGraphModsLater last.
- Extra-deps (after-deps): twenty-third Mods extra-dep block plus
  HostImportGraphMods last. Last six:
  HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
  HostImportGraphSeeds, HostImportGraphModel, HostImportGraphMods.

Ten wrappers on the Seeds walk (no new walk):

- findLiveHostImportGraphModsLaterPath
- namedClosedHostImportGraphModsLaterSubsetNames
- namedClosedHostImportGraphModsLaterCompileOrder
- barrelListsNamedHostImportGraphModsLaterSubset
- tryCompileNamedHostImportGraphModsLaterSubsetIO
- tryCompileNamedHostImportGraphModsLaterSubsetIOSafe
- tryCompileNamedHostImportGraphModsLaterSubset
- tryCompileAfterHostImportGraphModsLaterDepsIO
- tryCompileAfterHostImportGraphModsLaterDepsIOSafe
- tryCompileAfterHostImportGraphModsLaterDeps

Seeds walk 578 is in the brief band (about 551 to 646; measured 441+136=577).
HostPackageWrite walk was not opened.

## Nix presence (probe)

Present. Do not churn compile-path-2 (no HostImportGraphModsLater hits there).

- required-files.nix: product 130; probe 483-484 after Mods probe; next is ElabMeetSubset.lean
- host-leans.nix: product 118; probe 468-469 after Mods probe
- host-specs-hold-close.nix: four Bools 1189-1192; Seeds walk wrapper tokens 2288-2294; new probe rel 2465-2489; four theorem strings 2624-2627
- host-specs-compile-path-3.nix: product HostImportGraphModsLater already (pre-existing product spec). Not a second probe import.
- host-specs-compile-path-2.nix: no ModsLater strings. Left alone.

## Missing

Nothing required for product Lean or Nix probe presence.

Intentionally absent (do not add):

- ElabMeetNamedWalkHostImportGraphModsLater.lean (new walk)
- HostImportGraphModsLaterTheorems.lean
- committed ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean (temp sidecar)

Not in this inventory job (later closeout writer, not add-only Lean):

- impl GREEN report
- residual / WATCHER / SESSION-HANDOFF updates
- lake build proof (not run here)

## Recommendation

**CLOSEOUT-READY** -- no product Lean edits.

Clone of HostImportGraphMods (Name 111 / twenty-third) is already landed
as Name 112 / twenty-fourth. Next Open after residual closeout is
**Grow HostImportGraphLoadOkLater** (barrel 114). Do not invent leftover-walk
Names. Do not plant the live tip.
