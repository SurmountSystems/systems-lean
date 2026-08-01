# Residual free bar inventory (plan Step 1)

Kind: analysis only. Not residual flip. Not product claim.
ASCII only. Date: 2026-08-01.

Living tip (updated Step 3 close 2026-08-01):

| What | Status |
|------|--------|
| Freestanding product self-host **complete** (claim B) | **true** |
| Product residual free (claim A) | **true** (Step 3 closed; host residual remains) |
| Lake host elaborator (`DependsOnLake` / `StillUsesLake`) | still used |
| Plan | `.agents/plans/plan-residual-free-freestanding.md` Steps 0-3 (Step 3 done) |

This note was the **checklist** before product residual free may flip. Step 3
closed free with inventory items 2-10 green; free != Lake gone.

---

## 1. Residual free measure (re-verify)

| Field | Value |
|-------|-------|
| Stage ids | `SLAKE_PRODUCT_RESIDUAL_FREE_MEASURE_V0` / `PRODUCT-RESIDUAL-FREE-MEASURE` / `SELF-HOST-RESIDUAL-FREE-MEASURE` |
| Data | `nix/systems-emit-wire/residual-free-measure.nix` |
| Release surface | `out/freestanding-c/slake_freestanding.{h,c}` when present |
| Command | `just product-residual-free-measure` (alias of `just systems-emit-wire`) |
| Re-verify (this inventory) | **exit 0** at inventory time (free still false). **Step 3 re-verify:** exit 0 with required honesty `product residual free`; residualFreeClaimed true |

What the measure does:

- Scans release freestanding C for **forbidden** managed Lean runtime / GC
  (garbage collection) residual tokens (`lean_object`, `GC_malloc`, `#include
  <stdio.h>`, `pthread_create`, GMP, etc.).
- Requires freestanding honesty markers when release is present:
  `SLAKE_EMIT_FREESTANDING_C_V0`, `RUNTIME-FS`, `no product GC`,
  **`product residual free`** (Step 3; was `not residual free` while free false).

What the measure does **not** do:

- Does **not** alone prove host elaborator residual is gone.
- Does **not** prove full formal LinearCheck or PROVABLY / CompCert.
- Historical stage comments may still say "not residual free" for land-time
  stages; living tip + required honesty token is product residual free.

**Bar item:** measure green on `out/freestanding-c` -- **MET** (inventory + Step 3).

**Bar item (measure policy on free flip):** **MET (Step 3).** `requiredFreestandingHonesty`
now requires `product residual free`. Emit banner SSOT + release wire living tip
print that token; free claim agrees.

---

## 2. Dual residual honesty (two programs)

| Surface | Meaning | Free program |
|---------|---------|--------------|
| **Product residual free** (claim A) | Freestanding release under `out/freestanding-c` has no managed Lean/GC residual **and** product honesty records agree residual is gone | This plan's free claim (Step 3) |
| **Host elaborator residual free** | Classic Lean / Lake managed residual gone from host rebuild of Systems Lean | **Separate** program; still remains; not claim A |

Primary module: `src/systems/SystemsLean/DualResidual.lean`.

| Def | Current value | Role on free flip |
|-----|---------------|-------------------|
| `hostElaboratorResidualRemains` | **true** | Must stay **true** while Lake elaborates host |
| `productResidualRemains` | **false** (Step 3) | Product residual gone when free claimed |
| `hostElaboratorResidualFreeClaimed` | **false** | Must stay **false** (do not forge host free) |
| `residualFreeClaimed` | **true** (Step 3) | Primary product free flag -- flipped when bar met |
| `productResidualFreeMeasureCited` | **true** (cite fold) | Keep measure path cited |
| `residualFreeMeasureDoesNotMeanFree` | **true** fold (`cited && !free && productResidualRemains`) | **Must be redesigned** when free is claimed (cannot keep `!free && productResidualRemains` if free true) |
| `productSelfHostCompleteClaimed` | **true** | Aligns claim B complete |
| `dualResidualReady` | fold requires both residuals remain, free false, complete true, llvm/PROVABLY false | Free flip needs a **new ready shape** (product residual gone; host residual still remains; free claimed true without forging host free) |
| `dualResidualDoesNotMeanResidualFree` | ready && !free && product remains | Historical honesty while free false; supersede carefully on free claim |
| `dualResidualDoesNotForgeEitherFree` | ready && neither free && both remain | Same |

