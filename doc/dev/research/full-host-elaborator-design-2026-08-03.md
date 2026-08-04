# Full host elaborator design (A2)

Kind: analysis / design only. Not residual invent beyond the ordered queue.
Not host free forge. Not DualResidual pin flip. Not product free re-open.
ASCII only. Plain American English. Date: 2026-08-03.

**Program:** `.agents/plans/plan-slake-replaces-lake.md` section A2 / Step 2.

**Finish line:** Slake does everything Lake does for Systems Lean host develop
under `src/systems/`: load the package, follow imports, elaborate and check
modules (including theorems), and build the host tools we currently build with
Lake. Six-unit Mult / Linear / Types / Program / Graph / Compose checkers and
package writers are **foundation only**. Operator chose full host develop
(retire cold full elaborate from day-to-day), not stop at six units.

**Related (do not re-open as living finish line):**

- `doc/dev/research/peer-elaborator-design-2026-08-01.md` (Mult-first fragment
  path; steps 1-10 foundation history)
- `doc/dev/research/host-residual-free-design-2026-08-03.md` section 4 (full
  host develop free checklist default)
- `doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md` (living gap)
- Host pins: `DualResidual.lean`, `HostResidualShrink.lean`
- Host foundation: `HostTerm`, `HostFront`, `HostCheck`, `HostGraph`,
  `HostPackageWrite` (+ theorems / mains)
- Recipes: `just/host.just`, `just/host-without-lake.just`; cold package
  `just systems-lake`
- Living tip: `src/systems/self-host.md`

---

## 1. Goal of this design

Map **every Lake host develop job** used today under `src/systems/` to **staged
Slake ownership**. State the gap between the six-unit foundation and the full
package. Freeze an **ordered residual work queue** with plain Names. Recommend
**dialect vs real Lean** posture. **Do not** implement the elaborator here.
**Do not** flip DualResidual.

**Aggregate honesty (unchanged by this design):**

| Claim surface | Living pin / tip | Status |
|---------------|------------------|--------|
| Product residual free | `DualResidual.residualFreeClaimed` | **true** |
| Product path StillUsesLake / DependsOnLake | SelfApplyFs / SelfHostComplete tip | **false** |
| Host elaborator residual remains | `DualResidual.hostElaboratorResidualRemains` | **true** |
| Host elaborator residual free claimed | `DualResidual.hostElaboratorResidualFreeClaimed` | **false** |
| Six-unit Mult..Compose fragment + package path | HostResidualShrink measured units | **met as foundation** |
| Full SystemsLean cold elaborate still Lake | `hostResidualShrinkFullHostElaborateRemains` | **true** |
| Bootstrap prebuild of foundation bins | `hostResidualShrinkBootstrapPrebuildRemains` | **false** (A8: clean-bootstrap leanc when IR present; FullHostElaborateRemains true for total wipe) |
| Host finish line (Slake owns Lake jobs) | plan-slake-replaces-lake | **not finished** |

---

## 2. What Lake does today for host develop

Lake is the classic Lean package and elaborator driver under `src/systems/`.
Package config is `src/systems/lakefile.lean`. Default library target is
`lean_lib SystemsLean`. About **256-262** host modules live under
`SystemsLean/*.lean` (handoff living count ~262 including mains and tools).
About **48** thin `lean_exe` tools are registered (product-wire writers, unit
subset emit/rebuild, foundation host fragment tools, LLVM text writers, claim
measure exes).

### 2a. Job catalog (Lake host develop)

