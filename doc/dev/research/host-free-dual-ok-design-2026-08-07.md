# Host free dual-ok design (F0b / plan Phase F pre-F1)

Kind: analysis only. Not residual invent. Not free pin flip. Not DualResidual
claim flip. Not HostResidualShrink free claim flip. Not product free re-open.
Not FullHostElaborateRemains re-true. ASCII only. Date: 2026-08-07.

**Implements residual Name:** Host free dual-ok design (plan Phase F **F0b**).

**Living free-bar inventory (cite):**
`doc/dev/research/host-residual-free-bar-inventory-2026-08-07.md`

**Section-4 free bar SSoT:**
`doc/dev/research/host-residual-free-design-2026-08-03.md` section 4.

**Layer-1 checklist SSoT:**
`.agents/plans/plan-slake-replaces-lake.md` section 2 + Phase F.

**Product Lean (read-only for this design):**
`src/systems/SystemsLean/DualResidual.lean`,
`src/systems/SystemsLean/DualResidualTheorems.lean`,
`src/systems/SystemsLean/HostResidualShrink.lean`,
`src/systems/SystemsLean/HostPackageWrite.lean`.

**Surface matrix:**
`src/systems/surface-matrix.md` Host residual free row.

**Prior F0 report:**
`.agents/reports/impl-f0-free-checklist-inventory-2026-08-07.md`.

This note designs the dual-ok fold redesign so F1 can flip
`hostElaboratorResidualRemains` to **false** and
`hostElaboratorResidualFreeClaimed` to **true** without re-opening product
residual free. **This slice does not flip any claim bools.**

---

## 1. Goal

Specify, in checkable product Lean terms, how DualResidual and HostResidualShrink
fold requirements change when host elaborator residual free is claimed. The free
flip is **not** a one-bool edit: living ready / surfacesDistinct /
doesNotForgeHostFree folds require remains true and free claimed false today.

After F1 (separate residual):

| Pin | After F1 target |
|-----|-----------------|
| `hostElaboratorResidualRemains` | **false** |
| `hostElaboratorResidualFreeClaimed` | **true** |
| `hostResidualShrinkHostElaborateRemains` | **false** (mirror DualResidual) |
| `hostResidualShrinkHostFreeClaimed` | **true** (mirror DualResidual free) |
| `hostResidualShrinkFullHostElaborateRemains` | stays **false** (A66; do not re-true) |
| `hostResidualPartialShrinkClaimed` | stays **true** or retire to free-successor (see section 3) |
| `residualFreeClaimed` (product) | stays **true** |
| `productResidualRemains` | stays **false** |
| Product StillUsesLake / DependsOnLake | stays **false** |
| free / complete / PROVABLY product tip | unchanged |

---

## 2. Living pin snapshot (must stay until F1)

Verified shape for this design slice (do not flip):

| Pin | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | **true** | DualResidual.lean |
| `hostElaboratorResidualFreeClaimed` | **false** | DualResidual.lean |
| `residualFreeClaimed` | **true** | DualResidual.lean |
| `productResidualRemains` | **false** | DualResidual.lean |
| `hostResidualShrinkHostElaborateRemains` | **true** | HostResidualShrink.lean |
| `hostResidualShrinkHostFreeClaimed` | **false** | HostResidualShrink.lean |
| `hostResidualShrinkFullHostElaborateRemains` | **false** | HostResidualShrink.lean |
| `hostResidualPartialShrinkClaimed` | **true** | HostResidualShrink.lean |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** | HostResidualShrink.lean |
| HostPackageWrite `stillUsesLake` / `dependsOnLake` | **true** | HostPackageWrite.lean (bootstrap honesty class) |

FullHostElaborateRemains true and BootstrapPrebuildRemains true are **not** open
blockers (A66 / A8 closed them).

---

## 3. DualResidual fold redesign

### 3.1 Current fold requirements (fail-closed against free forge)

Living definitions (abbreviated):

| Def | Current requirement (host-side) | Why |
|-----|----------------------------------|-----|
| `dualResidualSurfacesDistinct` | `hostElaboratorResidualRemains` **and** `!hostElaboratorResidualFreeClaimed` **and** product residual gone **and** product free claimed **and** token/cite strings | Surfaces are "host remains vs product free" |
| `dualResidualReady` | productPathCloseReady **and** surfaceOk **and** surfacesDistinct **and** `hostElaboratorResidualRemains` **and** `!hostElaboratorResidualFreeClaimed` **and** product free path **and** complete | Ready while host residual remains |
| `dualResidualDoesNotForgeHostFree` | `dualResidualReady` **and** `!hostElaboratorResidualFreeClaimed` **and** product free **and** `hostElaboratorResidualRemains` | Explicit anti-forge: ready does not mean host free |
| `dualResidualOk` | alias of `dualResidualReady` | Joint-name honesty only |

