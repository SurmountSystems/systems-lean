# Rust entry map (layout + LLVM IR interop)

Read-only upstream: `ref/rust/` (`rust-lang/rust`).
Do not edit upstream as product source.

**Why Rust (not only llvm-project):** The product bar is LLVM IR that a Rust consumer can use as the same memory shape **without classic FFI** as the happy path. That IR **is** the Rust-compatible surface. rustc (`rustc_abi`, codegen conventions) in `ref/rust` is how we **check** we laid it out right, not a product language. Product languages stay Idris 2, Lean 4, and Nix.

Nested LLVM under rust's own submodules is **not** required for reading layout/ABI sources. Do not recursive-init the world unless a human asks.

---

## Start here

| Purpose | Path |
|---------|------|
| Overview | `ref/rust/README.md` |
| Compiler crates | `ref/rust/compiler/` |
| **Type layout / ABI** | `ref/rust/compiler/rustc_abi/` (and related) |
| Codegen SSA / LLVM bridge | `ref/rust/compiler/rustc_codegen_ssa/`, `ref/rust/compiler/rustc_codegen_llvm/` |
| Target specs | under `ref/rust/compiler/rustc_target/` |

Exact crate layout can shift across rustc versions; search under `ref/rust/compiler/` for `abi`, `layout`, `codegen_llvm` if paths move.

---

## What the Lean to Rust dual map already proves

In plain English, for a reader of this map and the living tips.

**CHI readiness (2026-08-11):** Lean-Rust correspondence interfaces are **ready
under named bars** -- layout dual-pins, Mult..Graph foreign rungs, joint
partial + multi-band full, and pure Nix llvm presence -- with green gates
`just systems-llvm-ir`, `just rust-ir-interop-partial`, and
`just rust-ir-interop-full`. That is measured interop integrity, **not** a full
isomorphism of Systems Lean with all of Rust and **not** product Rust under
`src/`.

