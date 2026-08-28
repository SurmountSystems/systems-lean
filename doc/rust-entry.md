# Rust entry map (layout + LLVM IR interop)

Read-only upstream: `ref/rust/` (`rust-lang/rust`).
Do not edit upstream as product source.

**Why Rust (not only llvm-project):** Rust **type layout and ABI** are defined by rustc (`rustc_abi`, codegen conventions). LLVM IR alone does not define "Rust-compatible layout." For Slake's design bar -- LLVM IR and efficient Rust-ecosystem interop **without classic FFI** as the happy path -- rustc is the reference.

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
