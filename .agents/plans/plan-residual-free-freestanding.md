# Plan: Residual-free freestanding Slake (linear types) + bootstrap

ASCII only. Durable product program after claim B freestanding product self-host
complete and product residual free (claim A). Living authority when this file
lags: `WATCHER.md`, `RESIDUAL-systems.md`, `SelfApplyFs.lean` /
`SelfHostComplete.lean` claim flags, `self-host.md`.

**Living goal (2026-08-01):** foundation free + complete + Mult bootstrap
**S0-S3 done** under Lake. Ideal ladder **M1** unit surfaces **done**. Ideal
ladder **M2** Mult without-Lake including Name B full Path A **done**
(`freestandingDriverComplete` **true**; host-cc `slake-mult-fs-write-cc`;
product StillUsesLake remains). M3 design+implement **done**
(`SubsetFront` / `just subset-front`; design note
`doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md`). M4 design
**done** (`doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md`).
M4 Name A prebuilt **done** (`just freestanding-capable-regenerate-without-lake`;
`productWireWithoutLakeFinishedClaimed` true). M4 Name B freestanding writer
**done** (`just product-wire-freestanding-write`; `productWireFsWriterFinishedClaimed`
true). M4 Name C official without-Lake build **done** (`just build` prefers Name B
else Name A; no lake on hot path). M5 design **done**
(`doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md`).
M5 Name A multi-unit package rebuild join **done** (`SubsetPackageJoin` /
`just subset-packages-rebuild-join`; `subsetPackageJoinFinishedClaimed` true).
M5 Name B front-end Mult package path **done** (`FrontMultPackage` /
`just front-mult-package`; `frontMultPackageFinishedClaimed` true).
M5 Name C without-Lake multi-unit join **done**
(`just subset-packages-rebuild-join-without-lake`;
`subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed` true). M5 A/B/C **all
done**. M6 design **done**
(`doc/dev/research/m6-lake-retire-design-2026-08-01.md`). M6 phase 1 inventory
**done** (`LakeRetireInventory` / `just lake-retire-inventory`). M6 phase 2
product-path Lake pins flip **done** (living tip StillUsesLake/DependsOnLake
**false** with lake elaborator proof; host residual remains; join
`/tmp/grok-1000/grok-impl-summary-m6-phase2-pin-flip.md`). Freestanding product
path **M0-M6 done**. Step 4 PROVABLY/LLVM held. Free + complete are foundation;
product path Lake retired; host elaborator residual remains.

**Next program (after this plan):** peer elaborator -- freestanding Slake
checking host work peer to Lake. Plan:
`.agents/plans/plan-peer-elaborator.md`. Open residual: **Peer elaborator
design**. Do not forge free/complete/host free/PROVABLY/llvm.

**Parallel hygiene (non-blocking):** driver stdout hygiene (short status lines
only; residual essays stay in residual / self-host / research). Scrub on touch.
Policy: `AGENTS.md` **Driver stdout policy**; Decision row in
`RESIDUAL-systems.md`.

---

## 1. Why this work matters

Systems Lean and Slake aim at formally proven high-assurance freestanding
systems software:

1. Memory safety without a garbage collector in the freestanding release
   binary. Safety comes from **linear** types (must use exactly once) and,
   where design calls for it, **affine** types (may use at most once; may
   discard). No product garbage collection (GC) and no Lean managed runtime on
   the freestanding emit path under `out/freestanding-c`.

2. Slake is the compiler, written in Systems Lean, aimed at that freestanding C
   product surface.

3. Meet-in-the-middle with two real languages. Paired examples in Idris 2 and
   Lean 4 (ConsumeToken, ErasedIndex, UnrestrictedShare) seed correspondence.
   They are not a finished formal isomorphism and do not alone make the product
   residual free. Idris 2 here is for correspondence, not the freestanding
   product compiler body (that lives under Systems Lean / Slake).

4. Minimum Quantitative Type Theory (QTT) grades for freestanding: 0, 1, and
   omega (erased / exact-once / unrestricted).

5. Claims only with evidence. Product residual free, PROVABLY (CompCert-class),
   and LLVM each need real gates and evidence. No forged victory.

6. Rust-native LLVM intermediate representation is after freestanding self-host
   evidence and real CompCert / ccomp work. Not next-week theater.

7. Three languages for novel product and tooling: Idris 2, Lean 4 (including
   Systems Lean / Slake), pure Nix. Freestanding C under emit and
   `out/freestanding-c` is generated product wire, not a fourth place to
   hand-write the language.

