# Proof complete inventory (2026-08-03)

Kind: analysis only. Not residual.

ASCII only. Track 4a of `.agents/plans/plan-north-star-remaining.md`.
Does **not** flip `SystemsLean.SpecProof.proofCompleteClaimed`.

## Scope and method

| Source | Role |
|--------|------|
| `SystemsLean/SpecProof.lean` | Living SSoT: `proofCompleteClaimed := false`; `specProofReady` requires complete **false** |
| `SystemsLean/SpecProofTheorems.lean` | `proofCompleteClaimed_false` (rfl); complete stays proved false |
| Module headers + `*Theorems.lean` | Local theorem surfaces; all state partial and do not flip global complete |
| `doc/dev/research/no-sorry-host-inventory-2026-07-31.md` | Host path sorry/admit free; only axioms are Linear Token surface |
| `rg` on `src/systems/SystemsLean` | `proofCompleteClaimed`, theorem honesty, `sorry` |

Foundation claims (context floor, unchanged this slice):

- freestanding product self-host **complete** true; product residual **free** true
- product StillUsesLake / DependsOnLake **false**; host elaborator residual **remains**
- PROVABLY true; `llvmUnlocked` true (not full backend)
- SpecProof **local** `residualFreeClaimed` stays false (DualResidual owns product free)

## Global living tip

| Flag | Value | Home |
|------|-------|------|
| `proofCompleteClaimed` | **false** (intentional; not forge) | `SpecProof.lean` def + `proofCompleteClaimed_false` theorem |
| `specSurfaceStated` | true | SpecProof |
| `proofDoesNotRetireTests` | true | SpecProof |
| `specDoesNotImplyProofComplete` | true | SpecProof (surface stated + complete false) |
| `specProofReady` | true while complete false + product complete true | SpecProof |

**There is no second living global complete pin.** Module-local "ready" / "kernel ok" / "parity ready" bools are **not** proof complete. Partial theorem families explicitly refuse to set `proofCompleteClaimed` true (SpecProof header + each unit header).

## sorry / axiom honesty

| Marker | Status (2026-08-03 recheck) |
|--------|-----------------------------|
| `sorry` / `admit` under `SystemsLean/**/*.lean` | **none** (same as no-sorry inventory) |
| `axiom` product surface | **Linear only:** `Token`, `mkToken`, `consume` (`LINEAR-AXIOMS-REMAIN`) |
| Mass sorry-fill residual | **Banned** (nothing to fill; theater would be definitional canaries) |

## Ranked inventory (product-critical first)

Priority: P0 freestanding memory-safety / Mult-Linear-Compose path; P1 IR / Types / emit plan-apply; P2 host readiness canaries / inventory folds.

| Pri | Module / surface | Local complete | What exists (partial) | What property would deepen / flip local bar | Flip global complete? |
|-----|------------------|----------------|------------------------|---------------------------------------------|------------------------|
| P0 | **SpecProof** | Global complete **false** (proved) | Spec-proof separation honesty; ready requires complete false | Only Track 4c residual with named inventory bar + lake | **Yes -- only here** |
| P0 | **Linear** | Partial; axioms remain | shareNat_* / polyId_* / roundTrip_eq / axiom inventory pins | Elaborator MULT-1 / LinearCheck-class on Token is **out of classic Lean**; do not fake model | No (axioms are honest limits) |
| P0 | **HostCompose** | Partial; live-flag only | mint/consume/double-consume/exact-once sequential; multPreScan mult0/mult1; extract classic/edge reject; push/edge | **Spent MULT-1 reject:** after mint+consume with MULT-1 graph node, multPreScan/extractOkFs fail closed + spent scrub (smoke exists; **not** named theorem family yet) | No |
| P0 | **Mult** | Partial; grades closed | ofNat? fail-closed / name / isValidTag family | Deeper inductive properties only if product needs; grade surface largely closed | No |
| P0 | **Extract** | Partial; MULT-1 thinning | RUNTIME-FS-only; tag fail-closed; classic/edge reject | Compose-owned mult1 live gap closed on HostCompose; extract thinning remains intentional | No |
| P0 | **Erasure** | Partial | mark / isRuntimeAbsent / markForGrade? / checkFailClosed mult0 | Compose mult0 unmarked/marked path already paired; EDGE-PROP remains dual edge | No |
| P1 | **Types** | Partial | kind/mult pairing; mkNode? ok/mismatch; ofKindTag? fail-closed | Full elaborator type checker not on product wire | No |
| P1 | **IrProgram** | Partial | empty fail-closed; push/fold well-typed; cap full | Multi-kind mixed programs beyond VALUE fixtures | No |
| P1 | **IrGraph** | Partial | empty OK; edgesSound; one/two edge; oversize | Capacity-full edges + multi-node badEndpoints families | No |
| P1 | **CompilePath** (+ unit fixtures) | Partial e2e fixtures | Mult..Body fixture ready bools + theorems | Fixture readiness != full dialect compile proof | No |
| P1 | **EmitPlan / EmitApply / EmitBody** | Partial | planOk / applyOk / bodyOk families; mult1 unminted false | Full C body codegen correctness not host theorem bar | No |
| P1 | **Kernel* / Parity*** | Partial IR / freestanding API pins | Kernel ready + content; parity product API strings | Content equality mills != memory-safety bar | No |
| P2 | **JoinMap / SelfHost / SurfaceMatrix** | Partial canaries | empty/path fixtures; matrix measured rows | Dual formal map = Track 1c; not complete synonym | No |
| P2 | **SelfApply / SelfApplyFs / ProductPath / DualResidual / ProbeWire / InventoryClose / LlvmHold** | Partial readiness honesty | product complete true; free true on DualResidual living tip; llvm unlocked | Host residual free = Track 3; complete product path already claim B | No |

