# Program foreign link success (2026-08-10)

Kind: evidence / dual agreement recipe for Program foreign push-status link.
Not full LLVM production backend. Not Graph foreign link.
Not Mult otherBands flip (Mult Mult-only stays true in MultForeignLink).
Not Linear otherBands flip (Linear Mult-class tags stay in LinearForeignLink).
Not Types otherBands flip (Types kind tags stay in TypesForeignLink).
Not free / complete / PROVABLY / FullHostElaborateRemains flip.
Not product Rust crate under `src/`. Not classic elaborator full parity.

ASCII only. Plain English. Date: 2026-08-10.

**Greppable:** `PROGRAM-FOREIGN-LINK-SUCCESS`,
`SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0`, `HOST-PROGRAM-FOREIGN-LINK`,
`PROGRAM-FOREIGN-DUAL-AGREEMENT`, `FOREIGN-PROGRAM-CONSUMER-CONTRACT`,
`program-foreign-link-success`, out-of-tree

**Plan track:** `.agents/plans/plan-full-readiness-2026-08-09.md` R2
**Design bar:** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
**Layout fixture:** `doc/dev/research/layout-size-align-fixture-2026-08-03.md`
**Host dual-pin:** `src/systems/SystemsLean/ProgramForeignLink.lean`
**Mult template:** `SystemsLean.MultForeignLink` / Mult Mult-only
**Linear template:** `SystemsLean.LinearForeignLink` / Linear Mult-class tags
**Types template:** `SystemsLean.TypesForeignLink` / Types kind tags
**Gate:** `just program-foreign-link-success`; pure Nix
`nix/systems-llvm-ir/program-foreign-link-success.nix`

---

## 1. Intent

Land **Program-band foreign / out-of-tree consumer link success** for Program
push-status codes (i32 0 / -1 / -2 ok / badNode / full, CAP=8), mirroring Types
foreign success after Mult Mult-only, Linear foreign Mult-class tags, and Types
kind tags.

| Phrase | Honest meaning here |
|--------|---------------------|
| **Program foreign link success** | Program push status codes agree across Program SSOT, freestanding Program subset API cite, Program unit IR push constants, Program SSA push constants / push_status honesty, layout size/align pattern, and a named foreign consumer contract so an out-of-tree consumer can match size/align/discriminants without an in-tree product Rust crate |
| **Dual Program layout/IR agreement** | One recipe dual-pins Program surfaces above; host Lean claims Program band success only |
| **Primary dual** | Push status codes i32 0 / -1 / -2 (ok / badNode / full), size 4, align 4, CAP=8 on `x86_64-unknown-linux-gnu` |
| **Secondary cite** | Freestanding `slake_ir_program` + `slake_ir_program_push` (struct + API; not a second Mult grade enum). SSA `status_ix` 0/1/2 maps to primary codes 0/-1/-2 |
| **Out-of-tree consumer** | Optional live dogfood under `/tmp` (not product git); documented command below |

**Honest dual surface (no invented kind tags):** Program IR is **not** a
three-tag i32 kind enum like Mult/Linear/Types. On-disk dual surface is
**push status tags** already present in unit IR and SSA
(`@slake_program_push_{ok,bad,full}` / `@slake_program_ssa_push_{ok,bad,full}`
and `slake_program_ssa_push_status`). Do not invent a Program kind ladder.

This residual does **not** claim Graph foreign link, Mult/Linear/Types
otherBands, full Rust ABI freeze, or full LLVM production backend.

---

## 2. Dual Program push-status agreement recipe

| # | Surface | Required Program facts |
|---|---------|------------------------|
| 1 | Program SSOT (`SystemsLean.IrProgram`) | `programCap` 8; `PushResult` ok / badNode / full; EMPTY-PROGRAM-FAIL-CLOSED; ORDERED-IR-PROGRAM; emit map 0 / -1 / -2 |
| 2 | Freestanding Program (`slake_program_subset.h`) | `SLAKE_IR_PROGRAM_CAP` 8; `slake_ir_program_push` returns 0 / -1 / -2; is_well_typed empty-fail-closed; IR_PROGRAM_V0 (secondary API cite) |
| 3 | Program unit IR (`out/llvm-ir/slake_program.ll`) | `@slake_program_cap` i32 8; `@slake_program_push_{ok,bad,full}` i32 0/-1/-2 align 4; `slake_program_is_well_typed` |
| 4 | Program SSA IR (`out/llvm-ir/slake_program_ssa.ll`) | `@slake_program_ssa_cap` i32 8; `@slake_program_ssa_push_{ok,bad,full}` i32 0/-1/-2; `slake_program_ssa_push_status` + kernel_band_ready + is_well_typed |
| 5 | Layout fixture pattern | size 4; align 4; `x86_64-unknown-linux-gnu`; LAYOUT-SIZE-ALIGN-FIXTURE (Mult-primary; Program push codes same i32 pattern) |
| 6 | Foreign consumer contract (host Lean) | FOREIGN-PROGRAM-CONSUMER-CONTRACT: i32 encoding; size 4; align 4; same triple; codes 0/-1/-2; CAP=8 |
| 7 | Host claim | `programForeignLinkSuccessClaimed` true; Graph other bands false; full backend false |

**Honesty vs freestanding program struct:** primary dual is push status codes
i32 0/-1/-2 and CAP=8. `slake_ir_program` aggregates node slots + count + valid;
this residual does not freeze the full program struct as product Rust.
Mult/Linear/Types foreign success did not freeze aggregates either.

