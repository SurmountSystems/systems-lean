# Rust-native layout design (2026-08-03)

Kind: analysis only. Not residual invent beyond the named residual program.
Not Rust-native link success. Not full control-flow graph (CFG) / static single
assignment (SSA). Not host elaborator residual free. Not proof complete.
Not product C growth. Not forge free / complete / PROVABLY. Not production
llvm-as path. Living `llvmUnlocked` stays **true** (unchanged by this design).

ASCII only. Plain English. Date: 2026-08-03.

**Plan:** `.agents/plans/plan-north-star-remaining.md` Track 2f (Rust-native
layout design).
**Entry map:** `doc/rust-entry.md`
**Peer design residual shape:** `doc/dev/research/llvm-ir-unlock-design-2026-08-03.md`
**Prior LLVM path:** Mult..Graph unit IR text + unit package expand + compose
emit + optional llvm-as smoke (all **done**); unlock residual **done**
(`llvmUnlocked` **true** + lake proof).
**Release surface:** `out/llvm-ir/` (deferred embed / Rust path; freestanding C
primary under `out/freestanding-c/`).
**Read-only reference:** `ref/rust/` (do **not** edit as product).

Living tip at design land: freestanding product self-host **complete true**;
product residual free **true**; product StillUsesLake / DependsOnLake **false**;
host elaborator residual **remains**; PROVABLY **true** (`provablyUnlocked`);
`llvmUnlocked` **true** (unlock residual 2026-08-03). This design does **not**
flip any of those pins.

---

## 1. Intent

**Rust-native layout design** states the honest **design bar** for layout and
application binary interface (ABI) work that aims at efficient Rust-ecosystem
interop **without classic Foreign Function Interface (FFI)** as the happy path.

| Intent | Meaning |
|--------|---------|
| Layout / ABI bar | Size, alignment, field order, and calling-convention honesty checked against rustc rules -- **design + future tests**, not shipped success |
| Without classic FFI (happy path) | Prefer layout-compatible intermediate representation (IR) and data layout so a Rust consumer can use the same memory shape **without** hand-written `extern "C"` glue as the default story |
| Classic FFI (allowed fallback) | Hand `extern "C"` / C ABI bridges remain valid engineering escapes; they are **not** the north-star happy path and **must not** be sold as "Rust-native link done" |
| Primary product unchanged | Freestanding C under `out/freestanding-c/` stays primary product wire; LLVM / Rust path is parallel |
| Unlock is precondition | `llvmUnlocked` true + Mult..Graph text + compose + optional llvm-as smoke open residual work; they do **not** claim layout parity |

This residual is **design only**. It documents the bar and residual Names for
layout tests. It does **not** implement fixtures, edit `ref/rust`, or claim
Rust-native link success.

---

## 2. What "without classic FFI" means (and does not)

| Phrase | Honest meaning here | Forbidden overclaim |
|--------|---------------------|---------------------|
| **Without classic FFI (happy path)** | Shared layout/IR so Rust and Slake agree on size/align/ABI for named types; consumer can treat bits as the same type layout without a C shim as default | "We ship Rust link today" / "no FFI ever needed" / "repr(Rust) fully stable for us" |
| **Layout/IR-level interop** | Same target data layout; matching size/align of Mult-first (and later) product types; IR types that a Rustc / LLVM consumer can map | Full rustc interop or crate-level `#[repr]` portability theater |
| **Classic FFI** | Explicit C ABI / `extern "C"` / hand glue between Slake freestanding C and Rust | Claiming FFI glue **is** the Rust-native path success criterion |
| **Rust ABI unstable (upstream fact)** | rustc documents that `repr(Rust)` layout and `extern "Rust"` calling convention are largely unspecified across versions | Pretending Slake freezes the Rust ABI |

**Design bar summary:** match **checkable** layout facts (size, align, field
offsets for a **small fixed set** of product types on a **named target**)
against rustc_abi rules and, where needed, a tiny Rust reference crate outside
product git -- not full language interop.

---

## 3. Reference map (`ref/rust`, read-only)