**One line:** self-hosting, formally proven high-assurance systems language that
ships safe freestanding binaries with no GC and no Lean runtime on the wire,
with honest Idris/Lean correspondence.

### Linear vs affine

| Discipline | Meaning | Role here |
|------------|---------|-----------|
| **Linear** | Resource used **exactly once** | Primary freestanding story: Mult grade 1, exact-once consume, host mint/consume live flag, freestanding C consume API shape |
| **Affine** | At most once (discard allowed) | Design intent later; not first-class on the wire yet |

---

## 2. Where we actually are

| What | Status | Plain meaning |
|------|--------|---------------|
| Freestanding product self-host **complete** (claim B) | **True** | Writer path evidence closed: full step contract, ownership, perform, dual-equality write path. Product path rebuilds the stated kernel without classic Lean **on the freestanding C wire** |
| Product still rebuilt with Lake on the **host** | **True** | Host elaborator residual is fine. Complete does **not** mean Lake is gone |
| Official product writer is freestanding emit scaffold only | **False** | Writer authority is not the old emit-only scaffold |
| **Product residual free** (claim A) | **True** | Managed Lean / GC residual absent on `out/freestanding-c` **and** DualResidual / wire honesty agree; host Lake residual still remains |
| Host elaborator residual remains | **True** | Classic Lake still elaborates Systems Lean |
| Proof complete / PROVABLY / LLVM unlock | **False / held** | Not auto-unlocked by complete |
| Huge Lean file campaign | **Parked** | Hygiene finished for the cold split chain. Not the product goal |

**Two cliffs, not one:**

- **Complete** = freestanding product self-host evidence bar under Lake host.
- **Product residual free** = freestanding release text has no managed Lean / GC
  residual **and** honesty records agree product residual is gone. Host Lake
  residual can still exist.

Do not call complete "residual free." Do not claim Lake is gone while it still
drives host rebuild.

---

## 3. Goal of this plan

Honest product residual free freestanding path centered on linear (and later
affine) memory safety; update human docs including README; use Idris/Lean
correspondence and Lean agent skills where they help, not as busywork.

---

## 4. Idris / Lean paired examples

Helpful as seeds and honesty. Not the lever that alone makes residual free.
Park more dual-example work unless a named correspondence gap appears.

---

## 5. Project Lean 4 agent skills

Pack at `.agents/skills/lean4`. Use on real host theorem work (Steps 2-3). Do
not invent residual work only to exercise the skill. Skill green is not residual
free.

---

## 6. Work sequence

### Step 0 -- Align docs with living tip (done)

Residual ledgers, handoff, WATCHER, and plan snapshots match: complete true,
product residual free false, Lake host still used; long-file work is hygiene;
next product goal is residual free + linear freestanding honesty.

**Status:** **done** (docs aligned; living tip complete true / free false).

### Step 1 -- Residual free bar inventory (no claim change yet)

**Name:** Residual free bar inventory

**Goal:** one checklist of everything that must be true before we say product
residual is gone.

**Done when:**

1. Residual free measure on `out/freestanding-c` is green (re-verify).
2. Checklist on disk: measure green; honesty modules that must change; product
   wire strings that still say residual remains; host residual free stays a
   separate program.
3. Explicit non-claims: residual free != Lake gone; != full proofs; !=
   PROVABLY; != LLVM unlock.
4. Linear / affine row: enforced today vs later.

**Out of scope:** flipping residual free true; C or shell growth; more dual
examples; LLVM / PROVABLY.

**Status:** **done** (2026-08-01). Checklist:
`doc/dev/research/residual-free-bar-inventory-2026-08-01.md`. Measure green via
`just product-residual-free-measure` exit 0; free still false; dual residual
host vs product programs documented; non-claims and linear/affine row on disk.

### Step 2 -- Linear freestanding contracts

**Name:** Linear freestanding contracts

**Goal:** strengthen exact-once / Mult 0/1/omega evidence without pretending
affine is done.

**Done when:** named host theorems or stronger pins; remaining Linear axioms
documented; Lake green on touched modules; lean4 review before calling done.

**Out of scope:** residual free true; formal full isomorphism; hand-written
product C features.

**Status:** **done** (2026-08-01). LinearTheorems: shareNat_reuse, polyId_compose,
polyId_nat, Mult-class id pins, LINEAR-AXIOMS-REMAIN inventory,
affineNotFirstClassId; HostCompose mint_consume_exact_once_sequential (live-flag
exact-once sequential). Token / mkToken / consume stay axioms with honest limits
in Linear.lean. Lake `SystemsLean.LinearTheorems` + `HostComposeTheorems` exit 0;
`just systems-host` green; free still false; lean4 skill prove/review used.

