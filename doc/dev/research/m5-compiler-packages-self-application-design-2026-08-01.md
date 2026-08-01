# M5 compiler packages self-application design

Kind: analysis only. Not residual flip. Not product claim. Not implement.
ASCII only. Date: 2026-08-01.

Living tip at design time:

| What | Status |
|------|--------|
| Claim B complete | true |
| Claim A free | true |
| StillUsesLake / DependsOnLake | true (must stay true until M6) |
| Mult S0-S3 under Lake (M0) | done |
| M1 unit surfaces (Linear..Compose emit/rebuild) | done |
| M2 Mult without-Lake (Name A + Name B full Path A) | done (freestandingDriverComplete true; product Lake remains) |
| M3 subset language front-end | done (SubsetFront / just subset-front; goldens G1/G2 + B1-B3) |
| M4 product-wire without-Lake (Name A/B/C) | done (just build prefers Name B else Name A; no lake on hot path) |
| M5 compiler packages self-application | **design only here** |
| S4 / M6 Lake retire | deferred |
| Step 4 PROVABLY / LLVM | held |

Plan: `.agents/plans/plan-residual-free-freestanding.md` ideal ladder **M5**.
Related cites:

- `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md` (SubsetFront; Mult unit ordered IR; design -> implement Done when shape)
- `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md` (M4 Name A prebuilt / B freestanding writer / C official build; honesty matrix)
- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` (M2 operational without-Lake + honesty)
- `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md` (prebuilt vs non-Lake-built ELF)
- `doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md` (cold wall vs product just build)
- Host: `SystemsLean/SubsetFront.lean`, `*SubsetEmit.lean`, `*SubsetRebuild.lean` (Mult..Compose),
  Mult without-Lake pins, product-wire M4 pins
- Self-host map: `src/systems/self-host.md` Bootstrap / ideal ladder rows
- Process glue: root `justfile` (per-unit `*-subset-emit` / `*-subset-rebuild`,
  `subset-front`, `mult-subset-rebuild-without-lake`, `build` product wire)

---

## 1. Why M5 (gap after M1 / M3 / M4)

M1 closed **per-unit** emit and rebuild for eight unit surfaces under Lake.
M2 closed Mult measured steps without Lake on the hot path (rebuild prebuilt +
freestanding Mult package writer). M3 closed a real Mult subset language
front-end (parse/check goldens, not only fixed Mult fixtures). M4 closed the
**full freestanding product wire** regenerate without Lake on the official
`just build` hot path (Name A prebuilt, Name B host-cc writer, Name C wire-up).

What remains for ideal **M5** is **end-to-end self-application of the compiler
surface**: Slake rebuilds its **own compiler packages** from **subset sources**,
as one measured join, not eight separate residual treadmill slices.

| Surface already closed | Still missing for M5 |
|------------------------|----------------------|
| Per-unit emit/rebuild (M1 Mult..Compose) | One measured **join** that rebuilds the compiler package set together |
| Mult without-Lake (M2) | Non-Mult units still Lake-hosted rebuild only (`*WithoutLakeFinishedClaimed` false except Mult) |
| SubsetFront Mult IR parse/check (M3) | Front-end **not** wired as the measured driver of package emit/rebuild |
| Product wire without-Lake (M4) | Product dialect is **not** the unit package set; M4 does not rebuild `slake_*_subset` packages from subset sources |

**Plan M5 success shape:** measured end-to-end path where subset sources drive
rebuild of Slake compiler packages (unit package surfaces that compose the
compiler), with dual evidence, while product StillUsesLake / DependsOnLake stay
**true** until M6.

M5 does **not** mean: StillUsesLake false, full elaborator retire (M6/S4),
PROVABLY, llvm, free/complete re-open, hand-authored product C, or re-doing
M1 unit-by-unit residual theater under a new Name.

---

## 2. Inventory: subset packages vs full product wire

### 2.1 Compiler surface unit packages (M1 + Mult S2/S3)

These are the **compiler packages** M5 cares about. Each is a freestanding C
unit package under `src/systems/emit/`, written by a named host emit path and
re-validated by a named rebuild path. They are **not** the full freestanding
dialect product wire.

| Unit | Package paths | Emit host / just | Rebuild host / just | withoutLakeFinished (local) |
|------|---------------|------------------|---------------------|-----------------------------|
| **Mult** | `emit/slake_mult_subset.{h,c}` | MultSubsetEmit / `mult-subset-emit` | MultSubsetRebuild / `mult-subset-rebuild` (+ without-Lake recipe) | **true** (M2 Name A) |
| **Linear** | `emit/slake_linear_subset.{h,c}` | LinearSubsetEmit / `linear-subset-emit` | LinearSubsetRebuild / `linear-subset-rebuild` | false |
| **Types** | `emit/slake_types_subset.{h,c}` | TypesSubsetEmit / `types-subset-emit` | TypesSubsetRebuild / `types-subset-rebuild` | false |
| **Program** | `emit/slake_program_subset.{h,c}` | ProgramSubsetEmit / `program-subset-emit` | ProgramSubsetRebuild / `program-subset-rebuild` | false |
| **Extract** | `emit/slake_extract_subset.{h,c}` | ExtractSubsetEmit / `extract-subset-emit` | ExtractSubsetRebuild / `extract-subset-rebuild` | false |
| **Erasure** | `emit/slake_erasure_subset.{h,c}` | ErasureSubsetEmit / `erasure-subset-emit` | ErasureSubsetRebuild / `erasure-subset-rebuild` | false |
| **Graph** | `emit/slake_graph_subset.{h,c}` | GraphSubsetEmit / `graph-subset-emit` | GraphSubsetRebuild / `graph-subset-rebuild` | false |
| **Compose** | `emit/slake_compose_subset.{h,c}` | ComposeSubsetEmit / `compose-subset-emit` | ComposeSubsetRebuild / `compose-subset-rebuild` | false |

**Stage ids (package identity examples):**
`SLAKE_MULT_SUBSET_EMIT_V0`, `SLAKE_LINEAR_SUBSET_EMIT_V0`, ...
`SLAKE_COMPOSE_SUBSET_EMIT_V0` (and matching `*_REBUILD_V0` on rebuild modules).

**Dual evidence pattern (already land for each unit):** Lean structural ready /
selfApplyOk / wroteExpected pins + lake exe or just greps on on-disk package
headers/sources.

### 2.2 Full product wire (M4; not a unit package)

| Surface | Paths | Measured without-Lake path |
|---------|-------|----------------------------|
| Freestanding dialect product wire | `emit/slake_freestanding.{h,c}` + `out/freestanding-c/` | Name B `product-wire-freestanding-write` preferred; else Name A prebuilt CapableRegenerate; official `just build` (Name C) |
| Local pins | `productWireWithoutLakeFinishedClaimed`, `productWireFsWriterFinishedClaimed` | true after M4 Name A/B |
| Product StillUsesLake | true until M6 | unchanged by M5 design |

Product wire is the **consumer release dialect**. Unit packages are the
**compiler surface** fragments (Mult..Compose unit APIs). M5 rebuilds compiler
packages; M4 already regenerates product wire. Do not sell M4 as M5 or collapse
them into one pin.

### 2.3 Subset sources (inputs M5 may consume)

| Source kind | Where today | Role for M5 |
|-------------|-------------|-------------|
| Fixed unit fixtures | CompilePath* / `SLAKE_*_SUBSET_*` inputs inside each *SubsetEmit | M1 emit inputs; still Lake-hosted fixtures |
| Mult subset language text | `src/systems/goldens/mult-front/` + SubsetFront dual-pinned strings | M3 parse/check only today; **not** package emit driver |
| On-disk unit packages | `emit/slake_*_subset.{h,c}` | Rebuild self-application inputs (M1/S3 pattern: package identity -> re-emit/re-validate) |
| Mult without-Lake drivers | prebuilt Mult rebuild ELF; host-cc Mult package writer | M2 measured Mult steps (reusable in a join) |
| Product wire writers | prebuilt CapableRegenerate; host-cc product-wire writer | **M4 only**; not a substitute for unit package join |

### 2.4 Front-end (M3 SubsetFront) vs package path

| Piece | Status |
|-------|--------|
| Grammar | Mult unit ordered IR: `node MULT-* kind` lines; kindMultOk; programCap |
| Good goldens | G1 classic three-node; G2 single VALUE |
| Bad goldens | B1 unknown grade; B2 kind-mult mismatch; B3 empty |
| Host | `SystemsLean.SubsetFront` + Main; lake exe `slake-subset-front`; just `subset-front` |
| Package write | **none** -- SubsetFront does not call MultSubsetEmit write |
| Product wire | **none** -- orthogonal to M4 |

M5 deepen may wire SubsetFront accept path into Mult package emit/rebuild
(Name B draft below). First implement may stay package-join only (Name A).

### 2.5 What M5 reuses vs invents

| Reuse | Do not invent |
|-------|----------------|
| Eight unit emit/rebuild modules and just recipes (M1) | Second competing package stage id per unit |
| Mult without-Lake measured recipes (M2) | Forging non-Mult withoutLakeFinished true without drivers |
| SubsetFront goldens + parse (M3) | Full Lean 4 / Systems Lean elaborator as M5 success |
| Dual evidence pattern (Lean pin + on-disk greps) | Grep-only theater sold as package rebuild |
| Short role names (`SubsetPackageJoin`, `CompilerSurfaceJoin` style) | Kitchen-sink `ProductPathFreestanding*` basenames; stage-id file names |
| Thin just orchestration | New shell/Python mill that reimplements emit |
| M4 honesty matrix shape | StillUsesLake false; free/complete re-open |

---

## 3. Operational meaning: M5 self-application

**Compiler packages** means the unit package set Mult..Compose under
`emit/slake_*_subset.{h,c}` (section 2.1). These packages are the freestanding C
surfaces of the Slake compiler units grown under M1 (+ Mult S2/S3).

**Subset sources** means inputs drawn from the subset ladder:

1. Existing unit package identity / fixtures (emit-ready packages and fixed
   CompilePath unit inputs), and/or
2. Mult subset language sources accepted by SubsetFront (M3), when a residual
   wires front-end to package write.

**End-to-end self-application of the compiler surface** means a **measured**
path that, in one implementable residual (or a short ordered Name chain):

1. Takes subset sources (not a full Lean elaborator of all Systems Lean),
2. Rebuilds (re-emits and re-validates) the compiler package set that M5 claims,
3. Leaves dual evidence (Lean structural join pin + on-disk package stage tokens),
4. Does **not** require product StillUsesLake false.

| Allowed for M5 measured step | Not enough / not M5 |
|------------------------------|---------------------|
| Ordered just join that runs existing unit rebuild recipes (and Mult without-Lake where present) and greps all package tokens | Re-running one unit residual as "M5 done" |
| New short host module that only **joins** readiness pins + documents the ordered path | Hand-editing all eight packages as "progress" |
| Optional SubsetFront -> Mult package bridge (Name B) | Claiming full dialect product wire is compiler packages (that is M4) |
| Prebuilt Lake exes on hot path for non-Mult units (honest bootstrap) | Invoking new lake build on every unit as the **only** story without a join measure |
| Dual evidence after the join | Flipping StillUsesLake false; PROVABLY/llvm |

**Clarifications:**

1. **Not M1 again.** M1 already proved each unit emit/rebuild. M5 adds the
   **join** (and optional front-end wire) as the product residual, not eight
   new unit Names.

2. **Not M4 again.** M4 regenerates `slake_freestanding` + Out. M5 rebuilds
   unit packages. Product wire may stay orthogonal; do not require M5 to rewrite
   freestanding dialect unless a later residual explicitly asks.

3. **Not M6 / S4.** Host elaborator may still use Lake. Measured join may use
   prebuilt binaries (M2 Mult style). Product StillUsesLake stays true.

4. **Bootstrap vs measured join.** Lake may still elaborate host modules and
   prebuild rebuild ELFs. The measured M5 recipe is the ordered join humans and
   gates re-run for dual evidence.

5. **Three languages only.** No new Python. No new shell mill for emit logic.
   just stays thin process glue. Package text stays Lean-generated unit emit.

---

## 4. Honesty matrix

| Pin / claim | Today | After M5 design | After first M5 implement (proposed Name A) | After M6 only |
|-------------|-------|-----------------|---------------------------------------------|---------------|
| Product `StillUsesLake` | true | true | **true** | may false with elaborator proof |
| Product `DependsOnLake` | true | true | **true** | may false with elaborator proof |
| Claim A free | true | true | **unchanged** | unchanged by Lake |
| Claim B complete | true | true | **unchanged** | unchanged by Lake |
| `freestandingDriverComplete` (Mult package Path A) | true | true | **orthogonal unchanged** | orthogonal |
| `productWireWithoutLakeFinishedClaimed` / `productWireFsWriterFinishedClaimed` | true | true | **orthogonal unchanged** (M4) | orthogonal |
| Mult `withoutLakeFinished` | true | true | true (reusable in join) | as Mult pins |
| Non-Mult unit `*WithoutLakeFinishedClaimed` | false | false | **false** unless Name C deepens | may true per unit later |
| Local M5 join finished pin (new) | absent / false | false | **true only if** measured multi-unit join + dual evidence | true (deepen) |
| SubsetFront ready | true | true | true (Name A may not require front-end wire) | true |
| PROVABLY | false / held | held | held | separate bar |
| llvm / out/llvm-ir | deferred | deferred | deferred | after real self-host acceptance |
| Residual free measure green | green | green | green | green |

**Non-claims this design must not dilute:**

- free is not Lake gone
- complete is not residual free and not Lake gone
- freestandingDriverComplete is Mult package writer complete, not multi-unit join
- productWireFsWriterFinished is M4 product dialect writer, not unit package join
- M5 implement is not S4 / M6 StillUsesLake false
- M5 is not full Systems Lean source elaborator self-host

---

## 5. Candidate implement paths (checkable Done when drafts)

Prefer **Name A** first (measurable join of existing M1 surfaces). Name B wires
M3 front-end into Mult package path. Name C deepens without-Lake across units.
Do not start Name B/C in the same slice as Name A.

### Name A -- Multi-unit subset package rebuild join (prefer first implement)

| Field | Draft |
|-------|--------|
| **Name** | M5 multi-unit package rebuild join |
| **Goal** | Measured ordered rebuild of Slake compiler unit packages (Mult..Compose) from existing subset package identity / rebuild paths, as one end-to-end join with dual evidence. |
| **Done when** | (1) just recipe (e.g. `subset-packages-rebuild-join` or `compiler-surface-rebuild-join`) runs ordered rebuild of all eight unit packages Mult, Linear, Types, Program, Extract, Erasure, Graph, Compose (prefer Mult without-Lake recipe when present; other units may use existing Lake-hosted or prebuilt rebuild recipes honestly). (2) Short host module (role name e.g. `SubsetPackageJoin` / `CompilerSurfaceJoin` -- not ProductPath*) with structural join pin(s) e.g. `subsetPackageJoinFinishedClaimed` / `compilerSurfaceRebuildJoinReady` true only when all unit rebuild-ready pins compose. (3) Dual evidence after measured run: Lean structural join pin true; on-disk greps of each unit package stage token in `emit/slake_*_subset.{h,c}` (emit stage ids). (4) Product StillUsesLake / DependsOnLake remain true; free/complete/freestandingDriverComplete/productWire*Finished unchanged; non-Mult withoutLakeFinished stay false unless a unit already had true; no PROVABLY/llvm forge. (5) Presence dual-pin if new host module/pins; docs self-host M5 Name A row; residual/handoff/WATCHER; gates: measured just + systems-host + product-residual-free-measure + hygiene green. |
| **Out of scope** | StillUsesLake false; free/complete re-open; SubsetFront->package wire (Name B); non-Mult without-Lake forge (Name C); S4/M6; PROVABLY; llvm; hand product C; product-wire rewrite as sole success; Mult redesign |
| **Primary paths (draft)** | `justfile`; new short `SystemsLean/SubsetPackageJoin.lean` (+ Main if lake exe needed); residual / self-host / handoff / WATCHER / plan; presence specs if required |
| **Local pin naming** | Prefer short greppable names e.g. `subsetPackageJoinFinishedClaimed`, `subsetPackageJoinReady`, `justRecipeSubsetPackageJoin` -- not kitchen-sink stacks |

**Ordered join suggestion (implement may refine):**

```
just subset-packages-rebuild-join
  -> Mult: prefer mult-subset-rebuild-without-lake (M2 Name A) else mult-subset-rebuild
  -> Linear: linear-subset-rebuild
  -> Types: types-subset-rebuild
  -> Program: program-subset-rebuild
  -> Extract: extract-subset-rebuild
  -> Erasure: erasure-subset-rebuild
  -> Graph: graph-subset-rebuild
  -> Compose: compose-subset-rebuild
  -> dual greps: SLAKE_*_SUBSET_EMIT_V0 (or rebuild) tokens on each emit/slake_*_subset.{h,c}
  -> Lean join pin greps / lake build of SubsetPackageJoin if host module present