| # | Lake job | What a human / CI does today | Primary paths / recipes |
|---|----------|------------------------------|-------------------------|
| L1 | **Package load** | Read `lakefile.lean`, package name, library roots, exe list | `src/systems/lakefile.lean`, `lake-manifest.json` |
| L2 | **Import graph resolve** | Follow `import SystemsLean.*` across the library; fail on missing / cycles | every `SystemsLean/*.lean`; cold `lake build` |
| L3 | **Elaborate and typecheck modules** | Elaborate each module body (defs, inductives, namespaces, instances) | full library under `src/systems/` |
| L4 | **Check theorems** | Elaborate proof terms in tip modules and `*Theorems` companions | e.g. Mult, Types, IrProgram, HostCompose, DualResidual theorems |
| L5 | **Build host library** | Produce `.olean` / build artifacts for `SystemsLean` | `lake build` / `just systems-lake` (optional elaborator when elan present) |
| L6 | **Build host tools (lean_exe)** | Build thin mains with `supportInterpreter` | 48 named `slake-*` exes in lakefile |
| L7 | **Run host tools** | `lake exe <name>` for emit, claim measures, fragment check, LLVM text, ... | just recipes that call lake build/exe |
| L8 | **Claim-bool elaborator proof** | Policy: claim flips need real elaborator proof while Lake is host elaborator | `just freestanding-self-host-complete` and similar; `AGENTS.md` |
| L9 | **Diagnostic / unit lake recipes** | Unit subset emit/rebuild under Lake; host-front with lake; LLVM text under lake | `just/host.just`, subset recipes, `just/llvm.just` |
| L10 | **Bootstrap prebuild for measured hot paths** | One-time `lake build` of foundation bins before recipes that avoid Lake on the hot path | `slake-host-fragment-check`, `slake-host-graph`, `slake-host-package-write` |

**Not Lake host develop jobs (orthogonal; already product-owned or deferred):**

| Surface | Owner today | Note |
|---------|-------------|------|
| Official freestanding product wire | `just build` / freestanding-capable path | Product path Lake pins false; not host elaborate |
| Mult..Compose unit package C rewrite without Lake on hot path | subset rebuild / package join recipes | Package evidence; not full host elaborate |
| Full LLVM production backend / Rust-native link | deferred tracks | Not required for host free |
| mathlib-scale Lean ecosystem | out of day-one scope | Superset progressive |

### 2b. Six-unit foundation already owned (Slake-shaped, not full Lake)

| Foundation surface | Modules / recipes | What it owns | What it does **not** own |
|--------------------|-------------------|--------------|--------------------------|
| Closed term / command IR | `HostTerm` | Mult-first command IR (import, namespace, inductive, def, match, simple types) | Full Lean AST; real `.lean` parse of whole tree |
| Fragment front-end | `HostFront`, fixed example inputs under `goldens/host-front/` | Accept/reject Mult..Compose-shaped dialect files | Real SystemsLean module text as Lake sees it |
| Fragment check | `HostCheck`, `host-fragment-check` / `-without-lake` | Measured check driver over fixed corpus | Full package typecheck |
| Multi-file import graph | `HostGraph`, `host-graph` / `-without-lake` | Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose dialect graph; missing import / cycle fail-closed | Full `SystemsLean` import closure (~256 modules) |
| Unit package write via foundation path | `HostPackageWrite`, `host-package-write` / `-without-lake` | Mult..Compose unit package dual evidence under that path | Host tool build for all 48 exes; claim measures; full library |
| Partial host residual shrink inventory | `HostResidualShrink`, `just host-residual-shrink` | Named foundation hot paths Lake-free; honesty pins for full elaborate remains | Host free claim |

Foundation recipes that avoid Lake on the **hot path** still require a
**bootstrap** Lake build of the three foundation bins after clean. That is
honest and expected until Slake can build those tools itself.

---

## 3. Gap table: six-unit foundation vs full package

| Dimension | Six-unit foundation (today) | Full package (finish line) | Gap class |
|-----------|----------------------------|----------------------------|-----------|
| Package config | Implicit; fixed dialect corpus roots | Load `lakefile.lean` (or successor package map) and library roots | **Package load** |
| Module count | 7 dialect companions in graph + fixed example inputs | ~256-262 real `SystemsLean/*.lean` modules | **Scale** |
| Source language | Documented Mult-first / unit-shaped host dialect (`.slake-host`) | Real host Lean sources (or growing dialect that faithfully covers them) | **Syntax / dialect** |
| Import graph | Fixed Mult..Compose companion set | Full transitive import closure of library | **Graph scale** |
| Typecheck depth | Structural well-formed + dialect check | Real elaborator judgments for defs, inductives, theorems | **Kernel depth** |
| Theorems | Not required for foundation package write success | `*Theorems` and tip theorems **in** free checklist (plan default) | **Proof check** |
| Host tools | Three foundation bins + many Lake-built product tools | Slake builds (or freestanding-builds) the tools day-to-day develop needs | **Tool build** |
| Claim measures | Still Lake for policy proof | May stay Lake as **one-time / claim-proof** if residual names them out of day-to-day bar | **Policy carve** |
| Cold full elaborate | Still required for full package develop | One-time bootstrap / emergency only after free checklist met | **Day-to-day retire** |
| Host free DualResidual | remains true / free claimed false | remains false / free claimed true only at A-last | **Claim flip last** |

