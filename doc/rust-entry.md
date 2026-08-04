# Rust entry map (layout + LLVM IR interop)

Read-only upstream: `ref/rust/` (`rust-lang/rust`).
Do not edit upstream as product source.

**Why Rust (not only llvm-project):** Rust **type layout and ABI** are defined by rustc (`rustc_abi`, codegen conventions). LLVM IR alone does not define "Rust-compatible layout." For Slake's design bar -- LLVM IR and efficient Rust-ecosystem interop **without classic FFI** as the happy path -- rustc is the reference.

Nested LLVM under rust's own submodules is **not** required for reading layout/ABI sources. Do not recursive-init the world unless a human asks.

---

## Start here

| Purpose | Path |
|---------|------|
| Overview | `ref/rust/README.md` |
| Compiler crates | `ref/rust/compiler/` |
| **Type layout / ABI** | `ref/rust/compiler/rustc_abi/` (and related) |
| Codegen SSA / LLVM bridge | `ref/rust/compiler/rustc_codegen_ssa/`, `ref/rust/compiler/rustc_codegen_llvm/` |
| Target specs | under `ref/rust/compiler/rustc_target/` |

Exact crate layout can shift across rustc versions; search under `ref/rust/compiler/` for `abi`, `layout`, `codegen_llvm` if paths move.

---

## Design bar (not a claim yet)

| Phrase | Status |
|--------|--------|
| "LLVM IR backend" | Design goal for Slake; Mult..Graph text + compose + optional llvm-as + unlock **done** (not full backend) |
| "Rust layout-compatible" | Must be defined against rustc_abi rules + tests |
| "Without classic FFI" | Happy path = layout/IR-level interop, not hand `extern "C"` glue as default -- **not claimed** until design note + tests |

**Design note (2026-08-03):** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
(Kind: analysis only). Layout/ABI bar, non-claims, residual Names for layout
tests. **Layout size/align fixture done** (research
`doc/dev/research/layout-size-align-fixture-2026-08-03.md`; Mult-first size/align
table). **ABI parity smoke done** (`just abi-parity-smoke`; pure Nix Mult
fixture/header/IR agreement). **Layout IR tag dual-pin done**
(`just layout-ir-dual-pin`; pure Nix Mult IR tags vs fixture;
`LAYOUT-IR-TAG-DUAL-PIN`). Mult-first layout test ladder **closed**. Does
**not** claim Rust-native link success without classic FFI. Do not edit
`ref/rust` as product.

See `doc/architecture.md` for freestanding vs LLVM product framing.

---

## What Systems Lean uses this for

- Layout and ABI reference for freestanding/LLVM product wire
- Research into link/embed without classic FFI
- Later: dual tests (Rust consumer + Slake product)

Not for forking rustc development inside this repo.
