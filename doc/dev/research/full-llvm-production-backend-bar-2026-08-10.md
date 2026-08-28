# Full LLVM production backend bar (honesty)

**Kind: analysis only. Not residual.**
**Date:** 2026-08-10
**Reseed:** 2026-08-11 U4 XL honesty hold (confirms R3/W4/T4: multiUnit Mult..Graph DF true is not
DominanceClaimed; band FullBackend stays false; no A-heavy flip; pins measured false)
**Purpose:** Name what `fullBackend` true requires versus what is already on disk,
so progressive residual slices can land without forging the end claim.

**Related living surfaces:** `out/llvm-ir/README.md`;
`doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md`;
`SystemsLean.LlvmHold`; `SystemsLean.LlvmCfgFixture`; Mult..Graph SSA modules;
pure Nix `nix/systems-llvm-ir/`; plan
`.agents/plans/plan-full-readiness-2026-08-09.md` Remaining work **R1**;
residual Name **Full LLVM production backend**.

## Living pins (must stay honest)

| Pin / claim | Living value | Notes |
|-------------|--------------|-------|
| `llvmUnlocked` | **true** | Unlock residual; not full backend |
| Mult..Graph unit IR text + compose | **done** | Generator-owned under `out/llvm-ir/` |
| Mult..Graph SSA partial | **done** | Local `*FullBackendClaimed` **false** on every band |
| Mult CFG fixture + structural deepen | **done partial** | merge preds + reachability; not production DF |
| Production CFG deepen (Mult SSA) | **done** | idom + four-pred merge phi dual-pin vs `slake_mult_ssa.ll` |
| Linear SSA CFG production dual-pin | **done** (R1a) | multi-unit Mult+Linear; `just linear-cfg-production-deepen` |
| Types SSA CFG production dual-pin | **done** (R1b) | multi-unit Mult+Linear+Types; `just types-cfg-production-deepen` |
| Mult dominance frontier partial | **done** (R1c) | structural DF table; `just mult-dominance-frontier-partial`; DominanceClaimed false |
| Mult DF Cytron deepen | **done** | `multDominanceFrontierDeepen` true; Mult-band fixed diamond only |
| Linear+Types DF deepen | **done** (R5) | `linearDominanceFrontierDeepen` / `typesDominanceFrontierDeepen` |
| Program+Graph DF deepen | **done** (N4) | `programDominanceFrontierDeepen` / `graphDominanceFrontierDeepen` |
| multiUnit Mult..Graph DF deepen | **true** (R5+N4) | Mult+Linear+Types+Program+Graph join; **not** DominanceClaimed |
| Program SSA CFG production dual-pin | **done** (R1d) | multi-unit Mult..Program; `just program-cfg-production-deepen` |
| Graph SSA CFG production dual-pin | **done** (R1d) | multi-unit Mult..Graph; `just graph-cfg-production-deepen` |
| General program CFG posture | **done** (partial) | compose multi-merge; `just general-program-cfg-partial`; unit-diamonds-only false |
| Iterative CFG over multi-node IR | **done** (partial) | walk IrProgram/IrGraph; `just iterative-cfg-construction-partial`; progressive independent of tip polarity |
| Progressive bar evidence partial | **true** (R1e + iterative + path B) | `fullLlvmBarEvidencePartial`; not a synonym of tip fullBackend; stays true when tip true |
| Full DF pipeline required for bar (2) | **false** (path B) | `dominancePipelineRequiredForFullBackend` false; DominanceClaimed optional extra |
| Mult foreign link success | **done Mult-only** | Not Linear/Types/Program/Graph foreign (those are separate bands) |
| Mult..Graph foreign progressive (R2) | **done** | Band-local; not multi-band single crate |
| Rust IR interop partial | **true** (`rustIrInteropPartialClaimed`) | Mult..Graph foreign + Mult layout/IR dual-pin; `just rust-ir-interop-partial`; full ABI freeze false |
| Mult layout/IR consumer success | **partial** | Not true multi-unit Rust-native link |
| `llvmCfgFixtureFullBackendClaimed` | **true** | Package 1 A-light 2026-08-10: progressive bar (1)-(7) path B + lake proof; pure Nix requires tip true |
| Production opt / full dominance pipeline | **false** | Opt intentional non-claim; full DF optional not required for bar (2) |
| fullBackend end claim (fixture tip) | **true** (A-light) | Progressive bar (1)-(7) met; tip true with lake; band-local Mult..Graph SSA / foreign / rustIrInterop `*FullBackendClaimed` stay **false** |
| Rust IR intercompat multi-band full | **true** (`rustIrInteropFullClaimed`) | Multi-band joint dual map; not formalized all of rustc; not fullBackend synonym |
| Full readiness announce bar B | **met** | Progressive R1-R5 green; announce does not require tip fullBackend (tip now also true under Package 1) |
| Option A (tip claim flip) | **closed A-light** | Join redesign + pin true + Nix invert + lake; report `.agents/reports/impl-full-backend-claim-true-2026-08-10.md` |

