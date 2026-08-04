# Join: Host program module expand (A6 continue)

**Status:** GREEN (parent verified lake + without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A6 / design S2+S3 Program band

## Goal met

Expand the real-module seed set beyond Mult+Linear+Types to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems**
on both import graph and PARTIAL-STRUCTURAL module check **without Lake on the
measured hot path**. HostResidualShrink cites Program expand. DualResidual host
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
| `SystemsLean.IrProgramTheorems` | Program theorems (imports Mult + Types + IrProgram; same namespace IrProgram) |

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role. Program: programCap/empty/push/isWellTyped/foldWellTyped/checkFailClosed;
IrProgramTheorems: empty_isEmpty / isWellTyped_empty_false. **Not** full Lean 4
elaborator typecheck. Graph/Compose expand is next Open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Program seed list | IrProgram + IrProgramTheorems added; 8-module seed units label |
| Measured without Lake on hot path | `just host-import-graph-without-lake` + `just host-module-check-without-lake` walk 8-module seed; prebuilt ELF; no lake build/exe on hot path |
| HostResidualShrink inventory reseed | `measuredHostRealModuleSeedUnits = Mult+...+IrProgram+IrProgramTheorems`; expand dual-ok true; folded into hostDevelopMeasuredPathsLakeFreeEvidence / hostResidualShrinkReady |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual next Name | Open **Host graph module expand**; WATCHER + SESSION-HANDOFF + self-host living tip lockstep |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed expand +IrProgram+IrProgramTheorems; good expand seed count 8; driver edge checks; expandSliceName Host program module expand |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; IrProgram surface checks; expandSliceName; import Fixtures |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | **New** long-file split: dual-pin good/bad fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | IrProgram good accept theorems/smoke; seed label |
| `src/systems/SystemsLean.lean` | Import HostModuleCheckFixtures |
| `nix/systems-host-presence/required-files.nix` | dual-pin HostModuleCheckFixtures |
| `nix/systems-host-presence/host-leans.nix` | dual-pin HostModuleCheckFixtures |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Program seed units inventory reseed |
| `just/host-without-lake.just` | host-import-graph / host-module-check (+ without-lake) seed greps for IrProgram |
| `just/host.just` | host-residual-shrink greps Program seed tokens |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin Program expand tokens |
| `RESIDUAL-systems.md` | Program expand Done; Open Host graph module expand |
| `RESIDUAL.md` | Systems Open table Program done / graph expand open |
| `WATCHER.md` | next `/implement` Host graph module expand |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip Program done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A6 queue row Program slice cite |
| `.agents/plans/plan-slake-replaces-lake.md` | Program expand done; next graph expand |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates (operator / implementer verify)

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
just host-import-graph-without-lake
just host-module-check-without-lake
just host-residual-shrink
just hygiene
just systems-host   # dual-pin presence (flake sees tracked files only until HITL stage)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that package.

## Open next

**Host graph module expand** (A6 continue / design queue Graph band) --
checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Host graph module expand
```

(see `WATCHER.md` for full body)
