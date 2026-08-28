# Linear foreign link success (2026-08-10)

Kind: evidence / dual agreement recipe for Linear foreign Mult-class tag link.
Not full LLVM production backend. Not Types/Program/Graph foreign link.
Not Mult otherBands flip (Mult Mult-only stays true in MultForeignLink).
Not free / complete / PROVABLY / FullHostElaborateRemains flip.
Not product Rust crate under `src/`. Not classic elaborator full parity.

ASCII only. Plain English. Date: 2026-08-10.

**Greppable:** `LINEAR-FOREIGN-LINK-SUCCESS`,
`SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0`, `HOST-LINEAR-FOREIGN-LINK`,
`LINEAR-FOREIGN-DUAL-AGREEMENT`, `FOREIGN-LINEAR-CONSUMER-CONTRACT`,
`linear-foreign-link-success`, out-of-tree

**Plan track:** `.agents/plans/plan-full-readiness-2026-08-09.md` R2
**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Host dual-pin:** `src/systems/SystemsLean/LinearForeignLink.lean`
**Mult template:** `SystemsLean.MultForeignLink` / Mult Mult-only
**Gate:** `just linear-foreign-link-success`; pure Nix
`nix/systems-llvm-ir/linear-foreign-link-success.nix`

---

## 1. Intent

Land **Linear-band foreign / out-of-tree consumer link success** for Linear
Mult-class tags (i32 0/1/2), mirroring Mult foreign success.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Linear foreign link success** | Linear Mult-class tags agree across Linear SSOT, freestanding Linear API cite, Linear unit IR class tags, Linear SSA Mult-1 / live_flag honesty, layout size/align pattern, and a named foreign consumer contract so an out-of-tree consumer can match size/align/discriminants without an in-tree product Rust crate |
| **Dual Linear layout/IR agreement** | One recipe dual-pins Linear surfaces above; host Lean claims Linear band success only |
| **Primary dual** | Mult-class tags i32 0/1/2 (polyId / LINEAR-EXACT-ONCE / shareNat), size 4, align 4 on `x86_64-unknown-linux-gnu` |
| **Secondary cite** | Freestanding `slake_linear_token` + consume (struct story; not a second three-grade enum) |
| **Out-of-tree consumer** | Optional live dogfood under `/tmp` (not product git); documented command below |

This residual does **not** claim Types/Program/Graph foreign link, Mult otherBands,
full Rust ABI freeze, or full LLVM production backend.

---

## 2. Dual Linear Mult-class agreement recipe

| # | Surface | Required Linear facts |
|---|---------|-----------------------|
| 1 | Linear SSOT (`SystemsLean.Linear`) | MULT-0/1/OMEGA class ids; LINEAR-EXACT-ONCE; linearAxiomInventoryOk |
| 2 | Freestanding Linear (`slake_linear_subset.h`) | `slake_linear_token` + consume / is_live + CONSUME_TOKEN_HOST_V0 (secondary API cite) |
| 3 | Linear unit IR (`out/llvm-ir/slake_linear.ll`) | `@slake_linear_class_{0,1,omega}` i32 align 4; `slake_linear_is_valid_class_tag` |
| 4 | Linear SSA IR (`out/llvm-ir/slake_linear_ssa.ll`) | `@slake_linear_ssa_tag_1` MULT-1; `slake_linear_ssa_live_flag` + kernel_band_ready + is_live |
| 5 | Layout fixture pattern | size 4; align 4; `x86_64-unknown-linux-gnu`; LAYOUT-SIZE-ALIGN-FIXTURE (Mult-primary; Linear class tags same i32 pattern) |
| 6 | Foreign consumer contract (host Lean) | FOREIGN-LINEAR-CONSUMER-CONTRACT: i32 encoding; size 4; align 4; same triple |
| 7 | Host claim | `linearForeignLinkSuccessClaimed` true; Types/Program/Graph other bands false; full backend false |

**Honesty vs Mult SSA:** Linear SSA ships Mult-1 tag + live_flag focus (not three
SSA grade tags). Dual agreement still requires unit IR three class tags + SSA
Mult-1 / live_flag honesty. Do not invent missing SSA omega/0 tags without a
writer residual.

**Greppable dual recipe id:** `LINEAR-FOREIGN-DUAL-AGREEMENT`

---

