# Implement report: Full iterative CFG over multi-node IR (2026-08-10)

## Status: GREEN

Progressive Full LLVM residual: iterative CFG construction by walking multi-node
ordered IR program / IrGraph structure. **fullBackend stays false.**

## Decision on fullBackend

**Do not flip `llvmCfgFixtureFullBackendClaimed` / fullBackend true.**

| Reason | Detail |
|--------|--------|
| Progressive only | Walker + KernelProgram three-node dual-pin is real evidence, not end claim |
| DominanceClaimed | Still **false** (Mult DF partial only) |
| Bar honesty | Prefer leave fullBackend false until DF decision + lake short role pin residual |
| Opt | Production opt stays intentional non-claim |

## Product edits

| Path | Change |
|------|--------|
| `SystemsLean/LlvmCfgGeneral.lean` | `iterativeCfgBlocksFromProgram` / `iterativeCfgEdgesFromGraph` walk IrProgram/IrGraph; KernelProgram `lowerProgramGraph` fixture; expected dual-pin ERASED/LINEAR/VALUE chain; `iterativeCfgConstructionPartial` true; `fullLlvmBarEvidencePartial` requires iterative |
| `SystemsLean/LlvmCfgFixture.lean` | surface/package join; theorems `iterativeCfgConstructionPartial_true` / `iterativeCfgWalkOk_true`; smoke |
| `nix/systems-llvm-ir/cfg-iterative-cfg-partial.nix` | pure Nix presence + forge-ban fullBackend true |
| `nix/systems-llvm-ir/specs.nix` | join iterative slice |
| `nix/systems-llvm-ir/cfg-fixture.nix` | theorem name presence |
| `just/llvm.just` | `iterative-cfg-construction-partial` recipe |
| bar note / residual / handoff / WATCHER | lockstep |

## Pins (post iterative)

| Pin | Value |
|-----|-------|
| `iterativeCfgConstructionPartial` | **true** |
| `fullLlvmBarEvidencePartial` | **true** (now includes iterative) |
| `llvmCfgFixtureFullBackendClaimed` | **false** |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| free / complete / PROVABLY | **unchanged true** |
| FullHostElaborateRemains | **unchanged false** |

## What the walker does

1. Load multi-node graph via `KernelProgram.lowerProgramGraph` (3 nodes: ERASED,
   LINEAR, VALUE; edges 0->1, 1->2).
2. Build CFG block labels by folding over ordered IR program nodes (`n{i}:KIND`).
3. Build CFG edge labels by mapping IrGraph edges (`n{from}->n{to}`).
4. Dual-pin walk output against expected inventory + `programGraphPathReady`.
5. Join general compose partial + multi-unit Mult..Graph + Mult DF partial;
   honesty pins stay false.

This is **not** Mult grade_tag diamond hand tables and **not** only the fixed
five-root compose multi-merge inventory.

## Gates

| Gate | Result |
|------|--------|
| `lake build SystemsLean.LlvmCfgFixture` | GREEN (exit 0) |
| `just hygiene` | GREEN |
| `just systems-llvm-ir` | GREEN |
| `just general-program-cfg-partial` | GREEN |
| `just iterative-cfg-construction-partial` | GREEN (lake re-proof) |

## Non-claims

No product C. No shell mills. No fullBackend forge. No DominanceClaimed true.
No production opt invent. free/complete/PROVABLY / FullHost unchanged.

## Remaining for fullBackend true

1. Full DF pipeline only if product requires `llvmCfgFixtureDominanceClaimed`.
2. Lake-proofed fullBackend pin flip after that honesty (never alias unlock or
   `fullLlvmBarEvidencePartial`).
3. Band-local `*FullBackendClaimed` stay false until fixture end claim flips.

## Next

WATCHER: Full dominance pipeline or fullBackend honesty flip residual
(Done when 10). Report path:
`.agents/reports/impl-full-llvm-fullbackend-or-df-2026-08-10.md`.
