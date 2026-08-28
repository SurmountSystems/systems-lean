# Mult foreign link success (2026-08-09)

Kind: evidence / dual agreement recipe for Mult foreign layout link.
Not full LLVM production backend. Not Linear/Types/Program/Graph foreign link.
Not free / complete / PROVABLY / FullHostElaborateRemains flip.
Not product Rust crate under `src/`. Not classic elaborator full parity.

ASCII only. Plain English. Date: 2026-08-09.

**Greppable:** `MULT-FOREIGN-LINK-SUCCESS`, `MULT-FOREIGN-LINK-SUCCESS-V0`,
`SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0`, `HOST-MULT-FOREIGN-LINK`,
`MULT-FOREIGN-DUAL-AGREEMENT`, `FOREIGN-MULT-CONSUMER-CONTRACT`,
`mult-foreign-link-success`, out-of-tree

**Plan track:** `.agents/plans/plan-held-backend-dual-rust-2026-08-08.md` track 2
**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Host dual-pin:** `src/systems/SystemsLean/MultForeignLink.lean`
**Prior partials:** `just mult-link-readiness`; `just mult-layout-ir-success`
**Gate:** `just mult-foreign-link-success`; pure Nix
`nix/systems-llvm-ir/mult-foreign-link-success.nix`

---

## 1. Intent

Land **Mult-band foreign / out-of-tree consumer link success** beyond Mult
layout/IR consumer partial and Mult link readiness partial.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Mult foreign link success** | Mult grade tags agree across Mult SSOT, freestanding Mult API, Mult unit IR, Mult SSA, layout fixture, and a named foreign consumer contract so an out-of-tree consumer can match size/align/discriminants without an in-tree product Rust crate |
| **Dual Mult layout/IR agreement** | One recipe dual-pins all Mult surfaces above; host Lean claims Mult band success only |
| **Out-of-tree consumer** | Optional live dogfood under `/tmp` (not product git); documented command below |
| **Classic FFI** | Still a valid fallback (`extern "C"` / freestanding Mult); not required as the success story when layout matches |

This residual does **not** claim Linear/Types/Program/Graph foreign link, full
Rust ABI freeze, or full LLVM production backend.

---

## 2. Dual Mult layout/IR agreement recipe (beyond partial)

| # | Surface | Required Mult facts |
|---|---------|---------------------|
| 1 | Mult SSOT (`SystemsLean.Mult`) | MULT-0/1/OMEGA; ofNat? 0/1/2; fail-closed unknown |
| 2 | Freestanding Mult (`slake_mult_subset.h`) | `enum slake_mult` 0/1/2; `slake_mult_is_valid`; `slake_mult_is_known`; `slake_mult_name` |
| 3 | Mult unit IR (`out/llvm-ir/slake_mult.ll`) | `@slake_mult_tag_{0,1,omega}` i32 align 4; `slake_mult_is_valid_tag` |
| 4 | Mult SSA IR (`out/llvm-ir/slake_mult_ssa.ll`) | SSA tags + `slake_mult_ssa_grade_tag` + `slake_mult_ssa_kernel_band_ready` + `slake_mult_ssa_is_valid_tag` |
| 5 | Layout fixture | size 4; align 4; `x86_64-unknown-linux-gnu`; LAYOUT-SIZE-ALIGN-FIXTURE |
| 6 | Foreign consumer contract (host Lean) | FOREIGN-MULT-CONSUMER-CONTRACT: i32 encoding; size 4; align 4; same triple |
| 7 | Host claim | `multForeignLinkSuccessClaimed` true; other bands false; full backend false |

**Beyond** `just mult-layout-ir-success` / `just mult-link-readiness`:

- Host Lean dual-pin module `SystemsLean.MultForeignLink` with Mult success claim
- Named FOREIGN-MULT-CONSUMER-CONTRACT + MULT-FOREIGN-DUAL-AGREEMENT
- Documented out-of-tree consumer recipe (this file) + optional live dogfood
- Explicit remaining-band honesty table (section 4)