### Step 3 -- Claim product residual free (only when inventory checklist green)

**Name:** Residual free claim

**Goal:** set product residual free honestly with consistent honesty modules,
measure green, and README / human docs updated.

**Out of scope:** pretending Lake host residual is gone; PROVABLY; LLVM unlock;
forging free without checklist.

**Status:** **done** (2026-08-01). Inventory section 7 items 2-10 closed with
evidence. DualResidual residualFreeClaimed true; productResidualRemains false;
hostElaboratorResidualRemains true; host free false. Measure required honesty
`product residual free`. SelfHostComplete free true + complete ok green. Lake
claim path + freestanding-self-host-complete GREEN. Human docs / residual /
WATCHER lockstep. Complete true; free true; Lake host remains. Non-claims held:
free != Lake gone / proof complete / PROVABLY / LLVM.

### Step 4 -- After residual free (held; do not auto-start)

Progressive proof; PROVABLY only with real CompCert / ccomp; LLVM after
self-host evidence policy; optional formal Idris/Lean isomorphism if opened;
revisit Mult grades beyond 0/1/omega after MVP. **Do not auto-start** from free
or complete alone. Orthogonal to Step 5 bootstrap.

### Step 5 -- Bootstrap program + ideal freestanding ladder

**Correction:** "No freestanding binary" does **not** block bootstrap. Bootstrap
starts with Lake elaborating early Slake stages. Freestanding self-application
without Lake is a **later** milestone (ideal **M2-M6** / **S4**), not a gate on
starting S1 or growing unit surfaces under Lake (M1).

**Foundation vs ideal:** free + complete + Mult S0-S3 under Lake are
**foundation**. Ideal freestanding Slake-with-Slake = rebuild the Slake product
path without classic Lake as the product elaborator/driver. Keep
`StillUsesLake` / `DependsOnLake` **true** until **M6** with real elaborator
proof. Never forge early.

#### Mult bootstrap S0-S3 (done under Lake)

| Stage | Name | What success looks like | Status |
|-------|------|-------------------------|--------|
| **S0** | Host foundation | Lake elaborates Systems Lean; product wire residual free; claim B writer path true | **Done** |
| **S1** | First Slake compiler surface | Named front-end / driver: defined Mult unit input, checkable translate/check path | **Done** (`FirstSurface` / `just first-surface`) |
| **S2** | Emit freestanding C for that subset | Evidence Slake (host-built) wrote Mult unit package for the subset | **Done** (`MultSubsetEmit` / `just mult-subset-emit`; `emit/slake_mult_subset.{h,c}`) |
| **S3** | Rebuild own freestanding subset | Measured Mult subset self-application (Lake-hosted re-emit/re-validate) | **Done** (`MultSubsetRebuild` / `just mult-subset-rebuild`) |
| **S4** | Retire Lake from product path | DependsOnLake / StillUsesLake false only with elaborator proof | **Done** (product path; = ideal **M6** phase 2 lake proof; host residual remains) |
| **S5** | Held tracks | PROVABLY, LLVM IR, full formal iso | Held (Step 4) |

#### Ideal milestone ladder (M0-M6; living after S3)

| Id | Milestone | Checkable shape | Status |
|----|-----------|-----------------|--------|
| **M0** | S0-S3 Mult under Lake | first-surface / mult-subset-emit / mult-subset-rebuild green | **Done** |
| **M1** | Grow unit surfaces under Lake | Linear / Types / Program / Extract subset emit + rebuild, same dual-evidence pattern as Mult | **Linear + Types + Program + Extract emit/rebuild done** |
| **M2** | Non-Lake **driver** for subset re-emit | Rebuild Mult package without invoking Lake for that measured step; subset withoutLakeFinished only when driver is real | **done** (Name A prebuilt; Name B greps; host Mult SSOT write path; Name B full Path A host-cc Mult package writer; freestandingDriverComplete **true**; product Lake remains) |
| **M3** | Real front-end over defined subset language | Parse/check good+bad golden inputs; not only fixed Mult fixtures | **done** (design + `SubsetFront` / `just subset-front`; goldens G1/G2+B1-B3; StillUsesLake true) |
| **M4** | Product-wire regenerate without Lake as product path | Ordered READ+COMPOSE+WRITE-HC+INSTALL without Lake product writer | **design + Name A + Name B + Name C done** (official just build without-Lake hot path; product Lake remains) |
| **M5** | Slake rebuilds own compiler packages from subset sources | End-to-end self-application of compiler surface | **done** (design + Name A multi-unit join + Name B front Mult path + Name C without-Lake multi-unit deepen) |
| **M6** | **S4** product-path Lake retire | DependsOnLake / StillUsesLake false with elaborator proof; dual residual honesty | **done** (design + phase 1 inventory + phase 2 pin flip with lake proof; host residual remains) |
| **M7** | PROVABLY / LLVM / full iso | Separate evidence bars | **Held** (Step 4) |