## What "full production backend" requires (bar)

`fullBackend` / production backend claim true is honest only when **all** of the
following have residual evidence + lake elaborator proof where claim bools flip:

1. **Multi-unit production CFG dual-pin (progressive)** -- Mult and at least one
   other unit band (Linear first; then Types / Program / Graph) dual-pin
   generator-owned SSA CFG (blocks, edges, structural idom, merge phi preds)
   against on-disk `slake_*_ssa.ll`. **R1a Mult+Linear; R1b Types; R1d Program+Graph
   (all five unit bands dual-pinned).** **Met as progressive dual-pin.**
2. **Dominance frontier partial or general program CFG** -- beyond fixed diamond
   fixtures: DF (dominance frontier) honesty for Mult (then multi-unit), or a
   Program/Graph-shaped CFG that is not Mult-only grade_tag / Linear live_flag.
   **R1c Mult DF partial met; Program/Graph unit diamonds dual-pinned (R1d).**
   **Met as partial DF + unit Program/Graph CFG.** Full DF pipeline
   (`llvmCfgFixtureDominanceClaimed`) still **false** and **not required** for
   this bar item (path B product decision 2026-08-10:
   `dominancePipelineRequiredForFullBackend` false).
3. **General CFG construction posture** -- evidence that production CFG is not
   only hand-table unit diamonds. **Met partial:** multi-unit compose chain +
   multi-merge inventory (`generalCfgConstructionPartial`;
   `just general-program-cfg-partial`; `productionCfgUnitDiamondsOnlyClaimed`
   false). **Plus iterative partial (2026-08-10):** CFG blocks/edges built by
   walking multi-node ordered IR program + IrGraph edges
   (`iterativeCfgConstructionPartial`; KernelProgram three-node chain fixture;
   `just iterative-cfg-construction-partial`). Walker is fold/map over nodes and
   edges (not Mult grade_tag diamond tables). Dual-pin fixture is one multi-node
   graph; not a claim of every possible IR shape on disk.
4. **Optional opt / llc pipeline** -- only if product claims machine code emit;
   otherwise leave production opt **false** and document non-claim.
   **R1e decision: production opt stays false as intentional non-claim** until
   product residual opens machine code emit. Not a blocker for progressive
   evidence; not a free pass for fullBackend.
5. **Elaborator-proofed readiness pin** -- short role name (not kitchen-sink
   residual history); lake build (or freestanding host proof path when that is
   the claim surface). Never alias of `llvmUnlocked`.
   **`fullLlvmBarEvidencePartial` true** (progressive bar (1)-(3) + iterative
   partial + opt non-claim). That pin is **not** fullBackend (independent of tip
   polarity). Package 1 A-light later flipped tip true with lake + join redesign.
6. **Honesty review residual** -- residual Open names remaining non-claims;
   free / complete / PROVABLY / FullHost / Mult foreign Mult-only unchanged
   unless separate residuals flip them. **R1e met 2026-08-10:** progressive pin
   true without claiming tip; iterative partial does **not** by itself flip
   fullBackend (Package 1 A-light did the tip flip later with lake).
7. **Rust IR intercompat evidence (partial minimum)** -- Slake-generated LLVM IR
   must be dual-pinned against Rust layout/IR contracts (host Lean correspondence
   + Mult..Graph foreign success + Mult layout fixture / layout-IR dual-pin +
   optional out-of-tree rustc dogfood). **Partial met 2026-08-10:**
   `rustIrInteropPartialClaimed` true (`SystemsLean.RustIrInterop`;
   `just rust-ir-interop-partial`; research
   `doc/dev/research/rust-systems-lean-ir-correspondence-2026-08-10.md`).
   multi-band full pin (`rustIrInteropFullClaimed`) is **true** (2026-08-10;
   multi-band joint dual map; not formalized all of rustc; not product Rust
   under `src/`). Bar item (7) partial **and** multi-band full are **met**.
   fullBackend remains a **separate** production claim pin; do **not** treat
   partial or full interop as fullBackend synonym.

