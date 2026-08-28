# Implement report: Full LLVM R1e honesty review (2026-08-10)

## Decision

**Do not flip `fullBackend` / `llvmCfgFixtureFullBackendClaimed` true.**

Conservative honesty after inventory of bar items (1)-(6). Progressive dual-pin
evidence is real; end claim is not yet honest.

## Bar inventory

| Bar | Status | Notes |
|-----|--------|-------|
| (1) Multi-unit Mult..Graph CFG dual-pin | **met** | R1a..R1d |
| (2) Mult DF partial / Program-Graph unit CFG | **met partial** | DominanceClaimed false |
| (3) General CFG beyond unit diamonds | **met partial** | compose multi-merge; not iterative over arbitrary IR |
| (4) Production opt / llc | **non-claim false** | intentional until machine code emit residual |
| (5) Short readiness pin + lake | **partial pin true** | `fullLlvmBarEvidencePartial` (not fullBackend) |
| (6) Honesty review | **met** | this residual |

## Remaining for fullBackend true

1. Full iterative CFG construction over arbitrary multi-node IR.
2. Full DF pipeline only if product requires DominanceClaimed for end claim.
3. Lake-proofed fullBackend pin flip after those gaps (never alias unlock or
   `fullLlvmBarEvidencePartial`).
4. Band-local `*FullBackendClaimed` stay false until fixture end claim flips.

## Product edits

| Path | Change |
|------|--------|
| `SystemsLean/LlvmCfgGeneral.lean` | `fullLlvmBarEvidencePartial` true join |
| `SystemsLean/LlvmCfgFixture.lean` | surface/package join + theorem/smoke |
| `SystemsLean/LlvmCfgHonesty.lean` | header note: partial != fullBackend |
| `nix/systems-llvm-ir/cfg-general-program-partial.nix` | presence for partial pin |
| `nix/systems-llvm-ir/cfg-fixture.nix` | theorem name presence |
| `just/llvm.just` | general-program-cfg-partial greps partial pin |
| `doc/dev/research/full-llvm-production-backend-bar-2026-08-10.md` | R1e honesty section |
| residual / handoff / plan / WATCHER | lockstep |

## Pins (post R1e)

| Pin | Value |
|-----|-------|
| `llvmCfgFixtureFullBackendClaimed` | **false** |
| `llvmCfgFixtureProductionOptClaimed` | **false** |
| `llvmCfgFixtureDominanceClaimed` | **false** |
| `fullLlvmBarEvidencePartial` | **true** |
| free / complete / PROVABLY | **unchanged true** |
| FullHostElaborateRemains | **unchanged false** |
| Mult..Graph foreign success | **true** band-local (R2 done; not fullBackend) |

## Gates

| Gate | Result |
|------|--------|
| `lake build SystemsLean.LlvmCfgFixture` | GREEN (exit 0) |
| `just hygiene` | GREEN |
| `just systems-llvm-ir` | GREEN |
| `just general-program-cfg-partial` | GREEN (lake re-proof) |
| `just graph-foreign-link-success` | GREEN (already on disk; not claimed as R1e work) |

## Non-claims

No product C. No shell mills. No fullBackend forge. Graph foreign was already on
disk and verified green; residual prose lockstep corrected where it lagged.
Production opt remains intentional non-claim.

## Next

WATCHER: Full iterative CFG construction residual under Full LLVM Done when (9).
Report path for next: `.agents/reports/impl-full-iterative-cfg-construction-2026-08-10.md`.
