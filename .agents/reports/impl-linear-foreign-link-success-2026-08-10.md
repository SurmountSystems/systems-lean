# Implement report: Linear foreign link success (R2 progressive)

**Date:** 2026-08-10
**IMPL_ID:** fullready-r1c-r2-20260810091659
**Status:** GREEN

## Goal

Linear-band foreign consumer link success for Mult-class tags i32 0/1/2, mirroring
MultForeignLink. Mult Mult-only stays. Types/Program/Graph foreign unclaimed.
fullBackend false. No product Rust under `src/`.

## Paths touched

| Path | Role |
|------|------|
| `src/systems/SystemsLean/LinearForeignLink.lean` | **New** host dual-pin; `linearForeignLinkSuccessClaimed` true |
| `src/systems/SystemsLean.lean` | Import + package map line |
| `nix/systems-llvm-ir/linear-foreign-link-success.nix` | **New** pure Nix requiredFiles + contentSpecs |
| `nix/systems-llvm-ir/specs.nix` | Append join only |
| `nix/systems-llvm-ir/default.nix` | Summary string append |
| `just/llvm.just` | Recipe `linear-foreign-link-success` |
| `doc/dev/research/linear-foreign-link-success-2026-08-10.md` | Evidence / dual recipe |
| `RESIDUAL-systems.md` | Done archive row + living tip honesty |
| `RESIDUAL.md` | Join tip: Linear foreign done; Full LLVM may remain open |
| `out/llvm-ir/README.md` | One-line Mult-only + Linear-done tip |
| `doc/rust-entry.md` | One-line Mult-only + Linear-done tip |
| This report | Durable implement report |

**Not touched:** `LlvmCfgFixture.lean`; MultForeignLink claim bools; product C;
product Rust under `src/`; fullBackend pins; free/complete/PROVABLY; WATCHER
(left for Mult DF / Full LLVM progressive if still primary).

## Claim pins (honesty)

| Pin | Value |
|-----|-------|
| `linearForeignLinkSuccessClaimed` | **true** |
| `linearForeignLinkOtherBandsClaimed` (Types/Program/Graph) | **false** |
| `linearForeignLinkFullBackendClaimed` | **false** |
| `linearForeignLinkLlvmUnlocked` (local) | **false** |
| Mult `multForeignLinkSuccessClaimed` | **true** (unchanged) |
| Mult `multForeignLinkOtherBandsClaimed` | **false** (unchanged Mult Mult-only) |
| free / complete / PROVABLY | **unchanged** |
| FullHostElaborateRemains | **false** unchanged |
| `LlvmLinearSsa.llvmLinearSsaRustNativeLinkClaimed` | **false** |

Primary dual: FOREIGN-LINEAR-CONSUMER-CONTRACT + LINEAR-FOREIGN-DUAL-AGREEMENT
for Linear Mult-class tags size 4 align 4 on `x86_64-unknown-linux-gnu` vs Linear
SSOT + `slake_linear.ll` class tags + `slake_linear_ssa.ll` Mult-1/live_flag +
freestanding `slake_linear_subset.h` cite.

## Commands + exits

| Command | Exit |
|---------|------|
| `just hygiene` | 0 |
| `just systems-llvm-ir` | 0 (summary includes Linear foreign link success) |
| `lake build SystemsLean.LinearForeignLink` | 0 (32 jobs) |
| `just linear-foreign-link-success` | 0 (systems-llvm-ir + lake + rustc dogfood + llvm-as) |
| `just mult-foreign-link-success` | 0 (Mult Mult-only still GREEN) |

## Remaining

- Types / Program / Graph foreign link (later R2 progressive bands)
- Full LLVM production backend Open (R1 progressive; not closed by this slice)
- Mult Mult-only otherBands stays false until a deliberate all-band residual (not this work)

## Status

**GREEN** -- Linear foreign link success landed; Mult Mult-only preserved; Full
LLVM Open not wiped.
