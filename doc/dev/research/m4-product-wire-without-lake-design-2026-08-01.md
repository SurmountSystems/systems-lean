# M4 product-wire without-Lake design

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
| M3 subset language front-end | done (SubsetFront / just subset-front) |
| M4 product-wire without-Lake | **design only here** |
| Ownership regenerate WithoutLake (B30) | true (authority pin; not product StillUsesLake false) |
| S4 / M6 Lake retire | deferred |
| Step 4 PROVABLY / LLVM | held |

Plan: `.agents/plans/plan-residual-free-freestanding.md` ideal ladder **M4**.
Related cites:

- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md` (M2 operational meaning + honesty matrix)
- `doc/dev/research/name-b-full-mult-write-design-deepen-2026-08-01.md` (prebuilt vs non-Lake-built ELF)
- `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md` (design -> implement Done when shape)
- `doc/dev/research/lake-vs-slake-serial-bench-2026-08-01.md` (cold wall vs product just build)
- Host: `SystemsLean/CapableRead.lean`, `CapableCompose.lean`, `CapableWriteHc.lean`,
  `CapableRegenerate.lean`, `InstallOut.lean`, `OfficialRetire.lean`, `SelfApplyFs.lean`
- Self-host map: `src/systems/self-host.md` Bootstrap / ideal ladder rows
- Process glue: root `justfile` (`build`, `freestanding-capable-regenerate`,
  `freestanding-capable-*-lake-free`, `ownership-regenerate-lake-free`)

---

## 1. Why M4 (gap after M2 / M3 and after B26..B40)

M2 proved a **subset** measured step can run without Lake on the hot path
(Mult rebuild prebuilt; Mult package freestanding host-cc writer). M3 added a
tiny subset language front-end. Claim B complete already closed ownership /
perform / dual-eq WRITE cliffs under Lake host honesty.

What remains for ideal **M4** is the **product freestanding wire regenerate**
as a measured path that does **not** invoke Lake as the product path writer,
while product StillUsesLake / DependsOnLake stay **true** until M6.

| Surface already closed | Still Lake-bound as product writer |
|------------------------|------------------------------------|
| Capable* Lake-free **measures** (B26 READ, B27 COMPOSE, B28 WRITE-HC greps) | Official `just build` -> `freestanding-capable-regenerate` -> `lake build` + `lake exe` |
| Ownership regenerate WithoutLake **authority pin** (B30 true) | WithoutLake pin is not "just build without lake" and not StillUsesLake false |
| Mult without-Lake Name A / Name B full | Mult package / Mult rebuild only; not full freestanding dialect WRITE + install Out |
| FreestandingEmit retired as **official** writer (B38 RETIRE-OFFICIAL) | Capable dual-eq WRITE still runs inside a **Lake exe host** on the official path |

**Plan M4 success shape:** ordered READ + COMPOSE + WRITE-HC + INSTALL of the
product freestanding wire without Lake as the product path writer for the
**measured** regenerate step.

M4 does **not** mean: StillUsesLake false, full elaborator retire (M6/S4),
PROVABLY, llvm, free/complete re-open, or hand-authored product C.

---

## 2. Inventory: today product path steps vs Lake-owned surfaces

### 2.1 Official product path (what humans and `just check` call "build")

```
just build
  requires: lake on PATH (fail closed if missing)
  requires: CapableRegenerate.lean + CapableWriteHc.lean present
  -> just freestanding-capable-regenerate
       (cd src/systems
        lake build slake-freestanding-capable-regenerate
        lake exe slake-freestanding-capable-regenerate -- <repo-root>)
  -> freestandingCapableOrderedRegenerate:
       1/4 freestandingCapableReadDualSsot          (CapableRead)
       2/4 freestandingCapableComposePlanApplyBody  (CapableCompose)
       3/4 freestandingCapableWriteFreestandingHc   (CapableWriteHc dual-eq)
       4/4 freestandingCapableInstallFreestandingOut (InstallOut)
  -> emit/slake_freestanding.{h,c} written; out/freestanding-c/ installed
