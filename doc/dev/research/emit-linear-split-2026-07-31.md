# EmitLinear long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/EmitLinear.lean` before | 462 |
| `SystemsLean/EmitLinear.lean` after | 62 |
| `SystemsLean/EmitLinearScaffold.lean` (new) | 464 |
| Delta parent | -400 |

## Seam

HOST-EMIT-LINEAR product-text scaffolding split into
`EmitLinearScaffold.lean`, same namespace `SystemsLean.EmitLinear`
(pattern: EmitTypesScaffold / EmitGraphScaffold / EmitComposeScaffold / EmitPlanScaffold).

**Moved to EmitLinearScaffold:** stage/map ids, path cites, ownership comment,
header/body open + API decls + bodies, linearHeaderFragment /
linearBodyFragment, honesty Bools, emitLinearSurfaceOk / emitLinearReady /
emitLinearOk, EMIT-LINEAR-SMOKE / HOST-EMIT-LINEAR-SMOKE examples.

**Stays in EmitLinear:** module header + import scaffold + thin greppable
pointer comment (defs live on scaffold). RUNTIME-FS greppable on parent
(scaffold holds body honesty).

**Cycle rule:** EmitLinear imports EmitLinearScaffold; scaffold does not
import EmitLinear.

## Wire-up

- `SystemsLean.lean` imports `EmitLinearScaffold` (after EmitLinear)
- Dependent call sites keep `import SystemsLean.EmitLinear` only (same namespace)
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-kernel-parity.nix`
- emit-wire: new EmitLinearScaffold contentSpec in `emit-product.nix`
- ownership map: `emit/host-owned-emit.md` scaffold cite

## Gates

- `lake build SystemsLean.EmitLinear SystemsLean.EmitLinearScaffold` exit 0
- `just systems-host` exit 0
- `just systems-emit-wire` exit 0
- `just hygiene` exit 0

## Claims

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

SelfHostBody.lean **456** (largest still-cold never-split after skip tip +
*Scaffold/*Theorems/*Load/*Bars; skip CompilePath **458** seams-done not
re-open; skip DualEqWriteApi **498** / EmitBody **480** already split once;
then FreestandingEmit **448** split once, DualResidual **427**, KernelEmit **425**).
