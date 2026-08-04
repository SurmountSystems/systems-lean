# Join: A5 First real host module check

**Status:** IMPLEMENT complete + residual lockstep; verify gates (lake + without-lake recipe + hygiene + systems-host) for full GREEN
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A5 / design S3 Elaborate modules

## Goal met

Beyond package roots list, HostImportGraph edges, and HostFront/HostCheck dialect
goldens: **structurally check** real host module files from disk
(`SystemsLean/Mult.lean` + `MultTheorems.lean`) **without calling Lake on the
measured step**. Fail-closed on bad real-shaped inputs. HostResidualShrink cites
coverage. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + presence of key
decls (namespace, inductive Mult, name/isValid/ofNat?/isValidTag/multIsValid;
MultTheorems theorems ofNat?_zero / ofNat?_fail_closed + import Mult). **Not**
full Lean 4 elaborator typecheck of module bodies. Deepen residual owns fuller
kernel depth later; A6 expands module set coverage.

## Done when checklist

| Item | Evidence |
|------|----------|
| Measured path without Lake on that step | `just host-module-check-without-lake` (prebuilt `.lake/build/bin/slake-host-module-check`; no lake build/exe/env on hot path) |
| Loads/checks Mult real surface | Driver reads `src/systems/SystemsLean/Mult.lean` + `MultTheorems.lean`; `extractImports` + `extractKeyDecls` + namespace; Mult required decls + MultTheorems required theorems |
| Fail-closed on bad real input | Structural `hostModuleCheckBadMissingInductive` / `BadMissingTheorem` -> MISSING-DECL; `BadMissingNamespace` -> MISSING-NAMESPACE; `BadEmpty` -> EMPTY-MODULE; driver re-checks before disk walk |
| HostResidualShrink reseed | `measuredHostLakeFreeModuleCheck = "host-module-check-without-lake"`; `hostModuleCheckMultSeedDualOk = true`; folded into `hostDevelopMeasuredPathsLakeFreeEvidence` / `hostResidualShrinkReady` |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual lockstep | RESIDUAL-systems Done A5 + Open **Host module set expand**; RESIDUAL.md; WATCHER; SESSION-HANDOFF; self-host living tip; design queue A5 done |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostModuleCheck.lean` | **New** real Mult seed structural module check: extractImports + extractKeyDecls + checkRealModule; Mult+MultTheorems dual-pin; fail-closed missing decl/namespace/empty; without-Lake pins; theorems/smoke; disk walk driver |
| `src/systems/SystemsLean/HostModuleCheckMain.lean` | **New** thin lake exe main |
| `src/systems/SystemsLean.lean` | Import HostModuleCheck |
| `src/systems/lakefile.lean` | `lean_exe "slake-host-module-check"`; inventory 51 |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A5 recipe + dual-ok pins in evidence inventory |
| `just/host-without-lake.just` | `host-module-check` + `host-module-check-without-lake` |
| `just/host.just` | `host-residual-shrink` greps A5 tokens + recipe presence |
| `nix/systems-host-presence/required-files.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-leans.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | HostModuleCheck + Main + HostResidualShrink A5 tokens |
| `RESIDUAL-systems.md` | A5 Done; Open Host module set expand |
| `RESIDUAL.md` | Systems Open table A5 done / A6 open |
| `WATCHER.md` | next `/implement` Host module set expand |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual reseed; module count 268 |
| `src/systems/self-host.md` | Living tip A5 done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A5 queue row done cite |
| `.agents/plans/plan-slake-replaces-lake.md` | A5 done; A6+ next |

## Surface summary

- **Seed set (real host Lean, not dialect goldens):**
  - `SystemsLean.Mult` -> `src/systems/SystemsLean/Mult.lean`
  - `SystemsLean.MultTheorems` -> `src/systems/SystemsLean/MultTheorems.lean`
- **Check:** structural imports + key decls; accept good Mult seed; reject
  MISSING-DECL / MISSING-NAMESPACE / EMPTY-MODULE / MISSING-IMPORT / MISSING-FILE
- **Depth honesty:** `checkDepthPartial = "PARTIAL-STRUCTURAL"`
- **Bootstrap:** one-time `lake build slake-host-module-check` still required
  after clean (same honesty as other foundation without-Lake bins)
- **Not claimed:** full elaborator typecheck; full ~256-module set; host free;
  Lake gone

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
(cd src/systems && lake build SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckMain SystemsLean.HostResidualShrink slake-host-module-check)
just host-module-check-without-lake
just host-residual-shrink
just hygiene
just systems-host   # dual-pin presence (flake sees tracked files only until HITL stage)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that package.

## Open next

**Host module set expand** (A6 / design queue expand) -- checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Host module set expand
```

(see `WATCHER.md` for full body)
