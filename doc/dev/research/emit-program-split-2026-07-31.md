# EmitProgram long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

HOST-EMIT-PROGRAM product-text scaffolding split (same pattern as EmitTypes /
EmitLinear / EmitGraph / EmitCompose), not dual-pin and not theorem-only.

| Role | Path | Lines |
|------|------|------:|
| Parent (module header + greppable cites + import) | `src/systems/SystemsLean/EmitProgram.lean` | **68** (was **422**) |
| Scaffolding (fragments, honesty, ready, smoke) | `src/systems/SystemsLean/EmitProgramScaffold.lean` | **413** |

Same namespace `SystemsLean.EmitProgram` so call sites stay
`EmitProgram.emitProgramReady` / `programHeaderFragment` unqualified under that
namespace.

## Delta

- Before: EmitProgram.lean **422**
- After: EmitProgram.lean **68** (-354)
- New: EmitProgramScaffold.lean **413**

## Why this seam

EmitProgram is host-owned IR program freestanding C product text
(HOST-EMIT-PROGRAM): stage/map ids, `programHeaderFragment` /
`programBodyFragment`, ownership/header/body honesty, `emitProgramReady`, and
EMIT-PROGRAM-SMOKE examples. That block is the same role as other emit-product
Scaffold splits. A Theorems-only split would leave the long string SSoT on the
parent; Scaffold matches EmitTypes/EmitLinear/EmitGraph.

## Wiring

- Root: `SystemsLean.lean` imports `EmitProgramScaffold`
- Dual surfaces: FreestandingEmit, DualEqWriteLoad, DualEqWriteApi,
  CapableWriteHc, CapableWriteHcLoad import `EmitProgramScaffold` (match
  Types/Graph scaffold import greps)
- Host presence: `host-leans.nix`, `required-files.nix`,
  `host-specs-kernel-parity.nix` (parent cites split + scaffold entry)
- Emit-wire: DualEqWriteLoad import list, FreestandingEmit product cites,
  scaffold file entry in `emit-product.nix`
- Pre-existing unit-walk fix: `SelfHostBodyTheorems.lean` greppable
  `RUNTIME-FS` (UNIT_SURFACE IR contract any-token; left red after SelfHostBody
  split)

## Gates

- `lake build SystemsLean.EmitProgram SystemsLean.EmitProgramScaffold` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete true (unchanged; SelfApplyFs claim B / DualResidual alias)
- residual free false; llvm unlock false; PROVABLY unlock false

## Next cold primary

Prefer never-split cold primaries; skip tip, role scaffolds, CompilePath
seams-done, DualEqWriteApi / EmitBody / DualResidual / KernelEmit / EmitProgram
already split.

| Candidate | Lines | Notes |
|-----------|------:|-------|
| **ParityEmit** | **419** | Never split; next Open |
| IrGraph | 410 | Never split |
| ParityProgram | 407 | Never split |
