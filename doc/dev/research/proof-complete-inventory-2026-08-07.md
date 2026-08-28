# Proof complete inventory (2026-08-07)

Kind: analysis only. Living tip updated after Track 4c claim flip (same day).

ASCII only. Reseed after free bar choice (a) host residual free claimed (F1)
and after Track 4b continuous named proofs closed. Supersedes the living tip
of `doc/dev/research/proof-complete-inventory-2026-08-03.md` for residual
queue order; the 2026-08-03 note remains historical archive.

**Track 4c met (2026-08-07):** `SystemsLean.SpecProof.proofCompleteClaimed`
**true** with bar-met pin + lake elaborator proof. Report
`.agents/reports/impl-proof-complete-residual-2026-08-07.md`.

## Scope and method

| Source | Role |
|--------|------|
| `SystemsLean/SpecProof.lean` | Living SSoT: `proofCompleteClaimed := true`; `proofCompleteBarMet`; `specProofReady` folds complete **true** |
| `SystemsLean/SpecProofTheorems.lean` | `proofCompleteClaimed_true` (proved true) + bar-met theorems |
| `*Theorems.lean` + Emit* theorem surfaces | Local theorem families; bar evidence for Track 4c; global pin only on SpecProof |
| Prior inventory | `doc/dev/research/proof-complete-inventory-2026-08-03.md` (Track 4a) |
| Residual Done | Track 4b HostCompose spent mult1 / IrGraph edge capacity / EmitApply desync / Types multi-node mixed kinds **done**; HostCompose joint mult1 mult0 extract **done**; EmitPlan spent mult1 reject **done**; EmitBody spent mult1 reject **done**; **Proof complete residual (Track 4c) done** |
| Living free tip | DualResidual product free true; host elaborator residual free **claimed** (F1); FullHostElaborateRemains false |
| `rg` on `src/systems/SystemsLean` | `proofCompleteClaimed`, `sorry`/`admit`, `axiom` |

Foundation claims (context floor):

- freestanding product self-host **complete** true; product residual **free** true
- product StillUsesLake / DependsOnLake **false**
- host elaborator residual free **claimed** (F1 dual-ok; remains false; free claimed true; FullHost false)
- PROVABLY true; `llvmUnlocked` true (not full backend)
- SpecProof **local** `residualFreeClaimed` stays false (DualResidual owns product free)
- `proofCompleteClaimed` **true** (Track 4c bar met)

## Global living tip

| Flag | Value | Home |
|------|-------|------|
| `proofCompleteClaimed` | **true** (Track 4c bar met; not surface-alone forge) | `SpecProof.lean` def + `proofCompleteClaimed_true` |
| `proofCompleteBarMet` | true | SpecProof bar-met token + complete |
| `specSurfaceStated` | true | SpecProof |
| `proofDoesNotRetireTests` | true | SpecProof |
| `specDoesNotImplyProofComplete` | true | SpecProof (surface + complete + bar-met) |
| `specProofReady` | true with complete true + product complete true | SpecProof |
| DualResidual product free | true | DualResidual (not SpecProof local free pin) |
| Host elaborator residual free | claimed (F1) | DualResidual + HostResidualShrink |

**There is no second living global complete pin.** Module-local "ready" /
"kernel ok" / "parity ready" bools are **not** proof complete. Partial theorem
families explicitly refuse to set `proofCompleteClaimed` true (SpecProof header
+ each unit header).

## sorry / axiom honesty (2026-08-07 recheck)

| Marker | Status |
|--------|--------|
| `sorry` / `admit` under product `SystemsLean/**/*.lean` (excluding string fixtures) | **none** in real proof surface |
| Fixture **strings** that embed `by sorry` | HostModuleCheckFixtures only (bad-fixture content for the checker; not elaborated product proofs) |
| `axiom` product surface | **Linear only:** `Token`, `mkToken`, `consume` (`LINEAR-AXIOMS-REMAIN`) |
| Mass sorry-fill residual | **Banned** (nothing to fill; theater would be definitional canaries) |

## What closed since 2026-08-03 inventory