Theorems / smoke (DualResidualTheorems): prove `residualFreeClaimed_false`,
`productResidualRemains_true`, `hostElaboratorResidualRemains_true`, measure
does not mean free. Free claim must land matching theorem renames (not rewrite
to silence).

**Bar item:** host residual free stays a **separate** program -- **documented**.
Do not set `hostElaboratorResidualFreeClaimed` true when claiming product free.

---

## 3. Honesty modules / Lean flags that must change (or stay)

### 3a. Product free claim bools (`residualFreeClaimed : Bool := false` today)

Inventory of greppable defs (all **false** at inventory time):

| Module path | Def | Notes |
|-------------|-----|-------|
| `SystemsLean/DualResidual.lean` | `residualFreeClaimed` | Primary dual-residual product free claim |
| `SystemsLean/SelfHostComplete.lean` | `residualFreeClaimed` | Complete recipe requires free **false** today (`freestandingProductSelfHostCompleteOk`) |
| `SystemsLean/SelfHostBody.lean` | `residualFreeClaimed` | Self-host body honesty |
| `SystemsLean/ProductPath.lean` | `residualFreeClaimed` | Product path ladder |
| `SystemsLean/InventoryClose.lean` | `residualFreeClaimed` | Inventory close |
| `SystemsLean/SpecProof.lean` | `residualFreeClaimed` | Spec/proof honesty |
| `SystemsLean/ProbeWire.lean` | `residualFreeClaimed` | Probe vs wire honesty |

`SelfApplyFs.lean` living tip: **complete true**, `stepContractFull` true;
does **not** own a `residualFreeClaimed` def in the tip inventory greps. Free
flip must not forge complete/llvm/PROVABLY.

### 3a2. Ready-fold cascade (require free false today)

Flipping only DualResidual is **not** enough. These ready / ok / partial folds
hard-require `!residualFreeClaimed` (or `residualFreeClaimed == false`) and
often also `productResidualRemains`. Step 3 free flip must redesign each family
in the same slice (or dual-pin home modules) so ready stays green with free true
without forging host free / proof / llvm / PROVABLY.

| Family | Module(s) | Folds that gate on free false (examples) |
|--------|-----------|------------------------------------------|
| Dual residual | DualResidual | `residualFreeMeasureDoesNotMeanFree`, `dualResidualSurfacesDistinct`, `dualResidualReady`, `dualResidualDoesNotMeanResidualFree`, `dualResidualDoesNotForgeEitherFree` |
| Self-host complete | SelfHostComplete | `freestandingProductSelfHostCompleteOk`, `freestandingProductSelfHostCompletePartialReady` (`residualFreeClaimed == false`) |
| Self-host body | SelfHostBody | `selfHostBodyReady` and companion does-not-mean-free fold |
| Product path ladder | ProductPath | `productPathReady`, close / ladder ready folds that conjoin `!residualFreeClaimed` |
| Inventory close | InventoryClose | `inventoryCloseReady` and does-not-mean-free fold |
| Spec / proof honesty | SpecProof | `specProofReady` and does-not-mean-free fold |
| Probe vs wire | ProbeWire | `probeWireReady` and does-not-mean-free fold |
| Theorems / smoke | *Theorems companions | `residualFreeClaimed_false` proofs; rename or restate on free claim (do not silence) |

**Bar item for Step 3:** inventory all `!residualFreeClaimed` / `== false` sites
with `rg` before flip; land ready-fold redesign + theorem renames with host
elaborator (lake) proof while Lake bootstraps.

### 3b. Companion product-residual remains flags

| Def | Module | Today | Free flip |
|-----|--------|-------|-----------|
| `productResidualRemains` | DualResidual | true | false (product residual gone) |
| `hostElaboratorResidualRemains` | DualResidual | true | **stay true** while Lake hosts |
| `hostElaboratorResidualFreeClaimed` | DualResidual | false | **stay false** |
| `proofCompleteClaimed` | SpecProof | false | **stay false** (not free) |
| `llvmUnlocked` / `provablyUnlocked` | SelfHostComplete / LlvmHold | false | **stay false** |

### 3c. Pure Nix / just

