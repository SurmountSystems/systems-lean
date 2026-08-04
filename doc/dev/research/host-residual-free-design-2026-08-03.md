# Host residual free design (Track 3a)

Kind: analysis only. Not residual invent. Not host free forge. Not DualResidual
pin flip. Not product free re-open. Not Track 4c. ASCII only. Date: 2026-08-03.

Plan: `.agents/plans/plan-north-star-remaining.md` Track 3.
Living tip at land: free true; complete true; product StillUsesLake/DependsOnLake
false; hostElaboratorResidualRemains **true**; hostElaboratorResidualFreeClaimed
**false**; PROVABLY true; llvmUnlocked true (not full backend); proofCompleteClaimed
false.

Related:

- `doc/dev/research/host-residual-shrink-2026-08-02.md` (peer step 10 partial shrink)
- `doc/dev/research/peer-elaborator-design-2026-08-01.md` (green bars + steps 1-10)
- `doc/dev/research/m6-lake-retire-design-2026-08-01.md` (product path Lake retire)
- `doc/dev/research/slake-vs-lake-same-job-mult-2026-08-02.md` (same-job Mult only)
- Host: `DualResidual.lean`, `HostResidualShrink.lean`, `HostFront.lean`,
  `HostCheck.lean`, `HostGraph.lean`, `HostPackageWrite.lean`,
  `LakeRetireInventory.lean`
- Gates: `just host-residual-shrink`; without-Lake peer recipes; lake on claim flips

---

## 1. Goal of this design

Inventory **remaining** Lake host develop surfaces versus **already** measured
without-Lake / freestanding peer coverage. State an honest **Done when** bar for
Track 3c host residual free. Open a prioritized Track 3b shrink deepen queue.
**Do not** flip DualResidual host residual pins in this slice.

**Aggregate honesty (do not confuse surfaces):**

| Claim surface | Living pin | Status |
|---------------|------------|--------|
| Product residual free | `DualResidual.residualFreeClaimed` | **true** |
| Product path StillUsesLake / DependsOnLake | SelfApplyFs / SelfHostComplete living tip | **false** (M6 phase 2) |
| Host elaborator residual remains | `DualResidual.hostElaboratorResidualRemains` | **true** |
| Host elaborator residual free claimed | `DualResidual.hostElaboratorResidualFreeClaimed` | **false** |
| Partial Mult-first peer shrink | `HostResidualShrink.hostResidualPartialShrinkClaimed` | **true** |
| Host free (full Track 3 end claim) | remains false until 3c | **not claimed** |

Product free true is **not** host free. Partial shrink is **not** full free.

---

## 2. What HostResidualShrink already claimed (partial)

From `SystemsLean.HostResidualShrink` + research
`host-residual-shrink-2026-08-02.md` + `just host-residual-shrink`:

| Pin / evidence | Value / meaning |
|----------------|-----------------|
| `hostResidualPartialShrinkClaimed` | **true** -- named Mult-first peer hot paths Lake-free |
| `hostResidualShrinkHostElaborateRemains` | **true** (mirrors DualResidual) |
| `hostResidualShrinkHostFreeClaimed` | **false** |
| `hostResidualShrinkBootstrapPrebuildRemains` | **true** (Lake once / after clean) |
| `hostResidualShrinkFullHostElaborateRemains` | **true** (full SystemsLean still Lake) |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** |
| Measured peer recipes dual-pinned | `host-fragment-check-without-lake`, `host-graph-without-lake`, `host-package-write-without-lake` |

Peer fragment set today (after Expand host fragment set): Mult + MultSubsetEmit +
Linear mini (HostFront G3 / HostGraph Linear companion). Package write peer path
still drives **Mult** unit package only.

---

## 3. Table: Lake-needed host develop vs without-Lake / freestanding peer

### 3a. Host develop peer elaborator surfaces (Track 3 focus)

| Surface | Lake-needed today? | Without-Lake / peer coverage | Notes |
|---------|--------------------|------------------------------|-------|
| Mult-first fragment check corpus (G1/G2/G3 accept + B1-B4 reject) | Bootstrap: `lake build slake-host-fragment-check` once | **Yes:** `just host-fragment-check-without-lake` (prebuilt ELF; no lake on hot path) | Local HostCheck may still pin stillUsesLake true for bootstrap honesty |
| Mult-first multi-file graph (Mult + MultSubsetEmit + Linear) | Bootstrap: `lake build slake-host-graph` | **Yes:** `just host-graph-without-lake` | Missing import / cycle fail-closed |
| Mult package write via peer path | Bootstrap: `lake build slake-host-package-write` | **Yes:** `just host-package-write-without-lake` | HostFront G1 + HostGraph Mult set then Mult package dual-ok |
| Host front Lake path | **Yes** on measured recipe: `just host-front` lake build/exe | Covered indirectly by fragment-check without-Lake | No separate host-front-without-lake recipe required if check path stays green |
| Types-shaped host fragment dialect | **No peer goldens / graph expand yet** | **No** without-Lake Types expand residual | Next Mult.. unit after Linear |
| Program / Graph / Compose host fragment expand | **Not in peer graph** | **No** | Later 3b steps after Types |
| Full SystemsLean package elaborate (~259 host modules) | **Yes** -- classic Lake elaborates `src/systems/` | **No** freestanding peer for full package | Core reason host residual remains |
| Theorem / proof develop on host Lean | **Yes** -- lake build of `*Theorems` packages | **No** peer elaborator for proofs | Orthogonal Track 4; does not alone flip host free |
| Claim-bool flip proof (policy) | **Yes** while Lake is host elaborator (`AGENTS.md`) | Greps alone not GREEN for claim flips | Bootstrap policy; may stay even after named develop bar shrinks |

