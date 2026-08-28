# HostCheck TERM-SURFACE

Host fragment check (`SystemsLean.HostCheck`) has an L2 term-surface dialect.
Clone class is HostFront TERM. Living ready name is `hostFragmentCheckReady`
(not `hostCheckReady`). Scope `HostCheck-only`. Gate truth is
`hostModuleCheckHostCheckTermSurfaceOk`.

Long-file split first: `HostModuleCheckAccepts.lean` (996) split to
`HostModuleCheckAcceptsLater.lean` (fail-closed bads + Mult..Extract twins).
Accepts tip uses TERM good text for HostCheck.

Harness 122 -> 124 (HostCheckTerm + AcceptsLater). Seed 206 unchanged.
Did not flip FullHost / DominanceClaimed / FullBackend.

RED then GREEN: `lake build SystemsLean.HostModuleCheckHostCheckTerm`
(SurfaceOk false, then true; theorem unchanged).
`lake build SystemsLean.HostModuleCheck` exit 0.
`just host-module-check-without-lake` exit 0 after rebuilding
`slake-host-module-check` so the real HostCheck.lean hit the dialect.

Detail: `/tmp/grok-1000/grok-impl-summary-w4-hostcheck-term.md`.
