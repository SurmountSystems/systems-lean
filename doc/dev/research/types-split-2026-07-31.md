# Types long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Split TYPES-THEOREM / HOST-TYPES-THEOREM from cold Types.lean into
TypesTheorems.lean (same namespace SystemsLean.Types).

| Path | Lines |
|------|------:|
| SystemsLean/Types.lean (before) | 302 |
| SystemsLean/Types.lean (after) | 151 |
| SystemsLean/TypesTheorems.lean (new) | 215 |

Delta parent: -151. Pattern: KernelTypes / ParityLinear / Extract theorem splits.

## What stayed on parent

- TypeTag / typeTagInit
- NodeKind (value/linear/erased) + name + expectedMult
- kindMultOk / ofKindTag? / isValidKindTag
- IrNode / isWellTyped / mkNode? / mkNodeFromTags?
- Greppable honesty tokens for unit-walk (TYPES-THEOREM names listed in
  header for discoverability; theorem bodies live on split module)

## What moved

- All TYPES-THEOREM / HOST-TYPES-THEOREM bodies
  (ofKindTag?* / isValidKindTag* / kindMultOk* / mkNode?* /
  expectedMult_* / isWellTyped_eq_kindMultOk / mkNodeFromTags?*)

## Gates at land

- lake Types + TypesTheorems green
- just hygiene + just systems-host green (host-specs-core Types + TypesTheorems)
- Claims: complete true; free/llvm/PROVABLY false (no tip touch)

## Next cold primary

ParityTypes.lean 279 (never split). Then EmitMult 277 / InventoryClose 262.
Skip CompilePath* / tip / already-split scaffolds / *Main dual-pin homes.