| Pri | Residual Name | Surface closed | Status |
|-----|---------------|----------------|--------|
| P0 | HostCompose spent mult1 reject | consume after mint with MULT-1 graph: multPreScan / extractOkFs / checkFailClosed reject + spent scrub | **done** |
| P0 | HostCompose joint mult1 mult0 extract | multi-node minted+marked success + either-side fail-closed on multPreScan / extractOkFs / checkFailClosed | **done** (2026-08-07; report `.agents/reports/impl-hostcompose-joint-extract-2026-08-07.md`) |
| P1 | IrGraph edge capacity full reject | edgesSound / isWellTyped at edgeMax; full addEdge; oversize fail-closed | **done** |
| P1 | EmitApply desync fail-closed deepen | applyIsValid oversize count; applyFromCompose sound inventory | **done** |
| P1 | Types multi-node mixed kind program | IrProgram mixed VALUE+LINEAR+ERASED well-typed / fold / bad reject | **done** |
| -- | Host residual free claim (F1) | DualResidual host free dual-ok; not a proof residual | **done** (orthogonal) |

## Gap table (theorem-covered vs still missing)

Priority: P0 freestanding memory-safety / Mult-Linear-Compose path; P1 IR / Types /
emit plan-apply-body; P2 host readiness canaries / inventory folds.

| Pri | Module / surface | Local complete | Already theorem-covered (partial) | Still missing / deepen property | Flip global complete? |
|-----|------------------|----------------|-----------------------------------|---------------------------------|------------------------|
| P0 | **SpecProof** | Global complete **true** (Track 4c) | Spec-proof separation; ready folds complete true + bar-met | Track 4c residual **done** (2026-08-07) | **Done** |
| P0 | **Linear** | Partial; axioms remain | shareNat / polyId / roundTrip / axiom inventory pins | Elaborator MULT-1 on Token is out of classic Lean; do not fake model | No (axioms are honest limits) |
| P0 | **HostCompose** | Partial; live-flag | empty / mint / consume / exact-once sequential / mult1 unminted-minted-spent / mult0 unmarked-marked / classic-edge reject / push-edge / **joint mult1+mult0 multi-node extract** (minted+marked success + either-side fail-closed; 2026-08-07) | Further joint deepen only if product needs; EmitPlan spent **done**; EmitBody spent **done** | No |
| P0 | **Mult** | Partial; grades closed | ofNat? fail-closed / name / isValidTag family | Deeper inductive properties only if product needs | No |
| P0 | **Extract** | Partial; MULT-1 thinning | RUNTIME-FS-only; tag fail-closed; classic/edge reject | Compose-owned mult1 live gap closed; extract thinning remains intentional | No |
| P0 | **Erasure** | Partial | mark / isRuntimeAbsent / markForGrade? / checkFailClosed mult0 | EDGE-PROP dual edge remains dual map (not complete synonym) | No |
| P1 | **Types** | Partial | kind/mult pairing; mkNode? ok/mismatch; ofKindTag? fail-closed | Full elaborator type checker not on product wire | No |
| P1 | **IrProgram** | Partial | empty fail-closed; single/two VALUE; mixed kinds; cap full push | Further multi-kind bad paths only if product needs | No |
| P1 | **IrGraph** | Partial | empty OK; edgesSound; edgeMax full; oversize | Multi-node general badEndpoints families beyond fixtures | No |
| P1 | **EmitPlan** | Partial; spent mult1 closed | planOk empty / mult1 unminted-minted-spent / mult0 / omega / two_values_edge / linear_and_erased | Further plan inventory deepen only if product needs | No |
| P1 | **EmitApply** | Partial | desync + oversize + sound inventory + mult1/mult0/omega tags | Further tag-law deepen only if product needs | No |
| P1 | **EmitBody** | Partial; spent mult1 closed | bodyOk mult1 unminted-minted-spent / mult0/omega; exact HOST-EMIT-SSOT buf lines; linear_and_erased | Further body inventory deepen only if product needs | No |
| P1 | **CompilePath** (+ unit fixtures) | Partial e2e fixtures | Mult..Body fixture ready bools + theorems | Fixture readiness != full dialect compile proof | No |
| P1 | **Kernel* / Parity*** | Partial IR / freestanding API pins | Kernel ready + content; parity product API strings | Content equality mills != memory-safety bar | No |
| P2 | **JoinMap / SelfHost / SurfaceMatrix** | Partial canaries | empty/path fixtures; matrix measured rows | Dual formal map = Track 1c; not complete synonym | No |
| P2 | **SelfApply / SelfApplyFs / ProductPath / DualResidual / ProbeWire / InventoryClose / LlvmHold** | Partial readiness honesty | product complete true; free true; host free claimed F1; llvm unlocked | Readiness canaries are not proof complete | No |

## Honest bar for product proof complete (Track 4c -- **MET** 2026-08-07)

Living pin true only when SpecProof + residual **name the bar** and lake proves it.
**Bar met** by residual implement report
`.agents/reports/impl-proof-complete-residual-2026-08-07.md`.

Minimum honest bar (all items met):