**Bottom line:** foundation proves **shape** (term IR, front, check, small graph,
unit package write, recipes without Lake on those steps). Full package needs
**coverage** of real package load, real import graph, real module elaborate
including theorems, and host tool build ownership -- staged, with evidence each
slice.

---

## 4. Staged Slake ownership map (Lake job -> Slake stage)

Ownership stages are residual program order, not calendar promises. Each stage
keeps DualResidual host residual **true** until A-last.

| Lake job | Stage id | Slake ownership target | Evidence shape | Residual Names (queue section 5) |
|----------|----------|------------------------|----------------|----------------------------------|
| L1 Package load | S1 | Slake reads package roots and library module list without calling Lake on the measured step | Fixed package map or lakefile-derived list; recipe green | **Package roots without Lake** |
| L2 Import graph | S2 | Resolve import closure for a **growing real module set** (start small, expand to full library) | Graph recipe; missing/cycle fail-closed; inventory of covered modules | **Real Mult import graph** then expand |
| L3 Elaborate modules | S3 | Check / elaborate module bodies for covered set | Accept good / reject bad; dual pins + recipe | **First real host module check** then expand |
| L4 Theorems | S4 | Same path checks theorem modules for covered set | Named theorem modules in measured corpus | **Host theorem check expand** (after body check solid) |
| L5 Library build | S5 | Produce usable build artifacts for covered set without Lake on hot path | Prebuilt or freestanding tool chain; inventory | Folds into expand + tool ownership |
| L6-L7 Host tools | S6 | Slake owns build/run of day-to-day host tools (foundation first, then claim/product tools as needed) | Tool recipe without Lake on hot path | **Foundation tools without Lake bootstrap** then tool expand |
| L8 Claim proof | S7 | Policy: while residual modules still need Lake elaborate, claim flips keep lake proof; after free, claim proof moves with freestanding surface | Documented; not slogans | A-last only for free flip |
| L9 Diagnostic lake | S8 | Shrink or reclassify diagnostic lake recipes as non day-to-day | Inventory honesty | Continuous with expand |
| L10 Bootstrap prebuild | S9 | Retire foundation bin Lake bootstrap when Slake builds those bins | Bootstrap pin false with evidence | After foundation tools ownership |

**Product wire and unit package C paths stay product-owned.** They do not
substitute for L1-L7.

---

## 5. Dialect vs real Lean posture (recommendation)

### Recommendation (default for implement slices)

**Grow a documented host dialect that converges on real SystemsLean modules**,
not a day-one reimplementation of the full Lean 4 elaborator or mathlib.

| Horizon | Posture | What success looks like |
|---------|---------|-------------------------|
| **Short (now)** | Keep Mult-first / unit-shaped dialect (HostTerm + HostFront + fixed example inputs) as **regression harness** | Foundation recipes stay green; no re-narrow of finish line to six units only |
| **Medium (A3+)** | **Hybrid:** (1) package load + real import graph over **real** `.lean` paths for a named seed set; (2) check bodies either by dialect extract from those modules **or** by a thin real-Lean subset parser for the features those modules actually use | First full-package surface measured without Lake on that step; host free still false |
| **Long (toward free)** | Either (A) dialect grows until it faithfully covers all host develop modules, or (B) Slake elaborates real Lean syntax for this package only | Cold full `lake build` is bootstrap-only for day-to-day develop |
| **Explicit non-goal day one** | Full Lean 4 + mathlib elaborator parity | Plan and free design already out of scope |

**Decision rule when a slice hits a syntax wall:** prefer the **smallest dialect
extension** that covers the next named real modules, with fixed accept/reject
examples. Prefer **not** to invent a second permanent language that never maps
back to `SystemsLean/*.lean`. Prefer **not** to claim "real Lean" because a
package C rewrite is green.

**Theorems default:** **in** the long checklist (plan default 10.2). A later
written carve-out may move theorem-only develop to Lake emergency only, but that
must be greppable honesty, not agent silence.

**Hybrid is intentional:** foundation dialect harness + staged real-module
coverage. Same-job wall-clock remains **same modules / same job**, never cold
full package vs Mult package write as a "win."

---

## 6. Ordered residual work queue (plain Names)

