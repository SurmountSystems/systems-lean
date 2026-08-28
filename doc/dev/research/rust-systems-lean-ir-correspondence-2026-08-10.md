# Rust / Systems Lean IR correspondence (2026-08-10)

**Kind: residual-backed analysis.** Partial dual-pin residual landed
(`SystemsLean.RustIrInterop`; `rustIrInteropPartialClaimed` true). Multi-band
joint full residual landed (`rustIrInteropFullClaimed` true;
`multiBandJointConsumerOk`; `just rust-ir-interop-full`). Full is multi-band
joint dual map of Mult..Graph i32 contracts, **not product Rust** under `src/`.
Not formalization of rustc (and not formalized all of rustc). Not full LLVM
production backend. Not free / complete / PROVABLY flip.

ASCII only. Plain English. Date: 2026-08-10 (full multi-band update same day).
Living tip refresh: Lean-Rust **value prose** 2026-08-10 (finish-as-best dual map
honesty; no C1 surface-matrix announce flip).

### Living tip: value for a stranger reader

The Lean 4 to Rust correspondence is **measured under named bars** (partial +
multi-band full true). It is **not** a full isomorphism of Systems Lean with all
of Rust.

| Proved under the bars | Still not claimed |
|-----------------------|-------------------|
| Mult..Graph layout size 4 / align 4 parity on `x86_64-unknown-linux-gnu` | Formalizing all of rustc |
| Band-local foreign link success for Mult, Linear, Types, Program, Graph | Product Rust under `src/` |
| Joint partial claim + multi-band full claim on host Lean dual-pins | Tip fullBackend as synonym of this dual map |
| Optional `/tmp` rustc dogfood when rustc is on PATH | Complete isomorphism of Systems Lean with all of Rust; "no FFI ever" |
| Without-classic-FFI happy path for Mult..Graph dual-map consumers (C1) | Monorepo Rust product crate; tip fullBackend synonym |

Gates: `just rust-ir-interop-partial`, `just rust-ir-interop-full`,
`just systems-llvm-ir`, `just hygiene`. Entry: `doc/rust-entry.md`. Consumer tip:
`out/llvm-ir/README.md`.

**Greppable:** `RUST-IR-INTEROP`, `RUST-SYSTEMS-LEAN-CORRESPONDENCE`,
`RUST-IR-INTEROP-PARTIAL`, `RUST-IR-INTEROP-FULL`, `HOST-RUST-IR-INTEROP`,
`SLAKE_RUST_IR_INTEROP_PARTIAL_V0`, `SLAKE_RUST_IR_INTEROP_FULL_V0`,
`rustIrInteropPartialClaimed`, `rustIrInteropFullClaimed`,
`MULTI-BAND-JOINT-CONSUMER`, `multiBandJointConsumerOk`,
`rust-ir-interop-partial`, `rust-ir-interop-full`, Mult..Graph foreign success,
LAYOUT-SIZE-ALIGN-FIXTURE, LAYOUT-IR-TAG-DUAL-PIN

**Entry map:** `doc/rust-entry.md`
**Layout design:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Full LLVM bar:** `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`
**Host module:** `src/systems/SystemsLean/RustIrInterop.lean`
**Read-only rustc:** `ref/rust/` (do not edit as product)

---

## 1. Intent

State a progressive **formal correspondence** between Systems Lean host models
and Rust layout / LLVM IR contracts so Slake-generated IR is **directly
provably intercompatible** with what a Rust consumer (via rustc on a named
target) can construct and check.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Provably intercompatible (partial)** | Size, align, and discriminants / status codes agree across host Lean dual-pins, freestanding/unit/SSA LLVM IR, Mult layout fixture, and optional out-of-tree rustc dogfood for Mult..Graph bands |
| **Provably intercompatible (full multi-band)** | One host dual-pin (`multiBandJointConsumerOk`) and one multi-band single out-of-tree consumer cover Mult + Linear + Types + Program + Graph **together** with lake + pure Nix; still only our i32 Mult..Graph contracts |
| **Formal correspondence (Curry-Howard style map)** | Host Lean **types and proofs** that connect Mult/Linear/Types/Program/Graph foreign consumer contracts to the same numeric layout/IR contracts a Rust `#[repr(i32)]` (or honest status-code) surface expects. Checkable bools and theorems, not math theater |
| **Not formalized all of rustc** | Full does **not** mean every Rust type, every ABI, or a formalization of rustc. Complete isomorphism of Systems Lean with all of Rust stays **never claimed** |

---

## 2. What "Curry-Howard correspondence" means in this product

In plain technical American English:

1. **Host types** name the contracts (size 4, align 4, tag/status encodings,
   target triple `x86_64-unknown-linux-gnu`, band-local codes).
2. **Host proofs / decidable bools** (`native_decide` theorems) show those
   contracts agree with Mult..Graph foreign success modules and Mult layout/IR
   dual evidence already on disk.
3. **Executable check** (pure Nix presence + just recipe + optional `/tmp`
   rustc dogfood) is the experimental twin of the formal dual-pin.

That is the correspondence: propositions-as-types for **our** dual map, not a
claim that rustc's whole IR is in Lean.

---

## 3. Progressive ladder (evidence rungs)