**Hard rule:** never set StillUsesLake / DependsOnLake false before M6 proof.

**Cold wall + self-host bench (serial only):** after lake clean, Lake package
elaborator ~603 s real; Slake product `just build` ~1.3 s; Mult subset rebuild
~0.6 s (same day 2026-08-01). Different workloads; not a peer elaborator race.
Detail: `doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md`.

**beastdb (orthogonal):** soft couple only on freestanding Systems Lean language
quality. Do not divert iso residual into beastdb tree. Isolation holds.

#### Retrospective: Linear subset emit + rebuild (M1) -- done

**Linear subset emit:** **done** (2026-08-01). `LinearSubsetEmit` /
`LinearSubsetEmitMain`; `slake-linear-subset-emit`; `just linear-subset-emit`;
`emit/slake_linear_subset.{h,c}` via HOST-EMIT-LINEAR; dual evidence; join
`/tmp/grok-1000/grok-impl-summary-linear-subset-emit.md`.

**Linear subset rebuild:** **done** (2026-08-01). `LinearSubsetRebuild` /
`LinearSubsetRebuildMain`; `slake-linear-subset-rebuild`;
`just linear-subset-rebuild`; M1 package identity -> re-emit/re-validate Linear
unit package; withoutLakeFinished false; join
`/tmp/grok-1000/grok-impl-summary-linear-subset-rebuild.md`.

**Types subset emit (M1 continue):** **done** (2026-08-01). Operator approved
default; `TypesSubsetEmit` / `TypesSubsetEmitMain`; `slake-types-subset-emit`;
`just types-subset-emit`; COMPILE-PATH-TYPES + HOST-EMIT-TYPES ->
`emit/slake_types_subset.{h,c}`; dual evidence; join
`/tmp/grok-1000/grok-impl-summary-types-subset-emit.md`.

**Types subset rebuild (M1 Types follow-on):** **done** (2026-08-01).
`TypesSubsetRebuild` / `TypesSubsetRebuildMain`; `slake-types-subset-rebuild`;
`just types-subset-rebuild`; M1 package identity -> re-emit/re-validate Types
unit package; withoutLakeFinished false; join
`/tmp/grok-1000/grok-impl-summary-types-subset-rebuild.md`.

**Program subset emit (M1 continue):** **done** (2026-08-01).
`ProgramSubsetEmit` / `ProgramSubsetEmitMain`; `slake-program-subset-emit`;
`just program-subset-emit`; COMPILE-PATH-PROGRAM + HOST-EMIT-PROGRAM ->
`emit/slake_program_subset.{h,c}`; dual evidence; join
`/tmp/grok-1000/grok-impl-summary-residual-queue-20260801.md`.

**Program subset rebuild (M1 Program follow-on):** **done** (2026-08-01).
`ProgramSubsetRebuild` / `ProgramSubsetRebuildMain`;
`slake-program-subset-rebuild`; `just program-subset-rebuild`; M1 package
identity -> re-emit/re-validate Program unit package; withoutLakeFinished false;
same residual-queue join.

**Extract subset emit (M1 continue):** **done** (2026-08-01).
`ExtractSubsetEmit` / `ExtractSubsetEmitMain`; `slake-extract-subset-emit`;
`just extract-subset-emit`; COMPILE-PATH-EXTRACT / extractRuntimeFsGateReady +
HOST-EMIT-EXTRACT -> `emit/slake_extract_subset.{h,c}`; dual evidence; join
`/tmp/grok-1000/grok-impl-summary-2a634b1c.md`.

**Extract subset rebuild (M1 Extract follow-on):** **done** (2026-08-01).
`ExtractSubsetRebuild` / `ExtractSubsetRebuildMain`; `slake-extract-subset-rebuild`;
`just extract-subset-rebuild`; M1 package identity `SLAKE_EXTRACT_SUBSET_EMIT_V0` /
`extractSubsetEmitReady` -> re-emit/re-validate `emit/slake_extract_subset.{h,c}`;
dual evidence; withoutLakeFinished claimed false; StillUsesLake true; join
`/tmp/grok-1000/grok-impl-summary-extract-subset-rebuild.md`.

**Mult without-Lake driver design (M2 prep):** **done** (2026-08-01). Note
`doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` (operational
without-Lake meaning; Mult I/O inventory; honesty matrix; proposed Names A/B;
non-claims). StillUsesLake stays true until M6.

