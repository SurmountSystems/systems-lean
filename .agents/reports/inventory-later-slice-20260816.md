# Inventory: Grow HostModuleCheckRequiredDeclsLater (2026-08-16)

Date: 2026-08-21 (read-only). No lake. No product edits. No live SSH.

**Verdict: LEAN LANDED LAKE PARKED**

Open Name still **Grow HostModuleCheckRequiredDeclsLater subset** (RESIDUAL-systems Name 156 **open**). Living next is still `/implement --effort 2 Grow HostModuleCheckRequiredDeclsLater`. Named closed subset claim on disk remains **29 of about 206**. Lake green for this slice was not proven here and no `impl-grow-hostmodulecheckrequireddeclslater-20260816` closeout exists.

## Existence

| Path / token | Status |
|--------------|--------|
| `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.lean` | **exists** (221 lines) |
| Isolation `#elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe` | **exists** (command at line 108; invocation at line 214) |
| Four Later Bools | **exist** as elab-generated `def` in the probe (lines 205-212). Folded into `ElabMeet.lean` ready conjunction (lines 781-784). Not source-level `def` in ElabMeet.lean. |
| Four `_true` theorems in `ElabMeetTheorems.lean` | **exist** (lines 924-942, all `= true := by native_decide`) |
| Wrappers on `ElabMeetNamedWalkHostImportGraphWalkLater.lean` | **exist** (findLive / names / compile order / barrel / tryCompile / after-deps, lines 639-760) |
| Nix Later probe after Product | **yes** in both `required-files.nix` (after Product at 495-498) and `host-leans.nix` (480-483). Spec block in `host-specs-hold-close.nix` (2691-2716). |
| Barrel import | `SystemsLean.lean` import 122 is the product module; probe import at line 344. ElabMeet.lean imports the probe at 418. |
| Product module | `HostModuleCheckRequiredDeclsLater.lean` already in required-files / host-leans (pre-existing barrel member). |

Four Bools (probe-generated, then ready-fold):

- `elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset`
- `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset`
- `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset`
- `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset`

Four theorems:

- `elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset_true`
- `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset_true`
- `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset_true`

## Line counts (last `end` line on disk)

| File | Lines now | Watcher / residual snapshot (pre-slice) | Note |
|------|-----------|------------------------------------------|------|
| ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.lean | **221** | (new; must be new probe) | landed |
| ElabMeetNamedWalkHostImportGraphWalkLater.lean | **762** | **615** | grew ~147; still under extract bar ~780 |
| ElabMeetSubset.lean | **865** | 865 | unchanged (HostFront probe still lives here) |
| ElabMeetCompile.lean | **916** | 916 | unchanged; do not grow |
| ElabMeetNamedWalkHostImportGraphSeeds.lean | **692** | 693 | stayed (Seeds walk not grown) |
| ElabMeetNamedWalkLater.lean | **785** | 785 | stayed |
| ElabMeetNamedWalkTail.lean | **863** | 863 | stayed |
| ElabMeet.lean | **809** | 804 | fold only (+Later Bools) |
| ElabMeetTheorems.lean | **944** | 922 | four Later theorems appended |
| ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean | **220** | 220 | not dumped onto |
| ElabMeetNamedWalkHostTerm.lean | **841** | 841 | stayed |
| ElabMeetNamedWalkHostPackageWrite.lean | **622** | 622 | stayed |

WalkLater 762 is under about 780, so thirtieth wrappers staying on that file matches the extract-first rule.

## Residual / watcher / reports

- **Open Name:** Grow HostModuleCheckRequiredDeclsLater subset (`RESIDUAL-systems.md` Name 156 **open**; Product Name 155 **done**).
- **WATCHER.md living next:** `/implement --effort 2 Grow HostModuleCheckRequiredDeclsLater` (fenced). Remaining-work table still **29 of about 206**.
- **Impl reports for Later 20260816:** **none**. No `impl-grow-hostmodulecheckrequireddeclslater-20260816.md` under project `.agents/reports/` or `/tmp/grok-1000/`. Adjacent Product reports exist and name Later as next, not closed:
  - `/home/hunter/Projects/ai/iso/.agents/reports/impl-grow-hostmodulecheckrequireddeclsproduct-20260816.md`
  - `/home/hunter/Projects/ai/iso/.agents/reports/review-grow-hostmodulecheckrequireddeclsproduct-20260816.md`
  - `/home/hunter/Projects/ai/iso/.agents/reports/mop-grow-hostmodulecheckrequireddeclsproduct-20260816.md`
  - `/home/hunter/Projects/ai/iso/.agents/reports/grok-mem-briefing-grow-hostmodulecheckrequireddeclsproduct-20260816.md`
- Host notes (`~/.agents/reports/discover-remote-builder-lake-2026-08-17.md`, `why-lake-operator-ask-2026-08-18.md`) already said Later Lean existed and Lake was parked at 29 of about 206.

## Remote SSH builder

**NOT READY** as a Nix remote builder: `/etc/nix/machines` is missing (not readable / does not exist).

SSH Host **is** configured: `~/.ssh/config` has `Host surmount-1` (User `nixbuilder`, IdentityFile set, BatchMode yes). No live SSH was attempted.

## Why not GREEN / not NOT STARTED

- Not NOT STARTED: probe, isolation command, wrappers, Nix after Product, four Bools, four theorems, barrel/probe imports all on disk.
- Not MID-FLIGHT LEAN PARTIAL: the Later Lean surface looks complete vs the Named contract (new probe, WalkLater wrappers, theorems, fold).
- Not GREEN: residual still open, WATCHER still the implement prompt, remaining metric still 29 of about 206, no Later impl closeout, lake not run in this inventory.

Parked gate: `lake build SystemsLean.ElabMeetTheorems` and `lake build SystemsLean.ElabMeet` from `src/systems` only, plus `just hygiene` / `just professional-tone` / `just systems-host`.
