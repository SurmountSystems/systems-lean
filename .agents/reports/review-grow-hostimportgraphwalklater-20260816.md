# Review: Grow HostImportGraphWalkLater

Date: 2026-08-16
Reviewer: single L3 general review (product contract, TDD honesty, residual lockstep)
IMPL_ID: efffa4b1
Workspace: `/home/hunter/Projects/ai/iso`

## Verdict

**APPROVE WITH NITS**

Zero blockers. Grow HostImportGraphWalk may start.

This review did not edit product Lean, did not flip pins, and did not re-run lake.

## Sources checked (not reports alone)

- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean`
- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphWalkLaterProbe.lean`
- `src/systems/SystemsLean/HostImportGraphWalkLater.lean` (pre-existing product barrel)
- `src/systems/SystemsLean/HostImportGraphWalk.lean` (next live barrel; not opened)
- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`
- `src/systems/SystemsLean/ElabMeet.lean` (import, pins, drive fold)
- `src/systems/SystemsLean/ElabMeetTheorems.lean` (four `_true` theorems)
- `src/systems/SystemsLean.lean` (barrel imports)
- Residual: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
- Pins: `ElabMeet.lean`, `HostResidualShrink.lean`, `LlvmCfgHonesty.lean`, `LlvmMultSsa.lean`
- Nix: `nix/systems-host-presence/required-files.nix`, `host-leans.nix`, `host-specs-hold-close.nix`
- Impl report: `.agents/reports/impl-grow-hostimportgraphwalklater-20260816.md`
- Mop report: `.agents/reports/mop-grow-hostimportgraphwalklater-20260816.md`
- Mop specialist notes: `/tmp/grok-1000/grok-mop-grow-hostimportgraphwalklater-gates-20260816.md`, `/tmp/grok-1000/grok-mop-grow-hostimportgraphwalklater-plants-20260816.md`

Lake was not re-run in this review. Implementer and mop both recorded exit 0 from `src/systems`.

## Must-verify checklist

| Item | Result |
|------|--------|
| TDD theorems first, same `_true` bodies, not rewritten | PASS with nits on red log |
| Live HostImportGraphWalkLater.lean not planted as the named walk | PASS (see planted note) |
| Four Bools / four `_true` theorems not dumped onto Seeds 693 | PASS |
| Living FullHost / Lake-gone / slakeOwns pins stay false | PASS |
| AGENTS.md living tip left at 13 of about 206 | NIT only |
| Next Open is Grow HostImportGraphWalk (barrel 117) | PASS |
| Extract-first for next: wrappers may stay on WalkLater walk; NEW probe required | PASS |
| Isolation `#elabMeetNamedHostImportGraphWalkLaterSubsetProbe` | PASS |
| Drive = good && !bad && isolation | PASS |
| Nix presence for walk and probe | PASS |
| Mop report honest vs tree | PASS |

## Line counts (`wc -l`)

| Path | Lines | Role |
|------|------:|------|
| `ElabMeetNamedWalkHostImportGraphWalkLater.lean` | 181 | NEW twenty-sixth named-walk wrappers |
| `ElabMeetNamedHostImportGraphWalkLaterProbe.lean` | 212 | NEW twenty-sixth probe |
| `ElabMeetNamedWalkHostImportGraphWalk.lean` | missing | Correct. Next slice may reuse WalkLater walk. |
| `ElabMeetNamedHostImportGraphWalkProbe.lean` | missing | Correct. Next slice MUST add this probe. |
| `ElabMeetNamedWalkHostImportGraphSeeds.lean` | 693 | Prior wrappers only. No WalkLater tokens. |
| `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` | 210 | Prior probe. Not grown for WalkLater. |
| `ElabMeetSubset.lean` | 865 | Unchanged. Cannot absorb the next probe. |
| `ElabMeet.lean` | 789 | Fold only. |
| `ElabMeetTheorems.lean` | 854 | Four WalkLater `_true` theorems at the end. |
| `ElabMeetCompile.lean` | 916 | Not grown. |
| `ElabMeetNamedWalkLater.lean` | 785 | Unchanged. |
| `ElabMeetNamedWalkTail.lean` | 863 | Unchanged. |
| `ElabMeetNamedWalkHostTerm.lean` | 841 | Unchanged. |
| `ElabMeetNamedWalkHostPackageWrite.lean` | 622 | Unchanged. |
| `ElabMeetNamedWalkHostGraphTheorems.lean` | 191 | Unchanged. |
| `HostImportGraphWalkLater.lean` | 433 | Pre-existing product barrel (mtime 2026-08-11). |
| `HostImportGraphWalk.lean` | 589 | Next live barrel. Not in the named 26. |

