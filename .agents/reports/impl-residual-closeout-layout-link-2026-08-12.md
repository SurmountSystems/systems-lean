# Implement report: residual closeout after layout + IR consumer link smoke

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` exit 0.

---

## Goal

Update living residual so the queue matches sibling evidence. Prior closeout
ran in parallel with the layout/link implementer, so Open still listed those
Names. Mark them **done**. Do not flip claim bools. Do not re-queue layout,
link smoke, or Compose SSA. Do not open cold compose init unroll.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-layout-link-smoke-2026-08-12.md` | GREEN. IrNodeRecord 16/4. `just llvm-link-smoke`. FullBackend pins false. |
| `.agents/reports/process-mop-layout-link-2026-08-12.md` | GREEN. No fallout. |
| `.agents/reports/review-general-layout-link-2026-08-12.md` | APPROVE 0 open (nits) |
| `.agents/reports/review-plan-layout-link-2026-08-12.md` | APPROVE. Docs lag: residual still listed layout/link OPEN. |
| `.agents/reports/review-tests-layout-link-2026-08-12.md` | APPROVE. Honesty: green-only (no observed red logged). |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Open queue 7/8 **done**; 10 stays **done partial**; 11 Package-env for CompilePath unit TERM **open**; living tip + highest-value next + Done archive + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for CompilePath unit TERM. `/implement --effort 2 Package-env for CompilePath unit TERM`. Did not re-queue layout or Compose SSA. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `.agents/reports/impl-residual-closeout-layout-link-2026-08-12.md` | This report |

No product Lean. No emit C. No just modules. No claim-bool flips.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA lower partial | **done** | `slake_compose_ssa.ll` 4542 bytes; gates green |
| SSA llvm-as expected set | **done** | Mult through Graph SSA and compose SSA assemble |
| Richer-than-i32 layout | **done** | IrNodeRecord 16/4; no product Rust; FullBackend false |
| IR consumer link smoke | **done** | `just llvm-link-smoke`; not FullBackend |
| LLVM IR compile and run timing | **done** | `just bench-llvm`; not CompCert; not FullBackend |
| Full host package elaborate meet | **done partial** | Inventory + PE43/PE44; pin still false |
| Package-env for CompilePath unit TERM | **open** | Highest-value next; FullHost meet path; pin stays false |
| Cold compose init unroll | **not open** | Leftover mixed; operator notes stay not open |

Highest-value next: **Package-env for CompilePath unit TERM**.

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

Exit **0**. `source-hygiene OK` (1341 files). `professional-tone OK` (679 markdown files).
