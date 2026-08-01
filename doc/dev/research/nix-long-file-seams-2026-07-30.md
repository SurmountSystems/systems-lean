# Nix long-file seams inventory (pure gates)

Kind: analysis only. Not residual.

Date: 2026-07-30
ASCII only.
Plan: `.agents/plans/plan-long-file-refactor.md` P1 / P2 / P2b
Join (ephemeral): `/tmp/grok-nix-long-file-inventory.md`

Re-verify `wc -l` at each implement slice start. Line ranges below are approximate
from read/rg on 2026-07-30 (not a live wc dump in this session).

---

## 1. Live sizes under `nix/` (flag >500; priority >1000)

| Path | ~Lines | Flag | Role today |
|------|-------:|------|------------|
| `nix/systems-host-presence/specs.nix` | **~5054** (split 5049; was 5675/6012) | **>1000 P1** | Thin join + hostSpecsCore after core split 2026-07-30; dual-pin tip hostSpecs still inline (+tip concurrent) |
| `nix/systems-emit-wire/emit-product.nix` | **4113** | **>1000 P2b** | Data: paths, stage ids, module tokens, drivers, contentSpecs for emit product / claim-B families |
| `nix/systems-emit-wire/default.nix` | **3804** | **>1000 P2** | Pure eval entry: cold splits imported; ~35 family scanners still inline (each `hostPin = readRel SelfApplyFs`) + green bools + summary |
| `nix/systems-emit-wire/specs.nix` | ~391 | under | **Thin join already** (import emit + deepen + walk + residualFree; re-export) |
| `nix/systems-emit-wire/unit-deepen.nix` | ~289 | under | UNIT_DEEPEN_V1 unit + companion contentSpecs |
| `nix/source-hygiene.nix` | ~300? | watch | ASCII / trailing WS / stitch-merge; recheck if grown |
| `nix/progress/milestones.nix` | ~233 | under | Weighted evidence list |
| `nix/systems-host-presence/default.nix` | ~153 | under | Eval entry: import specs, content + jargon walk |
| `nix/professional-tone.nix` | ~152 | under | Novel md banned tokens |
| `nix/systems-emit-wire/eval-unit-walk.nix` | ~101 | under | **Split** cold dynamic unit walk eval (2026-07-30) |
| `nix/systems-emit-wire/residual-free-measure.nix` | ~78 | under | Claim A forbidden residual + honesty tokens |
| `nix/systems-emit-wire/eval-helpers.nix` | ~56 | under | **Split** exists/readRel/has/hasI/checkContent |
| `nix/systems-emit-wire/eval-file-content.nix` | ~55 | under | **Split** file/content/optional content violations |
| `nix/systems-emit-wire/eval-emit-release-match.nix` | ~38 | under | **Split** emit vs optional release byte match |
| `nix/systems-emit-wire/unit-walk.nix` | ~37 | under | Dynamic unit walk roots/exts (data) |
| `nix/novel-source.nix` | ~24 | under | cleanSourceWith filter |
| `nix/idris-side-presence/*` | small | under | Dual presence (already split default + specs) |
| `nix/lean-side-presence/*` | small | under | Dual presence (already split default + specs) |
| `nix/progress/{default,helpers,bars,render}.nix` | small | under | Progress meters |

**Only three files under `nix/` are >1000 lines.** Everything else is already near the
~100-150 line "small module" preference or is a modest data table.

---

## 2. Module structure

### 2.1 `nix/systems-host-presence/`

| File | Job |
|------|-----|
| `default.nix` | Pure eval entry. `specs = import ./specs.nix;` then inherit top-level attrs. Helpers: `exists`, `readRel`, `checkContent`. Violations = missing requiredFiles + content (unitSurfaceSpecs ++ hostSpecs) + jargon walk. Export `{ ok, violations, summary, requiredFiles, hostLeans, jargonPaths }`. |
| `specs.nix` | **Data only** one big attrset. No lib. Imported by default. |

**Import pattern (mirror this for slices):**

```nix
# default.nix
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs)
    requiredFiles
    hostLeans
    unitSurfaceSpecs
    hostSpecs
    jargonWalkRoot
    # ...
    ;
in
# ... eval ...
```

