# Report: Rust IR intercompat partial (2026-08-10)

IMPL: bd66489f-rust-ir

## Goal
Progressive formal correspondence so Slake LLVM IR is dual-pinned against Rust
layout/IR contracts (host Lean types/proofs + Mult..Graph foreign rungs + Mult
layout dual-pin + optional out-of-tree rustc dogfood). Partial claim only.

## Delivered

| Artifact | Role |
|----------|------|
| `src/systems/SystemsLean/RustIrInterop.lean` | Joint dual-pin module; partial true / full false |
| `doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md` | Residual-backed design honesty |
| `nix/systems-llvm-ir/rust-ir-interop-partial.nix` | pure Nix presence + forge-bans |
| `just rust-ir-interop-partial` | Live gate (systems-llvm-ir + lake + optional rustc) |
| `doc/rust-entry.md` | Living tip update |
| full-llvm bar note | Bar item (7) Rust IR intercompat partial required for fullBackend honesty |
| Residual / WATCHER | Partial Done; Open **Rust IR full intercompat**; Full LLVM path B honesty kept |

## Pins

| Pin | Value |
|-----|-------|
| `rustIrInteropPartialClaimed` | true |
| `rustIrInteropFullClaimed` | false |
| `rustIrInteropFullBackendClaimed` | false |
| Mult..Graph foreign success | true (band-local; unchanged) |
| free / complete / PROVABLY / FullHost | unchanged |
| fullBackend | false (not forged) |

## Gates
- `just hygiene` GREEN
- `just systems-llvm-ir` GREEN (162 required paths)
- `lake build SystemsLean.RustIrInterop` GREEN
- `just rust-ir-interop-partial` GREEN (rustc dogfood GREEN)
- `just mult-foreign-link-success` GREEN
- `just graph-foreign-link-success` GREEN

## Non-claims
- Not product Rust under `src/`
- Not formalization of rustc
- Not complete isomorphism
- Not multi-band single crate (full Open)
- Not fullBackend true

## Next
WATCHER: `/implement` **Rust IR full intercompat** (multi-band single consumer +
`rustIrInteropFullClaimed` only with lake; never alias partial).
