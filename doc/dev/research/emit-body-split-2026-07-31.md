# EmitBody long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/EmitBody.lean` | 820 | **480** (-340) |
| `src/systems/SystemsLean/EmitBodyScaffold.lean` | (new) | **394** |

Parent under 500. Seam is HOST-EMIT-BODY product scaffolding split (not dual-pin, not tip).

## Stay / move

| Stay on EmitBody | Moved to EmitBodyScaffold |
|------------------|---------------------------|
| Module header + core dialect | `productStageId` / host/self-host map ids |
| `bodyCap`, `Body`, `Body.failClosed` | `bodyHeaderOpen` / `bodyApiDecls` / `bodyHeaderFragment` |
| `buildFragment`, `emptyComposeFragmentSsot` | `bodyScaffoldOpen` / `bodyScaffoldBodies` / `bodyBodyFragment` |
| `bodyFromCompose`, `bodyIsValid`, `bodyOk` | ownership / surface / honesty Bools |
| Marker helpers + EMIT-BODY theorems | `emitBodyReady` / `emitBodyOk` |
| EMIT-BODY-SMOKE fixtures | EMIT-BODY-PRODUCT-SMOKE + `emitBodyReady_true` |
| Import `EmitBodyScaffold` + split cites | Same namespace `SystemsLean.EmitBody` |

## Coherence

- One seam: HOST-EMIT-BODY freestanding product C scaffolding text + readiness
  vs core EMIT_BODY_V0 fragment dialect / theorems / body smoke.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Scaffold via EmitBody import (and client imports where
  bodyHeaderFragment / emitBodyReady are used directly).

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- EmitBodyScaffold path
- `nix/systems-host-presence/required-files.nix` -- EmitBodyScaffold path
- `nix/systems-host-presence/host-specs-core.nix` -- parent cites + Scaffold row
- `nix/systems-emit-wire/emit-product.nix` -- FreestandingEmit + DualEqWrite cites + Scaffold row
- Client imports: DualEqWriteLoad, DualEqWriteApi, CapableWriteHc, CompilePathBody,
  FreestandingEmit, SelfHostBody, SystemsLean.lean root

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