Target after split: `specs.nix` becomes a **thin join** like emit-wire already has
(`let jargon = import ./jargon.nix; ... in { inherit (jargon) ...; }`), while
`default.nix` stays the pure eval entry and only changes its `inherit (specs)` list
if attr names stay stable (preferred: keep the same exported attr names).

### 2.2 `nix/systems-emit-wire/`

| File | Job | Already split? |
|------|-----|-----------------|
| `specs.nix` | Thin join of data slices | **Yes** |
| `emit-product.nix` | Drivers, emit/out paths, claim-B family token tables, contentSpecs | Data; still fat |
| `unit-deepen.nix` | UNIT_DEEPEN_V1 files + contentSpecs | Yes, small |
| `unit-walk.nix` | Walk roots / skip / required tokens | Yes, small |
| `residual-free-measure.nix` | Claim A measure tokens | Yes, small |
| `default.nix` | Eval entry + **all hostPin family scanners** still inline | Cold eval split 2026-07-30 |
| `eval-helpers.nix` | exists / readRel / has / hasI / checkContent | **Yes** (cold) |
| `eval-file-content.nix` | file / content / optional content violations | **Yes** (cold) |
| `eval-unit-walk.nix` | walkUnits + unit path / count violations | **Yes** (cold) |
| `eval-emit-release-match.nix` | emit vs out byte identity | **Yes** (cold) |

**Cold eval split result (2026-07-30):** default.nix **3953 -> 3804** (-149).
Four pure modules; same local names rebound via `inherit` so hostPin scanner body
stayed **byte-identical** (scanners-to-eof sha256
`6089d5547fb871c7f34ba21d2940c6eb0b1317bc457f0fec4c26220e20030377`; 33 hostPin).
`emit-product.nix` zero-edit. Gates: `just hygiene` + `just systems-emit-wire` green.
Parse OK on default + four splits. Join:
`/tmp/grok-impl-summary-nix-emit-wire-eval-split.md`.
**Next Open (Nix):** hostPin scanner splits later (serialize with dual-pin) **or**
further cold hostSpecs (CompilePath wall). Do not steal WATCHER from dual-pin.

**Import pattern (canonical thin join to mirror for host-presence):**

```nix
# systems-emit-wire/specs.nix
let
  emit = import ./emit-product.nix;
  deepen = import ./unit-deepen.nix;
  walk = import ./unit-walk.nix;
  residualFree = import ./residual-free-measure.nix;
in
{
  inherit (emit) emitH emitC /* many product* attrs */ ...;
  inherit (walk) unitWalkRoot /* ... */;
  inherit (residualFree) residualFreeMeasureStageId /* ... */;
  requiredFiles = emit.requiredDriverAndEmit ++ deepen.requiredDeepenFiles;
  contentSpecs = emit.contentSpecs ++ deepen.contentSpecs;
}
```

```nix
# systems-emit-wire/default.nix
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs) /* long inherit list of token attrs */ ;
  # then hostPin scanners use those attrs + readRel SelfApplyFs
```

**What still lives in emit-wire `default.nix` (not in emit-product):**

1. ~~Shared helpers~~ **split** -> `eval-helpers.nix`
2. ~~Generic file/content/optional content violations~~ **split** -> `eval-file-content.nix`
3. ~~Dynamic unit walk algorithm + violations~~ **split** -> `eval-unit-walk.nix`
4. ~~`emitReleaseMatchViolations`~~ **split** -> `eval-emit-release-match.nix`
5. **~35 product-path / claim family scanners** (still inline; dual-pin race):
   - `hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean"`
   - accept = self-host.md, home module, lakefile, justfile as needed
   - local `scan` / `forbid` closures
   - tip hostPin token list (fold/claim chain after dual-pin thin)
   - `*Green` bool
6. Concat of all violations + per-family summary strings + export
   `{ ok, violations, summary, *Green, ... }` (post-split ~3310-3804)

**emit-product.nix** holds **data** those scanners read (stage ids, module paths,
moduleTokens, forbidden tokens, acceptance tokens, lakefile/just tokens). Dual-pin
batches edit **both**: tip hostPin lists in default.nix **and** home moduleTokens /
comments in emit-product.nix (and hostSpecs rows in host-presence specs.nix).

---

## 3. `systems-host-presence/specs.nix` section map

