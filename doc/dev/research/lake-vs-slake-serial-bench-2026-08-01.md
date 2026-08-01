# Lake vs Slake serial wall-clock bench (2026-08-01)

Kind: analysis only. Not residual.

## Ready?

**S0-S3 done; S4 deferred.** Honest Lake-hosted product wire dogfood is green.
Freestanding product residual free and claim B writer-path complete are **true**.
Bootstrap **S0** foundation, **S1** FirstSurface, **S2** MultSubsetEmit, and
**S3** MultSubsetRebuild product gates re-verified green. **Cold rebuild** after
`lake clean` measured 2026-08-01 (see Cold wall-clock): Lake elaborator ~603 s
real; Slake product `just build` ~1.3 s cold; Mult subset rebuild ~0.6 s cold.
There is still **no** freestanding without-Lake peer elaborator and **no** S4
Lake retire -- `DependsOnLake` / StillUsesLake stay **true**. Do not forge them
false.

This note is wall-clock evidence only. It is **not** residual Open, not a claim
flip, and not "Slake beats Lake."

## What free + complete mean (short)

From `doc/vocabulary.md` and living claim surface (`just freestanding-self-host-complete`):

| Claim | Meaning on this tree today |
|-------|----------------------------|
| **Product residual free (claim A)** | Freestanding release under `out/freestanding-c` has no managed Lean / GC residual on the product wire, and DualResidual / wire honesty agree residual is gone. **Not** host elaborator free. Lake may still elaborate Systems Lean. Not PROVABLY; not LLVM unlock. |
| **Freestanding product self-host complete (claim B)** | Writer-path self-host evidence bar closed (Full step contract, ownership claimed, perform claimed, official dual-eq WRITE). **Not** "Lake gone." Host elaborator residual remains (`DependsOnLake` / StillUsesLake stay true). |

Both may be **true** while the official product path still runs under classic
Lake (Lake packages build Lake exes that write emit and install Out). Free is
not "bootstrap without Lake." Complete is not "Slake compiles Systems Lean
without Lake."

## Environment

| Item | Value |
|------|--------|
| Host | Linux horizon, x86_64, 16 logical CPUs |
| Date (UTC) | 2026-08-01 (ceremony + bench re-run same day) |
| Lake | 5.0.0-src+f3b06c7 |
| Lean | 4.32.2 (`~/.elan`) |
| Timer | bash builtin `time` with `TIMEFORMAT` matching `time -p` (`real` / `user` / `sys` seconds). **`/usr/bin/time` was not installed** on this host; same three fields recorded. |
| Order | Strictly serial; no parallel lake + regenerate |
| Warm label | **Hot warm** after bootstrap ceremony: `.lake` already populated; package jobs report Built without heavy theorem rebuild. Prior same-day session also recorded a **rebuild-heavy warm** B1 (~108 s real) when Lake re-elaborated theorems. |

## Bootstrap ceremony (re-verify S1-S3; not S4)

Serial from repo root with `PATH` including `~/.elan/bin`. All exit **0**.
S4 Lake retire was **not** started.

| Step | Command | Exit | real (s) | user (s) | sys (s) | notes |
|------|---------|------|----------|----------|---------|--------|
| S1 | `just first-surface` | 0 | 0.407 | 0.090 | 0.070 | GREEN; stillUsesLake true; dependsOnLake true |
| S2 | `just mult-subset-emit` | 0 | 1.109 | 0.200 | 0.225 | GREEN; includes Lake link of exe (not pre-separated) |
| S3 | `just mult-subset-rebuild` | 0 | 0.301 | 0.071 | 0.041 | GREEN; withoutLakeFinished false |
| Product wire | `just build` | 0 | 0.336 | 0.110 | 0.048 | freestanding-capable regenerate + install Out |
| Optional claim | `just freestanding-self-host-complete` | 0 | 0.798 | 0.343 | 0.266 | free true; complete true; DependsOnLake true; llvm/PROVABLY false |

Ceremony honesty lines held: Lake host remains; not S4; not PROVABLY; not llvm;
S3 not without-Lake finished.

