# Independent review: Grow HostModuleCheckRequiredDeclsProduct

Date: 2026-08-16
Repo: /home/hunter/Projects/ai/iso
Role: L3 independent general reviewer. No product Lean edits. No next grow started.

## Verdict

**APPROVE WITH NITS**

Blocker count: **0**

This is a named closed-subset grow. The four `_true` theorems keep the same names and `= true := by native_decide` proofs that the implementer logged as red. The twenty-ninth probe is a new role module. Wrappers stayed on WalkLater under the 780 bar. Living claim bools that must stay false are still false. Next Open is Grow HostModuleCheckRequiredDeclsLater.

## Blockers

None.

## TDD red then same theorems green

Implementer log (`/tmp/grok-1000/grok-impl-summary-grow-hostmodulecheckrequireddeclsproduct-20260816.md`):

1. Four theorem stubs landed in `ElabMeetTheorems.lean` first.
2. Command: `lake build SystemsLean.ElabMeetTheorems` from `src/systems`.
3. Exit 1. Fail reason: expected type must not contain free variables, at:

   - `ElabMeetTheorems.lean:904` `elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset = true`
   - `ElabMeetTheorems.lean:909` `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset = true`
   - `ElabMeetTheorems.lean:914` `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset = true`
   - `ElabMeetTheorems.lean:919` `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset = true`

That is the required free-variable / missing-identifier red.

Independent read of the live theorems (`src/systems/SystemsLean/ElabMeetTheorems.lean:902-920`):

- `elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset_true`
- `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset_true`
- `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset_true`
- `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset_true`

Each is still `= true := by native_decide`. Line numbers still match the logged red. Names and proofs were not rewritten to finish green.

Named contract is the residual Done when: accept good, reject planted error, isolate from the prior twenty-eight-module walk, drive is good && !bad && isolation. The theorems encode that contract. They were not fitted to a weaker product.

Green was logged by the implementer (same four theorems after product Bools) and by the mop incremental rebuilds. This review did not re-run those Lake jobs.

## Extract-first / line counts

Measured with `wc -l` this review (not copied from the implementer):

| Lines | Path | Check |
|------:|------|--------|
| 615 | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean` | under 780; wrappers live here |
| 220 | `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean` | new twenty-ninth probe |
| 216 | `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean` | prior probe; no Product dump |
| 922 | `src/systems/SystemsLean/ElabMeetTheorems.lean` | four `_true` theorems at the tip |
| 804 | `src/systems/SystemsLean/ElabMeet.lean` | fold after RequiredDecls |
| 693 | `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` | no Product tokens |
| 865 | `src/systems/SystemsLean/ElabMeetSubset.lean` | did not grow |
| 916 | `src/systems/SystemsLean/ElabMeetCompile.lean` | did not grow |
| 785 | `src/systems/SystemsLean/ElabMeetNamedWalkLater.lean` | leftover walk stays |
| 863 | `src/systems/SystemsLean/ElabMeetNamedWalkTail.lean` | leftover walk stays |

`ElabMeetSubset.lean`, `ElabMeetCompile.lean`, and `ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean` have no HostModuleCheckRequiredDeclsProduct tokens.

`HostModuleCheckRequiredDeclsProduct.lean` exists as the older HostModuleCheck key-decl barrel (mtime 2026-08-11, namespace `SystemsLean.HostModuleCheck`). It has no `ElabMeet` / `elabMeet` tokens. This slice did not plant that file as an ElabMeet product module. The new closed-subset surface is `ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean` (mtime 2026-08-16).

## Isolation token

Isolation command / probe name is `#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe`.

Evidence:

- `elab "#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe"` in the new probe
- invocation `#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe` after the command
- greppable `elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe` in the probe header and in `nix/systems-host-presence/host-specs-hold-close.nix`

Drive is good && !bad && isolation. Isolation includes leftover temp `good.lean` false, leftover fake `lean_lib ElabMeetRichLib` false, prior `tryCompileNamedHostModuleCheckRequiredDeclsSubset` still succeeding, and the twenty-ninth walk not being an alias of the twenty-eighth.

## Pins still false

Live defs remain `:= false`:

- `src/systems/SystemsLean/ElabMeet.lean:441` `slakeOwnsPackageTypecheck`
- `src/systems/SystemsLean/ElabMeet.lean:445` `elabMeetFullHostElaborateRemains`
- `src/systems/SystemsLean/HostResidualShrink.lean:227` `hostResidualShrinkFullHostElaborateRemains`
- `src/systems/SystemsLean/LlvmCfgHonesty.lean:86` `llvmCfgFixtureDominanceClaimed`
- `src/systems/SystemsLean/LlvmMultSsa.lean:142` `llvmMultSsaFullBackendClaimed`

Honesty theorems in `ElabMeet.lean` still prove the first two false. DualResidual `residualFreeClaimed` stays `true` (`DualResidual.lean:227`). No living host-ownership / FullHost / llvm-backend pin was flipped.

## Next Open

**Grow HostModuleCheckRequiredDeclsLater** (Name 156).

Confirmed in:

- `RESIDUAL-systems.md` Open tip
- `RESIDUAL.md` join board row 156
- `WATCHER.md` `/implement --effort 2 Grow HostModuleCheckRequiredDeclsLater`
- `doc/SESSION-HANDOFF.md` living tip: 29 of about 206; next Grow HostModuleCheckRequiredDeclsLater

Not another Product grow. Not Grow HostImportGraph / LoadOk / Theorems / Driver.

## Allowed nits (0 blockers)

### Issue 1 -- Severity: nit
- File: `AGENTS.md:341`
- Description: Living progress tip still says 13 of about 206 and next remaining work is Grow HostFrontTheorems. The closed subset is 29 of about 206 and HostFrontTheorems is already on the path. Review instructions allow this nit and do not require editing `AGENTS.md`.
- Suggestion: A later process mop may refresh the ordinary-English metric when that file is already in scope. Do not block this slice on it.
- Status: open

### Issue 2 -- Severity: nit
- File: `RESIDUAL-systems.md:868`
- Description: Name 155 Primary paths still quotes the pre-slice extract plan (WalkLater 470, ElabMeet fold 799, ElabMeetTheorems 900). The Status block on the same Name records the measured after-land counts (615 / 804 / 922). Not a claim lie.
- Suggestion: Optional later scrub of the frozen Primary-paths snapshot. Do not rewrite residual for this review.
- Status: open

## ASCII / languages / isolation of the grow

- New probe and WalkLater wrappers are ASCII. No em dashes. No leftover module-split slang.
- Three languages only. No new C or shell.
- Probe is isolated from Subset, Compile, Seeds, Tail, Later leftover, HostTerm, and the prior RequiredDecls probe.
- Barrel import 121 is the existing HostModuleCheckRequiredDeclsProduct product module. ElabMeet import of the probe is in `SystemsLean.lean`, `ElabMeet.lean`, and `ElabMeetTheorems.lean`.

## What this review did not re-run

- Long `lake build` of ElabMeetTheorems / the Product probe / WalkLater / ElabMeet
- Crate-wide cargo
- `just check`

Proof for this review is the named fixture theorems on disk, the logged red at matching line numbers, the mop incremental greens, and the independent file reads above.

## Issues

The two nits above. No bugs. No suggestions that block APPROVE.