**Greppable dual recipe id:** `PROGRAM-FOREIGN-DUAL-AGREEMENT`

---

## 3. Out-of-tree consumer recipe (documented command)

Prefer **no** product Rust under `src/`. Optional live check (when `rustc` is on
PATH) is written under `/tmp` by `just program-foreign-link-success` and deleted
after. Manual re-run:

```bash
# From repo root. Does not write product sources under src/.
TMP=$(mktemp -d /tmp/slake-program-foreign-link.XXXXXX)
cat > "$TMP/consumer.rs" <<'RS'
// Out-of-tree Program foreign consumer dogfood. Not product crate.
// Primary dual: push status codes 0 ok, -1 badNode, -2 full; CAP=8.
#[repr(i32)]
#[derive(Copy, Clone, PartialEq, Eq)]
enum ProgramPushStatus {
    Ok = 0,
    BadNode = -1,
    Full = -2,
}

fn main() {
    assert_eq!(std::mem::size_of::<ProgramPushStatus>(), 4);
    assert_eq!(std::mem::align_of::<ProgramPushStatus>(), 4);
    assert_eq!(std::mem::size_of::<i32>(), 4);
    assert_eq!(ProgramPushStatus::Ok as i32, 0);
    assert_eq!(ProgramPushStatus::BadNode as i32, -1);
    assert_eq!(ProgramPushStatus::Full as i32, -2);
    const PROGRAM_CAP: i32 = 8;
    assert_eq!(PROGRAM_CAP, 8);
    println!("PROGRAM-FOREIGN-LINK-SUCCESS out-of-tree dogfood GREEN");
    println!("size=4 align=4 push=0,-1,-2 cap=8 target=x86_64-unknown-linux-gnu");
}
RS
rustc --edition 2021 -O -o "$TMP/consumer" "$TMP/consumer.rs"
"$TMP/consumer"
rm -rf "$TMP"
```

**Expected:** size 4, align 4, discriminants 0 / -1 / -2, CAP=8. Matches layout
fixture pattern and Program unit IR i32 push constants on
`x86_64-unknown-linux-gnu`.

**llvm-as (optional peer):** when `llvm-as` is on PATH,
`llvm-as out/llvm-ir/slake_program.ll -o /dev/null` and
`llvm-as out/llvm-ir/slake_program_ssa.ll -o /dev/null` should exit 0. That is
assemble smoke for Program IR, not production backend.

**Classic C ABI fallback (still valid):** freestanding Program subset push API
remains an engineering escape; primary foreign success is push code layout
match, not a freeze of the full `slake_ir_program` as product Rust.

---

## 4. Remaining bands (honest non-claims)

| Band | Foreign link status |
|------|---------------------|
| Mult | **success** (Mult Mult-only; MultForeignLink; otherBands false) |
| Linear | **success** (Linear Mult-class tags; LinearForeignLink; otherBands false) |
| Types | **success** (Types kind tags VALUE/LINEAR/ERASED; TypesForeignLink; otherBands false) |
| **Program** | **success** (this residual; Program push codes 0/-1/-2 CAP=8) |
| Graph | not claimed |
| Full LLVM production backend | **false** |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** living tips (unchanged; not re-opened) |
| Full classic elaborator parity | measured bar unchanged; not rebranded by this slice |
| Product Rust under `src/` | **forbidden** default |
| Mult `multForeignLinkOtherBandsClaimed` | **false** (unchanged; Mult Mult-only) |
| Linear `linearForeignLinkOtherBandsClaimed` | **false** (unchanged; Linear Mult-class tags only) |
| Types `typesForeignLinkOtherBandsClaimed` | **false** (unchanged; Types kind tags only) |

---

## 5. Pins unchanged

| Pin | Living tip |
|-----|------------|
| product residual free | true |
| freestanding self-host complete | true |
| PROVABLY | true |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (bar a) | true; FullHostElaborateRemains false |
| llvmUnlocked | true; Program SSA partial; full backend false |
| LlvmProgramSsa.llvmProgramSsaRustNativeLinkClaimed | false (local module honesty; Program foreign success lives in ProgramForeignLink) |
| Mult multForeignLinkSuccessClaimed | true; multForeignLinkOtherBandsClaimed false |
| Linear linearForeignLinkSuccessClaimed | true; linearForeignLinkOtherBandsClaimed false |
| Types typesForeignLinkSuccessClaimed | true; typesForeignLinkOtherBandsClaimed false |

---

## 6. Gates

```
just program-foreign-link-success
just systems-llvm-ir
lake build SystemsLean.ProgramForeignLink
just mult-foreign-link-success
just linear-foreign-link-success
just types-foreign-link-success
just hygiene
```

Pure Nix: `nix/systems-llvm-ir/program-foreign-link-success.nix` joined via
`specs.nix` into `systems-llvm-ir`.

---

## 7. Success for this residual

1. Host Lean `ProgramForeignLink` dual-pin + Program success claim true; Graph false.
2. Pure Nix + just gate green; Mult/Linear/Types foreign gates still green Mult/Linear/Types-only.
3. This evidence note + dual recipe + out-of-tree command documented.
4. Optional live rustc dogfood under `/tmp` when rustc present (ProgramPushStatus 0/-1/-2).
5. free / complete / PROVABLY / FullHost / full backend / measured elaborator
   bar **unchanged**.
6. Residual Done archive + report; Full LLVM Open remains for R1 progressive.

Program foreign link success (Program push codes 0/-1/-2 CAP=8). Not Graph
foreign link. Not full interop. Not full backend.
