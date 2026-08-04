# Join: Host compose module expand (A6 continue)

**Status:** GREEN (lake + without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A6 / design Compose band

## Goal met

Expand the real-module seed set beyond Mult+Linear+Types+Program+Graph to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems**
(modules=12) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Compose expand.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**.

**Named seed set (this slice):**

| Module | Role |
|--------|------|
| `SystemsLean.Mult` | Mult leaf (no package import) |
| `SystemsLean.MultTheorems` | Mult theorems (imports Mult) |
| `SystemsLean.Linear` | Linear leaf (no package import) |
| `SystemsLean.LinearTheorems` | Linear theorems (imports Linear) |
| `SystemsLean.Types` | Types (imports Mult) |
| `SystemsLean.TypesTheorems` | Types theorems (imports Mult + MultTheorems + Types) |
| `SystemsLean.IrProgram` | Program unit (imports Types) |
| `SystemsLean.IrProgramTheorems` | Program theorems (imports Mult + Types + IrProgram) |
| `SystemsLean.IrGraph` | Graph unit (imports Mult + Types + IrProgram) |
| `SystemsLean.IrGraphTheorems` | Graph theorems (imports Mult + Types + IrProgram + IrGraph) |
| `SystemsLean.HostCompose` | Compose unit (seed-local Mult + Types + IrGraph; real file also imports Erasure + Extract outside this seed) |
| `SystemsLean.HostComposeTheorems` | Compose theorems (seed-local Mult + Types + IrGraph + IrGraphTheorems + HostCompose; real file also imports Erasure / ErasureTheorems / Extract outside this seed) |

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role. Compose: empty/mint/consume/pushHostNode/addHostEdge/checkFailClosed;
HostComposeTheorems: multPreScan_empty_true / checkFailClosed_empty_true.
Import graph uses **seed-local edges** via `filterSeedImports` so HostCompose
out-of-seed Erasure/Extract edges do not force MISSING-IMPORT on this seed.
**Not** full Lean 4 elaborator typecheck. Host theorem check expand (A7) is next Open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Compose seed list | HostCompose + HostComposeTheorems added; 12-module seed units label |
| Measured without Lake on hot path | `just host-import-graph-without-lake` + `just host-module-check-without-lake` walk 12-module seed; prebuilt ELF; no lake build/exe on hot path |
| HostResidualShrink inventory reseed | `measuredHostRealModuleSeedUnits = Mult+...+HostCompose+HostComposeTheorems`; expand dual-ok true; folded into hostDevelopMeasuredPathsLakeFreeEvidence / hostResidualShrinkReady |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual next Name | Open **Host theorem check expand** (A7); WATCHER + SESSION-HANDOFF + self-host living tip lockstep |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed expand +HostCompose+HostComposeTheorems; `filterSeedImports`; good expand seed count 12; driver edge checks; expandSliceName Host compose module expand |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; HostCompose surface checks; expandSliceName; good fixtures wired; required-decl lists moved to Fixtures (sub-1-KLOC) |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | HostCompose + HostComposeTheorems fixture texts; all seed required-decl lists (long-file seam) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | HostCompose good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Compose seed units inventory reseed |
| `just/host-without-lake.just` | host-import-graph / host-module-check (+ without-lake) seed greps for HostCompose |
| `just/host.just` | host-residual-shrink greps Compose seed tokens |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin Compose expand tokens |
| `RESIDUAL-systems.md` | Compose expand Done; Open Host theorem check expand |
| `RESIDUAL.md` | Systems Open table Compose done / theorem check expand open |
| `WATCHER.md` | next `/implement` Host theorem check expand |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip Compose done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A6 Mult..Compose foundation cite |
| `.agents/plans/plan-slake-replaces-lake.md` | Compose expand done; next A7 |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates evidence

```bash
cd /home/hunter/Projects/ai/iso
# Bootstrap once (not measured hot path):
(cd src/systems && lake build \
  SystemsLean.HostImportGraph \
  SystemsLean.HostModuleCheckFixtures \
  SystemsLean.HostModuleCheck \
  SystemsLean.HostModuleCheckTheorems \
  SystemsLean.HostResidualShrink \
  slake-host-import-graph \
  slake-host-module-check)
# exit 0 -- Build completed successfully (15 jobs).

just host-import-graph-without-lake
# GREEN: seed Mult+...+HostCompose+HostComposeTheorems modules=12; expand=Host compose module expand

just host-module-check-without-lake
# GREEN: seed Mult+...+HostCompose+HostComposeTheorems modules=12; depth=PARTIAL-STRUCTURAL

just host-residual-shrink
# GREEN

just hygiene
# source-hygiene OK; professional-tone OK

just systems-host
# systems-host-presence OK (218 required paths)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that package
(lake build HostResidualShrink exit 0 above).

## Open next

**Host theorem check expand** (A7 / design queue theorem band) --
checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Host theorem check expand
```

(see `WATCHER.md` for full body)