Theorems / smoke that encode the remains-true / free-false shape (must rewrite
on F1, not delete without replacement):

| Surface | Living name (greppable) | Today proves |
|---------|-------------------------|--------------|
| Theorem | `hostElaboratorResidualRemains_true` | remains = true |
| Theorem | `dualResidualReady_true` | ready = true under remains-true folds |
| Theorem | `dualResidualDoesNotForgeHostFree_true` | anti-forge under free-false |
| Smoke | `example : hostElaboratorResidualFreeClaimed = false` | free not claimed |
| Smoke | `example : dualResidualSurfacesDistinct = true` | distinct under remains |
| Header / comments | "MUST decide true/false" on remains / free pins | Land-time forge ban |

### 3.2 Problem on a naive one-bool flip

If F1 only set remains := false and freeClaimed := true without fold redesign:

1. `dualResidualSurfacesDistinct` goes **false** (requires remains true).
2. `dualResidualReady` goes **false** (requires remains true and free false).
3. `dualResidualDoesNotForgeHostFree` goes **false** (requires free false and remains true).
4. Theorems `*_true` and smokes fail closed (good: prevents silent free forge).
5. Product residual free stays true, but dual-ok **collapses**, so free is not dual-ok.

### 3.3 Proposed free-shape folds (after F1)

**Core idea:** "surfaces distinct" and "ready" mean **two residual honesty surfaces
stay distinct**, not "host residual must remain forever." After free, the host
surface is **host free claimed** (day-to-day host develop residual retired) while
the product surface stays **product residual free**. Fail-closed moves from
"do not claim free" to "do not re-open product residual or re-true FullHost."

| Def | Proposed free-shape fold | Fail-closed intent |
|-----|--------------------------|--------------------|
| `hostElaboratorResidualRemains` | **false** | Day-to-day host elaborator residual retired under choice (a) living bar |
| `hostElaboratorResidualFreeClaimed` | **true** | Host residual free deliberately claimed |
| `dualResidualSurfaceOk` | Keep all stage/cite conjuncts. **Mandatory dual-update with token reseed:** if `hostElaboratorResidualToken` reseeds to free wording, rewrite the living equality `hostElaboratorResidualToken == "host elaborator residual remains"` to the new string (surfaceOk hardcodes that equality today; ready requires surfaceOk). | Stage/cite surface still green after token reseed |
| `dualResidualSurfacesDistinct` | `!hostElaboratorResidualRemains` **and** `hostElaboratorResidualFreeClaimed` **and** `!productResidualRemains` **and** `residualFreeClaimed` **and** same product token/cite strings **and** host token equality matching reseeded free string (section 3.4) | Host free surface vs product free surface remain distinct |
| `dualResidualReady` | **Free-polarity flip only** on host pins: `!hostElaboratorResidualRemains` **and** `hostElaboratorResidualFreeClaimed` instead of remains true / free false. **Keep every product-path / measure / complete conjunct unchanged:** `ProductPath.productPathCloseReady` **and** `dualResidualSurfaceOk` **and** free-shape `dualResidualSurfacesDistinct` **and** `!productResidualRemains` **and** `productResidualFreeMeasureCited` **and** `residualFreeMeasureAgreesFree` **and** `residualFreeClaimed` **and** `productSelfHostCompleteClaimed` **and** `SelfApplyFs.freestandingProductSelfHostComplete`. Do not drop measure or complete conjuncts when rewriting free polarity. | Ready after host free; product free path still fully dual-ok |
| `dualResidualDoesNotForgeHostFree` | **Retire or invert meaning** -- see rename below | Name is land-time anti-forge; free tip needs a successor honesty def |
| `dualResidualOk` | stays alias of ready | No stronger gate |

**Recommended rename / rewrite for the anti-forge surface:**

| Today | After F1 | Role |
|-------|----------|------|
| `dualResidualDoesNotForgeHostFree` | Keep def name for greps **or** add successor `dualResidualHostFreeHonest` | Prefer **keep greppable name** with rewritten body so pure Nix / residual greps stay stable |
| Body today | ready && free false && remains true && product free | ready && free **true** && remains **false** && product free && product residual gone |
| Comment | "ready does NOT forge host free" | "host free claimed is dual-ok; does not re-open product residual" |