Confirmed present under this tree's submodule (paths may shift across rustc
versions; re-search under `ref/rust/compiler/` if needed):

| Purpose | Path (read-only) |
|---------|------------------|
| Overview | `ref/rust/README.md` |
| **Type layout / ABI core** | `ref/rust/compiler/rustc_abi/` |
| Layout calculator + size/align | `ref/rust/compiler/rustc_abi/src/layout.rs`, `layout/simple.rs`, `layout/ty.rs` |
| Calling conventions | `ref/rust/compiler/rustc_abi/src/callconv.rs`, `callconv/reg.rs` |
| Extern ABI names | `ref/rust/compiler/rustc_abi/src/extern_abi.rs`, `canon_abi.rs` |
| Target specs / data layout | `ref/rust/compiler/rustc_target/` |
| Codegen SSA bridge | `ref/rust/compiler/rustc_codegen_ssa/` (ABI traits: `src/traits/abi.rs`) |
| LLVM codegen bridge | `ref/rust/compiler/rustc_codegen_llvm/` |

**rustc_abi role (upstream):** foundational types and layout calculator for
reasoning about binary interface (in-memory layout + material for calling
conventions). Platform `extern "C"` details often live in `rustc_target`;
codegen backends consume layout. Nested LLVM under rust is **not** required to
read these sources.

**Slake use:** reference only. Do **not** fork rustc or edit `ref/rust` as
product. Product layout fixtures live under `src/systems/` / `doc/` / residual
tests when residual Names implement them.

Entry map (short): `doc/rust-entry.md`.

---

## 4. Preconditions met today

| Precondition | Evidence |
|--------------|----------|
| Freestanding product self-host complete (claim B) | **true** |
| Product residual free (claim A) | **true** |
| Product StillUsesLake / DependsOnLake | **false** |
| PROVABLY (`provablyUnlocked`) | **true** |
| Mult..Graph unit IR text | **done** (`slake_{mult,linear,types,program,graph}.ll`) |
| Unit package join Mult..Graph | **done** (`just llvm-unit-package`) |
| Compose emit | **done** (`LlvmComposeText` / `slake_compose.ll` / `just llvm-compose-text`) |
| Optional llvm-as smoke | **done** (`just llvm-as-smoke`; skip-if-missing) |
| Living LLVM pin | `llvmUnlocked` **true** (unlock residual; not full backend) |
| `ref/rust` / `rustc_abi` present | Confirmed under `ref/rust/compiler/rustc_abi/` |

Text ladder + unlock + compose + optional assemble smoke are **preconditions**
for layout residual work. They do **not** equal layout parity or Rust link.

---

## 5. Design bar (checkable future residual)

Minimum bar for honest progress toward Rust-native layout (each row can be a
residual Name; implement later -- this design only documents):

| # | Bar | Checkable evidence sketch |
|---|-----|---------------------------|
| 1 | **Mult-first type set** | Name a small fixed set of product types / tags (e.g. Mult grades MULT-0/1/OMEGA as i32 tags already in `slake_mult.ll`; later Linear/Types tags) that layout fixtures will cover first |
| 2 | **Size / align rules** | For each type in the set, document size and alignment consistent with rustc_abi / target data layout for a **named target** (e.g. x86_64-unknown-linux-gnu or freestanding triple documented in residual) |
| 3 | **Field / tag honesty** | Where product types are enums or structs in freestanding C or IR, offsets and discriminant encoding are written down and dual-checked (table + gate), not vibes |
| 4 | **ABI calling convention honesty** | State freestanding product call story (C product wire today) vs future Rust consumer: what is stable (`extern "C"` / freestanding C) vs what is design-only (layout match without classic FFI); no claim of stable `extern "Rust"` |
| 5 | **Without classic FFI criterion** | Residual Done when for "layout interop slice" requires layout fixtures green **and** an explicit non-claim that full link without FFI is still open until a **later** named residual with dual evidence (Rust consumer + Slake product) |
| 6 | **LLVM IR ladder relationship** | Layout tests may cite Mult..Graph / compose artifacts as **tag/constant SSOT**; they do **not** require production llvm-as, full CFG/SSA, or opt pipeline |
| 7 | **Pins unchanged unless owned** | free / complete / PROVABLY / product Lake / host residual / living `llvmUnlocked` stay as living tip unless a **separate** residual owns a flip |