### 3b. Product wire paths (orthogonal to host residual free)

These are **product path** Lake-free (or Lake-free hot path). They support product
StillUsesLake false / free true. They **do not** retire host elaborator residual.

| Recipe / path | Hot path Lake? | Role |
|---------------|----------------|------|
| `just build` / product-wire freestanding write | No (Name B host-cc or Name A prebuilt) | Official product wire |
| `just freestanding-capable-regenerate-without-lake` | No | M4 product wire measured |
| `just mult-subset-rebuild-without-lake` | No | M2 Mult package rebuild |
| `just subset-packages-rebuild-join-without-lake` | No | M5 multi-unit join |
| Mult..Compose subset emit/rebuild Lake recipes | Often **yes** (diagnostic / unit under Lake) | Host diagnostic; not product pin tip |
| `just freestanding-self-host-complete` | **yes** (lake required for claim proof) | Claim B measure path |

### 3c. Bootstrap / diagnostic Lake surfaces that may remain honestly

| Category | Examples | Host free implication |
|----------|----------|------------------------|
| One-time peer bin prebuild | `lake build slake-host-fragment-check` / graph / package-write | Allowed after host free **if** residual bar says develop residual is peer-covered and bootstrap is one-shot |
| Full package cold elaborate | `just systems-lake` / `lake build` under `src/systems` | Blocks host free until named residual bar no longer requires it for day-to-day host develop **or** bar explicitly scopes free to peer surfaces only with inventory |
| Claim measure lake exes | freestanding-self-host-complete, perform/ownership measures | Policy while Lake elaborates host; not product wire |
| LLVM IR text lake writers | `slake-llvm-*-text` lake exe | Product llvm path; orthogonal to host free |
| Local Host* stillUsesLake / dependsOnLake | HostFront / HostGraph / HostPackageWrite **true** | Honesty: without-Lake hot path does not delete Lake bootstrap |

---

## 4. Honest bar for host residual free (Track 3c)

Flip `hostElaboratorResidualRemains` to **false** and set
`hostElaboratorResidualFreeClaimed` **true** only when **all** hold:

| # | Requirement | Checkable evidence sketch |
|---|-------------|---------------------------|
| 1 | Named host develop residual bar documented | Living residual + this note / successor inventory list the **named** surfaces that define "host develop residual free" (not slogans) |
| 2 | Without-Lake (or freestanding peer) coverage for every named surface in that bar | Dual evidence: Lean pins + just recipes green with **no** lake build/exe/env on hot path |
| 3 | Inventory of what still uses Lake is residual-honest | Bootstrap prebuild, claim-proof lake, full-package cold elaborate either retired from the bar or explicitly **out of scope** of host free with greppable honesty |
| 4 | DualResidual flip with elaborator proof | `hostElaboratorResidualRemains` false; host free claimed true; `dualResidualDoesNotForgeHostFree` / ready folds updated; **lake build** on DualResidual (+ related) exit 0 while Lake is host elaborator |
| 5 | HostResidualShrink inventory reseed | Partial shrink either completed to full free inventory or successor module pins match free claim |
| 6 | Product pins unchanged | free/complete/PROVABLY/llvm living tip **not** re-opened; product StillUsesLake stays false |
| 7 | Residual lockstep | RESIDUAL-systems / RESIDUAL / WATCHER / SESSION-HANDOFF / surface-matrix Host residual free row |

**What host free is not:**

- Product residual free already true
- Mult-first three without-Lake recipes alone (step 10 partial)
- Wall-clock Mult package win vs Lake Mult emit
- "Lake binary never exists on disk"
- Full Lean 4 / mathlib day-one elaborator parity
- proofCompleteClaimed true (Track 4)
- Full LLVM backend (Track 5)

**Recommended residual bar scope for host free (default after operator decision
2026-08-03 -- choice (a)):**

**Default = full SystemsLean host develop.** Retire cold full `lake build` (and
the normal Lake elaborate/check/build loop for host modules under `src/systems/`)
from **day-to-day** develop. Lake may remain one-time bootstrap, emergency, or
claim-proof tooling until that checklist is met with evidence. Theorem modules
(`*Theorems`) are **in** the long checklist unless a later written carve-out
says otherwise with greppable honesty.

**Six-unit Mult / Linear / Types / Program / Graph / Compose path** (front/check/
graph + unit package write under recipes that avoid Lake on those steps) is
**foundation and regression harness only**. It is **not** the recommended bar
for claiming host develop no longer needs Lake day to day. Mult..Compose dual
success alone does **not** meet this bar.

