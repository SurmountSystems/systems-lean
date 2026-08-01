# Name B full Mult write design deepen

Kind: analysis only. Not residual flip. Not product claim. Not implement.
ASCII only. Date: 2026-08-01.

Cites (do not re-derive without re-reading):

- `doc/dev/research/mult-without-lake-driver-design-2026-08-01.md`
  (M2 without-Lake operational meaning; Name A prebuilt; Name B deepen sketch)
- `src/systems/SystemsLean/MultFsDeepen.lean`
  (`multFsWritePathReady` true; `freestandingDriverComplete` false;
  `multFsWrite` / Lake-prebuilt writer honesty)
- `src/systems/SystemsLean/MultFsWriteMain.lean`
  (thin Lake exe root for `slake-mult-fs-write`)
- just `mult-subset-freestanding-write` (prebuilt hot path; no lake on measure)
- Plan: `.agents/plans/plan-residual-free-freestanding.md` Step 5 M2

Living tip at design time (2026-08-01):

| What | Status |
|------|--------|
| Claim B complete | true |
| Claim A free | true |
| StillUsesLake / DependsOnLake | true (until M6 / S4) |
| M2 Name A Mult without-Lake prebuilt | done (`withoutLakeFinished` true) |
| M2 Name B greps partial | done (`freestandingDeepenPartial` true) |
| Host MultSubsetEmit Mult SSOT write path | done (`multFsWritePathReady` true) |
| `freestandingDriverComplete` | **false** (Lake-built `slake-mult-fs-write` is measured writer) |
| M2 Name B full freestanding Mult write | **next implement** (this note scopes Done when) |
| S4 / M6 / Step 4 PROVABLY / llvm | deferred / held |

---

## 1. Operational definition: Mult write without Lake-built ELF

**Measured Mult re-emit step (today)** means the Mult unit package write that
`just mult-subset-freestanding-write` performs:

```
bootstrap once (not hot path):
  (cd src/systems && lake build slake-mult-fs-write)
  -> ELF: src/systems/.lake/build/bin/slake-mult-fs-write

measured hot path:
  just mult-subset-freestanding-write
  -> exec prebuilt slake-mult-fs-write <repo-root>
  -> MultFsDeepen.multFsWrite
  -> IO.FS.writeFile emit/slake_mult_subset.{h,c}
  -> greps Mult package tokens + freestanding Mult surface dual-check
```

| Layer | Today | Name B full bar |
|-------|-------|-----------------|
| Invokes `lake build` / `lake exe` / `lake env` on hot path | no (Name A-style prebuilt) | still no |
| Writer **process** is a Lake-built classic Lean AOT ELF | **yes** (`.lake/build/bin/slake-mult-fs-write`) | **no** |
| Package text ownership | MultSubsetEmit freestanding Mult SSOT in Lean | same Lean / Lean-generated SSOT (no hand product C) |
| Mult rebuild ELF as package writer | no (`multFsWriteNotRebuildDriver`) | still no |
| Product StillUsesLake / DependsOnLake | true | **true** until M6 |

**Operational definition (Name B full):**

> Mult package write on the **measured re-emit** runs a writer that is **not**
> a Lake-built ELF (not under Lake's `.lake/build/bin/`, not produced by
> `lake build` / `lake exe` for that Mult write tool). The writer may be a
> freestanding product-wire binary built with host `cc` from Lean-generated
> freestanding C, or a later Slake-built freestanding driver. Dual evidence
> required: Lean structural pin (`freestandingDriverComplete` true only with
> real path) + on-disk Mult package greps after the measured write.

**Not enough for freestandingDriverComplete:**

| Partial | Why incomplete |
|---------|----------------|
| Prebuilt Lake ELF + no lake on hot path | Already true today; `multFsWritePathReady` true; complete stays false |
| Greps that Mult package / freestanding Mult exist without a real write | Name B greps partial only |
| Mult rebuild without-Lake (Name A) | Different measured step (rebuild ELF, not Mult package writer) |
| Selling freestanding Mult dialect embed as Mult package write | Product wire has Mult API; it does **not** write `slake_mult_subset.{h,c}` today |
| Flipping the Bool without a non-Lake-built writer | Forge |

**Still allowed after Name B full (host residual honesty):**

