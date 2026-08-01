# Plan: Long-file refactor (coherent seams, not naive cuts)

ASCII only. Durable plan 2026-07-30 (adapted from operator inventory + plan drafts).
Audience: Systems / Slake implementer + reviewer (effort 2), hierarchical subagents.
Parent coordinates only; join on disk. No product Lean edits belong in the residual-pin slice that opened this plan.

Inventory sources (ephemeral): `/tmp/grok-long-file-inventory-2026-07-30.md`,
`/tmp/grok-plan-long-file-refactor-2026-07-30.md`. Re-verify `wc -l` at each slice start.

---

## 0. Hard constraints (non-negotiable)

| Rule | Detail |
|------|--------|
| No naive split | No arbitrary half-file cuts. No full-file rebuild under `/tmp`. No `====` stitch markers. No git merge markers in product sources. |
| Coherent seams only | Split by responsibility (dual-pin home, smoke module, Nix data slice, IO vs pins vs Main). Not "first N lines." |
| Screw-up stop | If lake red, import cycle, stitch risk, or tip corruption: **STOP**. Do **not** `git revert` / undo / force-reset. Leave the tree for the human. |
| Loop | Implementer effort 2 + reviewer effort 2. Hierarchical subagents OK for disjoint inventory; serialize tip writers. |
| Claim honesty | `complete` / Full / ownership / perform **true**; `StillUsesFreestandingEmit` **false**; free / llvm / PROVABLY **false**. Lake is host bootstrap proof only. |
| Languages | Lean 4 + pure Nix only. No C/shell product growth as "refactor." |
| Product names | No new `ProductPathFreestanding*` basenames. Short role names for any new module. No kitchen-sink living-tip claim-bool API names. |
| Edits | Surgical hand edits via `rg` inventory. No bulk sed / mass replace_all. |
| SelfApplyFs rename | Renaming the tip module to ProductSelfHost (or similar) is **later**, not the first Open dual-pin thin. |

RCA / prevention: `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md`,
`.agents/plans/plan-selfapplyfs-rca-prevention.md`, `AGENTS.md` (product Lean names +
claim-bool proof + long-file residual).

PartialReady bulk split: **done** (batches 1-33). Tip still multi-thousand because
**greppable dual-pins + theorem/example smoke** stayed on `SelfApplyFs.lean` by design.
Next tip shrink is **gate-first dual-pin migration**, not another PartialReady bulk move.

---

## 1. Live sizes (>1 KLOC priority) -- verify at slice start

Approximate live line counts (**reseed 2026-07-31** after dual-pin batches 1-10):

| Priority | Path | ~Lines | Why long | Refactor class |
|---------:|------|-------:|----------|----------------|
| **P0** | `src/systems/SystemsLean/SelfApplyFs.lean` | **5204** | Living tip after dual-pin b1-10 (was 5755; -551 mean ~-55/batch). Header greppable soup, remaining dual-pin B12..complete, theorems+examples smoke wall. PartialReady bulk already home-owned. | **Gate-first dual-pin thin** batch 11+ + optional smoke split |
| **P0b** | `src/systems/SystemsLean/CompilePath.lean` | **3609** | Track 2 end-to-end fixture / compile-path surface (Mult..Body). Seams unopened; pattern proven on dual-pin. | **Responsibility seams** (per-unit fixtures / shared helpers); not half-file cut; open in dual-pin gaps |
| **P1** | `nix/systems-host-presence/specs.nix` | **5058** (was 5675/6012; split ~5049) | Thin join + hostSpecsCore split + inline rest; Mult..FreestandingEmit split 2026-07-30; reviewer APPROVE. | **Core split done**; cold hostSpecs **CompilePath wall** OK **parallel** with dual-pin |
| **P1b** | `nix/systems-host-presence/host-specs-core.nix` | **639** | Mult..FreestandingEmit split **done** | Leave cold; further splits are sibling modules |
| **P2** | `nix/systems-emit-wire/default.nix` | **~3803** | Cold eval split; many `hostPin = readRel SelfApplyFs.lean` family scanners still inline (~33). | hostPin scanner splits **serialize** with dual-pin; prefer defer |
| **P2b** | `nix/systems-emit-wire/emit-product.nix` | **~4137** | Emit product APIs/stages; fat sibling of default. | Same pure Nix slice discipline when opened |
| **P3** | `src/systems/self-host.md` | **~4835** | Freestanding self-host acceptance prose + B-history. | Archive closed history companion; keep living tip short |
| **P3b** | `justfile` | **~4005** | Policy wants thin; fat dual-pin bash recipes in practice. | **Deferred**; not critical path; paydown later (not more shell) |
| **P4** | `src/systems/smoke/slake_behavioral_probe.c` | **~1615** | Hosted behavioral probe (permanent test role). | Split TUs only with evidence; never grow as product body |
| **P5** | `src/systems/SystemsLean/FreestandingEmit.lean` | **~1069** | Emit orchestration (load SSOT, dual equality, render, write). | Split load/validate/render only if still >1k after tip strategy proven |
| watch | `src/systems/emit/slake_freestanding.c` | **~1118** | Generated product wire. | **Do not hand-split** as residual progress; refresh via `just build` |
| watch | Leaf DualEq / Capable* modules | <1k today | Short-name + PartialReady land can grow them. | Cap growth; if leaf crosses 1k, split IO vs pins vs Main |

