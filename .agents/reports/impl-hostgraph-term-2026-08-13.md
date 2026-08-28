# HostGraph TERM-SURFACE

Host fragment graph (`SystemsLean.HostGraph`) has an L2 term-surface dialect.
Clone class is HostCheck TERM. Living ready name is `hostGraphReady`
(not a new ready name). Scope `HostGraph-only`. Gate truth is
`hostModuleCheckHostGraphTermSurfaceOk`. Skip HostGraphTheorems.

Companion `HostModuleCheckHostGraphTerm` (340). Collapsed `hostGraphReady`
body matcher (goldens + ids + HostFront reuse + Lake + residual + peer-green
+ living false residual-free / complete / proof / llvm / PROVABLY).
ILL-TYPED-TERM twins match HostCheck. Accepts swaps L0 stub for TERM text.
RealModule `refineHostGraphWithTermSurface`. LoadOkLaterTerm folds SurfaceOk
after HostCheck. LoadOk already had the HostGraph good accept.

Harness 124 -> 125. Term-surface dual-ok 69 -> 70. Seed 206 unchanged.
Did not flip FullHost / DominanceClaimed / FullBackend.
Did not edit PackageEnv / residual / WATCHER / handoff / RuntimeBench.

RED then GREEN: `lake build SystemsLean.HostModuleCheckHostGraphTerm`
(SurfaceOk false, then true; theorem unchanged).
`lake build SystemsLean.HostModuleCheck` exit 0.
`just host-module-check-without-lake` exit 0 after rebuilding
`slake-host-module-check` so the real HostGraph.lean hit the dialect.

Detail: `/tmp/grok-1000/grok-impl-summary-w4-hostgraph-term.md`.
