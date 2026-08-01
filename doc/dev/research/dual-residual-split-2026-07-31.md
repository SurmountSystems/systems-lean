# DualResidual long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

Theorem + behavioral smoke split (same pattern as SelfHostBody / SpecProof /
JoinMap / SurfaceMatrix), not emit-product Scaffold.

| Role | Path | Lines |
|------|------|------:|
| Parent (stage ids, path/cite surface, claim Bools, `dualResidualReady`) | `src/systems/SystemsLean/DualResidual.lean` | **316** (was **427**) |
| Theorems + smoke (`DUAL-RESIDUAL-THEOREM` / `DUAL-RESIDUAL-SMOKE`) | `src/systems/SystemsLean/DualResidualTheorems.lean` | **180** |

Same namespace `SystemsLean.DualResidual` so theorem names stay unqualified.

## Delta

- Before: DualResidual.lean **427**
- After: DualResidual.lean **316** (-111)
- New: DualResidualTheorems.lean **180**

## Why this seam

DualResidual is dual residual honesty readiness (host elaborator residual vs
product residual; neither free forged), not emit product text. A Scaffold copy
would mis-name the role. Theorems + smoke were a coherent block (~lines 303-425)
that does not own the readiness API or claim Bools.

## Wiring

- Root: `SystemsLean.lean` imports `DualResidualTheorems`
- Host presence: `host-leans.nix`, `required-files.nix`, `specs.nix` root import
- Host specs: parent entry cites split + drops smoke/example / theorem-form pins
  to theorems module; new `DualResidualTheorems.lean` entry in
  `host-specs-hold-close.nix`
- Emit-wire: unchanged (no product wire tokens moved)

## Gates

- `lake build SystemsLean.DualResidual SystemsLean.DualResidualTheorems` green
- `just systems-host` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete true (unchanged; `productSelfHostCompleteClaimed` / SelfApplyFs alias)
- residual free false; llvm unlock false; PROVABLY unlock false

## Next cold primary

Prefer never-split cold primaries; skip tip, role scaffolds, CompilePath
seams-done, DualEqWriteApi / EmitBody already split once.

| Candidate | Lines | Notes |
|-----------|------:|-------|
| **KernelEmit** | **425** | Never split; next Open |
| EmitProgram | 422 | Never split |
| ParityEmit | 419 | Never split |
| SpecProof | 432 | Already split once (Theorems) |
| FreestandingEmit | 448 | Already split once (Load) |