**Product wire:** `just build` = freestanding product wire (emit + `out/freestanding-c`). No separate `out-freestanding-c` recipe. `just check` depends on build + freshness.

**Not P0 for this plan:** remaining `ProductPathFreestanding*` long **filenames** (Open residual **Short product-path module names**, paused). Filename retire does not shrink SelfApplyFs dual-pin mass by itself. **Revise long names while splitting** that family (ModuleCite / home basenames) when dual-pin thins that family, or when tip dual-pin is free.

**Out of priority:** classic Lean IR under `.lake`, `ref/`, `skills/`, emit C as implementation language.

**Long-file residual rule (operator 2026-07-31):** any novel product / durable process surface **>1000 lines on disk** is residual work. **Chip away** into thoughtfully named files with coherent seams (this plan), not a permanent kitchen-sink.

---

## 2. Per-file intended module boundaries

### 2.1 `SelfApplyFs.lean` (P0) -- living tip role

**Target end state (multi-slice):** tip is a **thin claim + chain fold** module, not a per-step token warehouse.

| Stay on SelfApplyFs | Move off tip (when gates allow) | Never invent |
|---------------------|----------------------------------|--------------|
| Living claim SSoT: complete, ownership claimed, perform claimed, stepContractFull, StillUsesFreestandingEmit (+ free/llvm/PROVABLY false holds) | Per-family historical stageId / hostId / recipe / Lake exe / Measured string dual-pins already present on home modules | New `ProductPathFreestanding*` names |
| `freestandingSelfApplyReady` / extract / body / parity compose | Per-family bar/surface string cites duplicated from home | Kitchen-sink living-tip claim bool names |
| Thin `PartialReady` chain folds: prior tip fold `&& Home.partialReady` | Theorems/examples that only re-decide home facts, once gates no longer require them on tip | `/tmp` full-file stitch |
| Imports of home modules | Optional later: short header; long greppable header inventory -> companion md only if gates allow | Shell/C dual-pin mills |

**Structural seams already present (do not re-cut randomly):**

```
header (~1-1017) -- greppable inventory comment
imports (~1019-1057)
core self-apply + claim SSoT (~1062-1210)
per-family dual-pin blocks B2..complete (~1221-4146)
selfApplyFsOk
theorems (~4150-~4890)
examples / smoke (~4897-5754)
end
```

**Dual-pin thin pattern (one family per slice):**

1. **Inventory** every just / host-presence / emit-wire token that still greps that family's strings on `SelfApplyFs.lean`.
2. **Gate-first:** move historical stage dual-pins to the **home module path**. Shrink SelfApplyFs `hostPin` lists to what the tip must still own.
3. **Lean tip:** delete tip-only duplicate defs gates no longer require; keep thin fold + claim SSoT literals on tip.
4. **Theorems/examples:** drop or move only after gates stop requiring those forms on tip.
5. **Measure** tip line delta (before/after `wc -l`); residual note; green lake.

