# JOIN-MAP -- dual algorithms into Systems / Slake

**Greppable:** JOIN-MAP, HOST-JOIN-MAP, SLAKE_JOIN_MAP_V0, JOIN-ALG,
JOIN-ALG-USE, joinAlgContractOk, joinAlgUseOk, joinDualCiteOk, ConsumeToken,
ErasedIndex, UnrestrictedShare, FailClosedGrade, FAIL-CLOSED-UNKNOWN-GRADE,
LinearPairSwap, linearPairSwapHostUseOk, RuntimeExtract, runtimeExtractHostUseOk
**Lean host:** `SystemsLean/JoinMap.lean` (core dialect); theorems/smoke in
`SystemsLean/JoinMapTheorems.lean` (same namespace; long-file split).
**Product residual free true. Freestanding product self-host complete true
(claim board: `RESIDUAL-systems.md`). This map is not full formal dual-bridge
proof. Dual trees read-only for this map.**

## Purpose

Name how the dual JOIN-ALG algorithm examples are **used by Systems /
Slake**, not only cited as dual-side file paths. Dual-cite inventory alone is
not "into Slake." Host use pins live in `joinAlgUseOk`; path inventory lives in
`joinDualCiteOk`. Both fold into `joinAlgContractOk` for compile-path readiness.

---

## What the dual map already gives you (plain English)

This is a **working meet-in-the-middle map** between Idris 2 and Lean 4 for the
parts Systems Lean cares about. It is **not** a finished math proof that the two
languages are the same. **CHI readiness (2026-08-11):** JOIN-ALG dual presence
gates (`just idris-side`, `just lean-side`) and living JOIN value prose are
green and lockstep under this honesty bar -- still present-partial formal map,
not isomorphism complete.

**Already useful:**

1. **Same three-grade story on both sides.** Compile-time-only (MULT-0), use-once
   linear (MULT-1), and unrestricted ordinary data (MULT-OMEGA). Labels can differ
   (Idris people often say "unrestricted"; join docs say "omega"), but the shape
   matches.
2. **Six paired algorithms (JOIN-ALG).** For each name below there is a real
   Idris source and a real Lean source that tell the same story: ConsumeToken,
   ErasedIndex, UnrestrictedShare, FailClosedGrade, LinearPairSwap,
   RuntimeExtract.
3. **Imperfect edges are written down.** Lean `Prop` erasure is not Idris
   quantity 0. Classic Lean does not enforce exact-once use. Stock hosts still
   carry a managed runtime. Product talk includes affine (at most once) while
   public Idris grades do not. See `doc/divergence.md`. **AffineDrop** dual
   pair under `src/idris2/examples/AffineDrop.idr` and
   `src/lean4/examples/AffineDrop.lean` **documents** EDGE-AFFINE honesty
   (checkable dual sketches). **AffineOwn** dual pair under
   `src/idris2/examples/AffineOwn.idr` and `src/lean4/examples/AffineOwn.lean`
   deepens product ownership (two affine resources; PRODUCT-OWN). Dual-tree
   honesty only -- not freestanding product affine ABI and not host JOIN-ALG-USE
   pins.
4. **Systems host uses the map.** Six algorithm uses pin into Mult / Linear /
   Erasure / HostCompose / Extract and fold into compile-path readiness. That is
   "into Slake," still partial, not a full bridge proof.
5. **Two thin formal edges (present-partial).** Host theorems connect
   FailClosedGrade host use to unknown Mult tag reject, and RuntimeExtract host
   use to unknown runtime tag reject. Not "the correspondence is fully proved."

**Do not believe from this map alone:** that Idris and Lean cores are formally
isomorphic; that classic Lean enforces linear resources; that dual examples are
freestanding product C; that full product affine ABI is shipped because
AffineDrop / AffineOwn duals are documented; that full elaborator or mathlib
parity is claimed here.

Detail of imperfect edges: `doc/divergence.md`. Dual trees: `src/idris2/` and
`src/lean4/` (read-only from Systems residual).

---

## Stated map (dual algorithm -> Systems / Slake use)

| Dual algorithm | Host use (Systems Lean; matches joinAlgUseOk) | Product wire (honesty) |
|----------------|-----------------------------------------------|------------------------|
| **ConsumeToken** | `HostCompose` mint/consume live-flag (`hostMintConsumeOnceOk` / `consumeTokenHostUseOk`); empty LinearHost not live. Linear.Token / mkToken / consume / roundTrip stay dual-cite axioms on `Linear.lean` (not joinAlgUseOk pins; noncomputable) | `slake_consume_token_*` / `slake_linear_token_*` via **HOST-EMIT-LINEAR** (`EmitLinear` + `host_emit_linear.ssot.txt`) |
| **ErasedIndex** | `Erasure` mark / `isRuntimeAbsent` / `isErasureGrade` MULT-0 (`erasedIndexHostUseOk`) | `slake_erasure_is_runtime_absent` / `slake_erased` via **HOST-EMIT-ERASURE** (`EmitErasure` + `host_emit_erasure.ssot.txt`) |
| **UnrestrictedShare** | `Mult` `multOmega` / `name` MULT-OMEGA + `Linear.shareNat` unrestricted sketch (`unrestrictedShareHostUseOk`; shareNat only here) | MULT-OMEGA grade surface (`slake_mult` / `EmitMult` name table) |
| **FailClosedGrade** | `Mult.ofNat?` / `isValidTag` unknown-tag reject (`failClosedGradeHostUseOk`); FAIL-CLOSED-UNKNOWN-GRADE | Closed Mult enum on product wire (`slake_mult` raw tags 0/1/2 only) |
| **LinearPairSwap** | PARTIAL: `hostMintConsumeOnceOk` + `hostSingleLiveRemintRejectOk` (`linearPairSwapHostUseOk`); HostCompose single live-token | Multi-token product C stages **not** claimed; dual names two MULT-1 resources |
| **RuntimeExtract** | `Extract.isFreestandingGoal` / `RuntimeClaim` / `ofRuntimeTag?` (`runtimeExtractHostUseOk`); RUNTIME-FS only | Product extract FS path; stock hosts still managed residual |