Top-level attrs (single `{ ... }` attrset, no `let`):

| Section | Attr names | ~Lines | Notes |
|---------|------------|-------:|-------|
| Header | comments | 1-4 | Data-only; imported by default |
| Jargon walk | `jargonWalkRoot`, `jargonWalkSkipDirs`, `jargonWalkExtensions`, `jargonForbidden` | 6-26 | **Split** -> `jargon-walk.nix` (2026-07-30) |
| Skeleton paths | `requiredFiles` | 28-120 | **Split** -> `required-files.nix` |
| Host Lean path list | `hostLeans` | 122-168 | **Split** -> `host-leans.nix` |
| Unit surface | `unitSurfaceSpecs` | 170-364 | **Split** -> `unit-surface.nix` |
| Host token specs | `hostSpecs` | core split; rest inline | **Core Mult..FreestandingEmit** in `host-specs-core.nix`; CompilePath.. tip still inline (dual-pin race) |
| Close | `]; }` | end | specs.nix thin join + hostSpecs concat |

**Non-tip split result (2026-07-30):** specs.nix **6012 -> 5675** (-337). hostSpecs body
identity verified (reviewer interior sha256
`09084726820ab38ec927bfd26b52aec3c3f815fc62bfe2b3255a8b52aa9b5e86`).
Gates green. Join: `/tmp/grok-impl-summary-nix-host-presence-nontip-split.md`.

**HostSpecs core split (2026-07-30):** specs.nix **5675 -> 5049** (-626) at split
time; live **~5054** after concurrent dual-pin tip token edit (expected; tip left
inline). New `host-specs-core.nix` (638 lines): Mult .. FreestandingEmit (13 `rel`).
Join: `hostSpecs = hostCore.hostSpecsCore ++ [ CompilePath .. SelfHostBody ]`.
Dual-pin-hot contiguous region at split time (SelfApplyFs main through
OwnershipClaimed, pre-split lines 2498-4562) sha256
`a1ab06230bf538857b7ebbd01df259e890dd4121ec877b411e7c7c7cdb44bca1` **byte-identical
to unmoved rest body**. Post-split dual-pin edits change that hash (do not treat
post-tip-edit hash as split failure). `default.nix` zero-edit. Gates green.
Join: `/tmp/grok-impl-summary-nix-hostspecs-core-split.md`.

**Next Open (Nix, not WATCHER):** further cold hostSpecs (CompilePath wall,
Kernel/Parity ladder, LlvmHold-close tail). Emit-wire cold eval split **done**
(2026-07-30). Later: hostPin scanner splits only when dual-pin not racing those
families. Serialize any hostSpecs tip-row edits with dual-pin batch 10.

### 3.1 `hostSpecs` internal seams (by `rel =` module, not stage-id titles)

Approximate blocks (line numbers are **pre-core-split** for dual-pin map; after
core split Mult..FreestandingEmit live in `host-specs-core.nix`):

| Block | Location after core split | Content class |
|-------|--------------------------|---------------|
| Core Mult..FreestandingEmit | **`host-specs-core.nix`** (done) | Structural host units + emit ladder |
| CompilePath | specs.nix inline rest head | Large single-module token wall -- **next cold candidate** |
| JoinMap / SelfHost / SurfaceMatrix | specs inline | Structural + surface |
| Kernel/Emit Mult..Compose + Parity ladder | specs inline | Kernel + Parity* -- cold candidate |
| SelfApply (structural) | specs inline | SH5 structural self-apply |
| **SelfApplyFs main tip block** | specs inline | **Living tip dual-pin / claim soup -- dual-pin HOT** |
| Product-path home modules (KernelSelfApply .. OwnershipClaimed) | specs inline | Dual-pin homes; tip fold companion rows -- **HOT** |
| Extra SelfApplyFs tip rows (stepContractFull, complete, ...) | specs inline | **Living tip claim rows -- dual-pin HOT** |
| StepContractFull / SelfHostComplete homes | specs inline | Claim homes |
| LlvmHold / InventoryClose / ProductPath / DualResidual / ProbeWire / SpecProof / SelfHostBody | specs inline tail | Hold + close ladder (less dual-pin churn than tip) -- cold candidate |

