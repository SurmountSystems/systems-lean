# Join: A6 Host module set expand (Mult+Linear+Types)

**Status:** IMPLEMENT complete + residual lockstep; verify gates (lake + without-lake recipes + hygiene + systems-host) for full GREEN
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A6 / design S2+S3 expand

## Goal met

Expand the real-module seed set beyond Mult+MultTheorems to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems** on both
import graph and PARTIAL-STRUCTURAL module check **without Lake on the measured
hot path**. HostResidualShrink cites expansion. DualResidual host residual
remains true / free claimed false **unchanged**. free/complete/PROVABLY and
product Lake pins **unchanged**.

**Named seed set (this slice):**

| Module | Role |
|--------|------|
| `SystemsLean.Mult` | Mult leaf (no package import) |
| `SystemsLean.MultTheorems` | Mult theorems (imports Mult) |
| `SystemsLean.Linear` | Linear leaf (no package import) |
| `SystemsLean.LinearTheorems` | Linear theorems (imports Linear) |
| `SystemsLean.Types` | Types (imports Mult) |
| `SystemsLean.TypesTheorems` | Types theorems (imports Mult + MultTheorems + Types) |

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
role (Mult inductive + MultTheorems; Linear shareNat/polyId/class ids;
Types NodeKind/kindMultOk/ofKindTag?/mkNode?; theorem companions). **Not**
full Lean 4 elaborator typecheck. Program/Graph/Compose expand is next Open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Expanded real seed measured without Lake on hot path | `just host-import-graph-without-lake` + `just host-module-check-without-lake` walk 6-module seed; prebuilt ELF; no lake build/exe on hot path |
| HostResidualShrink inventory cites expansion | `measuredHostRealModuleSeedUnits = Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems`; `hostImportGraphExpandSeedDualOk` / `hostModuleCheckExpandSeedDualOk` true; folded into `hostDevelopMeasuredPathsLakeFreeEvidence` / `hostResidualShrinkReady` |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual next Name | Open **Host program module expand**; WATCHER + SESSION-HANDOFF + self-host living tip lockstep |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed expand to Mult+Linear+Types (+Theorems); good expand seed count 6; driver walk 6 modules + edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Linear/Types surface checks + fixtures; tip keeps driver (under 1000 after split) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | **New** long-file split: HOST-MODULE-CHECK-THEOREM + SMOKE |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A6 expand dual-ok + seed units inventory |
| `src/systems/SystemsLean.lean` | Import HostModuleCheckTheorems |
| `just/host-without-lake.just` | host-import-graph / host-module-check (+ without-lake) seed greps for Linear/Types |
| `just/host.just` | host-residual-shrink greps A6 tokens |
| `nix/systems-host-presence/required-files.nix` | dual-pin HostModuleCheckTheorems |
| `nix/systems-host-presence/host-leans.nix` | dual-pin HostModuleCheckTheorems |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | HostImportGraph/HostModuleCheck expand tokens + Theorems companion + HostResidualShrink A6 |
| `RESIDUAL-systems.md` | A6 Done; Open Host program module expand |
| `RESIDUAL.md` | Systems Open table A6 done / program expand open |
| `WATCHER.md` | next `/implement` Host program module expand |
| `doc/SESSION-HANDOFF.md` | Active / Next / module count 269 |
| `src/systems/self-host.md` | Living tip A6 done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A6 queue row partial done cite |
| `.agents/plans/plan-slake-replaces-lake.md` | A6 Mult+Linear+Types done; next program expand |

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

**Host program module expand** (A6 continue / design queue Program band) --
checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Host program module expand
```

(see `WATCHER.md` for full body)
