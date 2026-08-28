# Implement report: Full LLVM production backend R1 first slice

**Date:** 2026-08-10
**Residual Name:** Full LLVM production backend
**Status:** GREEN (R1 first slice: residual open + bar SSoT + Mult+Linear dual-pin verified; fullBackend stays false)
**Plan:** `.agents/plans/plan-full-readiness-2026-08-09.md` Remaining R1

## Goal

Open residual **Full LLVM production backend** and land the first honest progressive
slice: claim bar + inventory of full backend vs what already exists; keep fullBackend
/ production opt / full dominance pins **false**.

## Done when (this slice)

| Item | Result |
|------|--------|
| Sync durable plan from session plan | **met** -- session body copied to `.agents/plans/plan-full-readiness-2026-08-09.md` (do-all remaining; A/B/C park retired) |
| Open residual Name Full LLVM production backend | **met** -- `RESIDUAL-systems.md` Open in progress; empty done-for-now cleared |
| WATCHER `/implement` next | **met** -- Types SSA CFG production dual-pin next |
| RESIDUAL.md join tip lockstep | **met** |
| SESSION-HANDOFF Active/Next | **met** |
| Research bar note | **met** -- `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` reseeded (R1a..R1e) |
| Optional product deepen | **verified only** -- Linear multi-unit dual-pin already on disk (R1a); gates re-run GREEN; no new fullBackend flip |
| Gates | **GREEN** below |

## Inventory (what exists vs fullBackend)

| Surface | Status | Not equal to |
|---------|--------|--------------|
| Mult..Graph SSA partial | done | fullBackend |
| Mult CFG fixture deepen | done partial | production DF |
| Production CFG deepen Mult | done (`productionCfgDeepen`) | Linear/Types/DF |
| Linear CFG production dual-pin | done (`linearCfgProductionDeepen`) | Types/DF/general |
| Multi-unit Mult+Linear join | done (`multiUnitCfgProductionDeepen`) | fullBackend |
| Mult foreign link Mult-only | done | other-band foreign link |
| `llvmUnlocked` | true | fullBackend |
| fullBackend / production opt / full dominance | **false** | -- |

Bar SSoT: `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`.

## Honesty pins (must stay false until bar)

| Pin | Value |
|-----|-------|
| `llvmCfgFixtureFullBackendClaimed` | **false** |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| Mult/Linear/Types/Program/Graph `*FullBackendClaimed` | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| FullHostElaborateRemains | **false** (unchanged) |

## Commands and exit codes

```text
just hygiene
# EXIT:0
# source-hygiene OK; professional-tone OK

just systems-llvm-ir
# EXIT:0
# systems-llvm-ir-presence OK (84 required paths; ... Linear CFG production dual-pin ... fullBackend false)

just production-cfg-deepen
# EXIT:0
# lake Build completed successfully (32 jobs)
# production-cfg-deepen: GREEN

just linear-cfg-production-deepen
# EXIT:0
# lake Build completed successfully (32 jobs)
# linear-cfg-production-deepen: GREEN (multi-unit Mult+Linear; not full backend)
```

Pin spot-check (defs are `false` on disk):
`llvmCfgFixtureFullBackendClaimed`, `llvmCfgFixtureProductionOptClaimed`,
`llvmCfgFixtureDominanceClaimed`, Mult/Linear/Types/Program/Graph FullBackendClaimed.

## Paths touched

| Path | Role |
|------|------|
| `.agents/plans/plan-full-readiness-2026-08-09.md` | Durable plan sync + living tip Open status |
| `RESIDUAL-systems.md` | Open Name + Done archive R1/R1a + living tip |
| `RESIDUAL.md` | Systems Open join lockstep |
| `WATCHER.md` | `/implement` Types dual-pin next |
| `doc/SESSION-HANDOFF.md` | Living tip Active Open |
| `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | Bar SSoT reseed |
| `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` | Inventory reseed |
| This report | Evidence |

No product Lean claim flip this slice. Linear dual-pin product Lean/Nix/just
was already present; R1 documents and verifies it under the open residual.

## Next

Types SSA CFG production dual-pin (R1b): same dual-pin shape vs
`out/llvm-ir/slake_types_ssa.ll`; host Lean `LlvmCfgFixture` + pure Nix + just
recipe; lake; fullBackend stays false.

## Non-claims

- fullBackend true
- production opt / full dominance pipeline
- other-band foreign link
- mathlib / FullHost
- free/complete/PROVABLY re-open
