# ProductPathPerform long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after ProductPathOwnershipInputs (141->136). Live parent
was 137 lines with theorem + example smoke co-located with stage / Lake dependency
/ install step mechanism pins, gap cites, and Ok / PartialReady folds.

## Seam
Same pattern as OwnershipInputs / BootstrapHonesty / ProductPathPerformStep:

| Role | Module |
|------|--------|
| Stage ids, Lake/install honesty pins, gap cites, Ok / PartialReady | `ProductPathPerform.lean` |
| PERFORM-THEOREM + SMOKE | `ProductPathPerformTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productPathPerformPartialReady_true`,
`PERFORM-THEOREM`, `ProductPathPerformTheorems` (cite only; live defs in Theorems).

## Sizes
- Parent **137 -> 134**
- Theorems **80** (new)
- SelfApplyFs tip import +1 (`ProductPathPerformTheorems`; tip **1917**)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name + PERFORM-*-THEOREM/SMOKE; greppable theorem cites stay on primary header
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block
- `nix/systems-host-presence/required-files.nix` + `host-leans.nix`: Theorems path

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.
Land-time Ok / PartialReady folds stay on parent (no claim-bool true defs).

## Next never-split cold (live wc after this slice)
ProductOutKernel **130**, KernelSelfApply **125**, Linear **118**.
