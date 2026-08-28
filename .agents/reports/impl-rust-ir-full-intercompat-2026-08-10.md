# Implement report: Rust IR full intercompat (2026-08-10)

## Goal
Close residual **Rust IR full intercompat**: multi-band single out-of-tree consumer
(or honest dual-pin) covering Mult..Graph together; `rustIrInteropFullClaimed`
true only with lake elaborator proof; honesty that full is not formalized all of
rustc and not product Rust under `src/`; free/complete/PROVABLY/FullHost/fullBackend
unchanged.

## Done when check

| Item | Status |
|------|--------|
| Multi-band single consumer + host dual-pin Mult..Graph together | **met** (`multiBandJointConsumerOk` + `/tmp` multi-band dogfood) |
| `rustIrInteropFullClaimed` true with lake | **met** (`theorem rustIrInteropFullClaimed_true`; lake exit 0) |
| Research/residual honesty (not all of rustc; not product Rust) | **met** |
| free/complete/PROVABLY/FullHost/fullBackend unchanged | **met** (fullBackend false) |

## Product changes

### Host Lean
- `src/systems/SystemsLean/RustIrInterop.lean`
  - `rustIrInteropFullClaimed` **true**
  - `multiBandJointConsumerOk` dual-pin (all Mult..Graph foreign dual agreements + shared layout)
  - `fullStageId` / `justRecipeRustIrInteropFull` / `MULTI-BAND-JOINT-CONSUMER`
  - dual map and package ok require full multi-band; fullBackend still false
  - theorems: `rustIrInteropFullClaimed_true`, `multiBandJointConsumerOk_true`

### Pure Nix
- `nix/systems-llvm-ir/rust-ir-interop-full.nix` (new)
- `nix/systems-llvm-ir/rust-ir-interop-partial.nix` (full claim ownership moved to full module; partial no longer forbids full=true)
- `nix/systems-llvm-ir/specs.nix` join
- `nix/systems-llvm-ir/default.nix` summary honesty

### just
- `just/llvm.just`: `rust-ir-interop-full` (mandatory lake + multi-band `/tmp` rustc dogfood)
- Sub-1-KLOC: just/llvm.just ends ~993 lines

### Research / entry
- `doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md` full multi-band section
- `doc/rust-entry.md` pointer

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.RustIrInterop` | exit 0 |
| `just systems-llvm-ir` | GREEN (171 required paths) |
| `just rust-ir-interop-partial` | GREEN |
| `just rust-ir-interop-full` | GREEN (multi-band dogfood GREEN) |
| `just hygiene` | GREEN (also scrubbed one pre-existing section-sign in a review report) |

## Pin greps (spot)

| Pin | Value |
|-----|-------|
| rustIrInteropPartialClaimed | true |
| rustIrInteropFullClaimed | true |
| multiBandJointConsumerOk | true |
| rustIrInteropFullBackendClaimed | false |
| fullBackend (LlvmHold living) | false (unchanged by this residual) |
| free / complete / PROVABLY / FullHost | unchanged |

## Residual / WATCHER
- Closed Open Name **Rust IR full intercompat** (Done archive)
- Open remains **Full readiness program** (announce; fullBackend claim false)
- WATCHER next: Full readiness announce residual (operator flip fullBackend or bar revise)

## Review nits mopped
- SESSION-HANDOFF Active product residual (path B + Rust full done)
- plan-full-readiness living tip + Backend scoreboard + R2 multi-band status
- RESIDUAL-systems Deferred Rust-native link + Open/Done
- RESIDUAL.md P6 + Systems Open living tip

## Forbidden not violated
No product Rust under src/; no ref/rust edit; no fullBackend forge; no shell mills;
no git; no full-file Lean rebuild from /tmp; no kitchen-sink claim names.
