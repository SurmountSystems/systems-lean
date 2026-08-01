# Lake vs Slake proper serial bench (post-M6 tip, 2026-08-01)

Kind: analysis only. Not residual. Measurement only -- no claim flips.

## THE comparison: Slake with Slake vs Slake with Lake

Operator ask: self-host rebuild times -- Slake building Slake surface vs Lake
building the host that is Slake. Dedicated re-run 2026-08-01 UTC ~23:13-23:28.
Raw: `/tmp/grok-1000/bench-sws-compare.tsv`.

| Path | Command (serial) | real (s) | user (s) | What it rebuilds |
|------|------------------|----------|----------|------------------|
| **Slake with Lake (cold)** | `lake clean` then `cd src/systems && lake build` | **877.7** | 3893.0 | Full SystemsLean host package (classic Lean elaborator) |
| **Slake with Lake (hot)** | `cd src/systems && lake build` (already Built) | **0.36** | 0.23 | Package probe only; no heavy re-elaborate |
| **Slake with Slake (steady warm)** | product-wire freestanding write + Mult freestanding write + 8-unit subset join without Lake | **0.20** | 0.13 | Freestanding product wire + Mult package + Mult..Compose unit packages |
| **Slake with Slake (pass1 warm)** | same chain | **0.34** | 0.14 | Same; may pay host-cc link |
| **Slake with Slake (after cold Lake)** | same chain after clean+full lake+exe bootstrap | **1.31** | 0.31 | Same surface; host-cc writers re-link after wipe context |
| **Slake with Slake (product wire only)** | `just build` | **0.09** | 0.06 | Official freestanding wire only |

**Ratio (cold Lake vs steady Slake-with-Slake surface):** ~877.7 / 0.20 ~ **~4400x** wall.

**What this is:** the best available head-to-head on this tip for "rebuild with
Lake" vs "rebuild freestanding Slake product surface without Lake on the hot
path."

**What this is not:** freestanding Slake elaborating Systems Lean `.lean` sources
as a peer to Lake. That peer does not exist yet. Lake still owns host elaborate.
Slake-with-Slake rebuilds **emit / freestanding product packages**, not the Lean
host theorem tree.

## Ready?

**Product freestanding ladder M0-M6 closed** on this tip. Product path
`StillUsesLake` / `DependsOnLake` are **false** (M6 phase 2 lake elaborator
proof). Host elaborator residual **remains** (free is not host free). Step 4
PROVABLY / LLVM **held**.

This note supersedes wall-clock tables in
`lake-vs-slake-serial-bench-2026-08-01.md` for the **post-M6** product tip.
Older note still useful for pre-M6 ceremony narrative; do not mix claim pins.

## Protocol (proper)

| Rule | Detail |
|------|--------|
| Serial only | One lake/just/`cc` at a time. No parallel Lake (known `.olean` race). |
| Timer | bash builtin `time` with `TIMEFORMAT` matching `time -p` (`real` / `user` / `sys`). `/usr/bin/time` not required. |
| Phases | **WARM0** current tree; **COLD** after `lake clean` + full `lake build`; **WARM1** immediate second pass; **BOOTSTRAP** named unit exes; **PREBUILT** / **PREBUILT-WARM** without-Lake with prebuilts present. |
| Script | `/tmp/grok-1000/bench-proper-serial.sh` |
| Raw TSV | `/tmp/grok-1000/bench-proper-results.tsv` (52 data rows) |
| Console | `/tmp/grok-1000/bench-proper-console.log` |
| Join | `/tmp/grok-1000/grok-impl-summary-proper-bench-2026-08-01.md` |

## Environment

| Item | Value |
|------|--------|
| Host | Linux horizon, x86_64, 16 logical CPUs |
| Date (UTC) | 2026-08-01 (start 22:43:14Z, done 23:00:24Z + prebuilt follow-up) |
| Lake | 5.0.0-src+f3b06c7 |
| Lean | 4.32.2 (`~/.elan`) |
| Repo tip | post-M6 product path Lake pins false; host residual remains |

## Headline comparison