Optional clarity (not required if body rewrite is enough): add a second greppable
alias `dualResidualDoesNotReopenProductResidual` equal to the new body for prose
search; do **not** invent a third claim bool.

### 3.4 Token / cite honesty after free (surfaceOk + surfacesDistinct dual-update)

Living tokens and hard-coded equalities:

| Site | Living value / equality | After F1 |
|------|-------------------------|----------|
| `hostElaboratorResidualToken` def | `"host elaborator residual remains"` | Prefer reseed to `"host elaborator residual free"` so prose is free-honest |
| `dualResidualSurfaceOk` | `hostElaboratorResidualToken == "host elaborator residual remains"` | **Must dual-update** to match reseeded token (ready requires surfaceOk) |
| `dualResidualSurfacesDistinct` | same host token equality + product free token + cites | **Must dual-update** host token equality with surfaceOk |
| `productResidualToken` | `"product residual free"` | unchanged |
| HOST-RESIDUAL / PRODUCT-WIRE-RESIDUAL / EMIT-BOUNDARY / RUNTIME-* cites | as today | keep; optional HOST-RESIDUAL-FREE cite if presence gates need it |

**Mandatory dual-update rule:** never reseed `hostElaboratorResidualToken` without
rewriting both `dualResidualSurfaceOk` and `dualResidualSurfacesDistinct` token
equalities in the same edit. Token reseed alone collapses ready via surfaceOk.

**Pure Nix:** free-shape pin strings and token strings in
`nix/systems-host-presence/host-specs-hold-close.nix` (DualResidual + DualResidualTheorems
blocks) are a **mandatory** F1 gate update (section 8.1), not optional. HITL stage
after agent edits (agents never `git add`).

**Fallback if token reseed is deferred:** keep historical remains token string as
cite-only and invert only pin folds / ready free polarity; document that token
prose lags free tip. Prefer reseed + dual-update for honesty.

### 3.5 Theorem and smoke rewrite list (F1)

| Living theorem / smoke | F1 action |
|------------------------|-----------|
| `hostElaboratorResidualRemains_true` | Rewrite to `hostElaboratorResidualRemains_false` (or rename def + theorem; keep greppable dual if gates need both land-time and free tips -- prefer **rename to `_false`** and update greps/gates in-slice) |
| `example : hostElaboratorResidualFreeClaimed = false` | Flip to `= true`; optional theorem `hostElaboratorResidualFreeClaimed_true` |
| `dualResidualReady_true` | Keep name; prove ready under **new** free-shape folds (`by decide`) |
| `dualResidualDoesNotForgeHostFree_true` | Keep name; prove rewritten body true under free tip |
| `dualResidualOk_eq_ready` | Keep (definitional) |
| `productResidualRemains_false` / `residualFreeClaimed_true` / measure theorems | **Unchanged** (product free stays true) |
| Module header / MUST decide comments | Surgical rewrite: remains false; free claimed true; product free still true; FullHost stays false |

**Header honesty after free:** DualResidual must still say product residual free
is not host free synonym and that FullHostElaborateRemains false is already true
(A66) and is not re-opened by host free.

### 3.6 Fail-closed shape after free

| Must stay true after F1 | Must stay false after F1 |
|-------------------------|--------------------------|
| `residualFreeClaimed` (product) | `productResidualRemains` |
| `productSelfHostCompleteClaimed` / SelfApplyFs complete | Product StillUsesLake / DependsOnLake |
| `hostElaboratorResidualFreeClaimed` | `hostElaboratorResidualRemains` |
| `dualResidualReady` under free-shape folds | Forge slogans that host free re-opens product residual |
| FullHostElaborateRemains **false** (HostResidualShrink) | FullHostElaborateRemains true |
| free / complete / PROVABLY product tip | proofCompleteClaimed (Track 4; still false unless separate residual) |

Host free true **does not** re-open product residual free. Product free true
**does not** alone prove host free (historical partial shrink).

---

## 4. HostResidualShrink free dual-ok successor

### 4.1 Current free-related dual-ok (partial-shrink shape)

