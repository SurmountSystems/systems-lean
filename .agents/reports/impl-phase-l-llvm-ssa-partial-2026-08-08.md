# Implement report: Phase L LLVM SSA lower partial

**Date:** 2026-08-08
**Status:** GREEN

## Goal

Lower one Mult program-graph band to SSA-shaped IR under `out/llvm-ir/` without
flipping full-backend claim. Plan Part 7 / R3 inventory.

## Done when evidence

| Item | Evidence |
|------|----------|
| Lean writer | `src/systems/SystemsLean/LlvmMultSsa.lean` + `LlvmMultSsaMain.lean` |
| Artifact | `out/llvm-ir/slake_mult_ssa.ll` (generator-owned) |
| Dual-pin pure Nix | `nix/systems-llvm-ir/mult-ssa.nix` joined in `specs.nix` |
| Lake green | `lake build SystemsLean.LlvmMultSsa slake-llvm-mult-ssa` exit 0 |
| Writer recipe | `just llvm-mult-ssa` GREEN |
| systems-llvm-ir | exit 0 (36 required paths; Mult SSA partial in summary) |
| hygiene | `just hygiene` GREEN |
| Optional llvm-as | `llvm-as out/llvm-ir/slake_mult_ssa.ll` OK when tool present |
| llvmUnlocked | `def llvmUnlocked : Bool := true` in LlvmHold (unchanged) |
| Full backend | `def llvmMultSsaFullBackendClaimed : Bool := false` |

## What landed

- **SSA-shaped Mult band:** grade tag lower with block labels (`bb_mult0` /
  `bb_mult1` / `bb_omega` / `bb_reject` / `merge`) and `phi i32`; KernelMult
  three-node ordered SSA defs (`slake_mult_ssa_kernel_band_ready`); Mult
  is_valid tag check; Mult grade constants 0/1/2.
- **SSOT cites:** Mult.lean grades; KernelMult `SELF-HOST-KERNEL-MULT` /
  `lowerMultKernel` readiness folded into `llvmMultSsaSurfaceOk`.
- **Honesty pins:** `llvmMultSsaPartialClaimed` true; local unlock false;
  full backend / CFG production / production ready / Rust link false.
- **Wire:** lakefile exe `slake-llvm-mult-ssa`; just `llvm-mult-ssa`;
  SystemsLean.lean import; out/llvm-ir README + residual inventory reseed.

## Non-claims (unchanged)

- Not full CFG/dominance production pipeline
- Not Rust-native link
- Not PROVABLY re-open
- Not free / FullHost forge
- Not host library seed expand (modules=206 unchanged)

## Commands

```bash
cd src/systems && lake build SystemsLean.LlvmMultSsa slake-llvm-mult-ssa
just llvm-mult-ssa
just systems-llvm-ir
just hygiene
```

## Residual lockstep

- Done archive: `RESIDUAL-systems.md` (LLVM SSA lower partial Phase L)
- Living tip next: Phase P
- `WATCHER.md` -> Phase P implement prompt
- Handoff tip: Phase L done
- Research: `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` Mult SSA row done

## Primary paths

- `src/systems/SystemsLean/LlvmMultSsa.lean`
- `src/systems/SystemsLean/LlvmMultSsaMain.lean`
- `out/llvm-ir/slake_mult_ssa.ll`
- `nix/systems-llvm-ir/mult-ssa.nix`
- `nix/systems-llvm-ir/specs.nix`
- `just/llvm.just`
- `src/systems/lakefile.lean`