- Lake may still elaborate Systems Lean for other host work (StillUsesLake true).
- Lake may still prebuild **other** tools; measured Mult **write** must not
  depend on a Lake-built Mult write ELF.
- Name A Mult rebuild without-Lake prebuilt path remains valid (additive).

---

## 2. Inventory: current Mult write path

### 2.1 Roles and paths

| Role | Path / token |
|------|----------------|
| Structural + write body | `src/systems/SystemsLean/MultFsDeepen.lean` |
| Thin Main / Lake exe root | `src/systems/SystemsLean/MultFsWriteMain.lean` |
| Lake exe name | `slake-mult-fs-write` (`lakefile.toml`) |
| Prebuilt ELF (bootstrap) | `src/systems/.lake/build/bin/slake-mult-fs-write` |
| just measured write | `just mult-subset-freestanding-write` |
| just greps partial | `just mult-subset-freestanding-deepen` |
| Package out | `src/systems/emit/slake_mult_subset.h`, `slake_mult_subset.c` |
| Package text SSOT builder | MultSubsetEmit packages (`multSubsetHeaderPackage` / `multSubsetSourcePackage`) |
| Mult dialect SSOT | `EmitMult` + `host_emit_mult.ssot.txt` (HOST-EMIT-MULT) |
| Freestanding product wire | `emit/slake_freestanding.{h,c}` (embeds Mult dialect; not Mult package writer) |
| Mult rebuild ELF (not writer) | `slake-mult-subset-rebuild` / Name A prebuilt |

### 2.2 Honesty pins (MultFsDeepen)

| Pin | Value | Meaning |
|-----|-------|---------|
| `freestandingDeepenPartial` | true | Greps dual-check freestanding Mult + Mult package |
| `multFsWritePathReady` | true | Host MultSubsetEmit SSOT write path exists |
| `freestandingDriverComplete` | **false** | Measured writer is still Lake-built write ELF |
| `multFsDeepenDriverReady` | false | Requires complete |
| `multFsWriteNotRebuildDriver` | true | Writer is not Mult rebuild ELF |
| `multFsWritePathDoesNotMeanDriverComplete` | true | Path ready != design complete |
| `stillUsesLake` / `dependsOnLake` | true | Product host residual until M6 |
| Name A withoutLakeFinished | true | Unchanged; additive |

### 2.3 Who builds the write ELF today

1. Human/agent bootstrap: `(cd src/systems && lake build slake-mult-fs-write)`.
2. Lake elaborates MultFsWriteMain -> MultFsDeepen, links classic Lean AOT ELF.
3. Measured step runs that ELF only (no `lake` on hot path).
4. ELF body calls `IO.FS.writeFile` with MultSubsetEmit package strings.

**Can freestanding C write Mult package today?** No. Freestanding product
wire carries Mult **API** (`enum slake_mult`, `slake_mult_is_valid`, names)
for consumers of `out/freestanding-c`. It does not implement Mult **package
file emit** (no write of `slake_mult_subset.{h,c}` from freestanding C).
Mult package write is host Lean IO only.

### 2.4 Relation to Name A

| | Name A | Host Mult SSOT write (landed) | Name B full (next) |
|--|--------|-------------------------------|--------------------|
| Measured step | Mult subset re-emit via rebuild ELF | Mult package write via MultSubsetEmit SSOT | Mult package write |
| Hot path lake | no | no | no |
| Lake-built ELF as writer | yes (rebuild prebuilt) | yes (write prebuilt) | **must not** |
| Local pin | withoutLakeFinished true | multFsWritePathReady true | freestandingDriverComplete true |
| Product StillUsesLake | true | true | true |

---

## 3. Candidate implement paths (three languages only)

Hard bans: no new shell mills for Mult logic; no hand-authored product C
features; no Python; just stays thin process glue.

### Path A -- Prefer: Lean-generated freestanding Mult package writer + host `cc`

**Idea:** Mult package bytes stay owned by Lean MultSubsetEmit SSOT. Emit a
small freestanding C **writer tool** (generated, not hand-grown product API
ladder) that writes those bytes to `emit/slake_mult_subset.{h,c}`. Compile the
tool with host `cc` (freestanding-friendly flags as appropriate) into a path
**outside** `.lake/build/bin/`. Measured just recipe runs that `cc`-built
binary only.