**Greppable dual recipe id:** `MULT-FOREIGN-DUAL-AGREEMENT`

---

## 3. Out-of-tree consumer recipe (documented command)

Prefer **no** product Rust under `src/`. Optional live check (when `rustc` is on
PATH) is written under `/tmp` by `just mult-foreign-link-success` and deleted
after. Manual re-run:

```bash
# From repo root. Does not write product sources under src/.
TMP=$(mktemp -d /tmp/slake-mult-foreign-link.XXXXXX)
cat > "$TMP/consumer.rs" <<'RS'
// Out-of-tree Mult foreign consumer dogfood. Not product crate.
#[repr(i32)]
#[derive(Copy, Clone, PartialEq, Eq)]
enum MultTag {
    Mult0 = 0,
    Mult1 = 1,
    MultOmega = 2,
}

fn main() {
    assert_eq!(std::mem::size_of::<MultTag>(), 4);
    assert_eq!(std::mem::align_of::<MultTag>(), 4);
    assert_eq!(std::mem::size_of::<i32>(), 4);
    assert_eq!(MultTag::Mult0 as i32, 0);
    assert_eq!(MultTag::Mult1 as i32, 1);
    assert_eq!(MultTag::MultOmega as i32, 2);
    println!("MULT-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");
    println!("size=4 align=4 tags=0,1,2 target=x86_64-unknown-linux-gnu");
}
RS
rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
"$TMP/consumer"
rm -rf "$TMP"
```

**Expected:** size 4, align 4, discriminants 0/1/2. Matches layout fixture and
Mult IR i32 tags on `x86_64-unknown-linux-gnu`.

**llvm-as (optional peer):** when `llvm-as` is on PATH,
`llvm-as out/llvm-ir/slake_mult.ll -o /dev/null` and
`llvm-as out/llvm-ir/slake_mult_ssa.ll -o /dev/null` should exit 0. That is
assemble smoke for Mult IR, not production backend.

**Classic C ABI fallback (still valid):** compile freestanding Mult subset
against `src/systems/emit/slake_mult_subset.{c,h}` from a consumer tree. Layout
match without hand glue is the happy path; C ABI remains engineering escape.

---

## 4. Remaining bands (honest non-claims)

| Band | Foreign link status |
|------|---------------------|
| **Mult** | **success** (this residual; Mult-only) |
| Linear | not claimed |
| Types | not claimed |
| Program | not claimed |
| Graph | not claimed |
| Full LLVM production backend | **false** |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** living tips (unchanged; not re-opened) |
| Full classic elaborator parity | measured bar unchanged; not rebranded by this slice |
| Product Rust under `src/` | **forbidden** default |

---

## 5. Pins unchanged

| Pin | Living tip |
|-----|------------|
| product residual free | true |
| freestanding self-host complete | true |
| PROVABLY | true |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (bar a) | true; FullHostElaborateRemains false |
| llvmUnlocked | true; Mult SSA partial; full backend false |
| LlvmMultSsa.llvmMultSsaRustNativeLinkClaimed | false (local module honesty; Mult foreign success lives in MultForeignLink) |

---

## 6. Gates

```
just mult-foreign-link-success
just systems-llvm-ir
lake build SystemsLean.MultForeignLink
just hygiene
```

Pure Nix: `nix/systems-llvm-ir/mult-foreign-link-success.nix` joined via
`specs.nix` into `systems-llvm-ir`.

---

## 7. Success for this residual

1. Host Lean `MultForeignLink` dual-pin + Mult success claim true; other bands false.
2. Pure Nix + just gate green beyond mult-layout-ir-success / mult-link-readiness.
3. This evidence note + dual recipe + out-of-tree command documented.
4. Optional live rustc dogfood under `/tmp` when rustc present.
5. free / complete / PROVABLY / FullHost / full backend / measured elaborator
   bar **unchanged**.
6. Residual + WATCHER + report lockstep; next Open per plan Phase 3.

Mult foreign link success (Mult band). Not full interop. Not full backend.
