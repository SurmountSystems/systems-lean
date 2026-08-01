# M6 Lake retire design (bootstrap S4)

Kind: analysis only. Not residual flip. Not product claim. Not implement.
ASCII only. Date: 2026-08-01.

Living tip at design time:

| What | Status |
|------|--------|
| Claim B complete | true |
| Claim A free | true |
| StillUsesLake / DependsOnLake | true (product path; must stay true until M6 implement with elaborator proof) |
| Mult S0-S3 under Lake (M0) | done |
| M1 unit surfaces (Linear..Compose emit/rebuild) | done |
| M2 Mult without-Lake (Name A + Name B full Path A) | done (freestandingDriverComplete true; product Lake remains) |
| M3 subset language front-end | done (SubsetFront / just subset-front) |
| M4 product-wire without-Lake (Name A/B/C) | done (just build without lake on hot path; product Lake remains) |
| M5 compiler packages self-application (Name A/B/C) | done (join + front Mult + without-Lake multi-unit) |
| S4 / M6 Lake retire | **design only here** |
| Step 4 PROVABLY / LLVM | held |

Plan: `.agents/plans/plan-residual-free-freestanding.md` ideal ladder **M6**
(= bootstrap **S4**). Related cites:

- `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md` (product hot path without lake; StillUsesLake true until M6)
- `doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md` (compiler package join; StillUsesLake true until M6)
- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` (measured step without Lake vs product pins)
- `doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md` (cold Lake wall vs product just build)
- Host: `SelfHostComplete.lean` (`productPathOfficialPathStillUsesLake`),
  `DualResidual.lean` (`hostElaboratorResidualRemains`, `residualFreeClaimed`),
  per-module `stillUsesLake` / `dependsOnLake` on M2-M5 surfaces
- Self-host map: `src/systems/self-host.md` Bootstrap S0-S4 / ideal ladder
- Process: root `justfile` (`build`, without-lake recipes, lake diagnostic recipes)
- Policy: `AGENTS.md` claim-bool flips need host elaborator proof while bootstrapping;
  Lake is one-time bootstrap elaborator, not freestanding end state

---

## 1. Why M6 (gap after M0-M5)

Ideal ladder goal is **M0-M6**, not M0-M5. M0-M5 closed measured freestanding
**product** and **compiler package** surfaces without Lake on many hot paths,
while product pins `StillUsesLake` / `DependsOnLake` stayed **true**.

| Closed before M6 | Still open for M6 |
|------------------|-------------------|
| Official `just build` without lake on hot path (M4 Name C) | Product pins still claim Lake remains |
| Mult without-Lake rebuild + freestanding Mult writer (M2) | Host elaborator still Lake (expected during bootstrap) |
| Product-wire prebuilt + host-cc writer (M4 Name A/B) | Bootstrap prebuild of Lake exes still required once |
| Multi-unit package join without lake on hot path (M5 Name C) | Diagnostic / claim / unit-surface recipes still `lake build`/`lake exe` |
| Claim A free true; DualResidual host residual remains true | Free is **not** "Lake is gone" -- that gap is M6's job to close honestly |
| Claim B complete true | Complete is **not** Lake retire |

**False park after M5:** empty Open / DONE-FOR-NOW because a plan line said
"do not auto-start S4/M6" is **not** "product finished." Ideal ladder Remaining
is **M6**. Operator correction (2026-08-01): open M6 design then implement;
"only deferred S4" is not freestanding ladder finished. Still never forge
StillUsesLake false without elaborator proof.

**Plan M6 success shape:** product path `DependsOnLake` / `StillUsesLake`
**false** with **real elaborator proof**, dual residual honesty, residual
measure lockstep, no free/complete/PROVABLY/llvm forge.

M6 does **not** mean: inventing mathlib; hand product C; Step 4 PROVABLY/llvm;
re-opening free/complete; selling free as Lake gone without pin flips.

---

## 2. Inventory: what still requires Lake today

### 2.1 Product path measured hot paths (already Lake-free)

These are **measured** product/compiler steps that do **not** invoke
`lake build` / `lake exe` / `lake env` on the hot path. Prebuilts or host-cc
binaries may have been Lake-built once (bootstrap).

| Recipe / path | Role | Local finished pin (examples) |
|---------------|------|-------------------------------|
| `just build` | Official freestanding wire (M4 Name C) | prefers Name B else Name A |
| `just product-wire-freestanding-write` | Host-cc product-wire writer (M4 Name B) | `productWireFsWriterFinishedClaimed` |
| `just freestanding-capable-regenerate-without-lake` | Prebuilt CapableRegenerate (M4 Name A) | `productWireWithoutLakeFinishedClaimed` |
| `just mult-subset-rebuild-without-lake` | Prebuilt Mult rebuild (M2 Name A) | `multSubsetRebuildWithoutLakeFinishedClaimed` |
| `just mult-subset-freestanding-write` | Host-cc Mult package writer (M2 Name B full) | `freestandingDriverComplete` |
| `just mult-subset-freestanding-deepen` | Mult surface dual greps | `freestandingDeepenPartial` |
| `just subset-packages-rebuild-join-without-lake` | Prebuilt Mult..Compose rebuild join (M5 Name C) | `subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed` |
| B26..B30 style Lake-free greps / install pieces | Capable read/compose/write substrate; ownership WithoutLake | ownership WithoutLake true; not product pin retire |

**Host-cc binaries outside `.lake` (examples):**
`src/systems/bin/slake-mult-fs-write-cc`,
`src/systems/bin/slake-product-wire-fs-write-cc`.

**Prebuilt Lake ELFs used without lake on hot path (examples):**
`.lake/build/bin/slake-mult-subset-rebuild`,
`.lake/build/bin/slake-freestanding-capable-regenerate`,
`.lake/build/bin/slake-*-subset-rebuild` (M5 Name C join).

**Important:** Lake-free **hot path** is not the same as product
`StillUsesLake` false. Pins stay true until M6 implement with proof.

### 2.2 What still requires Lake (host / bootstrap / diagnostic)

| Category | What | Why Lake |
|----------|------|----------|
| **Host elaborate** | Entire `SystemsLean` package under `src/systems/` | Classic Lean Lake elaborates host sources during bootstrap |
| **Bootstrap prebuild** | `lake build` of subset emit/rebuild exes, CapableRegenerate, FrontMultPackage, claim exes, freestanding-self-host-complete, MultFsWriteTool, ProductWireWriteTool, etc. | Once (or after clean) to produce prebuilts / tools |
| **Diagnostic / unit just recipes** | Many `just *-subset-emit`, `*-subset-rebuild` (Lake-hosted), `first-surface`, `subset-front`, `front-mult-package`, Capable* lake exes, perform/ownership claim recipes, `freestanding-self-host-complete` | Host verification and development surface; not all product hot path |
| **Claim-bool flip proof (policy)** | Living claim flips while Lake is host elaborator | `AGENTS.md`: lake on PATH required for claim-bool GREEN during bootstrap |
| **Product honesty pins** | `stillUsesLake` / `dependsOnLake` true on M2-M5 modules; `productPathOfficialPathStillUsesLake` true on SelfHostComplete | Document that product path still **claims** Lake host residual until M6 |
| **Dual residual host residual** | `hostElaboratorResidualRemains` true; DualResidual free true | Free is product residual free, **not** host Lake gone |

### 2.3 Product pin SSoT (greppable living tip)

| Pin | Living meaning today |
|-----|----------------------|
| `productPathOfficialPathStillUsesLake` | true -- official product path honesty: Lake still used for host residual |
| Per-module `stillUsesLake` / `dependsOnLake` | true on FrontMultPackage, SubsetPackageJoin, ProductWireWriteTool, Mult surfaces, etc. |
| `hostElaboratorResidualRemains` | true -- DualResidual host residual program |
| `residualFreeClaimed` / product residual free | true -- claim A; orthogonal to Lake |
| `freestandingProductSelfHostComplete` | true -- claim B; orthogonal to Lake |
| `freestandingDriverComplete` | true -- Mult package Path A only; Mult-orthogonal |

M6 implement that flips product Lake pins must inventory and dual-pin **all**
living product path StillUsesLake / DependsOnLake SSoTs (SelfHostComplete tip +
modules gates require), not only one greppable string.

### 2.4 What M6 reuses vs invents

| Reuse | Do not invent |
|-------|----------------|
| M2/M4/M5 measured without-Lake recipes as evidence that product **work** already runs without lake on hot path | Claiming hot path Lake-free alone is M6 done without pin flip + elaborator proof |
| Dual residual free true + host residual remains true | Forging host residual false while Lake still elaborates SystemsLean |
| SelfHostComplete / freestanding-self-host-complete lake proof pattern for claim flips | Grep-only StillUsesLake false GREEN |
| Short role names for any new inventory / pin modules | Kitchen-sink ProductPathFreestanding* basenames |
| Thin just orchestration | New shell/Python mill for elaborator retire |
| Honesty matrix shape from M2-M5 designs | free/complete re-open; PROVABLY/llvm unlock |

---

## 3. Operational meaning: M6 product-path Lake retire

### 3.1 What "product path retires Lake" means

**Product path** means the freestanding release and measured product/compiler
surfaces humans and gates treat as product:

1. Official `just build` -> emit + `out/freestanding-c`
2. Measured Mult / product-wire / multi-unit package join without-Lake recipes
3. Living product honesty pins that currently say the product path still uses Lake

**Retire Lake from product path (M6 / S4)** means:

1. Living product pins `StillUsesLake` / `DependsOnLake` (and
   `productPathOfficialPathStillUsesLake`) become **false** with **real
   elaborator proof** (lake build of pin modules / claim surface while Lake is
   still available as bootstrap elaborator for that proof -- or successor proof
   surface if later defined).
2. Official product path and measured product steps **do not require** Lake on
   the hot path (already largely true after M4/M5; M6 makes the **claim** match).
3. Dual residual honesty: product free remains true; host elaborator residual
   stays honest (see 3.2). Residual free measure stays green.
4. Free, complete, freestandingDriverComplete, PROVABLY, llvm stay on their own
   bars (no forge).

| Allowed for M6 | Not M6 |
|----------------|--------|
| Flip product StillUsesLake/DependsOnLake false with lake elaborator proof | Grep-only flip; silent pin edit |
| Document product path no longer depends on Lake as elaborator/driver | Selling free true as Lake gone without pin work |
| Keep optional Lake recipes for host development / diagnostics with honest names | Claiming all Lake recipes deleted as success criterion |
| Update DualResidual / measure / self-host / residual lockstep | Step 4 PROVABLY/llvm; free/complete re-open |

### 3.2 Dual residual honesty (product free != Lake gone)

| Program | Today | After M6 product retire (target) |
|---------|-------|----------------------------------|
| **Product residual free (claim A)** | true | **true** (unchanged by Lake retire) |
| **Host elaborator residual** | remains (Lake elaborates SystemsLean) | May still remain for **host development** (editing SystemsLean under Lake) OR shrink only with separate honest residual -- **do not** forge host free just because product pins flip |
| **Product StillUsesLake** | true | **false** after elaborator-proof implement |
| **Measured product hot path** | already largely Lake-free | stays Lake-free; pins now agree |

**Hard dual residual rules:**

1. free true already **does not** imply Lake gone -- that was always dual residual law.
2. After M6, product path pins false **does not** imply host elaborator residual free.
3. `hostElaboratorResidualRemains` stays true while SystemsLean is still elaborated by classic Lake for development. Only a later residual with checkable Done when may change that.
4. Residual free measure must keep forbidding managed residual forge and keep product free honesty tokens.

### 3.3 Elaborator proof criteria (never forge)

| Flip | Required proof (bootstrap era) |
|------|--------------------------------|
| Product `StillUsesLake` / `DependsOnLake` / `productPathOfficialPathStillUsesLake` -> false | Lake elaborates the pin modules (and SelfHostComplete / DualResidual as gates require); claim / complete recipe exit 0 where product gate already requires lake on claim flips |
| Dual residual / residual free measure updates | Measure exit 0; DualResidual theorems green; no product residual re-open |
| Presence dual-pin | `just systems-host` / emit-wire if new tokens/modules |

**Ban:** flip living tip pins with greps alone; rewrite theorems to expect false without product intent; mark residual GREEN without lake command exit 0 while Lake is host elaborator.

### 3.4 Clarifications

1. **Not "delete Lake from the tree."** M6 retires Lake as the **product path**
   elaborator/driver dependency. Lake may remain for host SystemsLean development.
2. **Not free claim work.** Free is already true.
3. **Not complete claim work.** Complete is already true.
4. **Not freestandingDriverComplete.** Mult package writer pin is orthogonal.
5. **Not Step 4.** PROVABLY and llvm stay held.
6. **Bootstrap vs product.** Lake may still bootstrap prebuilts once; product
   pins after M6 say product path does not **depend** on Lake as living driver.

---

## 4. Honesty matrix

| Pin / claim | Today | After M6 design | After phase 1 implement (proposed) | After M6 pins flip (later phase) |
|-------------|-------|-----------------|-------------------------------------|----------------------------------|
| Product `StillUsesLake` | true | true | **true** (inventory only) | **false** with elaborator proof |
| Product `DependsOnLake` | true | true | **true** | **false** with elaborator proof |
| `productPathOfficialPathStillUsesLake` | true | true | **true** | **false** with elaborator proof |
| Claim A free | true | true | **unchanged** | **unchanged** |
| Claim B complete | true | true | **unchanged** | **unchanged** |
| `hostElaboratorResidualRemains` | true | true | **true** | **true** unless separate residual |
| `freestandingDriverComplete` | true | true | **orthogonal unchanged** | orthogonal |
| M4 productWire*Finished | true | true | unchanged | unchanged |
| M5 subsetPackageJoin*Finished | true | true | unchanged | unchanged |
| Local M6 inventory / measured-steps Lake-free pin (new) | absent | false | **true only if** inventory + dual evidence of hot-path Lake-free set | true |
| PROVABLY | held | held | held | held |
| llvm / out/llvm-ir | deferred | deferred | deferred | deferred |
| Residual free measure | green | green | green | green |

**Non-claims this design must not dilute:**

- free is not Lake gone
- complete is not residual free and not Lake gone
- measured without-Lake hot path is not StillUsesLake false
- freestandingDriverComplete is Mult package writer complete, not Lake retire
- M6 design is not pin flip; phase 1 inventory is not pin flip
- PROVABLY / llvm remain held

---

## 5. Candidate implement residual Names (checkable Done when)

Prefer **phase 1 inventory gate** first (no pin forge). Later phase flips pins
with elaborator proof. Cap one Open Name at a time.

### Phase 1 -- M6 Lake retire inventory gate (prefer first implement)

| Field | Draft |
|-------|--------|
| **Name** | M6 Lake retire implement phase 1 |
| **Goal** | Inventory and dual-pin what product path already runs without Lake on the hot path vs what still requires Lake (host elaborate, bootstrap prebuild, diagnostic recipes), without flipping StillUsesLake/DependsOnLake. |
| **Done when** | (1) Research note already on disk (this design). (2) Short host module (role name e.g. `LakeRetireInventory` / `ProductPathLakeInventory` -- not ProductPathFreestanding* kitchen-sink) with structural pins, e.g. product measured hot-path recipes listed as Lake-free evidence pins true, product StillUsesLake/DependsOnLake **remain true**, host elaborator residual remains true. (3) just recipe (e.g. `lake-retire-inventory` or `product-path-lake-inventory`) greps Lean pins + greps justfile for documented Lake-free product recipes and forbidden "StillUsesLake false" forge tokens if needed; exit 0. (4) Dual residual honesty documented in module header + residual: free true != Lake gone; free/complete/freestandingDriverComplete/productWire*/subsetPackageJoin* unchanged. (5) Presence dual-pin if new module; docs self-host M6 phase 1 row; residual/handoff/WATCHER; gates: measured just + systems-host + product-residual-free-measure + hygiene green; lake build of inventory module if lake on PATH. (6) **No** StillUsesLake/DependsOnLake false flip this Name. |
| **Out of scope** | Pin flip to false; free/complete re-open; PROVABLY; llvm; hand product C; deleting all lake recipes; forging hostElaboratorResidualRemains false |
| **Primary paths (draft)** | new short `SystemsLean/*.lean` inventory; `justfile`; residual / self-host / handoff / WATCHER / plan; presence if required |
| **Local pin naming** | Prefer short greppable names e.g. `lakeRetireInventoryReady`, `productPathMeasuredStepsLakeFreeEvidence`, `lakeRetireKeepsProductStillUsesLake` -- not kitchen-sink stacks |

### Phase 2 -- Product-path Lake pins flip with elaborator proof

| Field | Draft |
|-------|--------|
| **Name** | M6 product-path Lake pins flip |
| **Goal** | Set product StillUsesLake / DependsOnLake / productPathOfficialPathStillUsesLake **false** with real lake elaborator proof and dual residual honesty lockstep. |
| **Done when** | (1) Inventory of all living product StillUsesLake/DependsOnLake SSoTs flipped consistently (surgical hand edits; not bulk sed). (2) Lake elaborates affected modules; SelfHostComplete / DualResidual / freestanding-self-host-complete (as required by existing claim gates) exit 0 with pins false. (3) Residual free measure green; free/complete true unchanged; freestandingDriverComplete Mult-orthogonal unchanged; hostElaboratorResidualRemains **true** unless a separate checkable residual already closed host residual. (4) Presence dual-pin; docs self-host M6 / S4 done row; residual archive; no PROVABLY/llvm forge. |
| **Out of scope** | Phase 1 skip; grep-only GREEN; host free forge; Step 4 |
| **Status** | plan Remaining after phase 1 |

### Phase 3 -- Residual measure / dual residual lockstep (if needed after pin flip)

| Field | Draft |
|-------|--------|
| **Name** | M6 residual measure Lake retire lockstep |
| **Goal** | Residual free measure and DualResidual text/pins agree with product Lake retire without forging host free. |
| **Done when** | Measure green; DualResidual theorems green; honesty tokens updated where gates require; free remains true; host residual remains true if Lake still elaborates host. |
| **Out of scope** | Inventing new free claim theater; PROVABLY/llvm |

**Recommendation:** Open residual after this design = **M6 Lake retire implement phase 1** only. Do not open phase 2 pin flip in the same slice. WATCHER must carry `/implement` for phase 1 (no DONE-FOR-NOW while M6 Remaining).

---

## 6. Gates and dual evidence (for implementers)

| Gate | Role |
|------|------|
| Measured inventory just recipe | Exit 0; greps pins + Lake-free recipe inventory |
| `just systems-host` | Presence dual-pin if new Lean module/pins |
| `just product-residual-free-measure` | Free measure stays green; no managed residual forge |
| `just hygiene` | ASCII + professional tone |
| Lake build of inventory / pin modules | Host elaborator proof when flipping or when new host module lands (phase 1: build inventory; phase 2: prove false pins) |
| `just freestanding-self-host-complete` | After phase 2 pin flips, re-green complete recipe with StillUsesLake false honesty |

Driver stdout (any new Lean later): short stage banner, paths, pin values only --
no residual non-claims theater (policy in `AGENTS.md`). **This design slice:**
docs only; no Lean product body; no pin flips.

---

## 7. Residual Open switch (after this design lands)

**Close:** M6 Lake retire design (this note + residual archive).

**Open next (plan default):**

### M6 Lake retire implement phase 1

| Field | Content |
|-------|---------|
| **Name** | M6 Lake retire implement phase 1 |
| **Goal** | Inventory and dual-pin product-path Lake-free measured steps vs remaining Lake host/bootstrap/diagnostic needs; keep StillUsesLake/DependsOnLake true. |
| **Done when** | As phase 1 section 5 (checkable). |
| **Out of scope** | StillUsesLake false; free/complete re-open; PROVABLY; llvm; host residual free forge; hand product C |
| **Primary paths** | short inventory host module; justfile; residual / self-host / handoff / WATCHER; presence if needed |
| **Status** | open after design |

Plan Remaining after phase 1: phase 2 product-path pins flip with elaborator
proof; phase 3 measure lockstep if needed; Step 4 held.

---

## 8. Self-host / plan lockstep (what docs must say)

| Doc | Update on design close |
|------|------------------------|
| `src/systems/self-host.md` | M6 design row -> done (cite this note); Open phase 1 implement |
| `RESIDUAL-systems.md` | Archive design; Open phase 1; clear false DONE-FOR-NOW park; living tip M6 design done; Decisions operator correction |
| `RESIDUAL.md` | Systems Open table phase 1 |
| `WATCHER.md` | `/implement` M6 Lake retire implement phase 1 (no DONE-FOR-NOW) |
| `doc/SESSION-HANDOFF.md` | Living tip M6 design done; Open phase 1 |
| `src/systems/README.md` | Short living tip only if needed |
| Plan living tip + Step 5 M6 design | M5 Name C **done**; M6 design **done**; Next Open phase 1; still never forge StillUsesLake false early |

---

## 9. Cite map (M0-M5 -> M6)

| Ladder piece | What M6 takes from it |
|--------------|----------------------|
| **M0 Mult S0-S3** | Host Lake bootstrap foundation still real for elaborating SystemsLean |
| **M1 unit packages** | Lake-hosted emit/rebuild remain diagnostic/bootstrap; not product pin alone |
| **M2 Mult without-Lake** | Prebuilt + host-cc Mult measured steps as Lake-free product evidence |
| **M3 SubsetFront** | Front-end may still lake-build for diagnostics; not M6 success alone |
| **M4 product-wire without-Lake** | Official just build already Lake-free on hot path -- evidence for M6 claim, not claim itself |
| **M5 package join without-Lake** | Multi-unit prebuilt join Lake-free on hot path -- same |
| **Dual residual / free / complete** | Free and complete stay true; free never sold as Lake gone |

---

## 10. Operator correction (false park)

| Wrong park | Honest state |
|------------|--------------|
| "M5 closed; only deferred S4; DONE-FOR-NOW / empty Open" | Ideal ladder is M0-M6. M6 Remaining is checkable design-then-implement work. |
| "do not auto-start S4/M6" as finished product | Means: do not **forge** StillUsesLake false early. Does **not** mean stop before M6 design/implement. |
| free true + complete true + M5 done = freestanding ladder finished | Foundation + M0-M5 closed; **M6 Lake retire** still open until pins false with elaborator proof. |

Documented in residual Decisions on design land (2026-08-01).