| Piece | Owner language |
|-------|----------------|
| Package string assembly / emit of writer C | Lean 4 host (`MultFsDeepen` / short new role module if needed) |
| Writer C sources under `emit/` or emit-adjacent generated path | Generated product wire (Lean emit; not hand features) |
| Build Mult write tool | Thin just: `cc` only (process glue) |
| Measure | Thin just: exec freestanding-built writer + greps (no lake) |
| Presence / honesty tokens | pure Nix host presence if new modules |

**Why this matches freestandingDriverComplete:** measured writer is not a
Lake-built Lean AOT ELF. Bootstrap may still use Lake to elaborate host Lean
that **generates** the writer C; measured re-emit does not exec Lake ELF.

**Risks / stop rules:**

- Do not grow Mult package logic in C by hand; regenerate from Lean SSOT.
- Do not claim product StillUsesLake false (host still uses Lake to build
  Systems Lean sources that own SSOT).
- Do not invent a full freestanding Mult **compiler**; fixed Mult unit package
  re-emit only.
- Prefer short role names (`MultFsWrite` deepen, not kitchen-sink path names).

### Path B -- Later: Slake-built freestanding Mult write driver

When freestanding Slake can produce the Mult write tool itself (deeper on the
M3-M5 / self-host ladder), measured step may run Slake-built Mult writer.
**Not** required if Path A already meets "no Lake-built ELF on measured Mult
write." Prefer Path A for Name B full implementability now.

### Path C -- Reject for Name B full

| Path | Reject reason |
|------|----------------|
| Only rename or flip `freestandingDriverComplete` | Forge without non-Lake-built writer |
| Shell script that `printf` Mult package | Shell mill; three-languages ban |
| Hand-edit `slake_mult_subset.c` as residual progress | Hand product C ban |
| `lean --run` MultFsWriteMain without lake on hot path | Still classic Lean runtime ELF; MultFsDeepen design bar is freestanding / non-Lake-built Mult write, not "lake-less lean" |
| Mult rebuild prebuilt as package writer | Violates `multFsWriteNotRebuildDriver` |
| Pure Nix writing Mult C | Nix is tooling gates/meters, not Mult package product body |

**Recommended implement default:** Path A.

---

## 4. Honesty matrix

| Pin | Today | After Name B full implement (proposed) | After M6 only |
|-----|-------|----------------------------------------|---------------|
| `multFsWritePathReady` | true | true (host path remains) | true |
| `freestandingDeepenPartial` | true | true (complete implies partial) | true |
| `freestandingDriverComplete` | **false** | **true only if** measured Mult write uses non-Lake-built writer + dual evidence | true |
| `multFsDeepenDriverReady` | false | true when complete true | true |
| Product `StillUsesLake` | true | **true** | may false with elaborator proof |
| Product `DependsOnLake` | true | **true** | may false with elaborator proof |
| Name A withoutLakeFinished | true | true (unchanged) | true |
| Claim A free | true | unchanged | unchanged |
| Claim B complete | true | unchanged | unchanged |
| PROVABLY / llvm | false / held | false / held | separate Step 4 |
| freestandingProductSelfHostComplete re-open | no | **do not re-open** | n/a |

**When freestandingDriverComplete may become true:**

1. Measured Mult package re-emit does not exec a Lake-built Mult write ELF.
2. Writer is freestanding-generated + `cc`-built (Path A) or later Slake-built
   (Path B), under three-languages rules.
3. Dual evidence: Lean pin true + theorems/smoke honesty; just greps on
   `emit/slake_mult_subset.{h,c}` after real write; freestanding Mult surface
   dual-check still green.
4. Product StillUsesLake / DependsOnLake remain true (not S4).
5. free / complete product pins unchanged; not PROVABLY; not llvm.

**StillUsesLake until M6:** Name B full is a **driver** milestone for Mult
package write only. It does not retire Lake as host elaborator.

---

## 5. Draft residual: Name B full freestanding Mult write

### Name B full freestanding Mult write

| Field | Content |
|-------|---------|
| **Name** | Name B full freestanding Mult write |
| **Goal** | Mult package write on measured re-emit without a Lake-built ELF as the Mult package writer, with dual evidence and honest freestandingDriverComplete flip. |
| **Done when** | (checkable; see list below) |
| **Out of scope** | S4 / M6 product Lake retire; StillUsesLake false; free/complete re-open; PROVABLY; llvm; full freestanding Mult compiler; hand product C features; shell Mult mills; Mult rebuild ELF as package writer |
| **Primary paths** | `src/systems/SystemsLean/MultFsDeepen.lean` (+ thin Main / emit as needed); just Mult write recipe; pure Nix presence if new modules; docs self-host / host-owned-emit honesty |

