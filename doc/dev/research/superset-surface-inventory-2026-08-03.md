# Superset surface inventory (2026-08-03)

Kind: analysis only. Not residual invent. Not free/complete/PROVABLY/llvm forge.
ASCII only. Date: 2026-08-03.

**Residual Name:** Superset surface inventory (Track 1a; plan-north-star-remaining).
**Living inventory:** `src/systems/surface-matrix.md`
**Lean host canary (read-only this slice):** `SystemsLean/SurfaceMatrix.lean`
**Prior notes:** `slake-first-compiler-surface-inventory-2026-08-01.md`,
`surface-matrix-split-2026-07-31.md` (cite only).

---

## Honesty floor (living pins; do not flip from this note)

| Pin | Living value |
|-----|--------------|
| free / residual free (claim A) | **true** (host elaborator residual remains) |
| complete / freestandingProductSelfHostComplete (claim B) | **true** |
| PROVABLY / provablyUnlocked | **true** |
| product StillUsesLake / DependsOnLake | **false** |
| host elaborator residual remains | **true** |
| llvmUnlocked | **true** (not full backend / not Rust-native link) |
| SpecProof.proofCompleteClaimed | **false** |

This inventory **does not** claim full Idris 2 parity, full Lean 4 parity, or
"superset complete." Goals bar (`doc/goals.md`): progressive surface matrix +
gates for **useful cores**, not day-one full upstream parity.

---

## Purpose

List useful Idris 2 / Lean 4 cores that still matter for meet-in-the-middle
progressive gates, against the living surface matrix and host/dual evidence.
Name gaps honestly for Track 1b residual program. Do **not** invent dual LOC
padding or fourth algorithms without a named product map need.

---

## Status of existing matrix rows (2026-08-03 reseed)

Prose SSoT after this residual: `src/systems/surface-matrix.md`. Summary:

| Row | Living matrix status | Notes |
|-----|----------------------|-------|
| Multiplicity (MULT-0/1/OMEGA) | **present-partial** | Host Mult closed inductive; not full binder-QTT source language |
| Linear / JOIN-ALG duals | **present-partial** | Three duals + joinAlgUseOk; classic elaborator cannot enforce MULT-1 |
| Typed IR / program / graph | **present-partial** | CAP 8 / EDGE_MAX 16; not full CFG/SSA |
| Erasure + extract | **present-partial** | MULT-0 erase; RUNTIME-FS extract honesty |
| Host compose | **present-partial** | graph + linear + erasure |
| Emit plan / apply / body | **present-partial** | Frozen freestanding C wire; host SSOT |
| Compile path | **present-partial** | HOST-COMPILE-PATH V1; not product C compile of arbitrary sources |
| Join map | **present-partial** | Path cite + host use pins; not formal full bridge |
| Self-host direction | **present-partial** | Direction readiness; separate from claim B complete |
| Product residual free (claim A) | **measured** (claimed true) | DualResidual honesty; host residual remains |
| Freestanding product self-host complete (claim B) | **measured** (claimed true) | SelfApplyFs living tip; not "matrix inventory alone" |
| CompCert PROVABLY | **PROVABLY** | Product matrix + lake proof |
| out/llvm-ir unlock | **measured** (unlocked) | `llvmUnlocked` true; **full backend still open** |
| Full syntax surface | **open** | Progressive gates only |
| Full classic elaborator parity | **open** | Host residual remains |
| Host residual free | **open** | Track 3 design residual parallel |
| SpecProof / proof complete | **open** | Track 4 inventory residual parallel |
| Dual formal map theorems | **open** | Beyond three JOIN-ALG examples; Track 1c when product needs |
| Full Idris 2 core parity | **open** | Forever non-goal as day-one; progressive only |
| Full Lean 4 core parity | **open** | Forever non-goal as day-one; progressive only |
| Full CFG / SSA / production llvm-as | **open** (deferred Track 5) | After unlock + measured emit (unlock already true) |
| Rust-native link without classic FFI | **open** (deferred) | Layout Mult-first ladder done; link needs dual evidence |
| Lean matrix claim-row canary lag | **open** (Track 1b) | `SurfaceMatrix.lean` still marks freestanding + llvm rows `statusOpen` for `openRowsOpenOk` while living claim pins are true |

### Stale prose fixed this residual

`surface-matrix.md` land-time body still said freestanding complete **false**,
residual free open as claim on product path close, llvm not unlocked, PROVABLY
orthogonal false in related self-host dump. Reseed aligns rows and non-claims
with living tip above. **No** full-parity slogan.

### Lean canary (not flipped this residual)

`SystemsLean/SurfaceMatrix.lean` `openRowsOpenOk` still requires
`rowFreestandingSelfHost` and `rowLlvm` as `statusOpen`. That keeps
`matrixSurfaceOk` green without a claim-bool residual. Track 1b
**Matrix claim-row honesty** is the checkable gap residual to reseed those
inventory strings (and `openRowsOpenOk` / claimedOk path) with lake proof,
without forging full backend or full language parity.

---

## Useful cores already covered (progressive, not full language)

