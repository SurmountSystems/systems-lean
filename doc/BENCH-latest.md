# Lake versus Slake -- same named job

Generated: **2026-08-13 16:28:57 UTC** (same-job lead). Related suite tables below are from the last full `just bench` on **2026-08-10 22:35:44 UTC**.

Kind: wall-clock **same named job** on the compile-path develop-step, plus related different-job times. Not a residual claim flip. Not a token microbench.

## Same named job

**Named job:** host package elaborate under `src/systems` (hot `lake build` when the package is already Built). This is the compile-path develop-step Lake actually runs for day-to-day host work.

| Arm | Result |
|-----|--------|
| **Lake** | 0.447 s real (user 0.304, sys 0.129; hot second pass; `just bench-lake-host`) |
| **Slake** | Slake cannot do this job yet: full host package elaborate. Missing classic Lean elaborator parity. `FullHostElaborateRemains` stays false. |

Slake day-to-day tools (import-graph, structural module-check, package-roots) are a **different job**. Freestanding product C emit (`just build`) is a product speed story. Lake does not emit that wire. This report does **not** claim Slake is faster than Lake on unlike jobs.

## How to re-run

```bash
just bench-same-job
just bench
# contract: just bench-same-job-contract
```

`just bench-same-job` writes sibling `doc/BENCH-SAME-JOB-latest.md` and does not overwrite this suite file.

## Machine

| Item | Value |
|------|-------|
| Hostname | horizon |
| uname -srm | Linux 7.1.8-zen1-3-zen x86_64 |
| nproc | 16 |
| lake --version | Lake version 5.0.0-src+8c9756b (Lean version 4.32.0) |
| lean --version | Lean (version 4.32.0, x86_64-unknown-linux-gnu, commit 8c9756b28d64dab099da31a4c09229a9e6a2ef35, Release) |

## Lake passes this recipe

Same-job recipe `just bench-same-job` on 2026-08-13. Idle-hot second pass is the Lake arm number above.

| Pass | Exit | real (s) | user (s) | sys (s) |
|------|------|----------|----------|---------|
| first | ok | 29.613 | 50.025 | 0.938 |
| second (idle hot) | ok | 0.447 | 0.304 | 0.129 |

## Related compile-path times (different jobs)

Last full suite stamp **2026-08-10 22:35:44 UTC**. These are **not** Lake-versus-Slake on host package elaborate. A later `just bench` will refresh these rows.

Times are outer `just bench-*` invocations (bash TIMEFORMAT real/user/sys).

### Arm A -- Systems Lean product path

| Scenario | Exit | real (s) | user (s) | sys (s) |
|----------|------|----------|----------|---------|
| hot freestanding | ok | 0.142 | 0.086 | 0.040 |
| without-Lake host | ok | 2.107 | 1.465 | 0.543 |
| cold freestanding | ok | 0.295 | 0.134 | 0.094 |

### Arm B -- classic Lean 4 + Lake (last full suite)

These B-hot rows are the 2026-08-10 suite. They are related times, not the Same named job Lake cell (that cell is idle-hot 0.447 s from 2026-08-13).

| Scenario | Exit | real (s) | user (s) | sys (s) |
|----------|------|----------|----------|---------|
| B-hot first pass | ok | 1.202 | 0.289 | 0.340 |
| B-hot second pass | ok | 0.412 | 0.250 | 0.123 |

### Seal (related)

| Scenario | Exit | real (s) | user (s) | sys (s) |
|----------|------|----------|----------|---------|
| CompCert matrix | ok | 109.050 | 5.405 | 14.764 |

## Skipped

- `just bench-lake-host-cold` (destructive long wipe of `src/systems/.lake`; run separately)

## Output honesty

### Arm A output -- freestanding product wire

Freestanding is **runtimeless product C** (no garbage collection, no Lean managed runtime on the wire). It is **not** classic Lean ahead-of-time managed-runtime C under `.lake`. Lake does not emit that wire.

| Bytes | Path |
|------:|------|
| 31742 | `src/systems/emit/slake_freestanding.c` |
| 31118 | `src/systems/emit/slake_freestanding.h` |
| 31742 | `out/freestanding-c/slake_freestanding.c` |
| 31118 | `out/freestanding-c/slake_freestanding.h` |

### Arm B output -- host build tree

Lake elaborates host Lean under `src/systems`. Output is the host build tree (`src/systems/.lake`), **not** `out/freestanding-c`.

## Interpretation

- Freestanding emit and Lake host elaborate are **different jobs**. This suite records both. It does not compute a B/A winner or multiplier across them.
- **B-hot first pass** real 1.202 s vs **B-hot second pass** real 0.412 s (2026-08-10 suite). Second pass is the true idle hot package probe when the first pass already Built the package.
- **A-cold real** 0.295 s vs **A-hot real** 0.142 s (cold/hot = 2.08). Cold trashes generated wire then rebuilds; hot assumes writers already present.
- **Without-Lake host total real** 2.107 s is the day-to-day **develop surface** cost (import-graph + module-check + package-roots). It is **not** full elaborator parity.
- **Linear freestanding matter:** the product is garbage-collection-free freestanding C. Compile wall-clock does **not** prove runtime fastest C.

## Detail: without-Lake nested times

| Host recipe header | Nested time line |
|--------------------|------------------|
| `-- host-import-graph-without-lake --` | `real 0.470 user 0.298 sys 0.060` |
| `-- host-module-check-without-lake --` | `real 1.589 user 1.143 sys 0.464` |
| `-- host-package-roots-without-lake --` | `real 0.036 user 0.016 sys 0.016` |

## Non-claims

- No "provably fastest C" claim. Wall-clock compile path comparison only.
- **PROVABLY** is a CompCert product seal, **not** a speed claim. CompCert matrix times wall-clock when ccomp is present; it does not prove runtime fastest C.
- **FullHostElaborateRemains** stays **false**. Without-Lake host tools are **not** full elaborator parity.
- Freestanding product C is **not** classic Lean managed-runtime AOT C, and freestanding is **not** the same job as Lake host elaborate. Lake does not emit that wire.
- This report does **not** claim Slake is faster than Lake unless both arms ran the same named job. Slake cannot do host package elaborate yet.
- free / complete / PROVABLY are **not** flipped by these benches (living residual owns claims).
- Mult SSA lower **partial** is **not** a full LLVM backend.
- Cold full Lake wall-clock is **not** re-measured in this default suite (use `just bench-lake-host-cold`).
- Arm B **second pass** is the preferred idle hot probe; first pass may still rebuild.

## Paths

| What | Path |
|------|------|
| This report | `doc/BENCH-latest.md` |
| Same-job sibling | `doc/BENCH-SAME-JOB-latest.md` |
| Full transcript (same-job) | `/tmp/systems-lean-bench-same-job-20260813T162857Z.log` |
| Research note | `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` |
| Recipes | `just/bench.just` |

## Overall exit

**ok** (Lake arm timed; Slake cannot do this job yet)
