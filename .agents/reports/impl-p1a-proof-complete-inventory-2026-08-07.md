# Implement report: Proof complete inventory (P1a)

Date: 2026-08-07
Slice: Phase P1a only -- inventory, residual Open next, no claim flip.

## Outcome

**GREEN** for inventory + residual lockstep. `proofCompleteClaimed` stays **false**.

## Honest bar for product proof complete

From living `SystemsLean.SpecProof` + residual law + north-star Track 4:

1. Global complete lives only on `SpecProof.proofCompleteClaimed` (proved false today).
2. Partial unit theorems (Mult / Linear / HostCompose / Types / IrProgram / IrGraph /
   Emit plan-apply-body / Kernel / Parity / readiness canaries) do **not** flip it.
3. Track 4c flip requires: named product-critical theorem residuals closed (including
   HostCompose spent mult1 **and** joint mult1+mult0 extract; emit fail-closed families);
   explicit "Proof complete residual" Name; SpecProof rewrite because `specProofReady`
   currently **requires** `!proofCompleteClaimed`; lake elaborator proof; residual
   lockstep; non-claims preserved (product free/complete; host free claimed F1;
   not full elaborator parity; not full llvm backend; proofs do not retire tests;
   Linear Token axioms remain honest).
4. Not sufficient: canary renames, definitional aliases, mass smoke renames, inventory alone.

## Gap table (summary)

| Band | Covered (partial) | Missing for bar |
|------|-------------------|-----------------|
| P0 HostCompose | spent mult1 reject, exact-once, mult0 mark (single-grade) | **joint mult1+mult0 multi-node extract** |
| P0 Linear | shareNat / polyId / axiom inventory | elaborator MULT-1 (out of classic Lean) |
| P0 Mult / Erasure / Extract | grade + mark + RUNTIME-FS fail-closed | intentional thinning / dual EDGE-PROP |
| P1 Track 4b done | IrGraph edgeMax; EmitApply desync; Types mixed kinds | EmitPlan/Body spent mult1 reject (deferred) |
| P1 Emit plan/body | linear_and_erased inventory + SSOT buf | spent mult1 plan/body reject |
| P2 canaries | DualResidual free, host free F1, llvm unlock | not complete synonyms |
| SpecProof | separation honesty; complete false | 4c reshape ready + pin true |

Full table: `doc/dev/research/proof-complete-inventory-2026-08-07.md`.

## Recommended next Open Name

**HostCompose joint mult1 mult0 extract** -- multi-node host with MULT-1 + MULT-0:
success when minted+marked; fail-closed when either side wrong. Net-new vs single-grade
fixtures and vs EmitPlan/EmitBody linear_and_erased alone.

## Pins unchanged (confirmed)

| Pin | Value |
|-----|-------|
| `SpecProof.proofCompleteClaimed` | **false** (`:= false`) |
| Product free / complete / PROVABLY | true (not re-opened) |
| Product Lake StillUsesLake / DependsOnLake | false |
| Host free claimed F1 / FullHost false | unchanged |
| llvmUnlocked | true (not full backend) |

No Lean product edits. No claim-bool forge.

## Artifacts

| Path | Role |
|------|------|
| `doc/dev/research/proof-complete-inventory-2026-08-07.md` | Research note (Kind: analysis only) |
| `RESIDUAL-systems.md` | Inventory Done; Open next Name full schema |
| `RESIDUAL.md` | Join board Open primary reseed |
| `WATCHER.md` | `/implement` next residual |
| `doc/SESSION-HANDOFF.md` | Living tip next Name |
| `src/systems/surface-matrix.md` | SpecProof / proof complete row living tip |

## Commands

| Command | Exit |
|---------|------|
| `just hygiene` | **0** (source-hygiene OK; professional-tone OK) |
| `rg` SpecProof / residual / theorems (read-only inventory) | 0 |

Optional `just systems-host` not run (no presence tokens / product Lean change).

## Done when checklist

1. Research note under `doc/dev/research/` -- **yes**
2. Residual Open names next proof deepen with checkable Done when -- **yes**
3. This Name in Done archive -- **yes** (2026-08-07 reseed + historical 4a row kept)
4. `just hygiene` green -- **yes**
5. DualResidual free tip / PROVABLY / product free / complete / proofCompleteClaimed false -- **yes**
6. This report -- **yes**
