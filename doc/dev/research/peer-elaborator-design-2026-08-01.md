# Peer elaborator design (Mult-first host fragment)

Kind: analysis only. Not residual implement of IR. Not product claim. Not pin flip.
ASCII only. Date: 2026-08-01.
Repo: /home/hunter/Projects/ai/iso

Plan SSoT: `.agents/plans/plan-peer-elaborator.md`
Explore joins (analysis only):
- `/tmp/grok-1000/explore-peer-elaborator-map.md`
- `/tmp/grok-1000/explore-minimal-peer-elaborator.md`

Related research (not re-opened here):
- `doc/dev/research/m3-subset-language-frontend-design-2026-08-01.md`
- `doc/dev/research/m4-product-wire-without-lake-design-2026-08-01.md`
- `doc/dev/research/m5-compiler-packages-self-application-design-2026-08-01.md`
- `doc/dev/research/m6-lake-retire-design-2026-08-01.md`
- `doc/dev/research/lake-vs-slake-proper-bench-2026-08-01.md`
- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md`
- `doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`

---

## 1. Mission

Systems Lean is a freestanding, garbage-collection-free language and product
path. Slake is the compiler written in Systems Lean. The product wire is
runtimeless freestanding C under `src/systems/emit/` and `out/freestanding-c/`,
with memory safety from linear and affine types, not a managed runtime on the
product path. Classic Lean Lake still elaborates host `.lean` under
`src/systems/` during bootstrap. A **peer elaborator** means freestanding Slake
eventually checks and builds the **same host job** Lake does on a named Mult-first
fragment set, so "Slake vs Lake" times that same job, not a different package
rewrite or product wire regenerate. This note freezes the Mult-first host
fragment elaborator plan only. It does not implement IR, parsers, or pin flips.

---

## 2. Today vs gap

| Fact | Status today | Gap for peer elaborator |
|------|--------------|-------------------------|
| Product residual free | true | None (product residual vs host elaborator residual stay distinct) |
| Freestanding product self-host complete | true | None (writer path complete is not peer elaborate) |
| Product path without Lake on hot path | true (`just build` and measured Mult / package recipes) | None for product wire; does not retire host elaborate |
| Host elaborator residual remains | true (`DualResidual.hostElaboratorResidualRemains`) | Must stay true until step 10 of the plan with freestanding evidence + elaborator proof |
| Product StillUsesLake / DependsOnLake living tip | false (M6 phase 2) | Host develop still uses Lake; product pins already false |
| SubsetFront | Mult IR text lines to `IrProgram.Program`; accept/reject goldens | Not Lean parse; not Systems Lean modules |
| FirstSurface / CompilePath / Kernel* | Fixed Lean fixtures; structural readiness Bools | Not typecheck of host source files |
| MultSubsetEmit / without-Lake Mult write | Freestanding Mult unit package C rewrite | Package write, not host `.lean` elaborate |
| Freestanding Slake elaborates host `.lean` like Lake | **false** | Closed host term representation; Mult-first fragment front-end; check driver; without-Lake check; module graph; package write via that path; same-job wall-clock |
| PROVABLY / LLVM | held | Out of scope for this program |

**Bottom line:** product freestanding self-host and product Lake pin retire are
closed. Peer elaborator is a **new** residual program starting at Mult-first
host fragment check, not a deepen of SubsetFront IR lines alone, and not a
re-open of free or complete.

---

## 3. Green bars (plain English)

| Green bar | Meaning (checkable) |
|-----------|---------------------|
| **Fragment check green** | Freestanding (or host-cc) check of the Mult-first host fragment set exits 0 without Lake on the measured hot path; bad inputs fail closed |
| **Package write green** | That same path writes Mult unit package (`emit/slake_mult_subset.{h,c}`) with existing Mult package dual evidence (structural pins + on-disk greps / contract match to Lake oracle where required) |
| **Same-job bench green** | Wall-clock Lake vs Slake on **those same Mult-first modules only**, logged in a research note; never cold full `SystemsLean` package vs Mult write sold as peer race |
| **Host residual shrink** | Named host develop path no longer needs classic Lake, only with freestanding evidence plus elaborator (or successor) proof; never slogans alone |

Driver **print lines** stay short: what ran, paths, raw pins. Residual honesty
and design prose stay in residual, `self-host.md`, and research notes.

---

## 4. Mult-first module list N (not full SystemsLean first)

Ordered fragment set for peer elaborator v0. Paths under `src/systems/`.

| Order | Path | Role |
|-------|------|------|
| 1 | `SystemsLean/Mult.lean` | Closed Mult grades and core defs (inductive, match, validity) |
| 2 | `SystemsLean/MultSubsetEmit.lean` | Mult unit package write surface |
| 3 | `SystemsLean/MultSubsetEmitMain.lean` | Thin `main` IO entry for Mult package write |
| 4 | `SystemsLean/FirstSurface.lean` | As needed: Mult input identity / S1 contracts |
| 5 | `SystemsLean/EmitMult.lean` (+ scaffold if required by emit SSOT) | HOST-EMIT-MULT fragments used by Mult package assembly |
| 6 (optional later) | `SystemsLean/MultTheorems.lean` | Theorem parity only if peer green requires proof check, not only executable package write |

**Explicitly not first:** full `SystemsLean.lean` import shell (~200 modules),
SelfApplyFs / full product path claim surface, all lake exes, Linear..Compose
expansion (that is expand work after Mult package peer green), mathlib, macros.

**Dialect posture (default recommendation):** prefer growing a **documented Mult-first
host dialect** (and/or Slake-facing subset language growth from SubsetFront) over
reimplementing full Lean 4 elaborator day one. Hybrid is acceptable: short term
package writers without elaborate remain package evidence; medium term peer green
on Mult fragment check + Mult package write; long term either migrate more host
modules into Slake dialect or keep Lake for host proof develop only. Decision
fork when implementing step 3: reimplement tiny Lean-like syntax for Mult-first
sources vs migrate Mult-first sources into Slake dialect files. Default in this
plan: **tiny Lean-like Mult-first subset** with package stage-token equality
first (plan defaults), not full SystemsLean and not mathlib-shaped features.

---

## 5. Step sequence (1-10; residual Names and Done when shapes)

Matches `.agents/plans/plan-peer-elaborator.md`. Global step numbers never restart.
Never put step numbers in product APIs or module basenames.

### Step 1 -- Peer elaborator design (this note)

| Field | Content |
|-------|---------|
| **Name** | Peer elaborator design |
| **Goal** | Freeze Mult-first peer bar, green bars, module list N, step sequence, non-claims, next residual Name. |
| **Done when** | Research note at `doc/dev/research/peer-elaborator-design-2026-08-01.md` (ASCII); Mult-first list; green bars; candidate next Names; join summary GREEN. Parent may open residual step 2. |
| **Out of scope** | Implement IR/parser; pin flips; edit residual/WATCHER (parent owns); Step 4 PROVABLY. |

### Step 2 -- Host term representation

| Field | Content |
|-------|---------|
| **Name** | Host term representation |
| **Goal** | Closed host term / command representation for Mult-first fragment (beyond Mult IR node lines only). |
| **Done when** | Short role modules under `SystemsLean/` (not kitchen-sink product path names); fixtures; pure Nix / just gates green; `hostElaboratorResidualRemains` still true; free/complete unchanged; no PROVABLY/llvm. |
| **Out of scope** | Full Lean syntax; Lake package manager; freestanding elaborate of whole tree. |

### Step 3 -- Host fragment front-end

| Field | Content |
|-------|---------|
| **Name** | Host fragment front-end |
| **Goal** | Parse/check Mult-first host fragment sources (documented dialect or tiny Lean-like subset), composed with step 2 representation. |
| **Done when** | Front-end module + goldens under `src/systems/goldens/`; just recipe GREEN accept and reject; dual evidence; host residual honesty unchanged. |
| **Out of scope** | Full Lean 4 parser; mathlib; tactic scripts as success. |

### Step 4 -- Host fragment check

| Field | Content |
|-------|---------|
| **Name** | Host fragment check |
| **Goal** | Measured check driver over fixed Mult-first corpus: accept good, fail closed on bad; Lake-built host binary OK. |
| **Done when** | just recipe runs check over fixed Mult-first corpus; fail closed; dual evidence; product wire / free / complete unchanged; documents remaining Lake bootstrap. |
| **Out of scope** | Freestanding without-Lake hot path (that is step 5); host residual free claim. |

### Step 5 -- Check without Lake

| Field | Content |
|-------|---------|
| **Name** | Check without Lake |
| **Goal** | Same corpus as step 4 measured without `lake` on the hot path (prebuilt or host-cc freestanding path, same spirit as Mult without-Lake product recipes). |
| **Done when** | without-Lake just recipe GREEN; local finished pin for this check surface true; product Lake pins remain false; host residual remains true. |
| **Out of scope** | Full SystemsLean package rebuild; host free claim. |

### Step 6 -- Fragment module graph

| Field | Content |
|-------|---------|
| **Name** | Fragment module graph |
| **Goal** | Resolve a tiny multi-file Mult-first import set under without-Lake check (e.g. Mult + MultSubsetEmit + thin deps). |
| **Done when** | Documented import closure + measured multi-file goldens; just recipe; presence dual-pin if new modules; non-claims explicit. |
| **Out of scope** | Full SystemsLean import graph; `.olean` wire compatibility with Lake as success. |

### Step 7 -- Elaborator Mult package write

| Field | Content |
|-------|---------|
| **Name** | Elaborator Mult package write |
| **Goal** | Peer check path drives Mult unit package write with package evidence matching the existing Mult package path. |
| **Done when** | Package write green bar met; dual evidence; free/complete/product wire honesty unchanged. |
| **Out of scope** | Linear..Compose multi-unit peer expand (step 9); PROVABLY/llvm. |

### Step 8 -- Same-job peer wall-clock

| Field | Content |
|-------|---------|
| **Name** | Same-job peer wall-clock |
| **Goal** | Measure Lake vs freestanding Slake on the same Mult-first modules only. |
| **Done when** | Both paths exit 0; wall-clock table in research note; ratios honest; never full-package cold Lake vs Mult write as peer win. |
| **Out of scope** | Using bench alone to flip host residual free. |

### Step 9 -- Expand host fragment set

| Field | Content |
|-------|---------|
| **Name** | Expand host fragment set |
| **Goal** | After steps 7-8, grow N (e.g. more Mult companions or Linear.. unit shapes) under new residual Names with checkable Done when. |
| **Done when** | Named expand residual(s) green; green bars re-checked on expanded set. |
| **Out of scope** | Jump to full host residual free without evidence. |

### Step 10 -- Host residual shrink

| Field | Content |
|-------|---------|
| **Name** | Host residual shrink |
| **Goal** | Evidence that a named host develop path no longer requires classic Lake. |
| **Done when** | Explicit inventory of what still needs Lake; any pin change only with elaborator (or successor) proof; DualResidual theorems; residual free measure green; `hostElaboratorResidualRemains` flipped only if Done when truly met. |
| **Out of scope** | PROVABLY; llvm; mathlib; "Lake deleted from tree" theater; free alone as Lake gone. |

**Approach chain (plan):**

```
Mult subset front-end (done for unit IR text)
  -> closed host term representation
  -> Mult-first host fragment front-end
  -> check driver (Lake-built OK first)
  -> check without Lake on hot path
  -> tiny multi-file import set
  -> check + Mult unit package write
  -> same-job wall-clock vs Lake
  -> expand module set; host residual shrink with evidence only