## Planted-walk note

There **is** a live product file `src/systems/SystemsLean/HostImportGraphWalkLater.lean` (433 lines). That is the real barrel module (import 116). Residual Goal already said it existed. Mtime is 2026-08-11. It imports only `SystemsLean.HostImportGraphModel`. Namespace is `SystemsLean.HostImportGraph`. It holds `checkImportOrderEdgesLater`. Grep finds no ElabMeet wrappers, no `plantedTypeError`, and no CommandElab.

The named walk is only `ElabMeetNamedWalkHostImportGraphWalkLater.lean` (181, mtime 2026-08-16). The probe plants a type error on a **temp** copy (`ElabMeetNamedHostImportGraphWalkLaterSubsetBad.lean`), not on the live barrel.

This is the same "live barrel not planted" contract as LoadOkLater. It is not a missing-file bug.

## Theorems and Bools

Four theorems in `ElabMeetTheorems.lean` 834-852. Bodies are still `= true := by native_decide`. Names were not rewritten.

- `elabMeetDrivesNamedHostImportGraphWalkLaterSubset_true`
- `elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset_true`
- `elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset_true`

Four Bools are recorded by the probe command (`mkIdent` then `def ... : Bool`) at probe lines 196-203, with `rfl` examples at 207-210:

- `elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset`
- `elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset`
- `elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset`
- `elabMeetDrivesNamedHostImportGraphWalkLaterSubset`

Folded into `ElabMeet.lean` 761-764. Those names do not appear in Seeds (693).

## Drive formula

Probe lines 191-195:

```
if good && !badCompiled && isolation then
  `(true)
else
  `(false)
```

Isolation (160-163) is prior Mult / theorems / LoadOkLater walker still ok, leftover temp `good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false, and not an alias of the twenty-fifth name lists.

## Isolation token

`#elabMeetNamedHostImportGraphWalkLaterSubsetProbe` exists only in the new probe:

- Header cite: probe line 57
- Elaborator: probe line 100
- Invocation: probe line 205

## TDD finding

Theorems first, same four `_true` names, still `= true := by native_decide`. No evidence the expects were rewritten to finish green.

Impl report claims observed red:

- cwd: `/home/hunter/Projects/ai/iso/src/systems`
- command: `lake build SystemsLean.ElabMeetTheorems`
- exit 1, about 1 s
- fail reason: free variables on the four Bool names

Green after implement (impl, then mop incremental):

- `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater` exit 0
- `lake build SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe` exit 0 (impl about 781 s first build)
- `lake build SystemsLean.ElabMeetTheorems` exit 0
- `lake build SystemsLean.ElabMeet` exit 0

There is no saved lake stderr file for the red run. That is a nit, not a rewritten-expect or green-only drive-by. The first root-cwd lake miss (Iso umbrella, 257 s) is documented as a cwd miss, not an expectation rewrite.

## Pins still false

| Pin | Value | Path |
|-----|-------|------|
| `slakeOwnsPackageTypecheck` | false | `ElabMeet.lean:438` |
| `elabMeetFullHostElaborateRemains` | false | `ElabMeet.lean:442` |
| `hostResidualShrinkFullHostElaborateRemains` | false | `HostResidualShrink.lean:227` |
| `llvmCfgFixtureDominanceClaimed` | false | `LlvmCfgHonesty.lean:86` |
| `llvmMultSsaFullBackendClaimed` | false | `LlvmMultSsa.lean:142` |

This slice did not flip FullHost, Lake-gone, or slakeOwns. Existing product residual-free / self-host complete claims were not re-opened.

## Nix presence

Walk and probe are listed in:

- `nix/systems-host-presence/required-files.nix` (walk after Seeds, probe after LoadOkLater)
- `nix/systems-host-presence/host-leans.nix` (same order)
- `nix/systems-host-presence/host-specs-hold-close.nix` (WalkLater wrapper tokens plus probe tokens including the isolation name)

Compile-path-2 was not churned for this land. Mop recorded `just systems-host` exit 0 (400 required paths).

## Residual lockstep (next Open)

Confirmed **Grow HostImportGraphWalk** (Name 153). Not Grow HostImportGraph. Not Grow HostImportGraphLoadOk.

| Surface | Next |
|---------|------|
| `RESIDUAL-systems.md` | 152 done; 153 **Grow HostImportGraphWalk subset** open; barrel 117 |
| `RESIDUAL.md` | 152 done / 153 open; living 26 of about 206 |
| `WATCHER.md` | `/implement --effort 2 Grow HostImportGraphWalk` |
| `doc/SESSION-HANDOFF.md` | metric 26 of about 206; next Grow HostImportGraphWalk |

Do not open Grow HostImportGraph (119). Do not open Grow HostImportGraphLoadOk (113). Skip HostImportGraphTheorems. Skip Linear, IrGraph, HostCompose, HostGraphMain.

## Extract-first for Grow HostImportGraphWalk

Measured:

- WalkLater walk is **181**. Extract bar about **780**. Another twelfth-sized wrapper family of about 110 to 169 lands near **291 to 350**. That stays under 780.
- WalkLater probe is **212**. Do not dump Walk onto it.
- Subset is **865**. Another twelfth-sized probe would pass about 880.
- Family walk `ElabMeetNamedWalkHostImportGraphWalk.lean` does **not** exist. Do not invent one unless adding wrappers to the 181-line WalkLater walk would pass 780. Current math says it will not.
- Seeds stays **693**. Do not put twenty-seventh wrappers there (693 + about 130 would pass 780).

Recommendation: twenty-seventh wrappers **MAY** stay on `ElabMeetNamedWalkHostImportGraphWalkLater.lean`. Twenty-seventh probe **MUST** be NEW `ElabMeetNamedHostImportGraphWalkProbe.lean`. New walk only if a later measurement shows WalkLater plus wrappers would pass about 780.

## Mop honesty

Mop is report-only and says so. It did not edit product Lean. Gate numbers come from specialist reports that exist under `/tmp/grok-1000/`. Plant checks match this review: walk 181, probe 212, isolation token in the probe only, live barrel 433 with zero ElabMeet wrappers, Seeds 693, pins false, AGENTS.md left alone.

## Issues

### Issue 1 -- Severity: nit
- File: `AGENTS.md:341`
- Description: Progress-every-turn living tip still says **13 of about 206**. Residual, WATCHER, and SESSION-HANDOFF already say **26**. Review contract says leaving AGENTS.md alone is a nit, not a blocker.
- Suggestion: A later docs slice may update the living tip to 26. Do not block Grow HostImportGraphWalk on this.
- Status: open

### Issue 2 -- Severity: nit
- File: `src/systems/SystemsLean/ElabMeetTheorems.lean:19`
- Description: Header spec list still ends at HostImportGraphModsLater-subset. The four WalkLater `_true` theorems are present at 834-852. The readable spec comment is stale.
- Suggestion: Add HostImportGraphLoadOkLater and HostImportGraphWalkLater to the header list on a later touch. Not required to start the next Open.
- Status: open

### Issue 3 -- Severity: nit
- File: `.agents/reports/impl-grow-hostimportgraphwalklater-20260816.md:19`
- Description: Observed red is claimed with command, exit 1, and four free-variable names. There is no saved lake stderr log. Theorems were not rewritten.
- Suggestion: Next implementer may keep a short red log under `/tmp` if the orchestrator wants independent red proof. Not a rewritten-expect bug.
- Status: open

## Blockers

None.

## Closeout

**APPROVE WITH NITS.** Twenty-sixth named closed subset is HostImportGraphWalkLater. Next Open is Grow HostImportGraphWalk. Wrappers may stay on the 181-line WalkLater walk. The twenty-seventh probe must be new.