## Commands run + exit codes (bench block)

| Step | Command | Exit |
|------|---------|------|
| B1 Lake elaborator | `cd src/systems && lake build` | 0 |
| B2 prebuild (not B2 wall) | `cd src/systems && lake build slake-freestanding-capable-regenerate` | 0 |
| B2 product regenerate | `just freestanding-capable-regenerate` | 0 |
| B-S1 prebuild | `cd src/systems && lake build slake-first-surface` | 0 |
| B-S1 first surface | `just first-surface` | 0 |
| B-S2 prebuild | `cd src/systems && lake build slake-mult-subset-emit` | 0 |
| B-S2 mult subset emit | `just mult-subset-emit` | 0 |
| B-S3 prebuild | `cd src/systems && lake build slake-mult-subset-rebuild` | 0 |
| B-S3 mult subset rebuild | `just mult-subset-rebuild` | 0 |
| B3 C object only | `cc -c -std=c11 -ffreestanding -nostdlib -Isrc/systems/emit -o /tmp/slake_fs.o src/systems/emit/slake_freestanding.c` | 0 |

Product wire artifacts (after `just build`):

- `src/systems/emit/slake_freestanding.{c,h}` (31742 / 31118 bytes)
- `out/freestanding-c/slake_freestanding.{c,h}` (same sizes)
- Mult subset package: `src/systems/emit/slake_mult_subset.{c,h}` (~958 / 1222 chars)

Claim gate reported: residual free true; complete true; `DependsOnLake` true;
llvm / PROVABLY false; lake claim proof GREEN. That is Lake-hosted claim
surface, not freestanding without-Lake.

Logs under `/tmp/grok-1000/`:

- `bench-s1-first-surface.log` (ceremony)
- `bench-s2-mult-subset-emit.log` (ceremony)
- `bench-s3-mult-subset-rebuild.log` (ceremony)
- `bench-just-build.log`
- `bench-self-host-complete.log`
- `bench-lake-build.log`
- `bench-prebuild-regenerate-exe.log`
- `bench-capable-regenerate.log`
- `bench-prebuild-first-surface.log`
- `bench-bs1-first-surface.log`
- `bench-prebuild-mult-subset-emit.log`
- `bench-bs2-mult-subset-emit.log`
- `bench-prebuild-mult-subset-rebuild.log`
- `bench-bs3-mult-subset-rebuild.log`
- `bench-cc-freestanding.log`

## Wall-clock table (hot warm, after ceremony)

Seconds from bash `TIMEFORMAT` (`real` / `user` / `sys`). Prebuild rows are
separated so product-path walls do not fold full Lake exe link cost.

| Step | real (s) | user (s) | sys (s) | notes |
|------|----------|----------|---------|--------|
| **B1** `lake build` (package) | 0.440 | 0.194 | 0.098 | **Hot warm.** 170 jobs already Built; no heavy theorem rebuild this pass. Measures classic Lean elaborator / Lake package -- **not** freestanding Slake. |
| B1 reference (earlier same day) | 108.347 | 865.962 | 35.427 | **Rebuild-heavy warm.** Prior session: 167 jobs, multi-core (user >> real). Use this when comparing "what a theorem rebuild costs," not this re-run's hot touch. |
| B2 prebuild exe | 0.137 | 0.038 | 0.015 | **Hot warm.** Separated so B2 does not fold full exe link into regenerate wall. |
| **B2** `just freestanding-capable-regenerate` | 0.312 | 0.112 | 0.024 | **Hot warm.** Closest full-dialect "Slake product path" dogfood today: Lake-hosted ordered READ+COMPOSE+WRITE-HC+INSTALL-OUT. Still uses Lake. |
| B-S1 prebuild | 0.137 | 0.035 | 0.008 | Lake exe `slake-first-surface` |
| **B-S1** `just first-surface` | 0.287 | 0.063 | 0.036 | Bootstrap S1 Mult unit structural readiness. Lake-hosted. |
| B-S2 prebuild | 0.133 | 0.024 | 0.014 | Lake exe `slake-mult-subset-emit` |
| **B-S2** `just mult-subset-emit` | 0.292 | 0.070 | 0.033 | Bootstrap S2 Mult subset package write. Lake-hosted. Not full product-wire regenerate. |
| B-S3 prebuild | 0.136 | 0.029 | 0.013 | Lake exe `slake-mult-subset-rebuild` |
| **B-S3** `just mult-subset-rebuild` | 0.291 | 0.071 | 0.034 | Bootstrap S3 Mult subset re-emit/re-validate. Lake-hosted; withoutLakeFinished false. |
| **B3** `cc -c` freestanding C | 0.126 | 0.044 | 0.016 | **Different workload.** Host `cc` on already-emitted product C. **Not** "Slake compiles Lean." |