| Surface | Path / command | Free flip note |
|---------|----------------|----------------|
| Measure data | `nix/systems-emit-wire/residual-free-measure.nix` | Update required honesty markers when residual-remains prose retires |
| Emit-wire fold | `nix/systems-emit-wire/default.nix` `residualFreeMeasureGreen` | Stay green; may need free-claimed honesty branch |
| Gate | `just product-residual-free-measure` / `just systems-emit-wire` | Re-green after emit regen |
| Complete recipe | `just freestanding-self-host-complete` | Today asserts free false; free claim must update ok folds carefully so complete and free are both honest |

### 3d. Acceptance prose

| Path | Role |
|------|------|
| `src/systems/self-host.md` | SELF-HOST-RESIDUAL-FREE-MEASURE + free flip policy |
| Dual residual / residual free sections in self-host | Must say free true only after Step 3 bar |

---

## 4. Product wire / docs strings that still say residual remains

Inventory only (not a mass rewrite). These honesty strings **intentionally**
keep free false until Step 3.

### 4a. Generated product wire (from host SSOT / emit)

| Path | Examples |
|------|----------|
| `out/freestanding-c/slake_freestanding.h` | Banner: stage notes `not residual free`; LINEAR-EXACT-ONCE lines; unit translation not residual free product claim |
| `out/freestanding-c/slake_freestanding.c` | Same banner + section comments (HOST_COMPOSE_V0, EMIT_*, TYPED_IR, IR_PROGRAM, etc.) |
| `out/freestanding-c/README.md` | Stage not residual free; not freestanding residual free |
| `src/systems/emit/slake_freestanding.{h,c}` | Host workspace copy of wire (same honesty) |
| `src/systems/emit/host_emit_banner.ssot.txt` | Host SSOT fragments with `not residual free` |
| Other `host_emit_*.ssot.txt` | Extract and unit notes: still not residual free; not PROVABLY |

Measure **requires** some of these residual-remains markers today (section 1).

### 4b. Host Lean / residual ledgers (sample; not exhaustive)

Many `SystemsLean/*.lean` headers and IO diagnostics print `not residual free`
as intentional PARTIAL honesty (Emit*, Capable*, ProductPath*, DualResidual,
LlvmHold, etc.). Free claim Step 3 updates **living tip** and dual-residual
SSoT first; historical land-time false pins may remain until a deliberate
honesty scrub (same spirit as claim B complete vs land-time false).

Living residual / join board:

| Path | Status line |
|------|-------------|
| `RESIDUAL-systems.md` | free **false** |
| `RESIDUAL.md` | free **false** |
| `WATCHER.md` | free false until free claim |
| `doc/SESSION-HANDOFF.md` | free false |
| `README.md`, `doc/goals.md`, `doc/vocabulary.md` | Human docs still need living-tip free language at free claim (plan Step 3 / plan section 7) |

---

## 5. Non-claims (product residual free is not ...)

| Non-claim | Why |
|-----------|-----|
| Residual free **!=** Lake gone | Host still uses classic Lean Lake elaborator (`DependsOnLake` / `StillUsesLake` true). Product free only concerns freestanding release residual. |
| Residual free **!=** full proofs / proof complete | `SpecProof.proofCompleteClaimed` stays false; Linear Token axioms remain; host theorems are partial honesty. |
| Residual free **!=** PROVABLY | PROVABLY needs real CompCert / `ccomp` evidence (`LlvmHold.provablyUnlocked` false; held). |
| Residual free **!=** LLVM unlock | `out/llvm-ir` deferred; `llvmUnlocked` false; not unlocked by free. |
| Residual free **!=** freestanding product self-host complete | Complete (claim B) is already **true** and is a **different** bar. Do not call complete free. |
| Measure green **!=** free claimed | Measure has been green while free stayed false by design. |
| Dual residual ready **!=** free | dualResidualReady today **requires** product residual remains. |
| Host residual free | Separate program; not claimed with product free. |

---

## 6. Linear vs affine (enforced today vs later)

