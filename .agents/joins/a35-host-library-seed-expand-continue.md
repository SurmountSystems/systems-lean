# Join: Host library seed expand continue (A35 / plan L24)

**Status:** GREEN (lake + without-lake modules=107 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a35seed101

## Goal met

Grow the real-module seed set beyond Mult..PerformEvidence modules=101 to
Mult..PerformEvidence+CapableRead+CapableReadTheorems+CapableCompose+
CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems (modules=**107**)
on both import graph and PARTIAL-STRUCTURAL module check **without Lake on the
measured hot path**. HostResidualShrink cites CapableRead/CapableCompose/
CapableFullBar pure leaves. DualResidual host residual remains true / free
claimed false **unchanged**. free/complete/PROVABLY and product Lake pins
**unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..PerformEvidenceTheorems (prior 101) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence |
| `SystemsLean.CapableRead` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.CapableReadTheorems` | imports CapableRead only |
| `SystemsLean.CapableCompose` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.CapableComposeTheorems` | imports CapableCompose only |
| `SystemsLean.CapableFullBar` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.CapableFullBarTheorems` | imports CapableFullBar only |

**How the band was picked:** inventory after A34 (CapableStepContract/InstallOut/
OfficialPath/PerformEvidence pure leaves seeded). Preferred +6 pure-leaf band
CapableRead + CapableCompose + CapableFullBar (+ theorems). All three parents
are pure leaves (package imports=0); theorems import parents only. Coherent
SelfApplyFs remaining freestanding-capable foundation; skip CapableWriteHc
(heavy multi-import) and FreestandingEmit-heavy ProductPathWriteHc. Not full
~270. SelfApplyFs still may block on other deps.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for CapableRead/CapableCompose/CapableFullBar surfaces. **Not** full Lean 4
elaborator typecheck. Remaining library ~270 - 107 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CapableRead..CapableFullBarTheorems seed | +6 modules; seed units label ends +CapableRead+...+CapableFullBarTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=107 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=107; L25+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +CapableRead..CapableFullBarTheorems; RealMod leaf/parent edges; acceptCount 107; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=107; length dual-pins; `runModuleCheck` unless ladder includes new goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L24 + Open L25+ Host library seed expand continue; trailer L25+/modules=107/A1-A35 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=107 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 107); join a36 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=107 + next Name |
| `doc/goals.md` | Living tip modules=107 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A35 modules=107; Phase L L24 done / L25+ open; section 5 floors |
| `.agents/joins/a35-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=107 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=107 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=101;
  acceptCount == 101; seed label ended PerformEvidenceTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 107 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=107; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L25+) -- next real library band beyond
modules=107 (inventory remaining vs ~270; DualEqWrite/claim tip pure leaves;
remaining ProductPath/Capable surface if any; pick next coherent seedable band).
Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
