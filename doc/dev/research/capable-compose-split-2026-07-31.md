# CapableCompose long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Result

| Path | Lines |
|------|------:|
| `CapableCompose.lean` before | 338 |
| `CapableCompose.lean` after | 323 |
| `CapableComposeTheorems.lean` (new) | 200 |

## Seam

Theorem + smoke move into `SystemsLean.CapableComposeTheorems` (same namespace
`SystemsLean.CapableCompose`). Parent keeps stage ids, dual-SSOT read/compose IO
(`freestandingCapableComposePlanApplyBody`), Ok / PartialReady folds, and main.
Parent does not import Theorems (import cycle). Pattern matches
SelfHostCompleteTheorems / SelfHostTheorems / ExtractTheorems.

Surface honesty theorems added in Theorems: stageId/hostId/selfHostId/
contract/gap/writer/API/recipe/exe pins, AuthorityNotEmit, DependsOnLake,
Full land-time false, Ok_true, PartialReady_true + COMPOSE-SMOKE examples.

## Wire

- `SelfApplyFs.lean` import `CapableComposeTheorems` (after CapableCompose)
- `nix/systems-host-presence/{host-leans,required-files,specs}.nix`
  (parent greppable theorem cite retained; new Theorems rel block)

## Gates

- `lake build SystemsLean.CapableCompose SystemsLean.CapableComposeTheorems` exit 0
- `just hygiene` OK
- `just systems-host` OK
- `just systems-emit-wire` OK

## Claims

Unchanged: complete true (SelfApplyFs / SelfHostComplete); free / llvm /
PROVABLY false.

## Next cold never-split primary

EmitBanner.lean **327** (skip scaffolds / Theorems / Load / Bars / Main /
CompilePath* / SelfApplyFs tip / already-split list).
