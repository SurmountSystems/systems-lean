# Implement report: Full LLVM Done when (10) -- path B DF non-requirement

**IMPL_ID:** bd66489f
**Date:** 2026-08-10
**Status:** **GREEN**
**Decision:** **path B** (document DF non-requirement for bar item (2); do **not** land full DF dual-pin theater)
**fullBackend flipped?** **No** -- intentionally false

## Decision A vs B

| Option | Chosen? | Why |
|--------|---------|-----|
| **A** Land full DF pipeline dual-pin toward `llvmCfgFixtureDominanceClaimed` | No | Bar item (2) already says "Dominance frontier **partial** or general program CFG". Full DominanceClaimed was optional extra from R1e, not a hard bar requirement. Path A would be algorithm theater relative to written bar. |
| **B** Document product decision that Mult DF partial + unit Mult..Graph dual-pin + iterative multi-node IR CFG walk is enough for bar (2) without DominanceClaimed true | **Yes** | Matches bar text; honesty over forge; leaves fullBackend false. |

## Pin honesty table

| Pin | Value after this slice | Notes |
|-----|------------------------|-------|
| `dominancePipelineRequiredForFullBackend` | **false** | New short role honesty pin in `LlvmCfgHonesty` |
| `llvmCfgFixtureDominanceClaimed` | **false** | Full DF algorithm optional extra; unclaimed |
| `fullLlvmBarEvidencePartial` | **true** | Now requires path B pin false |
| `llvmCfgFixtureFullBackendClaimed` | **false** | Not flipped; never alias of partial pin |
| `llvmCfgFixtureProductionOptClaimed` | **false** | Intentional non-claim |
| Mult..Graph band `*FullBackendClaimed` | **false** | Unchanged |
| free / complete / PROVABLY | **true** | Unchanged |
| FullHostElaborateRemains | **false** | Unchanged |
| Mult..Graph foreign band-local | **success** | Unchanged |

## Product / docs land

1. **Host Lean:** `dominancePipelineRequiredForFullBackend := false` in
   `SystemsLean/LlvmCfgHonesty.lean`; joined into `fullLlvmBarEvidencePartial`
   and package ok; theorem + smoke `dominancePipelineRequiredForFullBackend_false`
   in `LlvmCfgFixture.lean`.
2. **Pure Nix forge-ban:** exact def false required; def true forbidden in
   `cfg-fixture.nix`, `cfg-general-program-partial.nix`, `cfg-iterative-cfg-partial.nix`.
3. **Bar note:** path B product decision section + living pin/gap tables reseed
   (`doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md`).
4. **Residual:** Full LLVM progressive Done when (1)-(10) met path B; Name moved
   to Done archive; Open queue keeps **Rust IR full intercompat** + **Full readiness
   program** (announce). `RESIDUAL.md` join tip lockstep.
5. **SESSION-HANDOFF / plan living tip / WATCHER:** progressive Full LLVM done;
   next checkable Open is Rust IR full intercompat.

## Gates (exit codes)

| Gate | Exit |
|------|------|
| `lake build SystemsLean.LlvmCfgFixture` | **0** |
| `just hygiene` | **0** |
| `just systems-llvm-ir` | **0** |
| `just iterative-cfg-construction-partial` | **0** |
| `just mult-dominance-frontier-partial` | **0** |

Note: systems-llvm-ir was red once from a concurrent Rust IR research note token
mismatch (`not product Rust`); fixed exact greppable honesty phrase so pure Nix
presence could pass. Not a product claim flip.

## Out of scope (honored)

- Did not forge fullBackend true
- Did not invent production opt pipeline
- Did not grow product C / product Rust under `src/`
- Did not alias fullBackend to `llvmUnlocked` or `fullLlvmBarEvidencePartial`

## Next

WATCHER points at **Rust IR full intercompat** (checkable Open). fullBackend claim
flip remains operator-held announce residual only.