**Mult without-Lake prebuilt driver (M2 Name A):** **done** (2026-08-01).
`just mult-subset-rebuild-without-lake` runs prebuilt Mult rebuild ELF (no lake
on hot path); `multSubsetRebuildWithoutLakeFinishedClaimed` true; product
StillUsesLake/DependsOnLake true; join
`/tmp/grok-1000/grok-impl-summary-mult-without-lake-name-a-20260801.md`.

**Mult freestanding surface dual-check partial (M2 Name B greps):** **done**
(2026-08-01). `SystemsLean.MultFsDeepen`; `just mult-subset-freestanding-deepen`
dual-checks freestanding Mult product wire + Mult subset package without lake or
Mult rebuild prebuilt; `freestandingDeepenPartial` true; product
StillUsesLake/DependsOnLake true; join
`/tmp/grok-1000/grok-impl-summary-52008d13.md`.

**Host MultSubsetEmit freestanding Mult SSOT write path:** **done**
(2026-08-01). `multFsWrite` via MultSubsetEmit freestanding Mult SSOT; prebuilt
`slake-mult-fs-write`; `just mult-subset-freestanding-write` (no lake on hot
path); Mult rebuild ELF not the Mult package writer; `multFsWritePathReady` true;
`freestandingDriverComplete` **false** (Lake-built write ELF is not design
freestanding complete); product StillUsesLake/DependsOnLake true; join
`/tmp/grok-1000/grok-impl-summary-353f96ab.md`.

**Erasure subset emit (M1 continue):** **done** (2026-08-01).
`SystemsLean.ErasureSubsetEmit` + `ErasureSubsetEmitMain`;
`slake-erasure-subset-emit` / `just erasure-subset-emit`;
`emit/slake_erasure_subset.{h,c}` via HOST-EMIT-ERASURE;
`erasureFixtureCompilePathReady` input; dual evidence; StillUsesLake true;
join `/tmp/grok-1000/grok-impl-summary-erasure-subset-emit.md`.

**Erasure subset rebuild (M1 follow-on):** **done** (2026-08-01).
`SystemsLean.ErasureSubsetRebuild` + `ErasureSubsetRebuildMain`;
`slake-erasure-subset-rebuild` / `just erasure-subset-rebuild`;
M1 package identity re-emit/re-validate; dual evidence; withoutLakeFinished false;
StillUsesLake true; join `/tmp/grok-1000/grok-impl-summary-erasure-subset-rebuild.md`.

**Graph subset emit (M1 continue):** **done** (2026-08-01).
`SystemsLean.GraphSubsetEmit` + `GraphSubsetEmitMain`;
`slake-graph-subset-emit` / `just graph-subset-emit`;
`emit/slake_graph_subset.{h,c}` via HOST-EMIT-GRAPH;
`graphFixtureCompilePathReady` input; dual evidence; StillUsesLake true;
join `/tmp/grok-1000/grok-impl-summary-graph-subset-emit.md`.

**Graph subset rebuild (M1 follow-on):** **done** (2026-08-01).
`SystemsLean.GraphSubsetRebuild` + `GraphSubsetRebuildMain`;
`slake-graph-subset-rebuild` / `just graph-subset-rebuild`;
M1 package identity `SLAKE_GRAPH_SUBSET_EMIT_V0` / `graphSubsetEmitReady` ->
re-emit/re-validate Graph unit package; dual evidence; withoutLakeFinished
false; StillUsesLake true;
join `/tmp/grok-1000/grok-impl-summary-graph-subset-rebuild.md`.

**Compose subset emit (M1 continue):** **done** (2026-08-01).
`SystemsLean.ComposeSubsetEmit` + `ComposeSubsetEmitMain`;
`slake-compose-subset-emit` / `just compose-subset-emit`;
`emit/slake_compose_subset.{h,c}` via HOST-EMIT-COMPOSE;
`composeFixtureCompilePathReady` input; dual evidence; StillUsesLake true;
join `/tmp/grok-1000/grok-impl-summary-compose-subset-emit.md`.

**Compose subset rebuild (M1 follow-on):** **done** (2026-08-01).
`SystemsLean.ComposeSubsetRebuild` + `ComposeSubsetRebuildMain`;
`slake-compose-subset-rebuild` / `just compose-subset-rebuild`;
M1 package identity `SLAKE_COMPOSE_SUBSET_EMIT_V0` / `composeSubsetEmitReady` ->
re-emit/re-validate Compose unit package; dual evidence; withoutLakeFinished
false; StillUsesLake true;
join `/tmp/grok-1000/grok-impl-summary-compose-subset-rebuild.md`.