**Living (Package 1 A-light, 2026-08-10):** fixture tip
`llvmCfgFixtureFullBackendClaimed` **true** with lake + progressive bar path B
+ join redesign. Progressive items (1)-(3) met as **partials** (including
iterative walk); (4) intentional non-claim (opt false); (5) progressive
readiness pin true (**not** a synonym of tip; independent of tip polarity);
(6) honesty review done; (7) Rust IR intercompat partial **and** multi-band
full **true**. Band Mult..Graph SSA / foreign `*FullBackendClaimed` and
production opt / DominanceClaimed stay **false**.

## Path B product decision (2026-08-10) -- full DF not required for bar (2)

**Decision:** Mult dominance frontier **partial** + unit Mult..Graph production
CFG dual-pin + iterative multi-node IR CFG walk is **enough** for bar item (2)
(**Dominance frontier partial or general program CFG**). A full dominance
pipeline (`llvmCfgFixtureDominanceClaimed` true) is an **optional extra**, not
a hard requirement for progressive bar close or for any later fullBackend
honesty review.

| Surface | Value after path B |
|---------|--------------------|
| `dominancePipelineRequiredForFullBackend` | **false** (host Lean + pure Nix forge-ban on true) |
| `llvmCfgFixtureDominanceClaimed` | **false** (optional algorithm unclaimed) |
| Bar item (2) | **met** without DominanceClaimed |
| `fullLlvmBarEvidencePartial` | **true** (includes path B pin) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (Package 1 A-light; path B evidence + lake; not forged by path B alone) |

**Why not path A (land full DF dual-pin):** full DF algorithm dual-pin would be
theater relative to the bar text ("partial **or** general program CFG"). Path
B matches the written bar and prefers honesty over claim inflation.

**fullBackend tip:** **true** under Package 1 A-light (2026-08-10) after
progressive bar (1)-(7) path B + lake proof. Progressive pins no longer require
`!fullBackend` (join redesign). Never an alias of `fullLlvmBarEvidencePartial`
or `llvmUnlocked` alone. Full readiness **announce** still does not *require*
the tip flip under announce-bar B (announce was allowed while tip was false).

## Announce-bar B (2026-08-10) -- full readiness announce without fullBackend true

**Decision (orchestrator default; product residual closed under this bar):**
revise the **full readiness announce** bar so announce may proceed when
**in-scope progressive product evidence is green**, while the production
`fullBackend` claim pin stays **false**.

| Question | Answer under bar B |
|----------|--------------------|
| May full readiness announce while `fullBackend` / `llvmCfgFixtureFullBackendClaimed` is false? | **Yes** |
| Is fullBackend required for announce? | **No** (under bar B) |
| Does announce flip fullBackend true? | **No** -- forge banned |
| What does announce state? | Progressive Full LLVM path B + Mult..Graph foreign + Rust IR partial/full multi-band + R3 present-partial + R4 package bar + R5 join; free/complete/PROVABLY true; host free claimed under free bar (a); FullHost **false**; mathlib parity **held**; fullBackend **false** as separate optional production claim |
| Option A (flip fullBackend with lake + bar) | **Closed A-light 2026-08-10** (Package 1): progressive bar met + join redesign + lake tip true; not required for announce residual (bar B) |

### Why bar B (plain English)

1. Progressive Full LLVM path B already met Done when (1)-(10) without requiring
   full dominance; the same honesty class applies: progressive product readiness
   is not the same as the production-fullBackend claim pin.
2. Operator history: do all remaining progressive work; never forge free /
   complete / PROVABLY / FullHost / fullBackend.
3. Flipping fullBackend true from unlock / `fullLlvmBarEvidencePartial` /
   Mult..Graph foreign / `rustIrInteropFullClaimed` alone would be **forgery**
   (bar SSoT non-equivalences).