**Mult-first surface (starting set -- design default):**

| Surface | Why first |
|---------|-----------|
| Mult grade tags (0 / 1 / omega) | Already dual-pinned IR text (`LlvmMultText`); simple scalars; freestanding Mult subset emit exists |
| Linear class tags (when fixture expands) | Next unit surface after Mult; still tags not full linear proof |
| Types kind tags | Third unit surface; keep fixture growth Mult-first |

Do **not** start with full Graph/Program CFG layout. Prefer Mult scalars and
documented freestanding C struct layouts that Mult emit already produces.

---

## 6. Relation: freestanding C, PROVABLY, LLVM IR, Rust path

| Surface | Role after this design | This design claims? |
|---------|------------------------|---------------------|
| `out/freestanding-c/` | **Primary** runtimeless freestanding C product wire | **No change** |
| CompCert / PROVABLY | Seal product C; already true | **Orthogonal** |
| `out/llvm-ir/` | Deferred LLVM IR (text ladder + compose + optional llvm-as) | Design **opens** layout-test residuals; **not** full backend |
| Rust-native layout tests | Future residual Names below | Design only; **not** link success |
| Classic FFI | Fallback, not happy path | Not banned as engineering; not success criterion |

**Freestanding C primary:** Rust layout work does not replace CompCert-oriented
product C.

**LLVM IR:** compose + unit text supply constants and tags layout fixtures can
mirror. Optional `llvm-as` remains optional smoke, not a layout proof.

**Rust path order (plan Track 2):** unlock -> unit package -> compose ->
optional llvm-as -> **this design (2f)** -> layout test residuals -> (later)
full CFG/SSA (Track 5) and full Rust-native link only when product program
opens that Name with dual evidence.

---

## 7. Non-claims (this design slice and near-term layout residuals)

| Must not claim | Why |
|----------------|-----|
| Rust-native link success / shipped without classic FFI | Design bar only until layout tests **and** a later dual-evidence link residual |
| Stable `extern "Rust"` / full `repr(Rust)` freeze | Upstream Rust ABI is unstable; Slake does not invent stability |
| Full CFG / dominance / SSA | Track 5 after measured emit deepen; not layout design |
| Production opt pipeline / always-on llvm-as | Optional smoke already separate; not layout bar |
| Host elaborator residual free | Dual residual; Track 3 separate |
| Proof complete (`proofCompleteClaimed`) | SpecProof; Track 4 separate |
| Product free / complete re-open | Stay true |
| Product StillUsesLake / DependsOnLake true | Stay false |
| Living `llvmUnlocked` false | Stay true (unlock residual done) |
| Hand-authored product C growth under emit/out | Forbidden as residual progress |
| Second freestanding C dialect under `out/llvm-ir` | Forbidden |
| Editing `ref/rust` as product | Read-only reference |
| PROVABLY re-false | Forbidden |
| Layout fixture green = link success | Explicitly separate residual |

---

## 8. Residual Names for layout tests

Documented for residual lockstep. **Open** the first when Done when is
checkable (below). Later Names stay documented until capacity.

### Layout size/align fixture (**done** 2026-08-03)

| Field | Content |
|-------|---------|
| **Name** | Layout size/align fixture |
| **Status** | **done** (2026-08-03) |
| **Goal** | Mult-first size and alignment fixture vs rustc_abi rules for a small named type set on a documented target. |
| **Evidence** | Research fixture `doc/dev/research/layout-size-align-fixture-2026-08-03.md` (`LAYOUT-SIZE-ALIGN-FIXTURE`); Mult i32 tags + freestanding `enum slake_mult` size 4 align 4 on `x86_64-unknown-linux-gnu`; cites rustc_abi Integer/I32 + target data-layout + `out/llvm-ir/slake_mult.ll`; join `/tmp/grok-1000/grok-impl-summary-509af6bb.md` |
| **Out of scope** | Full Rust link; CFG/SSA; production llvm-as; editing `ref/rust`; product C hand growth; forge free/complete/PROVABLY; host free; proof complete |

