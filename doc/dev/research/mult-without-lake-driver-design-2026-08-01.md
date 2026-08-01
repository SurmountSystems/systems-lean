# Mult without-Lake driver design (ideal M2 prep)

Kind: analysis only. Not residual flip. Not product claim. Not implement.
ASCII only. Date: 2026-08-01.

Living tip at design time:

| What | Status |
|------|--------|
| Claim B complete | true |
| Claim A free | true |
| StillUsesLake / DependsOnLake | true (must stay until M6) |
| Mult S0-S3 under Lake (M0) | done |
| M1 Linear + Types (+ Program this session) | under Lake |
| M2 without-Lake driver | **design only here** |
| S4 / M6 Lake retire | deferred |
| Step 4 PROVABLY / LLVM | held |

Living tip (post-implement, 2026-08-01; does not change design non-claims):

| What | Status |
|------|--------|
| M2 Name A Mult without-Lake prebuilt | **done** (`just mult-subset-rebuild-without-lake`; withoutLakeFinished true) |
| M2 Name B freestanding Mult surface dual-check partial | **done** (greps; `MultFsDeepen` / `just mult-subset-freestanding-deepen`; freestandingDeepenPartial true) |
| M2 host MultSubsetEmit freestanding Mult SSOT write path | **done** (`just mult-subset-freestanding-write` / prebuilt `slake-mult-fs-write`; multFsWritePathReady true; Mult rebuild ELF not package writer; freestandingDriverComplete **false**) |
| M2 Name B full freestanding Mult write driver | **design deepen done** (`name-b-full-mult-write-design-deepen-2026-08-01.md`); **implement open** (Mult write without Lake-built ELF; freestandingDriverComplete false until dual evidence) |
| StillUsesLake / DependsOnLake | **true** (until M6) |
| S4 / M6 / Step 4 | deferred / held |

Plan: `.agents/plans/plan-residual-free-freestanding.md` Step 5 M2.
Related: Mult S2/S3 modules, `lake-vs-slake-serial-bench-2026-08-01.md`.

---

## 1. Operational meaning: "without Lake for that step"

**Measured step** means the Mult unit package re-emit / re-validate path that
today is:

```
just mult-subset-rebuild
  -> lake build slake-mult-subset-rebuild
  -> lake exe slake-mult-subset-rebuild -- <root>
  -> write emit/slake_mult_subset.{h,c}
```

**Without Lake for that step** means:

| Allowed at step time | Not enough / not M2 |
|----------------------|---------------------|
| A **prebuilt** host binary already on PATH (built earlier with Lake or later freestanding) | Invoking `lake build` / `lake exe` / `lake env` as part of the measured step |
| A **freestanding** Slake-built driver that performs Mult package write + validate | Only grepping that Mult package files exist without a real driver run |
| Thin just recipe that runs the prebuilt/freestanding binary (process glue only) | New shell mill that reimplements Mult emit logic in bash |
| Dual evidence: Lean structural pin (if host still holds it) + on-disk package greps from the non-Lake run | Flipping `withoutLakeFinished` true without a real non-Lake driver path |

**Clarifications:**

1. **Bootstrap vs measured step.** Classic Lean Lake may still elaborate Systems
   Lean for host work (StillUsesLake true). M2 only requires the **measured Mult
   re-emit step** not to call Lake. Full product-path Lake retire is **M6 / S4**.

2. **Prebuilt lake exe.** First minimal implement may ship: `lake build
   slake-mult-subset-rebuild` once (or CI artifact), then a just recipe
   `mult-subset-rebuild-without-lake` that runs the **already-built**
   `.lake/build/bin/slake-mult-subset-rebuild` (or installed path) **without**
   `lake` on the hot path. That is an honest **M2 partial** if dual evidence
   greps pass and docs say Lake was used only to prebuild.

3. **Freestanding host binary (later deepen).** Ideal M2 deepen: Mult package
   write implemented on freestanding product wire / Slake-built driver so the
   measured step needs neither Lake nor a Lake-built ELF. That is **not**
   required for the first M2 implement Name; do not forge freestanding driver
   existence.

4. **Three languages only.** No new Python. No new shell mill for Mult logic.
   just stays thin process glue (invoke binary + greps). Product logic stays
   Lean (or later freestanding C **generated** by Lean/Slake, not hand-authored).

5. **withoutLakeFinished.** Local Mult rebuild pin
   `multSubsetRebuildWithoutLakeFinishedClaimed` stays **false** until a checkable
   non-Lake driver residual closes with evidence. Product StillUsesLake /
   DependsOnLake stay **true** until M6.