## 3. Out-of-tree consumer recipe (documented command)

Prefer **no** product Rust under `src/`. Optional live check (when `rustc` is on
PATH) is written under `/tmp` by `just linear-foreign-link-success` and deleted
after. Manual re-run:

```bash
# From repo root. Does not write product sources under src/.
TMP=$(mktemp -d /tmp/slake-linear-foreign-link.XXXXXX)
cat > "$TMP/consumer.rs" <<'RS'
// Out-of-tree Linear foreign consumer dogfood. Not product crate.
// Primary dual: Linear Mult-class tags 0/1/2 (same shape as MultTag).
#[repr(i32)]
#[derive(Copy, Clone, PartialEq, Eq)]
enum LinearClassTag {
    Class0 = 0,
    Class1 = 1,
    ClassOmega = 2,
}

fn main() {
    assert_eq!(std::mem::size_of::<LinearClassTag>(), 4);
    assert_eq!(std::mem::align_of::<LinearClassTag>(), 4);
    assert_eq!(std::mem::size_of::<i32>(), 4);
    assert_eq!(LinearClassTag::Class0 as i32, 0);
    assert_eq!(LinearClassTag::Class1 as i32, 1);
    assert_eq!(LinearClassTag::ClassOmega as i32, 2);
    println!("LINEAR-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");
    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");
}
RS
rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
"$TMP/consumer"
rm -rf "$TMP"
```

**Expected:** size 4, align 4, discriminants 0/1/2. Matches layout fixture pattern
and Linear unit IR i32 class tags on `x86_64-unknown-linux-gnu`.

**llvm-as (optional peer):** when `llvm-as` is on PATH,
`llvm-as out/llvm-ir/slake_linear.ll -o /dev/null` and
`llvm-as out/llvm-ir/slake_linear_ssa.ll -o /dev/null` should exit 0. That is
assemble smoke for Linear IR, not production backend.

**Classic C ABI fallback (still valid):** freestanding Linear subset token /
consume APIs remain an engineering escape; primary foreign success is Mult-class
tag layout match, not a freeze of the full token struct as product Rust.

---

## 4. Remaining bands (honest non-claims)

| Band | Foreign link status |
|------|---------------------|
| Mult | **success** (Mult Mult-only; MultForeignLink; otherBands false) |
| **Linear** | **success** (this residual; Linear Mult-class tags) |
| Types | not claimed |
| Program | not claimed |
| Graph | not claimed |
| Full LLVM production backend | **false** |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** living tips (unchanged; not re-opened) |
| Full classic elaborator parity | measured bar unchanged; not rebranded by this slice |
| Product Rust under `src/` | **forbidden** default |
| Mult `multForeignLinkOtherBandsClaimed` | **false** (unchanged; Mult Mult-only) |

---

## 5. Pins unchanged

| Pin | Living tip |
|-----|------------|
| product residual free | true |
| freestanding self-host complete | true |
| PROVABLY | true |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (bar a) | true; FullHostElaborateRemains false |
| llvmUnlocked | true; Linear SSA partial; full backend false |
| LlvmLinearSsa.llvmLinearSsaRustNativeLinkClaimed | false (local module honesty; Linear foreign success lives in LinearForeignLink) |
| Mult multForeignLinkSuccessClaimed | true; multForeignLinkOtherBandsClaimed false |

---

## 6. Gates

```
just linear-foreign-link-success
just systems-llvm-ir
lake build SystemsLean.LinearForeignLink
just mult-foreign-link-success
just hygiene
```

Pure Nix: `nix/systems-llvm-ir/linear-foreign-link-success.nix` joined via
`specs.nix` into `systems-llvm-ir`.

---

## 7. Success for this residual

1. Host Lean `LinearForeignLink` dual-pin + Linear success claim true; Types/Program/Graph false.
2. Pure Nix + just gate green; Mult Mult-only gate still green.
3. This evidence note + dual recipe + out-of-tree command documented.
4. Optional live rustc dogfood under `/tmp` when rustc present (LinearClassTag 0/1/2).
5. free / complete / PROVABLY / FullHost / full backend / measured elaborator
   bar **unchanged**.
6. Residual Done archive + report; Full LLVM Open remains for R1 progressive.

Linear foreign link success (Linear Mult-class tags). Not Types foreign link.
Not full interop. Not full backend.
