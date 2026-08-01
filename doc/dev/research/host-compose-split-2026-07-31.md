# HostCompose long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/HostCompose.lean` | 669 | **220** (-449) |
| `src/systems/SystemsLean/HostComposeTheorems.lean` | (new) | **485** |

Parent under 500. Seam is COMPOSE-THEOREM + HOST-SMOKE split (not dual-pin, not tip).

## Stay / move

| Stay on HostCompose | Moved to HostComposeTheorems |
|---------------------|------------------------------|
| Module header + core dialect | COMPOSE-THEOREM / HOST-COMPOSE-THEOREM block |
| `LinearHost`, `Host`, `empty` | Empty + mult fixtures + algebraic deepen theorems |
| `MintResult` / `ConsumeResult` / mint / consume | pushHostNode / addHostEdge fail-closed theorems |
| `markErased`, push/edge result types + defs | HOST-SMOKE examples |
| `nodeMultOk` / `multPreScan` / check / extract | Same namespace `SystemsLean.HostCompose` |
| Header cites split companion | Imports parent `SystemsLean.HostCompose` |

## Coherence

- One seam: theorem + smoke surface vs core HOST-COMPOSE dialect API.
- Theorems import parent (depend on defs); parent does not import theorems
  (no cycle). Root `SystemsLean.lean` imports both so lake builds theorems.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- HostComposeTheorems path
- `nix/systems-host-presence/required-files.nix` -- HostComposeTheorems path
- `nix/systems-host-presence/host-specs-core.nix` -- parent thinned; Theorems row
- `src/systems/SystemsLean.lean` -- import companion
- `src/systems/README.md` -- table row for companion

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
