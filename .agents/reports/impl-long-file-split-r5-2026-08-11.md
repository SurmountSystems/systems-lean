# R5: Host long-file split (2026-08-11)

**Status:** GREEN
**Residual:** Host long-file split (R5) **done**
**Out of scope honored:** no claim pin flips; no mass archive rewrite; no product C/shell; no git commit

## Goal

Pay Sub-1-KLOC (under 1000 lines per novel file) on HostModuleCheck / HostImportGraph peers still over 1000 after W1-W5 nits.

## Before (measured)

| File | LOC |
|------|-----|
| HostModuleCheckAcceptsGoods.lean | 1053 |
| HostModuleCheckLoadOk.lean | 1035 |
| HostModuleCheckFixtureTextsLater.lean | 1033 |
| HostModuleCheckDriver.lean | 1030 |
| HostModuleCheckFixtureTexts.lean | 1005 |
| HostModuleCheckTheorems.lean | 1000 (at bar) |
| HostImportGraphWalk.lean | 999 |
| HostImportGraphLoadOk.lean | 995 |

## Role-module splits (plain English seams)

1. **FixtureTextsSelfHost** (`HostModuleCheckFixtureTextsSelfHost.lean`)
   - From FixtureTextsLater: good fixture text strings SelfApplyFs through SelfApplyTheorems (self-host close-path + parity + kernel emit band).
   - Later keeps ProgramSubsetEmit through LlvmComposeText.

2. **AcceptsProof** (`HostModuleCheckAcceptsProof.lean`)
   - From AcceptsGoods: Kernel Mult/Linear/Types/Program/Emit L3 PROOF-SURFACE good/bad accepts + compact smoke folds.

3. **DriverIO** (`HostModuleCheckDriverIO.lean`)
   - From Driver: `filterArgs`, `moduleNameToRel`, `loadAndCheckRealModule`, `printSurface`, `loadMultModuleCheck`.
   - Driver keeps `runModuleCheck` + `main`.

4. **In-place moves (no new module role beyond above)**
   - `hostModuleCheckGoodProductPathPerformText`: FixtureTexts -> FixtureTextsProduct.
   - Parity Mult..Emit term smoke folds: LoadOk -> AcceptsGoods (AcceptsGoods had headroom after AcceptsProof extract).

Same namespace `SystemsLean.HostModuleCheck` throughout so names stay unqualified.

## After (measured)

| File | LOC |
|------|-----|
| HostModuleCheckFixtureTextsLater.lean | 451 |
| HostModuleCheckFixtureTextsSelfHost.lean | 611 |
| HostModuleCheckFixtureTexts.lean | 993 |
| HostModuleCheckFixtureTextsProduct.lean | 972 |
| HostModuleCheckAcceptsGoods.lean | 991 |
| HostModuleCheckAcceptsProof.lean | 183 |
| HostModuleCheckLoadOk.lean | 952 |
| HostModuleCheckDriver.lean | 972 |
| HostModuleCheckDriverIO.lean | 81 |
| HostModuleCheckTheorems.lean | 1000 (at bar, not over) |
| HostImportGraphWalk.lean | 999 |
| HostImportGraphLoadOk.lean | 995 |

**HostModuleCheck* / HostImportGraph*:** zero files **over** 1000.

## Lockstep (surgical)

- Imports: `HostModuleCheckFixtures`, `SystemsLean.lean`, `HostModuleCheck` hub
- Pure Nix: `nix/systems-host-presence/host-leans.nix`, `required-files.nix`, `host-specs-compile-path-3.nix`
- Dual-pin harness string + partition: `HostResidualShrink` / Theorems, `just/host.just`
- Without-Lake family mods: `just/host-without-lake.just`
- harness **61 -> 64** (`seed=206+Main=59+harness=64`)

Lake does not list each companion in lakefile (package discovers modules); hub + Fixtures imports are the product wire-up.

## Leftovers (honesty; not over Sub-1-KLOC)

| File | LOC | Note |
|------|-----|------|
| HostModuleCheckTheorems.lean | 1000 | At bar; next growth needs a Theorems companion split |
| HostImportGraphWalk.lean | 999 | Near-limit headroom |
| HostImportGraphLoadOk.lean | 995 | Near-limit headroom |
| HostModuleCheckAcceptsGoods.lean | 991 | Near-limit after smoke move |
| HostModuleCheckFixtureTexts.lean | 993 | Near-limit |

No Host family file remains **>1000**. Near-limit files are residual **headroom**, not open oversize debt.

## Claim pins (unchanged)

| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | true (not re-opened) |
| FullHostElaborateRemains | false |
| DominanceClaimed / band FullBackend | false |
| product Lake pins | false |
| seed | 206 |
| harness | **64** (was 61; three new long-file companions only) |

## Commands + exits

| Command | Exit |
|---------|------|
| `lake build SystemsLean.HostModuleCheckFixtureTextsSelfHost SystemsLean.HostModuleCheckAcceptsProof SystemsLean.HostModuleCheckDriverIO SystemsLean.HostModuleCheckFixtureTextsLater SystemsLean.HostModuleCheckAcceptsGoods SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckDriver SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems` | **0** |
| `just systems-host` | **0** (`systems-host-presence OK (277 required paths; ...)`) |
| `just hygiene` | **0** (source-hygiene + professional-tone OK) |

## Residual lockstep

- `RESIDUAL-systems.md`: R5 **done**; Open R2 only; harness 64
- `RESIDUAL.md`: Systems Open join R5 done; harness 64
- `WATCHER.md`: R5 done; implement tip R2
- `doc/SESSION-HANDOFF.md`: living tip R5 done

## Non-claims

- Not FullHost flip
- Not package-env band invent
- Not free/complete/PROVABLY re-proof
- Not HostImportGraph oversize (already under 1000; near headroom only)