| Discipline | Meaning | Enforced today | Later |
|------------|---------|----------------|-------|
| **Linear** (MULT-1 / LINEAR-EXACT-ONCE) | Resource used **exactly once** | **Primary freestanding story.** Host: Linear Token/mkToken/consume **axioms** (LINEAR-AXIOMS-REMAIN) + LinearTheorems (shareNat_* / polyId_* / roundTrip_eq / Mult-class pins / axiom inventory) -- classic Lean does **not** enforce exact-once. HostCompose live-flag mint/consume + fail-closed double consume + mint_consume_exact_once_sequential. Product wire: `slake_linear_consume` / ConsumeToken host APIs; behavioral probe checks second consume fails closed. CompilePath Linear fixture + KernelLinear + EmitLinear HOST-EMIT-LINEAR. Affine not first-class. Plan Step 2 Linear freestanding contracts **done** (2026-08-01). | Freestanding elaborator-class checks when Slake host is freestanding; not required for free claim |
| **Affine** (at most once; discard allowed) | May discard unused | **Not first-class on the product wire yet.** Design intent only. No affine-as-product-ABI residual open in this inventory. | After linear bar; only if design needs discard-without-use on freestanding path |
| **MULT-0** | Erased / runtime absent | Erasure absence honesty APIs on wire; mark-erased paths | Keep absence honesty; not GC |
| **MULT-omega** | Unrestricted | shareNat-style unrestricted sketches; value mult on IR | Same grades 0/1/omega minimum Quantitative Type Theory (QTT) freestanding set |

**Bar item for free claim:** free does **not** require affine done. Free does
**not** require all Linear axioms eliminated (Step 2 strengthens linear
evidence; free claim is residual-text + honesty agreement, not full LinearCheck).

---

## 7. Master checklist before product residual free (Step 3)

Do **not** flip free until all of the following are true and documented:

1. [x] **Measure green** on `out/freestanding-c` (inventory + Step 3 re-verify).
2. [x] **Measure honesty policy** -- required honesty `product residual free`
      (section 1); free-true wire not forced to claim residual remains.
3. [x] **DualResidual** product free: `residualFreeClaimed` true;
      `productResidualRemains` false; host residual remains true; host free
      claimed false; dual-ready folds free-true shape (section 2).
4. [x] **Local residualFreeClaimed pins** -- DualResidual + SelfHostComplete
      living SSoT true; companion ProbeWire/SpecProof/SelfHostBody/ProductPath
      keep intentional land-time local false with DualResidual free-true
      does-not-mean-free redesign; lake proof on claim path (section 3a).
5. [x] **SelfHostComplete / complete ok folds** green with free true (Ok requires
      free true now; complete independent of Lake-gone).
6. [x] **Emit SSOT + regenerate** -- banner living tip product residual free;
      productWireHonestyTokens; measure token present on release.
7. [x] **Human docs** aligned living tip (README / goals / vocabulary / self-host
      / systems residual / handoff / plan section 7).
8. [x] **Non-claims restated** -- free != Lake gone; != proof complete; !=
      PROVABLY; != LLVM unlock; host residual remains.
9. [x] **Linear story** honest -- exact-once primary; affine not required; Token
      axioms remain; no forged MULT-1 elaborator enforcement on classic Lean.
10. [x] **Gates green** -- product-residual-free-measure; systems-host;
      freestanding-self-host-complete with lake; DualResidualTheorems lake.

Step 3 **done** (2026-08-01). Free true with host residual remains.

---

## 8. Recommended next residual (after Step 3)

**Name:** Residual free claim -- **done** (2026-08-01)

**Goal:** set product residual free honestly only when master checklist (section
7) is fully green; never forge free true.

**Status note (2026-08-01 Step 3 close):** checklist 2-10 **green**; DualResidual
residualFreeClaimed true; productResidualRemains false; hostElaboratorResidualRemains
true; measure required honesty product residual free; complete remains true;
Lake host remains. Plan Step 4 (proof progressive / PROVABLY / LLVM) **held** --
do not auto-start.

**Out of scope (held):** forging Lake-gone; PROVABLY; LLVM; eliminating Linear
Token axioms.

**Primary paths (closed):** DualResidual / SelfHostComplete; residual-free-measure;
emit SSOT; residual / WATCHER / handoff / plan.

---

## 9. Evidence log

| Check | Result |
|-------|--------|
| `just product-residual-free-measure` | exit **0**; PRODUCT-RESIDUAL-FREE-MEASURE **green** (free-true honesty) |
| Free claim flipped? | **Yes (Step 3)** -- DualResidual + SelfHostComplete residualFreeClaimed true |
| Claim B complete | remains **true** |
| Host elaborator residual | remains **true** (not forged free) |
| Product C / shell grown? | **No** (emit SSOT / generated wire only) |

Cite: plan `.agents/plans/plan-residual-free-freestanding.md` Step 3;
residual `RESIDUAL-systems.md`; join `/tmp/grok-1000/grok-impl-summary-f756c683.md`.