| Def | Current host free polarity |
|-----|----------------------------|
| `hostResidualShrinkHostElaborateRemains` | **true** (mirror DualResidual remains) |
| `hostResidualShrinkHostFreeClaimed` | **false** |
| `hostResidualPartialShrinkClaimed` | **true** |
| `hostResidualShrinkKeepsHostResidual` | finished **and** partial **and** remains **and** !free **and** !FullHost |
| `hostResidualShrinkReady` | partial inventory **and** keepsHostResidual **and** remains **and** !free **and** diagnostic Lake remain **and** !FullHost **and** tool inventory ... |
| `hostDevelopToolInventoryClosedDualOk` | ... **and** !FullHost **and** diagnostic remain **and** !host free |
| `hostResidualShrinkFreeIsNotLakeGone` | ready **and** remains **and** !free |
| `hostResidualShrinkDoesNotMeanHostFree` | ready **and** partial **and** !free **and** remains |
| Theorems | `hostResidualShrinkHostFreeClaimed_false`, `hostResidualShrinkFullHostElaborateRemains_false`, smokes free=false |

### 4.2 Partial shrink to full free claim transition

| Step | Pin / fold | Target |
|------|------------|--------|
| 1 | Flip DualResidual remains false / free true (section 3) | Dual tip |
| 2 | Mirror: `hostResidualShrinkHostElaborateRemains` := **false** | Match DualResidual |
| 3 | Mirror: `hostResidualShrinkHostFreeClaimed` := **true** | Match DualResidual free |
| 4 | Keep `hostResidualShrinkFullHostElaborateRemains` **false** | A66; never re-true on free |
| 5 | Keep `hostResidualShrinkDiagnosticLakeRecipesRemain` **true** | Intentional carve (section 5) |
| 6 | Keep or reword `hostResidualPartialShrinkClaimed` | **Recommendation:** keep **true** as historical Mult-first / foundation partial claim, **and** add free dual-ok that requires free claimed (partial is not exclusive of free). Do **not** set partial false without a separate honesty residual that renames inventory. |
| 7 | Redesign keeps / ready / free-is-not-lake-gone / does-not-mean-host-free | Free-shape (table below) |

### 4.3 Full free-polarity inventory (HostResidualShrink)

Living greps of `!hostResidualShrinkHostFreeClaimed` and
`hostResidualShrinkHostElaborateRemains` (must all invert or rewrite on F1):

| Site (def / theorem / smoke) | Living free polarity | F1 free-shape action |
|------------------------------|----------------------|----------------------|
| pin `hostResidualShrinkHostElaborateRemains` | **true** | **false** (mirror DualResidual) |
| pin `hostResidualShrinkHostFreeClaimed` | **false** | **true** |
| `hostDevelopToolInventoryClosedDualOk` | `!hostResidualShrinkHostFreeClaimed` | Require free claimed **true** (or drop free polarity only if documented; prefer require free true so free/inventory cannot desync). Comment: free does not re-open day-to-day tool list. |
| `hostLibraryBandCompleteDualOk` | `!hostResidualShrinkHostFreeClaimed` | **Mandatory F1 rewrite.** Drop `!free` or require free claimed true under free tip. Comment: free does **not** re-open L-band leftover (seed 206 / leftover empty / mains harness carve stay). Folded into `hostDevelopMeasuredPathsLakeFreeEvidence` and ready -- missing this leaves measured paths false after free flip. |
| `hostResidualShrinkKeepsHostResidual` | remains true **and** !free **and** !FullHost | `!remains` **and** free claimed **and** !FullHost (keep greppable name; comment "keeps dual residual honesty") |
| `hostResidualShrinkReady` | remains true **and** !free (+ inventory) | free-shape keeps **and** `!remains` **and** free claimed **and** diagnostic remain **and** !FullHost (+ inventory after L-band + tool inventory free polarity fixed) |
| `hostResidualShrinkFreeIsNotLakeGone` | ready **and** remains **and** !free | free claimed **and** !remains **and** diagnostic remain **and** !FullHost (host free is not delete-Lake) |
| `hostResidualShrinkDoesNotMeanHostFree` | ready **and** partial **and** !free **and** remains | Rewrite/split: free tip `hostResidualShrinkHostFreeIsHonest` = free **and** !remains; keep local product non-claim bools false |
| theorem `hostResidualShrinkHostElaborateRemains_true` | remains = true | Rewrite to `_false` / remains = false |
| theorem `hostResidualShrinkHostFreeClaimed_false` | free = false | Rewrite to `_true` / free = true |
| theorem `hostResidualShrink_claims_false` | Living conjuncts (all false): local product residual free, product self-host complete, proof complete, llvm unlocked, PROVABLY unlocked, **and** `hostResidualShrinkHostFreeClaimed = false` | On free tip, host free claimed becomes true so this theorem as written fails. **F1:** drop the host-free conjunct from this "local non-claims" theorem (or rename/split); keep the five product/llvm/PROVABLY local non-claims false. Host free polarity remains covered by `hostResidualShrinkHostFreeClaimed_true` / free dual-ok, not by this local non-claims bundle |
| smoke `example : hostResidualShrinkHostElaborateRemains = true` | true | false |
| smoke `example : hostResidualShrinkHostFreeClaimed = false` | false | true |
| FullHost theorem / smoke | false | **Unchanged** |
| freeDesignNotePath | 2026-08-03 design | Optionally dual-cite this 2026-08-07 dual-ok design |

