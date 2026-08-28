# Implementer report: richer-than-i32 layout + IR consumer link smoke

Date: 2026-08-12
Tree: /home/hunter/Projects/ai/iso
Role: L2 implementer

## What landed

Two residual Names. Production-backend claim stays false.

### 1. Richer-than-i32 layout

Named record: **IrNodeRecord** (wire `slake_ir_node`, emit map of `Types.IrNode`).

Fields (rustc_abi `repr(C)` on `x86_64-unknown-linux-gnu`):

| Field | Wire | rustc_abi | Offset | Size | Align |
|-------|------|-----------|--------|------|-------|
| ty | `slake_type_tag` / `uint32_t` | `Integer::I32` / `u32` | 0 | 4 | 4 |
| mult | `enum slake_mult` | `c_enum_min_size I32` / `i32` | 4 | 4 | 4 |
| kind | `enum slake_ir_kind` | `c_enum_min_size I32` / `i32` | 8 | 4 | 4 |
| valid | `uint8_t` | `Integer::I8` / `u8` | 12 | 1 | 1 |
| pad | trailing | `Size::align_to` | 13 | 3 | -- |
| **record** | `slake_ir_node` | max field align | -- | **16** | **4** |

Cites: `ref/rust/compiler/rustc_abi/src/lib.rs` (`Integer::size` / `Integer::align`,
`TargetDataLayout` default `i32_align` 32 bits / `i8_align` 8 bits,
`c_enum_min_size: I32`, `Size::align_to`).

Host Lean: `src/systems/SystemsLean/IrNodeLayout.lean`
(`irNodeLayoutDualPinOk`, `recordSizeBytes = 16`, `recordAlignBytes = 4`).
This is the wire record, not the Lean inductive (host `IrNode` has no `valid` flag).
C product wire was **not** edited.

Out-of-tree rustc dogfood (`just richer-record-layout`) asserts
`size_of == 16`, `align_of == 4`, `offset_of` 0/4/8/12 under `/tmp`.
No product Rust under `src/`.

### 2. IR consumer link smoke

Recipe: `just llvm-link-smoke` in new module `just/llvm-link-smoke.just`
(imported from root `justfile`; `just/llvm.just` left at 987 lines).

Preferred path: clang links a TMPDIR `wrap.ll` (defines `@main`, calls an
i32 generator symbol) to generator SSA IR. This run used
`out/llvm-ir/slake_compose_ssa.ll` and `@slake_compose_ssa_mint_status(0) == 0`.
Fallback if clang missing: rustc + `llc` object (extern declaration only as
link glue; not sold as classic FFI happy path). Soft-skip exit 0 if clang
and rustc+llc are all missing. Consumer dir deleted on exit.

Not FullBackend. Not a `src/` Rust crate. Not llc production.

## Commands and exits

| Command | Exit |
|---------|------|
| `cd src/systems && lake build SystemsLean.IrNodeLayout` | 0 |
| `cd src/systems && lake build SystemsLean.RustIrInterop` | 0 |
| `just richer-record-layout` | 0 (lake + rustc size/align/offset GREEN) |
| `just llvm-link-smoke` | 0 (clang IR wrap + compose SSA GREEN) |
| `just hygiene` | 0 |
| `just systems-llvm-ir` | 0 (190 required paths) |
| `just rust-ir-interop-full` | 0 (lake + multi-band rustc dogfood GREEN) |

## Pins unchanged

| Pin | Value |
|-----|-------|
| `rustIrInteropFullBackendClaimed` | **false** |
| `irNodeLayoutFullBackendClaimed` | **false** |
| band `*ForeignLink*FullBackendClaimed` | **false** (untouched) |
| `rustIrInteropFullClaimed` / `PartialClaimed` | true (pre-existing; not flipped this slice) |
| product residual free / complete / PROVABLY / FullHost | not touched |
| C emit / `out/freestanding-c` | not touched |
| `LlvmComposeSsa*.lean` | not touched |

## Paths touched

- `src/systems/SystemsLean/IrNodeLayout.lean` (new)
- `src/systems/SystemsLean/RustIrInterop.lean` (import + richerThanI32LayoutOk)
- `src/systems/SystemsLean.lean` (import)
- `just/llvm-link-smoke.just` (new)
- `justfile` (one import)
- `just/README.md` (one row)
- `doc/rust-entry.md` (honesty)
- `out/llvm-ir/README.md` (honesty)
- this report

Did not touch residual / WATCHER / SESSION-HANDOFF, bench just modules,
compose SSA writers, product C, or claim-bool flips.
