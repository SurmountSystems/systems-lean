# Layout size/align fixture (2026-08-03)

Kind: fixture / analysis. Not residual invent beyond the named residual program.
Not Rust-native link success. Not classic-FFI-free success. Not host elaborator
residual free. Not proof complete. Not product C growth. Not forge free /
complete / PROVABLY. Not production llvm-as path. Living `llvmUnlocked` stays
**true** (unchanged by this fixture). ABI parity smoke is a separate residual
(now done via `just abi-parity-smoke`).

ASCII only. Plain English. Date: 2026-08-03.

**Greppable:** `LAYOUT-SIZE-ALIGN-FIXTURE`, `LAYOUT-IR-TAG-DUAL-PIN`, MULT-0,
MULT-1, MULT-OMEGA

**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Entry map:** `doc/rust-entry.md`
**Mult SSOT:** `src/systems/SystemsLean/Mult.lean`
**IR tags:** `out/llvm-ir/slake_mult.ll`
**Freestanding Mult unit:** `src/systems/emit/slake_mult_subset.h`
**Read-only rustc:** `ref/rust/compiler/rustc_abi/`, `ref/rust/compiler/rustc_target/`

---

## 1. Intent

Mult-first **size and alignment fixture** for a small named type set on a
**documented target**, checked against rustc_abi / target data-layout rules
(and optional measured Rust reference method outside product git).

This fixture is a durable research table. It does **not** claim Rust-native
link or layout dual-pin complete. ABI parity smoke is a separate residual
(now done via `just abi-parity-smoke`).

---

## 2. Target (documented)

| Field | Value |
|-------|--------|
| **Target triple (assumed)** | `x86_64-unknown-linux-gnu` |
| **Pointer width** | 64 |
| **Endian** | little (`e` in data-layout) |
| **rustc target SSOT (read-only)** | `ref/rust/compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs` |
| **LLVM data-layout string (that file)** | `e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128` |

**Assumptions (honest):**

1. Layout numbers below are for the **named** Linux x86_64 gnu target above.
   Other triples may differ (especially pointer size/align, enum min size).
2. Mult grade **tag encoding** in product IR is LLVM `i32` (see
   `out/llvm-ir/slake_mult.ll`). That matches rustc `Integer::I32` size/align
   on this target, not a packed 2-bit discriminant.
3. Freestanding C `enum slake_mult` is treated as a **C ABI enum** with small
   positive discriminants 0/1/2. rustc default `c_enum_min_size` is
   `Integer::I32` (`TargetDataLayout` default in rustc_abi). On this platform
   that is size 4 / align 4 -- same as the IR i32 tag encoding.
4. Host Lean inductive `Mult` is **not** a freestanding wire layout; wire
   layout is IR tags + freestanding C enum / product wire. Lean constructors
   are cited only for grade name SSOT (MULT-0 / MULT-1 / MULT-OMEGA).

---

## 3. Cite method (how sizes/aligns are derived)

| Rule | Path / fact (read-only under `ref/rust`) | Result on this target |
|------|------------------------------------------|------------------------|
| Integer size of `I32` | `ref/rust/compiler/rustc_abi/src/lib.rs` -- `Integer::size`: `I32 => Size::from_bytes(4)` | size **4** bytes |
| Integer align of `I32` | same file -- `Integer::align` uses `dl.i32_align`; `TargetDataLayout::default` sets `i32_align: Align::from_bits(32)` | align **4** bytes |
| Target data-layout | `x86_64_unknown_linux_gnu.rs` data_layout string (little-endian; does not override i32 to a non-32-bit align) | consistent with default i32_align 32 bits |
| C enum min size | `TargetDataLayout::default` -- `c_enum_min_size: Integer::I32` (`rustc_abi/src/lib.rs`) | C enums at least i32 on default layout |
| Product IR dual check | `out/llvm-ir/slake_mult.ll` -- `@slake_mult_tag_* = ... constant i32 ..., align 4` | generator already states size/align of the tag constant |

**Measured Rust reference method (optional, outside product git -- not run as
product residual):** a tiny throwaway crate may define:

