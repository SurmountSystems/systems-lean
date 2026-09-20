<!--
  Kind: analysis only. Not residual.
  QTT use-check inventory (2026-09-17). Named surfaces: ConsumeToken then
  UnrestrictedShare. Not all-types use-check.
-->

# QTT use-check inventory (2026-09-17)

**Kind:** analysis only. Not residual.

**Date:** 2026-09-17

**Audience:** Systems / Slake implementers after compaction.

North star: Slake checks all types with linear types. This note is inventory plus
named surfaces (ConsumeToken then UnrestrictedShare). It does **not** claim
all-types use-check.

QTT grades (Idris 2 style): **0** erased, **1** used once (linear), **omega**
unrestricted.

Honesty split:

- **Live-flag exact-once** = mint/consume state machine (one `live` Bool per host
  handle). Exists. That is **not** QTT binder use-check.
- **QTT use-check** = count uses of a grade-1 binder / named token (0 = drop fail,
  1 = ok, 2+ = double-spend fail). Residual living metric for all-types use-check
  stays **not started**.

Classic Lean will not reject double `consume` on `SystemsLean.Linear` axioms.
Idris `LinearCheck` on `src/idris2/examples/ConsumeToken.idr` is Idris, not Slake.

---

## Surfaces WITH live-flag exact-once (not a QTT binder walk)

| Surface | What exists | Kind |
|---------|-------------|------|
| HostCompose live-flag | mint rejects id 0 and already-live; consume clears live and scrubs id; second consume is `notLive` | Host Lean state machine (`HostCompose.mint` / `consume`; theorems `double_consume_notLive`, `mint_consume_exact_once_sequential`) |
| KernelLinear host path | Bool AND-fold of unminted fail, minted check/extract ok, after-consume fail, mint-0 reject, double-mint reject | Host Lean fixture (`KernelLinear.linearHostPathReady`) |
| JoinMap ConsumeToken use | mint then consume once returns payload and clears live | Host Lean pin (`hostMintConsumeOnceOk`, `consumeTokenHostUseOk`) |
| CompilePath Linear fixture | 1-node MULT-1 LINEAR, then mint so `unitCompileReady` | Host fixture using HostCompose |
| Product C linear token | live flag; second consume returns -2 | Runtime C (`slake_linear_consume`); do not grow this C |
| Behavioral probe | init / live / consume once / second consume -2 | Hosted C probe (`just systems-cc-probe`) |
| Idris dual ConsumeToken | `(1 t : Token)` consume; commented `doubleSpend` / `dropToken` must fail LinearCheck | Stock Idris LinearCheck, **not Slake** |
| Emit plan/body/apply | MULT-1 unminted and spent graphs fail-closed | Emit readiness, live-flag reuse |

---

## Surfaces WITHOUT QTT use-check

| Surface | What it has instead | Missing |
|---------|---------------------|---------|
| `SystemsLean.Linear` Token / mkToken / consume | Axioms + class-id pins (`LINEAR-EXACT-ONCE`, `LINEAR-AXIOMS-REMAIN`) | No use-count of Token in a term; Lean does not LinearCheck |
| `src/lean4/examples/ConsumeToken.lean` | Same axiom sketch | Dual honesty only |
| Mult | Closed inductive `mult0` / `mult1` / `multOmega` | Grade tags, not use counts |
| Types | `kindMultOk` (LINEAR kind pairs with MULT-1) | Pairing, not uses of a binder |
| Erasure | Mark / `isRuntimeAbsent` for MULT-0 | Erasure, not linear use |
| IrProgram / IrGraph | Node list + edges; well-typed pairing | No per-node consume log / use count |
| HostModuleCheck / occupancy | Module membership / compile-order | Not a linearity checker |
| CompilePath units | Unit compile-path fixtures | Linear fixture still uses HostCompose mint |
| LinearSubsetEmit / emit C text | Requires `slake_linear_consume` **string** in package | Presence of API names, not a checker |
| LLVM `slake_linear.ll` / SSA | Class tags + live-flag IR text | Not a use-check |
| Affine (at most once / drop) | Pin `AFFINE-NOT-FIRST-CLASS` | Affine not first-class on product wire |
| LinearPairSwap dual | Two MULT-1 resources on Idris; host is one live token | No multi-token use-check |
| Slake elaborator | Occupancy 49 modules; FullHost false | Does not typecheck with linear types |

`src/systems/linear.md` still says **No full use-checker body here**. The first
named surface below is not a full checker.

Goals bar (not met): binder mult + use-check + tests for all types
(`doc/goals.md`).

---

## First named surface

**Name:** ConsumeToken exact-once use-check

**Module:** `src/systems/SystemsLean/UseCheck.lean` (`SystemsLean.UseCheck`)

**Contract:** tiny usage log of consume events for **one** named MULT-1 token id:

| Consume count for that id | Result |
|---------------------------|--------|
| 0 | drop fail |
| 1 | ok |
| 2 or more | double-spend fail |

Greppable honesty token: `QTT-USE-CHECK-CONSUME-TOKEN`.

Live gate: `just systems-host` (pure Nix `nix/systems-host-presence/`).

This reuses the **idea** of sequential exact-once (HostCompose consume engine is
live-flag, not this log). Do not pretend Types pairing or occupancy is use-check.

---

## Second named surface

**Name:** UnrestrictedShare omega use-check

**Module:** `src/systems/SystemsLean/UseCheck.lean` (`SystemsLean.UseCheck`)

**Contract:** tiny usage log of use events for **one** named MULT-OMEGA id:

| Use count for that id | Result |
|-----------------------|--------|
| 0 | drop ok |
| 1 | ok |
| 2 or more | share ok |

Same counts on ConsumeToken stay drop fail / ok / double-spend fail.

Greppable honesty token: `QTT-USE-CHECK-UNRESTRICTED-SHARE`.

Live gate: `just systems-host` (pure Nix `nix/systems-host-presence/`).

JoinMap `unrestrictedShareHostUseOk` is Mult omega plus `shareNat`, not this log.
Do not pretend that pin is QTT binder use-check.

---

## Non-claims

- Not all-types use-check. Residual metric for that work stays not started.
- Not isomorphism complete.
- Not Idris LinearCheck as Slake.
- Not FullHost. Occupancy stays 49 names. Lake-gone unclaimed.
- Not free / complete / PROVABLY flips.
- Not affine ABI. Not LinearPairSwap two-token. Not eliminating Linear.Token axioms.
- Not growing hand-written C. Not occupancy lockstep.

---

## Related paths

- Explore notes: `/home/hunter/.agents/reports/l3-qtt-use-check-explore.md`
- Linear unit notes: `src/systems/linear.md`
- Host live-flag: `src/systems/SystemsLean/HostCompose.lean`
- Linear axioms: `src/systems/SystemsLean/Linear.lean`
