# Report: Term-surface for LLVM Types text (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **129 -> 130**. TERM dual-ok **74 -> 75**.
Leftover TERM **132 -> 131**. Both-lessons stay **74 of 206**. Seed **206**
unchanged. `hostResidualShrinkFullHostElaborateRemains` stays **false**.

Unit TERM accept + reject twins landed for leftover seed
`SystemsLean.LlvmTypesText` (LLVM Types IR text writer). Structure follows
LLVM Linear / Mult text TERM. Dialect is living `llvmTypesTextReady`
(collapsed product fold from `LlvmTypesText.lean`). Did **not** invent a
second ready name. Did **not** copy HostFront / FrontMult / SubsetPackageJoin
Lake-false twins. Soft class is LLVM-text. L0 still accepts the bad texts.
Dialect rejects dishonest claim flips as `ILL-TYPED-TERM`. SurfaceOk fold,
not bare DualOk. First product import stays `SystemsLean.Types`.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckLlvmTypesTextTerm.lean` (**364**). Dialect on living `llvmTypesTextReady` plus honesty pins. |
| E-good ready | Collapsed `llvmTypesTextReady` matches `llvmTypesTextReadyTermBody`. Multiline on-disk shape also accepted. |
| Honesty | residual-free / complete / proof / local llvm unlock / PROVABLY-work / production / rust-link / llvm-as stay **false**. No `stillUsesLake` pin. residual-free claimed **true** is ILL. |
| ILL twins | residual, complete, ready body `true`, proof, llvm unlock, PROVABLY-work, production, rust-link, llvm-as. L0 accept + dialect reject. |
| Soft J5 | `checkLlvmTypesTextTermDialect`. |
| LoadOk | Later-fold includes `hostModuleCheckLlvmTypesTextTermSurfaceOk` after SubsetPackageJoin. LoadOkLaterTerm **166**. |
| RealModule | `refineLlvmTypesTextWithTermSurface` instead of bare L0 check. |
| Accepts | Good text is Term text, not the L0 FixtureTextsLater stub. Accepts **621**. |
| Shrink mirrors | TermOk dualOk + bar + scope LlvmTypesText-only. Harness **130**. |
| TERM dual-ok | **74 -> 75**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`, Evidence, Fixtures, residual,
WATCHER, or SESSION-HANDOFF. Did **not** grow smoke C.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckLlvmTypesTextTerm` with DualOk / SurfaceOk false | **exit 1**. `native_decide` evaluated SurfaceOk = true is false (14 jobs, line 354) |
| Green | same theorem after DualOk true | **exit 0** (14 jobs) |

## Lake / just commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckLlvmTypesTextTerm` (red) | **1** |
| `lake build SystemsLean.HostModuleCheckLlvmTypesTextTerm` (green) | **0** |
| `lake build SystemsLean.HostModuleCheck` | **0** (119 jobs) |
| `lake build slake-host-module-check` | **0** (240 jobs) |
| `lake build SystemsLean.HostResidualShrinkTheorems` | **0** (4 jobs) |
| `just host-module-check-without-lake` | **0** (modules=206) |
| `just hygiene` | **0** |
| `just systems-host` | **0** (351 paths) |
| `just host-residual-shrink` | **0** (harness 130) |

## NEXT leftover

**MultFsDeepen** (`SystemsLean.MultFsDeepen`). Skip HostGraphTheorems (proof).
Then HostPackageWrite.