| Workload | real (s) | Honest meaning |
|----------|----------|----------------|
| **Cold Lake elaborator** (`lake clean` then `lake build` package) | **828.1** | Classic Lean elaborates full SystemsLean host package. Multi-core (user 3951 s). **Not** freestanding peer elaborator gone. |
| **Warm rebuild-heavy Lake** (`lake build` while package not fully hot) | **180.8** | Partial theorem/package rebuild. Still classic Lake. |
| **Hot Lake package touch** (WARM1 after full cold build) | **0.42** | Everything already Built; package probe only. |
| **Official product wire** `just build` (WARM0 / PREBUILT-WARM) | **0.10 / 0.15** | M4 Name C without-Lake hot path: host-cc freestanding product-wire writer preferred. |
| **Host-cc product-wire write** `product-wire-freestanding-write` | **0.08-0.12** | Path A freestanding dual-eq WRITE+INSTALL via host `cc`. No lake on hot path. |
| **Prebuilt regenerate without Lake** | **0.07-0.09** | Needs prebuilt `slake-freestanding-capable-regenerate` under `.lake/build/bin`. |
| **Lake diagnostic regenerate** `freestanding-capable-regenerate` | **0.9-1.3** warm; **3.2** first cold link | Lake may rebuild/link exe; not the official product hot path. |
| **Mult rebuild without Lake** | **0.03-0.04** | Prebuilt Mult rebuild ELF only. |
| **Mult rebuild Lake recipe** | **0.8-1.3** | Recipe may touch Lake. |
| **Mult freestanding host-cc write** | **0.06-0.12** | Path A Mult package writer (`cc` tool C). |
| **8-unit subset join without Lake** | **0.08-0.11** | Mult..Compose prebuilt rebuild ELFs. |
| **Host `cc -c` freestanding C** | **0.04** | Compile already-emitted ~32 KiB C. Not Slake elaborating Lean. |
| **Claim gate** `freestanding-self-host-complete` | **1.3-1.7** | Greps + lake claim proof surface. Not a compiler. |

### Rough ratios (wall real)

| Compare | Ratio (order of magnitude) |
|---------|----------------------------|
| Cold Lake package / warm `just build` | ~828 / 0.1 ~ **~8000x** |
| Cold Lake package / warm Mult without-Lake | ~828 / 0.03 ~ **~25000x** |
| Lake diagnostic regen warm / without-Lake regen | ~1.0 / 0.07 ~ **~15x** |
| Mult Lake recipe warm / Mult without-Lake | ~0.9 / 0.03 ~ **~30x** |

**Do not sell as "Slake elaborates Lean faster than Lake."** Fast paths re-write
emit packages / product wire; they do **not** re-elaborate Systems Lean theorems.

## Full tables

### WARM0 (current tree before clean)

| label | exit | real | user | sys |
|-------|------|------|------|-----|
| just-build | 0 | 0.103 | 0.061 | 0.033 |
| product-wire-fs-write | 0 | 0.079 | 0.059 | 0.015 |
| freestanding-regen-without-lake | 0 | 0.066 | 0.040 | 0.021 |
| freestanding-regen-lake | 0 | 1.327 | 0.782 | 0.453 |
| mult-rebuild-without-lake | 0 | 0.035 | 0.014 | 0.015 |
| mult-rebuild-lake | 0 | 0.797 | 0.384 | 0.222 |
| mult-fs-write | 0 | 0.063 | 0.045 | 0.015 |
| mult-subset-emit | 0 | 0.802 | 0.386 | 0.219 |
| first-surface | 0 | 0.805 | 0.387 | 0.222 |
| subset-packages-join-without-lake | 0 | 0.110 | 0.036 | 0.048 |
| lake-retire-inventory | 0 | 0.033 | 0.019 | 0.015 |
| self-host-complete | 0 | 1.300 | 0.684 | 0.428 |
| cc-freestanding-obj | 0 | 0.037 | 0.031 | 0.005 |
| lake-build-hot | 0 | **180.839** | 893.082 | 83.030 |

WARM0 `lake-build-hot` was **rebuild-heavy**, not a pure package touch (user >>
real). Compare WARM1 lake-build-hot 0.42 s after a full cold build.