### How to read the numbers (honest)

1. **B1 elaborator cost is state-dependent.** Hot package touch is sub-second.
   Rebuild-heavy package elaboration (prior same-day ~108 s real, high user)
   dominates when theorems rebuild. Neither figure is freestanding Slake.
2. **B2 / B-S1 / B-S2 / B-S3 are small** only because Lake exes were prebuilt
   and each path is a short Lake-hosted IO / readiness program -- not a
   freestanding compiler front-end and not a peer elaborator.
3. **B3 is tiny** and measures host `cc` on ~32 KiB freestanding C, not
   Systems Lean elaboration and not a Slake compile of `.lean` sources.
4. Ceremony S2 wall (~1.1 s) was higher than post-prebuild B-S2 (~0.3 s)
   because the ceremony recipe paid Lake link/build inside the timed command.
5. Hot warm times **understate** cold-machine cost. See **Cold wall-clock**
   below for measured cold numbers after `lake clean`.

## Cold wall-clock (2026-08-01 re-run; single process)

**Wipe:** `cd src/systems && lake clean` then one serial chain. Timer: bash
`TIMEFORMAT` matching `time -p` (`/usr/bin/time` absent). **Strict serial** --
one lake/just at a time (earlier multi-agent cold attempts aborted: concurrent
lake race on CapableRead .olean; SIGTERM exit 143 -- those runs are **invalid**).

Logs: `/tmp/grok-1000/bench-cold-*.log`, warm delta
`/tmp/grok-1000/bench-warm-*.log`. Join:
`/tmp/grok-1000/grok-impl-summary-cold-slake-rebuild-bench.md`.

### Cold table (after lake clean)

| Step | real (s) | user (s) | sys (s) | Exit | notes |
|------|----------|----------|---------|------|--------|
| **B1 cold** `lake build` (package) | **603.098** | 3904.312 | 72.783 | 0 | Full cold elaborator of SystemsLean (170 jobs). Classic Lake -- **not** freestanding without-Lake Slake. Multi-core (user >> real). |
| **Product rebuild** `just build` (cold) | **1.330** | 6.624 | 0.941 | 0 | Official freestanding wire via Slake path (capable regenerate + install Out). First run after clean pays Lake link of regenerate exe. Still Lake-hosted. |
| **S1** `just first-surface` (cold) | **0.684** | 0.623 | 0.239 | 0 | Mult unit surface. Lake-hosted. |
| **S2** `just mult-subset-emit` (cold) | **0.594** | 0.506 | 0.205 | 0 | Mult subset package write. Lake-hosted. |
| **S3 rebuild** `just mult-subset-rebuild` (cold) | **0.597** | 0.488 | 0.215 | 0 | Mult subset self-application rebuild. Lake-hosted; withoutLakeFinished false. |
| Claim `just freestanding-self-host-complete` (cold) | **1.019** | 0.572 | 0.423 | 0 | free true; complete true; DependsOnLake true. Not a compiler. |
| Host `cc -c` freestanding C (cold) | **0.045** | 0.038 | 0.005 | 0 | Host C of already-emitted wire -- not Slake. |

### Cold vs warm (same session, second pass)

