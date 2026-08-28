# Report: Term-surface for FrontMultPackage (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no. Not PE for this unit.

## Class

**HostFront-class** (host fragment front-end). Clone of
`HostModuleCheckHostFrontTerm` / HostCheck / HostGraph.

`FrontMultPackage` is SubsetFront G1 accept then Mult package write. Living
dialect `frontMultPackageReady`. Not `IO.FS.writeFile` writer-tool. Not LLVM
IR text. ILL twins match this module: residual-free, complete, ready body,
proof, llvm, PROVABLY, Lake. No llvm-as / rust-link / native Io / prints-C.

## Verdict

**GREEN.** Pin stays false. Harness **127 -> 128**. TERM dual-ok **72 -> 73**.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckFrontMultPackageTerm.lean` (**323**). |
| E-good ready | Collapsed `frontMultPackageReady` matches `frontMultPackageReadyTermBody`. Multiline on-disk shape also accepted. |
| Honesty | residual-free / complete / proof / llvm / PROVABLY stay **false**. Lake pins stay **true**. |
| ILL twins | residual, complete, ready body `true`, proof, llvm, PROVABLY, Lake. L0 accept + dialect reject. |
| LoadOk | Later-fold includes `hostModuleCheckFrontMultPackageTermSurfaceOk` after MultFsWriteTool. LoadOkLaterTerm **161**. |
| RealModule | `refineFrontMultPackageWithTermSurface` instead of bare L0 check. |
| Accepts | Good text is Term text. Accepts **619**. |
| Shrink mirrors | TermOk dualOk + bar + scope FrontMultPackage-only. Harness **128**. |
| TERM dual-ok | **72 -> 73**. Seed **206** unchanged. |

Did **not** edit PackageEnv family, residual, WATCHER, or SESSION-HANDOFF.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckFrontMultPackageTerm` with DualOk false | **exit 1**. `native_decide` evaluated SurfaceOk = true is false (14 jobs) |
| Green | same theorem after DualOk true | **exit 0** (14 jobs) |

## Lake / just commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckFrontMultPackageTerm` (red) | **1** |
| `lake build SystemsLean.HostModuleCheckFrontMultPackageTerm` (green) | **0** |
| `lake build SystemsLean.HostModuleCheck` | **0** (117 jobs) |
| `just host-module-check-without-lake` | **0** (modules=206) |
| `just systems-host` | **0** (349 paths) |
| `just hygiene` | **0** |

## NEXT leftover

**Package-import for FrontMultPackage** (`SystemsLean.FrontMultPackage`, living
`frontMultPackageReady`). After both lessons: **SubsetPackageJoin**. Skip
HostFrontTheorems and HostGraphTheorems (proof).
