# Implement report: residual closeout after Compose SSA + LLVM timing

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` exit 0.

---

## Goal

Update living residual so the queue matches sibling evidence. Do not flip
claim bools. Do not re-queue Compose SSA. Do not open cold compose init unroll.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-compose-ssa-finish-2026-08-12.md` | Compose SSA **done**. `out/llvm-ir/slake_compose_ssa.ll` 4542 bytes. Writer resumed. `just llvm-compose-ssa` 0; `just systems-llvm-ir` 0; `just hygiene` 0; `just llvm-as-smoke` 0 GREEN. SSA llvm-as expected set **done**. `llvmComposeSsaFullBackendClaimed` stays false. |
| `.agents/reports/impl-llvm-execute-bench-2026-08-12.md` | LLVM IR compile and run timing **done**. `just bench-llvm` writes `doc/BENCH-LLVM-latest.md`. Not CompCert. Not C product wire. Not FullBackend. |
| `.agents/reports/impl-fullhost-meet-progress-2026-08-12.md` | Full host package elaborate meet **done partial**. Inventory landed. PE43/PE44 SpecProof + DualResidual twins. Pin still false. Harness 99. Next named meet-path: Package-env for CompilePath unit TERM. |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Open queue 5/6/9 **done**; 10 **done partial**; living tip + highest-value next + Done archive + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Richer-than-i32 layout, then IR consumer link smoke. `/implement --effort 2 Richer-than-i32 layout`. Did not re-queue Compose SSA. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `.agents/reports/impl-residual-closeout-ssa-timing-2026-08-12.md` | This report |

No product Lean. No emit C. No `just/llvm*.just`. No `just/bench-llvm.just`.
No `LlvmComposeSsa`.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA lower partial | **done** | `slake_compose_ssa.ll` 4542 bytes; gates green |
| SSA llvm-as expected set | **done** | Mult through Graph SSA and compose SSA assemble |
| Richer-than-i32 layout | **open** | Highest-value next |
| IR consumer link smoke | **open** | After layout |
| LLVM IR compile and run timing | **done** | `just bench-llvm`; not CompCert; not FullBackend |
| Full host package elaborate meet | **done partial** | Inventory + PE43/PE44; pin still false |
| Cold compose init unroll | **not open** | Leftover mixed; operator notes stay not open |

Highest-value next: **Richer-than-i32 layout**, then **IR consumer link smoke**.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness / TERM dual-ok | 206 / 99 / 46 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 (scope string still SurfaceMatrixEnv-only; not seed-wide) |
| systems-emit-wire | green |
| FULLHOST_FLIP | no |
| Speed | empirical (`just bench-runtime`); never rename as PROVABLY |

No Lean claim-bool edits.

---

## Hygiene

```
just hygiene
```

**exit 0**

---

## Out of scope (honored)

- Product Lean / C / Nix implementation
- Claim-bool flips
- Opening cold compose init unroll
- Re-queuing Compose SSA
- Touching `LlvmComposeSsa*.lean`, `just/llvm*.just`, `just/bench-llvm.just`, emit C
- Git add / commit / push