**Order:** rewrite **all** free-polarity conjuncts (including L-band and tool
inventory) first, then prove ready dual-ok. Do not flip free pin alone then
chase red dual-oks one by one without inventory.

### 4.4 Proposed free-shape HostResidualShrink folds (summary)

| Def | Today | After F1 free shape |
|-----|-------|---------------------|
| `hostLibraryBandCompleteDualOk` | !free | free true (or polarity removed); L-band leftover honesty unchanged |
| `hostDevelopToolInventoryClosedDualOk` | !free | free true preferred |
| `hostResidualShrinkKeepsHostResidual` | remains true, free false, !FullHost | !remains, free true, !FullHost |
| `hostResidualShrinkReady` | remains and !free | free-shape keeps + inventory after polarity fixes |
| `hostResidualShrinkFreeIsNotLakeGone` | remains and !free | free and !remains and diagnostic and !FullHost |
| `hostResidualShrinkDoesNotMeanHostFree` | partial not free | free-honest successor; partial may stay true |
| free / remains theorems and smokes | free false / remains true | free true / remains false |
| FullHost theorem | false | **Unchanged** |

### 4.5 Free dual-ok successor summary (one conjunction)

Recommended new greppable bool (name suggestion; implementer may shorten):

```
hostResidualShrinkHostFreeDualOk :=
  hostResidualShrinkFinishedClaimed
  && hostResidualPartialShrinkClaimed
  && !hostResidualShrinkHostElaborateRemains
  && hostResidualShrinkHostFreeClaimed
  && !hostResidualShrinkFullHostElaborateRemains
  && hostResidualShrinkDiagnosticLakeRecipesRemain
  && hostDevelopToolInventoryClosedDualOk   -- after free polarity fix
  && hostLibraryBandCompleteDualOk          -- after free polarity fix (L-band)
  && hostDevelopMeasuredPathsLakeFreeEvidence  -- folds L-band dual-ok
  && hostResidualShrinkInventoryReseeded
  && !hostResidualShrinkBootstrapPrebuildRemains
```

Then `hostResidualShrinkReady` after free should require
`hostResidualShrinkHostFreeDualOk` (or fold the same conjuncts inline). Do **not**
leave ready green under free false after F1.

---

## 5. Diagnostic Lake recipes carve

| Pin | Value after free | Honesty |
|-----|------------------|---------|
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | stays **true** | Claim / diagnostic / llvm-text / product-wire Lake mains may still lake build |
| Day-to-day candidates | stay **empty** | A60 |
| Claim/diagnostic Lake-only class strings | stay greppable | not day-to-day free bar |

**Do not** delete Lake theater as free progress. Host free means day-to-day host
develop under the living bar does not need Lake on the normal step. Lake remains
for:

1. Bootstrap after total wipe (E4 Met-documented; cold lake once when IR/rsp missing)
2. Claim-bool elaborator proof while Lake is host elaborator (`AGENTS.md`)
3. Diagnostic / unit / llvm-text / claim exe recipes
4. Optional emergency full elaborate

F1 dual-ok **requires** diagnostic remain true (or an explicit successor carve with
the same honesty). Setting diagnostic remain false without inventory of recipe
classes would forge "Lake gone."

---

## 6. HostPackageWrite `stillUsesLake` / `dependsOnLake` honesty class

| Pin | Living | Free-bar classification |
|-----|--------|-------------------------|
| `stillUsesLake` | **true** | Bootstrap honesty: peer package-write green bar may still name Lake bootstrap of host exes; without-Lake hot path does not delete Lake |
| `dependsOnLake` | **true** | Same class |
| Product tip StillUsesLake / DependsOnLake | **false** | Orthogonal product path pins; preserve |

**On F1:**

