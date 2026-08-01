# SelfApplyFs dual-pin thin batch 17 inventory (B18 CapableWriteHc)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b17-2026-07-31.md` (ephemeral)

## Family

**B18 CapableWriteHc** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathFreestandingCapableWriteHc`
(`ProductPathFreestandingCapableWriteHc.lean`). Living tip keeps
EntrypointClaimed / AuthorityNotEmit / DependsOnLake honesty bools (fold bare
names), and the thin chain fold
`productPathFreestandingCapableWriteHcPartialReady`. Living perform claimed /
ownership claimed / complete / B14 CapableWriteHc / B15 WriteHcSatisfied /
B17 Compose PartialReady stay on tip. B19+ untouched (except header/fold comments).

Tip start line count: **4833** (verified `wc -l` before thin).

## Short-name choice

**Defer** rename `ProductPathFreestandingCapableWriteHc` -> `CapableWriteHc`
(+ Main). Same rationale as B17 CapableCompose defer: dual-pin tip shrink is
the value; basename rename is large serial surface (lakefile/just/nix/import).

## Inventory classification

### Stayed on tip
EntrypointClaimed / AuthorityNotEmit / DependsOnLake true defs + theorems;
PartialReady chain fold + theorem; claim re-smokes; import + freestandingCapableWriteFreestandingHc cite;
B14 CapableWriteHc + WriteHcSatisfied (prior).

### Moved home-only
StageId / hostId / selfHostId / EntrypointRecipe / LakeExe / ModuleCite / FnCite / Ok tip alias + stage/recipe/Ok smoke examples.

### Dual by necessity
PartialReady fold tip + home bulk; honesty tip + home land-time AuthorityNotEmit/DependsOnLake; living claims tip-only.

## Gate-first
emit-wire tip hostPin shrink; emit-product home stageId/hostId/Api/recipe tokens;
hostSpecs tip shrink + home expand; tip SelfApplyFs B18 thin; home header note.

## Line counts
| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 4833 | 4790 | -43 |

## Claims preserved
complete/Full/ownership/perform true; StillUsesFreestandingEmit false; free/llvm/PROVABLY false.

## Next
B19 CapableRegenerate dual-pin thin batch 18 (home already short name).