**Do not** split another PartialReady bulk body that already lives in the home (batches 1-33 done).

### 2.2 `CompilePath.lean` (P0b) -- inventory correction

Missed by the first inventory draft. ~3609 lines of Track 2 compile-path fixtures and readiness.

| Stay | Later seams (after P0 dual-pin pattern proven) |
|------|-----------------------------------------------|
| Shared compile-path helpers and greppable readiness SSoT the gates scan | Per-unit fixture modules (Mult / Linear / Types / Program / ...) only at clear comment seams |
| Cross-unit compose/extract gates | Shared string/table helpers split once, not copy-paste farm |

**Do not** open CompilePath structural split until at least one SelfApplyFs dual-pin thin batch is green (proves gate-first discipline). Serialize with any residual that edits the same readiness bools.

### 2.3 `nix/systems-host-presence/specs.nix` (P1)

**Progress (2026-07-30 -- non-tip + hostSpecs core GREEN):**

| File | Status | Owns |
|------|--------|------|
| `specs.nix` | **thin join** 6012->5675->**5049** | Import cold slices; `hostSpecs = hostSpecsCore ++ [ CompilePath..SelfHostBody ]` (dual-pin tip stays inline) |
| `jargon-walk.nix` | **done** | `jargonWalkRoot` / SkipDirs / Extensions / Forbidden |
| `required-files.nix` | **done** | `requiredFiles` skeleton paths |
| `host-leans.nix` | **done** | `hostLeans` module list |
| `unit-surface.nix` | **done** | `unitSurfaceSpecs` |
| `host-specs-core.nix` | **done** | Mult..FreestandingEmit (13 rel); dual-pin-hot unmoved sha256 `a1ab0623...` |
| `host-specs-compile-path.nix` (proposed) | **open next** cold | CompilePath token wall (large single module) -- when not racing |
| `host-specs-kernel-parity.nix` (proposed) | later cold | Kernel/Emit Mult..Compose + Parity ladder |
| `host-specs-hold-close.nix` (proposed) | later cold | LlvmHold / InventoryClose / DualResidual / ProbeWire / SpecProof / SelfHostBody |
| `host-specs-product-path.nix` (proposed) | later / dual-pin serialize | Product-path family dual-pins (HOT with Lean dual-pin) |
| `host-specs-claims.nix` (proposed) | later / dual-pin serialize | Living tip complete / Full / ownership / perform |

Joins: `/tmp/grok-impl-summary-nix-host-presence-nontip-split.md`,
`/tmp/grok-impl-summary-nix-hostspecs-core-split.md`.
`default.nix` inherit surface unchanged. No bash-in-Nix. Human HITL stages new paths before flake check matches live `just systems-host`.

### 2.4 `nix/systems-emit-wire/default.nix` (P2)

Cold eval split **done** (2026-07-30): default **3953 -> 3804** (-149).
Modules: `eval-helpers.nix`, `eval-file-content.nix`, `eval-unit-walk.nix`,
`eval-emit-release-match.nix`. HostPin scanners left inline byte-identical.
Join: `/tmp/grok-impl-summary-nix-emit-wire-eval-split.md`. Research:
`doc/dev/research/nix-long-file-seams-2026-07-30.md`.

| Slice | Owns | Status |
|-------|------|--------|
| `eval-helpers.nix` | exists / readRel / has / hasI / checkContent | **done** |
| `eval-file-content.nix` | file / content / optional content violations | **done** |
| `eval-unit-walk.nix` | dynamic unit walk + unit violations | **done** |
| `eval-emit-release-match.nix` | emit vs out byte identity | **done** |
| `default.nix` | inherit cold splits + hostPin scanners + green bools + export | cold done; scanners still fat |
| `host-tip-dual-pin.nix` (or per-family) | `hostPin = SelfApplyFs` scanners; shrink lists as tip thins | **later** (serialize with dual-pin) |
| Existing data | `emit-product.nix`, `unit-deepen.nix`, `unit-walk.nix`, `residual-free-measure.nix` | unchanged this slice |

