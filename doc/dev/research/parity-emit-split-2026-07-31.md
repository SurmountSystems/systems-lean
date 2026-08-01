# ParityEmit long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

Theorem + behavioral smoke split (same pattern as KernelEmit / KernelProgram /
DualResidual / SelfHostBody / SpecProof / JoinMap / SurfaceMatrix), not
emit-product Scaffold.

| Role | Path | Lines |
|------|------|------:|
| Parent (stage ids, product API defs, *Ready bars, emitParityOk) | `src/systems/SystemsLean/ParityEmit.lean` | **240** (was **419**) |
| Theorems + smoke (`PARITY-EMIT-THEOREM` / `PARITY-EMIT-SMOKE`) | `src/systems/SystemsLean/ParityEmitTheorems.lean` | **243** |

Same namespace `SystemsLean.ParityEmit` so theorem names stay unqualified.

## Delta

- Before: ParityEmit.lean **419**
- After: ParityEmit.lean **240** (-179)
- New: ParityEmitTheorems.lean **243**

## Why this seam

ParityEmit is Emit freestanding path parity (KernelEmit + ParityProgram +
product API canaries), not emit product text scaffolding. A Scaffold copy would
mis-name the role. Theorems + smoke were a coherent block (from
`PARITY-EMIT-THEOREM` through end of smoke examples) that does not own the
readiness API or frozen-ABI string defs.

## Wiring

- Root: `SystemsLean.lean` imports `ParityEmitTheorems`
- Host presence: `host-leans.nix`, `required-files.nix`, `specs.nix` root import
- Host specs: parent entry cites split + drops smoke/example / theorem-form pins
  to theorems module; new `ParityEmitTheorems.lean` entry in
  `host-specs-kernel-parity.nix`
- Emit-wire: unchanged (no product wire tokens moved)
- README cites split

## Gates

- `lake build SystemsLean.ParityEmit SystemsLean.ParityEmitTheorems` green
- `just systems-host` green
- `just hygiene` green
- Tip SelfApplyFs not touched; freestanding-self-host-complete not required

## Claims

- complete true (unchanged; SelfApplyFs claim B)
- residual free false; llvm unlock false; PROVABLY unlock false

## Next cold primary

Prefer never-split cold primaries; skip tip, role scaffolds, CompilePath
seams-done, DualEqWriteApi / EmitBody / DualResidual / KernelEmit / EmitProgram /
ParityEmit already split.

| Candidate | Lines | Notes |
|-----------|------:|-------|
| **IrGraph** | **410** | Never split; next Open |
| ParityProgram | 407 | Never split |
| ProductPathOwnershipRegenerate | 390 | Never split |
| ParityMult | 382 | Never split |
| ProbeWire | 379 | Never split |