---

## 2. Mult package inputs / outputs inventory

### 2.1 S2 Mult subset emit (package write under Lake)

| Role | Path / token |
|------|----------------|
| Module | `src/systems/SystemsLean/MultSubsetEmit.lean` |
| Thin main | `src/systems/SystemsLean/MultSubsetEmitMain.lean` |
| Lake exe | `slake-mult-subset-emit` |
| just | `just mult-subset-emit` |
| Stage / host / surface | `SLAKE_MULT_SUBSET_EMIT_V0` / `HOST-MULT-SUBSET-EMIT` / `MULT-SUBSET-EMIT` |
| Input id | `SLAKE_FIRST_SURFACE_MULT` (S1 `FirstSurface` / `firstSurfaceReady`) |
| Dialect | `HOST-EMIT-MULT` / `emitMultReady` / `EmitMult` fragments |
| Package out | `src/systems/emit/slake_mult_subset.h`, `slake_mult_subset.c` |
| Structural ready | `multSubsetEmitReady`, `multSubsetEmitWroteExpected` (package identity pin) |
| Write | `multSubsetEmitWrite` (IO.FS.writeFile) |
| Lake honesty | `stillUsesLake` / `dependsOnLake` true |
| Greppable package tokens (just) | `MULT-SUBSET-EMIT`, `SLAKE_MULT_SUBSET_EMIT_V0`, `SLAKE_FIRST_SURFACE_MULT`, `HOST-EMIT-MULT`, `MULT-0`; header `enum slake_mult`; body `slake_mult_is_valid` |

### 2.2 S3 Mult subset rebuild (self-application under Lake)

| Role | Path / token |
|------|----------------|
| Module | `src/systems/SystemsLean/MultSubsetRebuild.lean` |
| Thin main | `src/systems/SystemsLean/MultSubsetRebuildMain.lean` |
| Lake exe | `slake-mult-subset-rebuild` |
| just | `just mult-subset-rebuild` |
| Stage / host / surface | `SLAKE_MULT_SUBSET_REBUILD_V0` / `HOST-MULT-SUBSET-REBUILD` / `MULT-SUBSET-REBUILD` |
| Input | S2 package identity (`SLAKE_MULT_SUBSET_EMIT_V0` / `multSubsetEmitReady`) |
| Package out | same `emit/slake_mult_subset.{h,c}` (re-emit/re-validate) |
| Structural ready | `multSubsetRebuildReady`, `multSubsetRebuildSelfApplyOk`, `multSubsetRebuildWroteExpected` |
| Write | `multSubsetRebuildWrite` |
| without-Lake finished (local) | `multSubsetRebuildWithoutLakeFinishedClaimed` **false** |
| Lake honesty | `stillUsesLake` / `dependsOnLake` true |

### 2.3 Supporting Mult / first surface

| Piece | Path / token |
|-------|----------------|
| S1 FirstSurface | `FirstSurface.lean` / `just first-surface` / `SLAKE_FIRST_SURFACE_MULT` |
| Mult dialect SSOT | `EmitMult.lean` / `EmitMultScaffold.lean` / `host_emit_mult.ssot.txt` |
| Mult compile fixture | COMPILE-PATH-MULT / MULT-FIXTURE (FirstSurface reuses) |
| Presence dual-pin | `nix/systems-host-presence/host-leans.nix`, `required-files.nix`, `host-specs-compile-path.nix` |
| Ownership note | `src/systems/emit/host-owned-emit.md` (Mult subset package paragraph) |

### 2.4 What M2 reuses vs invents

| Reuse | Do not invent |
|-------|----------------|
| Mult package text assembly from MultSubsetEmit packages | Second Mult C dialect or hand-edited package |
| Existing validate greps / honesty tokens | New greppable stage soup as product API names |
| Dual evidence pattern (Lean pin + on-disk greps) | Grep-only "without Lake" theater |
| Short role names (`MultWithoutLake` style) | `ProductPathFreestanding*` kitchen-sink names |

---

## 3. Honesty matrix vs StillUsesLake / DependsOnLake

