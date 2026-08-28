# Process mop: Grow HostModuleCheckRequiredDeclsProduct

Date: 2026-08-16
Repo: /home/hunter/Projects/ai/iso
Role: independent process mop. No product Lean edits. No review. No next grow started.

Verdict: GREEN

## Gates

1. Command: `just hygiene`
   Working directory: /home/hunter/Projects/ai/iso
   Exit code: 0
   Wall time: 20 seconds
   Note: source-hygiene OK (1535 files) and professional-tone OK (779 markdown files).

2. Command: `just professional-tone`
   Working directory: /home/hunter/Projects/ai/iso
   Exit code: 0
   Wall time: 14 seconds
   Note: professional-tone OK (779 markdown files; 28 banned tokens; novel markdown only).

3. Command: `just systems-host`
   Working directory: /home/hunter/Projects/ai/iso
   Exit code: 0
   Wall time: 2 seconds
   Note: systems-host-presence OK (403 required paths).

4. Lake builds from cwd `/home/hunter/Projects/ai/iso/src/systems` only.

   4a. Command: `lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater`
       Exit code: 0
       Wall time: 0 seconds
       Note: incremental. Build completed successfully (9 jobs).

   4b. Command: `lake build SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe`
       Exit code: 0
       Wall time: 1 second
       Note: incremental. Build completed successfully (10 jobs).

   4c. Command: `lake build SystemsLean.ElabMeetTheorems`
       Exit code: 0
       Wall time: 0 seconds
       Note: incremental. Build completed successfully (39 jobs).

   4d. Command: `lake build SystemsLean.ElabMeet`
       Exit code: 0
       Wall time: 1 second
       Note: incremental. Build completed successfully (40 jobs).

All four Lake builds were incremental (seconds, not hundreds of seconds).

## Line counts

Command: `wc -l` on the five named files.

| Path | Lines | Expectation |
|---|---:|---|
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean | 615 | about 615, under 780 |
| src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean | 220 | about 220 |
| src/systems/SystemsLean/ElabMeetSubset.lean | 865 | 865, must not grow |
| src/systems/SystemsLean/ElabMeetCompile.lean | 916 | 916, must not grow |
| src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean | 693 | 693, wrappers must not have been dumped here |

All five counts match. ElabMeetSubset and ElabMeetCompile did not grow. Seeds stayed at 693. Search of Seeds for HostModuleCheckRequiredDeclsProduct / elabMeetNamedHostModuleCheck found no matches.

## Plant check

Live barrel exists: `src/systems/SystemsLean/HostModuleCheckRequiredDeclsProduct.lean` (mtime 2026-08-11).

That file is the HostModuleCheck required key-decl list module (ProductOut through CompilePathGraph). Namespace is `SystemsLean.HostModuleCheck`. It is not an ElabMeet wrapper dump.

Search of that live barrel for ElabMeet wrapper defs (`def` / `abbrev` / `theorem` / `opaque` / `instance` names containing ElabMeet) found no matches. Broader token search for `ElabMeet` / `elabMeet` in that file also found no matches.

The new closed-subset probe lives beside it as `ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean`, which is the expected probe path, not a plant into the live HostModuleCheck barrel.

## Unexpected edits

Read-only `git diff --stat` (working tree versus index) for product-facing paths:

- Expected for this grow and the still-uncommitted serial grow campaign: `src/systems/SystemsLean.lean` (+14 imports), `src/systems/SystemsLean/ElabMeet.lean` (+59 import and ready-conjunction lines), `src/systems/SystemsLean/ElabMeetTheorems.lean` (+225), `nix/systems-host-presence/host-leans.nix` (+27), `nix/systems-host-presence/required-files.nix` (+27). Those rows include this slice's Product probe plus earlier HostImportGraph / HostPackage* probes from the same uncommitted series.
- Expected untracked product for this slice: `src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean`. The Later walk `ElabMeetNamedWalkHostImportGraphWalkLater.lean` is also untracked and stayed at 615 lines.
- Residual and docs dirty as allowed: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`, `.agents/plans/plan-slake-replaces-lake.md`.
- Flagged leftover, not this slice: `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` (index added, working tree still dirty, +402 unstaged). That is a prior HostPackageWrite grow body.
- Flagged leftover, not this slice: `nix/systems-host-presence/host-specs-hold-close.nix` (staged and unstaged, +465 unstaged). That file is the hold-close host token spec split (LlvmHold through SelfHostBody), not HostModuleCheck ElabMeet wrappers.

No ElabMeet wrappers were planted into the live HostModuleCheckRequiredDeclsProduct barrel. No wrappers were dumped into Seeds. The leftover dirty paths above are prior-campaign residue, not a failed plant check.

## Pins (must stay false)

Confirmed live definitions remain `:= false`:

- `src/systems/SystemsLean/ElabMeet.lean`: `def slakeOwnsPackageTypecheck : Bool := false`
- `src/systems/SystemsLean/ElabMeet.lean`: `def elabMeetFullHostElaborateRemains : Bool := false`
- `src/systems/SystemsLean/HostResidualShrink.lean`: `def hostResidualShrinkFullHostElaborateRemains : Bool := false`
- `src/systems/SystemsLean/LlvmCfgHonesty.lean`: `def llvmCfgFixtureDominanceClaimed : Bool := false`
- `src/systems/SystemsLean/LlvmMultSsa.lean`: `def llvmMultSsaFullBackendClaimed : Bool := false`

Honesty theorems and `rfl` examples in ElabMeet still prove the first two false. No pin was flipped true.

## Verdict

GREEN. Hygiene, professional-tone, systems-host, and the four Lake builds all exited 0. Line counts match. The live HostModuleCheckRequiredDeclsProduct barrel has no ElabMeet wrappers. The five named pins stay false.

## Next

Do not start Grow HostModuleCheckRequiredDeclsLater from this mop.