```

| Step | Host module | Lake exe / just (Lake path) | Real IO role |
|------|-------------|------------------------------|--------------|
| **READ** | `CapableRead.lean` | `slake-freestanding-capable-read` / `freestanding-capable-read` | Dual SSOT read Mult..Out (token + HEADER/BODY); fail closed |
| **COMPOSE** | `CapableCompose.lean` | `slake-freestanding-capable-compose` / `freestanding-capable-compose` | Plan/apply/body dual SSOT structural compose |
| **WRITE-HC** | `CapableWriteHc.lean` (+ Load) | `slake-freestanding-capable-write-hc` / `freestanding-capable-write-hc` | Dual-eq SSOT vs Emit* fragments; dialect apply; write `emit/slake_freestanding.{h,c}` |
| **INSTALL** | `InstallOut.lean` | `slake-freestanding-capable-install-out` / `freestanding-capable-install-out` | Copy emit .h/.c to `out/freestanding-c/` (preserve README) |
| **ORDERED JOIN** | `CapableRegenerate.lean` | `slake-freestanding-capable-regenerate` / `freestanding-capable-regenerate` | Calls 1..4 in order; official `just build` entry |

**Honesty on ordered join today** (`CapableRegenerate`):

| Pin | Value |
|-----|-------|
| `productPathFreestandingCapableRegenerateDependsOnLake` | **true** (Lake exe host) |
| `productPathFreestandingCapableRegenerateAuthorityNotEmit` | true (no FreestandingEmit product authority) |
| `productPathFreestandingCapableRegenerateInstallOutOpen` | false (B20 install owns Out) |
| Living tip `productPathOfficialPathStillUsesLake` | **true** |
| Product StillUsesLake / DependsOnLake | **true** |

### 2.2 Lake-free surfaces that exist today (not official product writer)

These prove step **contracts** without `lake build` / `lake exe` on the recipe.
They are **measures / greps / process-glue joins**, not a substitute for
`just build` writing the wire unless a residual explicitly rewires the official path.

| Recipe | What it does | Writes freestanding .h/.c? |
|--------|--------------|----------------------------|
| `freestanding-capable-read-lake-free` (B26) | Dual SSOT presence + token greps | no |
| `freestanding-capable-compose-lake-free` (B27) | Plan/apply/body token + ordered markers | no |
| `freestanding-capable-write-hc-lake-free` (B28) | Dual SSOT + templates/wire host markers | **no** (presence only) |
| `ownership-regenerate-read/compose/write-hc-only` (B23..B25) | Ownership framing greps | no |
| `ownership-regenerate-install-only` (B22) | Shared install shell body | may install only if emit already present |
| `ownership-regenerate-lake-free` (B29) | Ordered join of above | no new dialect WRITE |
| `ownership-regenerate-product-path-authority` (B30) | Authority module import + pin greps | no |

**B30 WithoutLake true** means freestanding product path **authority** for
ownership regenerate is claimed without FreestandingEmit, with Lake-free Capable*
depth documented. It does **not** mean:

- `just build` skips lake
- product `StillUsesLake` is false
- a freestanding ELF owns dual-eq WRITE of the full dialect

### 2.3 Diagnostic / retired product writers (Lake-owned or non-official)

| Path | Role today |
|------|------------|
| `FreestandingEmit` / `slake-emit-freestanding-c` | Diagnostic Lake emit; **not** official product writer after B38 |
| `write-freestanding-hc` / `ProductPathWriteHc` | Decomposed perform WRITE that still uses FreestandingEmit.emitAtRoot |
| `read-product-ssot` / `compose-product-plan` | Decomposed perform substrates (Lake) |
| `install-freestanding-c-out` (if present) | Thin install process glue; not dual-eq WRITE |

### 2.4 Mult without-Lake (M2) vs product-wire without-Lake (M4)

| Dimension | M2 (done) | M4 (this design) |
|-----------|-----------|------------------|
| Measured artifact | Mult unit package `slake_mult_subset.{h,c}` | Full freestanding dialect `slake_freestanding.{h,c}` + Out install |
| Name A prebuilt | `mult-subset-rebuild-without-lake` prebuilt Mult rebuild ELF | Prebuilt `slake-freestanding-capable-regenerate` (or ordered equivalent) |
| Name B freestanding writer | Path A host-cc Mult package writer (`slake-mult-fs-write-cc`) | Freestanding dual-eq product writer outside `.lake/build/bin` |
| Local finished pin | `multSubsetRebuildWithoutLakeFinishedClaimed` / `freestandingDriverComplete` | New local pin(s) for product-wire measured step; **not** product StillUsesLake |
| Product StillUsesLake | stays true | **stays true** until M6 |

### 2.5 What M4 reuses vs invents

| Reuse | Do not invent |
|-------|----------------|
| Capable* dual-eq WRITE text assembly (Lean SSOT + Emit* fragments) | Hand-edited freestanding C as Systems Lean progress |
| Install Out contract (emit -> `out/freestanding-c/`) | Second competing official emit stage id |
| Dual evidence pattern (Lean pin + on-disk greps) | Grep-only theater sold as product writer |
| M2 Name A / Path A shapes (prebuilt; host-cc freestanding tool) | Kitchen-sink `ProductPathFreestanding*` basenames for new modules |
| B26..B28 lake-free measures as **acceptance greps** after a real write | Replacing real WRITE with B28 greps alone |
| Short role names (`ProductWire`, `WireRegen`, `CapableRegenPrebuilt` style) | Stage-id basenames (`B41`, `M4-V0` in file names) |

---

## 3. Operational meaning: "without Lake as product path"

**Measured product-wire regenerate step** means the path that produces:

1. Fresh `src/systems/emit/slake_freestanding.h` and `.c` (dual-eq WRITE depth), and
2. Installed `out/freestanding-c/slake_freestanding.{h,c}` (INSTALL),

in the **ordered** READ + COMPOSE + WRITE-HC + INSTALL sense of
`freestandingCapableOrderedRegenerate`.

**Without Lake for that step** means:

| Allowed at step time | Not enough / not M4 |
|----------------------|---------------------|
| A **prebuilt** host binary already on disk (Lake-built once earlier, or later freestanding) | Invoking `lake build` / `lake exe` / `lake env` as part of the measured step |
| A **freestanding** host-cc or Slake-built driver that performs dual-eq WRITE + install | Only running B26..B28 / B29 lake-free greps without a real write |
| Thin just recipe that runs the prebuilt/freestanding binary (process glue only) | New shell mill that reimplements dialect emit in bash |
| Dual evidence: Lean structural pin + on-disk freestanding stage tokens after the non-Lake run | Flipping StillUsesLake false; selling B30 WithoutLake as M4 done |

**Clarifications:**

1. **Bootstrap vs measured step.** Classic Lean Lake may still elaborate Systems
   Lean for host work (StillUsesLake true). M4 only requires the **measured
   product-wire regenerate** not to call Lake. Full product-path Lake retire is
   **M6 / S4**.

2. **Prebuilt lake exe (Name A partial).** First minimal implement may ship:
   bootstrap once `lake build slake-freestanding-capable-regenerate`, then a just
   recipe (e.g. `freestanding-capable-regenerate-without-lake` or
   `build-without-lake`) that runs the **already-built**
   `.lake/build/bin/slake-freestanding-capable-regenerate` **without** `lake` on
   the hot path. Honest if dual evidence greps pass and docs say Lake was used
   only to prebuild.

3. **Freestanding product writer (Name B deepen).** Ideal M4 deepen: dual-eq
   freestanding dialect write + install implemented by a binary that is **not**
   a Lake-built ELF (host `cc` from Lean-generated C, or later Slake-built). Same
   spirit as M2 Name B Path A Mult package writer. Not required for first M4
   implement Name; do not forge freestanding product writer existence.

4. **Three languages only.** No new Python. No new shell mill for emit logic.
   just stays thin process glue. Product logic stays Lean (or freestanding C
   **generated** by Lean/Slake, not hand-authored features).

5. **Official path rewire is optional for first residual.** Name A may land a
   **measured** without-Lake recipe without replacing `just build` yet. A later
   residual may point `just build` at the without-Lake recipe once dual evidence
   is green -- still without flipping StillUsesLake. Do not forge "Lake gone from
   product path" in prose until the official recipe actually avoids lake.

---

## 4. Honesty matrix

| Pin / claim | Today | After M4 design | After first M4 implement (proposed) | After M6 only |
|-------------|-------|-----------------|--------------------------------------|---------------|
| Product `StillUsesLake` | true | true | **true** | may false with elaborator proof |
| Product `DependsOnLake` | true | true | **true** | may false with elaborator proof |
| `productPathOfficialPathStillUsesLake` | true | true | **true** | as product pins |
| `productPathFreestandingCapableRegenerateDependsOnLake` | true | true | true on host module (Lake may still elaborate host) | as product pins |
| Claim A free | true | true | **unchanged** | unchanged by Lake |
| Claim B complete | true | true | **unchanged** | unchanged by Lake |
| `freestandingDriverComplete` (Mult package Path A) | true | true | **orthogonal unchanged** (unless separate Mult residual) | orthogonal |
| `productPathOwnershipRegenerateWithoutLake` (B30) | true | true | true (not re-opened; not sold as M4 alone) | true |
| Local product-wire without-Lake finished pin (new) | absent / false | false | **true only if** measured non-Lake driver + dual evidence | true (deepen) |
| PROVABLY | false / held | held | held | separate bar |
| llvm / out/llvm-ir | deferred | deferred | deferred | after real self-host acceptance |
| Residual free measure green | green | green | green | green |

**Non-claims this design must not dilute:**

- free is not Lake gone
- complete is not residual free and not Lake gone
- freestandingDriverComplete is Mult package writer complete, not full product-wire without-Lake
- B30 WithoutLake is ownership authority, not official `just build` without lake
- M4 implement is not S4 / M6 StillUsesLake false

---

## 5. Candidate implement paths (checkable Done when drafts)

Prefer **Name A** first (measurable, mirrors M2 Name A). Name B is deepen after
Name A dual evidence is green.

### Name A -- Product-wire without-Lake prebuilt driver (prefer first implement)

| Field | Draft |
|-------|--------|
| **Name** | M4 product-wire without-Lake prebuilt |
| **Goal** | Measured freestanding product-wire regenerate (READ+COMPOSE+WRITE-HC+INSTALL) without invoking Lake on the hot path, using a prebuilt CapableRegenerate binary. |
| **Done when** | (1) just recipe (e.g. `freestanding-capable-regenerate-without-lake` or `build-without-lake`) runs prebuilt `.lake/build/bin/slake-freestanding-capable-regenerate` (or documented install path) with **no** `lake build` / `lake exe` / `lake env` on the measured path. (2) Bootstrap path documented: once `lake build slake-freestanding-capable-regenerate` (or CI artifact) before measure. (3) Dual evidence after measured run: Lean structural pin(s) for local finished + recipe/prebuilt path; on-disk greps of freestanding stage tokens in `emit/slake_freestanding.{h,c}` and/or Out. (4) Product StillUsesLake / DependsOnLake remain true; free/complete/freestandingDriverComplete unchanged; no PROVABLY/llvm forge. (5) Presence dual-pin if new host pins; docs self-host M4 Name A row; residual/handoff/WATCHER; gates: measured just + systems-host + product-residual-free-measure + hygiene green. |
| **Out of scope** | StillUsesLake false; free/complete re-open; freestanding non-Lake-built ELF (Name B); S4/M6; PROVABLY; llvm; hand product C; Mult package redesign |
| **Primary paths (draft)** | `justfile`; `SystemsLean/CapableRegenerate.lean` (or short helper module for without-Lake pins -- short role name only); residual / self-host / handoff / WATCHER / plan |
| **Local pin naming** | Prefer short greppable names e.g. `productWireWithoutLakeFinishedClaimed`, `justRecipeProductWireWithoutLake`, `prebuiltCapableRegenerateRel` -- not kitchen-sink productPathFreestanding* stacks |

### Name B -- Product-wire freestanding writer (deepen after Name A)

| Field | Draft |
|-------|--------|
| **Name** | M4 product-wire freestanding writer |
| **Goal** | Dual-eq freestanding dialect WRITE + INSTALL on the measured product path via a writer that is **not** a Lake-built ELF (host-cc from Lean-generated C and/or later Slake-built driver). |
| **Done when** | (1) Measured just recipe runs writer outside `.lake/build/bin` (host-cc binary under e.g. `src/systems/bin/` or freestanding Out tool). (2) Real dual-eq WRITE of `emit/slake_freestanding.{h,c}` + install Out (not greps alone). (3) Dual evidence Lean pin + on-disk stage tokens. (4) Product StillUsesLake / DependsOnLake still true until M6. (5) Docs + gates green; freestandingDriverComplete remains Mult-orthogonal unless residual explicitly extends it (prefer separate pin for product-wire freestanding writer). |
| **Out of scope** | StillUsesLake false; S4 forge; free/complete re-open; PROVABLY; llvm; replacing Mult Name B scope |
| **Path preference** | Reuse M2 Path A pattern: Lean-generated freestanding C tool + host `cc`; thin just; no new shell mill |

### Name C -- Official `just build` points at without-Lake (optional follow-on)

| Field | Draft |
|-------|--------|
| **Name** | M4 official build without-Lake wire-up |
| **Goal** | Point official `just build` at the green without-Lake measured recipe so product path humans use matches the measured non-Lake step. |
| **Done when** | `just build` no longer calls `lake` on the hot path; still fails closed if prebuilt/freestanding writer missing; dual evidence; StillUsesLake product pins **true**; docs honesty. |
| **Out of scope** | M6 StillUsesLake false; inventing a second emit stage |

**Recommendation:** Open residual after this design = **Name A** only. Do not start
Name B/C in the same slice. Cap: one implement residual with checkable Done when.

---

## 6. Gates and dual evidence (for implementers)

| Gate | Role |
|------|------|
| Measured without-Lake just recipe | Exit 0; no lake on hot path |
| Dual greps on emit (and Out if install in measure) | Stage tokens e.g. freestanding emit stage / dual-eq honesty markers already required by product wire |
| `just systems-host` | Presence dual-pin if new Lean pins / modules |
| `just product-residual-free-measure` | Free measure stays green; no managed residual forge |
| `just hygiene` | ASCII + professional tone |
| Lake build of CapableRegenerate (bootstrap / host) | Host elaborator still OK; not the measured without-Lake hot path |

Driver stdout (any new Lean this residual may touch later): short stage banner,
paths, pin values only -- no residual non-claims theater (policy in `AGENTS.md`).
**This design slice:** docs only; no Lean theater.

---

## 7. Residual Open switch (after this design lands)

**Close:** M4 product-wire without-Lake design (this note + residual archive).

**Open next (plan default):**

### M4 product-wire without-Lake prebuilt

| Field | Content |
|-------|---------|
| **Name** | M4 product-wire without-Lake prebuilt |
| **Goal** | Measured freestanding product-wire regenerate without Lake on the hot path via prebuilt CapableRegenerate binary. |
| **Done when** | As Name A section 5 (checkable). |
| **Out of scope** | Name B freestanding writer; StillUsesLake false; free/complete re-open; PROVABLY; llvm; S4/M6 forge |
| **Primary paths** | `justfile`; CapableRegenerate (or short without-Lake pin helper); residual / self-host / handoff / WATCHER; presence if needed |
| **Status** | open after design |

Plan Remaining after Name A: Name B deepen optional; Name C official wire-up optional;
M5 after M4 implement progress; S4/M6 deferred; Step 4 held.

---

## 8. Self-host / plan lockstep (what docs must say)

| Doc | Update on design close |
|-----|------------------------|
| `src/systems/self-host.md` | M4 design row -> done (cite this note); Open implement Name A |
| `RESIDUAL-systems.md` | Archive design; Open Name A; living tip M4 design done |
| `RESIDUAL.md` | Systems Open table Name A |
| `WATCHER.md` | `/implement` Name A |
| `doc/SESSION-HANDOFF.md` | Living tip M4 design done; Open prebuilt implement |
| `src/systems/README.md` | Short living tip only (map; no residual novel) |
| Plan Step 5 M4 design | **Done**; M4 Name A next |

---

## 9. Summary

M4 is the product-wire analogue of M2 without-Lake: **measured** ordered
READ+COMPOSE+WRITE-HC+INSTALL without Lake on the hot path, with product
StillUsesLake true until M6. Today official `just build` still lake-builds and
lake-execs `slake-freestanding-capable-regenerate`. Lake-free Capable* greps and
B30 WithoutLake authority are **not** M4. Prefer Name A prebuilt first; Name B
freestanding writer later; optional Name C rewires official build after evidence.
No free/complete/PROVABLY/llvm forge; freestandingDriverComplete stays Mult-
orthogonal.