### COLD (after `lake clean`)

| label | exit | real | user | sys | notes |
|-------|------|------|------|-----|--------|
| lake-build-package | 0 | **828.118** | 3951.577 | 235.761 | Full cold elaborator |
| just-build | 0 | 0.245 | 0.084 | 0.069 | Official product path; host-cc writer preferred |
| product-wire-fs-write | 0 | 0.093 | 0.065 | 0.023 | No lake; tool C already on disk |
| freestanding-regen-without-lake | **1** | 0.018 | 0.007 | 0.011 | Missing prebuilt regen ELF after package-only build |
| freestanding-regen-lake | 0 | 3.178 | 6.474 | 1.812 | Links/builds regen exe + run |
| mult-rebuild-without-lake | **1** | 0.014 | 0.005 | 0.009 | Missing prebuilt Mult rebuild ELF |
| mult-rebuild-lake | 0 | 1.287 | 1.378 | 0.510 | Lake recipe builds Mult rebuild |
| mult-fs-write | 0 | 0.077 | 0.048 | 0.024 | host-cc Mult writer |
| mult-subset-emit | 0 | 1.261 | 0.789 | 0.378 | Lake-hosted emit |
| first-surface | 0 | 1.243 | 0.746 | 0.389 | Lake-hosted |
| subset-packages-join-without-lake | **1** | 0.017 | 0.009 | 0.009 | Missing non-Mult unit rebuild ELFs |
| lake-retire-inventory | 0 | 0.041 | 0.022 | 0.019 | Prebuilt inventory exe (or greps) |
| self-host-complete | 0 | 1.652 | 0.995 | 0.609 | Claim surface |
| cc-freestanding-obj | 0 | 0.040 | 0.031 | 0.008 | Host C only |

**Finding (important):** plain `lake build` (package) after clean does **not**
necessarily produce every named exe under `.lake/build/bin`. Without-Lake recipes
that require prebuilt ELFs fail until `lake build <exe>` once. Official
`just build` still green cold because the preferred path is **host-cc product-wire
write**, not the prebuilt CapableRegenerate ELF.

### WARM1 (immediate second pass after cold)

| label | exit | real | user | sys |
|-------|------|------|------|-----|
| just-build | 0 | 0.110 | 0.069 | 0.038 |
| product-wire-fs-write | 0 | 0.090 | 0.059 | 0.026 |
| freestanding-regen-without-lake | 0 | 0.066 | 0.047 | 0.017 |
| freestanding-regen-lake | 0 | 0.926 | 0.499 | 0.246 |
| mult-rebuild-without-lake | 0 | 0.027 | 0.015 | 0.013 |
| mult-rebuild-lake | 0 | 0.930 | 0.466 | 0.270 |
| mult-fs-write | 0 | 0.072 | 0.051 | 0.019 |
| subset-packages-join-without-lake | **1** | 0.019 | 0.011 | 0.008 |
| lake-build-hot | 0 | **0.419** | 0.261 | 0.120 |
| self-host-complete | 0 | 1.505 | 0.757 | 0.558 |
| cc-freestanding-obj | 0 | 0.045 | 0.036 | 0.008 |

WARM1 without-Lake Mult regen works after COLD Lake Mult rebuild linked the
binary. Subset multi-unit join still fails until all unit rebuild exes exist.

### BOOTSTRAP + PREBUILT (fair without-Lake matrix)

| label | exit | real | user | sys |
|-------|------|------|------|-----|
| BOOTSTRAP unit-exes (11 named lake targets) | 0 | 1.985 | 8.674 | 2.480 |
| PREBUILT freestanding-regen-without-lake | 0 | 0.084 | 0.062 | 0.020 |
| PREBUILT mult-rebuild-without-lake | 0 | 0.036 | 0.016 | 0.020 |
| PREBUILT subset-packages-join-without-lake | 0 | 0.093 | 0.041 | 0.051 |
| PREBUILT product-wire-fs-write | 0 | 0.110 | 0.069 | 0.035 |
| PREBUILT just-build | 0 | 0.185 | 0.115 | 0.062 |
| PREBUILT mult-fs-write | 0 | 0.122 | 0.067 | 0.051 |
| PREBUILT-WARM freestanding-regen-without-lake | 0 | 0.093 | 0.055 | 0.036 |
| PREBUILT-WARM mult-rebuild-without-lake | 0 | 0.034 | 0.019 | 0.015 |
| PREBUILT-WARM subset-packages-join-without-lake | 0 | 0.082 | 0.044 | 0.038 |
| PREBUILT-WARM product-wire-fs-write | 0 | 0.120 | 0.081 | 0.031 |
| PREBUILT-WARM just-build | 0 | 0.150 | 0.097 | 0.047 |
| PREBUILT-WARM mult-fs-write | 0 | 0.108 | 0.069 | 0.033 |

