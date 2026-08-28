# Process mop: layout + IR link smoke (2026-08-12)

**Kind:** process mop (re-verify + fallout only)
**Tree:** `/home/hunter/Projects/ai/iso`
**Primary implementer report:** `.agents/reports/impl-layout-link-smoke-2026-08-12.md`

Backup verify after richer-than-i32 layout (`IrNodeLayout`) and IR consumer
link smoke (`just llvm-link-smoke`). Primary implementer already claimed these
green. This pass re-ran the named commands and mopped compile, lint, or
hygiene fallout if any.

## Result

**GREEN.** All required commands exited 0. No fallout. No product edits.

## Commands and exits

| Command | Exit | Notes |
|---------|------|-------|
| `just hygiene` | 0 | source-hygiene OK (1334 files); professional-tone OK (673 markdown) |
| `just hygiene` (after this report) | 0 | 1335 files / 674 markdown; new report included |
| `just systems-llvm-ir` | 0 | 190 required paths; DominanceClaimed false; band FullBackend false |
| `just llvm-as-smoke` | 0 | compose + Mult..Graph text and SSA; skip-if-missing not used |
| `just llvm-link-smoke` | 0 | clang IR wrap + compose SSA GREEN |
| `just richer-record-layout` | 0 | lake + out-of-tree rustc size 16 align 4 offsets 0/4/8/12 |
| `just rust-ir-interop-full` | 0 | lake + multi-band rustc dogfood GREEN |
| `cd src/systems && lake build SystemsLean.IrNodeLayout` | 0 | 26 jobs |
| `cd src/systems && lake build SystemsLean.RustIrInterop` | 0 | 44 jobs |

`llvm-as-smoke` assembled: `slake_compose.ll`, `slake_mult.ll`,
`slake_linear.ll`, `slake_types.ll`, `slake_program.ll`, `slake_graph.ll`,
plus matching `*_ssa.ll` (12 files).

`systems-llvm-ir` still reports fixture tip fullBackend true A-light. That is
the pre-existing CFG fixture tip, not a band `*FullBackendClaimed` flip.

## Files edited

None. No compile, lint, or hygiene fallout.

Did not touch residual, `WATCHER.md`, `SESSION-HANDOFF.md`, Compose SSA
writers, `just/bench-llvm.just`, product C, or product Rust under `src/`.

## Pin check (unchanged)

| Pin | Required | Observed |
|-----|----------|----------|
| product residual free (`DualResidual.residualFreeClaimed`) | true | true |
| product self-host complete (`DualResidual.productSelfHostCompleteClaimed`) | true | true |
| PROVABLY (`LlvmHold.provablyUnlocked` / `SelfHostComplete.provablyUnlocked`) | true | true |
| FullHost (`hostResidualShrinkFullHostElaborateRemains`) | false | false |
| Dominance (`llvmCfgFixtureDominanceClaimed`) | false | false |
| band FullBackend (Mult..Graph SSA + foreign-link + compose SSA) | false | false |
| `irNodeLayoutFullBackendClaimed` | false | false |
| `rustIrInteropFullBackendClaimed` | false | false |

Local layout/interop honesty aliases stay false:
`irNodeLayoutFullHostElaborateClaimed`,
`rustIrInteropFullHostElaborateClaimed`.

Pre-existing and not flipped this mop:
`rustIrInteropFullClaimed` / `PartialClaimed` true;
`llvmCfgFixtureFullBackendClaimed` true (A-light fixture tip, not band).

## Fallout

None. No surgical Lean, just, or Nix fix required.

## Non-claims

- Not a claim-bool flip.
- Not residual / watcher / handoff lockstep.
- Not Compose SSA rewrite.
- Not production LLVM backend.
- Not classic FFI happy path.
- Not product Rust under `src/`.
- Not hand product C.