**Coupling:** every SelfApplyFs dual-pin thin Lean slice **must** update the matching emit-wire scanner in the same slice (or a serialized gate-prep micro-slice immediately before).

### 2.5 `self-host.md` / `justfile` / probe / FreestandingEmit

| Surface | Intent |
|---------|--------|
| `self-host.md` | Extract closed B-history to archive companion; living acceptance short in this file + SESSION-HANDOFF |
| `justfile` | Keep core orchestration; dual-pin recipe farm is scheduled paydown to pure Nix / Lean measure (not more shell) |
| Behavioral probe | Permanent test role; split TUs only with assert-code care; shrink when Lean duplicates live `cc` contract with evidence |
| `FreestandingEmit.lean` | Prefer not opening until P0 tip dual-pin strategy proven on at least one family |
| Product C wire | Never hand-split as residual progress |

### 2.6 Leaf ProductPath / DualEq modules

Short-name rename (separate residual) only changes basenames / imports / ModuleCite -- **not** a substitute for dual-pin thin.

| Stay in leaf | Split if leaf exceeds 1k |
|--------------|-------------------------|
| Land-time honesty pins | IO writer body vs pin table vs Main |
| PartialReady bulk from tip splits | Never dump tip claim SSoT true into land-time home |

---

## 3. Dual-pin / gate update checklist

Use on **every** dual-pin thin or short-name slice.

### 3.1 Inventory (before edit)

- [ ] `rg` family tokens on SelfApplyFs, home module + Main, justfile, host-presence specs, emit-wire default (+ slices), lakefile, residual / WATCHER / handoff
- [ ] Classify each tip token: **must stay on tip** vs **historical stage** (home OK) vs **smoke**
- [ ] Record tip `wc -l` before

### 3.2 Gate prep (edit gates before deleting tip bulk)

- [ ] emit-wire: shrink SelfApplyFs hostPin scan for that family; keep/expand home module scan
- [ ] host-presence: same for SelfApplyFs vs home `rel`
- [ ] justfile: retarget historical Measured/stage strings from tip to home when no longer living-tip claims
- [ ] Do not loosen claim honesty

### 3.3 Lean tip edit (surgical)

- [ ] In-place delete/alias only for tokens gates no longer require on tip
- [ ] Keep thin PartialReady fold compiling
- [ ] No import cycle: homes must not import SelfApplyFs
- [ ] No top-level main clash; no `/tmp` full-file rewrite; no stitch marks
- [ ] ModuleCite / import strings consistent with short-name track if that family was renamed

### 3.4 Green gates (same slice)

- [ ] `just hygiene`
- [ ] `just systems-host`
- [ ] `just systems-emit-wire`
- [ ] `lake build SystemsLean.SelfApplyFs` (and home if touched)
- [ ] `just freestanding-self-host-complete` (greps + **mandatory lake**)
- [ ] Focused just recipe for the family if one exists

### 3.5 Durable close

- [ ] RESIDUAL-systems Done + Open next
- [ ] WATCHER fenced `/implement`
- [ ] SESSION-HANDOFF tip line count / next
- [ ] Optional dual-pin inventory companion under `doc/dev/research/`
- [ ] Human HITL `git add` for new `nix/` paths before flake CI parity

### 3.6 Short-name rename checklist (ongoing Open residual)

- [ ] One family only; short role basename; avoid collisions
- [ ] Module + Main + namespace + imports + lakefile + just + nix paths + SelfApplyFs import/ModuleCite
- [ ] Same green gate set as 3.4
- [ ] **Serialize** with dual-pin thin when both would edit SelfApplyFs tip regions (see section 7)

---

## 4. Acceptance (Done when) -- first implement slice only

### Name: SelfApplyFs dual-pin thin batch 1 (B2 KernelSelfApply)

**Why this seam:**