## What would flip global `proofCompleteClaimed` (Track 4c bar -- honest)

Do **not** flip on inventory alone. Plan Track 4c: living pin true only when SpecProof + residual **name the bar** and lake proves it.

Minimum honest bar (proposal for later 4c residual, not claimed met):

1. **Named product-critical theorem residuals** closed for Mult + Linear host contracts + HostCompose live-flag exact-once + Types kind/mult + Program empty fail-closed + Graph edgesSound + Emit plan/apply fail-closed families (P0/P1 above), each with lake green on the owning `*Theorems` package.
2. **Explicit residual Name** "Proof complete residual" with Done when listing those properties (not greps alone).
3. **SpecProof** rewrite: `proofCompleteClaimed := true` only when `specProofReady` folds still honest (may need ready-shape change so ready no longer requires complete **false** -- deliberate residual; serialize with DualResidual/LlvmHold tip writers).
4. **Lake elaborator proof** exit 0 on SpecProof + SpecProofTheorems + blast-radius ready folds that currently require complete false.
5. **Residual lockstep** (systems residual, join board, handoff, surface-matrix proof-complete row, self-host honesty).
6. **Non-claims preserved:** free/complete product claims; host residual remains; not PROVABLY re-open; not full LLVM backend; proofs still do not retire tests/smokes.

**Not sufficient for 4c:** renaming canaries; adding definitional alias theorems; mass smoke-to-theorem renames without new properties; forging while Linear axioms remain (axioms stay; complete may still be true later if residual bar excludes elaborator LinearCheck).

**Today:** inventory incomplete; continuous **4b** named properties only; complete stays **false**.

## Recommended next named proof residual (Track 4b)

### Name: HostCompose spent mult1 reject

| Field | Content |
|-------|---------|
| **Name** | HostCompose spent mult1 reject |
| **Goal** | After mint then consume on a host that still has a MULT-1 graph node, prove fail-closed: multPreScan / extractOkFs / checkFailClosed reject the spent host, with spent scrub (live false, id 0). Net-new vs empty-host scrub theorems already landed. |
| **Done when** | (1) Named theorems in `SystemsLean/HostComposeTheorems.lean` for spent host **with MULT-1 graph node** (promote HOST-SMOKE ~L487-493 mint+push+consume then `!extractOkFs` + scrub; not re-prove empty-host `consume_minted_one` / `mint_consume_exact_once_sequential` alone). (2) `lake build SystemsLean.HostComposeTheorems` exit 0 when lake on PATH. (3) Residual lockstep; greppable COMPOSE-THEOREM honesty updated. (4) `proofCompleteClaimed` stays **false**. |
| **Out of scope** | Flip SpecProof complete; elaborator MULT-1 on `Linear.Token` axioms; re-proving empty-host scrub alone as the residual; mass theorem theater / canary renames; product C/shell growth; host residual free / llvm backend claims |
| **Primary paths** | `SystemsLean/HostCompose.lean` (cite); `SystemsLean/HostComposeTheorems.lean`; residual lockstep |
| **Gates** | lake HostComposeTheorems when toolchain present; `just systems-host` if presence tokens added; `just hygiene` if novel md; no complete pin flip |
| **Why product-critical (P0)** | Freestanding safety story is linear/exact-once + fail-closed compose. Single-id mint/consume exact-once and mult1 unminted/minted multPreScan already have theorems; the **post-spend MULT-1 graph still present** reject is only smoke today. That is a real property on the HostCompose live-flag model, not a readiness canary. |

### Deferred 4b queue (after primary; not Open this slice)

| Order | Candidate Name | Why later |
|------:|----------------|-----------|
| 2 | IrGraph edge capacity full reject | Real graph property; lower than compose exact-once |
| 3 | EmitApply desync fail-closed deepen | Already partial; only if product needs stronger tag count law |
| 4 | Types multi-node mixed kind program | Useful; less freestanding fail-closed critical than compose spend |

Do **not** open canary-only Names (SelfApply ready, matrix empty program, etc.) as Track 4b.

## Non-claims (this slice)

- Not mass sorry-fill (no sorry surface).
- Not forging `proofCompleteClaimed` true.
- Not Track 4c.
- Free / product complete / PROVABLY / product Lake pins / host residual / llvm unlock **unchanged**.
- Not full dual formal map; not full CFG/SSA; not host elaborator residual free.
- Local SpecProof residual free pin stays false; DualResidual product free stays true.

## Join

Implement summary: `/tmp/grok-1000/grok-impl-summary-542dd76c.md`.
Residual: close **Proof complete inventory**; Open **HostCompose spent mult1 reject**; parallel **Host residual free design** remains.