Named bootstrap targets: freestanding-capable-regenerate, mult/linear/types/
program/extract/erasure/graph/compose subset-rebuild, first-surface,
mult-subset-emit.

## Side-by-side: Lake path vs without-Lake path

Same machine, same tip, warm/prebuilt-ready where both exit 0.

| Surface | Lake recipe real (s) | Without-Lake real (s) | Winner (wall) |
|---------|----------------------|------------------------|---------------|
| Product regenerate | freestanding-capable-regenerate ~0.9-1.3 | product-wire / without-lake regen ~0.07-0.12 | without-Lake / host-cc |
| Mult subset rebuild | mult-subset-rebuild ~0.8-0.9 | mult-subset-rebuild-without-lake ~0.03 | without-Lake |
| Full product install path | (Lake diagnostic) | just build ~0.10-0.18 | without-Lake hot path |
| Host package elaborator | lake build cold **828** / heavy warm **181** / hot **0.42** | n/a (no peer elaborator) | Lake still owns this job |

## Self-host honesty (post-M6)

| Question | Answer |
|----------|--------|
| Is product path StillUsesLake / DependsOnLake false? | **Yes** (M6 phase 2 with lake proof) |
| Does host still need Lake to elaborate Systems Lean? | **Yes** (host residual remains) |
| Can freestanding Slake elaborate full host `.lean` without Lake? | **No** (not measured; not claimed) |
| Is official `just build` Lake-free on the hot path? | **Yes** when host-cc writer tool C exists (preferred); else prebuilt regen ELF |
| Are without-Lake recipes zero-bootstrap? | **No** -- prebuilt ELFs need a one-time `lake build <exe>` (or host-cc tool C generation for Path A writers) |

## Vs earlier same-day cold bench

| Metric | Earlier note (pre/post S3) | This proper run (post-M6) |
|--------|----------------------------|---------------------------|
| Cold lake build real | ~603 s | **828 s** |
| Cold just build real | ~1.33 s (Lake-hosted cold link) | **0.245 s** (host-cc preferred) |
| Tree / job count | ~170 jobs (earlier) | Larger host (M3-M6 modules); cold cost grew |

Cold Lake cost grew as host modules grew. Product wire cold improved because
official path prefers host-cc freestanding writer over cold Lake exe link.

## Non-claims

- Not PROVABLY, not LLVM unlock, not Step 4.
- Not "host free" / not "Lake is gone from development."
- Not evidence freestanding Slake is a peer Lean elaborator.
- Failed exit=1 rows are **bootstrap missing prebuilt**, not product regressions
  on the preferred host-cc path.
- Single-run wall times (no multi-sample stats). Serial only.

## Reproduce

```bash
# Full harness (cold lake ~10-15 min):
/tmp/grok-1000/bench-proper-serial.sh

# Fair without-Lake after named exes exist:
(cd src/systems && lake build \
  slake-freestanding-capable-regenerate \
  slake-mult-subset-rebuild \
  slake-linear-subset-rebuild \
  slake-types-subset-rebuild \
  slake-program-subset-rebuild \
  slake-extract-subset-rebuild \
  slake-erasure-subset-rebuild \
  slake-graph-subset-rebuild \
  slake-compose-subset-rebuild)
just freestanding-capable-regenerate-without-lake
just mult-subset-rebuild-without-lake
just subset-packages-rebuild-join-without-lake
just product-wire-freestanding-write
just build
```
