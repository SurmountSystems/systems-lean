# Plan: Living program -- Slake does everything Lake does

ASCII only. Plain American English. Complete sentences.

**Status of this plan file:** 2026-08-08 living program refresh through **F1**
host free dual-ok + Track 4c proof complete + R1 elaborator-parity design +
HostModuleCheck family Sub-1-KLOC + **HostImportGraph long-file split** +
operator program **Phases D/M/C/B/L/P all done** (Phase P inventories polish).
Program A1 through F1 product/host + evidence is on disk and green. Host residual
free **claimed** (remains false / free true). Host-surface free-bar Open is
empty (done-for-now under free bar choice (a)). That is the host-surface
bar, not the living ElabMeet named-subset Open. Operator-approved post-free program
D..P **closed**. Full Lean 4 / mathlib elaborator parity still **unclaimed**.
Hygiene and thoughtful language remain standing on every slice (including
markdown). This update does **not** restart the project from zero.

**Living tip (2026-08-16):** Typecheck one live module is **done**
(SystemsLean.Mult). Typecheck one real theorem module is **done**
(SystemsLean.MultTheorems, including proof terms). Plan Step 4 named
closed subset is **done**. ElabMeet grow TypesTheorems is **done**.
ElabMeet grow ErasureTheorems subset is **done**. ElabMeet grow Extract
closed subset is **done**. ElabMeet grow ExtractTheorems subset is
**done**. ElabMeet grow IrProgram subset is **done**. ElabMeet grow
IrProgramTheorems subset is **done**. ElabMeet grow HostTerm
subset is **done**. ElabMeet grow HostFrontGoldens
subset is **done**. ElabMeet grow HostFront
subset is **done**. ElabMeet grow HostFrontTheorems
subset is **done**. ElabMeet grow HostCheck
subset is **done**. ElabMeet grow HostGraph
subset is **done**. ElabMeet grow HostGraphTheorems
subset is **done**. ElabMeet grow HostPackageWrite
subset is **done**. ElabMeet grow HostPackageWriteTheorems
subset is **done**. ElabMeet grow HostPackageRoots
subset is **done**. ElabMeet grow HostImportGraphSeeds
subset is **done**. ElabMeet grow HostImportGraphModel
subset is **done**. ElabMeet grow HostImportGraphMods
subset is **done**. ElabMeet grow HostImportGraphModsLater
subset is **done**. Named closed
subset is **24 of about 206**
(Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite, HostPackageWriteTheorems,
HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel,
HostImportGraphMods, and HostImportGraphModsLater).
Next is **Grow HostImportGraphLoadOkLater subset** (barrel import 114; one
import SystemsLean.HostImportGraphModsLater; import-closed on the 24). Do
not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Skip HostGraphMain.
Skip Linear as a named member. Skip IrGraph this next.
ElabMeetSubset is **865**. ElabMeetNamedWalk is **322**.
ElabMeetNamedWalkLater is **785**. ElabMeetNamedWalkTail is **863**.
ElabMeetNamedWalkHostTerm is **841**. ElabMeetNamedWalkHostGraphTheorems
is **191**. ElabMeetNamedWalkHostPackageWrite is **622**.
ElabMeetNamedWalkHostImportGraphSeeds is **578**.
ElabMeetNamedHostImportGraphModsLaterProbe is **207**. ElabMeet is
**776**. ElabMeetTheorems is **811**. ElabMeetCompile is **916**.
Extract first: Tail (**863**) and Later (**785**) cannot absorb another
leftover wrapper without passing about 880. HostTerm walk **841**
stays. HostGraphTheorems walk **191** stays. HostPackageWrite walk
**622** stays. HostImportGraphSeeds walk **578**; extract bar for that
file is about 780; another twelfth-sized wrapper family of about 110
to 169 lands near 688 to 747, under about 780, so twenty-fifth
wrappers MAY stay there unless the add would pass about 780.
Twenty-fifth probe MUST be a NEW
ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean. Do not dump
HostImportGraphLoadOkLater onto ElabMeetNamedHostImportGraphModsLaterProbe.
NamedWalk
stays helpers. Inventory first. Ownership, FullHost, and
package-typecheck claim bools stay **false**. Slake does **not**
typecheck the whole package. Lake still typechecks imported modules
and builds the host tools. Host residual free is **claimed** under
free bar (a). That host-surface empty-Open is host-surface only, not
the living ElabMeet named-subset Open. FullHostElaborateRemains
stays **false**. Do **not** flip FullHost. The leftover seed walk is
**closed**. Do not invent a leftover-walk Name.

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **24 of about 206** (SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems, SystemsLean.TypesTheorems, SystemsLean.Erasure, SystemsLean.ErasureTheorems, SystemsLean.Extract, SystemsLean.ExtractTheorems, SystemsLean.IrProgram, SystemsLean.IrProgramTheorems, SystemsLean.HostTerm, SystemsLean.HostFrontGoldens, SystemsLean.HostFront, SystemsLean.HostFrontTheorems, SystemsLean.HostCheck, SystemsLean.HostGraph, SystemsLean.HostGraphTheorems, SystemsLean.HostPackageWrite, SystemsLean.HostPackageWriteTheorems, SystemsLean.HostPackageRoots, SystemsLean.HostImportGraphSeeds, SystemsLean.HostImportGraphModel, SystemsLean.HostImportGraphMods, SystemsLean.HostImportGraphModsLater) |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`). Slake cannot run that full-package job. Do not invent a fake Slake wall-clock. |

Review then trash remains partial (13 review/mop held). Do **not**
start seed-wide 206 or mathlib. Do **not** re-open product free /
complete / PROVABLY without new evidence. Detail: `RESIDUAL-systems.md`.

### Closed host packages (layer 1 treadmill done)

| Package | Living tip |
|---------|------------|
| Host library seed L1-L44 + A59 band complete | modules=**206**; product leftover empty |
| Without-Lake day-to-day tools (import graph, module check, package write, front, graph, freestanding regenerate, foundation clean bootstrap) | green recipes; free claimed under bar (a) |
| A60 develop tool inventory closed | day-to-day empty; claim/diagnostic Lake-only explicit |
| A61-A66 + F0 + F0b + F1 | honesty, wipe evidence, FullHost false, free dual-ok |
| Long-file Host tips (PackageWrite, Front, Graph, ResidualShrink, ModuleCheck family, ImportGraph) | all under Sub-1-KLOC bar on measured tips |
| Operator program D/M/C/B/L/P | **done** 2026-08-08 (reports under `.agents/reports/impl-phase-*-2026-08-08.md`) |

### Remaining Lake-parity / north-star gaps (honest)

| Gap | Status |
|-----|--------|
| Full Lean 4 / mathlib elaborator parity | **unclaimed / held** (R1 design done; not free synonym) |
| Real elaborator judgments replacing cold `lake build` for full package | **held** (PARTIAL-STRUCTURAL seed is foundation only) |
| Full LLVM backend / production SSA-CFG | **held** (`llvmUnlocked` true + Mult SSA partial is unlock/partial only) |
| Rust-native link | **held** (layout design done) |
| Operator program D/M/C/B/L/P | **empty done-for-now** (closed) |

Short multi-track reseed: `.agents/plans/plan-north-star-remaining.md` living tip.
Short residual reseed: `.agents/plans/plan-remaining-residual-2026-08-08.md`.

---

## Still real (four tracks -- living honesty)

| Still real | Where it lives | Living tip |
|------------|----------------|------------|
| Host elaborator residual free claimed (F1 dual-ok) | `DualResidual.lean` / residual | `hostElaboratorResidualRemains` false; free claimed true; free dual-ok; FullHost false |
| Full Lean 4 / mathlib elaborator parity (not host free synonym) | this plan layers 2-4 | not claimed by F1 free dual-ok; preserve product law |
| **FullHostElaborateRemains false** (B2 A66 dual-ok done) | HostResidualShrink / residual / WATCHER | Pin **false** dual-ok (A66). Cold full Lake bootstrap/emergency/claim-proof only for day-to-day. Free claim does not re-true FullHost. |
| CompCert PROVABLY / full llvm backend | weight-0 deferred | PROVABLY claimed true on product matrix; full backend weight 0 |

**Closed as primary treadmill (do not re-open as seed theater):** host library
seed expand through modules=206; Host library band complete (product leftover
empty); Develop tool inventory closed (day-to-day empty); FOUNDATION-KIND-SURFACE
deepen Mult..Extract (further deepen optional, not blocking B2); **A61** residual
honesty closeout (docs/gates only; not a product claim flip); **A62** B2
still-blocked reconfirm (gates + inventory; no pin flip); long-file HostModuleCheck
family + HostImportGraph; **Phase D** docs honesty.

---

## 0. Full goal chain (operator clarify -- keep this first)

You are not only asking for "a Lake substitute binary." The end-to-end goal is:

> **Slake does everything Lake does**, implemented in **Systems Lean** with
> **linear / affine types** that let us **prove** we have safely built
> **runtimeless freestanding C**, and that C is **sealable and actually
> compiled with CompCert** (`ccomp`) so we **validate the model** in the real
> world -- not only on paper.

Unpack that as four linked layers. Agents must not drop layers 2-4 when doing
layer 1, and must not sell layer 1 alone as the whole project.

| Layer | What it means | Living honesty (2026-08-07) |
|-------|---------------|------------------------------|
| **1. Host develop ownership** | Slake owns every job classic Lake does today for Systems Lean under `src/systems/`: package load, imports, check/elaborate (including theorems), build day-to-day host tools | **Host residual free claimed under free bar choice (a)** (F1 dual-ok; remains false / free true; FullHost false). Full Lean 4 / mathlib elaborator parity still unclaimed. Product library PARTIAL-STRUCTURAL seed **modules=206** closed; Mult..Extract FOUNDATION-KIND-SURFACE deepen done (A56..A58); L-band leftover empty (A59); day-to-day tools inventory closed (A60); residual B2 evidence criteria documented (**A61**); use map + wipe recovery (**A64/A65**); **FullHostElaborateRemains false** (A66 B2 dual-ok); **F1 free dual-ok done** |
| **2. Systems Lean + linear types** | Implementation language is Systems Lean (Lean 4 + linear/affine ownership + min multiplicities 0/1/omega). Memory safety on the product path comes from types, not garbage collection | **In force as product law.** Keep growing real Mult/Linear discipline; do not invent GC product wire |
| **3. Safe freestanding C** | Slake emits runtimeless freestanding C under `emit/` / `out/freestanding-c` -- primary product wire, no managed Lean runtime on that wire | **Product free + product self-host complete true** on the normal product path (product Lake pins false). Green `just build` product wire without Lake on the hot path (prebuilt CapableRegenerate dual-eq WRITE+INSTALL) is **preserve** evidence. Host residual free claimed separately (F1); FullHostElaborateRemains stays false |
| **4. CompCert validate** | That C is aimed at CompCert-oriented seal; when PROVABLY is earned, a real resolved `ccomp` compiles it and validates the model | **PROVABLY claimed true** with living product-matrix / seal program closed (2026-08-02). Keep validating; do not forge weaker dogfood as a new PROVABLY. Full program seal growth stays honest residual if any surface re-opens |

### One-sentence agents must obey

> Finishing the **host** side means layer 1 is true with evidence. Finishing the
> **project story** means layers 1-4 stay linked: Systems Lean with linear
> types owns host develop, emits freestanding C we trust, and we keep CompCert
> validation real -- not slogans. Every slice also applies **hygiene and
> thoughtful language** (section H) to the files it touches, including
> markdown.

### What this plan primarily drives (after A1-A62 honesty)

**Layer 1** free bar choice (a) host residual free is **claimed** (F1 dual-ok).
Seed expand through L-band and B1 develop tools are **done**. A61 residual honesty
closeout is **done**. A62 reconfirm **done**. A64/A65 evidence **done**. **A66
FullHostElaborateRemains false** dual-ok **done**. **F0/F0b/F1** free checklist +
design + free dual-ok **done**. Full Lean 4 / mathlib elaborator parity remains
unclaimed (not free synonym). Open empty done-for-now under free bar choice (a).
Layers 2-4 are **already product law and largely claimed**; every host slice
must **preserve** them (no GC product wire, no product free re-false without
cause, no PROVABLY forge, no hand-authored product C growth).

**Hygiene (section H)** is not a separate "when we have time" project. It is
how every implement slice writes and revises prose and names.

---

## H. Hygiene and thoughtful language (prominent standing rule)

### H.1 Point to living law first

Do **not** invent a second hygiene doctrine in chat. Follow project law:

| Authority | What it owns |
|-----------|--------------|
| `AGENTS.md` -- **Language (agent UX)** | Plain American English; unpack acronyms; no decoder-ring slang; product names over stage codes |
| `AGENTS.md` -- **Identifier hygiene and modular layout** | Ephemeral plan labels stay out of product APIs; short thoughtful Lean names; surgical edits only |
| `AGENTS.md` -- **Product Lean names** | No kitchen-sink claim-bool or residual-history filenames as templates |
| `AGENTS.md` -- **Documentation hygiene** | Min useful docs; SSoT; README maps not residual novels |
| `AGENTS.md` -- **ASCII and Unicode** | Novel work ASCII-only except allowlisted files; map spellings in `doc/ascii-symbol-map.md` |
| `AGENTS.md` -- **Professional tone** | Novel `*.md` banned-token gate; no profanity; no demeaning subagent talk |
| `AGENTS.md` -- **Driver stdout policy** | Short banners and pin values; honesty lives in residual / self-host, not driver essays |
| `nix/source-hygiene.nix` | Pure eval: ASCII + no trailing whitespace (`just hygiene`) |
| `nix/professional-tone.nix` | Pure eval: novel markdown banned tokens (`just professional-tone`, folded into `just hygiene`) |
| `doc/vocabulary.md` | Stable terms; unpack wire / model / freestanding |
| `doc/ascii-symbol-map.md` | Unicode to ASCII spellings when rewriting |

**Gates every slice must leave green when it touches novel text:**

```bash
just hygiene   # ASCII + trailing whitespace + professional-tone on novel *.md
```

Do **not** re-list banned professional-tone tokens in markdown (the gate would
self-fail). Prefer plain substitutes and point at `nix/professional-tone.nix`
only when implementing the gate itself.

### H.2 What "thoughtful language" means here

| Do | Do not |
|----|--------|
| Name the real thing in full words (path + role) | Short slang that needs a glossary |
| "Recipe that runs without calling Lake on that step" | Bare "without-Lake" as ordinary English in operator chat |
| "Slake path meant to do the same job as Lake" | Bare "peer" with no object |
| "Checklist before we claim host develop no longer needs Lake day to day" | Bare "free bar" |
| "Documented in `AGENTS.md`" | Agent-internal "pin" / "pinning" for saving a rule |
| "Long-file split" / "module split" | Banned fruit-metaphor residual verb (any surface) |
| "Ordered IR program" / "node list" / "graph edges" | Metaphor "spine" for IR structure |
| Short role module names | Residual history packed into one CamelCase filename |
| First use of an acronym: unpack in parentheses | Acronym soup |

**Surfaces that count (all of them):**

- Chat replies and implement joins
- Session-board todo titles and content
- Residual Open / Done living lines, WATCHER, SESSION-HANDOFF
- Active plans under `.agents/plans/`
- Research notes under `doc/dev/research/` written going forward
- **All novel markdown:** `doc/`, residual ledgers, README maps, AGENTS, plans, joins
- Novel Lean: module headers, def names on living tips, comments when touched
- Just recipe comments and human-facing banners when touched

Historical Done archive rows and old research may lag. **Do not** bulk-rewrite
hundreds of closed Done lines in one slice. Prefer **gradual on-touch** scrub
(section H.3).

### H.3 How to apply hygiene gradually (required method)

Agents rewrite jargon **as they touch files**, not as a giant repository
find-and-replace campaign.

| Rule | Detail |
|------|--------|
| **On touch** | If a slice edits a file, scrub decoder-ring jargon in the **living** lines that slice owns (headers, Open names, living tips, new prose). |
| **Living first** | Priority order: WATCHER, residual Open, SESSION-HANDOFF Active/Next, durable plan living tip, `doc/goals.md` host finish line, module headers of files being edited, README maps when those files are in Primary paths. |
| **Markdown included** | Every markdown file in Primary paths for a slice is in scope for plain-English scrub on that slice. Not "Lean only." |
| **No bulk replace** | No mass `sed` / tree-wide `replace_all` of jargon. Surgical hand edits (subagents OK on disjoint files). |
| **No self-fail essays** | Do not paste banned-token lists into `*.md`. |
| **Gates before claim green** | `just hygiene` green after prose/source edits. |
| **Optional dedicated H slice** | Only when Open is otherwise empty of layer-1 work **or** operator opens a named jargon-scrub residual. Default: interleave with L/T/B. |
| **Historical noise** | Completed session-board titles and old Done rows may keep old wording until a deliberate rename residual. Do not invent a multi-week "rename the past" treadmill as a substitute for library seed expand. |

### H.4 Phase H work items (interleave; never replace layer 1)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| H0 | **Hygiene on every slice** | Standing rule; no separate residual required | Each join notes `just hygiene` green; living lines touched stay plain English | Tree-wide jargon rewrite as only work |
| H1 (optional) | **Living prose jargon pass** | One short residual: scrub WATCHER + residual Open + handoff Active + plan living tip only | Those living surfaces plain; hygiene green; DualResidual unchanged | Full Done archive rewrite; Lean API mass rename |
| H2 (optional) | **Touched-module name honesty** | When a Lean living tip or new def is already in slice scope, prefer short role names | New/living-tip identifiers follow Product Lean names rule | Mass rename of historical claim-bool ladder mid-slice |

**Default after approve:** H0 only (standing). Open H1 only if living residual /
WATCHER still reads like a decoder ring after the docs lockstep step.

---

## 1. Corrected status table (the row you quoted)

| Claim | Meaning | Living status now |
|-------|---------|-------------------|
| Product path no longer depends on Lake | Building and shipping freestanding product C does not need Lake on the normal path | **True** (layer 3 product claim; keep) |
| Host still needs Lake | Classic Lake still elaborates most host Systems Lean under `src/systems/` | **True** until layer 1 checklist met |
| **Slake does everything Lake does** | Slake owns the full host develop job Lake does today for this tree | **Claim false; living work program true** |
| Linear types prove safe freestanding C | Ownership discipline is the safety story; freestanding C is the emit | **Law true; deepen in product/host modules as residual names** |
| CompCert `ccomp` validates the model | Real resolved ccomp path for PROVABLY / seal | **PROVABLY claimed true** on living tip; keep evidence honest |
| Hygiene / thoughtful language | Plain English + ASCII + professional tone on novel work including markdown | **Standing law; apply on touch every slice** |

### What changed in the "Slake does everything Lake does" row

| Was wrong | Correct now |
|-----------|-------------|
| "False; not the living work program" | Claim stays **false** until evidence. The **living host work program is this.** Residual Open, WATCHER, and this plan drive full Lake-job ownership until the checklist is met. |
| Six-unit Mult..Compose checkers as finish line | Foundation and regression harness only for layer 1 |
| Empty Open / done-for-now after foundation | **Banned** while this plan still names checkable next host work |
| "Replace Lake" as only tooling | Layer 1 is host finish; full goal chain is layers 1-4 |
| Hygiene only for Lean or "later" | Hygiene applies **on touch**, **including markdown** |

---

## 2. Host finish line (layer 1 checklist)

When layer 1 is **done** (claim true):

1. Load package roots / library module list for `src/systems/` without Lake on
   the measured day-to-day step.
2. Follow import closure for the **full** host library develop set (not only a
   seed).
3. Check / elaborate module bodies (including theorem modules) for that set on
   the Slake path, at least at the honesty bar residual names (PARTIAL-
   STRUCTURAL today; deepen toward real elaborate as slices allow).
4. Build and run the host tools day-to-day develop needs without Lake prebuild
   on those steps (claim/diagnostic may stay Lake-only if residual names them
   out of day-to-day with greppable honesty).
5. Cold full `lake build` is bootstrap / emergency / claim-proof only, not the
   normal develop loop.
6. Only then: DualResidual host residual remains **false**, free claimed
   **true**, with lake elaborator proof while still required, residual and
   surface-matrix lockstep.

**Still not required for host free alone:** full Lean 4 + mathlib elaborator
parity; "Lake binary deleted from disk."

**Still required for the full project story (not skipped by host free):** layers
2-4 stay true -- linear Systems Lean, freestanding C product wire, CompCert
validation honesty. Section H stays true forever.

**Operator free-checklist choice (already recorded):** (a) full host develop --
retire cold full elaborate from day-to-day. Not "stop at six units."

---

## 3. Already done (do not re-open as living finish line)

### Layer 1 foundation (A1-A11)

| Slice | Evidence (short) |
|-------|------------------|
| A1 Living docs reseed | goals, vocabulary, AGENTS, self-host, residual finish line |
| A2 Full host elaborator design | `doc/dev/research/full-host-elaborator-design-2026-08-03.md` |
| P0 / P1 Print inventory + host-cc helpers | multi-language print note; MultFs / ProductWire no full helper C strings |
| A3 Package roots without Lake | `HostPackageRoots` / `host-package-roots-without-lake` |
| A4 Real Mult import graph | `HostImportGraph` seed path |
| A5 First real host module check | `HostModuleCheck` PARTIAL-STRUCTURAL |
| A6 Mult..Compose real modules | seed modules=12 foundation |
| A7 Theorem corpus expand | Mult..Compose *Theorems required counts |
| A8 Foundation tools clean-bootstrap | leanc relink; BootstrapPrebuildRemains false |
| A9-A10+++ Develop tools | host-front through first-surface without Lake; day-to-day candidates empty |
| A11 Real module seed expand | Mult..Compose + Erasure/Extract; **modules=16** |
| A12 Library seed expand L1 | +CompilePath + Kernel Mult/Linear/Types/Program; **modules=21** |
| A13 Library seed expand L2 | +Kernel Mult/Linear/Types/Program *Theorems; **modules=25** |
| A14 Library seed expand L3 | +JoinMap + JoinMapTheorems + SelfHost + SelfHostTheorems; **modules=29** |
| A15 Library seed expand L4 | +SurfaceMatrix + SurfaceMatrixTheorems; **modules=31** |
| A16 Library seed expand L5 | +Emit Mult..Compose scaffolds; **modules=37** |
| A17 Library seed expand L6 | +Emit Plan/Apply/Body scaffolds; **modules=40** |
| A18 Library seed expand L7 | +Emit Erasure/Extract/Banner scaffolds; **modules=43** |
| A19 Library seed expand L8 | +KernelSelfApply+KernelSelfApplyTheorems; **modules=45** |
| A20 Library seed expand L9 | +EmitMult+EmitPlan+EmitApply+EmitBody; **modules=49** |
| A21 Library seed expand L10 | +KernelEmit+KernelEmitTheorems; **modules=51** |
| A22 Library seed expand L11 | +ParityMult+ParityMultTheorems; **modules=53** |
| A23 Library seed expand L12 | +ParityLinear+ParityLinearTheorems; **modules=55** |
| A24 Library seed expand L13 | +ParityTypes+ParityTypesTheorems; **modules=57** |
| A25 Library seed expand L14 | +ParityProgram+ParityProgramTheorems; **modules=59** |
| A26 Library seed expand L15 | +ParityEmit+ParityEmitTheorems; **modules=61** |
| A27 Library seed expand L16 | +SelfApply+SelfApplyTheorems; **modules=63** |
| A28 Library seed expand L17 | +EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose; **modules=68** |
| A29 Library seed expand L18 | +EmitErasure+EmitExtract+EmitBanner; **modules=71** |
| A30 Library seed expand L19 | +ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems; **modules=75** |
| A31 Library seed expand L20 | +ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems; **modules=81** |
| A32 Library seed expand L21 | +ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems; **modules=87** |
| A33 Library seed expand L22 | +ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems; **modules=93** |
| A34 Library seed expand L23 | +CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems; **modules=101** |
| A35 Library seed expand L24 | +CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems; **modules=107** |
| A36 Library seed expand L25 | +DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems; **modules=113** |
| A37 Library seed expand L26 | +OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems; **modules=121** |
| A38 Library seed expand L27 | +SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems; **modules=127** |
| A39 Library seed expand L28 | +CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems; **modules=133** |
| A40 Library seed expand L29 | +CapableRegenerate+CapableRegenerateTheorems; **modules=135** |
| A41 Library seed expand L30 | +FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots; **modules=139** |
| A42 Library seed expand L31 | +FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems; **modules=142** |
| A43 Library seed expand L32 | +CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract; **modules=153** |
| A44 Library seed expand L33 | +ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront; **modules=157** |
| A45 Library seed expand L34 | +FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit; **modules=165** |
| A46 Library seed expand L35 | +MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText; **modules=176** |
| A47 Library seed expand L36 | +HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin; **modules=183** |
| A48 Library seed expand L37 | +HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite; **modules=187** |
| A49 Library seed expand L38 | +HostPackageWriteTheorems+LlvmProgramText; **modules=189** |
| A50 Library seed expand L39 | +LlvmGraphText+LlvmComposeText; **modules=191** |
| A51 Library seed expand L40 | +SelfApplyFs; **modules=192** |
| A52 Library seed expand L41 | +SelfApplyFsTheorems+InventoryClose+ProductPathBars; **modules=195** |
| A53 Library seed expand L42 | +InventoryCloseTheorems+ProductPath; **modules=197** |
| A54 Library seed expand L43 | +ProductPathTheorems+DualResidual; **modules=199** |
| A55 Library seed expand L44 | +DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems; **modules=206** |
| A56 Check depth deepen | Mult..Types FOUNDATION-KIND-SURFACE; seed stays **206** |
| A57 Check depth deepen continue | IrProgram..HostCompose FOUNDATION-KIND-SURFACE; seed stays **206** |
| A58 Check depth deepen continue | Erasure..Extract FOUNDATION-KIND-SURFACE; seed stays **206** |
| A59 Host library band complete | Product leftover empty; *Main 59 + harness 5 out-of-scope; seed=206 |
| A60 Develop tool inventory closed | Day-to-day candidates empty; claim/diagnostic Lake-only explicit; FullHostElaborateRemains **true** (B2 still open) |
| A61 B2 evidence-held residual closeout | Docs/gates honesty only; no pin flip; product wire GREEN; residual/WATCHER/handoff honest; B2 stays **blocked** evidence-held; DualResidual free **false**; join `.agents/joins/a61-b2-evidence-held-closeout.md`; criteria `.agents/reports/b2-evidence-criteria-2026-08-07.md`; later gates `.agents/reports/validate-gates-a62-2026-08-07.md` |
| A62 B2 still-blocked reconfirm | Inventory agent-doable Open **no**; product wire re-validated GREEN; residual/WATCHER/handoff/plan living tip A62; B2 stays **blocked**; DualResidual free **false**; no pin flip; join `.agents/joins/a62-b2-still-blocked-reconfirm.md`; gates `.agents/reports/validate-gates-a62-2026-08-07.md`; inventory `.agents/reports/impl-a62-checkable-inventory-2026-08-07.md` |

### Layers 2-4 living product tip (preserve)

| Claim | Living tip |
|-------|------------|
| Product residual free | true |
| Freestanding product self-host complete | true |
| Product StillUsesLake / DependsOnLake | false on product path |
| Green `just build` product wire | GREEN without Lake on hot path (preserve; not host free) |
| PROVABLY | claimed true (CompCert seal program closed 2026-08-02; matrix in `just check`) |
| Host elaborator residual free claimed | true (F1 dual-ok; remains false; free claimed true) |
| FullHostElaborateRemains | **false** (A66 B2 dual-ok done; day-to-day cold full Lake retired; F1 does not re-true) |
| proofCompleteClaimed | **true** (Track 4c bar-met + SpecProof lake; not full elaborator parity) |
| llvmUnlocked | true; full LLVM backend / Rust-native link still **held** tracks |

---

## 4. Remaining host work (living queue -- layer 1 program)

Implementable Open after A63 is **Cold elaborate day-to-day use map** (Slice 1
evidence protocol). Pin-flip residual **FullHostElaborateRemains false** (Phase
B2) stays held until E1-E6. Seed / L-band / B1 / A61 honesty /
A62 reconfirm are closed treadmill. Each Name keeps DualResidual unchanged unless
it is A-last. Each Name must preserve layers 2-4 and apply section H on touch
(including markdown in Primary paths).

### Phase L -- Library coverage (closed through L44 / A55; L-band A59 done)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| L1 (done A12) | **Host library seed expand continue** | Grow seed past modules=16 into CompilePath/Kernel band | modules=21 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a12 | Host free; full library in one slice |
| L2 (done A13) | **Host library seed expand continue** | Grow seed past modules=21 into Kernel *Theorems band | modules=25 on measured import-graph + module-check without Lake; theorem corpus 8/8/8/8; HostResidualShrink reseeded; DualResidual unchanged; join a13 | Host free; full library in one slice |
| L3 (done A14) | **Host library seed expand continue** | Grow seed past modules=25 into JoinMap/SelfHost band | modules=29 on measured import-graph + module-check without Lake; theorem corpus +JoinMapTheorems=8+SelfHostTheorems=8; HostResidualShrink reseeded; DualResidual unchanged; join a14 | Host free; full library in one slice |
| L4 (done A15) | **Host library seed expand continue** | Grow seed past modules=29 into SurfaceMatrix band | modules=31 on measured import-graph + module-check without Lake; theorem corpus +SurfaceMatrixTheorems=8; HostResidualShrink reseeded; DualResidual unchanged; join a15 | Host free; full library in one slice |
| L5 (done A16) | **Host library seed expand continue** | Grow seed past modules=31 into Emit Mult..Compose scaffold band | modules=37 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a16 | Host free; full library in one slice |
| L6 (done A17) | **Host library seed expand continue** | Grow seed past modules=37 into Emit Plan/Apply/Body scaffold band | modules=40 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a17 | Host free; full library in one slice |
| L7 (done A18) | **Host library seed expand continue** | Grow seed past modules=40 into Emit Erasure/Extract/Banner scaffold band | modules=43 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a18 | Host free; full library in one slice |
| L8 (done A19) | **Host library seed expand continue** | Grow seed past modules=43 into KernelSelfApply band | modules=45 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a19 | Host free; full library in one slice; KernelEmit (needs Emit product deps) |
| L9 (done A20) | **Host library seed expand continue** | Grow seed past modules=45 into Emit product Mult/Plan/Apply/Body band | modules=49 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a20 | Host free; full library in one slice |
| L10 (done A21) | **Host library seed expand continue** | Grow seed past modules=49 into KernelEmit band | modules=51 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a21 | Host free; full library in one slice |
| L11 (done A22) | **Host library seed expand continue** | Grow seed past modules=51 into ParityMult band | modules=53 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a22 | Host free; full library in one slice |
| L12 (done A23) | **Host library seed expand continue** | Grow seed past modules=53 into ParityLinear band | modules=55 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a23 | Host free; full library in one slice |
| L13 (done A24) | **Host library seed expand continue** | Grow seed past modules=55 into ParityTypes band | modules=57 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a24 | Host free; full library in one slice |
| L14 (done A25) | **Host library seed expand continue** | Grow seed past modules=57 into ParityProgram band | modules=59 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a25 | Host free; full library in one slice |
| L15 (done A26) | **Host library seed expand continue** | Grow seed past modules=59 into ParityEmit band | modules=61 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a26 | Host free; full library in one slice |
| L16 (done A27) | **Host library seed expand continue** | Grow seed past modules=61 into SelfApply band | modules=63 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a27 | Host free; full library in one slice |
| L17 (done A28) | **Host library seed expand continue** | Grow seed past modules=63 into Emit Mult..Compose product band | modules=68 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs held; join a28 | Host free; full library in one slice |
| L18 (done A29) | **Host library seed expand continue** | Grow seed past modules=68 into Emit Erasure/Extract/Banner product band | modules=71 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs held; join a29 | Host free; full library in one slice |
| L19 (done A30) | **Host library seed expand continue** | Grow seed past modules=71 into SelfApplyFs leaf foundation band (ProductOutKernel+BootstrapHonesty + theorems) | modules=75 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (ProductPath/Capable); join a30 | Host free; full library in one slice |
| L20 (done A31) | **Host library seed expand continue** | Grow seed past modules=75 into ProductPath writer pure-leaf band (Surface/PathPlan/PathExec + theorems) | modules=81 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (remaining ProductPath/Capable); join a31 | Host free; full library in one slice |
| L21 (done A32) | **Host library seed expand continue** | Grow seed past modules=81 into ProductPath ownership/perform pure-leaf band (OwnershipInputs/Perform/PerformStep + theorems) | modules=87 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (remaining ProductPath/Capable); join a32 | Host free; full library in one slice |
| L22 (done A33) | **Host library seed expand continue** | Grow seed past modules=87 into ProductPath ReadSsot/ComposePlan + Capable pure-leaf band (ReadSsot/ComposePlan/Capable + theorems) | modules=93 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (remaining ProductPath/Capable); join a33 | Host free; full library in one slice |
| L23 (done A34) | **Host library seed expand continue** | Grow seed past modules=93 into CapableStepContract/InstallOut/OfficialPath/PerformEvidence pure-leaf band | modules=101 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (other deps may remain); join a34 | Host free; full library in one slice |
| L24 (done A35) | **Host library seed expand continue** | Grow seed past modules=101 into CapableRead/CapableCompose/CapableFullBar pure-leaf band | modules=107 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; SelfApplyFs still held (other deps may remain); join a35 | Host free; full library in one slice |
| L25 (done A36) | **Host library seed expand continue** | Grow seed past modules=107 into DualEqWriteCapableGap/ClosePath/Parity pure-leaf band | modules=113 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; DualEqWriteApi skipped (multi-import); join a36 | Host free; full library in one slice |
| L26 (done A37) | **Host library seed expand continue** | Grow seed past modules=113 into OfficialRetire/OwnershipClaimed/PerformClaimed/StepContractFull claim-tip pure-leaf band | modules=121 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a37 | Host free; full library in one slice |
| L27 (done A38) | **Host library seed expand continue** | Grow seed past modules=121 into SelfHostComplete/OfficialPathAlternate/ProductPathOwnershipRegenerate pure-leaf band | modules=127 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a38 | Host free; full library in one slice |
| L28 (done A39) | **Host library seed expand continue** | Grow seed past modules=127 into CapableWriteHcLoad/DualEqWriteLoad/CapableWriteHc/DualEqWriteApi/LlvmHold multi-import band | modules=133 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a39 | Host free; full library in one slice |
| L29 (done A40) | **Host library seed expand continue** | Grow seed past modules=133 into CapableRegenerate multi-import band | modules=135 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a40 | Host free; full library in one slice |
| L30 (done A41) | **Host library seed expand continue** | Grow seed past modules=135 into FreestandingEmitLoad ladder + pure inventory leaves | modules=139 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a41 | Host free; full library in one slice |
| L31 (done A42) | **Host library seed expand continue** | Grow seed past modules=139 into FreestandingEmit + ProductPathWriteHc multi-import band | modules=142 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a42 | Host free; full library in one slice |
| L32 (done A43) | **Host library seed expand continue** | Grow seed past modules=142 into CompilePath* unit multi-import band | modules=153 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a43 | Host free; full library in one slice |
| L33 (done A44) | **Host library seed expand continue** | Grow seed past modules=153 into preferred ProductWireWriteTool/HostTerm/LlvmEmitPath/SubsetFront band | modules=157 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a44 | Host free; full library in one slice |
| L34 (done A45) | **Host library seed expand continue** | Grow seed past modules=157 into FirstSurface + unit SubsetEmit band | modules=165 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a45 | Host free; full library in one slice |
| L35 (done A46) | **Host library seed expand continue** | Grow seed past modules=165 into MultSubsetEmit + unit *SubsetRebuild + HostFront + LlvmMultText | modules=176 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a46 | Host free; full library in one slice |
| L36 (done A47) | **Host library seed expand continue** | Grow seed past modules=176 into HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin | modules=183 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a47 | Host free; full library in one slice |
| L37 (done A48) | **Host library seed expand continue** | Grow seed past modules=183 into HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite | modules=187 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a48 | Host free; full library in one slice |
| L38 (done A49) | **Host library seed expand continue** | Grow seed past modules=187 into HostPackageWriteTheorems+LlvmProgramText | modules=189 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a49 | Host free; full library in one slice |
| L39 (done A50) | **Host library seed expand continue** | Grow seed past modules=189 into LlvmGraphText+LlvmComposeText | modules=191 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged; join a50 | Host free; full library in one slice |
| L40 (done A51) | **Host library seed expand continue** | Grow seed past modules=191 into SelfApplyFs dedicated | modules=192 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged (free false); join a51 | Host free; DualResidual free flip; full library in one slice |
| L41 (done A52) | **Host library seed expand continue** | Grow seed past modules=192 into SelfApplyFsTheorems+InventoryClose+ProductPathBars | modules=195 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged (free false); join a52 | Host free; DualResidual free flip; full library in one slice |
| L42 (done A53) | **Host library seed expand continue** | Grow seed past modules=195 into InventoryCloseTheorems+ProductPath | modules=197 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual unchanged (free false); join a53 | Host free; DualResidual free flip; full library in one slice |
| L43 (done A54) | **Host library seed expand continue** | Grow seed past modules=197 into ProductPathTheorems+DualResidual | modules=199 on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual free false; join a54 | Host free; DualResidual free flip; full library in one slice |
| L44 (done A55) | **Host library seed expand continue** | Grow seed past modules=199 into DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems | modules=206 full product library on measured import-graph + module-check without Lake; HostResidualShrink reseeded; DualResidual free false; join a55 | Host free; DualResidual free flip; *Main seed; mathlib |
| T2 (done A56) | **Check depth deepen** | Stronger check bar on Mult..Types (FOUNDATION-KIND-SURFACE) | Named deepen green; modules seed stays 206; DualResidual free false; hygiene green; join a56 | Host free; DualResidual free flip; invent *Main seed |
| T2b (done A57) | **Check depth deepen continue** | Extend FOUNDATION-KIND-SURFACE into IrProgram..HostCompose | Named band green; modules seed stays 206; DualResidual free false; hygiene green; join a57 | Host free; DualResidual free flip; invent *Main seed |
| T2c (done A58) | **Check depth deepen continue** | Extend FOUNDATION-KIND-SURFACE into Erasure..Extract | Named band green; modules seed stays 206; DualResidual free false; hygiene green; join a58 | Host free; DualResidual free flip; invent *Main seed |
| L-band (done A59) | **Host library band complete** | Measured set covers all day-to-day develop modules residual names as "in checklist" | Inventory of remaining Lake-only product library modules empty; *Main (59) + harness (5) explicit out-of-scope; seed=206; join a59 | Mathlib; *Main seed theater; DualResidual free flip |

**Scale honesty:** disk partition seed **206** + *Main **59** + harness **5** =
**270** `SystemsLean/*.lean`. PARTIAL-STRUCTURAL seed closed is progress, not
finish. Do not claim "Slake does everything Lake does" while FullHostElaborateRemains
is true and host free is false.

### Phase T -- Theorem and check depth (interleave with L as needed)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| T1 | **Theorem corpus for new seed modules** | *Theorems for newly covered modules on the same without-Lake path | Required decl corpus green for those modules | proofCompleteClaimed flip |
| T2 (done A56) | **Check depth deepen** | Mult..Types FOUNDATION-KIND-SURFACE (structure/axiom + expanded theorems) | Named deeper bar documented and green; join a56 | Fake "full elaborator" slogan |
| T2b (done A57) | **Check depth deepen continue** | Extend same kind-surface bar into IrProgram..HostCompose | Named band green under same honesty ceiling; join a57 | Fake "full elaborator" slogan |
| T2c (done A58) | **Check depth deepen continue** | Extend same kind-surface bar into Erasure..Extract | Named band green under same honesty ceiling; join a58 | Fake "full elaborator" slogan |

Default: theorems stay **in** the long checklist. Linear / ownership theorems
are preferred when a band is about Mult/Linear safety (layer 2), not only
presence greps.

### Phase B -- Bootstrap / tool residual (mostly done; finish honesty)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| B1 (done A60) | **Develop tool inventory closed** | Every day-to-day host tool is owned or carved out | HostResidualShrink day-to-day list empty **and** claim/diagnostic Lake-only list explicit | Delete Lake binary theater |
| B2 | **FullHostElaborateRemains false** | Only when library day-to-day no longer needs cold full Lake | **done** A66 dual-ok pin false + evidence + residual honesty | Flip early while seed is tiny |

B2 is **not** the same as DualResidual free. Free is A-last after full checklist.

**Host path classes (living; Part 6 re-verify 2026-08-08):**

| Class | Role | Lake on step? |
|-------|------|---------------|
| Day-to-day without-Lake | Normal host develop (roots, import-graph, module-check, package write, foundation/develop tools, product wire) | **no** hot path |
| One-shot Lake recovery (A65) | After trash of `.lake` only: cold `lake build` once, then clean-bootstrap `leanc` relink | **yes** wipe-bootstrap only |
| Claim-proof lake | Claim-bool flips while Lake is host elaborator (`AGENTS.md` lake-on-PATH) | **yes** claim/diagnostic only |

Measure numbers: Phase M note
`doc/dev/research/hot-cold-benchmarks-2026-08-08.md` (without-Lake suite + hot Lake +
cold Lake cite + A65). Re-verify:
`.agents/reports/impl-part6-phase-b-reverify-2026-08-08.md`. Do **not** re-true
FullHost.

### Phase F -- Host free claim (A-last only)

| Order | Name | Goal | Done when | Out of scope |
|------:|------|------|-----------|--------------|
| F0 | **Free checklist inventory refresh** | Post-A66 living gap vs section 2 + design section 4 | **done** 2026-08-07; note `doc/dev/research/host-residual-free-bar-inventory-2026-08-07.md`; DualResidual unchanged | Free pin flip; re-true FullHostElaborateRemains |
| F0b | **Host free dual-ok design** | Specify DualResidual + HostResidualShrink fold changes for free | **done** 2026-08-07; note `doc/dev/research/host-free-dual-ok-design-2026-08-07.md`; free still false | Free pin flip; product free re-open |
| F1 | **Host residual free claim** | Flip DualResidual only when section 2 checklist met under choice (a) + F0b dual-ok | **done** 2026-08-07; remains false; free claimed true; free-shape dual-ok; lake elaborator proof; residual + surface-matrix lockstep; layers 2-4 still honest; report `.agents/reports/impl-f1-dualresidual-free-claim-2026-08-07.md` | Re-open product free; forge llvm / PROVABLY |

### Phase V -- Validation continuity (not a substitute for L; do not drop)

| Order | Name | Goal | When |
|------:|------|------|------|
| V1 | **Preserve freestanding product wire** | No host slice rewrites product C by hand or re-introduces managed runtime on product path | Every L/T/B/F slice |
| V2 | **Preserve CompCert honesty** | Do not weaken PROVABLY; if a surface needs more seal evidence, open a **named** residual -- do not silently skip ccomp | When product wire or seal surface changes |
| V3 | **Linear discipline on new host modules** | New seed modules keep Mult/Linear honesty; do not grow unrestricted soup as "progress" | When seed expands into Mult/Linear/ownership bands |

### Phase H -- already defined above (H0 standing; H1/H2 optional)

### Supporting (not a substitute for L/T/B/F)

| Name | Status |
|------|--------|
| Multi-language print / host-cc helpers | Done (P0/P1); do not re-open as finish line |
| Long-file splits | HostModuleCheck family **done**; HostImportGraph H-opt **done**; further long-file splits only on-touch or operator Open (standing headroom on FixtureTextsLater / Walk / LoadOk) |
| LLVM / proof complete / superset | Separate tracks; proof complete Track 4c **done**; full LLVM / R2 dual remain optional or held |

---

## 5. Immediate next (F1 free claim done; hygiene long-file splits done; operator program D..P closed; Open empty done-for-now)

**Living tip one-line (2026-08-08 Phase P close):** DualResidual free claim **done** (host residual
free dual-ok; remains false; free true; FullHost false; report
`.agents/reports/impl-f1-dualresidual-free-claim-2026-08-07.md`). Proof complete
Track 4c **done**. HostModuleCheck family Sub-1-KLOC **done**. HostImportGraph
long-file split **done** (tip 4875->43; harness 20->28). Operator program
D/M/C/B/L/P **closed** (Phase P report
`.agents/reports/impl-phase-p-inventories-polish-2026-08-08.md`). Open empty
(done-for-now under free bar choice (a)). Standing stop rules (not Open Names):
FixtureTextsLater ~999; HostImportGraphWalk ~999 / LoadOk ~995; on-touch Sub-1-KLOC.
Held (operator promote): full elaborator parity / Full LLVM / Rust-native / mathlib.
Optional held Opens only with operator promote: R1a/R1b, further duals, full
backend, Rust-native.

### 5.1 Slice 1 -- Cold elaborate day-to-day use map (**done** A64)

Research note `doc/dev/research/cold-elaborate-day-to-day-use-map-2026-08-07.md`;
join `.agents/joins/a64-cold-elaborate-use-map.md`.

### 5.1a Slice 2 -- Wipe recovery bootstrap evidence (**done** A65)

Research note `doc/dev/research/wipe-recovery-bootstrap-evidence-2026-08-07.md`;
join `.agents/joins/a65-wipe-recovery-bootstrap-evidence.md`. E4 Met-documented
(not Met-measured-total-wipe). Matrix + probes exit codes on disk.

### 5.1b Pin-flip residual (implementable Open -- after E1-E6)

**Name:** FullHostElaborateRemains false (plan Phase B2 / Slice 4) -- **done A66**

| Field | Content |
|-------|---------|
| Goal | Set FullHostElaborateRemains false only with real evidence that cold full Lake under `src/systems/` is bootstrap-only for day-to-day host develop |
| Done when | Written E1-E6 evidence + pin false dual-ok in HostResidualShrink + residual honesty; DualResidual free stays false; free/complete/PROVABLY and product Lake pins unchanged; lake elaborator proof while Lake is host elaborator; `just hygiene` green |
| Ready when | Slice 1 use map + Slice 2 wipe recovery land E1-E6 (**met** with E4 Met-documented + E5a; optional Slice 3 if operator rejects E5a) |
| Out of scope | DualResidual free flip; delete Lake binary theater; forge pin false; invent *Main seed; re-open seed/L-band/B1 theater |
| Primary paths | `HostResidualShrink.lean`, residual, WATCHER, handoff, this plan |
| Prior joins | a65 wipe recovery; a64 use map; a62 reconfirm; a61 honesty; a60 B1; a63 Slice 1 open |
| Criteria report | `.agents/reports/b2-evidence-criteria-2026-08-07.md` |

**WATCHER posture:** DONE-FOR-NOW (program D..P closed). Do **not** invent free
forge. Do **not** re-true FullHost. F1 free dual-ok **done**. A66 / F0 / F0b
**done**. Mult SSA partial **done**. Standing headroom stop rules only (not auto
Open). Do **not** auto-open held R1/R2/R3 Full LLVM.

### 5.2 Ranked highest-value next

| Rank | Work | Why |
|-----:|------|-----|
| **done** | DualResidual free claim (F1) | Free dual-ok + lake proof; remains false / free true |
| **done** | Host free dual-ok design (F0b) | Ready/surfacesDistinct/doesNotForgeHostFree redesign specified |
| **done** | Free checklist inventory refresh (F0) | Post-A66 living inventory; section-2 + section-4 reseed |
| **done** | FullHostElaborateRemains false (Slice 4 A66) | Pin false dual-ok; E1-E6 + lake proof |
| **done** | Cold elaborate day-to-day use map (Slice 1 A64) | Recipe partition + E1-E7 |
| **done** | Wipe recovery bootstrap evidence (Slice 2 A65) | E4 Met-documented; cold Lake one-shot bootstrap contract |
| **done** | Proof complete residual (Track 4c) | proofCompleteClaimed true + bar-met + lake |
| **done** | Full elaborator parity design (R1) | Design only; parity claim still held |
| **done** | HostModuleCheck family Sub-1-KLOC | All HostModuleCheck*.lean under 1000; harness 8->20 |
| **done** | HostImportGraph long-file split (H-opt) | Tip 4875->43; harness 20->28; gates green |
| **standing** | Headroom stop rules | FixtureTextsLater ~999; Walk ~999; LoadOk ~995; on-touch Sub-1-KLOC |
| **held** | Full elaborator parity / Full LLVM / Rust-native / mathlib | Operator promote only |
| **optional** | R2 dual / R3 backend follow-on / R1a-R1b / R5 CompCert | Open only with checkable Done when |

### 5.3 Self-validation loops (agents run without claim inflation)

| Check | Expected during Slice 4 |
|-------|-------------------------|
| `just hygiene` | GREEN after novel prose/source edits |
| Without-Lake matrix | Still GREEN; documents E2 living tree |
| Pin greps / `just host-residual-shrink` | After F1: FullHostElaborateRemains **false**; host free claimed **true**; remains **false**; seed **206** greppable |
| Claim recipes | Lake elaborator proof on pin flip while Lake is host elaborator |

### 5.4 Chain status

1. Slice 1 use map **done** A64.
2. Slice 2 wipe recovery **done** A65 (E4 Met-documented).
3. Optional Slice 3 check-depth if accept criteria require deeper HostModuleCheck
   (default free bar accepts E5a; not required for F1).
4. Slice 4 pin false dual-ok **done** A66 with E1-E6 written.
5. Free checklist inventory refresh **done** F0 (post-A66 living inventory).
6. Host free dual-ok design **done** F0b.
7. DualResidual free claim **done** (F1 free dual-ok + lake proof).
8. Open empty done-for-now under free bar choice (a).

Do **not** re-open FullHostElaborateRemains true. Do **not** re-open product free
without new evidence.

---

## 5b. Root Lake monorepo workspace (additive; not a product claim)

| Path | Role |
|------|------|
| Root `lakefile.lean` | Thin umbrella package **`Iso`** |
| Root `lean-toolchain` | `leanprover/lean4:v4.32.0` |
| Root `lake-manifest.json` | Path deps **SystemsLean** (`src/systems`) + **SystemsLeanLean4** (`src/lean4`) |

Product package name stays **SystemsLean**. Root umbrella is host workspace
convenience only -- not freestanding product claim and not DualResidual free.
Report: `.agents/reports/root-lake-workspace.md`.

---

## 6. Architecture defaults (keep)

1. Six-unit path remains measured regression harness under
   `src/systems/goldens/`.
2. Hybrid: real `.lean` paths for import graph + PARTIAL-STRUCTURAL (or deeper)
   check on a growing seed; dialect harness stays for Mult..Compose shaped
   fixed examples.
3. Prefer smallest extension that covers the next named real modules.
4. Same-job wall-clock only; never cold full Lake vs Mult package write as a win.
5. Three C stories stay separate: classic Lake ahead-of-time under `.lake/`,
   freestanding product C under `emit/` / `out/freestanding-c`, novel string-
   printed temporary helpers (retired for host-cc).
6. **Safety story:** linear/affine + Mult 0/1/omega -- not GC on product wire.
7. **Validation story:** freestanding C is CompCert-oriented; real `ccomp` is
   how PROVABLY / seal stays honest -- not vibes.
8. **Language story:** section H; plain English; gradual on-touch scrub including
   markdown; gates via `just hygiene`.

---

## 7. What not to do

- Do not re-narrow the living finish line to Mult..Compose only.
- Do not say "Slake does everything Lake does" is true while claim evidence is
  false; say **the living program is that goal** and **the claim is still false**.
- Do not treat host Lake replacement as unrelated to linear types, freestanding
  C, or CompCert validation.
- Do not empty Open with done-for-now while L/T/B/F remain.
- Do not flip DualResidual or FullHostElaborateRemains early.
- Do not grow product C or shell as elaborator progress.
- Do not forge free / complete / PROVABLY / product Lake pins.
- Do not re-open PROVABLY false just to "re-validate" without evidence of
  regression.
- Do not skip hygiene on markdown because "this is only a residual edit."
- Do not bulk find-and-replace jargon across the tree.
- Do not re-list professional-tone banned tokens in novel markdown.

---

## 8. Critical files

| Path | Role |
|------|------|
| `.agents/plans/plan-slake-replaces-lake.md` | Durable program (sync on approve) |
| `AGENTS.md` | Hygiene + plain English + product names SSoT |
| `nix/source-hygiene.nix`, `nix/professional-tone.nix` | Pure gates |
| `doc/goals.md` | North star + host finish line + CompCert path |
| `doc/vocabulary.md`, `doc/ascii-symbol-map.md` | Terms + ASCII spellings |
| `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md` | Open queue + next action (markdown hygiene on touch) |
| `doc/SESSION-HANDOFF.md` | Reseed (markdown hygiene on touch) |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | Lake job map + stages |
| `src/systems/SystemsLean/HostImportGraph.lean` | Real import seed |
| `src/systems/SystemsLean/HostModuleCheck*.lean` | Real module structural check |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Coverage inventory pins |
| `src/systems/SystemsLean/DualResidual.lean` | Host free pins (A-last only) |
| `src/systems/SystemsLean/Mult.lean`, `Linear.lean` | Linear / Mult safety core (layer 2) |
| `src/systems/emit/`, `out/freestanding-c/` | Freestanding product C (layer 3) |
| CompCert / PROVABLY living maps | Layer 4 honesty (self-host / residual Done) |
| `src/systems/self-host.md` | Living host + product tip |
| `.agents/joins/a11-host-real-module-seed-expand.md` | Last library seed join |
| `just/host-without-lake.just`, `just/host.just` | Measured without-Lake recipes |

---

## 9. Reuse

- Growing seed pattern from A4-A11 (filterSeedImports, expandSliceName,
  HostResidualShrink reseed)
- Clean-bootstrap leanc path for foundation / develop tools (A8-A10+++)
- Dual residual claim machinery
- Pure Nix presence + hygiene gates
- Design note L1-L10 map
- Existing freestanding emit + CompCert PROVABLY evidence paths (preserve)
- AGENTS plain-English and professional-tone rules (do not fork a second policy)

---

## 10. Steps after approve

### Step 1 -- Plan and status lockstep (docs only; DualResidual unchanged)

- Living tip through **A62** B2 still-blocked reconfirm; A1-A61 product/host +
  honesty done; residual Open primary FullHostElaborateRemains false (B2
  **blocked** evidence-held); WATCHER BLOCKED (no `/implement` token);
  join `.agents/joins/a62-b2-still-blocked-reconfirm.md`.
- Scrub living residual/WATCHER lines on touch if they need plain English
  (no archive rewrite).
- Do not forge B2 or DualResidual free.
- `just hygiene` green after prose edits.

### Step 2 -- Implement L1 / L2 / L3 / L4 / L5 / L6 / L7 / L8 / L9 (done)

- L1 A12: CompilePath/Kernel band; modules=21; join a12.
- L2 A13: Kernel *Theorems band; modules=25; join a13.
- L3 A14: JoinMap/SelfHost band; modules=29; join a14.
- L4 A15: SurfaceMatrix band; modules=31; join a15.
- L5 A16: Emit Mult..Compose scaffold band; modules=37; join a16.
- L6 A17: Emit Plan/Apply/Body scaffold band; modules=40; join a17.
- L7 A18: Emit Erasure/Extract/Banner scaffold band; modules=43; join a18.
- L8 A19: KernelSelfApply + KernelSelfApplyTheorems band; modules=45; join a19.
- L9 A20: EmitMult + EmitPlan + EmitApply + EmitBody band; modules=49; join a20.
- L10 A21: KernelEmit + KernelEmitTheorems band; modules=51; join a21.
- L11 A22: ParityMult + ParityMultTheorems band; modules=53; join a22.
- L12 A23: ParityLinear + ParityLinearTheorems band; modules=55; join a23.
- L13 A24: ParityTypes + ParityTypesTheorems band; modules=57; join a24.
- L14 A25: ParityProgram + ParityProgramTheorems band; modules=59; join a25.
- L15 A26: ParityEmit + ParityEmitTheorems band; modules=61; join a26.
- L16 A27: SelfApply + SelfApplyTheorems band; modules=63; join a27.
- L17 A28: EmitLinear + EmitTypes + EmitProgram + EmitGraph + EmitCompose band; modules=68; join a28. SelfApplyFs held (ProductPath/Capable deps).
- L18 A29: EmitErasure + EmitExtract + EmitBanner band; modules=71; join a29. SelfApplyFs held (ProductPath/Capable deps).
- L19 A30: ProductOutKernel + ProductOutKernelTheorems + BootstrapHonesty + BootstrapHonestyTheorems band; modules=75; join a30. SelfApplyFs still held (ProductPath/Capable deps remain).
- L20 A31: ProductPathWriterSurface + ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan + ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec + ProductPathWriterPathExecTheorems band; modules=81; join a31. SelfApplyFs still held (remaining ProductPath/Capable deps).
- L21 A32: ProductPathOwnershipInputs + ProductPathOwnershipInputsTheorems + ProductPathPerform + ProductPathPerformTheorems + ProductPathPerformStep + ProductPathPerformStepTheorems band; modules=87; join a32. SelfApplyFs still held (remaining ProductPath/Capable deps).
- L22 A33: ProductPathReadSsot + ProductPathReadSsotTheorems + ProductPathComposePlan + ProductPathComposePlanTheorems + Capable + CapableTheorems band; modules=93; join a33. SelfApplyFs still held (remaining ProductPath/Capable deps).
- L23 A34: CapableStepContract + CapableStepContractTheorems + InstallOut + InstallOutTheorems + OfficialPath + OfficialPathTheorems + PerformEvidence + PerformEvidenceTheorems band; modules=101; join a34. SelfApplyFs still held (other deps may remain).
- L24 A35: CapableRead + CapableReadTheorems + CapableCompose + CapableComposeTheorems + CapableFullBar + CapableFullBarTheorems band; modules=107; join a35. SelfApplyFs still held (other deps may remain).
- L25 A36: DualEqWriteCapableGap + DualEqWriteCapableGapTheorems + DualEqWriteClosePath + DualEqWriteClosePathTheorems + DualEqWriteParity + DualEqWriteParityTheorems band; modules=113; join a36. DualEqWriteApi skipped. SelfApplyFs still held (other deps may remain).
- L26 A37: OfficialRetire + OfficialRetireTheorems + OwnershipClaimed + OwnershipClaimedTheorems + PerformClaimed + PerformClaimedTheorems + StepContractFull + StepContractFullTheorems band; modules=121; join a37.
- L27 A38: SelfHostComplete + SelfHostCompleteTheorems + OfficialPathAlternate + OfficialPathAlternateTheorems + ProductPathOwnershipRegenerate + ProductPathOwnershipRegenerateTheorems band; modules=127; join a38. Preferred SelfApplyFs pure leaves seeded.
- L28 A39: CapableWriteHcLoad + DualEqWriteLoad + CapableWriteHc + DualEqWriteApi + LlvmHold + LlvmHoldTheorems multi-import band; modules=133; join a39. RealMod edges use full on-disk emit product stack (not empty multi-import). CapableRegenerate fully seedable next (deps CapableRead/Compose/WriteHc/InstallOut all seeded). ProductPathWriteHc still needs FreestandingEmit.
- L29 A40: CapableRegenerate + CapableRegenerateTheorems multi-import band; modules=135; join a40. RealMod edges list CapableRead+CapableCompose+CapableWriteHc+InstallOut (match on-disk). ProductPathWriteHc still needs FreestandingEmit.
- L30 A41: FreestandingEmitLoad + FreestandingEmitLoadScaffold + LakeRetireInventory + HostPackageRoots; modules=139; join a41. Emit load pure leaf + scaffold parent + two pure inventory leaves. FreestandingEmit now seed-closed. ProductPathWriteHc still needs FreestandingEmit.
- L31 A42: FreestandingEmit + ProductPathWriteHc + ProductPathWriteHcTheorems; modules=142; join a42. FreestandingEmit multi-import Load+Scaffold+emit product stack; ProductPathWriteHc imports FreestandingEmit; theorems parent only.
- L32 A43: CompilePathMult + CompilePathLinear + CompilePathTypes + CompilePathProgram + CompilePathGraph + CompilePathCompose + CompilePathPlan + CompilePathApply + CompilePathBody + CompilePathErasure + CompilePathExtract; modules=153; join a43. Unit multi-import CompilePath+Emit*; Extract depends Mult+Program.
- L33 A44: ProductWireWriteTool + HostTerm + LlvmEmitPath + SubsetFront; modules=157; join a44. Preferred seed-closed multi/pure leaves; honest RealMod edges.
- L34 A45: FirstSurface + Linear/Types/Program/Graph/Compose/Erasure/Extract SubsetEmit; modules=165; join a45. Unit SubsetEmit + FirstSurface band.
- L35 A46: MultSubsetEmit + MultSubsetRebuild + Linear/Types/Program/Graph/Compose/Erasure/Extract SubsetRebuild + HostFront + LlvmMultText; modules=176; join a46.
- L36 A47: HostFrontTheorems + HostCheck + HostGraph + LlvmLinearText + MultFsWriteTool + FrontMultPackage + SubsetPackageJoin; modules=183; join a47. Preferred seed-closed band after HostFront/LlvmMultText/unit SubsetRebuild; SelfApplyFs deferred.
- L37 A48: HostGraphTheorems + LlvmTypesText + MultFsDeepen + HostPackageWrite; modules=187; join a48. Preferred seed-closed band after HostGraph/LlvmLinearText/MultFsWriteTool/unit SubsetEmit; SelfApplyFs deferred.
- L39 A50: LlvmGraphText + LlvmComposeText; modules=191; join a50. Preferred light llvm ladder complete.
- L40 A51: SelfApplyFs dedicated; modules=192; full honest 39-edge package imports; join a51. DualResidual free unchanged false.
- L41 A52: SelfApplyFsTheorems + InventoryClose + ProductPathBars; modules=195; join a52. Preferred seed-closed after SelfApplyFs; DualResidual free unchanged false.
- L42 A53: InventoryCloseTheorems + ProductPath; modules=197; join a53. Preferred seed-closed after ProductPathBars; DualResidual free unchanged false.
- L43 A54: ProductPathTheorems + DualResidual; modules=199; join a54. Preferred ProductPathTheorems + DualResidual PARTIAL-STRUCTURAL free false; host free unchanged false.
- L44 A55: DualResidualTheorems + ProbeWire + SelfHostBody + ProbeWireTheorems + SelfHostBodyTheorems + SpecProof + SpecProofTheorems; modules=206 full product library; DualResidual free false; join a55.
- L38 A49: HostPackageWriteTheorems + LlvmProgramText; modules=189; join a49. Preferred light seed-closed band; SelfApplyFs deferred; LlvmGraphText now seed-closed.
- Product free/complete/PROVABLY and DualResidual preserved.

### Step 3+ -- T2 / L-band / B1 / A61 honesty (done A56-A61)

- T2 A56..A58: FOUNDATION-KIND-SURFACE Mult..Extract; seed stayed 206.
- L-band A59: Host library band complete; leftover empty; *Main/harness out-of-scope.
- B1 A60: Develop tool inventory closed; day-to-day empty.
- A61: B2 evidence-held residual closeout (docs/gates; no pin flip; product wire
  GREEN; residual/WATCHER/handoff honest).
- DualResidual free stayed false throughout.
- H0 on every slice.

### Step 4 -- B2 when library day-to-day no longer needs cold full Lake

- FullHostElaborateRemains false with evidence only. WATCHER stays BLOCKED
  until evidence or operator names a checkable slice. No forge. Seed/T deepen
  already done; do not re-open as default treadmill.

### Step 5 -- F1 Host residual free claim

- Only when section 2 checklist is met; layers 2-4 still honest; living docs
  still plain English.

### Continuous -- Phase V + Phase H0

- Every slice: freestanding wire + CompCert honesty + linear discipline +
  hygiene on touch including markdown.

---

## 11. Risks

| Risk | Mitigation |
|------|------------|
| Agents treat "living program true" as "claim true" | Explicit two-column language: program vs claim |
| Agents treat "replace Lake" as only tooling | Section 0 four-layer chain first |
| Re-park after one more seed band | Repeat L2+ until checklist; ban empty Open |
| Underestimate ~271 modules | Named bands; modules count in every join |
| PARTIAL-STRUCTURAL sold as full elaborate | Honesty tokens; T2 deepen separate |
| Free flip early | A-last only; lake proof required |
| Host work regresses freestanding / PROVABLY | Phase V preserve rules; no product C hand-author |
| Linear story diluted | Mult 0/1/omega + no GC product wire hard rules |
| Jargon returns / markdown ignored | Section H; hygiene gate; markdown in Primary paths |
| Bulk jargon rewrite burns the loop | Gradual on-touch only; no mass replace |

---

## 12. How we know green

| Slice | Green means |
|-------|-------------|
| Step 1 docs | Durable plan + residual/WATCHER say living program = full Lake-job ownership; claim still false; full goal chain + hygiene section present; Open non-empty; `just hygiene` green |
| Each L slice | without-Lake import-graph + module-check green; modules count grew; DualResidual unchanged; product free/complete/PROVABLY unchanged; hygiene green; living prose touched is plain English |
| B2 | FullHostElaborateRemains false with evidence; still not free unless F1 |
| F1 | DualResidual flip + lake proof + residual/surface-matrix lockstep; layers 2-4 still honest |
| Phase V | No product wire forge; no PROVABLY forge; no GC product path |
| Phase H | No new decoder-ring living lines; markdown not exempt; no bulk rewrite theater |

Behavior slices: observed red for the named contract first, then smallest fix,
then same check green. Claim flips need real host elaborator proof while Lake
still elaborates remaining modules.

---

## 13. Defaults if you approve without notes

1. Free checklist = full SystemsLean host develop (choice a).
2. Theorems in the long checklist.
3. Hybrid real-module seed + dialect harness; not mathlib day one.
4. Next work = DualResidual free **held A-last** after full free checklist.
   B2 FullHostElaborateRemains false is **done** (A66). Seed expand and
   Mult..Extract FOUNDATION-KIND-SURFACE deepen are **already done**. Do **not**
   auto-forge free or re-open seed/T as default.
5. Full goal chain (Systems Lean + linear + freestanding C + CompCert validate)
   is standing law; layer 1 is the open host program.
6. Hygiene: H0 standing on every slice including markdown; no tree-wide jargon
   campaign; H1 only if living surfaces still need a short prose pass.
7. Other tracks continue but do not replace this program.
8. WATCHER stays **BLOCKED** (no `/implement` free forge token) until full free
   checklist evidence or an operator-named free-checklist residual.

Revise in freeform chat if any default is wrong.

---

## 14. Success for this plan refresh only

- The status row is fixed: claim false, **living work program true**.
- Full goal chain is explicit: Slake owns Lake jobs **in Systems Lean with
  linear types**, emits **safe freestanding C**, and **CompCert `ccomp`
  validates** the model.
- Hygiene is prominent: point to `AGENTS.md` + pure Nix gates; gradual on-touch
  jargon scrub **includes markdown**; no bulk rewrite substitute for layer 1.
- Durable plan and residual cannot honestly say "not the living work program."
- Living tip through **A66**: A1-A65 product/host + honesty + evidence done; A66
  B2 FullHostElaborateRemains false dual-ok done; DualResidual free stays false
  (A-last; not auto-forge).
- No forged free / complete / PROVABLY / DualResidual free changes.

---

## Critical files for implementation

- `.agents/plans/plan-slake-replaces-lake.md` -- durable program sync
- `AGENTS.md` -- hygiene and plain-English SSoT
- `nix/source-hygiene.nix`, `nix/professional-tone.nix` -- gates
- `doc/goals.md` -- north star + optional goal-chain tip
- `doc/vocabulary.md`, `doc/ascii-symbol-map.md`
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
- `src/systems/SystemsLean/HostImportGraph.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean` (+ Fixtures / Theorems)
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/DualResidual.lean` -- do not flip until F1
- `src/systems/SystemsLean/Mult.lean`, `Linear.lean` -- linear safety core
- `src/systems/emit/`, `out/freestanding-c/` -- freestanding product C
- `doc/dev/research/full-host-elaborator-design-2026-08-03.md`
- `.agents/joins/a66-full-host-elaborate-remains-false.md` -- latest B2 pin false join
- `.agents/joins/a65-wipe-recovery-bootstrap-evidence.md` -- E4 Met-documented
- `.agents/joins/a64-cold-elaborate-use-map.md` -- Slice 1 use map
- `.agents/joins/a61-b2-evidence-held-closeout.md` -- prior honesty join (B2 held)
- `.agents/joins/a60-develop-tool-inventory-closed.md` -- prior B1 close