**Next Open:** **Peer elaborator design** (not this plan's remaining work;
freestanding product path M0-M6 closed). Plan:
`.agents/plans/plan-peer-elaborator.md`. M6 design + phase 1 inventory + phase 2
pin flip **done** (product StillUsesLake/DependsOnLake false with lake proof;
host residual remains). M5 A/B/C **done**. M4 Name C/B/A **done**. M3
design+implement **done**. M2 Name B full Path A **done**. Step 4 held
(PROVABLY / LLVM -- operator-gated only). Driver stdout hygiene may run in
parallel.

#### Retrospective: Phase A / B / C (S1-S3 Mult) -- done

**Phase A -- Inventory (S1 design):** **done** (2026-08-01). Inventory:
`doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`.

**Phase B -- S1 first compiler surface:** **done** (2026-08-01).
`SystemsLean.FirstSurface` + `FirstSurfaceMain`; `slake-first-surface` /
`just first-surface`; Mult input `SLAKE_FIRST_SURFACE_MULT` ->
`firstSurfaceReady`; Lake host remains; join
`/tmp/grok-1000/grok-impl-summary-s1-first-surface.md`.

**Phase C S2 -- Mult subset emit:** **done** (2026-08-01). `MultSubsetEmit` /
`MultSubsetEmitMain`; `slake-mult-subset-emit`; `just mult-subset-emit`;
`emit/slake_mult_subset.{h,c}` via HOST-EMIT-MULT; dual evidence honesty;
join `/tmp/grok-1000/grok-impl-summary-s2-mult-subset-emit.md`.

**Phase C S3 -- Mult subset rebuild:** **done** (2026-08-01).
`MultSubsetRebuild` / `MultSubsetRebuildMain`; `slake-mult-subset-rebuild`;
`just mult-subset-rebuild`; Mult subset self-application under Lake;
withoutLakeFinished land-time claimed false (later flipped true by M2 Name A);
join `/tmp/grok-1000/grok-impl-summary-s3-subset-rebuild.md`.

Mult without-Lake measured step finished (Name A prebuilt). Host MultSubsetEmit
Mult SSOT write path finished (multFsWritePathReady true). Name B full Path A
finished (freestandingDriverComplete true). M3 design+implement done; M4 design done;
M4 Name A prebuilt done; M4 Name B freestanding writer done
(productWireFsWriterFinishedClaimed true); M4 Name C official without-Lake build
done; M5 design done; M5 Name A multi-unit package rebuild join done; M5 Name B
front-end Mult package path done; M5 Name C without-Lake multi-unit deepen done.
**Next:** M6 Lake retire **design** then implement (never forge StillUsesLake
false; elaborator proof required for pin flips). Serial wall-time benches only
(see cold bench note).

---

## 7. Documentation obligation

When residual free (or Step 0 alignment) lands, keep these in sync:

| Doc | Why |
|-----|-----|
| `README.md` | First impression |
| `doc/goals.md` | Product north star |
| `doc/vocabulary.md` | Residual free, freestanding, dual residual, product wire |
| `doc/SESSION-HANDOFF.md` | Reseed after compaction |
| `RESIDUAL-systems.md` / `RESIDUAL.md` | Work queue and join board |
| `WATCHER.md` | Next action only |
| `src/systems/self-host.md` | Self-host acceptance |
| `src/systems/README.md` / emit ownership map | Product surface map |
| Stale plan snapshots (e.g. plan-close-six-claims section 0) | Living tip wins |

Step 0 opens the living residual and lists remaining human docs; full README /
goals rewrite can land with Step 3 (or earlier if a line re-opens claim B or
sells complete as free).

---

## 8. What not to do

| Forbidden | Why |
|-----------|-----|
| Claim residual free because a scanner is green alone | Honesty modules and docs must agree |
| Sell complete as residual free or Lake-gone | Different facts |
| Set "does not depend on Lake" while Lake still writes host rebuilds | Dishonest gates |
| Call missing freestanding binary a bootstrap **blocker** | Bootstrap starts that way (S0); S3-S4 are later |
| Sell free as Lake gone or complete as "Slake bootstrapped" | Dual residual; writer-path bar only |
| Re-open dual example mills for residual free | Wrong lever |
| Invent residual work to exercise lean4 skills | Skills serve the goal |
| Hand-author freestanding product C or grow shell as progress | Three languages rule |
| Unlock LLVM or PROVABLY because complete or free flipped | Held evidence bars |
| Make long-file splitting the product goal again | Hygiene only |
| Re-open claim B complete ladder as open product work | Already true |
| Mint ProductPath* kitchen-sink basenames for S1 | Short role names (`FirstSurface`, `SlakeCompile`) |

