# ProductPathWriterPathPlan long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after ProductPathWriterSurface (147->134). Live parent
was 143 lines with theorem + example smoke co-located with stage/step Ok folds.

## Seam
Same pattern as ProductPathWriterPathExec / ProductPathWriterSurface:

| Role | Module |
|------|--------|
| Stage ids, step cites, Ok/PartialReady | `ProductPathWriterPathPlan.lean` |
| THEOREM + SMOKE | `ProductPathWriterPathPlanTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productWriterPathPlanPartialReady_true`,
`WRITER-PATH-PLAN-THEOREM`, `ProductPathWriterPathPlanTheorems` (cite only;
live defs in Theorems).

## Sizes
- Parent **143 -> 136**
- Theorems **167** (new)
- SelfApplyFs tip **1915** (import +1 only)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name + WRITER-PATH-PLAN-THEOREM/SMOKE greppables
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.

## Next never-split cold (live wc after this slice)
BootstrapHonesty **142**, ProductPathOwnershipInputs **141**, ProductPathPerform **137**.