| Rung | Status | Gate / module |
|------|--------|---------------|
| Mult layout size/align fixture | **done** | `LAYOUT-SIZE-ALIGN-FIXTURE` research |
| ABI parity + layout IR tag dual-pin | **done** | `just abi-parity-smoke`; `just layout-ir-dual-pin` |
| Mult layout/IR consumer success partial | **done** | `just mult-layout-ir-success` |
| Mult foreign link success | **done** | `just mult-foreign-link-success`; `MultForeignLink` |
| Linear foreign link success | **done** | `just linear-foreign-link-success`; `LinearForeignLink` |
| Types foreign link success | **done** | `just types-foreign-link-success`; `TypesForeignLink` |
| Program foreign link success | **done** | `just program-foreign-link-success`; `ProgramForeignLink` |
| Graph foreign link success | **done** | `just graph-foreign-link-success`; `GraphForeignLink` |
| **Joint partial interop claim** | **done** | `just rust-ir-interop-partial`; `RustIrInterop`; `rustIrInteropPartialClaimed` true |
| **Multi-band joint full interop claim** | **done** | `just rust-ir-interop-full`; `multiBandJointConsumerOk`; `rustIrInteropFullClaimed` true |

Mult..Graph foreign success is the progressive ladder toward IR-level
intercompat: each band dual-pins its own status or tag encoding against unit IR
and SSA, with optional rustc `#[repr(i32)]` dogfood under `/tmp`. Full adds one
joint dual-pin and one multi-band single consumer that names all five bands
together.

---

## 4. Multi-band single consumer (full claim evidence)

| Surface | Role |
|---------|------|
| Host Lean `multiBandJointConsumerOk` | Requires Mult..Graph foreign dual agreements + shared size 4 / align 4 / triple / i32 encoding + `MULTI-BAND-JOINT-CONSUMER` name + full claim true + fullBackend false |
| Pure Nix `nix/systems-llvm-ir/rust-ir-interop-full.nix` | Presence of full pin tokens; forbids full=false and fullBackend=true |
| `just rust-ir-interop-full` | **Mandatory lake** build of `SystemsLean.RustIrInterop` + optional multi-band `/tmp` rustc dogfood |
| Out-of-tree dogfood | One temporary crate: MultTag + LinearClassTag + TypesKindTag + ProgramPushStatus + GraphAddEdgeStatus + PROGRAM_CAP=8 + EDGE_MAX=16 |

**Honesty:** this is multi-band joint dual map of **our** Mult..Graph i32 contracts.
It is **not** a monorepo Rust product crate, **not product Rust** under `src/`,
and **not formalized all of rustc**.

---

## 5. Why out-of-tree rustc dogfood + host dual-pin (not product Rust)

| Rule | Reason |
|------|--------|
| **Three languages only** | Novel product work is Idris 2, Lean 4, pure Nix. Product Rust under `src/` is forbidden |
| **`ref/rust` read-only** | rustc_abi and friends are the layout reference; do not fork rustc in-tree |
| **Out-of-tree `/tmp` dogfood** | Optional measured check when `rustc` is on PATH; RED if size/align/codes disagree; SKIP if missing; never a monorepo crate farm |
| **Host dual-pin is SSoT** | Lean bools + pure Nix presence survive CI without requiring rustc on every machine |

This is the product path for "provably intercompatible": dual agreement of
contracts, not shipping a Rust crate as Systems Lean.

---

## 6. What remains after full multi-band claim

| Remaining | Status |
|-----------|--------|
| Multi-band single consumer + joint dual map (Mult..Graph i32) | **claimed** (`rustIrInteropFullClaimed` true) |
| Stable ABI freeze of all Rust types beyond i32 Mult..Graph contracts | **not claimed** (out of full residual Done when) |
| Without-classic-FFI happy path as end announce | **measured** under completeness C1 for Mult..Graph dual-map consumers (not "no FFI ever"; not tip fullBackend synonym) |
| Complete isomorphism Systems Lean <-> all of Rust | **never claimed** |
| `fullBackend` true | **false**; bar item (7) intercompat evidence met at partial and full multi-band; full readiness announce residual **closed under bar B** (announce does not require fullBackend true); fullBackend remains optional future Option A only |

---

## 7. Relation to full LLVM production backend bar

`doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` names what
`fullBackend` true requires. This residual adds honesty:

- **fullBackend requires Rust IR intercompat evidence** at least at the
  **partial** pin; multi-band **full** strengthens bar item (7) but is **not**
  a synonym for fullBackend.
- Full readiness announce residual closed under announce-bar B (2026-08-10):
  announce may proceed while fullBackend stays false; Option A (lake flip) is
  optional future only.
- Do **not** forge `fullBackend` true from this correspondence alone.
- Do **not** claim complete isomorphism of all of Rust from multi-band dual-pins.

---

## 8. Living pins after full multi-band residual

| Pin | Value |
|-----|-------|
| `rustIrInteropPartialClaimed` | **true** |
| `rustIrInteropFullClaimed` | **true** |
| `multiBandJointConsumerOk` | **true** (host dual-pin) |
| `rustIrInteropFullBackendClaimed` | **false** |
| Mult..Graph foreign `*SuccessClaimed` | **true** (band-local) |
| Mult..Graph foreign `*FullBackendClaimed` | **false** |
| free / complete / PROVABLY / FullHostElaborateRemains | **unchanged** |

Gates: `just hygiene`; `just systems-llvm-ir`; `just rust-ir-interop-partial`;
`just rust-ir-interop-full` (mandatory lake); `lake build SystemsLean.RustIrInterop`;
regression `just mult-foreign-link-success` and `just graph-foreign-link-success`.