- Earliest closed family; home `KernelSelfApply.lean` already owns PartialReady/Ok bulk.
- Tip still duplicates stage/bar/string dual-pins and B2 smoke for greppable gates.
- emit-wire still hard-scans several B2 tokens on SelfApplyFs.
- Small scope; proves gate-first pattern before larger families.
- Disjoint from most remaining short-name leaves if ModuleCite for those is untouched.

**Goal:** Prove tip shrink via **dual-pin path migration**, not PartialReady re-split.

**Done when (checkable):**

1. **Inventory artifact** on disk (short under `doc/dev/research/` or residual Done notes): B2 tokens that (a) stayed on tip, (b) moved authority to KernelSelfApply-only, (c) remained dual-pinned on both by necessity.
2. **Gate-first:** emit-wire and host-presence (and any just B2 pins) updated so historical B2 stage/bar dual-pins are satisfied primarily on `KernelSelfApply.lean`; SelfApplyFs retains only what living chain/claim still needs.
3. **Tip shrink:** `SelfApplyFs.lean` line count **strictly decreases** (record before/after `wc -l`).
4. **Claims preserved:** complete/Full/ownership/perform true; StillUsesFreestandingEmit false; free/llvm/PROVABLY false -- `just freestanding-self-host-complete` (lake) green.
5. **Gates green:** hygiene, systems-host, systems-emit-wire, lake SelfApplyFs, lake KernelSelfApply if edited, freestanding-self-host-complete.
6. **No stitch / no `/tmp` full-file SelfApplyFs rewrite.** Surgical in-place only.
7. Residual Open updated; WATCHER fenced `/implement` for next clear seam.

**Out of scope for first slice:**

- Multi-family dual-pin dump
- Short-name renames (except collision fix, should not apply)
- CompilePath split, FreestandingEmit split, specs.nix mega-split
- free/llvm/PROVABLY flips; agent git; SelfApplyFs rename to ProductSelfHost
- Claim bool kitchen-sink renames

**Primary paths:**

- `src/systems/SystemsLean/SelfApplyFs.lean` (B2 dual-pin region + B2 theorem/example only)
- `src/systems/SystemsLean/KernelSelfApply.lean` (if gates need extra home tokens)
- `nix/systems-emit-wire/default.nix` (B2 hostPin scan)
- `nix/systems-host-presence/specs.nix` (B2 SelfApplyFs / KernelSelfApply blocks)
- `justfile` only if a B2 recipe still pins tip for historical strings
- residual / WATCHER / handoff

**Agent shape:** 1 implementer (effort 2) + 1 reviewer (effort 2). Optional explore for cold inventory; prefer single implementer owning inventory+edit to avoid tip write races.

---

## 5. Stop conditions

**STOP immediately (leave tree; no git undo / revert):**

| Condition | Why |
|-----------|-----|
| `lake build SystemsLean.SelfApplyFs` red and not fixed within slice budget | Tip is claim SSoT; broken tip is RCA-class failure |
| Import cycle (home imports SelfApplyFs, or Main clash) | Architecture break |
| Stitch markers / merge markers / partial file corruption | Hygiene + lake must catch |
| Temptation to rebuild SelfApplyFs from `/tmp` or concatenate sections | Forbidden by AGENTS + RCA |
| Claim honesty drift without explicit residual | Honesty forge |
| Emitter/C/shell growth as "fix" | Three languages only |
| Parallel writers racing SelfApplyFs tip | Serialize tip writers |

**Park (not crash):**

- Lake missing on PATH -> BLOCKED residual (claim flip not GREEN)
- Ambiguous gate token stay-or-move -> inventory + freeform ask; do not guess-delete
- New `nix/` path untracked -> live `just` green OK; flake CI needs human stage

---

## 6. Reviewer checklist

Reviewer rejects GREEN without evidence.

### Process

- [ ] Summary shows gate-first order (or inventory proving safe delete)
- [ ] Commands + exit 0: hygiene, systems-host, systems-emit-wire, lake SelfApplyFs, freestanding-self-host-complete
- [ ] No gate expectation rewrite to match broken tip

### Seam honesty

