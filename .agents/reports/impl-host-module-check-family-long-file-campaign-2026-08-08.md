# Implement report: Host module check family long-file campaign

**Date:** 2026-08-08
**SCORE:** fail=0

## Goal

Pay down Sub-1-KLOC debt across the HostModuleCheck family as completely as
coherent role peels allow. Keep dual-ok and free pins. No free/complete/
PROVABLY/FullHost/proof flips. No full elaborator parity or full LLVM forge.

## Line counts (before -> after)

| File | Before | After |
|------|--------|-------|
| `HostModuleCheck.lean` (tip hub) | **2489** | **43** |
| `HostModuleCheckFixtures.lean` | **5273** | **581** |
| `HostModuleCheckSurface.lean` | **2163** | **433** |
| `HostModuleCheckAccepts.lean` | **1255** | **632** |
| `HostModuleCheckTheorems.lean` | 612 | 612 |
| `HostModuleCheckMain.lean` | 17 | 17 |

### New companions (all under 1000)

| Companion | Lines | Role |
|-----------|------:|------|
| `HostModuleCheckRequiredDecls` | 627 | Required key-decl lists Mult..Emit scaffolds |
| `HostModuleCheckRequiredDeclsProduct` | 623 | ProductOut..CompilePathGraph required lists |
| `HostModuleCheckRequiredDeclsLater` | 741 | CompilePathCompose..SelfApply required lists |
| `HostModuleCheckFixtureTexts` | 936 | Good fixture texts Mult..ProductPathPerform |
| `HostModuleCheckFixtureTextsProduct` | 922 | Good texts ProductPathPerformTheorems..TypesSubsetEmit |
| `HostModuleCheckFixtureTextsLater` | 999 | Good texts ProgramSubsetEmit..SelfApplyTheorems; stop rule: next seed unit needs new companion |
| `HostModuleCheckCheckers` | 790 | check*Surface Mult..HostPackageRoots |
| `HostModuleCheckCheckersLater` | 988 | check*Surface FreestandingEmit.. + checkRealModule |
| `HostModuleCheckAcceptsGoods` | 646 | Good accepts Mult..DualEqWriteParityTheorems |
| `HostModuleCheckSeeds` | 715 | Stage ids + seed modules/paths + honesty pins |
| `HostModuleCheckLoadOk` | 863 | LoadOk fold + readiness pins |
| `HostModuleCheckDriver` | 758 | filterArgs / runModuleCheck / main |

**Sub-1-KLOC:** every `HostModuleCheck*.lean` is under 1000. Campaign complete.

## Method

1. Opened residual campaign under Systems Open; peels serialized on shared
   harness/presence.
2. **Fixtures campaign first** (largest): required-decl lists into three
   role companions; good fixture texts into three; tip keeps
   `hostModuleCheckTheoremCorpusOk` + bad fixture texts.
3. **Surface:** model/helpers/checkNamedSurface stay; checkers peels into
   Checkers + CheckersLater (no Surface<->Checkers cycle: Checkers imports
   Surface; Surface does not import Checkers).
4. **Accepts:** early goods into AcceptsGoods; tip keeps later goods + bads.
5. **Tip:** Seeds (ids+seeds+honesty), LoadOk (fold+ready), Driver (IO);
   tip is import hub only.
6. Harness partition honesty: **8 -> 20**
   (`seed=206+Main=59+harness=20`). HostResidualShrink + Theorems dual-pin;
   just/host.just greps; just host-without-lake family greps across companions.
7. Pure Nix: host-leans.nix, required-files.nix, host-specs-compile-path-3
   (hub tip + each companion). SystemsLean.lean import order respects deps.

## Verification

| Command | Exit |
|---------|------|
| `lake build` full HostModuleCheck family + HostResidualShrink + slake-host-module-check | **0** |
| `just host-module-check-without-lake` | **0** (GREEN; modules=206) |
| `just host-residual-shrink` | **0** (GREEN) |
| `just systems-host` | **0** (233 required paths) |
| `just hygiene` | **0** (GREEN) |

## Claim honesty (unchanged)

| Pin | Value |
|-----|-------|
| DualResidual `hostElaboratorResidualRemains` | **false** |
| DualResidual `hostElaboratorResidualFreeClaimed` | **true** |
| HostResidualShrink FullHostElaborateRemains | **false** |
| SpecProof `proofCompleteClaimed` | **true** |
| product free / complete / PROVABLY | true / true / true |
| product StillUsesLake / DependsOnLake | false |
| `llvmUnlocked` | **true** (not full backend claim) |
| modules=206 seed | unchanged |

## Out of scope (honored)

- Full elaborator parity / real elaborator judgments / mathlib
- Full LLVM backend / Rust-native link
- free/complete/PROVABLY/FullHost/proof pin flips
- Product C/shell growth; mass find-replace; stitch marks

## Residual after

Open empty done-for-now. No further HostModuleCheck Sub-1-KLOC residual.
Held tracks stay held. Report path is this file.

## Review fix lockstep (2026-08-08 fix1)

Review issues were residual/handoff/comment lag only (no product claim flips).

| Issue | Fix |
|-------|-----|
| SESSION-HANDOFF living tip intermediate sizes | Final sizes: tip hub 2489->43; Fixtures 5273->581; Surface 2163->433; Accepts 1255->632; harness 8->20 |
| RESIDUAL-systems Long-file decisions row | Family Sub-1-KLOC done; no further tip/Fixtures remaining |
| HostResidualShrink L-band comment | Disk 285=206+59+20; free claimed true / remains false |
| HostResidualShrink harness role prose | Expanded to match greppable harness=20 companions |
| just/host-without-lake.just family_mods | Added RequiredDecls* + FixtureTexts*; error string parity |
| FixtureTextsLater header | Next seed unit needs new companion; do not grow past 1000 |
| Session plan Residual/Open + H1/H2 | Reseeded done with final sizes |
| HostModuleCheck hub non-claims | Local stillUsesLake; DualResidual free claimed elsewhere; PARTIAL-STRUCTURAL |

Gates: `lake build` HostResidualShrink (+ hub if needed); `just host-module-check-without-lake`; hygiene on md.
