# Join: Host library seed expand continue (A36 / plan L25)

**Status:** GREEN (lake + without-lake modules=113 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a36seed107

## Goal met

Grow the real-module seed set beyond Mult..CapableFullBar modules=107 to
Mult..CapableFullBar+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+
DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+
DualEqWriteParityTheorems (modules=**113**) on both import graph and
PARTIAL-STRUCTURAL module check **without Lake on the measured hot path**.
HostResidualShrink cites DualEqWrite pure leaves. DualResidual host residual
remains true / free claimed false **unchanged**. free/complete/PROVABLY and
product Lake pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..CapableFullBarTheorems (prior 107) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence + CapableRead/Compose/FullBar |
| `SystemsLean.DualEqWriteCapableGap` | SelfApplyFs DualEqWrite pure leaf; no package-local imports |
| `SystemsLean.DualEqWriteCapableGapTheorems` | imports DualEqWriteCapableGap only |
| `SystemsLean.DualEqWriteClosePath` | SelfApplyFs DualEqWrite pure leaf; no package-local imports |
| `SystemsLean.DualEqWriteClosePathTheorems` | imports DualEqWriteClosePath only |
| `SystemsLean.DualEqWriteParity` | SelfApplyFs DualEqWrite pure leaf; no package-local imports |
| `SystemsLean.DualEqWriteParityTheorems` | imports DualEqWriteParity only |

**How the band was picked:** inventory after A35 (CapableRead/Compose/FullBar pure
leaves seeded). Preferred +6 pure-leaf band DualEqWriteCapableGap +
DualEqWriteClosePath + DualEqWriteParity (+ theorems). All three parents are
pure leaves (package imports=0); theorems import parents only. Skip DualEqWriteApi
(imports DualEqWriteLoad + emit stack). Coherent SelfApplyFs DualEqWrite pure
leaves; not full ~270. SelfApplyFs still may block on other deps.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for DualEqWrite surfaces. **Not** full Lean 4 elaborator typecheck.
Remaining library ~270 - 113 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named DualEqWriteCapableGap..DualEqWriteParityTheorems seed | +6 modules; seed units label ends +DualEqWriteParityTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=113 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=113; L26+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +DualEqWriteCapableGap..DualEqWriteParityTheorems; RealMod leaf/parent edges; acceptCount 113; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=113; length dual-pins; `runModuleCheck` unless ladder includes new goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L25 + Open L26+ Host library seed expand continue; trailer L26+/modules=113/A1-A36 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=113 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 113); join a37 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=113 + next Name |
| `doc/goals.md` | Living tip modules=113 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A36 modules=113; Phase L L25 done / L26+ open; section 5 floors |
| `.agents/joins/a36-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=113 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=113 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=107;
  acceptCount == 107; seed label ended CapableFullBarTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 113 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=113; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L26+) -- next real library band beyond
modules=113 (inventory remaining vs ~270; claim tip pure leaves;
remaining ProductPath/Capable surface if any; pick next coherent seedable band).
Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