- [ ] First slice is **one clear seam** (B2 dual-pin), not multi-family
- [ ] PartialReady bulk was **not** re-copied; thin is dual-pin/gate migration
- [ ] Homes still do not import SelfApplyFs
- [ ] Land-time home still does not define living claim bools true

### File safety

- [ ] No stitch / merge markers; hygiene green
- [ ] No `/tmp` full-file copy over SelfApplyFs
- [ ] Tip line count decreased; before/after recorded
- [ ] Surgical diffs only on inventory-listed regions

### Claims

- [ ] complete/Full/ownership/perform true; StillUsesFreestandingEmit false; free/llvm/PROVABLY false
- [ ] Lake used for claim gate (not grep-only GREEN)

### Dual-pin consistency

- [ ] Every removed tip token still present where gates look, or gates updated same slice
- [ ] No orphan just recipe grepping deleted tip strings
- [ ] ModuleCite / import paths match lakefile

### Residual hygiene

- [ ] Open/Done/WATCHER/handoff updated; next `/implement` is a different clear seam
- [ ] No invented free/complete theater

---

## 7. Relationship to short-name rename (serialize tip writers)

| Track | Owner residual | Touches | Parallel? |
|-------|----------------|---------|-----------|
| **A. Short product-path module names** | Open in RESIDUAL-systems (batches 1-8 done) | One ProductPathFreestanding* family: file, Main, imports, lakefile, just, nix, SelfApplyFs **import + ModuleCite** | Yes with dual-pin thin **if** different family and tip regions do not overlap |
| **B. SelfApplyFs dual-pin thin** | This plan; first Open after residual pin | Tip dual-pin blocks + emit-wire/hostSpecs hostPin + maybe home pins | Yes with short-name on **other** families; **serialize** on same family or overlapping tip edits |
| **C. Nix specs/default split** | Non-tip + HostSpecs core + emit-wire cold eval **done**; further hostSpecs / hostPin scanner splits Open | nix host-presence / emit-wire only | Yes with A; serialize with B when editing same hostPin / hostSpecs tip block |
| **D. CompilePath seams** | Later residual after B pattern proven | CompilePath.lean (+ gates if any) | Serialize with any residual editing same readiness bools |

**Serialize rules:**

1. Same family (rename **and** dual-pin thin) -> **one writer**. Prefer finish rename first (smaller), then thin.
2. Two tip writers on SelfApplyFs -> **never**. Dual-pin thin owns tip for its slice duration.
3. Short-name of OfficialPathAlternate / DualEq* / CapableCompose|WriteHc while dual-pin thin B2 -> **parallel OK** only if implementer touches only B2 region + avoids mass import reformat. Prefer **pause short-name** while dual-pin batch 1 runs so tip writers do not race.
4. Policy default after this pin: **Short product-path names paused** (or continue only when tip dual-pin is not racing). Dual-pin thin batch 1 is highest-value next.

**Recommended sequencing (reseed 2026-07-31):**

1. **Primary:** dual-pin thin batch **11** = B12 ProductPathComposePlan (tip start **5204**); then B13..complete serial.
2. **Parallel OK:** cold hostSpecs **CompilePath wall** split (one Nix writer; no tip/product-path rows).
3. Short-name leaves: resume when tip dual-pin not racing; **also** revise long ModuleCite/home basenames when splitting that family in dual-pin.
4. CompilePath Lean seams: 4-6 multi-unit groups in dual-pin gaps (after pattern use).
5. Emit-wire hostPin scanner module split / emit-product / justfile / self-host.md archive: later or deferred.

**Do not** pause short-name forever for dual-pin, and do not pretend short-name alone fixes the tip.

---

## 8. Later dual-pin thin order (after first slice)

Prefer early chain families (historical pins), then mid, then late claim-adjacent.

Progress (2026-07-31 reseed): dual-pin batches **1-10 GREEN**; tip **5755 -> 5204**
(-551). Batch 9 reviewer **APPROVE**; batch 10 implement join
`/tmp/grok-impl-summary-dual-pin-thin-b10.md` (B11 ReadSsot; ReadDependsOnLake +
ReadEntrypointClaimed kept on tip). Nix HostSpecs core split done (specs live
~5058; Mult..FreestandingEmit; reviewer **APPROVE**). Behavioral probe exit 105
fixed. Claim B complete **true** on living tip; free/llvm/PROVABLY **false**.

