# ParityTypes long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Result

| Path | Lines |
|------|------:|
| SystemsLean/ParityTypes.lean (before) | 279 |
| SystemsLean/ParityTypes.lean (after) | 171 |
| SystemsLean/ParityTypesTheorems.lean (new) | 168 |

Delta parent: **-108**.

## Seam

PARITY-TYPES-THEOREM + PARITY-TYPES-SMOKE moved to
ParityTypesTheorems.lean (same namespace SystemsLean.ParityTypes).

Parent keeps stage ids, product API name defs, typesContractParityOk,
typesParityReady, multLinearTypesParityReady, typesParityOk.

## Wire-up

- SystemsLean.lean import + header
- lakefile.toml header comment
- nix/systems-host-presence: required-files, host-leans, host-specs-kernel-parity
  (parent thinned; Theorems block added), specs.nix root import token
- README + host-partial-inventory companion rows

## Gates

- lake SystemsLean.ParityTypes + SystemsLean.ParityTypesTheorems green
- just hygiene green
- just systems-host green
- tip not touched; complete true; free/llvm/PROVABLY false unchanged

## Next

EmitMult.lean 277 (never split). Then InventoryClose 262 / ...
