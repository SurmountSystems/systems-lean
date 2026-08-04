# SURFACE-MATRIX -- superset surface inventory (P7)

**Greppable:** SURFACE-MATRIX, SLAKE_SURFACE_MATRIX_V0, HOST-SURFACE-MATRIX,
present-partial, open, measured, SYSTEMS_LEAN_HOST, SURFACE-MATRIX-THEOREM,
HOST-SURFACE-MATRIX-THEOREM, matrixUnitReady_empty_true,
matrixProgramReady_empty_false
**Stage:** `SLAKE_SURFACE_MATRIX_V0` / `HOST-SURFACE-MATRIX` / `SURFACE-MATRIX`
**Lean host:** `SystemsLean/SurfaceMatrix.lean` (matrixUnitReady / matrixProgramReady
dialect) + `SystemsLean/SurfaceMatrixTheorems.lean` (SURFACE-MATRIX-SMOKE +
SURFACE-MATRIX-THEOREM / HOST-SURFACE-MATRIX-THEOREM; same namespace; long-file split);
SpecProof.proofCompleteClaimed stays false
**Date evidence:** 2026-07-22 (P7 host-side surface matrix); **reseed 2026-08-03**
(superset surface inventory; living tip honesty)

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
product StillUsesLake/DependsOnLake **false**; host elaborator residual
**remains**; `llvmUnlocked` **true** (not full backend / not Rust-native link).
Inventory research: `doc/dev/research/superset-surface-inventory-2026-08-03.md`.

---

## Status vocabulary

| Status | Meaning |
|--------|---------|
| **present-partial** | Host surface exists for this row; progressive gate green; intentional PARTIAL vs full wire / full language feature |
| **measured** | Real fail-closed recipe(s) and/or living claim pin with evidence; still not full language parity or full backend unless named residual closed that |
| **PROVABLY** | Named CompCert product claim closed: resolved ccomp + green product matrix + living pin `provablyUnlocked` true with lake elaborator proof |
| **open** | Not claimed; gap stays open until named residual + evidence |

No row may be marked full Idris parity, full Lean parity, host residual free,
proof complete, or full llvm backend without its own evidence residual.
PROVABLY is only on the CompCert row. Unlock true is not full backend.

---

## Dual cite inputs (read-only; do not reimplement)

Three JOIN-ALG algorithm examples on both bridge sides:

| Algorithm | Idris side | Lean side |
|-----------|------------|-----------|
| ConsumeToken | `src/idris2/examples/ConsumeToken.idr` | `src/lean4/examples/ConsumeToken.lean` |
| ErasedIndex | `src/idris2/examples/ErasedIndex.idr` | `src/lean4/examples/ErasedIndex.lean` |
| UnrestrictedShare | `src/idris2/examples/UnrestrictedShare.idr` | `src/lean4/examples/UnrestrictedShare.lean` |

Stated dual -> Slake use map: `src/systems/join-map.md` and
`SystemsLean/JoinMap.lean` (`joinAlgUseOk` host use pins; `joinDualCiteOk`
path inventory). ConsumeToken: HostCompose mint/consume live-flag
(`consumeTokenHostUseOk`) + HOST-EMIT-LINEAR product text (Linear Token axioms
remain dual-cite on Linear.lean, not joinAlgUseOk). ErasedIndex: Erasure mark /
isRuntimeAbsent + MULT-0. UnrestrictedShare: Mult multOmega / MULT-OMEGA +
Linear.shareNat (shareNat only on this dual). Duals are not reimplemented under
`src/systems/`; dual trees stay read-only. **Do not invent a fourth dual**
without a named product map gap.

---

## Matrix rows (host progressive vs open)