4. In-scope progressive product residuals R1-R5 are green with evidence. Announce
   must state what is true and what remains held (fullBackend false; FullHost
   false; mathlib parity held).
5. Option A was a **separate production residual** (Package 1 A-light closed
   2026-08-10) after progressive bar evidence; not this announce residual.

### Non-equivalences (still law)

| True | Still not fullBackend |
|------|------------------------|
| `llvmUnlocked` | unlock only |
| `fullLlvmBarEvidencePartial` | progressive evidence partial |
| Mult..Graph foreign band-local success | band-local foreign |
| `rustIrInteropPartialClaimed` / `rustIrInteropFullClaimed` | interop map, not production backend claim |
| path B DF non-requirement | dominance optional for progressive bar (2) |

Living surfaces after announce-bar B: plan
`.agents/plans/plan-full-readiness-2026-08-09.md`; residual
`RESIDUAL-systems.md` (announce residual closed under B); join `RESIDUAL.md`;
handoff `doc/SESSION-HANDOFF.md`; report
`.agents/reports/impl-full-readiness-announce-2026-08-10.md`.

## R1e honesty review (2026-08-10) -- decision (superseded by Package 1 A-light)

**R1e land-time decision: do NOT flip tip fullBackend true from progressive
pins alone.** Package 1 A-light (later same day) **did** flip tip true after
join redesign + lake proof under bar (1)-(7). R1e progressive pin remains
independent of tip polarity.

| Bar item | Status after R1e | Enough for fullBackend true? |
|----------|------------------|------------------------------|
| (1) Multi-unit Mult..Graph CFG dual-pin | **met** | Necessary, not sufficient alone |
| (2) Mult DF partial + Program/Graph unit CFG | **met partial** | Full DF pipeline still unclaimed |
| (3) General CFG beyond unit diamonds | **met partial** | compose multi-merge + iterative multi-node walk |
| (4) Production opt / llc | **non-claim false** | OK while product does not claim machine code |
| (5) Short readiness pin + lake | **partial pin true** (`fullLlvmBarEvidencePartial`) | Not a fullBackend synonym |
| (6) Honesty review | **met** (this section) | Documents non-claims; does not forge |

### Remaining after tip true (A-light closed)

**Path B (2026-08-10):** progressive bar items (1)-(6) for *evidence* are met.
**Announce-bar B (2026-08-10):** full readiness announce residual **closed**
without requiring tip fullBackend. **Package 1 A-light:** fixture tip **true**.
No open progressive dual-pin gap for tip honesty. Still false on purpose:
production opt, DominanceClaimed, band FullBackend.

1. **Iterative CFG over multi-node IR** -- **met partial** (2026-08-10):
   `iterativeCfgConstructionPartial` walks KernelProgram / IrGraph multi-node
   fixture; dual-pin green; progressive independent of tip. Further IR shapes are
   optional deepen, not a free pass for production opt / band FullBackend.
2. **Full dominance pipeline** -- **not required** (path B): product decision
   that Mult DF partial + unit Mult..Graph dual-pin + iterative multi-node IR
   CFG walk meet bar item (2) without `llvmCfgFixtureDominanceClaimed` true.
   Pin `dominancePipelineRequiredForFullBackend` **false**. DominanceClaimed
   stays false as optional extra (not a blocker for progressive evidence close).
3. **Elaborator-proofed fullBackend pin flip** -- **met Package 1 A-light
   2026-08-10** (`llvmCfgFixtureFullBackendClaimed` true; lake
   `SystemsLean.LlvmCfgFixture` exit 0). Never alias `llvmUnlocked`,
   `fullLlvmBarEvidencePartial`, Mult..Graph foreign, or Rust interop pins
   alone; flip required join redesign + progressive bar green + lake.
4. **Production opt** remains non-claim unless a separate residual opens machine
   code emit; opt false does not block progressive evidence and is not the tip.
5. **Band-local `*FullBackendClaimed`** on Mult..Graph SSA stay **false**
   (fixture tip true is not band FullBackend).

### Non-claims unchanged by R1e

- freestanding free / complete / PROVABLY
- FullHostElaborateRemains
- Mult..Graph foreign band-local success (R2 progressive complete; not a
  multi-band Rust crate; not fullBackend synonym)
