# Join: Check depth deepen (A56 / plan Phase T2)

**Status:** GREEN (lake + without-lake modules=206 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` Phase T / T2
**Name:** Check depth deepen

## Goal met

Move a **named band** of already-seeded HostModuleCheck modules from
PARTIAL-STRUCTURAL key-decl surface toward a **stronger documented check bar**
without forging full elaborator typecheck or DualResidual free. Seed modules
stay **206**. DualResidual free claimed stays **false**. free/complete/PROVABLY
and product Lake pins **unchanged**. proofCompleteClaimed **unchanged**.

### Named band

`Mult + MultTheorems + Linear + LinearTheorems + Types + TypesTheorems`

### Stronger check bar (documented name)

| Field | Value |
|-------|--------|
| **Bar name** | `FOUNDATION-KIND-SURFACE` |
| **Honesty ceiling** | still `PARTIAL-STRUCTURAL` (not full Lean elaborator) |
| **Greppable** | `checkDepthDeepenBar`, `checkDepthDeepenBand`, `checkDepthDeepenSliceName`, `FOUNDATION-KIND-SURFACE`, `Check depth deepen` |

### What deepened (evidence)

| Change | Detail |
|--------|--------|
| extractKeyDecls | Now extracts `structure:` and `axiom:` in addition to inductive/def/theorem |
| Linear required decls | 7 -> **12** (add axiom Token/mkToken/consume + linearAxiomsRemainId + affineNotFirstClassId) |
| Types required decls | 6 -> **12** (add structure TypeTag/IrNode + NodeKind.name/expectedMult + IrNode.isWellTyped + mkNodeFromTags?) |
| MultTheorems corpus | 8 -> **14** (isValid_true, multIsValid_eq_isValid, name_mult0/1/Omega, isValidTag_eq_ofNat?_isSome) |
| LinearTheorems corpus | 8 -> **12** (shareNat_reuse, linearExactOnceId_eq, linearAxiomsRemainId_eq, affineNotFirstClassId_eq) |
| TypesTheorems corpus | 8 -> **14** (kindMultOk_value_omega/linear_one/erased_zero; expectedMult_value/linear/erased) |
| Reject fixtures | `hostModuleCheckBadMissingAxiom` (Linear without Token family); `hostModuleCheckBadMissingStructure` (Types without TypeTag/IrNode) |
| HostResidualShrink | reseed measuredHostTheoremCorpusExpand = Check depth deepen; counts MultTheorems=14+LinearTheorems=12+TypesTheorems=14; hostModuleCheckDepthDeepenDualOk |

**Not claimed:** full Lean 4 elaborator typecheck; DualResidual free; host free;
new product seed modules; *Main seed theater.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named band + bar documented | residual + HostModuleCheck `checkDepthDeepen*` + this join |
| without-lake modules=206 green | `just host-module-check-without-lake` GREEN; deepen=Check depth deepen bar=FOUNDATION-KIND-SURFACE |
| DualResidual free false | DualResidual.lean not flipped; free claimed false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged false |
| just hygiene green | source-hygiene + professional-tone OK |
| Join | this file |
| Lockstep next Open | **Check depth deepen continue** (IrProgram..HostCompose) |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostModuleCheck.lean` | structure/axiom extract; deepen bar pins; bad axiom/structure; loadOk lengths; driver deepen banner |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Mult..Types required lists + good/bad fixtures + theoremCorpusOk dual-pin |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | deepen bar theorems + bad axiom/structure fail-closed |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A56 inventory reseed + deepen dual-ok |
| `just/host-without-lake.just` | deepen token greps |
| `just/host.just` | residual-shrink A56 greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin A56 tokens |
| residual / WATCHER / plan / handoff / goals / self-host living tips | A56 done; Open Check depth deepen continue |
| `.agents/joins/a56-check-depth-deepen.md` | this join |

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
just host-module-check-without-lake   # GREEN modules=206 deepen=Check depth deepen bar=FOUNDATION-KIND-SURFACE
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## Open next

**Check depth deepen continue** -- extend FOUNDATION-KIND-SURFACE into
IrProgram..HostCompose (structure:Program / Graph / edges; expanded theorem
surface where honest). Seed stays 206. DualResidual free stays false.
Join next: `.agents/joins/a57-check-depth-deepen-continue.md`.