| Option | Verdict |
|--------|---------|
| Flip HostPackageWrite stillUsesLake / dependsOnLake false | **Not required** for host free under default policy; risk of "delete Lake" theater |
| Keep true + document class | **Recommended** |
| Add greppable class label | Optional: `hostPackageWriteLakeHonestyClass := "bootstrap-not-day-to-day"` (or similar short role name) and dual-ok that class string is fixed |

F1 residual Done when should state: HostPackageWrite local Lake pins remain
bootstrap honesty; not day-to-day develop requirement; product Lake pins stay
false. No requirement to mass-edit HostFront/HostGraph stillUsesLake in the same
slice unless greps force lockstep (prefer leave local Host* honesty true).

---

## 7. Surface-matrix Host residual free row (target wording for F1)

Living row (abbreviated): status **open**; DualResidual remains true; free bar
inventory 2026-08-03 prose lags A66 in places.

**Target after F1 lockstep:**

| Column | Target wording |
|--------|----------------|
| Status | **measured** (or **claimed** if matrix vocabulary uses claimed for DualResidual free -- prefer **measured** if free has lake proof + greppable pins, matching product free / PROVABLY style) |
| Evidence | DualResidual `hostElaboratorResidualRemains` **false**; `hostElaboratorResidualFreeClaimed` **true**; HostResidualShrink free dual-ok; FullHostElaborateRemains **false**; lake elaborator proof on flip; free dual-ok design cite `doc/dev/research/host-free-dual-ok-design-2026-08-07.md`; free bar inventory 2026-08-07 |
| Non-claims in row | Not product residual free re-open; not full Lean 4 / mathlib elaborator parity; not delete Lake; not proof complete; not full llvm backend; Mult..Compose foundation only already met before free |

Also reseed living claim tip bullets in `surface-matrix.md` that still say host
elaborator residual **remains** without free claimed.

Optional F1: SurfaceMatrix.lean canary row if one exists for host residual free;
only if a greppable row is already in package -- do not invent matrix theater.

---

## 8. Ordered lake proof sequence on flip (F1)

AGENTS claim-bool rule: while Lake is host elaborator, claim flips need **lake
build** (and claim exe when one exists). Grep dual-pin alone is not full GREEN.

### 8.1 Surgical edit order (implementer)

1. **Read** this design + living inventory; confirm checklist 1-5 at living bar
   still met (F0 inventory).
2. **DualResidual.lean** -- flip remains false / free claimed true; rewrite
   surfacesDistinct / ready / doesNotForgeHostFree free polarity; **dual-update**
   `dualResidualSurfaceOk` and `dualResidualSurfacesDistinct` host token equalities
   if token reseeds (section 3.4); keep all product measure/complete ready
   conjuncts (section 3.3); update header comments. Surgical in-place only (no
   `/tmp` full-file rebuild).
3. **DualResidualTheorems.lean** -- rewrite theorems/smokes to free shape
   (`_false` remains, free true, ready true under new folds).
4. **HostResidualShrink.lean** -- mirror remains/free pins; rewrite **all** free-
   polarity sites from section 4.3 inventory first (including
   `hostLibraryBandCompleteDualOk` and `hostDevelopToolInventoryClosedDualOk`);
   then keeps / ready / free-is-not-lake-gone / does-not-mean-host-free;
   keep FullHost false and diagnostic remain true; optional
   `hostResidualShrinkHostFreeDualOk`.
5. **HostPackageWrite.lean** -- docs/comments only unless a class string is added;
   keep stillUsesLake/dependsOnLake true (bootstrap class).
6. **just modules (mandatory free-tip invert)** -- rewrite forge-ban greps that
   hard-fail free tip:
   - `just/host.just` recipe `host-residual-shrink`: DualResidual remains true /
     free false greps; forge ban remains false; shrink free claimed false greps
     and forge ban free true; banner "free false"
   - `just/subset-join.just` recipe `lake-retire-inventory` (and any sibling that
     greps DualResidual remains true / forge ban remains false): invert to free
     tip (remains false required; ban remains true; product free still true)
7. **Pure Nix presence (mandatory free-shape update)** -- surgical free-shape
   strings (HITL stage by human; agents never `git add`):
   - `nix/systems-host-presence/host-specs-hold-close.nix` DualResidual block:
     pin defs true/false, ready conjuncts `&& hostElaboratorResidualRemains` /
     `&& !hostElaboratorResidualFreeClaimed`, theorem names
     `hostElaboratorResidualRemains_true`, token string
     `"host elaborator residual remains"`, comments "host free not forged"
   - same file DualResidualTheorems block: theorem/smoke free-false / remains-true
   - `nix/systems-host-presence/host-specs-compile-path-3.nix` HostResidualShrink
     block: `def hostResidualShrinkHostElaborateRemains : Bool := true`,
     `def hostResidualShrinkHostFreeClaimed : Bool := false`,
     theorem `hostResidualShrinkHostFreeClaimed_false` /
     `hostResidualShrinkHostElaborateRemains_true`
   Expected free-shape strings (sketch): remains def false; free claimed def true;
   ready conjuncts `&& !hostElaboratorResidualRemains` and
   `&& hostElaboratorResidualFreeClaimed`; theorem remains_false / free_true;
   shrink free true / remains false defs and theorem names.
