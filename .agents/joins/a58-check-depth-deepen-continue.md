# Join: Check depth deepen continue (A58 / plan Phase T2c)

**Status:** GREEN (lake + without-lake modules=206 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` Phase T / T2c
**Name:** Check depth deepen continue

## Goal met

Extend the **FOUNDATION-KIND-SURFACE** bar from Mult..HostCompose into
**Erasure + ErasureTheorems + Extract + ExtractTheorems** without forging full
elaborator typecheck or DualResidual free. Seed modules stay **206**.
DualResidual free claimed stays **false**. free/complete/PROVABLY and product
Lake pins **unchanged**. proofCompleteClaimed **unchanged**.

### Named band (A58 tip)

`Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems`

### Stronger check bar (documented name)

| Field | Value |
|-------|--------|
| **Bar name** | `FOUNDATION-KIND-SURFACE` |
| **Honesty ceiling** | still `PARTIAL-STRUCTURAL` (not full Lean elaborator) |
| **Greppable** | `checkDepthDeepenBar`, `checkDepthDeepenBand`, `checkDepthDeepenSliceName`, `FOUNDATION-KIND-SURFACE`, `Check depth deepen continue` |

### What deepened (evidence)

| Change | Detail |
|--------|--------|
| Erasure required decls | 6 -> **8** (add structure:Erased, def:erasureIsRuntimeAbsent) |
| Extract required decls | 6 -> **8** (add def:RuntimeClaim.name, def:extractOkFromTags?) |
| ErasureTheorems corpus | 8 -> **14** (isRuntimeAbsent_eq_marked, erasureIsRuntimeAbsent_eq, mark_idempotent, isErasureGrade_omega_false, markForGrade?_omega_none, checkFailClosed_marked_mult0_true) |
| ExtractTheorems corpus | 8 -> **14** (isFreestandingGoal_edge_false, extractOk_edge_reject, extractOk_mult1_fs_true, extractOk_mult0_marked_fs_true, ofRuntimeTag?_one, extractOk_eq_checkFailClosed) |
| Reject fixture | `hostModuleCheckBadMissingErasedStructure` (Erasure without structure Erased) |
| HostResidualShrink | reseed measuredHostTheoremCorpusExpand = Check depth deepen continue; band Mult..Extract; counts ErasureTheorems=14+ExtractTheorems=14 |

**Not claimed:** full Lean 4 elaborator typecheck; DualResidual free; host free;
new product seed modules; *Main seed theater.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named extend band + bar documented | residual + HostModuleCheck `checkDepthDeepen*` + this join |
| without-lake modules=206 green | `just host-module-check-without-lake` GREEN; deepen=Check depth deepen continue bar=FOUNDATION-KIND-SURFACE band=Mult..Extract |
| DualResidual free false | DualResidual.lean not flipped; free claimed false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged false |
| just hygiene green | source-hygiene + professional-tone OK |
| Join | this file |
| Lockstep next Open | **Host library band complete** (plan L-band) |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostModuleCheck.lean` | deepen band Mult..Extract; Erased structure reject; loadOk + driver lengths |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Erasure/Extract required lists + good texts + theorem corpus + bad Erased structure |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | deepen bar theorems + Erased structure fail-closed |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A58 inventory reseed + deepen dual-ok band/counts |
| `just/host-without-lake.just` | Erased structure token |
| `just/host.just` | residual-shrink A58 corpus greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin A58 tokens |
| residual / WATCHER / plan / handoff / goals / self-host living tips | A58 done; Open Host library band complete |
| `.agents/joins/a58-check-depth-deepen-continue.md` | this join |

## DualResidual free unchanged false (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

DualResidual.lean not flipped. **Do not flip free.**

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-module-check)
just host-module-check-without-lake   # GREEN modules=206 deepen=Check depth deepen continue bar=FOUNDATION-KIND-SURFACE band=Mult..Extract
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## Open next

**Host library band complete** -- plan L-band: measured seed covers all
day-to-day develop modules as "in checklist," or every leftover has explicit
out-of-scope honesty. Mult..Extract FOUNDATION-KIND-SURFACE tip closed under
PARTIAL-STRUCTURAL. Seed stays 206. DualResidual free stays false.
Join next: `.agents/joins/a59-host-library-band-complete.md` (or rename if residual picks a different L-band Name).