**Dual-pin race surface inside hostSpecs:** edits that move tokens between
`SelfApplyFs.lean` rows and matching home-module rows (KernelSelfApply ..
Perform / Ownership / ...). Dual-pin batch 9 owns PerformStep tip tokens --
do not edit those hostSpecs list entries from the Nix split track.

---

## 4. Emit-wire default.nix hostPin scanner map (structure)

Pattern repeated per family (B2..complete):

```text
# comment: dual-pin thin batch N / living tip fold only
familyViolations =
  let
    accept = readRel "src/systems/self-host.md";
    hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
    homeMod = readRel product*ModulePath;  # from specs/emit-product
    # optional lakeToml, justFile
    scan = ...; forbid = ...;
  in
  (scan accept ...)
  ++ (scan SelfApplyFs hostPin [ fold/claim tokens ... ])
  ++ (scan homeMod product*ModuleTokens)
  ++ (forbid homeMod product*ModuleForbiddenTokens)
  ++ ...;
familyGreen = familyViolations == [ ];
```

Rough scanner regions in `default.nix` after cold eval split (line starts shift ~-149;
first hostPin scanner body still starts at `productKernelSelfApplyModuleViolations`):

| Region | ~Start (post-split) | Role |
|--------|-------:|------|
| Cold eval imports | ~384 | import eval-* + inherit same names |
| B2 KernelSelfApply hostPin | ~442 | Dual-pin batch 1 done |
| B3 ProductOut | ~493 | batch 2 done |
| Claim A residual free | ~560 | measure (data in residual-free-measure.nix) |
| B4..B10 Bootstrap..PerformStep | mid | batches 3-9 done |
| **B11 ProductPathReadSsot** | mid | **batch 10 dual-pin -- HOT** |
| B12..B13 Compose / WriteHc | mid | Later dual-pin |
| B14..B21 Capable* / FullBar | mid | Later dual-pin |
| B22..B30 Ownership regenerate | mid-late | Later |
| B31..B37 Perform evidence / official / dual-eq | late | Later |
| B38+ Retire / Perform claimed / Ownership claimed / Full / complete | late | Living tip claims |
| violations concat + summaries + export | ~3310-3804 | Join |

---

## 5. `emit-product.nix` seams (data)

One attrset. Natural splits by responsibility (not half-file):

| Slice (proposed file) | Owns | ~Where today |
|-----------------------|------|--------------|
| `emit-paths.nix` | emitH/C, releaseH/C, behavioralProbe, requiredDriverAndEmit, optionalFiles, unitTranslationApis, emitProductAll/None, contentSpecs for drivers/emit C | paths + end ~3178-4113 |
| `emit-product-b2-b8.nix` | KernelSelfApply .. OwnershipInputs stage/module token tables | ~37-466 |
| `emit-product-perform.nix` | Perform .. WriteHc (B9-B13) | ~467-770+ |
| `emit-product-capable.nix` | Capable* FullBar | middle |
| `emit-product-perform-evidence.nix` | PerformEvidence .. DualEq CapableGap | middle-late |
| `emit-product-claims.nix` | OfficialRetire, PerformClaimed, OwnershipClaimed, stepContractFull, complete | late |
| Keep `emit-product.nix` | Thin join of the above (like specs.nix) | -- |

**Do not** open emit-product perform/claims splits while dual-pin batch 8 edits
Perform tokens in the same file.

---

## 6. First safe parallel slice (while Lean dual-pin continues)

### Recommended Open Name (first implement)

**Name:** Host presence non-tip data split

**Goal:** Split cold data out of `systems-host-presence/specs.nix` so the file is no
longer a single 6k kitchen-sink, without touching product-path dual-pin hostSpecs rows.

**Done when:**

1. New pure Nix data files exist (names stable/job-shaped), e.g.:
   - `nix/systems-host-presence/jargon.nix` -- jargonWalk* + jargonForbidden
   - `nix/systems-host-presence/required-files.nix` -- requiredFiles
   - `nix/systems-host-presence/host-leans.nix` -- hostLeans
   - `nix/systems-host-presence/unit-surface.nix` -- unitSurfaceSpecs
2. `specs.nix` is a **thin join** that imports those + keeps `hostSpecs = [ ... ]`
   **inline for now** (still large, but cold data is gone) **or**
   `hostSpecs = import ./host-specs.nix` as a **move-only** of the existing list
   with zero token edits (optional second micro-step in same Name if review allows).