Open first Name after this design. Later Names open when prior Done when is met
(or operator promotes clean parallel with disjoint scopes). Supporting print
cleanup (P1) may run in parallel if files do not race.

### 6a. Program A -- full host elaborator coverage

| Order | Name | Goal | Done when (checkable) | Out of scope |
|------:|------|------|------------------------|--------------|
| A2 | **Full host elaborator design** | This note | Research note path; gap table; queue; dialect posture; residual next Name; DualResidual unchanged | Free flip; whole elaborator implement |
| A3 | **Package roots without Lake** | First full-package host surface: Slake (or measured host tool) loads package library roots / module list for `src/systems/` without Lake on the measured step | **done** 2026-08-03 (`HostPackageRoots` / `host-package-roots-without-lake`; join `.agents/joins/a3-package-roots-without-lake.md`); host free false; DualResidual remains true | Free flip; full elaborate; mathlib |
| A4 | **Real Mult import graph** | Resolve import closure for a **real** seed set starting at `SystemsLean/Mult.lean` (and required companions), not only dialect goldens | **done** 2026-08-03 (`HostImportGraph` / `host-import-graph-without-lake`; Mult+MultTheorems; join `.agents/joins/a4-real-mult-import-graph.md`); host free false; DualResidual remains true | Full 256-module graph in one slice; free flip |
| A5 | **First real host module check** | Check/elaborate Mult (or next named real module) on the Slake path with accept good / reject bad | **done** 2026-08-03 (`HostModuleCheck` / `host-module-check-without-lake`; PARTIAL-STRUCTURAL Mult+MultTheorems key decls; join `.agents/joins/a5-first-real-host-module-check.md`); host free false | Full library; free flip; full elaborator typecheck |
| A6 | **Host module set expand** | Grow covered real modules in named slices (Linear, Types, Program, Graph, Compose host modules, then larger library bands) | **Mult..Compose foundation done** 2026-08-03 Mult+Linear+Types (`HostImportGraph` + `HostModuleCheck`; join `.agents/joins/a6-host-module-set-expand.md`) + Program/IrProgram (join `.agents/joins/a6-host-program-module-expand.md`) + Graph/IrGraph (join `.agents/joins/a6-host-graph-module-expand.md`) + Compose/HostCompose (seed +HostCompose+HostComposeTheorems modules=12; HostResidualShrink Compose seed reseed; join `.agents/joins/a6-host-compose-module-expand.md`); further library bands still open under A6+; free false | Jump to free; forge complete |
| A7 | **Host theorem check expand** | Include `*Theorems` / tip theorems for covered modules on the same path | **done** 2026-08-03 Mult..Compose *Theorems required corpus Mult=8 Linear=8 Types=8 IrProgram=6 IrGraph=6 HostCompose=8 PARTIAL-STRUCTURAL on `host-module-check-without-lake`; HostResidualShrink A7 reseed; join `.agents/joins/a7-host-theorem-check-expand.md`; `proofCompleteClaimed` unchanged; host free false | proof complete forge; free flip alone |
| A8 | **Foundation tools without Lake bootstrap** | Build/run foundation check/graph/package-write tools without requiring Lake prebuild after clean (freestanding or Slake-owned build) | **done** 2026-08-03 (`just host-foundation-tools-clean-bootstrap` leanc relink of six foundation host tools from IR+rsp; `hostResidualShrinkBootstrapPrebuildRemains` false; FullHostElaborateRemains true; join `.agents/joins/a8-foundation-tools-without-lake-bootstrap.md`); host free false | Free flip; rewrite product wire |
| A9 | **Host tool build expand** | Own day-to-day lean_exe tools needed for host develop (not every historical claim exe on day one) | **done** 2026-08-03 (inventory ~51 lean_exe; host-front clean-bootstrap + without-Lake; HostResidualShrink A9 pins; join `.agents/joins/a9-host-tool-build-expand.md`); host free false | "Lake binary deleted from disk" theater |
| A10+ | **Expand until full checklist** | Continue until cold full library elaborate is bootstrap-only for day-to-day develop (A10 Host develop tool expand continue **done** 2026-08-03 subset-front; next Name: Front mult package without Lake) | Living inventory every remaining Lake surface has a Name or explicit out-of-scope honesty | Slogans; early free |
| A-last | **Host residual free claim** | Flip DualResidual only when section-4 full host checklist met under choice (a) | `hostElaboratorResidualRemains` false; free claimed true; lake elaborator proof while required; residual + surface-matrix lockstep | Re-open product free; forge llvm / PROVABLY |