- mathlib day-one; AffineDrop dual
- product freestanding C growth; shell mills
- `llvmCfgFixtureDominanceClaimed` (full DF pipeline)
- `llvmCfgFixtureProductionOptClaimed`
- all band `*FullBackendClaimed` pins

### Progressive readiness pin (not fullBackend synonym)

| Pin | Value | Meaning |
|-----|-------|---------|
| `fullLlvmBarEvidencePartial` | **true** | Progressive bar (1)-(3) partials + path B DF non-requirement + opt non-claim + !DominanceClaimed; **independent of tip fullBackend polarity** (not a synonym of tip) |
| `dominancePipelineRequiredForFullBackend` | **false** | Path B: full DF not required for bar (2) or progressive close |
| `llvmCfgFixtureDominanceClaimed` | **false** | Full DF algorithm unclaimed (optional extra) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (Package 1 A-light) | Fixture tip true with lake + progressive bar path B + join redesign; band FullBackend / production opt stay false; progressive pin above is not this tip |

Lake proof surface: `lake build SystemsLean.LlvmCfgFixture` (theorems
`fullLlvmBarEvidencePartial_true`,
`dominancePipelineRequiredForFullBackend_false`,
`llvmCfgFixtureFullBackendClaimed_true`; progressive independent of tip polarity;
forge-ban on `dominancePipelineRequiredForFullBackend` true in pure Nix).

## Already on disk (not full backend)

| Surface | What it is | What it is not |
|---------|------------|----------------|
| Mult..Graph SSA partial | Unit SSA-shaped IR text + phi blocks | Production DF / full backend |
| Mult CFG fixture deepen | Structural merge preds + reachability | Production dual-pin alone |
| Production CFG deepen | Mult SSA dual-pin idom + four-pred merge phi | Linear/Types/DF alone |
| Linear CFG production dual-pin | Linear live_flag dual-pin + multi-unit join | Types/DF/general CFG alone |
| Types CFG production dual-pin | Types kind_tag dual-pin + Mult+Linear+Types join | DF/general CFG alone |
| Mult DF partial | Structural Mult DF table dual-pin (merge join) | Full DF algorithm / DominanceClaimed |
| multiUnit Mult..Graph DF deepen | Mult..Graph Cytron dual-pin join (`multiUnitDominanceFrontierDeepen`) | DominanceClaimed / proved idom constructor / arbitrary-graph DF |
| Program CFG production dual-pin | Program push-status dual-pin + Mult..Program join | General CFG builder / fullBackend |
| Graph CFG production dual-pin | Graph addEdge-status dual-pin + Mult..Graph join | Full iterative CFG builder / fullBackend |
| General program CFG partial | Compose multi-merge dual-pin beyond unit diamonds | Full iterative CFG over arbitrary IR / fullBackend |
| Iterative CFG partial | Walk multi-node IrProgram/IrGraph CFG build | fullBackend / DominanceClaimed / production opt |
| `fullLlvmBarEvidencePartial` | Progressive bar evidence readiness | fullBackend end claim |
| Mult foreign link Mult-only | Out-of-tree Mult dogfood + dual agreement | Other-band foreign link |
| `llvmUnlocked` true | Dogfood IR path allowed | Full production backend |

## Current vs bar (gap table)

