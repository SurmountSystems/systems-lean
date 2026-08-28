# Report: B2 unblock paths -- cold-elaborate day-to-day retirement evidence (2026-08-07)

ASCII only. Explore-only. No product code. No pin flips.

**Goal:** Concrete inventory of **how** to produce "cold-elaborate day-to-day
retirement evidence" so Phase B2 can set `FullHostElaborateRemains` false
honestly (not forge).

**Sources:**
`.agents/reports/b2-evidence-criteria-2026-08-07.md`;
`src/systems/SystemsLean/HostResidualShrink.lean`;
`src/systems/SystemsLean/LakeRetireInventory.lean`;
`.agents/plans/plan-slake-replaces-lake.md` (section 2 host finish checklist +
section 5 Immediate next); `RESIDUAL-systems.md` Open
`FullHostElaborateRemains false`; `just/host.just`, `just/host-without-lake.just`,
`just/host-tool-expand.just`, `just/dual-side.just`, product-wire without-lake;
`.agents/joins/a60-develop-tool-inventory-closed.md`;
`.agents/reports/impl-a62-checkable-inventory-2026-08-07.md`;
`doc/dev/research/host-residual-free-design-2026-08-03.md` (operator choice a).

---

## A) What does the pin mean in plain English?

**Pin:** `hostResidualShrinkFullHostElaborateRemains` in
`src/systems/SystemsLean/HostResidualShrink.lean` is **`true`**.

**Plain English:** Classic Lake is still required to **fully elaborate the
SystemsLean host library** under `src/systems/` at least once after a total
`.lake` wipe (cold full package elaborate). Peer fragment tools and without-Lake
hot paths do **not** replace that job. A8 only retired **peer bin prebuild**
via `leanc` when IR objects and link rsp already exist; it did **not** retire
library elaborate.

Related living pins (same file / DualResidual; do not conflate):

| Pin | Value | Meaning |
|-----|-------|---------|
| `hostResidualShrinkFullHostElaborateRemains` | **true** | Cold full SystemsLean elaborate still needs Lake |
| `hostResidualShrinkBootstrapPrebuildRemains` | **false** (A8) | Foundation tool ELFs can relink with leanc without `lake build` when IR exists |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** | Diagnostic / unit recipes may still call lake |
| `hostResidualShrinkHostElaborateRemains` | **true** | Host elaborator residual remains (DualResidual program) |
| `hostResidualShrinkHostFreeClaimed` | **false** | Host free not claimed |
| DualResidual free claimed | **false** | Phase F / A-last; **not** B2 |

**B2 is not DualResidual free.** Free requires the full layer-1 checklist
(plan section 2 items 1-6). B2 is only checklist item 5 honesty: cold full
`lake build` is bootstrap / emergency / claim-proof only, not the normal
day-to-day develop loop.

Operator free-checklist choice (already recorded): **(a)** full host develop --
retire cold full elaborate from day-to-day. Not "stop at six units."

---

## B) What evidence would make the pin false honestly?

B2 Done when (residual + plan section 5.1) needs **retirement evidence**, then
pin false dual-ok, residual honesty, DualResidual free still false, product
claim pins unchanged, `just hygiene` green.

### Measurable claims checklist (all must hold before pin false)

Write and dual-pin each claim. Forging the bool without this list fails honesty
gates (`just host-residual-shrink` currently **requires** the pin **true**).