| Pin | Today | After M2 design | After first M2 implement (proposed) | After M6 only |
|-----|-------|-----------------|--------------------------------------|---------------|
| Product `StillUsesLake` | true | true | **true** | may false with proof |
| Product `DependsOnLake` | true | true | **true** | may false with proof |
| Mult rebuild local `stillUsesLake` | true | true | true on host module (Lake may still elaborate host) | as product pins |
| `multSubsetRebuildWithoutLakeFinishedClaimed` | false | false | **true only if** measured step has real non-Lake driver + dual evidence | true (deepen) |
| Claim A free | true | true | unchanged | unchanged by Lake |
| Claim B complete | true | true | unchanged | unchanged by Lake |
| freestandingProductSelfHostComplete re-open | false need | false | **do not re-open** | n/a |
| PROVABLY / llvm | false / held | false / held | false / held | separate Step 4 |

**Rule:** M2 is a **driver / measured-step** milestone. It is **not** S4.
Setting product StillUsesLake false early is a forge.

---

## 4. Proposed implement residual Names (checkable Done when)

### Name A -- Mult without-Lake prebuilt driver (M2 partial)

**Goal:** Mult subset re-emit measured step runs without invoking Lake on the
hot path, using a prebuilt Mult rebuild binary.

**Done when:**

1. Named host module short role (e.g. `SystemsLean.MultWithoutLake` + thin Main
   if needed) **or** documented just-only driver that invokes prebuilt ELF with
   dual evidence; prefer Lean structural pin for without-Lake step ready.
2. just recipe (e.g. `mult-subset-rebuild-without-lake`) that:
   - requires prebuilt binary path (document how to prebuild once with Lake);
   - does **not** call `lake build` / `lake exe` / `lake env` on the hot path;
   - runs Mult package re-write + greps (same Mult tokens as S3);
   - exits non-zero if lake is required mid-step.
3. Local pin may set `multSubsetRebuildWithoutLakeFinishedClaimed` **true** only
   when (2) is green; product StillUsesLake / DependsOnLake remain **true**.
4. Dual evidence: Lean ready bool + theorems/smoke if module exists; just greps
   on `emit/slake_mult_subset.{h,c}`.
5. Host presence dual-pin if new Lean modules; docs: self-host.md M2 partial
   row + README tip map only; residual archive.
6. Gates: focused just green; `just systems-host`; `just product-residual-free-measure`;
   hygiene if md; free/complete/StillUsesLake/PROVABLY/llvm product pins unchanged.

**Out of scope:** freestanding Mult driver ELF from product wire; S4; Step 4;
full dialect regenerate as sole success; hand C; shell mills.

### Name B -- Mult without-Lake freestanding deepen (M2 deepen; later)

**Goal:** Mult package write path available from freestanding / Slake-built
driver without depending on a Lake-built ELF for the measured step.

**Done when:** named freestanding or Slake-built Mult package write path with
dual evidence; prebuilt Lake ELF no longer required for Mult re-emit measure;
product StillUsesLake still true until M6; no PROVABLY/llvm forge.

**Out of scope:** M6 product Lake retire; M4 full product-wire without Lake;
M5 full compiler self-application.

### Name C -- (optional serial) Linear / Types without-Lake after Mult A green

Mirror Name A for Linear or Types only after Mult prebuilt driver is green.
Do not open until Mult A Done when is closed.

---

## 5. Explicit non-claims

1. **Not S4 / M6.** Product StillUsesLake / DependsOnLake stay true.
2. **Not** re-open or flip freestandingProductSelfHostComplete / claim B.
3. **Not** withoutLakeFinished true until a real non-Lake driver residual greens.
4. **Not** product residual free flip (already true; host residual remains).
5. **Not** PROVABLY, not llvm unlock, not Step 4.
6. **Not** full freestanding dialect rewrite as Mult success criterion.
7. **Not** new shell/Python product logic; not hand-authored Mult C features.
8. **Not** inventing M2 implement in this design note -- design only.
9. **Not** claiming prebuilt Lake ELF == freestanding self-host.
10. **Not** auto-starting Name B/C without Open + checkable Done when.

---

## 6. Recommended next after this design

1. **Program subset emit + rebuild** (M1 continue under Lake) if not already
   closed -- independent of M2 implement; grows unit surface.
2. Then open **Mult without-Lake prebuilt driver** (Name A) with Done when above.
3. Hold Name B until Name A green and operator wants freestanding deepen.
4. Hold S4 / M6 / Step 4.

---

## 7. Design close checklist

| Item | Status |
|------|--------|
| (a) Operational without-Lake meaning | this section 1 |
| (b) Mult I/O inventory | section 2 |
| (c) Honesty matrix | section 3 |
| (d) Proposed Names + Done when | section 4 |
| (e) Non-claims | section 5 |
| Driver code | **not** in this note |

Implement join for residual archive should cite this path:
`doc/dev/research/mult-without-lake-driver-design-2026-08-01.md`.
