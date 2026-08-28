# Types foreign link success (2026-08-10)

Kind: evidence / dual agreement recipe for Types foreign kind tag link.
Not full LLVM production backend. Not Program/Graph foreign link.
Not Mult otherBands flip (Mult Mult-only stays true in MultForeignLink).
Not Linear otherBands flip (Linear Mult-class tags stay in LinearForeignLink).
Not free / complete / PROVABLY / FullHostElaborateRemains flip.
Not product Rust crate under `src/`. Not classic elaborator full parity.

ASCII only. Plain English. Date: 2026-08-10.

**Greppable:** `TYPES-FOREIGN-LINK-SUCCESS`,
`SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0`, `HOST-TYPES-FOREIGN-LINK`,
`TYPES-FOREIGN-DUAL-AGREEMENT`, `FOREIGN-TYPES-CONSUMER-CONTRACT`,
`types-foreign-link-success`, out-of-tree

**Plan track:** `.agents/plans/plan-full-readiness-2026-08-09.md` R2
**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Host dual-pin:** `src/systems/SystemsLean/TypesForeignLink.lean`
**Mult template:** `SystemsLean.MultForeignLink` / Mult Mult-only
**Linear template:** `SystemsLean.LinearForeignLink` / Linear Mult-class tags
**Gate:** `just types-foreign-link-success`; pure Nix
`nix/systems-llvm-ir/types-foreign-link-success.nix`

---

## 1. Intent

Land **Types-band foreign / out-of-tree consumer link success** for Types
kind tags (i32 0/1/2 VALUE/LINEAR/ERASED), mirroring Linear foreign success
after Mult Mult-only.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Types foreign link success** | Types kind tags agree across Types SSOT, freestanding Types API cite, Types unit IR kind tags, Types SSA kind tags / is_valid honesty, layout size/align pattern, and a named foreign consumer contract so an out-of-tree consumer can match size/align/discriminants without an in-tree product Rust crate |
| **Dual Types layout/IR agreement** | One recipe dual-pins Types surfaces above; host Lean claims Types band success only |
| **Primary dual** | Kind tags i32 0/1/2 (VALUE / LINEAR / ERASED), size 4, align 4 on `x86_64-unknown-linux-gnu` |
| **Secondary cite** | Freestanding `enum slake_ir_kind` + `slake_ir_node` + init / is_well_typed (node struct; not a second Mult grade enum) |
| **Out-of-tree consumer** | Optional live dogfood under `/tmp` (not product git); documented command below |

This residual does **not** claim Program/Graph foreign link, Mult/Linear
otherBands, full Rust ABI freeze, or full LLVM production backend.

---

## 2. Dual Types kind agreement recipe

| # | Surface | Required Types facts |
|---|---------|----------------------|
| 1 | Types SSOT (`SystemsLean.Types`) | NodeKind VALUE/LINEAR/ERASED; ofKindTag? 0/1/2; FAIL-CLOSED-UNKNOWN-KIND; kindMultOk pairings; TYPED_IR_V0 |
| 2 | Freestanding Types (`slake_types_subset.h`) | `enum slake_ir_kind` 0/1/2 + `slake_ir_node` + init / is_well_typed + TYPED_IR_V0 (secondary API cite) |
| 3 | Types unit IR (`out/llvm-ir/slake_types.ll`) | `@slake_types_kind_{0,1,2}` i32 align 4; `slake_types_is_valid_kind_tag` |
| 4 | Types SSA IR (`out/llvm-ir/slake_types_ssa.ll`) | `@slake_types_ssa_kind_{value,linear,erased}` i32 0/1/2; `slake_types_ssa_kind_tag` + kernel_band_ready + is_valid_kind |
| 5 | Layout fixture pattern | size 4; align 4; `x86_64-unknown-linux-gnu`; LAYOUT-SIZE-ALIGN-FIXTURE (Mult-primary; Types kind tags same i32 pattern) |
| 6 | Foreign consumer contract (host Lean) | FOREIGN-TYPES-CONSUMER-CONTRACT: i32 encoding; size 4; align 4; same triple |
| 7 | Host claim | `typesForeignLinkSuccessClaimed` true; Program/Graph other bands false; full backend false |

**Honesty vs freestanding node struct:** primary dual is kind tags i32 0/1/2.
`slake_ir_node` aggregates type tag + mult + kind + valid; this residual does
not freeze the full node struct as product Rust. Mult/Linear foreign success
did not freeze Mult aggregates or Linear token structs either.

**Greppable dual recipe id:** `TYPES-FOREIGN-DUAL-AGREEMENT`

---

## 3. Out-of-tree consumer recipe (documented command)