| # | Measurable claim | How to check |
|---|------------------|--------------|
| **E1** | **Day-to-day host develop recipe set is named** (roots load, import graph, module check, package write, foundation tools, develop tools, product wire hot path) | Greppable inventory in research note + optional HostResidualShrink strings; every recipe listed exists under `just/` |
| **E2** | **Every day-to-day recipe is GREEN without invoking cold full `lake build` of the library on that step** | Run matrix: `host-package-roots-without-lake`, `host-import-graph-without-lake`, `host-module-check-without-lake`, host package-write without-lake, `host-foundation-tools-clean-bootstrap`, `host-develop-tools-clean-bootstrap` + each `*-without-lake` for owned tools, `just build` / product-wire without-lake paths; no step runs `lake build` of full package as the hot path |
| **E3** | **Cold full `lake build` under `src/systems/` is classified only as** bootstrap-after-total-wipe / emergency / claim-proof (AGENTS claim-bool lake-on-PATH) / optional diagnostic | Written table maps each remaining `lake` use to one class; no class is "normal edit-check loop" |
| **E4** | **After IR exists, total-wipe recovery is documented:** one classic Lake library elaborate (or a named Slake substitute at residual bar), then clean-bootstrap + without-Lake day-to-day | Scripted or operator-run sequence with exit codes; not vibes |
| **E5** | **Honesty bar for "check" is explicit:** today seed is PARTIAL-STRUCTURAL + Mult..Extract FOUNDATION-KIND-SURFACE -- **not** full Lean 4 body typecheck. Either (5a) residual accepts that structural check **is** day-to-day check under choice (a) for B2 only, **or** (5b) a named deepen band raises HostModuleCheck so "check bodies" is closer to real elaborate before B2 | Cite HostModuleCheck depth pins; do not sell PARTIAL-STRUCTURAL as full elaborator |
| **E6** | **Claim / diagnostic / *Main / harness stay out of day-to-day bar** with greppable honesty (A59/A60 already) | `claim-exes+llvm-text-writers+product-wire-Lake-mains`; `*Main lake exe entrypoints`; harness carve-out; DualResidual free false |
| **E7** | **Pin dual-ok false only after E1-E6:** flip `hostResidualShrinkFullHostElaborateRemains` to false; update `hostDevelopToolInventoryClosedDualOk` / residual-shrink greps that currently **force true**; DualResidual free **false**; free/complete/PROVABLY and product Lake pins unchanged; `just hygiene` + `just host-residual-shrink` green | Product Lean + just gate edit in the B2 implement slice, not earlier |

**What does *not* alone satisfy B2:**

- A60 day-to-day tool list empty (B1 only)
- Seed modules=206 PARTIAL-STRUCTURAL
- Product StillUsesLake / DependsOnLake false (product wire, not host elaborate)
- Further seed expand or *Main theater
- DualResidual free flip

---

## C) What already exists?

| Surface | Status | Why it is not B2 alone |
|---------|--------|------------------------|
| **A60 Develop tool inventory closed** | Day-to-day lean_exe candidates **`empty`**; claim/diagnostic Lake-only explicit; `hostDevelopToolInventoryClosedDualOk` | Tools owned or carved out; **library cold elaborate still remains** (pin true by design) |
| **A8 Foundation tools without Lake bootstrap** | `host-foundation-tools-clean-bootstrap`; `BootstrapPrebuildRemains` **false**; six tools: fragment-check, graph, package-write, package-roots, import-graph, module-check | Relink when IR exists; wipe still needs Lake elaborate once |
| **A9..A10+++ Develop tools without Lake** | host-front, subset-front, front-mult-package, mult-subset-rebuild, first-surface + `host-develop-tools-clean-bootstrap` | Same IR prerequisite; not full package elaborate |
| **A3-A5 / expand** | `host-package-roots-without-lake`, `host-import-graph-without-lake`, `host-module-check-without-lake` | Measured day-to-day **structural** path on seed |
| **Seed 206 PARTIAL-STRUCTURAL (A55/L44)** | `measuredHostLibraryProductSeedCount = "206"`; leftover product modules **empty** | Coverage of modules, not full typecheck |
| **FOUNDATION-KIND-SURFACE Mult..Extract (A56..A58)** | Depth deepen dual-ok | Structures/axioms + theorem corpus counts on foundation units only |
| **L-band complete (A59)** | leftover empty; *Main 59 + harness 5 out-of-scope; partition `seed=206+Main=59+harness=5` | Inventory close, not elaborate retirement |
| **Product wire without Lake** | `just build` / `freestanding-capable-regenerate-without-lake` / product-wire write; LakeRetireInventory product pins **false** | Orthogonal M6 product path; `lakeRetireHostElaborateRemains` still **true** |
| **Package write Mult..Compose without Lake** | dual-oks true on host package-write without-lake | Foundation package surface, not full SystemsLean elaborate |
| **A61 / A62** | Criteria report + gates + still-blocked reconfirm | Documented gap; **no** retirement evidence; pin still true |
| **systems-lake** | Optional `just systems-lake` -> lake under `src/systems` | Still the cold full elaborate entry; honesty class bootstrap/claim |

