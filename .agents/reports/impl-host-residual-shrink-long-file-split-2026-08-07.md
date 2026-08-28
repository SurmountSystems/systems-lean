# Implement report: Host residual shrink long-file split (R4)

**Date:** 2026-08-07
**Wave:** efc520d0 slice R4
**SCORE:** fail=0

## Goal

Bring `SystemsLean/HostResidualShrink.lean` under 1000 lines by extracting a
coherent theorems/smoke role module (not a naive half-file cut). Keep living
claim SSoT pins on the tip. No free/complete/PROVABLY/FullHost/proof flips.

## Line counts

| File | Before | After |
|------|--------|-------|
| `HostResidualShrink.lean` | **1260** | **825** |
| `HostResidualShrinkTheorems.lean` | (new) | **502** |

Tip under Sub-1-KLOC bar (1000). Companion under 1000.

## Method

1. Inventory: claim/measured dual-ok defs occupy tip through ready/free-honest
   folds; HOST-RESIDUAL-SHRINK-THEOREM + HOST-RESIDUAL-SHRINK-SMOKE dominated
   the tail (~lines 818-1259).
2. Extracted theorems + smoke into `SystemsLean/HostResidualShrinkTheorems.lean`
   (same namespace `SystemsLean.HostResidualShrink`; import tip only).
   Mirrors HostGraphTheorems / HostComposeTheorems pattern.
3. Tip keeps inventory claim pins, measured recipe strings, dual-ok bools,
   greppable stage ids. Header cites long-file split + theorem greppable names
   for presence dual-ok (HostGraph style).
4. Honest harness partition: companion is harness carve-out (not product seed).
   `measuredHostLibraryOutOfScopeHarness` adds `HostResidualShrinkTheorems`;
   disk partition `seed=206+Main=59+harness=6` (was harness=5). Seed product
   count stays 206.
5. Pure Nix: `host-leans.nix`, `required-files.nix`, tip+companion specs in
   `host-specs-compile-path-3.nix`. just `host-residual-shrink` harness greps
   updated.
6. Residual lockstep: Name Done; Open empty done-for-now; HostModuleCheck
   (~5821) documented as deferred hygiene only.

## Verification

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems` | **0** |
| `just host-residual-shrink` | **0** (GREEN) |
| `just systems-host` | **0** (219 required paths) |
| `just hygiene` | (run after residual md) |

## Claim honesty (unchanged)

| Pin | Value |
|-----|-------|
| DualResidual `hostElaboratorResidualRemains` | **false** |
| DualResidual `hostElaboratorResidualFreeClaimed` | **true** |
| HostResidualShrink mirror remains / free | **false** / **true** |
| FullHostElaborateRemains | **false** |
| proofCompleteClaimed | **true** (not flipped this slice) |
| product free / complete / PROVABLY | true / true / true |
| product StillUsesLake / DependsOnLake | false |
| llvm full backend claim | not forged |

## Out of scope (honored)

- No free re-forge; no FullHost true; no PROVABLY/llvm full backend rebrand.
- HostModuleCheck 5k-line long-file split not attempted this slice.
- No seed band edge rewrites for HostResidualShrink (harness carve-out).

## Primary paths touched

- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (new)
- `just/host.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