```

Not: reimplement all of Lean first; claim peer via greps alone; only grow C packages.

---

## 6. Non-claims

| Non-claim | Rule |
|-----------|------|
| PROVABLY | Held; needs real CompCert / ccomp evidence (plan Step 4 elsewhere). Do not start here. |
| llvm / `out/llvm-ir` | Deferred until self-host evidence policy says otherwise. |
| Host elaborator residual gone | Do not forge `hostElaboratorResidualRemains` false or `hostElaboratorResidualFreeClaimed` true without step 10 Done when. |
| Free / complete re-open or abuse | Product free and product self-host complete stay as living tips unless evidence forces re-open; neither equals peer elaborator. |
| Product Lake pins mean host peer | Product StillUsesLake / DependsOnLake false is M6 product path honesty, not freestanding elaborate of host `.lean`. |
| SubsetFront equals Lean parse | False. Mult IR text only. |
| Kernel* equals Lean kernel | False. Host IR fixtures only. |
| Package rewrite equals elaborate | Mult without-Lake write is package evidence, not peer elaborator green. |
| Full Lean 4 / mathlib parity | Out of project goal for peer v0. |
| Three languages only | Novel work: Idris 2, Lean 4 (including Slake host), pure Nix. No product C authoring as elaborator body; no shell/Python mills. Freestanding C remains generated product wire. |
| Print-line essays | Drivers print short status only; residual prose stays in residual / self-host / research. |

---

## 7. Candidate residual Names after this design

Parent owns residual Open / WATCHER. This note only names the implement order.

| Order | Residual Name | Plan step |
|-------|---------------|-----------|
| **Next** | **Host term representation** | 2 |
| Then | Host fragment front-end | 3 |
| Then | Host fragment check | 4 |
| Then | Check without Lake | 5 |
| Then | Fragment module graph | 6 |
| Then | Elaborator Mult package write | 7 |
| Then | Same-job peer wall-clock | 8 |
| Then | Expand host fragment set | 9 |
| Then | Host residual shrink | 10 |

**First implement Name after this design:** Host term representation.

Done when shape for that Name (copy into residual when Open): short modules;
fixtures; gates green; host elaborator residual still true; free/complete
unchanged; no PROVABLY/llvm; three languages only.

---

## 8. What exists (brief map, not implement)

| Surface | Paths (examples) | Peer role |
|---------|------------------|-----------|
| SubsetFront | `SystemsLean/SubsetFront.lean`, goldens `goldens/mult-front/` | Mult IR text front-end done; **not** host term peer |
| Mult / MultSubsetEmit | `Mult.lean`, `MultSubsetEmit.lean`, Main | Core of Mult-first N |
| FirstSurface / EmitMult | `FirstSurface.lean`, `EmitMult.lean` | Deps of Mult package path as needed |
| Dual residual | `DualResidual.lean` | Host elaborator residual remains true |
| Self-host complete / Lake retire | `SelfHostComplete.lean`, `LakeRetireInventory.lean` | Product Lake pins false; host elaborate remains |
| Mult without-Lake package | just Mult freestanding write / rebuild recipes | Package path to reuse for package write green, not as elaborate claim |
| Product wire | `just build`, freestanding emit / install | Orthogonal to peer elaborator |
| Bench methodology | `lake-vs-slake-proper-bench-2026-08-01.md` | Same-job discipline for step 8 |

Critical files from plan (read/edit only when residual Open): `SubsetFront.lean`,
`Mult.lean`, `MultSubsetEmit.lean`, `DualResidual.lean`, `LakeRetireInventory.lean`,
`SelfHostComplete.lean`, `self-host.md`, residual, WATCHER, handoff, proper bench
research note, pure Nix host presence.

---

## 9. Verification policy for later implement slices

| Slice type | Proof |
|------------|--------|
| Research design (this step) | Note on disk + hygiene / professional-tone; join GREEN |
| Representation / front-end / check | Goldens red then green; just recipes; dual evidence |
| Claim or residual pin flip | Host elaborator proof while Lake is bootstrap elaborator (`lake` on PATH); greps alone not enough |
| Package write | Mult package dual evidence matches Mult package path |
| Same-job bench | TSV / table in research note; same N modules |
| Free measure / complete | Stay green each slice; do not re-open without cause |
| Host residual shrink | Evidence + proof only (step 10) |

---

## 10. Success (program end state, not this note alone)

Fragment check without Lake on Mult-first N; Mult package write via that path;
same-job wall-clock table; full host peer is explicit expand work (steps 9-10);
product residual free, product self-host complete, and product wire without Lake
on hot path stay honest and unchanged as peer claims.

---

## 11. Cites (join inventory)

| Cite | Use |
|------|-----|
| `/tmp/grok-1000/explore-peer-elaborator-map.md` | Today surfaces, gaps, dual residual pins, PE design Done when shape |
| `/tmp/grok-1000/explore-minimal-peer-elaborator.md` | Mult-first N, peer green definition, dialect vs reimplement Lean, bench same-N rule |
| `.agents/plans/plan-peer-elaborator.md` | Mission, green bars, steps 1-10 residual Names, non-goals |
| `m3-subset-language-frontend-design-2026-08-01.md` | SubsetFront Mult IR; accept/reject goldens pattern |
| `m4-product-wire-without-lake-design-2026-08-01.md` | Product hot path without Lake (not elaborator) |
| `m5-compiler-packages-self-application-design-2026-08-01.md` | Package join / FrontMultPackage; package vs elaborate |
| `m6-lake-retire-design-2026-08-01.md` | Product Lake pin retire vs host elaborator residual remains |
| `lake-vs-slake-proper-bench-2026-08-01.md` | Same-job bench methodology; no peer elaborator yet |
| `src/systems/self-host.md` | Acceptance map for free / complete / dual residual |
| `AGENTS.md` | Three languages; claim flips need elaborator proof; freestanding honesty |

---

## Non-claims for this file

- Not residual Open / WATCHER edit (parent owns)
- Not "peer elaborator exists"
- Not host free / Lake deleted from host develop
- Not PROVABLY / llvm
- Not implement of host term representation or front-end