**Remaining dual-pin order (batch 11 onward):**

| Batch | Family | Home (already imported) |
|------:|--------|-------------------------|
| **11 (next)** | **B12 ProductPathComposePlan** | `ProductPathComposePlan` |
| 12 | B13 ProductPathWriteHc | `ProductPathWriteHc` |
| 13-20 | B14..B21 Capable* + InstallOut + FullBar | Capable*, InstallOut, CapableFullBar |
| 21 | B22..B30 OwnershipRegenerate | one packed tip section (1 fat or 2) |
| 22-28 | B31..B37 evidence / official / DualEq* | PerformEvidence .. DualEqualityWrite* |
| 29-31 | B38..B40 OfficialRetire / PerformClaimed / OwnershipClaimed | claim-adjacent historical split only |
| 32 | Full / complete homes | **last**; living claim dense; may only split smoke |

Keep on tip when thinning B12+: **ComposeDependsOnLake**, **ComposeEntrypointClaimed**,
living perform/ownership/complete claim SSoT, PartialReady chain folds.

Closed batches (do not re-open as theater):

1. B2 KernelSelfApply (**done** dual-pin thin batch 1)
2. B3 ProductOutKernel (**done** dual-pin thin batch 2)
3. B4 BootstrapHonesty (**done** dual-pin thin batch 3; remains := true tip-required -- kept)
4. B5 ProductPathWriterSurface (**done** dual-pin thin batch 4)
5. B6 ProductPathWriterPathPlan (**done** dual-pin thin batch 5)
6. B7 ProductPathWriterPathExec (**done** dual-pin thin batch 6)
7. B8 ProductPathOwnershipInputs (**done** dual-pin thin batch 7; ownership claimed SSoT on tip)
8. B9 ProductPathPerform (**done** dual-pin thin batch 8; perform claimed SSoT + DependsOnLake on tip)
9. B10 ProductPathPerformStep (**done** dual-pin thin batch 9; InstallLakeFree tip honesty kept; **APPROVE**)
10. B11 ProductPathReadSsot (**done** dual-pin thin batch 10; ReadDependsOnLake + ReadEntrypointClaimed tip honesty)

Smoke-only split (theorems/examples tail) can interleave when inventory shows gates do not require those forms on tip.

---

## 8b. Estimates (effort-2 implementer + reviewer) -- reseed 2026-07-31

**Unit:** one implementer at effort **2** + one reviewer at effort **2** for one
coherent slice (one dual-pin family, one Nix split, or one CompilePath seam group).
Hierarchical subagents OK for disjoint inventory; serialize tip writers. L1 parent
coordinates only; join on disk.

| Track | Work | Slices | Critical path? |
|-------|------|-------:|----------------|
| A | Remaining dual-pin B12..complete (+ optional smoke/header) | **~23-29** | **Yes (serial tip)** |
| B | CompilePath multi-unit seams | **4-6** | No (gaps) |
| C | Pure Nix splits (front-load cold; hostPin later) | **~11-16** | Partial cold parallel |
| D | justfile | **0** now | No (deferred) |
| E | self-host.md archive | **1-2** | No |
| **All-in long-file** | | **~40-55** | |
| **Critical path tip under control** | | **~23-29** | |

**Tip size honesty:**

- Dual-pin alone: tip lands about **4000-4200** (not under 2k).
- Dual-pin + selective smoke + partial header: stretch band **~1.8k-3.0k**.
- Floor if gates keep theorems/smoke/header: **~3.5k-4.2k** until a dedicated
  gate-retire pass.
- Do **not** claim sub-1k without inventory proof.

**Highest value next:** implement dual-pin **batch 11 B12 ProductPathComposePlan**
(tip start 5204). **Best parallel add-on:** hostSpecs CompilePath wall cold split
(1 slice), single Nix writer, no tip/product-path row edits.

