# LLVM IR unlock design (2026-08-03)

Kind: analysis only. Not residual invent beyond the named residual program.
Not unlock pin flip. Not full control-flow graph (CFG) / static single
assignment (SSA). Not host elaborator residual free. Not proof complete.
Not product C growth. Not Rust-native link success.

ASCII only. Plain English. Date: 2026-08-03.

**Plan:** `.agents/plans/plan-north-star-remaining.md` Track 2 (unlock design
2a, unlock residual 2b, checklist).
**Prior emit path note:** `doc/dev/research/llvm-ir-emit-path-2026-08-02.md`
**Peer design residual shape:** `doc/dev/research/compcert-product-seal-design-2026-08-02.md`
**Hold gate:** `src/systems/SystemsLean/LlvmHold.lean`
**Release surface:** `out/llvm-ir/README.md`
**Rust layout bar:** `doc/rust-entry.md`

Living tip at design land: freestanding product self-host **complete true**;
product residual free **true**; product StillUsesLake / DependsOnLake **false**;
host elaborator residual **remains**; PROVABLY **true** (`provablyUnlocked`);
`llvmUnlocked` was **false** at design land. **Post residual (2026-08-03):**
`llvmUnlocked` **true** with lake blast-radius proof (unlock residual Done).

---

## 1. Intent

**LLVM IR unlock design** states the honest evidence bar for flipping the living
pin `SystemsLean.LlvmHold.llvmUnlocked` from **false** to **true**, after the
Mult..Graph unit IR **text** ladder is done.

| Intent | Meaning |
|--------|---------|
| Unlock | Living pin true with elaborator proof + residual/self-host/surface honesty |
| Not unlock alone | Not full backend, not CFG/SSA production pipeline, not Rust link success |
| Primary product unchanged | Freestanding C under `out/freestanding-c/` stays primary product wire |
| PROVABLY orthogonal | `provablyUnlocked` already true; unlock does not re-open CompCert seal |

Unlock is a **product program gate** for later LLVM / Rust-native work (Track 2
compose emit, optional llvm-as smoke, Track 5 CFG/SSA, Track 2f Rust layout).
It is **not** a substitute for freestanding C or for PROVABLY.

---

## 2. Preconditions met today

| Precondition | Evidence |
|--------------|----------|
| Freestanding product self-host complete (claim B) | **true** (SelfApplyFs living tip) |
| Product residual free (claim A) | **true** |
| Product StillUsesLake / DependsOnLake | **false** (M6 phase 2; lake proof) |
| PROVABLY (`provablyUnlocked`) | **true** (CompCert product matrix + lake proof) |
| Mult unit IR text | **done** (`LlvmMultText` / `slake_mult.ll` / `just llvm-mult-text`) |
| Linear unit IR text | **done** (`LlvmLinearText` / `slake_linear.ll` / `just llvm-linear-text`) |
| Types unit IR text | **done** (`LlvmTypesText` / `slake_types.ll` / `just llvm-types-text`) |
| Unit package join (Mult+Linear+Types) | **done** (`just llvm-unit-package`) |
| Program unit IR text | **done** (`LlvmProgramText` / `slake_program.ll` / `just llvm-program-text`) |
| Graph unit IR text | **done** (`LlvmGraphText` / `slake_graph.ll` / `just llvm-graph-text`) |
| Emit path design + measured stub | **done** (`LlvmEmitPath` / `MEASURED-STUB.txt`) |
| Living pin | `def llvmUnlocked : Bool := false` in `LlvmHold.lean` |
| Local text-module unlock pins | Each text module keeps local unlock **false** / keeps locked **true** |

Text ladder Mult..Graph is **green and dual-pinned** (Lean package pins +
generator-owned artifacts under `out/llvm-ir/` + fail-closed just greps). That
satisfies plan Track 2 unlock bar item 1. It does **not** by itself flip the
living pin.

---

## 3. Unlock evidence checklist (minimum bar for residual 2b)

Mirror of plan Track 2 **Unlock bar (2b)** -- minimum checklist. The next
residual Name **LLVM IR unlock residual** must meet **all** rows before GREEN.

| # | Requirement | Checkable evidence |
|---|-------------|--------------------|
| 1 | Text ladder Mult..Graph green and dual-pinned | `just llvm-mult-text` / `llvm-linear-text` / `llvm-types-text` / `llvm-program-text` / `llvm-graph-text` (and unit package as applicable); generator-owned `out/llvm-ir/slake_*.ll`; Lean ready pins true; local unlock false until living pin flip |
| 2 | Explicit residual Name Open for unlock | This program: **LLVM IR unlock residual** Open with Done when below |
| 3 | Living pin flip in `LlvmHold.lean` + Ok folds that require false today | `def llvmUnlocked : Bool := true` (or equivalent living SSoT); update `holdHonestyOk` / theorems / any fold that currently requires `!llvmUnlocked` so honesty still holds after unlock |
| 4 | Lake elaborator proof exit 0 on pin-flip modules | `lake build` (and claim/exe surface if present) on LlvmHold + related folds; **not** greps alone |
| 5 | Residual + handoff + self-host + surface-matrix llvm row honesty | `RESIDUAL-systems.md` Done; `RESIDUAL.md` join; `WATCHER.md` next; `SESSION-HANDOFF` living tip; `self-host.md` / surface matrix llvm row status honest (unlocked with evidence, not "full backend") |
| 6 | free / complete / PROVABLY / product Lake pins / host residual **unchanged** | free true; complete true; `provablyUnlocked` true; StillUsesLake/DependsOnLake false; `hostElaboratorResidualRemains` true -- unless a **separate** residual owns a flip |

