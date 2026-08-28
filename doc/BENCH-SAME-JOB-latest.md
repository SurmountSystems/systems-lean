# Lake versus Slake -- same named job

Generated: **2026-08-13 16:45:43 UTC**

Kind: wall-clock **same named job** on the compile-path develop-step. Not a residual claim flip. Not a token microbench.

## Same named job

**Named job:** host package elaborate under `src/systems` (hot `lake build` when the package is already Built). This is the compile-path develop-step Lake actually runs for day-to-day host work.

| Arm | Result |
|-----|--------|
| **Lake** | 0.459 s real (user 0.304, sys 0.139; hot second pass; `just bench-lake-host`) |
| **Slake** | Slake cannot do this job yet: full host package elaborate. Missing classic Lean elaborator parity. `FullHostElaborateRemains` stays false. |

Slake day-to-day tools (import-graph, structural module-check, package-roots) are a **different job**. Freestanding product C emit (`just build`) is a product speed story. Lake does not emit that wire. This report does **not** claim Slake is faster than Lake on unlike jobs.

## How to re-run

```bash
just bench-same-job
just bench
# contract: just bench-same-job-contract
```

## Machine

| Item | Value |
|------|-------|
| Hostname | horizon |
| uname -srm | Linux 7.1.8-zen1-3-zen x86_64 |
| nproc | 16 |
| lake --version | Lake version 5.0.0-src+8c9756b (Lean version 4.32.0) |
| lean --version | Lean (version 4.32.0, x86_64-unknown-linux-gnu, commit 8c9756b28d64dab099da31a4c09229a9e6a2ef35, Release) |

## Lake passes this recipe

| Pass | Exit | real (s) | user (s) | sys (s) |
|------|------|----------|----------|---------|
| first | ok | 0.459 | 0.295 | 0.147 |
| second (idle hot) | ok | 0.459 | 0.304 | 0.139 |

## Related different jobs (not this comparison)

A full `just bench` still times freestanding emit, without-Lake host tools, and CompCert. Those are **not** Lake-versus-Slake on host package elaborate. Runtime freestanding C is a product speed story (`just bench-runtime`).

## Non-claims

- No "provably fastest C" claim.
- **PROVABLY** is a CompCert product seal, **not** a speed claim.
- **FullHostElaborateRemains** stays **false**.
- Lake does not emit that wire (freestanding product C).
- free / complete / PROVABLY are **not** flipped by these benches.

## Paths

| What | Path |
|------|------|
| This report | `doc/BENCH-SAME-JOB-latest.md` |
| Suite living report | `doc/BENCH-latest.md` (`just bench` owns it) |
| Full transcript | `/tmp/systems-lean-bench-same-job-20260813T164543Z.log` |
| Research note | `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` |
| Recipes | `just/bench.just` |

## Overall exit

**ok** (Lake arm timed; Slake cannot do this job yet)