**Operator decision (2026-08-03):** choice **(a)** retire cold full elaborate
from day-to-day develop -- **not** (b) stop at six units only. Documented in
`doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md` and program
`.agents/plans/plan-slake-replaces-lake.md`.

Historical land-time text below once recommended Mult..Compose as the residual
bar; living default above **supersedes** that narrower scope for free claim.

---

## 5. Prioritized Track 3b shrink deepen queue

Open first Name now. Remaining Names stay design queue until prior closes
(or operator promotes parallel with clean disjoint scopes).

| Order | Name | Goal | Done when (sketch) | Out of scope |
|------:|------|------|--------------------|--------------|
| 3b-1 | **Host Types fragment expand** | Grow peer HostFront/HostCheck/HostGraph with Types-shaped dialect goldens (kind/mult / TYPED_IR honesty mini) after Mult+Linear | Goldens + pins; without-Lake host-fragment-check + host-graph green (and package write still green on Mult path); host residual remains; DualResidual **not** flipped; dual-pin presence if new modules; lake on touched Host* if Lean edited | Host free claim; full SystemsLean; proof complete; llvm forge |
| 3b-2 | **Host Program fragment expand** | Ordered IR program mini in host fragment graph after Types | Same pattern; without-Lake green; host free still false | Host free; CFG/SSA |
| 3b-3 | **Host Graph fragment expand** | Edge-list graph mini companion in peer graph | Same pattern; host free still false | Host free; full CFG |
| 3b-4 | **Host Compose fragment expand** | HostCompose mint/consume mini in peer path | Same pattern; host free still false | Host free claim alone |
| 3b-5 | **Peer unit package expand beyond Mult** | Peer package write path for next unit(s) if residual bar requires package dual-ok beyond Mult | without-Lake package recipe green for named unit; Mult package still green; host free false | Selling Mult package alone as free |
| 3b-N | (optional) **Host residual shrink inventory reseed** | Update HostResidualShrink pins to list expanded recipes after 3b-1.. | Inventory module + just host-residual-shrink green; remains true; free false | DualResidual free flip |
| 3b-6 | **Peer Types unit package expand** | Package dual-ok beyond Mult+Linear to Types under without-Lake | Types package dual-ok; Mult+Linear still green; host free false | Host free flip; full SystemsLean peer |
| 3c | **Host residual free residual** | Flip DualResidual when **new** full-host bar in section 4 is met | host remains false; host free claimed true; lake elaborator proof; residual lockstep; surface-matrix Host residual free row measured/claimed | Product free re-open; llvm forge; proof complete forge; **held** until full host checklist |

**Primary Open after this design lands (land-time):** **Host Types fragment expand** (3b-1).

**Living tip (2026-08-03 after free bar inventory + Slake-as-Lake reseed + A2):**
3b-1..3b-9 + 3b-N **done**. Package Mult+Linear+Types+Program+Graph+Compose
dual-ok under recipes that avoid Lake on those steps. Fragment Mult..Compose
**met** as **foundation only**. Section-4 free bar under **new** default (full
host develop, choice (a)) still **not** met. DualResidual remains true / free
claimed false. Living gap inventory:
`doc/dev/research/host-residual-free-bar-inventory-2026-08-03.md`. Finish-line
program: `.agents/plans/plan-slake-replaces-lake.md`. A2 design **done**:
`doc/dev/research/full-host-elaborator-design-2026-08-03.md`. Primary Open after
A2: **Package roots without Lake**. Track 3c free residual **held** until the
full host checklist is met under choice (a).

---

## 6. Non-claims (this slice)

- Does **not** flip `hostElaboratorResidualRemains` or `hostElaboratorResidualFreeClaimed`
- Does **not** claim host residual free
- Does **not** re-open product free / complete / PROVABLY
- Does **not** forge llvm full backend or Track 4c proof complete
- Does **not** invent random canary theorems as host free progress
- Does **not** grow product C or shell mills
- Partial Mult-first shrink stays partial until 3b expands land and 3c flips with proof

---

## 7. Pointers

| Artifact | Role |
|----------|------|
| `src/systems/SystemsLean/DualResidual.lean` | host residual remains true; host free false; product free true |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Partial shrink inventory; Mult-first three recipes; Mult..Compose fragment + Mult..Compose package dual-ok (living `measuredHostLakeFreePackageUnits`); host free still false |
| `just/host.just`, `just/host-without-lake.just` | Peer check/graph/package + without-Lake recipes |
| `src/systems/goldens/host-front/`, `goldens/host-graph/` | Peer dialect goldens |
| `src/systems/surface-matrix.md` | Host residual free row **open** |
| Residual / WATCHER / handoff | Track 3a done; 3b-1 Open after land |

---

## 8. Join note for residual lockstep

Track 3a **Host residual free design** closes when this note is on disk, Open
queue names **Host Types fragment expand** as primary next, DualResidual pins
unchanged, hygiene green on novel md.
