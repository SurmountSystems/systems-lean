# EmitGraph long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SystemsLean/EmitGraph.lean` before | 477 |
| `SystemsLean/EmitGraph.lean` after | 69 |
| `SystemsLean/EmitGraphScaffold.lean` (new) | 474 |
| Delta parent | -408 |

## Seam

HOST-EMIT-GRAPH product-text scaffolding split into
`EmitGraphScaffold.lean`, same namespace `SystemsLean.EmitGraph`
(pattern: EmitComposeScaffold / EmitPlanScaffold / EmitApplyScaffold).

**Moved to EmitGraphScaffold:** stage/map ids, path cites, ownership comment,
header/body open + API decls + bodies, graphHeaderFragment /
graphBodyFragment, honesty Bools, emitGraphSurfaceOk / emitGraphReady /
emitGraphOk, EMIT-GRAPH-SMOKE / HOST-EMIT-GRAPH-SMOKE examples,
theorem emitGraphReady_true.

**Stays in EmitGraph:** module header + import scaffold + thin greppable
pointer comment (defs live on scaffold).

**Cycle rule:** EmitGraph imports EmitGraphScaffold; scaffold does not
import EmitGraph.

## Wire-up

- `SystemsLean.lean` imports `EmitGraphScaffold` (after EmitGraph)
- FreestandingEmit + DualEqWriteApi/Load + CapableWriteHc/Load import scaffold
- host-presence: `host-leans.nix`, `required-files.nix`, split tokens in
  `host-specs-kernel-parity.nix`
- emit-wire: FreestandingEmit + DualEqWriteApi import tokens; new
  EmitGraphScaffold contentSpec in `emit-product.nix`
- Thin parent: RUNTIME-FS unit-walk IR token (scaffold holds body honesty)
- Drive-by: KernelProgramTheorems UNIT_SURFACE IR token (RUNTIME-FS) so
  emit-wire unit walk stays green after prior split

## Gates

- `lake build SystemsLean.EmitGraph SystemsLean.EmitGraphScaffold` exit 0
- `just systems-host` exit 0
- `just systems-emit-wire` exit 0
- `just hygiene` exit 0

## Claims

- complete true (untouched)
- free / llvm / PROVABLY false (untouched)

## Next cold primary

SurfaceMatrix.lean **475** (largest still-cold never-split after skip tip +
*Scaffold/*Theorems/*Load/*Bars; DualEqWriteApi/EmitBody already split).