**Fail-closed:** greps-only "unlock" is **not** GREEN. Operator-gated only in the
sense that the residual implements the bar; do not invent unlock from text
ladder alone.

**Greppable hold tokens (cite only; living SSoT in Lean):**

- `llvmUnlocked`, `provablyUnlocked`, `llvmHoldReady`, `sh6HoldReady`
- `HOST-LLVM-HOLD`, `SELF-HOST-LLVM-HOLD`, `HOST-PROVABLY-HOLD`
- `SLAKE_SELF_HOST_LLVM_HOLD_V0`, `llvmHoldReady_true`, `llvmUnlocked_false`
  (theorem name today; after unlock residual, theorems must match the new pin)

---

## 4. Relation: freestanding C, PROVABLY, Rust path

| Surface | Role after unlock | Unlock alone claims? |
|---------|-------------------|----------------------|
| `out/freestanding-c/` | **Primary** runtimeless freestanding C product wire | **No change** -- primary stays freestanding C |
| CompCert / PROVABLY | Seal product C; `provablyUnlocked` already true | **Orthogonal** -- unlock does not re-open or strengthen PROVABLY |
| `out/llvm-ir/` | Deferred LLVM IR release surface (embed + Rust path later) | Unlock **opens** honest residual work on real emit; does **not** claim production full backend |
| Rust-native layout | Design bar vs `rustc_abi` (`doc/rust-entry.md`) | **Not** claimed by unlock alone -- Track 2f **Rust-native layout design** after real emit |

**Freestanding C primary:** LLVM IR is a later parallel release surface, not a
replacement for CompCert-oriented freestanding C.

**PROVABLY orthogonal:** `LlvmHold` already separates `provablyUnlocked` (true)
from `llvmUnlocked` (false). Unlock residual must keep that separation honest.

**Rust path after unlock:** plan order is unlock residual, then measured compose
emit (and optional llvm-as), then Rust-native layout **design**. Unlock true
does **not** mean layout-compatible interop without classic foreign function
interface (FFI) is shipped.

---

## 5. Non-claims (this design slice and unlock residual scope)

| Must not claim | Why |
|----------------|-----|
| `llvmUnlocked` true **in this design slice** | Design only; pin flip is **LLVM IR unlock residual** |
| Full CFG / dominance / SSA | Track 5 after unlock + measured emit deepen |
| Production opt pipeline / full llvm-as always required | Optional smoke (2e) is separate; not unlock bar |
| Host elaborator residual free | Dual residual; Track 3 separate |
| Proof complete (`proofCompleteClaimed`) | SpecProof; Track 4 separate |
| Product free / complete re-open | Stay true; do not re-open without cause |
| Product StillUsesLake / DependsOnLake true | Stay false |
| Hand-authored product C growth under emit/out | Forbidden as residual progress |
| Second freestanding C dialect under `out/llvm-ir` | Forbidden |
| Rust-native link success / without classic FFI shipped | Design bar only until 2f + tests |
| PROVABLY re-false | Forbidden |

---

## 6. Next residual Name (pin flip)

### LLVM IR unlock residual

| Field | Content |
|-------|---------|
| **Name** | LLVM IR unlock residual |
| **Goal** | Flip living `llvmUnlocked` with elaborator proof after Mult..Graph text ladder and this design checklist. |
| **Done when** | (1) `llvmUnlocked` true in `SystemsLean/LlvmHold.lean` (living SSoT). (2) Lake elaborator proof exit 0 on LlvmHold + folds that depend on the pin (theorems updated to match). (3) Residual / self-host / surface-matrix llvm row honesty: unlock claimed with evidence; not sold as full backend or Rust link. (4) free / complete / PROVABLY / product Lake pins / host residual **unchanged**. (5) Dual evidence: greps of pin + lake exit 0 (greps alone insufficient). |
| **Out of scope** | Full CFG/SSA; production opt pipeline; host free; proof complete; product C growth; Rust-native link success; forging unlock from text-only greps |
| **Primary paths** | See section 7 blast-radius inventory (not LlvmHold alone). Living SSoT: `SystemsLean/LlvmHold.lean` + `LlvmHoldTheorems.lean`. Text ladder: `LlvmEmitPath`, `LlvmMultText`, `LlvmLinearText`, `LlvmTypesText`, `LlvmProgramText`, `LlvmGraphText`. Inventory: `InventoryClose.lean` (+ theorems). Cascade greps: `!LlvmHold.llvmUnlocked` / `llvmUnlocked = false`. Residual lockstep + optional `out/llvm-ir/README.md` / `self-host.md` / surface-matrix llvm row. |
| **Gates** | Lake on claim-bool flip mandatory; `just systems-host` / hygiene as touched; never greps-only GREEN |

