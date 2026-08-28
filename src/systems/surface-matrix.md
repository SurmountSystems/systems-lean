# SURFACE-MATRIX -- superset surface inventory (P7)

**Greppable:** SURFACE-MATRIX, SLAKE_SURFACE_MATRIX_V0, HOST-SURFACE-MATRIX,
present-partial, open, measured, SYSTEMS_LEAN_HOST, SURFACE-MATRIX-THEOREM,
HOST-SURFACE-MATRIX-THEOREM, matrixUnitReady_empty_true,
matrixProgramReady_empty_false
**Stage:** `SLAKE_SURFACE_MATRIX_V0` / `HOST-SURFACE-MATRIX` / `SURFACE-MATRIX`
**Lean host:** `SystemsLean/SurfaceMatrix.lean` (matrixUnitReady / matrixProgramReady
dialect) + `SystemsLean/SurfaceMatrixTheorems.lean` (SURFACE-MATRIX-SMOKE +
SURFACE-MATRIX-THEOREM / HOST-SURFACE-MATRIX-THEOREM; same namespace; long-file split);
SpecProof.proofCompleteClaimed **true** (Track 4c bar met; lake proof)
**Date evidence:** 2026-07-22 (P7 host-side surface matrix); **reseed 2026-08-03**
(superset surface inventory); **Track 4c complete 2026-08-07**

## Purpose

Honest **progressive** inventory of what Systems Lean / Slake host currently
covers versus open gaps relative to useful Idris 2 and Lean 4 cores.

Acceptance bar (from `doc/goals.md`): explicit surface matrix + progressive
gates -- **not** day-one full upstream parity, **not** marketing "superset
complete."

This file is inventory prose. Executable fail-closed composition lives in
`SystemsLean.SurfaceMatrix` (composes HOST-SELF-HOST readiness with matrix
surface canary).

**Living claim tip (do not re-open without cause):** product residual free
**true**; freestanding product self-host complete **true**; PROVABLY **true**;
product StillUsesLake/DependsOnLake **false**; host elaborator residual free
**claimed** (F1 dual-ok; remains **false** / free claimed **true**; FullHostElaborateRemains
**false**; product free stays distinct); `llvmUnlocked` **true** (not full backend);
Rust Mult..Graph layout / foreign dual-map happy path does **not** require classic
foreign-function interface (FFI) ceremony (end announce measured; not "no FFI ever";
not product Rust under `src/`). Classic freestanding **C** product wire remains a
permanent valid emit path. Inventory research:
`doc/dev/research/superset-surface-inventory-2026-08-03.md`.

---

## Status vocabulary

| Status | Meaning |
|--------|---------|
| **present-partial** | Host surface exists for this row; progressive gate green; intentional PARTIAL vs full wire / full language feature |
| **measured** | Real fail-closed recipe(s) and/or living claim pin with evidence; still not full language parity or full backend unless named residual closed that |
| **PROVABLY** | Named CompCert product claim closed: resolved ccomp + green product matrix + living pin `provablyUnlocked` true with lake elaborator proof |
| **open** | Not claimed; gap stays open until named residual + evidence |

No row may be marked full Idris parity, full Lean parity, or full llvm backend
without its own evidence residual. Host residual free and proof complete each
require their own named residual + lake proof (F1 free / Track 4c complete done).
PROVABLY is only on the CompCert row. Unlock true is not full backend.

---

## Dual cite inputs (read-only; do not reimplement)

JOIN-ALG algorithm examples on both bridge sides:

| Algorithm | Idris side | Lean side |
|-----------|------------|-----------|
| ConsumeToken | `src/idris2/examples/ConsumeToken.idr` | `src/lean4/examples/ConsumeToken.lean` |
| ErasedIndex | `src/idris2/examples/ErasedIndex.idr` | `src/lean4/examples/ErasedIndex.lean` |
| UnrestrictedShare | `src/idris2/examples/UnrestrictedShare.idr` | `src/lean4/examples/UnrestrictedShare.lean` |
| FailClosedGrade | `src/idris2/examples/FailClosedGrade.idr` | `src/lean4/examples/FailClosedGrade.lean` |
| LinearPairSwap | `src/idris2/examples/LinearPairSwap.idr` | `src/lean4/examples/LinearPairSwap.lean` |
| RuntimeExtract | `src/idris2/examples/RuntimeExtract.idr` | `src/lean4/examples/RuntimeExtract.lean` |