---

## 9. Critical files

| Path | Role |
|------|------|
| `src/systems/SystemsLean/SelfApplyFs.lean` | Living tip claim flags |
| `src/systems/SystemsLean/DualResidual.lean` | Product vs host residual honesty |
| `src/systems/SystemsLean/SelfHostComplete.lean` | Complete / Full / ownership / perform honesty |
| `src/systems/SystemsLean/{Mult,Linear,Types,HostCompose}.lean` | Mult and linear host |
| `src/systems/SystemsLean/JoinMap.lean` | Correspondence cites into Slake |
| `nix/systems-emit-wire/residual-free-measure.nix` | Residual free measure on product C |
| `src/systems/self-host.md` | Self-host acceptance prose |
| `src/systems/emit/host-owned-emit.md` | Who owns freestanding C text |
| `README.md`, `doc/goals.md`, residual, handoff | Human story |
| `.agents/skills/lean4/SKILL.md` | Host Lean workbench for Steps 2-3 |

---

## 10. Reuse (do not rebuild)

- Residual free measure already exists; verify and use it.
- Claim B complete already true; do not re-run the complete ladder.
- Idris/Lean pairs and join map exist; cite them.
- File-split patterns exist if a module becomes unreadable; not the goal.
- Lean4 skill pack already submoduled; engage it on real theorem work.

---

## 11. How we know each step is done