### ABI parity smoke (done)

| Field | Content |
|-------|---------|
| **Name** | ABI parity smoke |
| **Status** | **done** (`just abi-parity-smoke`; pure Nix `nix/systems-llvm-ir/abi-parity.nix`; join `/tmp/grok-1000/grok-impl-summary-b1aa23ee.md`) |
| **Goal** | Fail-closed smoke that freestanding / C product call story and documented layout fixture stay consistent (not full Rust ABI). |
| **Done when** | (1) Thin just or pure Nix smoke greps fixture tokens + Mult freestanding / IR tag SSOT agreement. (2) Explicit non-claims: not `extern "Rust"` stable; not link without classic FFI shipped. (3) Pins unchanged as above. |
| **Out of scope** | Full calling-convention matrix across targets; rustc_codegen_llvm integration tests as product; FFI glue as "success" |
| **Primary paths** | just / pure Nix thin gate; fixture from prior Name; residual lockstep |
| **Depends on** | Layout size/align fixture Done (or co-landed with clear dual evidence) |

### Layout IR tag dual-pin (done)

| Field | Content |
|-------|---------|
| **Name** | Layout IR tag dual-pin |
| **Status** | **done** (`just layout-ir-dual-pin`; pure Nix `nix/systems-llvm-ir/layout-ir-dual-pin.nix`; join `/tmp/grok-1000/grok-impl-summary-4b236baf.md`) |
| **Goal** | Dual-pin Mult (then Linear/Types) IR text tag constants against layout fixture rows so IR and layout SSOT cannot drift. |
| **Done when** | Generator-owned `out/llvm-ir/slake_mult.ll` (etc.) tag constants grepped against fixture; dual-pin presence if Lean module; pins unchanged; not link claim. |
| **Out of scope** | Full Graph/Program layout; CFG/SSA |
| **Depends on** | Layout size/align fixture; ABI parity smoke **done** |
| **Evidence** | Mult primary full IR tag lines + fixture `LAYOUT-IR-TAG-DUAL-PIN` + Mult.lean names; Linear/Types class/kind tags when in scope later |

**Layout Mult-first test ladder closed** (fixture + ABI parity + dual-pin).
After layout tests (plan defaults, not auto-invented forge): full Rust-native
link / consumer dual residual only when product program opens a Name with dual
evidence (Rust consumer + product wire). Track 5 CFG/SSA stays separate. Host
residual free design and proof/superset inventories remain parallel Open tracks.
Next primary Open: **SelfApplyFs long-file split**.

---

## 9. Depends on (summary)

1. Unlock residual: `llvmUnlocked` **true** + lake proof.
2. Mult..Graph unit IR text + unit package expand.
3. Compose emit (`slake_compose.ll`).
4. Optional llvm-as smoke residual Done (recipe green present+skip).
5. This design note + residual Names (this slice).
6. Layout test residuals (next) before any "without classic FFI" success claim.

---

## 10. Success for this design slice

1. This research note on disk under `doc/dev/research/`.
2. Residual **Rust-native layout design** marked **done**; Open advanced to
   **Layout size/align fixture** (then fixture **done** 2026-08-03; dual-pin
   **done** 2026-08-03; Mult-first layout ladder closed).
3. ABI parity smoke **done**; Layout IR tag dual-pin **done**; fixture evidence
   `doc/dev/research/layout-size-align-fixture-2026-08-03.md`.
4. free / complete / PROVABLY / product Lake pins / host residual / living
   `llvmUnlocked` **unchanged**.
5. Hygiene / professional-tone green on novel markdown.
6. Short pointer from `doc/rust-entry.md` Design bar section.
7. Does **not** claim Rust-native link success without classic FFI.
8. Does **not** edit `ref/rust` as product.

Design only. Not link. Not full CFG/SSA. Not host free. Not proof complete.
Not product C growth. Not forge free/complete/PROVABLY.
