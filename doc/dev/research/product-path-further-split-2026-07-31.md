# ProductPath further split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/ProductPath.lean` | 667 | **424** (-243) |
| `src/systems/SystemsLean/ProductPathTheorems.lean` | (new) | **289** |
| `src/systems/SystemsLean/ProductPathBars.lean` | 254 | 254 (unchanged) |

Parent under 500. Seam is theorems + smoke split (not dual-pin, not tip).

## Stay / move

| Stay on ProductPath | Moved to ProductPathTheorems |
|---------------------|------------------------------|
| Module header + greppable stage / close ids | PRODUCT-PATH-THEOREM theorems |
| Surface string cites + `productPathSurfaceOk` | PRODUCT-PATH-SMOKE examples |
| residualFreeClaimed / productSelfHostCompleteClaimed | PRODUCT-PATH-CLOSE-SMOKE examples |
| `productPathReady` compose + does-not-* honesty | stageId_eq / hostProductPathId_eq |
| Close ladder (closeSurface / ladderClosed / closeReady) | productPathReady_true family |
| Import ProductPathBars + InventoryClose / SelfApplyFs / LlvmHold | Same namespace `SystemsLean.ProductPath` |

## Coherence

- One seam: theorems + behavioral smoke vs surface / joint ready / ladder close defs.
- Matches HostComposeTheorems pattern (same-namespace split after core).
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Root `SystemsLean.lean` imports ProductPathTheorems after ProductPath.

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- ProductPathTheorems path
- `nix/systems-host-presence/required-files.nix` -- ProductPathTheorems path
- `nix/systems-host-presence/specs.nix` -- parent cites ProductPathTheorems; smoke/theorem tokens moved to Theorems hostSpecs row
- `src/systems/SystemsLean.lean` -- import ProductPathTheorems

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.

## Next cold (wc -l, skip tip SelfApplyFs 1888)

FreestandingEmitLoad **622**, EmitCompose **596**, then KernelProgram / JoinMap / SpecProof ~508-527.