| Bar item | Status after R1e honesty |
|----------|--------------------------|
| Mult production CFG dual-pin | **met** (`productionCfgDeepen`) |
| Linear production CFG dual-pin | **met** (`linearCfgProductionDeepen`) |
| Multi-unit Mult+Linear join | **met** (`multiUnitCfgProductionDeepen`) |
| Types production CFG dual-pin | **met** (`typesCfgProductionDeepen`) |
| Multi-unit Mult+Linear+Types join | **met** (`multiUnitCfgProductionDeepenTypes`) |
| Mult dominance frontier partial | **met** (`multDominanceFrontierPartial`; DominanceClaimed false) |
| Mult DF Cytron deepen | **met** (`multDominanceFrontierDeepen`) |
| Linear+Types DF deepen | **met** (R5; multi-unit Mult+Linear+Types DF) |
| Program+Graph DF deepen | **met** (N4) |
| multiUnit Mult..Graph DF deepen | **met** (`multiUnitDominanceFrontierDeepen` true; still not DominanceClaimed) |
| Program production CFG dual-pin | **met** (`programCfgProductionDeepen`) |
| Graph production CFG dual-pin | **met** (`graphCfgProductionDeepen`) |
| Multi-unit Mult..Program join | **met** (`multiUnitCfgProductionDeepenProgram`) |
| Multi-unit Mult..Graph join | **met** (`multiUnitCfgProductionDeepenGraph`) |
| General program CFG beyond unit diamonds | **met partial** (`generalCfgConstructionPartial`; unit-diamonds-only false) |
| Iterative CFG over multi-node IR | **met partial** (`iterativeCfgConstructionPartial`; `just iterative-cfg-construction-partial`) |
| Progressive bar evidence partial pin | **met** (`fullLlvmBarEvidencePartial` true + lake; includes iterative) |
| Honesty review residual | **met** (R1e + T4 2026-08-11; progressive pin independent of tip; claim flip was separate Package 1) |
| Production opt / llc | **non-claim false** (intentional until machine code emit opens) |
| Full dominance pipeline required for bar (2) | **false** (path B; Mult DF partial + unit Mult..Graph + iterative enough) |
| Full dominance pipeline (DominanceClaimed) | **false** optional extra (multiUnit Mult..Graph DF true is **not** this pin; not required; not a progressive gap) |
| Band Mult..Graph `*FullBackendClaimed` | **false** each (tip A-light true is not band FullBackend; pure Nix forge-ban) |
| fullBackend claim true + lake | **true** Package 1 A-light (fixture tip; progressive not synonym; band FullBackend / opt / DF still false) |
| Full readiness announce bar B | **met** (announce did not require tip fullBackend; tip later true under Package 1 A-light) |

## T4 honesty (2026-08-11) -- multiUnit DF true is not DominanceClaimed

After R5 (Mult+Linear+Types DF) and N4 (Program+Graph DF), the join pin
`multiUnitDominanceFrontierDeepen` is **true** for Mult through Graph. That is
the checkable progressive deepen for unit-diamond Cytron dual-pins. It is **not**
a license to set `llvmCfgFixtureDominanceClaimed` true.

### Why DominanceClaimed stays false (plain English)

1. **Structural idom tables** -- each band still uses a hand dual-pin production
   idom table. There is no proved dominator-tree constructor on the product wire.
2. **Fixed unit diamonds only** -- DF rows cover Mult..Graph unit SSA diamonds
   (grade_tag / live_flag / kind_tag / push / add-edge shapes). Not arbitrary
   multi-join IR export.
3. **Path B already closed bar (2)** -- progressive Full LLVM does not require
   full DF; `dominancePipelineRequiredForFullBackend` stays **false**.
4. **Pure Nix forge-ban** -- specs fail if DominanceClaimed is defined true.
   Flipping needs written A-heavy bar + forge-ban invert + lake proof (XL;
   operator-held).

### Why band FullBackend stays false (plain English)

1. Each band SSA lower remains **partial** by design.
2. Fixture tip fullBackend **true** (A-light) is a **different pin** from band
   Mult..Graph SSA / foreign `*FullBackendClaimed`.
3. Foreign success is band-local; Rust IR interop is dual-map, not production
   backend claim.
4. Band true would need A-heavy honesty redesign (C1b / XL); default leave false.

Report: `.agents/reports/impl-llvm-honesty-t4-2026-08-11.md`.
Consumer surface: `out/llvm-ir/README.md` (T4 reseed).

## W4 honesty hold (2026-08-11) -- living tip reseed; pins stay false

Hierarchical wave **W4** re-confirmed the T4 inventory under living residual Open.
No product Lean claim-bool edits. No A-heavy dual-pin remained checkable without XL
bar redesign. **Expected outcome delivered:** honest hold.

| Pin | Living value after W4 |
|-----|------------------------|
| `multiUnitDominanceFrontierDeepen` | **true** (unchanged; Mult..Graph Cytron dual-pin) |
| `llvmCfgFixtureDominanceClaimed` | **false** (structural idom; fixed unit diamonds; Path B; forge ban) |
| Band Mult..Graph `*FullBackendClaimed` | **false** each (A-heavy; tip A-light is not band FullBackend) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (fixture tip A-light; unchanged) |
| `dominancePipelineRequiredForFullBackend` | **false** (Path B) |
| free / complete / PROVABLY | **true** unchanged |
| FullHostElaborateRemains | **false** unchanged |

