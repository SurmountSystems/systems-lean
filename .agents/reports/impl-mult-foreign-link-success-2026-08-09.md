# Implement report -- Mult foreign link success (2026-08-09)

ASCII only. Plain American English.

**Date:** 2026-08-09
**Name:** Mult foreign link success (Full readiness Phase 3)
**Plan:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md` track 2

## Goal

Land Mult layout-compatible foreign / out-of-tree consumer link success evidence
beyond Mult layout/IR consumer partial and Mult link readiness partial, without
an in-tree product Rust crate farm.

## What landed

| Piece | Path / recipe | Role |
|-------|---------------|------|
| Host Lean dual-pin | `src/systems/SystemsLean/MultForeignLink.lean` | Mult foreign link success claim true (Mult band only); FOREIGN-MULT-CONSUMER-CONTRACT + MULT-FOREIGN-DUAL-AGREEMENT; size 4 / align 4 / i32 / x86_64-unknown-linux-gnu; Mult SSOT tags 0/1/2 fail-closed; other bands false; full backend false |
| Evidence recipe | `doc/dev/research/mult-foreign-link-success-2026-08-09.md` | Dual Mult layout/IR agreement table; out-of-tree rustc command; remaining bands honesty |
| Pure Nix gate | `nix/systems-llvm-ir/mult-foreign-link-success.nix` | Joined via `specs.nix` into `systems-llvm-ir` (78 required paths) |
| Thin just | `just mult-foreign-link-success` in `just/llvm.just` | systems-llvm-ir + lake MultForeignLink + out-of-tree rustc dogfood under `/tmp` when rustc present + optional Mult unit/SSA llvm-as |
| Package import | `src/systems/SystemsLean.lean` | Imports MultForeignLink (no HostImportGraph seed expand; seed=206 harness=40 unchanged) |

## Beyond prior partials

| Prior rung | What it checked |
|------------|-----------------|
| `just mult-link-readiness` | Freestanding Mult tags + Mult unit IR + Mult SSA tags + layout fixture |
| `just mult-layout-ir-success` | Above + freestanding Mult API symbols + Mult SSA kernel/is_valid |
| **This residual** | Above surfaces + host Lean MultForeignLink success claim + foreign consumer contract dual-pin + documented dual recipe + live out-of-tree rustc dogfood (size/align/tags) + remaining-band table |

## Out-of-tree evidence (ran green)

- rustc dogfood under `/tmp/slake-mult-foreign-link.*`: `#[repr(i32)] enum MultTag` size 4, align 4, tags 0/1/2
- `llvm-as` Mult unit + Mult SSA `.ll` assemble OK (not production backend)

No product `*.rs` under `src/`.

## Verification

| Gate | Exit |
|------|-----:|
| `just hygiene` | 0 |
| `just systems-llvm-ir` | 0 (78 required paths; Mult foreign link success in summary) |
| `lake build SystemsLean.MultForeignLink` | 0 |
| `just mult-foreign-link-success` | 0 (dual agreement + dogfood + llvm-as) |

## Pin honesty (unchanged)

- free / complete / PROVABLY **true** (not re-opened, not forged)
- FullHostElaborateRemains **false**
- llvmUnlocked **true**; Mult+Linear+Types+Program+Graph SSA **partial** only; full backend **false**
- `LlvmMultSsa.llvmMultSsaRustNativeLinkClaimed` **false** (local module honesty; Mult foreign success lives in MultForeignLink)
- Mult foreign link **other bands** **false** (Linear/Types/Program/Graph)
- Full classic elaborator parity **measured** unchanged
- seed=206 harness=40

## Residual / watcher

- Mult foreign link success: **done** (Done archive row + Open queue closed)
- Next Open: **Production CFG deepen**
- `WATCHER.md`: `/implement` Production CFG deepen
- Handoff + plan track 2 + `out/llvm-ir/README.md` + `doc/rust-entry.md` reseeded

## Out of scope (honored)

Full LLVM production backend claim true; mathlib; FullHost re-true;
free/complete/PROVABLY flips; Rust crate farm under `src/`; claiming foreign link
from readiness alone without dual agreement + out-of-tree evidence.