```

Reuse existing unit recipes; do not reimplement emit in just.

### Name B -- Front-end to Mult package path (deepen after Name A)

| Field | Draft |
|-------|--------|
| **Name** | M5 front-end Mult package path |
| **Goal** | Drive Mult unit package emit and/or rebuild from SubsetFront-accepted Mult subset language sources (not only fixed Mult fixtures), with dual evidence. |
| **Done when** | (1) Measured path: SubsetFront accepts golden G1 (or documented Mult golden) then Mult package write/rebuild runs and dual-checks Mult package on disk. (2) Host wire short role names; dual evidence Lean + greps. (3) Product StillUsesLake true; free/complete/M4 pins unchanged; no PROVABLY/llvm. (4) Docs + gates green. |
| **Out of scope** | Full multi-language front-end beyond Mult subset IR; StillUsesLake false; non-Mult unit front-ends unless separate residual |
| **Cite** | M3 SubsetFront + MultSubsetEmit / MultSubsetRebuild + M2 without-Lake where useful |

### Name C -- Without-Lake multi-unit join deepen (optional after Name A)

| Field | Draft |
|-------|--------|
| **Name** | M5 without-Lake package join deepen |
| **Goal** | Measured multi-unit package rebuild join without invoking Lake on the hot path for units that have prebuilt rebuild binaries (extend Mult without-Lake pattern; do not forge finished pins without real prebuilts). |
| **Done when** | (1) Join recipe runs prebuilt unit rebuild ELFs (or freestanding writers where they exist) with **no** `lake build` / `lake exe` / `lake env` on the measured path. (2) Dual evidence all packages. (3) Local without-Lake pins only where drivers exist; product StillUsesLake **true**. (4) Docs + gates green. |
| **Out of scope** | M6 StillUsesLake false; inventing shell mills; forging withoutLakeFinished for units without prebuilts |

**Recommendation:** Open residual after this design = **Name A** only. Cap: one
implement residual with checkable Done when. Name B/C remain plan Remaining.

---

## 6. Gates and dual evidence (for implementers)

| Gate | Role |
|------|------|
| Measured join just recipe | Exit 0; ordered unit rebuilds complete |
| Dual greps on each `emit/slake_*_subset.{h,c}` | Unit package stage tokens present after join |
| `just systems-host` | Presence dual-pin if new Lean pins / modules |
| `just product-residual-free-measure` | Free measure stays green; no managed residual forge |
| `just hygiene` | ASCII + professional tone |
| Lake build of join host module (bootstrap / host) | Host elaborator still OK; may be used for pin module; Mult without-Lake still preferred on Mult step |

Driver stdout (any new Lean later): short stage banner, paths, pin values only --
no residual non-claims theater (policy in `AGENTS.md`). **This design slice:**
docs only; no Lean product body.

---

## 7. Residual Open switch (after this design lands)

**Close:** M5 design (this note + residual archive).

**Open next (plan default):**

### M5 multi-unit package rebuild join

| Field | Content |
|-------|---------|
| **Name** | M5 multi-unit package rebuild join |
| **Goal** | Measured ordered rebuild of Slake compiler unit packages (Mult..Compose) as one end-to-end join with dual evidence. |
| **Done when** | As Name A section 5 (checkable). |
| **Out of scope** | Name B front-end wire; Name C without-Lake multi-unit forge; StillUsesLake false; free/complete re-open; PROVABLY; llvm; S4/M6 forge |
| **Primary paths** | `justfile`; short SubsetPackageJoin (or role-named) host module; residual / self-host / handoff / WATCHER; presence if needed |
| **Status** | open after design |

Plan Remaining after Name A: Name B front-end Mult package path optional;
Name C without-Lake multi-unit deepen optional; M6/S4 deferred; Step 4 held.

---

## 8. Self-host / plan lockstep (what docs must say)

| Doc | Update on design close |
|-----|------------------------|
| `src/systems/self-host.md` | M5 design row -> done (cite this note); Open implement Name A |
| `RESIDUAL-systems.md` | Archive design; Open Name A; living tip M5 design done |
| `RESIDUAL.md` | Systems Open table Name A |
| `WATCHER.md` | `/implement` Name A |
| `doc/SESSION-HANDOFF.md` | Living tip M5 design done; Open multi-unit package rebuild join |
| `src/systems/README.md` | Short living tip only if needed (map; no residual novel) |
| Plan Step 5 M5 design | **Done**; M5 Name A next |

---

## 9. Cite map (M1 / M3 / M4)

| Ladder piece | What M5 takes from it |
|--------------|----------------------|
| **M1 unit packages** | Eight unit emit/rebuild surfaces and dual-evidence recipes; package paths and stage ids |
| **M3 SubsetFront** | Mult subset language + goldens; optional Name B input path (not required for Name A) |
| **M4 Name A** | Prebuilt without-Lake measured-step shape (pattern for unit prebuilts later) |
| **M4 Name B** | Host-cc freestanding writer pattern (orthogonal Mult/product writers already exist) |
| **M4 Name C** | Official without-Lake build wire-up honesty (product path stays M4; M5 does not rewire `just build` unless later residual asks) |

---

## 10. Summary

M5 is **end-to-end self-application of the compiler surface**: rebuild Slake
**compiler unit packages** (Mult..Compose `slake_*_subset`) from **subset
sources**, as a measured join after M1 per-unit work, M3 front-end, and M4
product-wire without-Lake. Today packages exist and rebuild one-by-one; Mult has
without-Lake; SubsetFront does not write packages; product wire is separate.
Prefer **Name A** multi-unit package rebuild join first; Name B front-end Mult
package path later; Name C without-Lake multi-unit deepen optional. Product
StillUsesLake stays **true** until M6. No free/complete/PROVABLY/llvm forge;
M4 product-wire pins and Mult freestandingDriverComplete stay orthogonal.