T4 reasons still govern (cite above). Report:
`.agents/reports/impl-llvm-honesty-w4-2026-08-11.md`. Prior T4:
`.agents/reports/impl-llvm-honesty-t4-2026-08-11.md`.

## R3 honesty hold (2026-08-11) -- hierarchical reseed; pins stay false

Hierarchical **R3** (Phase 0 after W1-W5) re-confirmed the W4/T4 inventory under living
residual Open. Best-effort product dual-pin for DominanceClaimed or band Mult..Graph
FullBackend still needs XL bar redesign + pure Nix forge-ban invert + lake. No checkable
A-heavy dual-pin remained short of forge. **Expected outcome delivered:** honest hold.
No product Lean claim-bool edits.

| Pin | Living value after R3 |
|-----|------------------------|
| `multiUnitDominanceFrontierDeepen` | **true** (unchanged; Mult..Graph Cytron dual-pin) |
| `llvmCfgFixtureDominanceClaimed` | **false** (structural idom; fixed unit diamonds; Path B; forge ban) |
| Band Mult..Graph `*FullBackendClaimed` | **false** each (A-heavy; tip A-light is not band FullBackend) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (fixture tip A-light; unchanged) |
| `dominancePipelineRequiredForFullBackend` | **false** (Path B) |
| free / complete / PROVABLY | **true** unchanged |
| FullHostElaborateRemains | **false** unchanged |

### Why hold still wins (W4 reasons re-confirmed)

1. **Structural idom only** -- per-band production idom tables are hand dual-pins, not a proved dominator-tree constructor.
2. **Fixed unit diamonds** -- Mult..Graph DF covers unit SSA diamonds only, not arbitrary-graph DF export or multi-join production pipeline.
3. **Path B bar (2)** -- `dominancePipelineRequiredForFullBackend` is **false**; progressive bar already met without DominanceClaimed.
4. **Pure Nix forge ban** -- specs fail if DominanceClaimed or band FullBackend are defined true until operator XL redesign.
5. **Band FullBackend A-heavy** -- fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (A-light) is a separate pin; band Mult..Graph `*FullBackendClaimed` stay **false** by design.

Report: `.agents/reports/impl-llvm-honesty-r3-2026-08-11.md`. Prior W4:
`.agents/reports/impl-llvm-honesty-w4-2026-08-11.md`. Prior T4:
`.agents/reports/impl-llvm-honesty-t4-2026-08-11.md`.

## U4 XL honesty hold (2026-08-11) -- completeness wave; pins stay false

Completeness wave **U4** (DominanceClaimed or band FullBackend XL deepen) re-confirmed the
R3/W4/T4 inventory under living residual Open. Best-effort path **(A)** (pin true with written
XL bar + product dual-pin + pure Nix forge-ban invert + lake) still has **no checkable product
slice**: multiUnit Mult..Graph DF Cytron dual-pin is already true; remaining gaps are proved
idom constructor, arbitrary-graph DF export, and operator XL redesign of forge-bans. Path
**(B)** delivered: honest hold; pins measured false; no product Lean claim-bool edits.

| Pin | Living value after U4 |
|-----|------------------------|
| `multiUnitDominanceFrontierDeepen` | **true** (unchanged; Mult..Graph Cytron dual-pin) |
| `llvmCfgFixtureDominanceClaimed` | **false** (structural idom; fixed unit diamonds; Path B; forge ban) |
| Band Mult..Graph `*FullBackendClaimed` | **false** each (A-heavy; tip A-light is not band FullBackend) |
| `llvmCfgFixtureFullBackendClaimed` | **true** (fixture tip A-light; unchanged) |
| `dominancePipelineRequiredForFullBackend` | **false** (Path B) |
| free / complete / PROVABLY | **true** unchanged |
| FullHostElaborateRemains | **false** unchanged |

### Why hold still wins (R3 reasons re-confirmed)

1. **Structural idom only** -- per-band production idom tables are hand dual-pins, not a proved dominator-tree constructor.
2. **Fixed unit diamonds** -- Mult..Graph DF covers unit SSA diamonds only, not arbitrary-graph DF export or multi-join production pipeline.
3. **Path B bar (2)** -- `dominancePipelineRequiredForFullBackend` is **false**; progressive bar already met without DominanceClaimed.
4. **Pure Nix forge ban** -- specs fail if DominanceClaimed or band FullBackend are defined true until operator XL redesign.
5. **Band FullBackend A-heavy** -- fixture tip `llvmCfgFixtureFullBackendClaimed` **true** (A-light) is a separate pin; band Mult..Graph `*FullBackendClaimed` stay **false** by design.