3. `default.nix` still `import ./specs.nix` and same inherited attr names (no gate
   contract change).
4. Live green: `just systems-host` (and preferably `just systems-emit-wire` untouched).
5. No Lean edits. No claim honesty loosen. No bash-in-Nix.
6. Human HITL: stage new `nix/systems-host-presence/*` paths before expecting
   `nix flake check` to match live just.

**Out of scope:**

- Editing any SelfApplyFs / ProductPath* / Capable* / claim hostSpecs token lists
- emit-wire default.nix / emit-product.nix
- Half-file cut of hostSpecs
- Renaming greppable honesty tokens

**Why this is race-safe vs dual-pin:**

| Dual-pin hot path | This slice |
|-------------------|------------|
| SelfApplyFs.lean tip defs | no touch |
| hostSpecs SelfApplyFs + home product-path rows | no touch (hostSpecs stays one blob or move-only) |
| emit-wire default hostPin Perform scanner | no touch |
| emit-product Perform moduleTokens | no touch |
| jargon / requiredFiles / hostLeans / unitSurface | **only** these |

Optional even safer first Name: split **only** jargon + requiredFiles + hostLeans
(~140 lines total) and leave unitSurfaceSpecs with hostSpecs until a second pass.

### Not first (race)

| Slice | Why wait |
|-------|----------|
| host-specs-product-path.nix split that **rewrites** tip/home rows | races dual-pin token moves |
| emit-wire host-tip-dual-pin.nix split | same files dual-pin batch 8 edits |
| emit-product perform/claims split with token edits | batch 8 edits Perform block |
| CompilePath hostSpecs split alone | low race but lower value than cold split; Serialize if anyone edits CompilePath.lean gates |

---

## 7. Ordered Nix slices after dual-pin pressure eases

Serialize tip writers. Prefer one Open Name at a time on a given file.

| Order | Open Name (plain) | Paths | Notes |
|------:|-------------------|-------|-------|
| 1 | Host presence non-tip data split | jargon, required-files, host-leans, unit-surface; thin specs.nix | **Parallel OK now** |
| 2 | Host specs core ladder split | `host-specs-core.nix` Mult..Parity/SelfApply structural (through ~2834) | Avoid SelfApplyFs tip rows |
| 3 | Host specs product-path homes | `host-specs-product-path.nix` KernelSelfApply..OwnershipClaimed homes | After dual-pin batches stop reshaping those rows |
| 4 | Host specs living tip + claims | `host-specs-tip.nix` + `host-specs-claims.nix` SelfApplyFs tip rows + Full/complete/llvm/hold/body | After dual-pin tip shrink stable |
| 5 | Emit-wire host-tip scanner split | `host-tip-dual-pin.nix` or per-family modules; default.nix join + green bools only | Couple to remaining dual-pin; shrink hostPin lists as tip thins |
| 6 | Emit-product data family splits | emit-paths + b2-b8 + perform + capable + claims thin join | Prefer after or between dual-pin batches that do not touch that family |
| 7 | Shared scanner helper | optional `scan.nix` to dedupe local scan/forbid closures in default | Refactor only after green; no honesty change |

Plan already proposed similar names (plan-long-file-refactor.md section 2.3-2.4);
this note aligns and adds race matrix.

---

## 8. Race matrix vs Lean dual-pin

| Nix surface | Dual-pin batch 1-7 (done) | Batch 8 Perform (in flight) | Later batches |
|-------------|---------------------------|-----------------------------|---------------|
| host jargon / requiredFiles / hostLeans / unitSurface | cold | **safe parallel** | safe |
| hostSpecs Mult..Parity core | cold | safe if no token rewrite | safe |
| hostSpecs SelfApplyFs tip rows | was hot | **HOT -- do not race** | hot until tip thin done |
| hostSpecs ProductPathPerform home | was hot | **HOT** | cools after batch 8 |
| hostSpecs other product-path homes | cooled if batch done | cooler | hot only for that family's batch |
| emit-wire default B9 Perform scanner | -- | **HOT** | -- |
| emit-wire default other family scanners | cooled for 1-7 | prefer no mechanical split mid-batch | split after |
| emit-product Perform* attrs | -- | **HOT** | -- |
| emit-product paths / unitTranslation / contentSpecs drivers | cold | **safe parallel** (if truly no Perform block edit) | safe |
| unit-deepen / unit-walk / residual-free-measure | cold | safe | safe |