**Bottom line:** peer **hot paths** and **product wire** can run without Lake on
the measured step. **Cold full library elaborate** is still the recovery and
claim-proof elaborator. That is why FullHostElaborateRemains stays true.

---

## D) What is still Lake-only for day-to-day develop?

"Day-to-day" here means normal host develop under choice (a): load, import,
check, build tools. Partition by honesty class (A60 + residual).

### Still requires classic Lake (or Lake-built IR) for host library

| Job | Reality today | Class |
|-----|---------------|-------|
| **Cold full package elaborate** after total wipe | `(cd src/systems && lake build)` / `just systems-lake` | Bootstrap / emergency -- **blocks B2 until reclassified with evidence** |
| **Produce `.lake/build/ir` + rsp** for foundation/develop tools | Clean-bootstrap messages: if IR missing, `lake build <tool>` once | Bootstrap prerequisite for leanc relink |
| **Full elaborator typecheck of module bodies** | HostModuleCheck is PARTIAL-STRUCTURAL (+ foundation kind-surface band); not Lean 4 elaborator | Capacity gap vs checklist item 3 |
| **Claim-bool flips while Lake is host elaborator** | AGENTS: lake on PATH for claim proof | Claim-proof (allowed to remain after B2) |
| **Diagnostic / unit lake recipes** | `DiagnosticLakeRecipesRemain` true | Diagnostic (allowed) |
| **Claim freestanding / perform / ownership / self-host exes** | A60 compact `claim-capable-perform-self-host+llvm-text-writers` | Claim-proof Lake-only |
| **llvm-*-text writers** | Same compact class | Diagnostic / deferred track |
| **Product-wire / subset emit-rebuild / fs-write Lake mains outside owned set** | Honesty `claim-exes+llvm-text-writers+product-wire-Lake-mains` | Outside day-to-day develop bar when hot path uses without-Lake duals |
| **\*Main (59) lake exe entrypoints** | L-band out-of-scope | Not product library seed; Lake-built bins |
| **Host harness (5)** | HostImportGraph, HostModuleCheck*, HostResidualShrink | Drive without-Lake checks; not seed body |

### Already without-Lake on hot path (when prebuilt IR/ELF exists)

Roots, import-graph, module-check, package-write Mult..Compose, foundation six
clean-bootstrap, develop five clean-bootstrap + without-lake recipes, product
wire regenerate/write, mult-subset-rebuild without-lake, subset package join
without-lake.

**Gap for B2:** operators still need cold full Lake for **library** recovery
and for any develop loop that treats "real elaborate" as Lake. Tool inventory
empty does not close that gap.

---

## E) Concrete agent-doable evidence slices (ranked)