### What XL path (A) would still need (not this slice)

| Requirement | Status |
|-------------|--------|
| Written XL bar for DominanceClaimed true and/or band FullBackend true | Documented as held optional; not redesign + invert this slice |
| Proved dominator-tree constructor (not hand idom dual-pin) | **missing** |
| Arbitrary-graph DF export beyond Mult..Graph unit diamonds | **missing** |
| Pure Nix forge-ban invert for DominanceClaimed and/or band `*FullBackendClaimed` true | **not inverted** (bans still require false) |
| Lake elaborator proof on claim surface after pin flip | **n/a** (no flip) |

Report: `.agents/reports/impl-llvm-xl-u4-2026-08-11.md`. Prior R3:
`.agents/reports/impl-llvm-honesty-r3-2026-08-11.md`. Prior W4:
`.agents/reports/impl-llvm-honesty-w4-2026-08-11.md`. Prior T4:
`.agents/reports/impl-llvm-honesty-t4-2026-08-11.md`.

## Progressive residual slices (R1 program)

| Slice | Name | Goal | Status |
|-------|------|------|--------|
| **R1 first** | Full LLVM open + bar SSoT | Residual Open, bar note, Mult+Linear verified, pins false | **done** |
| **R1a** | Linear SSA CFG production dual-pin | Multi-unit beyond Mult | **done** |
| **R1b** | Types SSA CFG production dual-pin | Third unit band vs `slake_types_ssa.ll` | **done** |
| **R1c** | Mult dominance frontier partial | Structural DF table dual-pin; not full algorithm | **done** |
| **R1d** | Program + Graph CFG production | Beyond Mult/Linear/Types diamonds | **done** |
| **R1 general** | General program CFG posture | Compose multi-merge beyond unit diamonds | **done** |
| **R1e** | Honesty review + progressive readiness | Document gaps; `fullLlvmBarEvidencePartial` true; progressive independent of tip | **done** (claim flip was separate Package 1) |
| **R1 iterative** | Iterative CFG over multi-node IR | Walk IrProgram/IrGraph; dual-pin KernelProgram chain | **done** (partial; progressive independent of tip) |
| **R1 path B** | DF non-requirement for bar (2) | Document Mult DF partial + iterative + unit Mult..Graph enough without DominanceClaimed; pin `dominancePipelineRequiredForFullBackend` false | **done** (2026-08-10) |
| **R1 claim flip** | Full backend claim true | Package 1 A-light: lake tip true + join redesign; never alias unlock / partial / Rust full pin | **done** A-light (2026-08-10); band FullBackend / opt / DF still false |
| **Announce bar B** | Full readiness announce without fullBackend | Document bar B; close announce residual; tip not required for announce | **done** (2026-08-10); tip later true under Package 1 |

## Non-claims (this note does not change)

- freestanding product free / complete / PROVABLY
- FullHostElaborateRemains
- Mult foreign link beyond Mult band (other bands have own residuals)
- multi-band Rust crate farm (R2 band-local foreign is not that)
- mathlib day-one; AffineDrop dual
- product freestanding C growth; shell mills
- `llvmCfgFixtureDominanceClaimed` (full DF pipeline; stays false after R1c)
- `llvmCfgFixtureFullBackendClaimed` band-local / production-opt class: tip **true** A-light after Package 1; band Mult..Graph SSA / foreign FullBackend and production opt stay **false**

## Gates (R1 first + R1a..R1e verify)

```bash
just systems-llvm-ir
just production-cfg-deepen
just linear-cfg-production-deepen
just types-cfg-production-deepen
just mult-dominance-frontier-partial
just mult-dominance-frontier-deepen
just multi-unit-dominance-frontier-deepen
just program-cfg-production-deepen
just graph-cfg-production-deepen
just general-program-cfg-partial
just iterative-cfg-construction-partial
just hygiene
# when lake on PATH:
(cd src/systems && lake build SystemsLean.LlvmCfgFixture)
```
