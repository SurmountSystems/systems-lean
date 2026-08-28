# Report: Term-surface for LLVM Linear text (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **125 -> 126**. TERM dual-ok **70 -> 71**.

Unit TERM accept + reject twins landed for leftover seed `SystemsLean.LlvmLinearText`
(LLVM Linear text). Structure follows LLVM Mult text TERM. Dialect is living
`llvmLinearTextReady` (collapsed product fold from `LlvmLinearText.lean`). Did
**not** invent a HostFront-shaped ready string. Did **not** copy rebuild /
self-apply / emit*Ready. Soft class is LLVM-text. L0 still accepts the bad
texts. Dialect rejects dishonest claim flips as `ILL-TYPED-TERM`. SurfaceOk
fold, not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckLlvmLinearTextTerm.lean` (358). Dialect on living `llvmLinearTextReady` plus honesty pins. |
| E-good ready | Collapsed `llvmLinearTextReady` matches `llvmLinearTextReadyTermBody`. Multiline on-disk shape also accepted. |
| Honesty | residual-free / complete / proof / local llvm unlock / PROVABLY-work / production / rust-link / llvm-as stay **false**. |
| ILL twins | residual, complete, ready body `true`, proof, llvm unlock, PROVABLY-work, production, rust-link, llvm-as. L0 accept + dialect reject. |
| LoadOk | Later-fold includes `hostModuleCheckLlvmLinearTextTermSurfaceOk` after HostGraph. LoadOkLaterTerm **156**. |
| RealModule | `refineLlvmLinearTextWithTermSurface` instead of bare L0 check. |
| Accepts | Good text is Term text, not the L0 FixtureTextsLater stub. Accepts **617**. |
| Shrink mirrors | TermOk dualOk + bar + scope LlvmLinearText-only. Harness **126**. |
| TERM dual-ok | **70 -> 71**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`, Evidence, FixturesS5, or FixtureTextsLater. Did **not** edit residual / WATCHER / SESSION-HANDOFF.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckLlvmLinearTextTerm` with DualOk / SurfaceOk false | **exit 1**. `native_decide` evaluated SurfaceOk = true is false (14 jobs) |
| Green | same theorem after DualOk true | **exit 0** (14 jobs) |

## Lake / just commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckLlvmLinearTextTerm` (red) | **1** |
| `lake build SystemsLean.HostModuleCheckLlvmLinearTextTerm` (green) | **0** |
| `lake build SystemsLean.HostModuleCheck` | **0** (114 jobs) |
| `lake build slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206) |
| `just systems-host` | **0** (346 paths) |
| `just hygiene` | **0** |

## NEXT leftover

**MultFsWriteTool** (`SystemsLean.MultFsWriteTool`, living `multFsWriteToolReady`).
On disk at `src/systems/SystemsLean/MultFsWriteTool.lean`. No
`HostModuleCheckMultFsWriteToolTerm.lean`. Seed order after this unit:
LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin. Skip
HostGraphTheorems (proof). Then LlvmTypesText.
