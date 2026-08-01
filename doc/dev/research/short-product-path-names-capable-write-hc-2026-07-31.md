# Short product-path names batch 10 -- CapableWriteHc (2026-07-31)

Kind: analysis + implement inventory. Residual companion.

## Rename

| From | To |
|------|-----|
| `ProductPathFreestandingCapableWriteHc.lean` | `CapableWriteHc.lean` |
| `ProductPathFreestandingCapableWriteHcMain.lean` | `CapableWriteHcMain.lean` |
| `SystemsLean.ProductPathFreestandingCapableWriteHc` | `SystemsLean.CapableWriteHc` |
| `SystemsLean.ProductPathFreestandingCapableWriteHcMain` | `SystemsLean.CapableWriteHcMain` |

Claim bools and APIs **unchanged** (e.g. `productPathFreestandingCapableWriteHc*`,
`freestandingCapableWriteFreestandingHc`). Lake exe name
`slake-freestanding-capable-write-hc` unchanged. Distinct from perform substrate
`ProductPathWriteHc` / `ProductPathWriteHcMain` (not renamed this batch).

## Sites touched (surgical hand edits)

| Path | Change |
|------|--------|
| `CapableWriteHc.lean` / `CapableWriteHcMain.lean` | mv + namespace / import |
| `SelfApplyFs.lean` | import + tip string cites (module basename) |
| `CapableRegenerate.lean` | import + API call path |
| `CapableStepContract.lean` | comment module cites |
| `lakefile.toml` | exe root `SystemsLean.CapableWriteHcMain` |
| `justfile` | path greps + comment basenames + dualSsotSpecs authority |
| `nix/systems-emit-wire/emit-product.nix` | modulePath + Main + basename tokens |
| `nix/systems-emit-wire/default.nix` | WRITE-HC hostPin basename |
| `nix/systems-host-presence/specs.nix` | rel + module tokens |
| `nix/systems-host-presence/host-specs-join-surface.nix` | basename token |
| `src/systems/README.md`, `host-partial-inventory.md`, `self-host.md` | module basename cites |
| `doc/SESSION-HANDOFF.md` | module list cite |
| `SelfHostComplete.lean`, `StepContractFull.lean`, `OwnershipClaimed.lean`, `PerformClaimed.lean`, `OfficialRetire.lean` | capableWriteModule string pin |
| DualEq homes (CapableGap/ClosePath/Parity) | capableWriteModule string pin + greppable cites |
| residual / WATCHER | Open next OfficialPathAlternate (or DualEq*) |

## Remaining ProductPathFreestanding* leaves after this batch

- ProductPathFreestandingPerformOfficialPathAlternate (+Main)
- ProductPathFreestandingPerformDualEqualityWriteParity (+Main)
- ProductPathFreestandingPerformDualEqualityWriteClosePath (+Main)
- ProductPathFreestandingPerformDualEqualityWriteApi (+Main)
- ProductPathFreestandingPerformDualEqualityWriteCapableGap (+Main)

## Claims preserved

- complete / stepContractFull / ownership / perform: true
- residualFreeClaimed / llvmUnlocked / provablyUnlocked: false

## Next short-name leaf

**OfficialPathAlternate** (`ProductPathFreestandingPerformOfficialPathAlternate` + Main)
-> prefer short role name `OfficialPathAlternate` (plan 8c).

## Gates

| Gate | Result |
|------|--------|
| `just hygiene` | GREEN |
| `just systems-host` | GREEN |
| `just systems-emit-wire` | GREEN |
| `lake build SystemsLean.CapableWriteHc SystemsLean.SelfApplyFs` | GREEN |
| `just freestanding-self-host-complete` | GREEN (lake claim proof ran) |

## Claims preserved (verified)

- complete / stepContractFull / ownership / perform: true
- residualFreeClaimed / llvmUnlocked / provablyUnlocked: false