| Step | Check |
|------|--------|
| 0 | Residual and handoff match tip flags; B not re-opened as open work |
| 1 | Measure green; checklist on disk with non-claims and linear/affine honesty |
| 2 | Lake green on Mult/Linear-related modules; lean4 review note; axioms documented |
| 3 | residual free true only with consistent flags; measure green; README + listed docs updated; Nix gates green |
| 5 Phase A | Inventory note on disk; residual Open Name for S1 with checkable Done when |
| 5 Phase B (S1) | **Done** -- FirstSurface + e2e gate + Lake host honest docs |
| 5 Phase C (S2) | **Done** -- MultSubsetEmit Mult unit package write + free green + honest docs |
| 5 Phase C (S3) | **Done** -- MultSubsetRebuild Mult subset self-application measure + free green + honest docs |
| 5 M1 (Linear subset emit) | **Done** -- LinearSubsetEmit + lake exe + just; Linear unit package write; dual evidence; free green |
| 5 M1 (Linear subset rebuild) | **Done** -- LinearSubsetRebuild + lake exe + just; Linear subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Types subset emit) | **Done** -- TypesSubsetEmit + lake exe + just; Types unit package write; dual evidence; free green |
| 5 M1 (Types subset rebuild) | **Done** -- TypesSubsetRebuild + lake exe + just; Types subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Program subset emit) | **Done** -- ProgramSubsetEmit + lake exe + just; Program unit package write; dual evidence; free green |
| 5 M1 (Program subset rebuild) | **Done** -- ProgramSubsetRebuild + lake exe + just; Program subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Extract subset emit) | **Done** -- ExtractSubsetEmit + lake exe + just; Extract unit package write; dual evidence; free green |
| 5 M1 (Extract subset rebuild) | **Done** -- ExtractSubsetRebuild + lake exe + just; Extract subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Erasure subset emit) | **Done** -- ErasureSubsetEmit + lake exe + just; Erasure unit package write; dual evidence; free green |
| 5 M1 (Erasure subset rebuild) | **Done** -- ErasureSubsetRebuild + lake exe + just; Erasure subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Graph subset emit) | **Done** -- GraphSubsetEmit + lake exe + just; Graph unit package write; dual evidence; free green |
| 5 M1 (Graph subset rebuild) | **Done** -- GraphSubsetRebuild + lake exe + just; Graph subset self-application; withoutLakeFinished false; free green |
| 5 M1 (Compose subset emit) | **Done** -- ComposeSubsetEmit + lake exe + just; Compose unit package write; dual evidence; free green |
| 5 M1 (Compose subset rebuild) | **Done** -- ComposeSubsetRebuild + lake exe + just; Compose subset self-application; withoutLakeFinished false; free green |
| 5 M2 (Mult without-Lake design) | **Done** -- design note `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md`; StillUsesLake true until M6 |
| 5 M2 (Mult without-Lake Name A) | **Done** -- just mult-subset-rebuild-without-lake; prebuilt ELF; withoutLakeFinished true; product Lake remains; StillUsesLake true until M6 |
| 5 M2 (Mult freestanding surface dual-check Name B greps) | **Done** -- MultFsDeepen; just mult-subset-freestanding-deepen; greps; freestandingDeepenPartial true; product Lake remains; StillUsesLake true until M6 |
| 5 M2 (host MultSubsetEmit Mult SSOT write path) | **Done** -- MultFsDeepen + prebuilt slake-mult-fs-write / just mult-subset-freestanding-write; multFsWritePathReady true; freestandingDriverComplete false; Mult rebuild ELF not writer; product Lake remains; StillUsesLake true until M6 |
| 5 M2 (Name B full Mult write design deepen) | **Done** -- note `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md`; Path A prefer; no freestandingDriverComplete flip |
| 5 M2 (Name B full freestanding Mult write) | **Done** -- Path A host-cc `slake-mult-fs-write-cc`; freestandingDriverComplete true; product Lake remains |
| 5 M3 (subset language front-end design) | **Done** -- note `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md`; implement Done when draft; StillUsesLake true until M6 |
| 5 M3 (subset language front-end implement) | **Done** -- SubsetFront + Main; slake-subset-front; just subset-front; G1/G2 accept B1-B3 reject; dual evidence; Lake host OK |
| 5 M4 (product-wire without-Lake design) | **Done** -- design note `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md`; StillUsesLake true until M6 |
| 5 M4 (product-wire without-Lake prebuilt Name A) | **Done** -- just freestanding-capable-regenerate-without-lake; prebuilt CapableRegenerate; productWireWithoutLakeFinished true; product Lake remains |
| 5 M4 (product-wire freestanding writer Name B) | **Done** -- Path A host-cc product-wire writer; productWireFsWriterFinished true; product Lake remains |
| 5 M4 (official build without-Lake Name C) | **Done** -- just build prefers Name B else Name A; no lake on hot path; product Lake remains |
| 5 M5 (design) | **Done** -- note `doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md`; inventory + honesty + Names A/B/C; cites M1/M3/M4 |
| 5 M5 (multi-unit package rebuild join Name A) | **Done** -- SubsetPackageJoin / just subset-packages-rebuild-join; dual evidence Mult..Compose; subsetPackageJoinFinishedClaimed true; StillUsesLake true until M6 |
| 5 M5 (front-end Mult package path Name B) | **Done** -- FrontMultPackage / just front-mult-package; G1 accept + Mult package write; frontMultPackageFinishedClaimed true; dual evidence; StillUsesLake true until M6 |
| 5 M5 (without-Lake package join deepen Name C) | **Done** -- just subset-packages-rebuild-join-without-lake; prebuilt Mult..Compose; subsetPackageJoinWithoutLakeMultiUnitFinishedClaimed true; StillUsesLake true until M6 |
| 5 M6 (Lake retire design) | **Done** -- note `doc/dev/research/m6-lake-retire-design-2026-08-01.md`; inventory Lake vs Lake-free hot path; operational M6; honesty matrix; phase 1/2/3 Names; false-park correction |
| 5 M6 (Lake retire implement phase 1) | **Done** -- LakeRetireInventory / just lake-retire-inventory; productPathMeasuredStepsLakeFreeEvidence true; StillUsesLake stayed true; join `/tmp/grok-1000/grok-impl-summary-m6-phase1.md` |
| 5 M6 (product-path Lake pins flip) | **Next Open** -- StillUsesLake/DependsOnLake false with elaborator proof only |
| Always | Hygiene if novel markdown; no C/shell product growth; no free forge |

Claim flag changes still need Lake elaborator proof while we bootstrap. Measure
stays pure Nix.

---

## 12. Defaults

| Question | Default |
|----------|---------|
| Start Step 0 then Step 1 after approval? | Yes (done) |
| Linear contracts before residual free claim? | Yes (done) |
| Open full formal Idris/Lean isomorphism now? | No |
| Auto-start PROVABLY / LLVM after free? | No |
| After free + complete + S0-S3 + M1 + M2 + M3 + M4 + M5 (Names A/B/C) closed, next? | M6 design then implement (ideal M0-M6) -- **done**. Next program: peer elaborator (`.agents/plans/plan-peer-elaborator.md`). Never auto-forge host free / PROVABLY / llvm; driver stdout hygiene parallel non-blocking |
| Keep Lake for building M1 unit surfaces? | **Yes** (under Lake until M2/M6) |
| Forge StillUsesLake false before M6? | **No** |
| Divert residual into beastdb? | **No** (orthogonal; soft couple only) |
| Skip inventory and invent S1 without note? | No (Phase A done first; Mult path done) |
