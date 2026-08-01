<!--
  Kind: analysis only. Not residual.
  ProductPathWriterPathExec long-file split inventory (2026-07-31).
-->

# ProductPathWriterPathExec long-file split (2026-07-31)

## Sizes

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/ProductPathWriterPathExec.lean` | 169 | **162** (-7) |
| `src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean` | (new) | **163** |
| `src/systems/SystemsLean/SelfApplyFs.lean` | 1910 | **1911** (import +1) |

Parent strictly decreased. Under 500.

## Seam

**ProductPathWriterPathExecTheorems** (same namespace
`SystemsLean.ProductPathWriterPathExec`).

| Parent keeps | Theorems module holds |
|--------------|----------------------|
| stage / host / selfHost ids | `stageId_eq` / `hostId_eq` / `selfHostId_eq` |
| execution cite strings (load/compose/write/install) | fn cite `_eq` theorems |
| Ok / PartialReady folds | `productWriterPathExecutionOk_true` |
| greppable theorem cite in header | `productWriterPathExecutionPartialReady_true` |
| | WRITER-PATH-EXEC-SMOKE examples |

Coherent WRITER-PATH-EXEC-THEOREM / HOST-WRITER-PATH-EXEC-THEOREM +
WRITER-PATH-EXEC-SMOKE block only. No half-file cut. No stitch markers.
No `/tmp` full-file rewrite.

## Dependents

- `SelfApplyFs.lean` imports `ProductPathWriterPathExecTheorems` after parent.
- Host presence: `host-leans.nix`, `required-files.nix`, `specs.nix` parent +
  Theorems blocks.
- Emit-wire: `emit-product.nix` parent tokens keep greppable theorem cite +
  Theorems module name (live theorem in Theorems module).

## Gates

- `lake build SystemsLean.ProductPathWriterPathExec SystemsLean.ProductPathWriterPathExecTheorems SystemsLean.SelfApplyFs` green
- `just hygiene` green
- `just systems-host` green
- `just systems-emit-wire` green
- Claims: complete true; free/llvm/PROVABLY false unchanged

## Next cold primary

**ProductPathPerformStep** at **152** (never-split; next by live wc).
