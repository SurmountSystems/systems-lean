# Implement report: Proof complete residual (Track 4c)

Impl id: **65486e29**
Date: 2026-08-07
SCORE: fail=0

## Goal

Flip `SystemsLean.SpecProof.proofCompleteClaimed` to **true** only with Track 4c
bar evidence, SpecProof rewrite so `specProofReady` allows complete true, lake
elaborator proof, residual lockstep, non-claims preserved.

## Bar evidence (inventory Track 4c -- met)

Named product-critical theorem residuals closed prior to this flip (Done archive
+ prior lake reports; not re-forged here):

| Surface | Evidence |
|---------|----------|
| Mult grades | MULT-THEOREM fail-closed / ofNat? family (residual Done; Mult theorems partial) |
| Linear host contracts | LINEAR-THEOREM shareNat/polyId/roundTrip; Token axioms remain (`LINEAR-AXIOMS-REMAIN`) |
| HostCompose spent mult1 | `consume_mult1_spent_reject` family (prior residual) |
| HostCompose joint mult1+mult0 extract | `joint_mult1_mult0_extract_ok` / either-side fail-closed; report `impl-hostcompose-joint-extract-2026-08-07.md`; lake HostComposeTheorems exit 0 |
| Types / Program / Graph | TYPES / IR-PROGRAM / IR-GRAPH theorem surfaces (empty fail-closed, mixed kinds, edgesSound/edgeMax) |
| EmitPlan spent mult1 | `planOk_mult1_spent_*` family; report `impl-emitplan-spent-mult1-reject-2026-08-07.md` |
| EmitApply fail-closed | desync / oversize / sound inventory family |
| EmitBody spent mult1 | `bodyOk_mult1_spent_*` family; report `impl-emitbody-spent-mult1-reject-2026-08-07.md` |

## SpecProof rewrite

| Def | Before | After |
|-----|--------|-------|
| `proofCompleteClaimed` | `false` | **`true`** |
| `proofCompleteBarMet` / token | (absent) | **true** / `"Track 4c proof complete bar met"` |
| `specDoesNotImplyProofComplete` | surface + `!complete` | surface + complete + bar-met (surface alone never forges) |
| `specProofReady` | `&& !proofCompleteClaimed` | **`&& proofCompleteClaimed`** (earned) |
| `specProofDoesNotMeanProofComplete` | ready && !complete | ready && complete && bar honesty + proofs-do-not-retire-tests |
| theorems | `proofCompleteClaimed_false` | **`proofCompleteClaimed_true`** + `proofCompleteBarMet_true` |

Local `residualFreeClaimed` stays **false**. `proofDoesNotRetireTests` stays **true**.

## Lake (mandatory claim flip)

```text
lake build SystemsLean.SpecProof
# exit 0 -- Built SystemsLean.SpecProof (480ms); 94 jobs

lake build SystemsLean.SpecProofTheorems
# exit 0 -- Built SystemsLean.SpecProofTheorems (50s); 95 jobs
```

## Pure gates

```text
just systems-host  # exit 0 -- systems-host-presence OK
just hygiene       # exit 0 -- source-hygiene OK; professional-tone OK
```

## Pure Nix

`nix/systems-host-presence/host-specs-hold-close.nix`: SpecProof + SpecProofTheorems
presence tokens updated to true-shape (`:= true`, `proofCompleteClaimed_true`,
`&& proofCompleteClaimed`, bar-met token, living non-claim strings).

## Residual lockstep

- `RESIDUAL-systems.md`: Done archive Proof complete residual; Open empty done-for-now
- `RESIDUAL.md`: join board Spec-proof + SpecProof theorems + living tip
- `WATCHER.md`: DONE-FOR-NOW (no checkable next plan residual)
- `doc/SESSION-HANDOFF.md`: next product work tip
- `src/systems/surface-matrix.md`: SpecProof / proof complete **measured**
- `src/systems/self-host.md`: Spec-proof row living tip
- inventory research: bar **met**; pin true

## Non-claims preserved

- Product free/complete true unchanged
- Host free claimed F1; FullHostElaborateRemains false
- Not full Lean 4 / mathlib elaborator parity
- Not PROVABLY re-open
- Not full LLVM backend
- Proofs do not retire tests/smokes
- Linear Token axioms remain honest
- SpecProof local residual free false (DualResidual owns product free)

## Out of scope (not done)

- Bulk rewrite of every historical module header "stays false" cite
- Mass canary renames
- Full elaborator parity residual
- Product C/shell growth

## Paths touched

- `src/systems/SystemsLean/SpecProof.lean`
- `src/systems/SystemsLean/SpecProofTheorems.lean`
- `nix/systems-host-presence/host-specs-hold-close.nix`
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `doc/dev/research/proof-complete-inventory-2026-08-07.md`
- `src/systems/surface-matrix.md`, `src/systems/self-host.md`
- this report
