# U7: Host module check Theorems long-file headroom (2026-08-11)

**Status:** GREEN
**Residual:** Host module check Theorems long-file headroom (U7) **done**
**Out of scope honored:** no claim pin flips; no invent units; no product C/shell; no git commit

## Goal

Extract a Theorems companion role module so `HostModuleCheckTheorems` sits under ~900 lines and leaves Sub-1-KLOC headroom for U1 TERM theorem growth.

## Before (measured)

| File | LOC |
|------|-----|
| HostModuleCheckTheorems.lean | **1000** (at Sub-1-KLOC bar; next growth blocked) |

## Role-module split (plain English seam)

**Companion:** `HostModuleCheckSmoke.lean` (`SystemsLean.HostModuleCheckSmoke`)

| Role | Module | Content |
|------|--------|---------|
| **Theorems tip** | `HostModuleCheckTheorems.lean` | HOST-MODULE-CHECK-THEOREM readable theorems (loadOk / ready / without-Lake / Mult.. good accepts / fail-closed / TERM-SURFACE / PROOF-SURFACE dual-pins / ids / claims_false) |
| **Smoke companion** | `HostModuleCheckSmoke.lean` | HOST-MODULE-CHECK-SMOKE quick `example` dual-pins over the same pins (seed labels, Mult.. accepts, TERM/PROOF surfaces) |

Same namespace `SystemsLean.HostModuleCheck` throughout so names stay unqualified.

## After (measured)

| File | LOC |
|------|-----|
| HostModuleCheckTheorems.lean | **668** (under ~900 preferred; headroom for U1) |
| HostModuleCheckSmoke.lean | **383** |

## Lockstep (surgical)

- **Imports:** `SystemsLean.lean` imports Smoke after Theorems; hub header cites Theorems/Smoke
- **Pure Nix:** `nix/systems-host-presence/host-leans.nix`, `required-files.nix`, `host-specs-compile-path-3.nix` (Theorems tip + Smoke companion entry; SMOKE token on companion)
- **Harness partition:** `HostResidualShrink` / `HostResidualShrinkTheorems` / `just/host.just`
  - harness string adds `HostModuleCheckSmoke`
  - `seed=206+Main=59+harness=64` -> **`seed=206+Main=59+harness=65`**
- Lake package discovery (no per-companion lakefile list required)

## Claim pins (unchanged)

| Pin | Value |
|-----|--------|
| free / complete / PROVABLY | **true** (not re-opened) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| product Lake pins | false (local stillUsesLake honesty on module-check family unchanged) |
| seed | **206** |
| harness | **65** (was 64; +HostModuleCheckSmoke only) |

## Commands + exits

| Command | Path class | Exit |
|---------|------------|------|
| `lake build SystemsLean.HostModuleCheckSmoke SystemsLean.HostModuleCheckTheorems SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems` | Lake (import graph / elaborator) | **0** |
| `just host-module-check-without-lake` | **Slake-preferring** without-Lake hot path | **GREEN** |
| `just host-residual-shrink` | without-Lake greps + residual shrink | **GREEN** |
| `just systems-host` | pure Nix presence | **0** (278 required paths) |
| `just hygiene` | pure Nix ASCII + tone | **0** |

## Residual lockstep

- `RESIDUAL-systems.md`: U7 **done**; Done archive row; living Open next = U1; harness living tip **65**
- `RESIDUAL.md` join Open Names: U7 **done**
- `WATCHER.md`: remaining **U1/U2/U3/U5**; U7 archived; next `/implement` U1
- `doc/SESSION-HANDOFF.md`: U7 done; living harness **65**

## Next

**U1** Host unit TERM expand (L0 real units). Theorems tip has headroom under 900 for new theorem dual-pins; smoke growth goes to `HostModuleCheckSmoke` with Sub-1-KLOC care.
