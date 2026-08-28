# Join: Check depth deepen continue (A57 / plan Phase T2b)

**Status:** GREEN (lake + without-lake modules=206 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` Phase T / T2b
**Name:** Check depth deepen continue

## Goal met

Extend the **FOUNDATION-KIND-SURFACE** bar from Mult..Types into
**IrProgram + IrProgramTheorems + IrGraph + IrGraphTheorems + HostCompose +
HostComposeTheorems** without forging full elaborator typecheck or DualResidual
free. Seed modules stay **206**. DualResidual free claimed stays **false**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

### Named band (A57 tip)

`Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems`

### Stronger check bar (documented name)

| Field | Value |
|-------|--------|
| **Bar name** | `FOUNDATION-KIND-SURFACE` |
| **Honesty ceiling** | still `PARTIAL-STRUCTURAL` (not full Lean elaborator) |
| **Greppable** | `checkDepthDeepenBar`, `checkDepthDeepenBand`, `checkDepthDeepenSliceName`, `FOUNDATION-KIND-SURFACE`, `Check depth deepen continue` |

### What deepened (evidence)

| Change | Detail |
|--------|--------|
| IrProgram required decls | 6 -> **10** (add structure:Program, inductive:PushResult, def:length, def:isEmpty) |
| IrGraph required decls | 6 -> **12** (add structure:Edge/Graph, def:edgeCount/nodeCount/edgesSound/isEmpty) |
| HostCompose required decls | 6 -> **12** (add structure:LinearHost/Host, def:markErased/multPreScan/extractOk/extractOkFs) |
| IrProgramTheorems corpus | 6 -> **12** (foldWellTyped_empty_none, push_bad_node, push_value_one_ok, length_single_value, isWellTyped_single_value, foldWellTyped_single_value_some) |
| IrGraphTheorems corpus | 6 -> **12** (pushNode_value_one_ok, addEdge_empty_badEndpoints, isWellTyped_one_node_empty_edges, addEdge_one_node_self_ok, edgesSound_one_edge, isWellTyped_two_nodes_one_edge) |
| HostComposeTheorems corpus | 8 -> **14** (consume_minted_one, mint_already_live_one, double_consume_notLive, nodeMultOk_omega, multPreScan_mult1_unminted_false, extractOkFs_mult1_minted_true) |
| Reject fixture | `hostModuleCheckBadMissingProgramStructure` (IrProgram without structure Program) |
| HostResidualShrink | reseed measuredHostTheoremCorpusExpand = Check depth deepen continue; band Mult..HostCompose; counts IrProgramTheorems=12+IrGraphTheorems=12+HostComposeTheorems=14 |

**Not claimed:** full Lean 4 elaborator typecheck; DualResidual free; host free;
new product seed modules; *Main seed theater.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named extend band + bar documented | residual + HostModuleCheck `checkDepthDeepen*` + this join |
| without-lake modules=206 green | `just host-module-check-without-lake` GREEN; deepen=Check depth deepen continue bar=FOUNDATION-KIND-SURFACE band=Mult..HostCompose |
| DualResidual free false | DualResidual.lean not flipped; free claimed false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged false |
| just hygiene green | source-hygiene + professional-tone OK |
| Join | this file |
| Lockstep next Open | **Check depth deepen continue** (Erasure..Extract foundation units) |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostModuleCheck.lean` | deepen band Mult..HostCompose; slice Name continue; lengths; Program structure reject; loadOk + driver |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | IrProgram/IrGraph/HostCompose required lists + good texts + theorem corpus + bad Program structure |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | deepen bar theorems + Program structure fail-closed; maxRecDepth for native_decide |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A57 inventory reseed + deepen dual-ok band/counts |
| `just/host-without-lake.just` | deepen continue + Program structure tokens |
| `just/host.just` | residual-shrink A57 corpus greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin A57 tokens |
| residual / WATCHER / plan / handoff / goals / self-host living tips | A57 done; Open Erasure..Extract deepen continue |
| `.agents/joins/a57-check-depth-deepen-continue.md` | this join |

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
just host-module-check-without-lake   # GREEN modules=206 deepen=Check depth deepen continue bar=FOUNDATION-KIND-SURFACE
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## Open next

**Check depth deepen continue** -- extend FOUNDATION-KIND-SURFACE into
Erasure + ErasureTheorems + Extract + ExtractTheorems (next Mult..Compose
foundation units after HostCompose; structure/inductive kinds + expanded theorem
surface where honest). Seed stays 206. DualResidual free stays false.
Join next: `.agents/joins/a58-check-depth-deepen-continue.md`.