Stated dual -> Slake use map: `src/systems/join-map.md` and
`SystemsLean/JoinMap.lean` (`joinAlgUseOk` host use pins; `joinDualCiteOk`
path inventory). ConsumeToken: HostCompose mint/consume live-flag
(`consumeTokenHostUseOk`) + HOST-EMIT-LINEAR product text (Linear Token axioms
remain dual-cite on Linear.lean, not joinAlgUseOk). ErasedIndex: Erasure mark /
isRuntimeAbsent + MULT-0. UnrestrictedShare: Mult multOmega / MULT-OMEGA +
Linear.shareNat (shareNat only on this dual). FailClosedGrade: Mult.ofNat? /
isValidTag unknown-tag reject (FAIL-CLOSED-UNKNOWN-GRADE). LinearPairSwap:
PARTIAL single live-token remint reject (`linearPairSwapHostUseOk`); multi-token
product C not claimed. RuntimeExtract: Extract RuntimeClaim FS-only
(`runtimeExtractHostUseOk`); RUNTIME-FS vs RUNTIME-CLASSIC / EDGE-RUNTIME.
Duals are not reimplemented under `src/systems/`; dual trees stay read-only.
**Do not invent another dual** without a named product map gap (see dual-gap
inventory research).

---

## Matrix rows (host progressive vs open)

