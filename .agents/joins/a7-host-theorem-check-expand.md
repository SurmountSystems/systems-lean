# Join: Host theorem check expand (A7)

**Status:** GREEN (lake + without-lake + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A7 / design theorem band

## Goal met

Deepen PARTIAL-STRUCTURAL required theorem-module corpus for Mult..Compose seed
`*Theorems` on the without-Lake module check path. Living expand slice Name is
**Host theorem check expand**. Seed modules remain **12** (Mult..Compose
foundation). DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
`proofCompleteClaimed` **unchanged** (false).

**Not** full Lean elaborator typecheck. **Not** proof complete. Honesty depth
stays **PARTIAL-STRUCTURAL** (package-local imports + key decls, now with a
larger required theorem name set drawn from real on-disk sources).

## Theorem corpus grew (before -> after)

| *Theorems module | Before required | After required | Names (after; from real `.lean`) |
|------------------|-----------------|----------------|----------------------------------|
| MultTheorems | 2 | **8** | ofNat?_zero/one/two/fail_closed; isValidTag_zero/one/two/fail_closed |
| LinearTheorems | 2 | **8** | shareNat_eq/zero/succ; polyId_id; mult0/1/OmegaClassId_eq; linearAxiomInventoryOk_true |
| TypesTheorems | 2 | **8** | ofKindTag?_zero/one/two/fail_closed; isValidKindTag_zero/one/two/fail_closed |
| IrProgramTheorems | 2 | **6** | empty_isEmpty; empty_length_zero; programCap_eq_eight; isWellTyped_empty_false; empty_not_well_typed; checkFailClosed_eq_isWellTyped |
| IrGraphTheorems | 2 | **6** | isWellTyped_empty_true; empty_well_typed; empty_isEmpty; edgeMax_eq_sixteen; checkFailClosed_eq_isWellTyped; edgesSound_empty |
| HostComposeTheorems | 2 | **8** | multPreScan_empty_true; checkFailClosed_empty_true; extractOkFs_empty_true; mint_zero_badId; consume_empty_notLive; extractOkFs_eq; checkFailClosed_eq; mint_empty_one_ok |

**Inventory label:**
`MultTheorems=8+LinearTheorems=8+TypesTheorems=8+IrProgramTheorems=6+IrGraphTheorems=6+HostComposeTheorems=8`

Good dual-pin fixtures expanded with the same theorem names (structural stubs).
Bad missing-theorem fixture still fails closed (MultTheorems missing
`ofNat?_fail_closed` under the expanded list).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named theorem-module corpus Mult..Compose green without Lake hot path | `just host-module-check-without-lake` GREEN; expand=Host theorem check expand; depth=PARTIAL-STRUCTURAL; modules=12 |
| HostResidualShrink inventory reseed | `measuredHostTheoremCorpusExpand` / `hostModuleCheckTheoremCorpusExpandDualOk` / `measuredHostTheoremCorpusRequiredCounts` folded into measured-paths evidence |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Foundation tools without Lake bootstrap** (A8) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Expanded *Theorems required-decl lists + good fixture texts; bad missing theorem; `hostModuleCheckTheoremCorpusOk` dual-pin |
| `src/systems/SystemsLean/HostModuleCheck.lean` | expandSliceName Host theorem check expand; length + corpusOk in loadOk; next residual cite A8 |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | expandSliceName example + greppable A7 name |
| `src/systems/SystemsLean/HostImportGraph.lean` | expandSliceName living tip A7 |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A7 inventory pins + evidence fold + theorems |
| `just/host-without-lake.just` | expand Name greps Host theorem check expand |
| `just/host.just` | host-residual-shrink greps A7 dual-ok + counts |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin A7 tokens |
| `RESIDUAL-systems.md` | A7 Done; Open A8 |
| `RESIDUAL.md` | Systems Open table A7 done / A8 open |
| `WATCHER.md` | next `/implement` Foundation tools without Lake bootstrap |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip A7 done + next A8 |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A7 done cite |
| `.agents/plans/plan-slake-replaces-lake.md` | A7 done; next A8 |

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
# GREEN: seed Mult+...+HostCompose+HostComposeTheorems modules=12;
# expand=Host theorem check expand

just host-module-check-without-lake
# GREEN: seed Mult+...+HostCompose+HostComposeTheorems modules=12;
# expand=Host theorem check expand; depth=PARTIAL-STRUCTURAL
# MultTheorems..HostComposeTheorems on-disk decls include expanded required names

just host-residual-shrink
# GREEN (A7 theorem corpus expand dual-ok in reseed banner)

just hygiene
# source-hygiene OK; professional-tone OK

just systems-host
# systems-host-presence OK (218 required paths)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that
package (lake build HostResidualShrink exit 0 above).

## Open next

**Foundation tools without Lake bootstrap** (A8 / design queue bootstrap band) --
checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 Foundation tools without Lake bootstrap
```

(see `WATCHER.md` for full body)
