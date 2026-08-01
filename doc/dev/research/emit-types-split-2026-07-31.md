# EmitTypes long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/EmitTypes.lean` before | 466 |
| `SystemsLean/EmitTypes.lean` after | 66 |
| `SystemsLean/EmitTypesScaffold.lean` (new) | 463 |
| Delta parent | -400 |

## Seam

HOST-EMIT-TYPES product-text scaffolding split into
`EmitTypesScaffold.lean`, same namespace `SystemsLean.EmitTypes`
(pattern: EmitGraphScaffold / EmitComposeScaffold / EmitPlanScaffold).

**Moved to EmitTypesScaffold:** stage/map ids, path cites, ownership comment,
header/body open + API decls + bodies, typesHeaderFragment /
typesBodyFragment, honesty Bools, emitTypesSurfaceOk / emitTypesReady /
emitTypesOk, EMIT-TYPES-SMOKE / HOST-EMIT-TYPES-SMOKE examples,
theorem emitTypesReady_true.

**Stays in EmitTypes:** module header + import scaffold + thin greppable
pointer comment (defs live on scaffold). RUNTIME-FS unit-walk IR token on
parent (scaffold holds body honesty).

**Cycle rule:** EmitTypes imports EmitTypesScaffold; scaffold does not
import EmitTypes.

## Wire-up

- `SystemsLean.lean` imports `EmitTypesScaffold` (after EmitTypes)
- FreestandingEmit + DualEqWriteApi/Load + CapableWriteHc/Load import scaffold
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-kernel-parity.nix`
- emit-wire: FreestandingEmit + DualEqWriteApi import tokens; new
  EmitTypesScaffold contentSpec in `emit-product.nix`
- ownership map: `emit/host-owned-emit.md` scaffold cite

## Gates

- `lake build SystemsLean.EmitTypes SystemsLean.EmitTypesScaffold` exit 0
- `just systems-host` exit 0
- `just systems-emit-wire` exit 0
- `just hygiene` exit 0

## Claims

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

EmitLinear.lean **462** (largest still-cold never-split after skip tip +
*Scaffold/*Theorems/*Load/*Bars; then CompilePath **458**, SelfHostBody **456**).