### 6b. Supporting (parallel, disjoint)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| P1 | **Host-cc helper tools without C printed from Lean** | Retire MultFsWriteTool / ProductWireWriteTool full C-as-string printers | Modules no longer hold multi-hundred-line C tool bodies as Lean strings; measured Mult / product-wire write recipes still green; freestanding product path green; DualResidual unchanged | Ban freestanding product C; ban classic Lake AOT under `.lake/` |

### 6c. Held

| Name | Why held |
|------|----------|
| Host residual free residual (Track 3c / A-last) | Until full host checklist met with evidence |
| Full Lean 4 / mathlib day-one elaborator | Not project day-one goal |
| Full LLVM backend / Rust-native link | Separate tracks; not host free substitute |

### 6d. Primary Open after this design lands

**Real Mult import graph** (A4). A3 Package roots without Lake is **done**.

That is the first **full-package** surface: package load (L1), measured without
Lake on that step, inventory updated, host free still false. It does **not**
implement the whole elaborator.

---

## 7. How free checklist maps to this queue

From `host-residual-free-design-2026-08-03.md` section 4 (choice (a)):

| Free requirement | Relation to queue |
|------------------|-------------------|
| 1 Named host develop residual bar | Full host develop; this note + plan |
| 2 Coverage without Lake on normal step for every named surface | A3 through A10+ must close L1-L7 day-to-day surfaces |
| 3 Inventory of what still uses Lake | HostResidualShrink successor reseed each expand; bootstrap / claim-proof / diagnostic reclassified honestly |
| 4 DualResidual flip + elaborator proof | A-last only |
| 5 HostResidualShrink inventory reseed | Continuous with A3+ |
| 6 Product pins unchanged | All slices |
| 7 Residual lockstep | Every slice |

Mult..Compose foundation success **does not** meet requirement 2 under choice (a).

---

## 8. Risks and anti-patterns

| Risk | Mitigation |
|------|------------|
| Agents re-narrow finish line to six units | Goals + self-host + this note; free checklist = full host develop |
| "Package write green" sold as elaborator | Gap table; L1-L7 map |
| Cold full Lake vs Mult package wall-clock as win | Same-job only; research note already labels full cold as not peer |
| Free flip early | DualResidual stays true until A-last |
| Day-one full Lean parser | Dialect posture section 5 |
| Theorem modules forgotten | A7 in queue; plan default theorems **in** |
| Print-track confuses product C ban | P1 only; three-story table in AGENTS / multi-language inventory |
| Product C / shell growth as elaborator progress | Forbidden; Lean + pure Nix only |

---

## 9. Non-claims (this slice)

- Does **not** flip `hostElaboratorResidualRemains` or `hostElaboratorResidualFreeClaimed`
- Does **not** claim host residual free
- Does **not** implement package load, real graph, or module check
- Does **not** re-open product free / complete / PROVABLY
- Does **not** forge llvm full backend or proof complete
- Does **not** grow product C or shell mills
- Does **not** retire Mult..Compose foundation harness

---

## 10. Pointers

| Artifact | Role |
|----------|------|
| This note | A2 design SSoT for staged ownership + residual queue |
| `plan-slake-replaces-lake.md` | Finish-line program A/P |
| Peer elaborator design 2026-08-01 | Foundation history Mult-first |
| Host residual free design section 4 | Free checklist requirements |
| Free bar inventory 2026-08-03 | Living gap after Mult..Compose foundation |
| `HostResidualShrink.lean` | Measured foundation units + remains pins |
| `DualResidual.lean` | Host remains true; free claimed false |
| `just host-*-without-lake` | Foundation hot paths |
| `just systems-lake` | Optional cold full host elaborate |
| Residual / WATCHER / handoff | A3 done; Open next: Real Mult import graph |

---

## 11. Green for A2 only

| Check | Status |
|-------|--------|
| Research note at this path | yes |
| Lake job map (L1-L10) + staged ownership | yes |
| Gap table foundation vs full package | yes |
| Ordered residual Names with Done when | yes |
| Dialect vs real Lean recommendation | yes |
| DualResidual unchanged | required at land (no edit) |
| Next Open Name checkable | **Real Mult import graph** |