Prefer **no** product Rust under `src/`. Optional live check (when `rustc` is on
PATH) is written under `/tmp` by `just types-foreign-link-success` and deleted
after. Manual re-run:

```bash
# From repo root. Does not write product sources under src/.
TMP=$(mktemp -d /tmp/slake-types-foreign-link.XXXXXX)
cat > "$TMP/consumer.rs" <<'RS'
// Out-of-tree Types foreign consumer dogfood. Not product crate.
// Primary dual: Types kind tags 0/1/2 VALUE/LINEAR/ERASED.
#[repr(i32)]
#[derive(Copy, Clone, PartialEq, Eq)]
enum TypesKindTag {
    Value = 0,
    Linear = 1,
    Erased = 2,
}

fn main() {
    assert_eq!(std::mem::size_of::<TypesKindTag>(), 4);
    assert_eq!(std::mem::align_of::<TypesKindTag>(), 4);
    assert_eq!(std::mem::size_of::<i32>(), 4);
    assert_eq!(TypesKindTag::Value as i32, 0);
    assert_eq!(TypesKindTag::Linear as i32, 1);
    assert_eq!(TypesKindTag::Erased as i32, 2);
    println!("TYPES-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");
    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");
}
RS
rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
"$TMP/consumer"
rm -rf "$TMP"
```

**Expected:** size 4, align 4, discriminants 0/1/2. Matches layout fixture pattern
and Types unit IR i32 kind tags on `x86_64-unknown-linux-gnu`.

**llvm-as (optional peer):** when `llvm-as` is on PATH,
`llvm-as out/llvm-ir/slake_types.ll -o /dev/null` and
`llvm-as out/llvm-ir/slake_types_ssa.ll -o /dev/null` should exit 0. That is
assemble smoke for Types IR, not production backend.

**Classic C ABI fallback (still valid):** freestanding Types subset kind enum +
node APIs remain an engineering escape; primary foreign success is kind tag
layout match, not a freeze of the full `slake_ir_node` as product Rust.

---

## 4. Remaining bands (honest non-claims)

| Band | Foreign link status |
|------|---------------------|
| Mult | **success** (Mult Mult-only; MultForeignLink; otherBands false) |
| Linear | **success** (Linear Mult-class tags; LinearForeignLink; otherBands false) |
| **Types** | **success** (this residual; Types kind tags VALUE/LINEAR/ERASED) |
| Program | not claimed |
| Graph | not claimed |
| Full LLVM production backend | **false** |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** living tips (unchanged; not re-opened) |
| Full classic elaborator parity | measured bar unchanged; not rebranded by this slice |
| Product Rust under `src/` | **forbidden** default |
| Mult `multForeignLinkOtherBandsClaimed` | **false** (unchanged; Mult Mult-only) |
| Linear `linearForeignLinkOtherBandsClaimed` | **false** (unchanged; Linear Mult-class tags only) |

---

## 5. Pins unchanged

| Pin | Living tip |
|-----|------------|
| product residual free | true |
| freestanding self-host complete | true |
| PROVABLY | true |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (bar a) | true; FullHostElaborateRemains false |
| llvmUnlocked | true; Types SSA partial; full backend false |
| LlvmTypesSsa.llvmTypesSsaRustNativeLinkClaimed | false (local module honesty; Types foreign success lives in TypesForeignLink) |
| Mult multForeignLinkSuccessClaimed | true; multForeignLinkOtherBandsClaimed false |
| Linear linearForeignLinkSuccessClaimed | true; linearForeignLinkOtherBandsClaimed false |

---

## 6. Gates

```
just types-foreign-link-success
just systems-llvm-ir
lake build SystemsLean.TypesForeignLink
just mult-foreign-link-success
just linear-foreign-link-success
just hygiene
```

Pure Nix: `nix/systems-llvm-ir/types-foreign-link-success.nix` joined via
`specs.nix` into `systems-llvm-ir`.

---

## 7. Success for this residual

1. Host Lean `TypesForeignLink` dual-pin + Types success claim true; Program/Graph false.
2. Pure Nix + just gate green; Mult Mult-only + Linear foreign gates still green.
3. This evidence note + dual recipe + out-of-tree command documented.
4. Optional live rustc dogfood under `/tmp` when rustc present (TypesKindTag 0/1/2).
5. free / complete / PROVABLY / FullHost / full backend / measured elaborator
   bar **unchanged**.
6. Residual Done archive + report; Full LLVM Open remains for R1 progressive.

Types foreign link success (Types kind tags VALUE/LINEAR/ERASED). Not Program
foreign link. Not full interop. Not full backend.
