# KernelEmit long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

Theorem + behavioral smoke split (same pattern as KernelProgram / DualResidual /
SelfHostBody / SpecProof / JoinMap / SurfaceMatrix), not emit-product Scaffold.

| Role | Path | Lines |
|------|------|------:|
| Parent (stage ids, lowerers, *Ready bars, emitKernelOk) | `src/systems/SystemsLean/KernelEmit.lean` | **273** (was **425**) |
| Theorems + smoke (`KERNEL-EMIT-THEOREM` / `KERNEL-EMIT-SMOKE`) | `src/systems/SystemsLean/KernelEmitTheorems.lean` | **219** |

Same namespace `SystemsLean.KernelEmit` so theorem names stay unqualified.

## Delta

- Before: KernelEmit.lean **425**
- After: KernelEmit.lean **273** (-152)
- New: KernelEmitTheorems.lean **219**

## Why this seam

KernelEmit is freestanding codegen host honesty (plan/apply/body + Mult emit
over program kernel), not emit product text scaffolding. A Scaffold copy would
mis-name the role. Theorems + smoke were a coherent block (~lines 265-424)
that does not own the readiness API or lowerers.

## Wiring

- Root: `SystemsLean.lean` imports `KernelEmitTheorems`
- Host presence: `host-leans.nix`, `required-files.nix`, `specs.nix` root import
- Host specs: parent entry cites split + drops smoke/example / theorem-form pins
  to theorems module; new `KernelEmitTheorems.lean` entry in
  `host-specs-kernel-parity.nix`
- Emit-wire: unchanged (no product wire tokens moved)
- README + host-partial-inventory cite split

## Gates

- `lake build SystemsLean.KernelEmit SystemsLean.KernelEmitTheorems` green
- `just systems-host` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete true (unchanged; SelfApplyFs claim B / DualResidual alias)
- residual free false; llvm unlock false; PROVABLY unlock false

## Next cold primary

Prefer never-split cold primaries; skip tip, role scaffolds, CompilePath
seams-done, DualEqWriteApi / EmitBody / DualResidual / KernelEmit already split.

| Candidate | Lines | Notes |
|-----------|------:|-------|
| **EmitProgram** | **422** | Never split; next Open |
| ParityEmit | 419 | Never split |
| IrGraph | 410 | Never split |
| ParityProgram | 407 | Never split |
