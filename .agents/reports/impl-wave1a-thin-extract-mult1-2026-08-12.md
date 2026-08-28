# Thin extract MULT-1 close -- implementer report

**Status:** GREEN

**Name:** Thin extract MULT-1 close (two-target emit, Track C Name 1)

**Date:** 2026-08-12

## Named contract

HostCompose and frozen freestanding C reject a MULT-1 use when there is no live
token (spent / unminted). Thin Extract used to have a success theorem
`extractOk_mult1_fs_true` that said extract is OK with no live-token evidence.
This Name closes that disagreement. HostCompose meaning is unchanged. No
product C edit.

Thin Extract still has no `linear.live` input. Fail-closed is therefore
`| Mult.mult1 => false`. Minted MULT-1 extract stays on HostCompose
(`nodeMultOk` / `multPreScan` require `hc.linear.live`).

## RED (before product Extract edit)

1. Inverted `extractOk_mult1_fs_true` to expect
   `extractOk Mult.mult1 e RuntimeClaim.runtimeFs = false` while
   `Extract.checkFailClosed` still had `| Mult.mult1 => true`.
2. Command: `lake build SystemsLean.ExtractTheorems`
3. Theorem: `extractOk_mult1_fs_true` (inverted statement, old product)
4. Fail reason (exit 1):
   - `ExtractTheorems.lean:99:0`: not a definitional equality;
     left-hand side `extractOk Mult.mult1 e RuntimeClaim.runtimeFs` is not
     definitionally `false`.
   - `ExtractTheorems.lean:102:61`: `rfl` has type `?m.3 = ?m.3` but is
     expected to have type `extractOk Mult.mult1 e RuntimeClaim.runtimeFs = false`.

## Product fix

`SystemsLean.Extract.checkFailClosed`: `| Mult.mult1 => true` became
`| Mult.mult1 => false`. Runtime-classic / edge reject and MULT-0 / MULT-OMEGA
arms unchanged. HostCompose not weakened.

## GREEN (same filter after product edit)

Command: `lake build SystemsLean.ExtractTheorems SystemsLean.HostCostTheorems`

Exit 0.

Also green (fixtures / TERM dialect that named the old success theorem):

- `lake build SystemsLean.HostModuleCheckExtractTerm SystemsLean.HostModuleCheckFixtures SystemsLean.HostModuleCheckRequiredDecls SystemsLean.HostModuleCheckFixtureTexts`
- `lake build SystemsLean.HostModuleCheckAcceptsGoods SystemsLean.HostModuleCheckLoadOk`

## What happened to the two named theorems

| Old | New |
|-----|-----|
| `extractOk_mult1_fs_true` (`= true`) | **Inverted and renamed** `extractOk_mult1_fs_false` (`= false`) |
| `extractOkFromTags?_mult1_fs_true` (`some true`) | **Inverted and renamed** `extractOkFromTags?_mult1_fs_false` (`some false`) |
| `hostCost_thin_extract_mult1_disagrees_compose` | **Retired.** Replacement agreement: `hostCost_thin_extract_mult1_agrees_compose` (thin Extract MULT-1 false **and** HostCompose spent fixture extractOkFs false) |

Did **not** rewrite the red expectation to keep "extract succeeds."

## Files changed

- `src/systems/SystemsLean/Extract.lean` (product reject + header honesty)
- `src/systems/SystemsLean/ExtractTheorems.lean` (invert / rename)
- `src/systems/SystemsLean/HostCost.lean` (cite agreement theorem)
- `src/systems/SystemsLean/HostCostTheorems.lean` (agreement theorem)
- `src/systems/SystemsLean/HostCompose.lean` (nodeMultOk comment: minted path)
- `src/systems/SystemsLean/SpecProof.lean` (header honesty)
- `src/systems/SystemsLean/HostModuleCheckExtractTerm.lean` (TERM body + fixtures)
- `src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean`
- `src/systems/SystemsLean/HostModuleCheckFixtures.lean`
- `src/systems/SystemsLean/HostModuleCheckFixtureTexts.lean`
- `nix/systems-host-presence/host-specs-core-1.nix` (presence tokens)
- `src/systems/extract.md`, `src/systems/host-partial-inventory.md`,
  `src/systems/surface-matrix.md`
- Residual lockstep: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
  `doc/SESSION-HANDOFF.md`

No emit SSOT. No product C. No `just build`.

## Line counts (under 1000)

| File | Lines |
|------|------:|
| `Extract.lean` | 160 |
| `ExtractTheorems.lean` | 254 |
| `HostCost.lean` | 359 |
| `HostCostTheorems.lean` | 575 |
| `HostModuleCheckExtractTerm.lean` | 539 |

## Gates

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.ExtractTheorems` (RED) | 1 |
| `lake build SystemsLean.ExtractTheorems SystemsLean.HostCostTheorems` (GREEN) | 0 |
| `just hygiene` | 0 |
| `just systems-host` | 0 |

`just systems-emit-wire` not run (no emit / unit-walk token move).
`just build` not run (no SSOT move).

## Residual

Thin extract MULT-1 close **done**. Other Open Names left open. Highest-value
next is HostCost single-walk Nat. WATCHER has `/implement` for that Name.
Pins unchanged: free / complete / PROVABLY true; FullHostElaborateRemains
false; DominanceClaimed / band FullBackend false.

## GREEN or BLOCKED

**GREEN**
