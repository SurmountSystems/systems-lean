# Implement report: Graph foreign link success (2026-08-10)

## Goal

Land last R2 progressive after Mult/Linear/Types/Program: Graph-band foreign /
out-of-tree consumer add-edge status link success. Mirror ProgramForeignLink
honesty (Program used push status codes, not three-tag enum). Graph dual is
addEdge status codes from IrGraph + freestanding Graph subset + unit/SSA IR.

## Done when (met)

| Item | Status |
|------|--------|
| `SystemsLean.GraphForeignLink.lean`: `graphForeignLinkSuccessClaimed` true; otherBands false; fullBackend false; dual contract greppable | **GREEN** |
| Import `SystemsLean.lean` | **GREEN** |
| Evidence research note | `doc/dev/research/graph-foreign-link-success-2026-08-10.md` |
| pure Nix + forge bans + `just graph-foreign-link-success` | **GREEN** |
| Prior Mult/Linear/Types/Program foreign recipes still band-local green | **GREEN** |
| Residual tip R2 foreign bands Mult..Graph progressive complete; Full LLVM R1e remaining | **updated** |
| No `LlvmCfgFixture` edit; no git; no product Rust under `src/` | **honored** |
| free/complete/PROVABLY / FullHost unchanged | **honored** |

## Honest dual surface

Primary dual is **not** a three-tag kind enum:

| Code | Meaning |
|------|---------|
| i32 0 | addEdge ok |
| i32 -1 | full or badEndpoints (emit map collapses full + badEndpoints) |
| EDGE_MAX 16 | `SLAKE_IR_EDGE_MAX` / `IrGraph.edgeMax` |

Secondary: SSA `status_ix` 0/1 maps to 0/-1 (unknown reject -2); freestanding
`slake_ir_graph_add_edge`; pushNode 0/-1/-2 cite (Program push call-through).

## Paths

| Path | Role |
|------|------|
| `src/systems/SystemsLean/GraphForeignLink.lean` | Host dual-pin |
| `src/systems/SystemsLean.lean` | Import GraphForeignLink |
| `doc/dev/research/graph-foreign-link-success-2026-08-10.md` | Evidence + out-of-tree recipe |
| `nix/systems-llvm-ir/graph-foreign-link-success.nix` | Presence + forge bans |
| `nix/systems-llvm-ir/specs.nix` | Join Graph foreign slice |
| `nix/systems-llvm-ir/default.nix` | Summary mentions Graph foreign |
| `just/llvm.just` | `graph-foreign-link-success` recipe |
| residual + handoff + WATCHER | Living tip / next action |

## Gates run

```text
lake build SystemsLean.GraphForeignLink          # exit 0
just graph-foreign-link-success                  # exit 0 (systems-llvm-ir + lake + rustc dogfood + llvm-as)
just mult-foreign-link-success                   # exit 0 Mult-only
just linear-foreign-link-success                 # exit 0 Linear Mult-class
just types-foreign-link-success                  # exit 0 Types kind tags
just program-foreign-link-success                # exit 0 Program push codes
just hygiene                                     # exit 0
```

Dogfood: size 4, align 4, add_edge 0/-1, EDGE_MAX 16, target x86_64-unknown-linux-gnu.

## Pins unchanged

- free / complete / PROVABLY: living tips true (not flipped)
- FullHostElaborateRemains: false
- fullBackend / production opt / DominanceClaimed: false
- Mult/Linear/Types/Program `*OtherBandsClaimed`: false
- Graph `graphForeignLinkOtherBandsClaimed`: false (Graph-band only; no further foreign)
- Product Rust under `src/`: forbidden (out-of-tree /tmp only)

## Residual tip after slice

R2 Mult..Graph foreign progressive **complete** (Mult Mult-only, Linear Mult-class,
Types kind, Program push, Graph add-edge). Open remains **Full LLVM production
backend** (R1e honesty done; fullBackend false until full iterative CFG + lake
pin flip). Held: full elaborator/mathlib day-one; AffineDrop dual; true Rust-native
multi-band product link.