| Step | cold real (s) | warm real (s) | notes |
|------|---------------|---------------|--------|
| `just build` | 1.330 | 0.328 | Warm omits cold Lake link of regenerate path |
| `just mult-subset-rebuild` | 0.597 | 0.301 | Warm Mult subset rebuild after cold path |

### Compare cold Lake elaborator vs cold Slake product paths

| Workload | cold real (s) | What it measures |
|----------|---------------|------------------|
| Lake elaborator (`lake build` after clean) | **~603** | Classic Lean elaborates full SystemsLean host package |
| Slake product wire rebuild (`just build`) | **~1.3** | Lake-hosted ordered freestanding dual-eq WRITE + install |
| Slake Mult subset rebuild (`just mult-subset-rebuild`) | **~0.6** | Lake-hosted S3 Mult subset re-emit/re-validate |

**Honest reading:** cold Lake elaborator dominates wall clock (~10 minutes real,
~65 minutes of CPU across cores). Cold Slake product / Mult subset rebuilds
are sub-second to ~1 s because they are **not** re-elaborating the host Lean
package; they run already-built (or freshly linked) Lake exes over SSOT/emit.
This is **not** evidence that freestanding Slake-without-Lake is faster than
Lake as a peer elaborator -- that peer does not exist until S4 / without-Lake
finished.

## Self-host: "Slake with Slake" vs "Slake with Lake" (2026-08-01)

Operator ask: self-host Slake with Slake and compare build times.

### Verdict

| Question | Answer |
|----------|--------|
| Can freestanding Slake elaborate / rebuild the Systems Lean host tree without Lake? | **No** (not yet) |
| Is claim B freestanding product self-host complete? | **Yes** (writer-path bar under Lake host) |
| Is Mult subset self-application measured (bootstrap S3)? | **Yes** (Lake-hosted re-emit of Mult package) |
| Is without-Lake finished / S4 Lake retire done? | **No** (deferred; do not forge) |

Closest honest "Slake rebuilds Slake surface" today:

1. **Product wire self-apply:** `just build` (Lake-hosted freestanding-capable dual-eq WRITE + install Out)
2. **Mult subset self-apply:** `just mult-subset-rebuild` (Lake-hosted re-write of `emit/slake_mult_subset.{h,c}`)

Neither path is a freestanding peer elaborator of `.lean` sources. Emitted
freestanding C is a **library dialect**, not a compiler. Explore map:
`/tmp/grok-1000/explore-slake-selfhost-map.md`.

### Cold comparison (same wipe session as Cold wall-clock)

| Build path | Command | cold real (s) | cold user (s) | Honest meaning |
|------------|---------|---------------|---------------|----------------|
| **Slake with Lake** | `cd src/systems && lake build` (after `lake clean`) | **603.1** | 3904.3 | Classic Lake elaborates full SystemsLean host package (170 jobs) -- builds the host that *is* Slake today |
| **Slake product self-apply** | `just build` | **1.33** | 6.62 | Official freestanding product wire rebuild via Slake path (still Lake-hosted exe) |
| **Slake Mult subset self-apply** | `just mult-subset-rebuild` | **0.60** | 0.49 | Bootstrap S3 Mult package re-emit (still Lake-hosted) |
| **Slake Mult + product** (sum) | product then Mult rebuild | **~1.9** | -- | Both Slake surfaces back-to-back (not one freestanding driver) |

**Ratio (rough):** cold Lake package elaborator is on the order of **~300-1000x**
longer wall than cold Slake product/subset self-apply -- because those paths do
**not** re-elaborate Systems Lean theorems; they run short Lake-hosted
write/validate pipelines over SSOT and Mult package text.

### What true "Slake with Slake" still needs

1. Freestanding (or non-Lake) product **driver** that can write Mult / dialect packages without `lake exe`
2. Real **front-end** over Systems Lean / Slake sources (not only fixed Mult fixtures + SSOT fragments)
3. Measured **without-Lake finished** on Mult subset (or larger), without forging `StillUsesLake` false early
4. **S4** Lake retire only with elaborator proof on DependsOnLake / StillUsesLake

Until then, self-host comparison is **partial**: Lake builds the host compiler;
Slake paths rebuild freestanding **product surfaces** under that host.

