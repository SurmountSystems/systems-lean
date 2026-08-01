# EmitApply long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/EmitApply.lean` | 706 | **423** (-283) |
| `src/systems/SystemsLean/EmitApplyScaffold.lean` | (new) | **336** |

Parent under 500. Seam is HOST-EMIT-APPLY product scaffolding split (not dual-pin, not tip).

## Stay / move

| Stay on EmitApply | Moved to EmitApplyScaffold |
|------------------|---------------------------|
| Module header + core dialect | `productStageId` / host/self-host map ids |
| `applyCap`, `Apply`, `Apply.failClosed` | `applyHeaderOpen` / `applyApiDecls` / `applyHeaderFragment` |
| `multCode` / `kindCode` / `packTag` / `tagMult` / `tagKind` | `applyBodyOpen` / `applyBodies` / `applyBodyFragment` |
| `applyFromCompose`, `fromCompose`, `applyIsValid`, `applyOk` | ownership / surface / honesty Bools |
| EMIT-APPLY theorems + EMIT-APPLY-SMOKE fixtures | `emitApplyReady` / `emitApplyOk` |
| Import `EmitApplyScaffold` + split cites | EMIT-APPLY-PRODUCT-SMOKE + `emitApplyReady_true` |
| | Same namespace `SystemsLean.EmitApply` |

## Coherence

- One seam: HOST-EMIT-APPLY freestanding product C scaffolding text + readiness
  vs core EMIT_APPLY_V0 tag dialect / theorems / apply smoke.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Scaffold via EmitApply import (and client imports where
  applyHeaderFragment / emitApplyReady are used directly).

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- EmitApplyScaffold path
- `nix/systems-host-presence/required-files.nix` -- EmitApplyScaffold path
- `nix/systems-host-presence/host-specs-core.nix` -- parent cites + Scaffold row
- `nix/systems-emit-wire/emit-product.nix` -- FreestandingEmit + DualEqWrite cites + Scaffold row
- Client imports: DualEqWriteLoad, DualEqWriteApi, CapableWriteHc, CompilePathApply,
  FreestandingEmit, SelfHostBody, SystemsLean.lean root

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
