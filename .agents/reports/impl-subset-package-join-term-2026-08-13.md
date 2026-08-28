# Report: Term-surface for SubsetPackageJoin (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no. Not PE for this unit.

## Class

Join of subset packages (ordered Mult..Compose unit rebuilds plus the
without-Lake multi-unit join). Clone of FrontMultPackage TERM layout
(StillUsesLake ILL twins). Not HostFront-class. Not llvm-as / rust-link /
writer-tool / HostFront goldens.

Living dialect `subsetPackageJoinReady`. ILL twins match this module:
residual-free, complete, ready body, proof, llvm, PROVABLY, Lake.
Lake pins stay true (false is ILL-TYPED-TERM).

## Verdict

**GREEN.** Pin stays false. Harness **128 -> 129**. TERM dual-ok **73 -> 74**.
Both-lessons stay **73 of 206**. Seed **206** unchanged.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckSubsetPackageJoinTerm.lean` (**331**). |
| E-good ready | Collapsed `subsetPackageJoinReady` matches `subsetPackageJoinReadyTermBody`. Multiline on-disk shape also accepted. |
| Honesty | residual-free / complete / proof / llvm / PROVABLY stay **false**. Lake pins stay **true**. |
| ILL twins | residual, complete, ready body `true`, proof, llvm, PROVABLY, Lake. L0 accept + dialect reject. |
| LoadOk | Later-fold includes `hostModuleCheckSubsetPackageJoinTermSurfaceOk` after FrontMultPackage. LoadOkLaterTerm **163**. |
| RealModule | `refineSubsetPackageJoinWithTermSurface` after `checkSubsetPackageJoinSurface`. |
| Accepts | Good text is Term text. Accepts **620**. |
| Shrink mirrors | TermOk dualOk + bar + scope SubsetPackageJoin-only. Harness **129**. |
| Just dual-pin | `just/host.just` harness **129** and both TERM names. `just/host-without-lake.just` both family_mods include FrontMult and SubsetPackageJoin TERM. |
| TERM dual-ok | **73 -> 74**. Seed **206** unchanged. |

Did **not** edit PackageEnv family, residual, WATCHER, or SESSION-HANDOFF.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckSubsetPackageJoinTerm` with DualOk false | **exit 1**. `native_decide` evaluated SurfaceOk = true is false (14 jobs) |
| Green | same theorem after DualOk true | **exit 0** (14 jobs) |
| Just red | `just host-residual-shrink` before just edit | **exit 1**. harness list still at 127 / missing FrontMult |
| Just green | after harness **129** + both TERM names | **exit 0** |

## Lake / just commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckSubsetPackageJoinTerm` (red) | **1** |
| `lake build SystemsLean.HostModuleCheckSubsetPackageJoinTerm` (green) | **0** |
| `lake build SystemsLean.HostModuleCheck` | **0** (118 jobs) |
| `lake build SystemsLean.HostResidualShrinkTheorems` | **0** (4 jobs) |
| `just hygiene` | **0** |
| `just systems-host` | **0** (350 paths) |
| `just host-residual-shrink` | **0** (harness 129) |

## NEXT leftover

**Package-import for SubsetPackageJoin** (`SystemsLean.SubsetPackageJoin`, living
`subsetPackageJoinReady`). After both lessons: skip HostGraphTheorems, then
LlvmTypesText.