8. **surface-matrix.md** -- Host residual free row + living tip (section 7).
9. **Residual lockstep** -- RESIDUAL-systems Done + Open; RESIDUAL join;
   WATCHER; SESSION-HANDOFF; plan living tip F1 done.

### 8.2 Ordered commands (proof)

Run in order; stop on first non-zero. Log command + exit in F1 summary.

```bash
cd /home/hunter/Projects/ai/iso

# 1) After DualResidual edits
lake build SystemsLean.DualResidual
lake build SystemsLean.DualResidualTheorems

# 2) After HostResidualShrink edits
lake build SystemsLean.HostResidualShrink
# if HostResidualShrinkTheorems role module exists and was edited:
# lake build SystemsLean.HostResidualShrinkTheorems

# 3) Inventory recipe under free tip (after just/host.just invert)
just host-residual-shrink

# 4) Pure Nix host presence under free tip (after host-specs free-shape update)
just systems-host

# 5) lake-retire-inventory if DualResidual remains greps live there
#    (after just/subset-join.just invert); product free still true
just lake-retire-inventory

# 6) Pin greps (post-F1 expected values)
rg -n "hostElaboratorResidualRemains|hostElaboratorResidualFreeClaimed" \
  src/systems/SystemsLean/DualResidual.lean
# expect: remains := false; freeClaimed := true

rg -n "hostResidualShrinkHostElaborateRemains|hostResidualShrinkHostFreeClaimed|hostResidualShrinkFullHostElaborateRemains" \
  src/systems/SystemsLean/HostResidualShrink.lean
# expect: remains false; free true; FullHost false

# 7) Product pins unchanged (sanity)
rg -n "residualFreeClaimed|productResidualRemains" \
  src/systems/SystemsLean/DualResidual.lean
# expect: residualFreeClaimed true; productResidualRemains false

# 8) Hygiene
just hygiene
```

Optional if HostPackageWrite comments/class string touched:

```bash
lake build SystemsLean.HostPackageWrite
```

**Mandatory GREEN for F1 claim flip:** lake builds above **and**
`just host-residual-shrink` **and** `just systems-host` under free tip. Greps
alone are not GREEN. `just lake-retire-inventory` if that recipe still greps
DualResidual remains (invert first).

### 8.3 BLOCKED conditions for F1

| Condition | Action |
|-----------|--------|
| lake missing on PATH | BLOCKED: lake missing; residual not closed |
| Ready still requires remains true after edit | Incomplete redesign; fix folds before GREEN |
| L-band / tool inventory dual-ok still require !free after free flip | Incomplete free-polarity inventory (section 4.3); fix before ready |
| pure Nix host-specs still require remains true / free false | Update host-specs-hold-close + compile-path-3 free-shape; HITL stage |
| just host-residual-shrink / subset-join forge bans still free-false | Invert just modules (section 8.1 step 6) |
| FullHost re-trued | Forbidden; stop and fix |
| Product free flipped false | Forbidden; stop and fix |
| Diagnostic Lake remain forged false without carve inventory | Forbidden |
| Design note missing | Complete design first (this note) |

---

## 9. Checklist acceptance for opening F1

From living inventory F0 (section-2 + section-4) under choice (a):

| Item | Status for F1 open |
|------|--------------------|
| Plan section-2 items 1-5 | Met at living bar (item 3 = E5a default) |
| Section-4 requirements 1-3, 6 | Met / PARTIAL classified (HostPackageWrite bootstrap class OK) |
| Section-4 requirement 4-5, 7 | Open until F1 implements this design + lake + lockstep |
| Dual-ok design (this note) | **Done when F0b residual closes** |
| Operator Rank-3 check-depth | Not required (E5a default); only if operator rejects |

**No hard open operator decision** is required to open F1 after this design:
defaults already choose (a) full host develop, E5a check depth, diagnostic Lake
remain, HostPackageWrite bootstrap honesty keep-true.

