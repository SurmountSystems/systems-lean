# Implement report: Completeness Package C1 Without-classic-FFI end announce

**Date:** 2026-08-10
**Package:** C1 (completeness program; session plan Packages C0-C2)
**Mode:** surgical public prose + residual lockstep; no product Lean claim flips

## Goal

Land the end announce that Mult through Graph layout and the foreign dual-map
consumer path we document does **not** require classic foreign-function interface
(FFI) ceremony as the happy path, without claiming "no FFI ever."

## Value (plain English)

Systems Lean already ships a measured dual map between Mult..Graph layout /
foreign consumer contracts and Rust layout/IR numeric contracts (size, align,
discriminants as i32-shaped). Foreign band-local dogfood and joint multi-band
interop gates are green. C1 does not invent that interop; it **names** the
happy-path contract in the surface matrix and public docs so operators and
agents stop treating classic `extern "C"` ceremony as the required story for
that path. Classic freestanding **C** under `out/freestanding-c/` remains a
permanent valid product wire.

## Done when (evidence)

| Item | Result |
|------|--------|
| Surface-matrix Rust-native / without-classic-FFI row **measured** with non-claims in same row | **GREEN** -- `src/systems/surface-matrix.md` |
| Public sentence in `doc/goals.md` | **GREEN** |
| Public sentence in `out/llvm-ir/README.md` | **GREEN** |
| Public sentence in `doc/vocabulary.md` | **GREEN** |
| Forbidden claims absent | **GREEN** -- not "no FFI ever"; not formalized all of rustc; not tip fullBackend synonym; not product Rust under `src/` |
| Freestanding C remains permanent valid emit path | **GREEN** -- stated in matrix, goals, vocabulary, llvm-ir README |
| `just rust-ir-interop-partial` | **GREEN** exit 0 (lake + out-of-tree dogfood) |
| `just rust-ir-interop-full` | **GREEN** exit 0 (multi-band joint dogfood) |
| `just hygiene` | **GREEN** exit 0 (source-hygiene + professional-tone) |
| Residual Done archive + Open C2 | **GREEN** |
| Plan + WATCHER + handoff + RESIDUAL.md lockstep | **GREEN** |
| free/complete/PROVABLY/FullHost/tip fullBackend **unchanged** | **GREEN** (docs only; no Lean pin edits) |

## Primary paths touched

- `src/systems/surface-matrix.md`
- `doc/goals.md`
- `doc/vocabulary.md`
- `out/llvm-ir/README.md`
- `RESIDUAL-systems.md` (C1 done; Open C2 FullHost progressive deepen)
- `RESIDUAL.md` (Systems Open join)
- `.agents/plans/plan-full-readiness-2026-08-09.md`
- `WATCHER.md` (`/implement` C2)
- `doc/SESSION-HANDOFF.md`

## Non-claims / unchanged

- free / complete / PROVABLY **true** (unchanged)
- FullHostElaborateRemains **false** (unchanged)
- tip fullBackend **true** A-light (unchanged; not re-false)
- band Mult..Graph `*FullBackendClaimed` **false** (unchanged)
- DominanceClaimed / production opt **false** (unchanged)
- No product Lean edits; no product Rust under `src/`
- Not "no FFI ever"; not formalized all of rustc

## Optional Lean pin

Skipped. Pure Nix / residual did not require a greppable announce pin in
`RustIrInterop.lean`; public prose is enough.

## Next

Completeness Package **C2** FullHost progressive deepen (WATCHER body).

## Gates

```
just rust-ir-interop-partial  # exit 0 GREEN
just rust-ir-interop-full     # exit 0 GREEN
just hygiene                  # exit 0 GREEN (source-hygiene + professional-tone)
```