**Rule of thumb:** if the dual-pin implementer `rg`s a string into file F, the Nix
splitter must not edit F in the same window. Cold splits stay on disjoint paths.

---

## 9. Hard constraints (document for implementers)

| Constraint | Detail |
|------------|--------|
| Pure Nix only | No bash-in-Nix, no Python, no shell policy mills inside writeShellApplication |
| Thin join | `specs.nix` / emit `specs.nix` / future `emit-product.nix` are import + inherit + concat only |
| Stable attr names | Keep `requiredFiles`, `hostSpecs`, `hostLeans`, product* token attrs so default.nix inherit lists and just recipes stay stable |
| HITL flake stage | `just systems-host` / `just systems-emit-wire` impure-eval live tree; `nix flake check` needs human `git add` of new nix paths |
| Claim honesty | Do not loosen complete/Full/ownership/perform true; free/llvm/PROVABLY false; StillUsesFreestandingEmit false holds |
| No naive half-file cut | Split on section comments / attr boundaries / family `rel =` blocks only |
| No `/tmp` full-file rebuild | Surgical edits or coherent move of whole named sections |
| Screw-up STOP | Lake/gate red, import cycle, stitch risk: **STOP**. No `git revert` / undo. Leave tree for human |
| No Lean in Nix slice | Host-presence/emit-wire data split Names do not edit `.lean` |
| Surgical rg + hand edit | No bulk sed across tree |
| Languages | Novel work: Lean / Idris / pure Nix only (this work is pure Nix) |

---

## 10. How default imports specs today (copy pattern)

**Host presence** (data monolithic today):

```text
default.nix -> import ./specs.nix -> one attrset
```

**Emit-wire** (data already sliced; eval still fat):

```text
default.nix -> import ./specs.nix
specs.nix   -> import ./emit-product.nix
            -> import ./unit-deepen.nix
            -> import ./unit-walk.nix
            -> import ./residual-free-measure.nix
            -> inherit + requiredFiles/contentSpecs concat
```

**Target host-presence (after slice 1):**

```text
default.nix -> import ./specs.nix   (unchanged call shape)
specs.nix   -> import ./jargon.nix
            -> import ./required-files.nix
            -> import ./host-leans.nix
            -> import ./unit-surface.nix
            -> hostSpecs = import ./host-specs.nix;  # or still inline until order 2-4
            -> inherit join
```

**Target emit-wire eval (after dual-pin eases):**

```text
default.nix -> import ./specs.nix
            -> import ./host-tip-dual-pin.nix { inherit lib root specs readRel has; }
               # or per-family; returns violations + green attrs
            -> join violations + summaries
```

Prefer passing `readRel`/`has` from default so path root stays single-sourced.

---

## 11. Recommended first implement Open Name (summary box)

| Field | Value |
|-------|--------|
| **Name** | Host presence non-tip data split |
| **Goal** | Coherent pure-Nix split of jargon, requiredFiles, hostLeans, unitSurfaceSpecs from kitchen-sink specs.nix |
| **Primary paths** | `nix/systems-host-presence/specs.nix` (thin join), new `jargon.nix`, `required-files.nix`, `host-leans.nix`, `unit-surface.nix`; `default.nix` only if inherit list needs comment (prefer zero default change) |
| **Gates** | `just systems-host`; hygiene if touching md (should not); do not require flake check until human stages |
| **Parallel with** | Lean dual-pin batch 8+ (SelfApplyFs + emit-wire Perform hostPin + emit-product Perform tokens) |
| **Do not touch** | hostSpecs product-path / SelfApplyFs rows; emit-wire; Lean |

---

## 12. Related

- Plan: `.agents/plans/plan-long-file-refactor.md`
- Dual-pin batch notes: `doc/dev/research/selfapplyfs-dual-pin-thin-b1-2026-07-30.md` .. `b7-...`
- RCA long-file / no stitch: `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md`
- Policy: `AGENTS.md` (Nix tooling; long-file residual; pure Nix; HITL stage)