```rust
#[repr(i32)]
enum MultTag { Mult0 = 0, Mult1 = 1, MultOmega = 2 }

// expected: size_of::<MultTag>() == 4, align_of::<MultTag>() == 4
// expected: size_of::<i32>() == 4, align_of::<i32>() == 4
// on x86_64-unknown-linux-gnu
```

Do **not** add a product Rust crate in this repository. Prose + rustc_abi
cites are the durable fixture evidence for this residual.

**Not used:** editing `ref/rust`; inventing sizes without cite; claiming
`repr(Rust)` stability.

---

## 4. Mult-first surface honesty

| Surface | What exists today | Fixture treatment |
|---------|-------------------|-------------------|
| Mult grade tags | IR `i32` constants 0/1/2; Lean `Mult.ofNat?` 0/1/2; names MULT-0 / MULT-1 / MULT-OMEGA | **Primary rows** -- tag encoding size/align |
| Freestanding Mult enum | `enum slake_mult` in Mult subset header + full freestanding wire (HOST-EMIT-MULT) | **Primary row** -- same numeric encoding; C enum layout |
| Mult freestanding **structs** | No Mult-only product struct beyond the grade enum. Mult appears as a **field** in later-stage bundles (e.g. `slake_check_bundle` under extract SSOT) | Stated honestly: Mult-first layout is **tags + enum**, not a Mult-owned aggregate. Bundle layout is **out of Mult-first scope** (Extract / multi-unit) |

Linear / Types kind tags use the same `i32` pattern in `slake_linear.ll` /
`slake_types.ll` but are **not** Mult-first fixture expansion in this residual
(design default: Mult scalars first).

---

## 5. Fixture table

Target: **x86_64-unknown-linux-gnu** (section 2).

| Type name | Size (bytes) | Align (bytes) | Cite | Notes |
|-----------|--------------|---------------|------|-------|
| Mult grade tag encoding (LLVM `i32`) | 4 | 4 | rustc_abi `Integer::I32` size/align (`ref/rust/compiler/rustc_abi/src/lib.rs`); target data-layout `x86_64_unknown_linux_gnu.rs`; dual IR `out/llvm-ir/slake_mult.ll` `@slake_mult_tag_* ... i32 ... align 4` | Wire/IR representation of grades. Values: 0=MULT-0, 1=MULT-1, 2=MULT-OMEGA |
| MULT-0 tag value | 4 | 4 | same as Mult grade tag encoding | Discriminant **0**; name string `"MULT-0"` from `Mult.name` / `slake_mult_name` -- name string is not the tag layout |
| MULT-1 tag value | 4 | 4 | same | Discriminant **1** |
| MULT-OMEGA tag value | 4 | 4 | same | Discriminant **2** (not a separate pointer-sized omega payload on freestanding Mult surface) |
| `enum slake_mult` (freestanding C) | 4 | 4 | rustc_abi `c_enum_min_size: I32` + `Integer::I32` size/align; product header `src/systems/emit/slake_mult_subset.h` (`SLAKE_MULT_0=0`, `SLAKE_MULT_1=1`, `SLAKE_MULT_OMEGA=2`); Mult.lean documents raw tags aligned with freestanding C enum | Mult freestanding grade enum. Matches IR i32 tag encoding on this target. Optional measure: `#[repr(i32)]` Rust enum mapping (section 3) |
| `i1` Mult validity return (IR only) | 1 | 1 | LLVM IR `i1` for `@slake_mult_is_valid_tag` return; Rust `bool` is 1/1 on this target per common rustc layout (Primitive integer 8-bit); not Mult grade payload | Predicate result only; not a Mult grade |

**Greppable row ids (for later dual-pin):**
`LAYOUT-SIZE-ALIGN-FIXTURE` + `MULT-0` / `MULT-1` / `MULT-OMEGA` + sizes **4** / align **4**.

---

## 6. Cross-cites (SSOT map)

| Role | Path |
|------|------|
| Design bar / residual Names | `doc/dev/research/rust-native-layout-design-2026-08-03.md` |
| Rust entry | `doc/rust-entry.md` |
| Mult host SSOT | `src/systems/SystemsLean/Mult.lean` (inductive Mult; `name`; `ofNat?`; FAIL-CLOSED-UNKNOWN-GRADE) |
| Mult IR tags | `out/llvm-ir/slake_mult.ll` |
| Mult freestanding unit header | `src/systems/emit/slake_mult_subset.h` |
| Mult freestanding unit body | `src/systems/emit/slake_mult_subset.c` |
| rustc_abi core | `ref/rust/compiler/rustc_abi/src/lib.rs` (`Integer`, `TargetDataLayout`) |
| Target | `ref/rust/compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs` |