| Core | Evidence | Still PARTIAL? |
|------|----------|----------------|
| QTT grades 0 / 1 / omega as freestanding mult surface | Mult.lean + emit Mult | Yes -- not Idris-style every-binder QTT in a user source language |
| Linear consume / mint once | HostCompose + JOIN-ALG ConsumeToken | Yes -- axioms / dual-cite; classic Lean cannot enforce exact-once |
| Erasure / runtime-absent | Erasure + ErasedIndex dual | Yes -- Prop vs mult-0 imperfect edge remains |
| Unrestricted share sketch | Mult omega + shareNat + UnrestrictedShare dual | Yes -- sketch only |
| Typed IR node + ordered program + graph edges | Types / IrProgram / IrGraph | Yes -- fixed caps; not full SSA |
| Freestanding emit product wire | Emit* + out/freestanding-c | Yes -- fixed dialect regenerate, not arbitrary compiler front-end |
| Compile readiness fold | CompilePath + JoinMap + SelfHost + SurfaceMatrix bars | Yes -- fixtures / readiness, not full elaborator |
| First compiler surface (S1) Mult unit path | FirstSurface | Yes -- Mult unit only; not full syntax |
| Peer Mult-first without-Lake fragments | HostFront / HostCheck / HostGraph / HostPackageWrite | Yes -- Mult-first peer shrink; host residual remains |
| CompCert product matrix | product-compcert-matrix + provablyUnlocked | Claimed PROVABLY; not host free |
| LLVM unit text + compose + unlock | Llvm*Text + LlvmHold.llvmUnlocked | Unlock true; not full backend |

---

## Gap table (useful cores still missing or open)

| Name | Why it matters | Status | Candidate residual Name |
|------|----------------|--------|-------------------------|
| Matrix claim-row honesty | Lean inventory canary still marks freestanding complete + llvm as open while living pins true; matrixSurfaceOk composition lag | open | **Matrix claim-row honesty** (Track 1b primary next) |
| Full syntax surface | User-facing Systems Lean / Slake source syntax beyond fixed IR fixtures and Mult-first fragments | open | Surface syntax progressive gate (later 1b N; inventory only for now) |
| Dual formal map theorems | Three JOIN-ALG examples are cite+use pins, not formal dual-bridge theorems | open | Dual formal map theorems (Track 1c when product needs a named edge) |
| Fourth dual algorithm | No product map gap named today; inventing duals pads LOC without meet-in-the-middle need | **do not invent** | Only if join-map / divergence names a missing algorithm id |
| Host residual free | Classic Lake still elaborates SystemsLean for develop; free is product free only | open | **Host residual free design** (already Open Track 3a) |
| SpecProof complete | proofCompleteClaimed false; definitional canaries != proof complete | open | **Proof complete inventory** (already Open Track 4a) |
| Full elaborator parity | Full Idris TTImp / Lean elaborator / mathlib not product day-one | open | Keep open forever as non-claim; no residual to "finish Lean" |
| Full Idris / Lean core parity | Goals explicitly progressive; day-one parity non-goal | open | No residual that claims full parity |
| Full LLVM backend / CFG / SSA | Unlock true is not production backend | open / deferred | Track 5 after measured emit deepen |
| Rust-native link | Layout Mult-first fixtures done; no classic-FFI-free link claim | open / deferred | Later dual-evidence Name before claim |
| Idris QTT binder surface in Slake sources | Mult grades on product wire != full QTT source language | present-partial | Only with named syntax residual, not dual invent |
| Lean tactic / mathlib surface | Intentionally not product wire | skip / open non-claim | Do not open residual to import mathlib as product |
| Affine grade first-class | Divergence EDGE-AFFINE: Idris public grades lack affine; product talk includes affine | open imperfect edge | Document only unless product residual names affine check |

---

## Track 1 next residual (checkable)

**Primary next Open Name:** Matrix claim-row honesty

| Field | Content |
|-------|---------|
| **Name** | Matrix claim-row honesty |
| **Goal** | Align SurfaceMatrix inventory row statuses for freestanding complete and llvm unlock with living claim tip without forging full backend or full language parity. |
| **Done when** | (1) SurfaceMatrix.lean inventory strings / openRowsOpenOk / claimedOk path match living tip (complete true; llvm unlocked true; full backend still open). (2) matrixSurfaceOk true; lake build SurfaceMatrix + SurfaceMatrixTheorems exit 0. (3) surface-matrix.md already honest from 1a; residual lockstep. |
| **Out of scope** | Full syntax; full Idris/Lean parity; proofCompleteClaimed flip; host free flip; full CFG/SSA; product C growth |
| **Primary paths** | `SystemsLean/SurfaceMatrix.lean` (+ Theorems if needed); `src/systems/surface-matrix.md`; residual lockstep |
| **Gates** | lake on claim/inventory flip; just systems-host if greppable presence; hygiene |

Parallel Open (unchanged programs): **Proof complete inventory**, **Host residual free design**.

---

## Explicit non-claims

- Not full superset / not "superset complete"
- Not day-one full Idris 2 or full Lean 4 parity
- Not inventing dual algorithm LOC padding
- Not flipping free / complete / PROVABLY / llvm / product Lake / host free / proof complete from this inventory alone
- Not full LLVM backend or Rust-native link from unlock true
- Not permission to forge matrixSurfaceOk by rewriting theorem expectations without product intent

---

## Related paths

- Goals: `doc/goals.md` (superset = matrix + progressive gates)
- Divergence imperfect edges: `doc/divergence.md`
- Join map: `src/systems/join-map.md`
- Dual examples: `src/idris2/examples/`, `src/lean4/examples/`
- Plan: `.agents/plans/plan-north-star-remaining.md` Track 1
- Residual: `RESIDUAL-systems.md`, coordinator `RESIDUAL.md`
