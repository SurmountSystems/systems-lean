# Plan: Residual-free freestanding Slake (linear types) + bootstrap

ASCII only. Durable product program after claim B freestanding product self-host
complete and product residual free (claim A). Living authority when this file
lags: `WATCHER.md`, `RESIDUAL-systems.md`, `SelfApplyFs.lean` /
`SelfHostComplete.lean` claim flags, `self-host.md`.

**Living goal (2026-08-01):** bootstrap Slake through host-assisted stages
(S0 done foundation; S1 first compiler surface next). Free + complete are
foundation, not the finish line. Missing freestanding binary is bootstrap
**start**, not a blocker.

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

### Step 5 -- Bootstrap program (living goal after free + complete)

**Correction:** "No freestanding binary" does **not** block bootstrap. Bootstrap
starts with Lake elaborating early Slake stages. Freestanding self-application
without Lake is a **later** milestone (S3-S4), not a gate on starting S1.

| Stage | Name | What success looks like | Status |
|-------|------|-------------------------|--------|
| **S0** | Host foundation | Lake elaborates Systems Lean; product wire residual free; claim B writer path true | **Done** |
| **S1** | First Slake compiler surface | Named front-end / driver: defined Mult unit input, checkable translate/check path -- not only regenerate freestanding C API dialect | **Done** (`FirstSurface` / `just first-surface`) |
| **S2** | Emit freestanding C for that subset | Evidence Slake (host-built) wrote Mult unit package for the subset | **Done** (`MultSubsetEmit` / `just mult-subset-emit`; `emit/slake_mult_subset.{h,c}`) |
| **S3** | Rebuild own freestanding subset | Measured Mult subset self-application (Lake-hosted re-emit/re-validate) | **Done** (`MultSubsetRebuild` / `just mult-subset-rebuild`) |
| **S4** | Retire Lake from product path | DependsOnLake / StillUsesLake false only with elaborator proof | **Deferred** after S3; never forge early |
| **S5** | Held tracks | PROVABLY, LLVM IR, full formal iso | Held (Step 4) |

#### Phase A -- Inventory (S1 design)

**Name:** Slake first compiler surface inventory

**Status:** **done** (2026-08-01). Inventory:
`doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`.

S0 done = bootstrap start; lake exe / CompilePath / emit / dialect vs front-end
mapped; Mult unit input + structural readiness output recommended; short names
`FirstSurface` / `SlakeCompile`; non-claims (S1 may use Lake; free != Lake gone;
StillUsesLake stays true); Phase B residual Done when drafted.

#### Phase B -- Implement S1

**Name:** Slake first compiler surface

**Goal:** land a real named compiler surface (Lean under `src/systems/`) for a
tiny Mult unit set -- more than regenerate freestanding API dialect; still
Lake-built if needed.

**Done when:** (from inventory; checkable)

1. Named short-role module(s) (prefer `FirstSurface` / `SlakeCompile`) + lake
   exe and/or `just` recipe.
2. End-to-end host gate: fixed Mult unit input -> expected structural readiness
   (unitCompileReady / Mult fixture fold); optional Mult emit readiness.
3. Residual free measure green if emit/Out touched; prefer not full wire rewrite
   as S1 success.
4. Docs honest: bootstrap S1; Lake host until S4; free/complete non-claims.
5. Lake green on touched modules; no hand-written product C; no StillUsesLake /
   free / complete / PROVABLY / llvm flips.

**Out of scope:** S3 without Lake; S4 Lake retire; PROVABLY; llvm; claim B re-open.

**Status:** **done** (2026-08-01). `SystemsLean.FirstSurface` +
`FirstSurfaceMain`; `slake-first-surface` / `just first-surface`; Mult input
`SLAKE_FIRST_SURFACE_MULT` -> `firstSurfaceReady`; Lake host remains; join
`/tmp/grok-1000/grok-impl-summary-s1-first-surface.md`.

#### Phase C -- S2 / S3

**S2 Done when (retrospective -- met 2026-08-01):** residual Name **Slake Mult
subset emit**.

1. Named short-role module + lake exe + just: `MultSubsetEmit` /
   `MultSubsetEmitMain`; `slake-mult-subset-emit`; `just mult-subset-emit`.
2. Checkable host gate: S1 Mult input `SLAKE_FIRST_SURFACE_MULT` -> Mult unit
   package `emit/slake_mult_subset.{h,c}` (HOST-EMIT-MULT dialect; not full
   freestanding dialect rewrite as sole success).
3. Dual evidence honesty: Lean `multSubsetEmitReady` /
   `multSubsetEmitWroteExpected` = structural package readiness only; actual
   file write proven by lake exe `multSubsetEmitWrite` + just greps (not Lean
   Bool alone as filesystem proof).
4. Residual free measure green (Out residual free held; subset package is emit
   workspace dogfood, not product Out install).
5. Docs honest (README + self-host Bootstrap S2; Lake host until S4;
   free/complete/PROVABLY/llvm non-claims).
6. Lake green; no hand-authored Mult product C; no claim flips.

Land note: join `/tmp/grok-1000/grok-impl-summary-s2-mult-subset-emit.md`.

**S3 Done when (retrospective -- met 2026-08-01):** residual Name **Slake
rebuild freestanding subset**.

1. Named short-role module + lake exe + just: `MultSubsetRebuild` /
   `MultSubsetRebuildMain`; `slake-mult-subset-rebuild`; `just mult-subset-rebuild`.
2. Checkable host gate: S2 package identity `SLAKE_MULT_SUBSET_EMIT_V0` /
   `multSubsetEmitReady` -> measured rebuild / self-application
   (`multSubsetRebuildReady` / `multSubsetRebuildSelfApplyOk`; re-emit/re-validate
   Mult unit package; not full dialect regenerate theater alone).
3. Greppable self-application bar documented in `self-host.md` Bootstrap S3.
4. Residual free measure green (Out residual free held; subset package is emit
   workspace dogfood).
5. Docs honest: S3 may still use Lake; without-Lake finished later (S3 deepen /
   S4); free/complete/StillUsesLake/PROVABLY/llvm non-claims held.
6. Lake green; no hand-authored product C; no claim flips.

Land note: join `/tmp/grok-1000/grok-impl-summary-s3-subset-rebuild.md`.

Without-Lake self-application finished + S4 Lake retire stay deferred. Serial
wall-time benches only when both sides of a comparison exist (see bench
research note).

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
| After free + complete, next living goal? | Bootstrap S1 (Step 5); not Step 4 held tracks |
| Keep Lake for building S1? | **Yes** (normal bootstrap) |
| Skip inventory and invent S1 without note? | No (Phase A done first) |
