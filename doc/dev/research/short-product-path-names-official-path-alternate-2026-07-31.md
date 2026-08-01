# Short product-path names -- OfficialPathAlternate (2026-07-31)

Kind: analysis + implement inventory. Residual companion.

## Rename

| From | To |
|------|-----|
| `ProductPathFreestandingPerformOfficialPathAlternate.lean` | `OfficialPathAlternate.lean` |
| `ProductPathFreestandingPerformOfficialPathAlternateMain.lean` | `OfficialPathAlternateMain.lean` |
| `SystemsLean.ProductPathFreestandingPerformOfficialPathAlternate` | `SystemsLean.OfficialPathAlternate` |
| `SystemsLean.ProductPathFreestandingPerformOfficialPathAlternateMain` | `SystemsLean.OfficialPathAlternateMain` |

Claim bools and APIs **unchanged** (e.g. `productPathFreestandingPerformOfficialPathAlternate*`).
Lake exe `slake-freestanding-perform-official-path-alternate` unchanged.
Distinct from `OfficialPath` / `OfficialPathMain` (official-path gap substrate).

## Sites

Home/Main, SelfApplyFs, sibling Main comment cites, lakefile, justfile,
nix emit-wire + host-presence, README, self-host, host-partial-inventory,
SESSION-HANDOFF.

## Gates

See campaign rollup join (all five leaves gated together after serial renames).