## Explicit non-claims

- **B3 is not a slake compiler.** It is host C compilation of product wire
  output.
- **B2 still uses Lake.** Recipe and Lake exe
  `slake-freestanding-capable-regenerate` are host bootstrap tools.
- **B-S1 / B-S2 / B-S3 still use Lake.** `just first-surface`,
  `just mult-subset-emit`, `just mult-subset-rebuild` are Lake-hosted
  bootstrap surfaces. S3 is measured Mult subset self-application under Lake,
  not without-Lake finished, not S4.
- **B1 is not "Slake compile time."** It is classic Lake elaborating the
  Systems Lean host package.
- Free true / complete true **do not** mean Lake is gone, freestanding Slake
  binary exists without Lake, or bootstrap no longer depends on Lake.
- This bench does **not** unlock llvm IR residual, PROVABLY / CompCert, or
  residual Open Names.
- No comparison claim of the form "Slake is faster than Lake." There is no
  freestanding Slake compiler to compare as a peer elaborator.
- **S4 was not started.** StillUsesLake / DependsOnLake remain true.

## Bootstrap stages vs this bench

(Analysis only; not an Open residual list.)

| Item | Honest status | Stage |
|------|---------------|-------|
| 1. **FirstSurface / Mult subset emit / rebuild** | Product gates green (ceremony re-verify). | S1-S3 **done** |
| 2. **Host elaborator residual remains** | `DependsOnLake` / StillUsesLake stay true; free is product-wire residual free only. | Honest until S4 |
| 3. **Without-Lake self-application not finished** | S3 reports `withoutLakeFinished: false`. Peer elaborator without Lake is later work. | S3 deepen / S4 later |
| 4. **S4 Lake retire** | Deferred. Do not forge StillUsesLake false. | **Deferred** |
| 5. **Product wire is freestanding C dialect emit** | Regenerate writes `slake_freestanding.{c,h}` and installs Out; Mult subset package is separate small emit. | Living dogfood |
| 6. **Proof / PROVABLY / llvm** | Held separate and false on the claim gate; not bootstrap substitutes. | Held |

## Method notes for re-run

```bash
cd /home/hunter/Projects/ai/iso
export PATH="$HOME/.elan/bin:$PATH"
# Prefer GNU time when present:
#   /usr/bin/time -p <cmd>
# This host used:
export TIMEFORMAT=$'real %R\nuser %U\nsys %S'

# Ceremony (serial; not S4)
just first-surface
just mult-subset-emit
just mult-subset-rebuild
just build
# optional: just freestanding-self-host-complete

# Bench (serial only -- do not background lake build with regenerate)
cd src/systems && { time lake build; }
lake build slake-freestanding-capable-regenerate   # prebuild, separate
cd ../.. && { time just freestanding-capable-regenerate; }
cd src/systems && lake build slake-first-surface
cd ../.. && { time just first-surface; }
cd src/systems && lake build slake-mult-subset-emit
cd ../.. && { time just mult-subset-emit; }
cd src/systems && lake build slake-mult-subset-rebuild
cd ../.. && { time just mult-subset-rebuild; }
{ time cc -c -std=c11 -ffreestanding -nostdlib \
    -Isrc/systems/emit -o /tmp/slake_fs.o \
    src/systems/emit/slake_freestanding.c; }
```

Label each run **hot warm**, **rebuild-heavy warm**, or **cold** (cold: wipe
or miss `.lake` / no prior just build on the machine).

## Related living docs (not residual)

- Terms: `doc/vocabulary.md` (product residual free; freestanding product
  self-host complete; dual residual honesty)
- Product path honesty: `src/systems/self-host.md`,
  `src/systems/emit/host-owned-emit.md`
- Gates: `just build`, `just freestanding-capable-regenerate`,
  `just first-surface`, `just mult-subset-emit`, `just mult-subset-rebuild`,
  `just freestanding-self-host-complete`
- First surface inventory (analysis):
  `doc/dev/research/slake-first-compiler-surface-inventory-2026-08-01.md`