| Row | Status | Host evidence | Notes |
|-----|--------|---------------|-------|
| Multiplicity surface (MULT-0 / MULT-1 / MULT-OMEGA) | **present-partial** | `SystemsLean/Mult.lean` | Closed inductive; FAIL-CLOSED-UNKNOWN-GRADE; MULT-THEOREM real theorems; not full binder-QTT source language; not SpecProof complete |
| Linear / JOIN-ALG duals (ConsumeToken + ErasedIndex / UnrestrictedShare use) | **present-partial** | HostCompose mint/consume + Erasure + Mult/shareNat via JoinMap joinAlgUseOk helpers; dualCiteOk inventory; join-map.md | Classic elaborator cannot enforce MULT-1; Linear Token axioms dual-cite only; not dual formal bridge theorems |
| Typed IR / ordered program / graph edges | **present-partial** | Types + IrProgram + IrGraph | CAP 8 / EDGE_MAX 16; List vs C arrays PARTIAL; not full CFG/SSA; not SpecProof complete |
| Erasure + extract | **present-partial** | Erasure + Extract + HostCompose.multPreScan | RUNTIME-FS extract; MULT-1 thinning intentional |
| Host compose | **present-partial** | HostCompose.lean | graph + linear + erasure; HOST-SMOKE |
| Emit plan / apply / body honesty | **present-partial** | EmitPlan + EmitApply + EmitBody + HOST-EMIT-SSOT | Frozen C wire; fragment dialect host SSoT |
| Compile path | **present-partial** | CompilePath.lean HOST-COMPILE-PATH / SLAKE_COMPILE_PATH_V1 | Unit walk pure Nix; not product C compile of arbitrary sources |
| Join map | **present-partial** | JoinMap.lean HOST-JOIN-MAP / SLAKE_JOIN_MAP_V0 + joinAlgUseOk | Duals read-only; stated map in join-map.md; not formal full bridge |
| Self-host direction | **present-partial** | SelfHost.lean HOST-SELF-HOST / SLAKE_SELF_HOST_V0 | Direction readiness only; separate from claim B complete |
| Product residual free (claim A) | **measured** | DualResidual + residual free measure; free **true** | Product free claimed; **host elaborator residual remains** (not host free) |
| Freestanding product self-host complete (claim B) | **measured** | SelfApplyFs freestandingProductSelfHostComplete **true** + lake proof on flip; SurfaceMatrix `rowFreestandingSelfHost` = measured | Claim B closed; not residual free synonym; inventory canary matches living tip |
| Full syntax surface (Idris + Lean cores) | **open** | -- | Progressive gates only; no day-one full syntax claim |
| Full classic elaborator parity | **open** | -- | Host residual remains; not claimed |
| Host residual free | **open** | DualResidual hostElaboratorResidualRemains **true** | Track 3; design **done** (`doc/dev/research/host-residual-free-design-2026-08-03.md`); free bar inventory **done** (`doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md`; section-4 not met: cold elaborate + bootstrap + DualResidual remains); Types..Compose fragment expands **done** (3b-1..4); Peer unit package ladder Mult..Compose dual-ok **done** (3b-5..3b-9); Host residual shrink inventory reseed **done** (3b-N); package Mult..Compose peer write is **not** host free; primary Open **HostPackageWrite long-file split** (hygiene; not Track 3c free flip); do not forge host free |
| SpecProof / proof complete | **open** | SpecProof.proofCompleteClaimed **false** | Track 4a inventory **done**; Track 4b HostCompose spent mult1 / IrGraph edge capacity / EmitApply desync deepen / Types multi-node mixed kinds **done**; living primary Open **HostPackageWrite long-file split** (free bar inventory **done**; not Track 3c free flip); Peer Compose unit package expand **done** (3b-9; Mult..Compose package dual-ok); Host residual shrink inventory reseed **done** (3b-N); Peer unit package Mult..Compose **done** (3b-5..9); Host Compose fragment expand **done** (3b-4); Track 3a design **done**; Track 4c complete flip held; not definitional canary theater |
| Dual formal map theorems | **open** | Three JOIN-ALG cite+use only | Track 1c when product needs a named edge; no dual invent padding |
| out/llvm-ir unlock | **measured** (unlocked) | `LlvmHold.llvmUnlocked` **true** (unlock residual + lake proof 2026-08-03); SurfaceMatrix `rowLlvm` = measured | Mult..Graph unit IR text + unit package + compose emit + optional llvm-as smoke + layout Mult-first ladder done; **not** full backend / CFG/SSA / Rust-native link / production llvm-as |
| Full LLVM backend / CFG / SSA | **open** | -- | Track 5 deferred; unlock true is not full backend |
| Rust-native link without classic FFI | **open** | Layout design + size/align + ABI parity + IR tag dual-pin **done** (Mult-first) | Link needs later dual evidence; not claimed |
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

`matrixSurfaceOk` is a constant canary: stage ids + three dual cites + host rows
present-partial + open language-parity row honesty + freestanding measured +
llvm unlock measured + PROVABLY claimed. Behavioral checks: SURFACE-MATRIX-SMOKE
Lake `example`s in `SurfaceMatrixTheorems.lean` (same namespace SurfaceMatrix).
Living claim pins for free/complete/llvm live on DualResidual / SelfApplyFs /
LlvmHold -- inventory strings match tip; not the pin SSoT alone.

---

## Non-claims

- Not day-one full Idris 2 + Lean 4 parity
- Not "superset complete"
- Product residual free is **claimed true**; free is **not** host residual free
- CompCert **PROVABLY claimed** (see row); orthogonal to full llvm backend
- Freestanding product self-host complete is **claimed true** (claim B); not proof complete
- `llvmUnlocked` **true** with evidence; **not** full backend / CFG/SSA / Rust link
- Does not invent duals under `src/idris2/` or `src/lean4/`
- Does not grow freestanding C or shell as residual progress
- SpecProof.proofCompleteClaimed stays false until Track 4 evidence residual

## Related

- Inventory research (2026-08-03): `doc/dev/research/superset-surface-inventory-2026-08-03.md`
- PARTIAL host inventory: `host-partial-inventory.md`
- Freestanding self-host acceptance: `self-host.md` (living tip table wins over
  land-time archive essays; companions hold closed history)
- Goals superset bar: `doc/goals.md` (explicit surface matrix + progressive gates)
- Residual: `RESIDUAL-systems.md`
- Plan Track 1: `.agents/plans/plan-north-star-remaining.md`