Do **not** flip FullHostElaborateRemains in these slices. Do **not** flip
DualResidual free. Do **not** re-open seed/*Main/B1 theater as primary treadmill.
Operator must **open** a Name (or supply full retirement evidence) before
auto-run implements; A62 inventory: agent-doable Open is **no** until then.

### Slice 1 -- Cold elaborate day-to-day use map (recommended first)

| Field | Content |
|-------|---------|
| **Name** | Cold elaborate day-to-day use map |
| **Goal** | Produce written, checkable retirement **protocol evidence**: partition every measured host develop just recipe into day-to-day without-Lake / clean-bootstrap / wipe-bootstrap Lake / claim-proof / diagnostic, with explicit B2 accept criteria -- without flipping FullHostElaborateRemains or DualResidual free |
| **Done when** | Research note under `doc/dev/research/cold-elaborate-day-to-day-use-map-YYYY-MM-DD.md` lists (1) every measured without-Lake host develop recipe already green (roots, import-graph, module-check, package-write, foundation+develop tools, product wire cites); (2) every remaining Lake-using step with class bootstrap-wipe / claim-proof / diagnostic / (none day-to-day); (3) explicit accept criteria for future B2 pin false (E1-E7 above, shortened); (4) HostResidualShrink FullHostElaborateRemains still **true** dual-ok; DualResidual free **false**; residual Open still names B2 held or points next; short join under `.agents/joins/`; `just hygiene` green |
| **Out of scope** | Flip FullHostElaborateRemains; DualResidual free; host free; delete Lake; invent full elaborator slogans; re-open seed expand theater; claim-bool product flips |
| **Primary paths** | `doc/dev/research/cold-elaborate-day-to-day-use-map-*.md`; optional honesty strings in HostResidualShrink **without** pin false; residual / WATCHER / handoff honesty only; cite `just/host.just`, `just/host-without-lake.just`, `just/host-tool-expand.just`, `just/dual-side.just` |
| **Gates** | `just hygiene`; optional `just host-residual-shrink` still GREEN with pin true; no lake claim-flip required |

### Slice 2 -- Wipe recovery bootstrap script evidence

| Field | Content |
|-------|---------|
| **Name** | Wipe recovery bootstrap evidence |
| **Goal** | Measure and document the recovery sequence after a missing-IR / clean tree so cold full Lake is explicitly one-shot bootstrap, then day-to-day returns to without-Lake recipes |
| **Done when** | Research note (or extend Slice 1 note) records: (1) ordered steps -- cold `lake build` (or named package subset) once when IR/rsp missing; (2) `just host-foundation-tools-clean-bootstrap` + `just host-develop-tools-clean-bootstrap` GREEN without lake on those steps; (3) without-Lake matrix GREEN (roots, import-graph, module-check, at least one develop tool, product wire path); (4) residual honesty: FullHostElaborateRemains **true** until B2 flip slice; DualResidual free false; join; `just hygiene` green |
| **Out of scope** | Pin false; DualResidual free; deleting `.lake` in CI as a forge; full elaborator parity slogans |
| **Primary paths** | research note; optional thin just recipe that only **documents**/prints the sequence (no new shell mill algorithm); residual honesty |
| **Gates** | Documented exit 0 on without-Lake matrix after bootstrap; `just hygiene` |

### Slice 3 -- Named check-depth capacity (bounded band)

| Field | Content |
|-------|---------|
| **Name** | Check depth toward real elaborate (named band) |
| **Goal** | Raise HostModuleCheck honesty toward body elaborate on a **bounded** module band so checklist item 3 supports choice (a) without claiming DualResidual free |
| **Done when** | Named band (operator picks modules or next foundation/units past Mult..Extract); HostModuleCheck deepen dual-ok at new bar; seed count honest (206 or expanded only if operator allows); FullHostElaborateRemains **true**; DualResidual free **false**; free/complete/PROVABLY and product Lake pins unchanged; residual join; lake build HostModuleCheck path + without-lake module-check GREEN; `just hygiene` green |
| **Out of scope** | B2 pin false by itself; DualResidual free; *Main seed theater; full mathlib elaborator |
| **Primary paths** | `HostModuleCheck*.lean`, fixtures, HostResidualShrink depth pins only if needed, residual |
| **Gates** | `just host-module-check-without-lake` (and lake build when claim/module requires); `just hygiene` |

### Slice 4 -- B2 pin dual-ok implement (only after E1-E6 evidence exists)

| Field | Content |
|-------|---------|
| **Name** | FullHostElaborateRemains false |
| **Goal** | Land pin false with dual-ok and residual honesty using **already written** cold-elaborate day-to-day retirement evidence |
| **Done when** | Written evidence (Slices 1-2 minimum; 3 if required by operator accept criteria) lands and is cited; `hostResidualShrinkFullHostElaborateRemains := false`; residual-shrink greps no longer force true; DualResidual free **false**; product pins unchanged; `just host-residual-shrink` GREEN; `just hygiene` green; residual Open closed or next free checklist; WATCHER updated |
| **Out of scope** | Forging without evidence; DualResidual free; delete Lake binary theater |
| **Primary paths** | `HostResidualShrink.lean`, `just/host.just` residual-shrink greps, pure Nix host presence if dual-pinned, residual, plan, WATCHER, handoff |
| **Gates** | lake build HostResidualShrink if claim flip policy; `just host-residual-shrink`; `just hygiene` |