**After unlock residual (plan defaults, not auto-invented here):**

| Order | Name (plan) | Role |
|------:|-------------|------|
| 2c | LLVM IR unit package expand | Join Program/Graph into unit package deepen; unlock honesty matches pin |
| 2d | LLVM IR compose emit | First generator-owned composed IR from host compose / program+graph SSOT |
| 2e | Optional llvm-as smoke | Fail-closed optional when `llvm-as` on PATH |
| 2f | Rust-native layout design | Design bar vs rustc_abi; not claim without classic FFI yet |

---

## 7. Hold module honesty notes + unlock blast radius (implementer watch-outs)

### 7a. LlvmHold living pin and theorems

1. **`holdHonestyOk` today** is `(!llvmUnlocked) && (!freestandingProductSelfHostComplete)`.
   Flipping `llvmUnlocked` true **breaks** this definition unless the unlock
   residual rewrites hold honesty for the unlocked state (document new
   non-claims: unlock does not mean freestanding complete on LlvmHold local pin;
   complete still lives on SelfApplyFs living tip).
2. **`selfApplyDoesNotUnlockLlvm`** today is `selfApplyReady && !llvmUnlocked`.
   After unlock, that name/def must be retired or redefined honestly (self-apply
   still does not **forge** unlock without residual -- history; living pin is true).
3. **Theorems** in `LlvmHoldTheorems` prove `llvmUnlocked_false` today. Unlock
   residual must land matching theorems (`llvmUnlocked_true` or equivalent) and
   lake-green them -- do not leave proved-false theorems against a true pin.
4. **Local text-module unlock pins** (`llvm*TextLlvmUnlocked` false) **prefer
   stay false** as "this module does not own unlock." Living SSoT is LlvmHold
   only. Ready folds should stop requiring `!LlvmHold.llvmUnlocked` and instead
   compose hold honesty for the unlocked state (or drop the lock conjunct once
   the living pin is true).

### 7b. Greppable blast-radius inventory (flip without this = lake RED)

Checklist item 3 ("any fold that requires `!llvmUnlocked`") means at least:

| Class | Paths / greppable shape (2026-08-03 inventory) |
|-------|-----------------------------------------------|
| **(a) Text ladder `example` + keep-locked ready compose** | `LlvmEmitPath`, `LlvmMultText`, `LlvmLinearText`, `LlvmTypesText`, `LlvmProgramText`, `LlvmGraphText`: each has `example : LlvmHold.llvmUnlocked = false := rfl` (or equivalent) and ready/compose folds with `&& !LlvmHold.llvmUnlocked` / `llvm*KeepsLlvmLocked` / local unlock pin false. Grep: `example : LlvmHold.llvmUnlocked` and `!LlvmHold.llvmUnlocked` under those modules. |
| **(b) InventoryClose readiness** | `InventoryClose.lean`: `inventoryCloseReady` / `inventoryPartialCarryHonest` (and related) require `!LlvmHold.llvmUnlocked` and compose `llvmHoldReady`. Theorems in `InventoryCloseTheorems.lean` example-pin false. Header prose may still cite land-time non-claims; rewrite honesty when pin flips. |
| **(c) Cascade modules with `!LlvmHold.llvmUnlocked` ready folds** | At least: `ProductPath.lean`, `DualResidual.lean`, `ProbeWire.lean`, `SpecProof.lean`, `SelfHostBody.lean` (and matching `*Theorems` `example` pins). Re-grep at unlock residual start: `rg '!LlvmHold.llvmUnlocked\|llvmUnlocked = false' src/systems/SystemsLean`. |
| **(d) SelfApplyFs / SelfHostComplete local aliases** | Modules that re-export or prove `llvmUnlocked = false` (e.g. `SelfHostCompleteTheorems`) must match the living pin after flip. |

**Preferred honesty story after unlock (default for residual 2b):**

1. Living pin true only in `LlvmHold.llvmUnlocked`.
2. Local text unlock pins stay **false** (module is not the unlock owner).
3. Text ready folds drop or invert the `!LlvmHold.llvmUnlocked` conjunct so
   `llvm*TextReady` stays true when unlocked.
4. InventoryClose / ProductPath / DualResidual / ProbeWire / SpecProof /
   SelfHostBody ready folds no longer require living pin false; document that
   unlock is orthogonal to residual free / complete / PROVABLY.
5. Lake elaborator proof on **all** modules that change, not greps of LlvmHold alone.

---

## 8. Success for this design slice

1. This research note on disk under `doc/dev/research/`.
2. Residual Open advanced to **LLVM IR unlock residual** (then **done** 2026-08-03).
3. Unlock residual landed: `llvmUnlocked` **true** + lake blast-radius proof.
4. free / complete / PROVABLY unchanged; host residual remains; product Lake pins false.
5. Hygiene / professional-tone green on novel markdown.

Design slice itself did not flip the pin. Unlock residual did. Not full CFG/SSA.
Not host free. Not proof complete. Not product C growth. Not Rust-native link.
