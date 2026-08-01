# EmitExtract long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

HOST-EMIT-EXTRACT product-text scaffolding split (same pattern as EmitProgram /
EmitTypes / EmitLinear / EmitGraph / EmitCompose), not dual-pin and not theorem-only.

| Role | Path | Lines |
|------|------|------:|
| Parent (module header + greppable cites + import) | `src/systems/SystemsLean/EmitExtract.lean` | **70** (was **370**) |
| Scaffolding (fragments, honesty, ready, smoke) | `src/systems/SystemsLean/EmitExtractScaffold.lean` | **361** |

Same namespace `SystemsLean.EmitExtract` so call sites stay
`EmitExtract.emitExtractReady` / `extractHeaderFragment` unqualified under that
namespace.

## Delta

- Before: EmitExtract.lean **370**
- After: EmitExtract.lean **70** (-300)
- New: EmitExtractScaffold.lean **361**

## Why this seam

EmitExtract is host-owned Extract + FAIL_CLOSED freestanding C product text
(HOST-EMIT-EXTRACT): stage/map ids, `extractHeaderFragment` /
`extractBodyFragment`, ownership/header/body honesty, `emitExtractReady`, and
EMIT-EXTRACT-SMOKE examples. That block is the same role as other emit-product
Scaffold splits. A Theorems-only split would leave the long string SSoT on the
parent; Scaffold matches EmitProgram/EmitTypes/EmitLinear.

## Wiring

- Root: `SystemsLean.lean` imports `EmitExtractScaffold`
- Dual surfaces: FreestandingEmit, DualEqWriteLoad, DualEqWriteApi,
  CapableWriteHc, CapableWriteHcLoad import `EmitExtractScaffold` (match
  Types/Program scaffold import greps)
- Host presence: `host-leans.nix`, `required-files.nix`,
  `host-specs-kernel-parity.nix` (parent cites split + scaffold entry)
- Emit-wire: DualEqWriteLoad import list, FreestandingEmit product cites,
  scaffold file entry in `emit-product.nix`
- Ownership map / README HOST-EMIT-EXTRACT rows note scaffold path

## Gates

- `lake build SystemsLean.EmitExtract SystemsLean.EmitExtractScaffold` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete true (unchanged; SelfApplyFs claim B / DualResidual alias)
- residual free false; llvm unlock false; PROVABLY unlock false

## Next cold primary

Prefer never-split cold primaries; skip tip, role scaffolds, CompilePath
seams-done, already split once.

| Candidate | Lines | Notes |
|-----------|------:|-------|
| **OwnershipClaimed** | **367** | Never split; next Open |
| PerformClaimed | 345 | Never split |
| KernelTypes | 345 | Never split |
| Extract | 344 | Host Extract semantics (not EmitExtract) |