1. **Named product-critical theorem residuals closed** for Mult grades + Linear host
   contracts (axioms stay documented) + HostCompose live-flag exact-once **including
   spent mult1 and joint mult1+mult0 multi-node extract**
   + Types kind/mult + Program empty fail-closed + mixed kinds + Graph edgesSound/
   edgeMax + Emit plan/apply/body fail-closed families (including spent mult1 on
   plan/body), each with lake green on the owning theorem surface (prior residual
   Done + lake reports).
2. **Explicit residual Name** "Proof complete residual" with Done when listing those
   properties (not greps alone) -- **done**.
3. **SpecProof rewrite:** `proofCompleteClaimed := true` with honest `specProofReady`
   (ready folds complete **true** + bar-met pin; no longer `!proofCompleteClaimed`).
4. **Lake elaborator proof** exit 0 on SpecProof + SpecProofTheorems.
5. **Residual lockstep** (systems residual, join board, handoff, surface-matrix
   SpecProof / proof complete row, self-host honesty).
6. **Non-claims preserved:** product free/complete; host free claimed under free bar
   choice (a); not full Lean 4 / mathlib elaborator parity; not PROVABLY re-open;
   not full LLVM backend; proofs still do not retire tests/smokes; Linear Token
   axioms remain honest.

**Today (2026-08-07, post Track 4c land):** Track 4a + 4b **done**; free bar host free
claimed; global complete **true** with bar-met; Open empty done-for-now. Kind:
analysis note updated for living tip honesty (claim flip lives in SpecProof + residual).

## Named proof residuals (all closed)

### Name: HostCompose joint mult1 mult0 extract -- **done** (2026-08-07)

| Field | Content |
|-------|---------|
| **Name** | HostCompose joint mult1 mult0 extract |
| **Status** | **done** (2026-08-07) |
| **Report** | `.agents/reports/impl-hostcompose-joint-extract-2026-08-07.md` |

### Name: EmitPlan spent mult1 reject -- **done** (2026-08-07)

| Field | Content |
|-------|---------|
| **Name** | EmitPlan spent mult1 reject |
| **Status** | **done** (2026-08-07) |
| **Report** | `.agents/reports/impl-emitplan-spent-mult1-reject-2026-08-07.md` |

### Name: EmitBody spent mult1 reject -- **done** (2026-08-07)

| Field | Content |
|-------|---------|
| **Name** | EmitBody spent mult1 reject |
| **Status** | **done** (2026-08-07) |
| **Report** | `.agents/reports/impl-emitbody-spent-mult1-reject-2026-08-07.md` |

### Name: Proof complete residual (Track 4c) -- **done** (2026-08-07)

| Field | Content |
|-------|---------|
| **Name** | Proof complete residual |
| **Status** | **done** (2026-08-07) |
| **Landed** | `proofCompleteClaimed := true`; `proofCompleteBarMet`; ready rewrite; theorems true; pure Nix true-shape; residual lockstep; lake exit 0 |
| **Report** | `.agents/reports/impl-proof-complete-residual-2026-08-07.md` |

### Deferred deepen queue

| Order | Candidate Name | Why later |
|------:|----------------|-----------|
| -- | Further P1 deepen only if product needs | Not complete synonym; complete already claimed |
| held | Full LLVM backend / full elaborator parity | Plan-held; not proof-complete re-open |

Do **not** open canary-only Names as proof deepen. Do **not** invent full elaborator
parity Open as a second complete synonym.

## Non-claims (after Track 4c)

- Not mass sorry-fill (no product sorry surface).
- Not full Lean 4 / mathlib elaborator parity.
- Not PROVABLY re-open; not full LLVM backend.
- Proofs do not retire tests/smokes.
- Linear Token axioms remain honest.
- SpecProof local residual free stays false (DualResidual owns product free).
- Free / product complete / PROVABLY / product Lake pins / host free claimed F1 /
  FullHost false / llvm unlock **unchanged**.
- Not full dual formal map; not full CFG/SSA; not full Lean 4 / mathlib elaborator
  parity.
- Local SpecProof residual free pin stays false; DualResidual product free stays true.

## Related

- Prior inventory: `doc/dev/research/proof-complete-inventory-2026-08-03.md`
- SpecProof SSoT: `src/systems/SystemsLean/SpecProof.lean`
- Surface matrix row: `src/systems/surface-matrix.md` (SpecProof / proof complete **measured**; Track 4c done)
- North-star Track 4: `.agents/plans/plan-north-star-remaining.md`
- Residual: `RESIDUAL-systems.md`