---

## F) Recommended first slice (maximally unblocks parallel work later)

**Open and implement Slice 1: Cold elaborate day-to-day use map** first.

**Why first:**

1. **Unblocks definition of done.** B2 is blocked on "evidence" without a
   greppable accept list. Slice 1 turns E1-E7 into a written dual-checkable
   protocol so later implementers do not re-argue what "day-to-day" means.
2. **Parallelizes later work.** After the map exists, Slice 2 (wipe recovery
   measurement) and Slice 3 (check-depth) can fan out as **disjoint** paths
   (docs+matrix vs HostModuleCheck), both keeping the pin true.
3. **No forge risk.** Docs + honesty only; residual-shrink stays GREEN with pin
   true; product wire untouched.
4. **Avoids closed treadmills.** Does not re-open seed 206 / L-band / B1 tool
   inventory as primary residual.

**After Slice 1:**

| If map shows... | Next |
|-----------------|------|
| Day-to-day set already fully without-Lake on hot path; only wipe + claim + diagnostic use Lake | Slice 2 measure wipe recovery, then Slice 4 B2 pin false with residual honesty (operator OK) |
| Day-to-day still needs deeper "real check" under choice (a) | Slice 3 capacity deepen first, then re-run accept criteria, then Slice 4 |
| Operator supplies full retirement evidence in chat | Skip to Slice 4 with that evidence dual-pinned on disk same turn |

**Do not** start DualResidual free (F1) until B2 + full free checklist.

---

## Recipe quick map (agents / operators)

| Recipe / surface | Without-Lake hot path? | B2 role |
|------------------|------------------------|---------|
| `just host-package-roots-without-lake` | Yes | Day-to-day E2 |
| `just host-import-graph-without-lake` | Yes | Day-to-day E2 (seed 206) |
| `just host-module-check-without-lake` | Yes structural | Day-to-day E2; depth honesty E5 |
| `just host-foundation-tools-clean-bootstrap` | Yes (needs IR) | Day-to-day tools; wipe needs Lake first |
| `just host-develop-tools-clean-bootstrap` + `*-without-lake` | Yes (needs IR) | Day-to-day tools |
| `just build` / freestanding without-lake | Yes product | Preserve; not host elaborate free |
| `just systems-lake` / cold `lake build` under `src/systems` | No | Bootstrap / claim-proof until B2 evidence reclassifies |
| Claim / diagnostic / *Main lake exes | Lake | Out of day-to-day bar (A59/A60) |
| `just host-residual-shrink` | Greps pins | Must stay pin true until Slice 4 |

---

## Bottom line

| Question | Answer |
|----------|--------|
| Pin meaning | Full SystemsLean library elaborate still needs classic Lake (cold / after wipe); peer without-Lake paths do not replace it |
| Honest false | Written day-to-day vs bootstrap/claim/diagnostic partition + green without-Lake matrix + dual-ok false + residual honesty; free stays false |
| Exists today | Tools empty (A60), foundation/develop without-Lake, seed 206 PARTIAL-STRUCTURAL, product wire without Lake -- **not** cold-elaborate retirement |
| Still Lake | Cold package elaborate, IR recovery, claim exes, diagnostic, *Main, full body typecheck gap |
| First slice | **Cold elaborate day-to-day use map** (protocol evidence; pin stays true) |
| WATCHER | Stay **BLOCKED** until operator opens a slice or supplies full evidence; no auto pin forge |

**Related:** `.agents/reports/b2-evidence-criteria-2026-08-07.md` (Done when +
blocked posture); `.agents/joins/a60-develop-tool-inventory-closed.md` (B1);
`.agents/joins/a62-b2-still-blocked-reconfirm.md` (no agent-doable Open yet).
