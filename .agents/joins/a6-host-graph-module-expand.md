# Join: Host graph module expand (A6 continue)

**Status:** GREEN (lake + without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A6 / design S2+S3 Graph band

## Goal met

Expand the real-module seed set beyond Mult+Linear+Types+Program to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems**
on both import graph and PARTIAL-STRUCTURAL module check **without Lake on the
measured hot path**. HostResidualShrink cites Graph expand. DualResidual host
residual remains true / free claimed false **unchanged**. free/complete/PROVABLY
and product Lake pins **unchanged**.

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
| `SystemsLean.IrGraphTheorems` | Graph theorems (imports Mult + Types + IrProgram + IrGraph; same namespace IrGraph) |

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role. Graph: edgeMax/empty/pushNode/addEdge/isWellTyped/checkFailClosed;
IrGraphTheorems: isWellTyped_empty_true / empty_isEmpty. **Not** full Lean 4
elaborator typecheck. Compose expand is next Open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Graph seed list | IrGraph + IrGraphTheorems added; 10-module seed units label |
| Measured without Lake on hot path | `just host-import-graph-without-lake` + `just host-module-check-without-lake` walk 10-module seed; prebuilt ELF; no lake build/exe on hot path |
| HostResidualShrink inventory reseed | `measuredHostRealModuleSeedUnits = Mult+...+IrGraph+IrGraphTheorems`; expand dual-ok true; folded into hostDevelopMeasuredPathsLakeFreeEvidence / hostResidualShrinkReady |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual next Name | Open **Host compose module expand**; WATCHER + SESSION-HANDOFF + self-host living tip lockstep |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed expand +IrGraph+IrGraphTheorems; good expand seed count 10; driver edge checks; expandSliceName Host graph module expand |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; IrGraph surface checks; expandSliceName; good fixtures wired |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | IrGraph + IrGraphTheorems fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | IrGraph good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Graph seed units inventory reseed |
| `just/host-without-lake.just` | host-import-graph / host-module-check (+ without-lake) seed greps for IrGraph |
| `just/host.just` | host-residual-shrink greps Graph seed tokens |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin Graph expand tokens |
| `RESIDUAL-systems.md` | Graph expand Done; Open Host compose module expand |
| `RESIDUAL.md` | Systems Open table Graph done / compose expand open |
| `WATCHER.md` | next `/implement` Host compose module expand |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip Graph done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A6 queue row Graph slice cite |
| `.agents/plans/plan-slake-replaces-lake.md` | Graph expand done; next compose expand |

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
# GREEN: seed Mult+...+IrGraph+IrGraphTheorems modules=10; expand=Host graph module expand

just host-module-check-without-lake
# GREEN: seed Mult+...+IrGraph+IrGraphTheorems modules=10; depth=PARTIAL-STRUCTURAL

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

**Host compose module expand** (A6 continue / design queue Compose band) --
checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Host compose module expand
```

(see `WATCHER.md` for full body)