| Row | Status | Host evidence | Notes |
|-----|--------|---------------|-------|
| Multiplicity surface (MULT-0 / MULT-1 / MULT-OMEGA) | **present-partial** | `SystemsLean/Mult.lean` | Closed inductive; FAIL-CLOSED-UNKNOWN-GRADE; MULT-THEOREM real theorems; not full binder-QTT source language; not SpecProof complete |
| Linear / JOIN-ALG duals (six algorithm ids including RuntimeExtract) | **present-partial** | HostCompose mint/consume + Erasure + Mult/shareNat + Mult fail-closed + PARTIAL pair remint + Extract RuntimeClaim FS via JoinMap joinAlgUseOk; dualCiteOk inventory; join-map.md | Classic elaborator cannot enforce MULT-1; Linear Token axioms dual-cite only; LinearPairSwap multi-token host PARTIAL; not dual isomorphism complete |
| Typed IR / ordered program / graph edges | **present-partial** | Types + IrProgram + IrGraph | CAP 8 / EDGE_MAX 16; List vs C arrays PARTIAL; not full CFG/SSA; not SpecProof complete |
| Erasure + extract | **present-partial** | Erasure + Extract + HostCompose.multPreScan | RUNTIME-FS extract; thin Extract rejects unminted MULT-1; minted path is HostCompose |
| Host compose | **present-partial** | HostCompose.lean | graph + linear + erasure; HOST-SMOKE |
| Emit plan / apply / body honesty | **present-partial** | EmitPlan + EmitApply + EmitBody + HOST-EMIT-SSOT | Frozen C wire; fragment dialect host SSoT |
| Compile path | **present-partial** | CompilePath.lean HOST-COMPILE-PATH / SLAKE_COMPILE_PATH_V1 | Unit walk pure Nix; not product C compile of arbitrary sources |
| Join map | **present-partial** | JoinMap.lean HOST-JOIN-MAP / SLAKE_JOIN_MAP_V0 + joinAlgUseOk | Duals read-only; stated map in join-map.md; not formal full bridge |
| Self-host direction | **present-partial** | SelfHost.lean HOST-SELF-HOST / SLAKE_SELF_HOST_V0 | Direction readiness only; separate from claim B complete |
| Product residual free (claim A) | **measured** | DualResidual + residual free measure; free **true** | Product free claimed; host elaborator residual free claimed separately (F1 dual-ok; not synonym) |
| Freestanding product self-host complete (claim B) | **measured** | SelfApplyFs freestandingProductSelfHostComplete **true** + lake proof on flip; SurfaceMatrix `rowFreestandingSelfHost` = measured | Claim B closed; not residual free synonym; inventory canary matches living tip |
| Full syntax surface (Idris + Lean cores) | **open** | -- | Progressive gates only; no day-one full syntax claim |
| Full classic elaborator parity | **measured** | SurfaceMatrix `rowFullElaborator` measured + `rowFullElaboratorMeasuredOk`; measured-bar M1-M6 met (`doc/dev/research/full-classic-elaborator-parity-measured-bar-2026-08-09.md`); package L4 four PACKAGE-ELABORATE dual-ok bands (MultExtractFoundation + MultLinearTypesProof + KernelEmitParity + **MultLinearEnv** multi-module env judgments); unit TERM Mult..Extract + PROOF Mult/Linear/Types dual-ok | Named row bar met with fail-closed dual-ok. **Not** seed-wide J1-J12 Lake-grade typecheck of full seed; not mathlib; not FullHostElaborateRemains re-true; free claimed != full Lean 4 elaborator; HostModuleCheck still PARTIAL-STRUCTURAL for most seed modules; cold lake remains diagnostic; Mult foreign link success **done** (Mult-only); residual next **Production CFG deepen** |
| Host residual free | **measured** | DualResidual hostElaboratorResidualRemains **false**; hostElaboratorResidualFreeClaimed **true**; HostResidualShrink free dual-ok; FullHostElaborateRemains **false**; lake elaborator proof on flip | F1 free dual-ok design (`doc/dev/research/host-free-dual-ok-design-2026-08-07.md`); free bar inventory (`doc/dev/research/host-residual-free-bar-inventory-2026-08-07.md`); choice (a) living bar; not product residual free re-open; not full Lean 4 / mathlib elaborator parity; not delete Lake; not proof complete; not full llvm backend |
| SpecProof / proof complete | **measured** | SpecProof.proofCompleteClaimed **true**; proofCompleteBarMet; specProofReady; lake SpecProof + SpecProofTheorems exit 0 | Track 4c residual **done** (2026-08-07); bar: Mult/Linear/HostCompose spent+joint + Types/Program/Graph + Emit plan/apply/body spent families; rewrite ready folds complete true + bar-met pin; local residualFreeClaimed false; proofs do not retire tests; Linear Token axioms remain; not full elaborator parity; not PROVABLY re-open; not full LLVM backend; report `.agents/reports/impl-proof-complete-residual-2026-08-07.md` |
| Dual formal map theorems | **present-partial** | Named edges `failClosedGrade_host_use_implies_mult_unknown_reject` and `runtimeExtract_host_use_implies_unknown_runtime_reject` in JoinMapTheorems; SurfaceMatrix `rowDualFormalMap` present-partial | Not isomorphism complete; not full dual-bridge; two product edges only; R3 mop 2026-08-10 left present-partial (no AffineDrop; no third-edge theater) |
| out/llvm-ir unlock | **measured** (unlocked) | `LlvmHold.llvmUnlocked` **true** (unlock residual + lake proof 2026-08-03); SurfaceMatrix `rowLlvm` = measured | Mult..Graph unit IR text + unit package + compose emit + optional llvm-as smoke + layout Mult-first ladder done; Mult..Graph unit CFG dual-pin + Mult DF partial + general compose CFG + R1e progressive pin; Mult..Graph foreign band-local; **not** full backend / production opt / full dominance / multi-band Rust crate |
| Full LLVM backend / CFG / SSA | **present-partial** (progressive path B **done**; fixture tip fullBackend **true** A-light) | `fullLlvmBarEvidencePartial` true (includes iterative CFG + path B; independent of tip polarity); `dominancePipelineRequiredForFullBackend` false; Done when (1)-(10) path B **met**; fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (Package 1 A-light lake); band Mult..Graph SSA / foreign FullBackend **false**; announce-bar B **met**; bar `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | Tip true is not band FullBackend true; not production opt; not DominanceClaimed; not unlock synonym. Progressive partial is not tip synonym. Production opt / DominanceClaimed false. Full readiness announce residual closed under B. |
| Rust-native link without classic FFI | **measured** (happy-path end announce **closed**; dual map **measured under named bars**) | Layout Mult-first ladder **done**; Mult..Graph foreign band-local **done** (R2); `rustIrInteropPartialClaimed` true; `rustIrInteropFullClaimed` true + `multiBandJointConsumerOk`; `just rust-ir-interop-partial` / `just rust-ir-interop-full` mandatory lake; public prose in `doc/goals.md`, `doc/vocabulary.md`, `out/llvm-ir/README.md`; dual value prose `doc/rust-entry.md` | **Value:** for Mult through Graph layout and the foreign dual-map consumer path we document, you do **not** need classic foreign-function interface (FFI) ceremony as the happy path. Dual map proves Mult..Graph size/align parity and band-local foreign success under partial + multi-band full bars. **Non-claims (same row):** not full isomorphism of Systems Lean with all of Rust; not "no FFI ever"; not formalized all of rustc; not product Rust under `src/`; not tip fullBackend synonym; classic freestanding **C** product wire (`out/freestanding-c/`) remains a permanent valid emit path |
| CompCert PROVABLY | **PROVABLY** | `just product-compcert-matrix`; `LlvmHold.provablyUnlocked` **true**; SurfaceMatrix `rowProvably` = PROVABLY | ccomp resolved; freestanding + Mult package under ccomp; lake proof on pin flip; not host residual free |
| Full Idris 2 core parity | **open** | -- | Not claimed; progressive matrix only |
| Full Lean 4 core parity | **open** | -- | Not claimed; progressive matrix only |
| Lean matrix claim-row canary lag | **done** | SurfaceMatrix freestanding + llvm inventory rows statusMeasured; openRowsOpenOk language-parity only; measuredOk + PROVABLY in matrixSurfaceOk; lake SurfaceMatrix + Theorems green | Track 1b **Matrix claim-row honesty** closed; canary matches living tip |

---

## Progressive gate composition (host)

```
matrixUnitReady hc
  = SelfHost.selfHostUnitReady hc && matrixSurfaceOk