---

## 10. Ordered F1 implement steps (agent checklist)

1. Open residual Name **DualResidual free claim** (or plan F1 Host residual free
   claim) with Done when = free dual-ok from this note + lake exit 0 + systems-host
   + host-residual-shrink + surface-matrix + residual lockstep.
2. Surgical DualResidual free-shape folds (section 3) including surfaceOk +
   surfacesDistinct token dual-update and full product ready conjuncts.
3. Surgical DualResidualTheorems rewrite (section 3.5).
4. Surgical HostResidualShrink free dual-ok: all free-polarity sites in section 4.3
   first (including hostLibraryBandCompleteDualOk), then ready.
5. HostPackageWrite honesty comments/class only (section 6).
6. Mandatory just invert: `just/host.just` host-residual-shrink; `just/subset-join.just`
   DualResidual remains forge bans on lake-retire-inventory.
7. Mandatory pure Nix free-shape: host-specs-hold-close.nix DualResidual + Theorems;
   host-specs-compile-path-3.nix HostResidualShrink free/remains defs and theorems.
8. surface-matrix Host residual free row (section 7).
9. Lake proof sequence (section 8.2) -- mandatory including `just systems-host`.
10. Residual / WATCHER / handoff / plan living tip F1 done (HITL stage pure Nix).
11. `just hygiene` green.
12. Confirm free **flipped** only on DualResidual/HostResidualShrink free pins;
    product free/complete/PROVABLY and FullHost false preserved.

---

## 11. Non-claims (this design slice)

- Does **not** flip DualResidual free or remains
- Does **not** flip HostResidualShrink free or remains
- Does **not** re-true FullHostElaborateRemains
- Does **not** re-open product free / complete / PROVABLY
- Does **not** delete Lake or diagnostic recipes
- Does **not** invent full elaborator / mathlib slogans
- Does **not** expand seed/*Main theater
- Does **not** implement F1 Lean free flip (design only)

---

## 12. Recommended next residual

**Name:** DualResidual free claim (plan Phase F **F1** / Host residual free claim)

| Field | Content |
|-------|---------|
| **Goal** | Flip host elaborator residual remains false and free claimed true with dual-ok redesign from this note |
| **Done when** | DualResidual + HostResidualShrink free dual-ok per sections 3-4 (all free-polarity sites including hostLibraryBandCompleteDualOk); surfaceOk+surfacesDistinct token dual-update; FullHost stays false; diagnostic Lake remain true; HostPackageWrite bootstrap class honest; surface-matrix Host residual free measured/claimed; lake build DualResidual (+ Theorems) + HostResidualShrink exit 0; `just host-residual-shrink` green under free tip; pure Nix free-shape in host-specs-hold-close + host-specs-compile-path-3 + green `just systems-host`; just/host.just + just/subset-join.just free-tip invert; residual lockstep; product free/complete/PROVABLY and product Lake pins unchanged; `just hygiene` green |
| **Out of scope** | Re-true FullHost; product free re-open; delete Lake theater; Rank-3 invent; seed/*Main theater; proof complete forge |
| **Primary paths** | DualResidual.lean; DualResidualTheorems.lean; HostResidualShrink.lean; surface-matrix.md; residual; WATCHER; `just/host.just` (host-residual-shrink); `just/subset-join.just` (lake-retire-inventory DualResidual greps); `nix/systems-host-presence/host-specs-hold-close.nix`; `nix/systems-host-presence/host-specs-compile-path-3.nix`; HostPackageWrite comments only |
| **Gates** | lake builds (section 8.2); `just host-residual-shrink`; `just systems-host`; pin greps free true / remains false / FullHost false; `just hygiene` |

---

## 13. Pointers

| Artifact | Role |
|----------|------|
| This note | Dual-ok fold redesign SSoT for F1 |
| `host-residual-free-bar-inventory-2026-08-07.md` | Living gap vs section 2/4 after A66 |
| `host-residual-free-design-2026-08-03.md` section 4 | Free bar requirements 1-7 |
| DualResidual / DualResidualTheorems | Claim pins + ready folds + theorems |
| HostResidualShrink | Free dual-ok successor + FullHost false + diagnostic carve |
| HostPackageWrite | stillUsesLake / dependsOnLake bootstrap class |
| surface-matrix.md | Host residual free row lockstep on F1 |
| plan-slake-replaces-lake.md Phase F | F0 done; F0b this design; F1 free claim |
| AGENTS.md claim-bool lake proof | Lake on PATH required for F1 GREEN |