---

## 7. Non-claims

| Must not claim | Why |
|----------------|-----|
| Rust-native link success | Fixture only; link needs dual evidence residual later |
| Without classic FFI shipped / classic-FFI-free success | Design happy path is still open after fixtures |
| Full ABI parity smoke | Residual **done** (`just abi-parity-smoke`); not full calling-convention matrix |
| Layout IR tag dual-pin complete | Residual **done** (`just layout-ir-dual-pin`; pure Nix `nix/systems-llvm-ir/layout-ir-dual-pin.nix`) |
| Stable `extern "Rust"` / full `repr(Rust)` freeze | Upstream Rust ABI unstable |
| Full CFG / SSA / production llvm-as | Separate tracks |
| Host elaborator residual free | Dual residual; unchanged |
| Proof complete (`proofCompleteClaimed`) | Unchanged |
| free / complete / PROVABLY re-open or re-false | Stay true |
| Product StillUsesLake / DependsOnLake true | Stay false |
| Living `llvmUnlocked` false | Stay true |
| Hand-authored product C growth | Forbidden |
| Editing `ref/rust` as product | Read-only |

---

## 8. Success for this fixture residual

1. This research fixture on disk under `doc/dev/research/`.
2. Mult-first rows for grade tag encoding + freestanding `enum slake_mult` with
   size/align and rustc_abi / IR cites.
3. Residual **Layout size/align fixture** marked **done**; Open advanced to
   **ABI parity smoke** (now **done** via `just abi-parity-smoke`).
4. free / complete / PROVABLY / product Lake pins / host residual / living
   `llvmUnlocked` **unchanged**.
5. `just hygiene` green on novel markdown.
6. Does **not** claim Rust-native link success without classic FFI.

---

## 9. Layout IR tag dual-pin (done; Mult primary)

**Greppable dual-pin token:** `LAYOUT-IR-TAG-DUAL-PIN`

| IR constant (generator-owned) | Fixture row | Values |
|-------------------------------|-------------|--------|
| `@slake_mult_tag_0` | MULT-0 tag value | i32 **0**, size **4**, align **4** |
| `@slake_mult_tag_1` | MULT-1 tag value | i32 **1**, size **4**, align **4** |
| `@slake_mult_tag_omega` | MULT-OMEGA tag value | i32 **2**, size **4**, align **4** |

Full IR lines (fail-closed dual-pin via pure Nix
`nix/systems-llvm-ir/layout-ir-dual-pin.nix` + `just layout-ir-dual-pin`):

```
@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4
@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4
@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4
```

Fixture already cites `slake_mult_tag_` / dual IR path (sections 3-6).
**Mult is primary** this dual-pin. Linear uses `slake_linear_class_*` and Types
uses `slake_types_kind_*` (same i32 0/1/2 align 4 shape, different symbol
names) -- **Linear/Types when in scope later**; not required for Mult-first
layout ladder close.

**Non-claims for dual-pin:** not Rust-native link; not full Graph/Program layout;
not CFG/SSA; not classic-FFI-free success.

## 10. Next residual (documented)

**ABI parity smoke** (depends on this fixture): **done** -- thin just
`abi-parity-smoke` + pure Nix `nix/systems-llvm-ir/abi-parity.nix` greps
fixture tokens + Mult freestanding / IR tag SSOT agreement; explicit
non-claims on extern Rust stable and link without classic FFI.

**Layout IR tag dual-pin** (depends on this fixture + ABI parity): **done** --
`just layout-ir-dual-pin` + pure Nix `layout-ir-dual-pin.nix`; Mult IR full tag
lines dual-pinned to fixture rows; greppable `LAYOUT-IR-TAG-DUAL-PIN`. Layout
Mult-first test ladder (fixture + ABI parity + dual-pin) **closed**.

**Next primary Open:** **SelfApplyFs long-file split** (parallel inventories
remain: Superset surface inventory, Proof complete inventory, Host residual
free design).