**Done when (draft for implement residual):**

1. **Writer not Lake-built on measure.** Measured Mult package re-emit runs a
   Mult write driver that is **not** `src/systems/.lake/build/bin/slake-mult-fs-write`
   (and not any other Lake-built Mult write ELF). Prefer Path A: Lean-generated
   freestanding Mult package writer compiled with host `cc` to a documented
   non-`.lake` bin path.
2. **just measure.** Named just recipe (evolve `mult-subset-freestanding-write`
   or additive recipe with short greppable id) that: does **not** call
   `lake build` / `lake exe` / `lake env` on the hot path; does **not** exec
   Mult rebuild ELF as Mult package writer; runs the non-Lake-built Mult write
   driver; greps Mult package tokens on `emit/slake_mult_subset.{h,c}`
   (same Mult identity tokens as today: MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT_V0,
   SLAKE_FIRST_SURFACE_MULT, HOST-EMIT-MULT, MULT-0, `enum slake_mult`,
   `slake_mult_is_valid`); dual-checks freestanding Mult surface still present.
3. **Lean honesty.** Flip `freestandingDriverComplete` to **true** only with
   (1)+(2) real; set `multFsDeepenDriverReady` accordingly; keep
   `multFsWritePathReady` true; keep `freestandingDeepenPartial` true
   (complete implies partial); keep `multFsWriteNotRebuildDriver` true;
   product-local `stillUsesLake` / `dependsOnLake` true; theorems + smoke
   updated (including former `_false` complete pins).
4. **Lake claim flip proof.** While Lake is host elaborator: `lake build`
   MultFsDeepen (and write Main / new modules if any) green; do not mark GREEN
   on greps alone for the Bool flip.
5. **Presence dual-pin** if new Lean modules or new generated writer paths need
   host presence tokens; pure Nix specs updated surgically.
6. **Docs honesty:** `self-host.md` M2 Name B full row; README tip map only;
   `host-owned-emit.md` if Mult package ownership wording changes; residual
   archive. Product free/complete/StillUsesLake/PROVABLY/llvm **unchanged**
   (StillUsesLake remains true).
7. **Gates:** focused just Mult write measure green; `just mult-subset-freestanding-deepen`
   still green; `just systems-host`; `just product-residual-free-measure`;
   `just hygiene` if md; free/complete product pins unchanged.

**Non-claims (implement residual):**

1. Not S4 / M6; not product StillUsesLake false.
2. Not free or complete product tip re-open or flip.
3. Not PROVABLY; not llvm unlock; not Step 4.
4. Not inventing a freestanding Mult **compiler** (fixed Mult unit package
   re-emit only).
5. Not Mult rebuild ELF as Mult package writer.
6. Not shell/Python Mult logic; not hand product C feature growth.
7. Not claiming prebuilt Lake write ELF == freestandingDriverComplete.
8. Not full freestanding dialect rewrite as sole success.

---

## 6. Explicit non-claims (this design note)

1. This note does **not** flip `freestandingDriverComplete`.
2. This note does **not** implement Mult write without Lake-built ELF.
3. Not S4 / M6 / StillUsesLake false.
4. Not free / complete product changes.
5. Not PROVABLY / llvm.
6. Not a second Mult C dialect.
7. Not residual "done" for Name B full implement -- only design deepen.

---

## 7. Design close checklist

| Item | Status |
|------|--------|
| Cite mult-without-lake + MultFsDeepen honesty | section header + 1-2 |
| Operational definition Mult write without Lake-built ELF | section 1 |
| Inventory current write path | section 2 |
| Candidate implement paths (three languages) | section 3 (Path A prefer) |
| Honesty matrix complete / StillUsesLake | section 4 |
| Draft Done when for Name B full implement | section 5 |
| Non-claims | section 5-6 |
| Residual Open next = implement Name B full | residual / WATCHER after this note |
| Driver code | **not** in this note |

Implement residual after this design should open:

**Name B full freestanding Mult write**

with Done when from section 5.