**Race:** dual-pin vs hostSpecs CompilePath wall = **OK parallel**. Dual-pin vs
emit-wire default hostPin split or tip/product-path hostSpecs rows = **serialize**.

---

## 8c. Operator approval notes (2026-07-31 APPROVE_WITH_NOTES)

Documented same turn from plan approval. Binding for residual / WATCHER / handoff.

1. **Chip away >1 KLOC.** Any novel surface over 1000 lines is residual. Split into
   thoughtfully named files by responsibility (dual-pin home, smoke, Nix data slice,
   IO vs pins vs Main). No naive half-file cuts; no `/tmp` full-file rebuild; no stitch.
2. **Revise long names while working (best effort).** Short-name track remains paused
   when it would race tip writers, but dual-pin batches may shorten ModuleCite / home
   basenames when splitting that family. Resume dedicated short-name leaves when tip free.
   No new kitchen-sink `ProductPathFreestanding*` basenames or claim-bool API names.
3. **Post-hygiene destination honesty sequence** (after long-file / dual-pin hygiene
   makes tip and gates maintainable). Do **not** forge. Order:

   | Step | Bar | Note |
   |------|-----|------|
   | a | **no-sorry** host Lean on touched paths | doctor/review; lake green; not grep-only |
   | b | **residual free** (claim A) | Only when free bar + DualResidual honesty met; measure path already closed; claim still **false** |
   | c | **ccomp / CompCert** dogfood on product freestanding C | Claim D path; **held** until real resolved CompCert evidence; not this Open Name |

   Do **not** flip free / PROVABLY / llvm bools during dual-pin hygiene slices.
   Claim B complete already **true** on living tip; dual-pin is hygiene / attention.

4. **lean4 skill:** L2 loads `.agents/skills/lean4` for dual-pin / CompilePath.
   Prefer **doctor** / **review** / **prove** (named theorems). **Not** autoprove on
   SelfApplyFs tip. Checkpoint = status only (no agent commit). Pure Nix splits do
   not drive via skill.

5. **`just build`** = product freestanding wire. Use when emit / WRITE / wire touched.

---

## 9. Implementer prompt sketch (first slice)

```
/implement --effort 2 SelfApplyFs dual-pin thin batch 1 -- B2 KernelSelfApply historical pins

Goal: Gate-first dual-pin migration for B2 only. Shrink SelfApplyFs tip duplicates
already owned by KernelSelfApply. Not another PartialReady bulk split.

Done when: plan-long-file-refactor.md section 4.

Out of scope: multi-family; short-name dump; /tmp SelfApplyFs stitch; free forge;
agent git; SelfApplyFs rename to ProductSelfHost; CompilePath split.

Paths: SelfApplyFs.lean (B2 region + B2 smoke only), KernelSelfApply.lean,
nix emit-wire + host-presence B2 blocks, just if needed, residual/WATCHER/handoff.

Stop: red lake, cycle, stitch risk -> STOP, no git undo.
Then: reviewer effort 2 (section 6 checklist).
```

---

## 10. Success picture (multi-slice, not first-slice Done when)

- SelfApplyFs tip: dual-pin track Done when is **tip lines down + gates green + honesty**,
  not a forged sub-2k number. Honest dual-pin-alone landing **~4.0-4.2k**; stretch under
  2k needs selective smoke/header (section 8b).
- Historical stage dual-pins live on short home modules; tip is not a second copy of every string.
- Long names revised best-effort while splitting families; remaining short-name leaves cleared without new kitchen-sink filenames.
- CompilePath addressed by coherent unit seams once tip pattern is proven (already proven on b1-10).
- Nix host/emit dual-pin tables modular (~100-150 line files); cold CompilePath wall parallel OK.
- After hygiene: no-sorry host -> residual free only when bar met -> ccomp/CompCert dogfood (held); never forge free/PROVABLY.
- Stitch RCA class remains fail-closed (hygiene + lake on claim).
- On screw-up: STOP, no agent git revert.
- Loop: effort-2 implementer + effort-2 reviewer per coherent slice; L1 join on disk only.

---

## Plan path

`.agents/plans/plan-long-file-refactor.md`