1. **Layout size and align parity (Mult..Graph path).** On target
   `x86_64-unknown-linux-gnu`, the Mult..Graph i32 tag and status encodings
   agree at size **4** and align **4** across host Lean dual-pins, freestanding
   and unit/SSA LLVM IR, the Mult layout fixture, and (when rustc is on PATH)
   optional out-of-tree rustc dogfood under `/tmp`. Mult-first layout ladder
   closed: size/align fixture, ABI parity smoke, layout IR tag dual-pin.
   **Richer-than-i32 named record:** `IrNodeRecord` (wire `slake_ir_node`:
   type tag + Mult enum + kind enum + valid byte) dual-pins at size **16**,
   align **4**, pad **3** versus rustc_abi `repr(C)` / `Integer::I32`+`I8`
   packing (`just richer-record-layout`; host Lean `SystemsLean.IrNodeLayout`).
   C product wire is unchanged. Not a Lean inductive layout and not
   formalized rustc.
   **Trait-object vtable first dual-pin (2026-09-11) plus second Method-slot
   pin plus third TraitVPtr pin plus fourth Vacant pin plus fifth
   method1 pin plus sixth method2 pin plus seventh method3 pin plus
   eighth method4 pin plus ninth method5 pin plus tenth
   method6 pin plus eleventh method7 pin plus twelfth
   method8 pin plus thirteenth method9 pin plus fourteenth
   method10 pin plus fifteenth method11 pin plus sixteenth
   method12 pin plus seventeenth method13 pin plus eighteenth
   method14 pin plus nineteenth
   method15 pin plus twentieth
   method16 pin plus twenty-first
   method17 pin plus twenty-second
   method18 pin plus twenty-third
   method19 pin plus twenty-fourth
   method20 pin plus twenty-fifth
   method21 pin plus twenty-sixth
   method22 pin plus twenty-seventh
   method23 pin plus twenty-eighth
   method24 pin plus twenty-ninth
   method25 pin plus thirtieth
   method26 pin plus thirty-first
   method27 pin plus thirty-second
   method28 pin plus thirty-third
   method29 pin plus thirty-fourth
   method30 pin plus thirty-fifth
   method31 pin plus thirty-sixth
   method32 pin plus thirty-seventh
   method33 pin plus thirty-eighth
   method34 pin plus thirty-ninth
   method35 pin plus fortieth
   method36 pin:** host Lean
   `SystemsLean.TraitObjectVtable` records rustc
   `dyn Trait` on `x86_64-unknown-linux-gnu` as a two-pointer ScalarPair
   (data + vtable, size 16 align 8) and vtable header slots drop_in_place
   / size / align (`COMMON_VTABLE_ENTRIES` in rustc_middle; pointer
   size/align and ScalarPair packing in rustc_abi). Slot 3 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 24; method0).
   Slot 4 is rustc_middle `VtblEntry::Method` with rustc_abi pointer ABI
   (offset 32; method1). Slot 5 is rustc_middle `VtblEntry::Method` with
   rustc_abi pointer ABI (offset 40; method2). Slot 6 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 48; method3).
   Slot 7 is rustc_middle `VtblEntry::Method` with rustc_abi pointer ABI
   (offset 56; method4). Slot 8 is rustc_middle `VtblEntry::Method` with
   rustc_abi pointer ABI (offset 64; method5). Slot 9 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 72; method6).
   Slot 10 is rustc_middle `VtblEntry::Method` with rustc_abi pointer ABI
   (offset 80; method7). Slot 11 is rustc_middle `VtblEntry::Method` with
   rustc_abi pointer ABI (offset 88; method8). Slot 12 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 96; method9).
   Slot 13 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 104; method10).
   Slot 14 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 112; method11).
   Slot 15 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 120; method12).
   Slot 16 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 128; method13).
   Slot 17 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 136; method14).
   Slot 18 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 144; method15).
   Slot 19 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 152; method16).
   Slot 20 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 160; method17).
   Slot 21 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 168; method18).
   Slot 22 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 176; method19).
   Slot 23 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 184; method20).
   Slot 24 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 192; method21).
   Slot 25 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 200; method22).
   Slot 26 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 208; method23).
   Slot 27 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 216; method24).
   Slot 28 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 224; method25).
   Slot 29 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 232; method26).
   Slot 30 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 240; method27).
   Slot 31 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 248; method28).
   Slot 32 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 256; method29).
   Slot 33 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 264; method30).
   Slot 34 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 272; method31).
   Slot 35 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 280; method32).
   Slot 36 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 288; method33).
   Slot 37 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 296; method34).
   Slot 38 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 304; method35).
   Slot 39 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 312; method36).
   Living DualPinOk tip: slot 130 is rustc_middle
   `VtblEntry::Method` with rustc_abi pointer ABI (offset 1040; method127).
   Slot 131 is rustc_middle
   `VtblEntry::Vacant` with
   rustc_abi pointer ABI (offset 1048; reserved `ptr null`; rustc_middle
   leaves Uninit when a vtable-safe method's predicates do not hold).
   Slot 132 is rustc_middle `VtblEntry::TraitVPtr` with rustc_abi pointer ABI
   (offset 1056) to a header-only supertrait vtable. Fourth-pin
   Vacant-at-slot-4 is history only. LLVM IR remains the Rust-compatible
   surface; rustc_abi remains the check. Named fixture emit: Lean printer
   `traitObjectVtableIrPackage` plus `out/llvm-ir/trait-object-vtable.ll`
   (fat pointer `{ ptr, ptr }` size 16 align 8; vtable
   `{ ptr, i64, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }` drop_in_place /
   size / align / method0 through method127 / Vacant /
   TraitVPtr, 133 slots / 1064 bytes / 128 Methods align 8; Method, Vacant, and TraitVPtr lines grep
   `rustc_abi pointer`). Checkable writer: `just llvm-trait-object-vtable`
   (`lean --run`; no mill row; dest must match printer bytes). Pure Nix
   presence: `nix/systems-llvm-ir/trait-object-vtable.nix`. Not FullBackend.
   Production emit claimed stays false. Occupancy stays 49. Mill stays
   69 of 69.
   Residual Name: Trait-object vtable IR.

2. **Foreign link success, band-local.** Each of Mult, Linear, Types, Program,
   and Graph has a green foreign dual-agreement rung (host Lean module + pure
   Nix + optional rustc dogfood). That is band-local success for that band's
   tags or status codes, not one monorepo Rust product crate.

3. **Joint partial and multi-band full under named bars.** Host
   `SystemsLean.RustIrInterop` claims `rustIrInteropPartialClaimed` **true**
   and `rustIrInteropFullClaimed` **true** with `multiBandJointConsumerOk`.
   Gates: `just rust-ir-interop-partial`, `just rust-ir-interop-full` (mandatory
   lake on the interop module). Full means one joint dual-pin and one multi-band
   consumer covering Mult+Linear+Types+Program+Graph **together** for our i32
   contracts.

4. **IR consumer link smoke.** `just llvm-link-smoke` links a generator SSA
   `.ll` (Compose SSA, else Mult SSA) to a tiny out-of-tree consumer under
   TMPDIR (clang IR wrap preferred; rustc+llc fallback). Soft-skip if those
   tools are missing. That is a link of generator IR, **not** classic FFI as
   the product story, **not** FullBackend, and **not** a `src/` Rust crate.

5. **Still not claimed.** Formalization of all of rustc; product Rust under
   `src/` (three languages only); complete isomorphism of Systems Lean with all
   of Rust; tip `fullBackend` as a synonym of this dual map (fixture tip may be
   true under Package 1 A-light; band and interop `*FullBackendClaimed` stay
   **false**); "no FFI ever." Without-classic-FFI happy-path **end announce**
   for Mult..Graph dual-map consumers is measured under completeness **C1** (not
   a synonym of tip fullBackend or of shipping product Rust).

**Correspondence note (SSoT evidence ladder):**
`doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md`

## Design bar and evidence ladder

| Phrase | Status |
|--------|--------|
| "LLVM IR backend" | Design goal for Slake; Mult..Graph text + compose + optional llvm-as + unlock **done** (not full backend) |
| "Rust layout-compatible" | Defined against rustc_abi rules + Mult..Graph dual-pin tests under named bars above |
| "Without classic FFI" | Happy path = layout/IR-level interop for Mult..Graph dual-map consumers, not hand `extern "C"` glue as default -- dual map **measured under named bars**; C1 happy-path end announce **measured** (not "no FFI ever") |

**Design note (2026-08-03):** `doc/dev/research/rust-native-layout-design-2026-08-03.md`
(Kind: analysis only). Layout/ABI bar and non-claims. **Layout size/align fixture
done** (`doc/dev/research/layout-size-align-fixture-2026-08-03.md`). **ABI parity
smoke done** (`just abi-parity-smoke`). **Layout IR tag dual-pin done**
(`just layout-ir-dual-pin`). Mult-first layout test ladder **closed**. Mult..Graph
foreign link success **done** band-local (`just mult/linear/types/program/graph-foreign-link-success`;
host Lean `MultForeignLink` .. `GraphForeignLink`; out-of-tree rustc dogfood under
`/tmp`; no product Rust under `src/`). **Rust IR interop partial done**
(`just rust-ir-interop-partial`; `rustIrInteropPartialClaimed` true). **Rust IR
interop full multi-band done** (`just rust-ir-interop-full`;
`rustIrInteropFullClaimed` true; `multiBandJointConsumerOk`; greppable
`RUST-IR-INTEROP-FULL` / `MULTI-BAND-JOINT-CONSUMER`). Full is multi-band joint dual
map of Mult..Graph i32 contracts only. **Richer-than-i32 layout done**
(`just richer-record-layout`; `IrNodeRecord` size 16 align 4; host
`IrNodeLayout`; C wire unchanged). **IR consumer link smoke done**
(`just llvm-link-smoke`; skip-honest if clang and rustc+llc missing; not
classic FFI as the story). Mult `multForeignLinkOtherBandsClaimed`
stays **false**. Fixture tip fullBackend is **true** under Package 1 A-light;
band Mult..Graph SSA / foreign `*FullBackendClaimed` stay **false**.
Without-classic-FFI end announce is completeness Package **C1** (not a synonym of
tip fullBackend). Do not edit `ref/rust` as product.

See `doc/architecture.md` for freestanding vs LLVM product framing.

---

## What Systems Lean uses this for

- Layout and ABI reference for freestanding/LLVM product wire
- Research into link/embed without classic FFI
- Later: dual tests (Rust consumer + Slake product)

Not for forking rustc development inside this repo.
