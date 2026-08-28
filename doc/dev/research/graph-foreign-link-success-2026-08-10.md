# Graph foreign link success (2026-08-10)

Kind: evidence / dual agreement recipe for Graph foreign add-edge status link.
Not full LLVM production backend. Not a further multi-band Rust product crate.
Not Mult otherBands flip (Mult Mult-only stays true in MultForeignLink).
Not Linear otherBands flip (Linear Mult-class tags stay in LinearForeignLink).
Not Types otherBands flip (Types kind tags stay in TypesForeignLink).
Not Program otherBands flip (Program push codes stay in ProgramForeignLink).
Not free / complete / PROVABLY / FullHostElaborateRemains flip.
Not product Rust crate under `src/`. Not classic elaborator full parity.

ASCII only. Plain English. Date: 2026-08-10.

**Greppable:** `GRAPH-FOREIGN-LINK-SUCCESS`,
`SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0`, `HOST-GRAPH-FOREIGN-LINK`,
`GRAPH-FOREIGN-DUAL-AGREEMENT`, `FOREIGN-GRAPH-CONSUMER-CONTRACT`,
`graph-foreign-link-success`, out-of-tree

**Plan track:** `.agents/plans/plan-full-readiness-2026-08-09.md` R2
**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Host dual-pin:** `src/systems/SystemsLean/GraphForeignLink.lean`
**Mult template:** `SystemsLean.MultForeignLink` / Mult Mult-only
**Linear template:** `SystemsLean.LinearForeignLink` / Linear Mult-class tags
**Types template:** `SystemsLean.TypesForeignLink` / Types kind tags
**Program template:** `SystemsLean.ProgramForeignLink` / Program push codes
**Gate:** `just graph-foreign-link-success`; pure Nix
`nix/systems-llvm-ir/graph-foreign-link-success.nix`

---

## 1. Intent

Land **Graph-band foreign / out-of-tree consumer link success** for Graph
add-edge status codes (i32 0 / -1 ok / full-or-badEndpoints, EDGE_MAX=16),
mirroring Mult Mult-only, Linear foreign Mult-class tags, Types foreign kind
tags, and Program foreign push codes. This is the **last R2 progressive** on
Mult..Graph foreign bands.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Graph foreign link success** | Graph add-edge status codes agree across Graph SSOT, freestanding Graph subset API cite, Graph unit IR add-edge constants, Graph SSA add-edge constants / add_edge_status honesty, layout size/align pattern, and a named foreign consumer contract so an out-of-tree consumer can match size/align/discriminants without an in-tree product Rust crate |
| **Dual Graph layout/IR agreement** | One recipe dual-pins Graph surfaces above; host Lean claims Graph band success only |
| **Primary dual** | Add-edge status codes i32 0 / -1 (ok / full-or-badEndpoints), size 4, align 4, EDGE_MAX=16 on `x86_64-unknown-linux-gnu` |
| **Secondary cite** | Freestanding `slake_ir_graph` + `slake_ir_graph_add_edge` (struct + API; not a second Mult grade enum). SSA `status_ix` 0/1 maps to primary codes 0/-1 (unknown maps to reject -2). pushNode 0/-1/-2 is a secondary API cite (call-through Program push) |
| **Out-of-tree consumer** | Optional live dogfood under `/tmp` (not product git); documented command below |

**Honest dual surface (no invented kind tags):** Graph IR is **not** a
three-tag i32 kind enum like Mult/Linear/Types. On-disk dual surface is
**add_edge status tags** already present in unit IR and SSA
(`@slake_graph_add_edge_{ok,fail}` / `@slake_graph_ssa_add_edge_{ok,fail}`
and `slake_graph_ssa_add_edge_status`). Do not invent a Graph kind ladder.
Program already owns push status codes; Graph primary dual is **add_edge**.

This residual does **not** claim full multi-band Rust-native product link,
full Rust ABI freeze, or full LLVM production backend.

---

## 2. Dual Graph add-edge agreement recipe

| # | Surface | Required Graph facts |
|---|---------|----------------------|
| 1 | Graph SSOT (`SystemsLean.IrGraph`) | `edgeMax` 16; `AddEdgeResult` ok / full / badEndpoints; EMPTY-GRAPH-OK; IR_GRAPH_EDGES_V0; emit map addEdge 0 / -1 |
| 2 | Freestanding Graph (`slake_graph_subset.h`) | `SLAKE_IR_EDGE_MAX` 16; `slake_ir_graph_add_edge` returns 0 / -1; is_well_typed EMPTY-GRAPH-OK; IR_GRAPH_EDGES_V0 (secondary API cite) |
| 3 | Graph unit IR (`out/llvm-ir/slake_graph.ll`) | `@slake_graph_edge_max` i32 16; `@slake_graph_add_edge_{ok,fail}` i32 0/-1 align 4; `slake_graph_is_well_typed` |
| 4 | Graph SSA IR (`out/llvm-ir/slake_graph_ssa.ll`) | `@slake_graph_ssa_edge_max` i32 16; `@slake_graph_ssa_add_edge_{ok,fail}` i32 0/-1; `slake_graph_ssa_add_edge_status` + kernel_band_ready + is_well_typed |
| 5 | Layout fixture pattern | size 4; align 4; `x86_64-unknown-linux-gnu`; LAYOUT-SIZE-ALIGN-FIXTURE (Mult-primary; Graph add-edge codes same i32 pattern) |
| 6 | Foreign consumer contract (host Lean) | FOREIGN-GRAPH-CONSUMER-CONTRACT: i32 encoding; size 4; align 4; same triple; codes 0/-1; EDGE_MAX=16 |
| 7 | Host claim | `graphForeignLinkSuccessClaimed` true; further other bands false; full backend false |