matrixProgramReady p
  = SelfHost.selfHostProgramReady p && matrixSurfaceOk
```

Sibling bars: empty HostCompose may be matrix unit-ready; empty ordered program
is **not** matrix program-ready (EMPTY-PROGRAM-FAIL-CLOSED; P3 residual lesson).

`matrixSurfaceOk` is a constant canary: stage ids + six dual cites + host rows
present-partial + open language-parity row honesty + freestanding measured +
llvm unlock measured + PROVABLY claimed. Behavioral checks: SURFACE-MATRIX-SMOKE
Lake `example`s in `SurfaceMatrixTheorems.lean` (same namespace SurfaceMatrix).
Living claim pins for free/complete/llvm live on DualResidual / SelfApplyFs /
LlvmHold -- inventory strings match tip; not the pin SSoT alone.

---

## Non-claims

- Not day-one full Idris 2 + Lean 4 parity
- Not "superset complete"
- Product residual free is **claimed true**; host residual free is **claimed true**
  separately (F1 dual-ok; remains false / free claimed true; FullHost false);
  product free is **not** host free synonym
- CompCert **PROVABLY claimed** (see row); orthogonal to full llvm backend
- Freestanding product self-host complete is **claimed true** (claim B); not proof complete
- `llvmUnlocked` **true** with evidence; progressive Full LLVM path B **done**;
  fixture tip fullBackend **true** (Package 1 A-light); band FullBackend **false**;
  Rust IR partial + multi-band full interop pins **true**; without-classic-FFI
  happy-path end announce **measured** for Mult..Graph layout / foreign dual map;
  **not** "no FFI ever"; **not** formalized all of rustc; **not** product Rust under
  `src/`; **not** tip fullBackend synonym; **not** production opt / DominanceClaimed;
  freestanding C product wire remains permanent
- Does not invent duals under `src/idris2/` or `src/lean4/`
- Does not grow freestanding C or shell as residual progress
- SpecProof.proofCompleteClaimed **true** (Track 4c); not full elaborator parity

## Related

- Inventory research (2026-08-03): `doc/dev/research/superset-surface-inventory-2026-08-03.md`
- PARTIAL host inventory: `host-partial-inventory.md`
- Freestanding self-host acceptance: `self-host.md` (living tip table wins over
  land-time archive essays; companions hold closed history)
- Goals superset bar: `doc/goals.md` (explicit surface matrix + progressive gates)
- Residual: `RESIDUAL-systems.md`
- Plan Track 1: `.agents/plans/plan-north-star-remaining.md`