**Use vs dual-cite:**

| Evidence class | What it proves | What it does not |
|----------------|----------------|------------------|
| `joinDualCiteOk` | Dual example paths exist under `src/idris2/examples/` and `src/lean4/examples/` (string inventory) | That Systems / Slake implements or walks those duals |
| `joinAlgUseOk` | Host modules Mult / Linear / Erasure / HostCompose are linked into the join bar with behavior pins | Full formal bridge proof or MULT-1 elaborator enforcement |
| Dual trees | Read-only upstream-style examples for meet-in-the-middle honesty | Editable product sources for this residual |

---

## Dual path inventory (read-only)

| Algorithm | Idris side | Lean side |
|-----------|------------|-----------|
| ConsumeToken | `src/idris2/examples/ConsumeToken.idr` | `src/lean4/examples/ConsumeToken.lean` |
| ErasedIndex | `src/idris2/examples/ErasedIndex.idr` | `src/lean4/examples/ErasedIndex.lean` |
| UnrestrictedShare | `src/idris2/examples/UnrestrictedShare.idr` | `src/lean4/examples/UnrestrictedShare.lean` |
| FailClosedGrade | `src/idris2/examples/FailClosedGrade.idr` | `src/lean4/examples/FailClosedGrade.lean` |
| LinearPairSwap | `src/idris2/examples/LinearPairSwap.idr` | `src/lean4/examples/LinearPairSwap.lean` |
| RuntimeExtract | `src/idris2/examples/RuntimeExtract.idr` | `src/lean4/examples/RuntimeExtract.lean` |
| AffineDrop (JOIN-EDGE only) | `src/idris2/examples/AffineDrop.idr` | `src/lean4/examples/AffineDrop.lean` |
| AffineOwn (JOIN-EDGE only) | `src/idris2/examples/AffineOwn.idr` | `src/lean4/examples/AffineOwn.lean` |

**AffineDrop:** dual-tree EDGE-AFFINE honesty pair **documented** (Wave 1 B). Not
in `joinAlgUseOk` host pins. Not freestanding product affine ABI. Not freestanding C.

**AffineOwn:** product ownership deepen of EDGE-AFFINE **documented** (2026-08-11).
Multi-resource PRODUCT-OWN sketches (use-one-drop-other, drop both). Not in
`joinAlgUseOk` host pins. Not freestanding product affine ABI. Not freestanding C.

**EDGE-AFFINE dual pair sufficient (R4 2026-08-11):** AffineDrop + AffineOwn are
the full product-meaningful EDGE-AFFINE dual-tree surface for dual honesty.
Contrast duals already exist (LinearPairSwap exact-once; UnrestrictedShare
MULT-OMEGA; ConsumeToken). Do **not** invent AffineShare/Copy, N-tuple AffPair
theater, or AffineBorrow duals without a product affine ABI residual. Full
product affine ABI and host JOIN-ALG-USE for affine remain **held**.

Do **not** reimplement duals under `src/systems/`. Do **not** edit dual trees
from Systems residual slices (except named dual residual work owned by dual forks).

---

## Executable composition

- `joinAlgContractOk` = stage/map ids && `joinDualCiteOk` && `joinAlgUseOk`
- `joinUnitCompileReady hc` = `CompilePath.unitCompileReady hc` && `joinAlgContractOk`
- `joinProgramCompileReady p` = `CompilePath.programCompileReady p` && `joinAlgContractOk`
- Sibling bars: empty HostCompose may be unit-ready; empty program is not program-ready

Theorems / smoke: JOIN-MAP-THEOREM / JOIN-MAP-SMOKE in `JoinMapTheorems.lean`
(same namespace; `joinAlgUseOk_true`, `joinAlgContractOk_true`, empty host/program
fixtures). Core bars stay in `JoinMap.lean`.

---

## Intentional non-claims

- Product residual free and freestanding product self-host complete are **true**
  on the claim board (`RESIDUAL-systems.md`). This join-map is not that proof
  surface and does not re-open free/complete false.
- Not full formal dual-bridge theorems (Idris core isomorphic to Lean core).
  Dual formal map is **present-partial** (two named edges only).
- **PROVABLY** is product CompCert wire correctness elsewhere, not a claim that
  this dual map is complete.
- Classic Lean still cannot enforce MULT-1 / LINEAR-EXACT-ONCE.
- Dual residual on Idris side / Lean side remains separate. AffineDrop and
  AffineOwn dual-tree honesty is **documented** (EDGE-AFFINE pairs; AffineOwn
  adds PRODUCT-OWN multi-resource ownership); full product affine ABI remains
  **held**. Dual algorithm examples are not freestanding product C.
