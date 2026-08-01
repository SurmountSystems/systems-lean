# Short product-path names batch 9 -- CapableCompose (2026-07-31)

Kind: analysis + implement inventory. Residual companion.

## Rename

| From | To |
|------|-----|
| `ProductPathFreestandingCapableCompose.lean` | `CapableCompose.lean` |
| `ProductPathFreestandingCapableComposeMain.lean` | `CapableComposeMain.lean` |
| `SystemsLean.ProductPathFreestandingCapableCompose` | `SystemsLean.CapableCompose` |
| `SystemsLean.ProductPathFreestandingCapableComposeMain` | `SystemsLean.CapableComposeMain` |

Claim bools and APIs **unchanged** (e.g. `productPathFreestandingCapableCompose*`,
`freestandingCapableComposePlanApplyBody`). Lake exe name
`slake-freestanding-capable-compose` unchanged.

## Sites touched (surgical hand edits)

| Path | Change |
|------|--------|
| `CapableCompose.lean` / `CapableComposeMain.lean` | mv + namespace / import |
| `SelfApplyFs.lean` | import + PartialReady fold + tip string cites |
| `CapableRegenerate.lean` | import + API call path |
| `CapableStepContract.lean` | comment module cites |
| `lakefile.toml` | exe root `SystemsLean.CapableComposeMain` |
| `justfile` | path greps + comment basenames |
| `nix/systems-emit-wire/emit-product.nix` | modulePath + Main + basename tokens |
| `nix/systems-emit-wire/default.nix` | COMPOSE hostPin basename |
| `nix/systems-host-presence/specs.nix` | rel + module tokens |
| `nix/systems-host-presence/host-specs-join-surface.nix` | basename token |
| `src/systems/README.md`, `host-partial-inventory.md`, `self-host.md` | module basename cites |
| `doc/SESSION-HANDOFF.md` | module list cite |
| residual / WATCHER | Open next CapableWriteHc |

## Gates

| Gate | Result |
|------|--------|
| `just hygiene` | GREEN |
| `just systems-host` | GREEN |
| `just systems-emit-wire` | GREEN |
| `lake build SystemsLean.CapableCompose SystemsLean.SelfApplyFs` | GREEN |
| `just freestanding-self-host-complete` | GREEN (lake claim proof ran) |

## Claims preserved

- complete / stepContractFull / ownership / perform: true
- residualFreeClaimed / llvmUnlocked / provablyUnlocked: false

## Next short-name leaf

**CapableWriteHc** (`ProductPathFreestandingCapableWriteHc` + Main).

## Residual lag fix (same turn)

Review REQUEST_CHANGES dual-pin b30-33 exhaust: residual footer/status pointed at
batch 30 while WATCHER said short-name. Fixed RESIDUAL-systems Highest-value-now
row + Next implement footer; annotated b31-33 packed honesty (3750->3638, -112);
RESIDUAL.md join rows aligned; tip **3638**.