**Honesty vs freestanding graph struct:** primary dual is add-edge status codes
i32 0/-1 and EDGE_MAX=16. `slake_ir_graph` aggregates program + edge slots +
count + valid; this residual does not freeze the full graph struct as product
Rust. Mult/Linear/Types/Program foreign success did not freeze aggregates either.

**Greppable dual recipe id:** `GRAPH-FOREIGN-DUAL-AGREEMENT`

---

## 3. Out-of-tree consumer recipe (documented command)

Prefer **no** product Rust under `src/`. Optional live check (when `rustc` is on
PATH) is written under `/tmp` by `just graph-foreign-link-success` and deleted
after. Manual re-run:

```bash
# From repo root. Does not write product sources under src/.
TMP=$(mktemp -d /tmp/slake-graph-foreign-link.XXXXXX)
cat > "$TMP/consumer.rs" <<'RS'
// Out-of-tree Graph foreign consumer dogfood. Not product crate.
// Primary dual: add_edge status codes 0 ok, -1 full/badEndpoints; EDGE_MAX=16.
#[repr(i32)]
#[derive(Copy, Clone, PartialEq, Eq)]
enum GraphAddEdgeStatus {
    Ok = 0,
    Fail = -1,
}

fn main() {
    assert_eq!(std::mem::size_of::<GraphAddEdgeStatus>(), 4);
    assert_eq!(std::mem::align_of::<GraphAddEdgeStatus>(), 4);
    assert_eq!(std::mem::size_of::<i32>(), 4);
    assert_eq!(GraphAddEdgeStatus::Ok as i32, 0);
    assert_eq!(GraphAddEdgeStatus::Fail as i32, -1);
    const EDGE_MAX: i32 = 16;
    assert_eq!(EDGE_MAX, 16);
    println!("GRAPH-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");
    println!("size=4 align=4 add_edge=0,-1 edge_max=16 target=x86_64-unknown-linux-gnu");
}
RS
rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
"$TMP/consumer"
rm -rf "$TMP"
```

**Expected:** size 4, align 4, discriminants 0 / -1, EDGE_MAX=16. Matches layout
fixture pattern and Graph unit IR i32 add-edge constants on
`x86_64-unknown-linux-gnu`.

**llvm-as (optional peer):** when `llvm-as` is on PATH,
`llvm-as out/llvm-ir/slake_graph.ll -o /dev/null` and
`llvm-as out/llvm-ir/slake_graph_ssa.ll -o /dev/null` should exit 0. That is
assemble smoke for Graph IR, not production backend.

**Classic C ABI fallback (still valid):** freestanding Graph subset add_edge API
remains an engineering escape; primary foreign success is add-edge code layout
match, not a freeze of the full `slake_ir_graph` as product Rust.

---

## 4. Remaining bands (honest non-claims)

| Band | Foreign link status |
|------|---------------------|
| Mult | **success** (Mult Mult-only; MultForeignLink; otherBands false) |
| Linear | **success** (Linear Mult-class tags; LinearForeignLink; otherBands false) |
| Types | **success** (Types kind tags VALUE/LINEAR/ERASED; TypesForeignLink; otherBands false) |
| Program | **success** (Program push codes 0/-1/-2 CAP=8; ProgramForeignLink; otherBands false) |
| **Graph** | **success** (this residual; Graph add-edge codes 0/-1 EDGE_MAX=16) |
| Full multi-band Rust product crate | **not claimed** (further otherBands false) |
| Full LLVM production backend | **false** |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** living tips (unchanged; not re-opened) |
| Full classic elaborator parity | measured bar unchanged; not rebranded by this slice |
| Product Rust under `src/` | **forbidden** default |
| Mult `multForeignLinkOtherBandsClaimed` | **false** (unchanged; Mult Mult-only) |
| Linear `linearForeignLinkOtherBandsClaimed` | **false** (unchanged; Linear Mult-class tags only) |
| Types `typesForeignLinkOtherBandsClaimed` | **false** (unchanged; Types kind tags only) |
| Program `programForeignLinkOtherBandsClaimed` | **false** (unchanged; Program push codes only) |
| Graph `graphForeignLinkOtherBandsClaimed` | **false** (Graph-band only; no further foreign bands) |

---

## 5. Pins unchanged

| Pin | Value |
|-----|-------|
| free / complete / PROVABLY | living tips true (not flipped here) |
| FullHostElaborateRemains | false |
| llvmUnlocked | true (living; local GraphForeignLink unlock pin false) |
| fullBackend / production opt / DominanceClaimed | false |
| Product Rust under `src/` | forbidden |

Gates: `just hygiene`; `just systems-llvm-ir`; `just graph-foreign-link-success`;
prior `just mult-foreign-link-success` / `linear-foreign-link-success` /
`types-foreign-link-success` / `program-foreign-link-success` remain green
(Mult/Linear/Types/Program-only).
