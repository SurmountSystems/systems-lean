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

## Closed set leftover (Slake typechecks src/systems), addendum 2026-09-20

This addendum does **not** replace the full-package suite above. Idle-hot **0.459 s** (this file, **horizon**, 2026-08-13), suite idle-hot **0.447 s**, and suite first pass **29.613 s** stay the full-package job. They are **not** this leftover. Do not treat closed-set idle-hot **0.92 s** as those full-package cells.

**Closed set:** product modules Mult, Types, Erasure, Extract, IrProgram (already live-parse GREEN). Named Lake targets: `SystemsLean.Mult`, `SystemsLean.Types`, `SystemsLean.Erasure`, `SystemsLean.Extract`, `SystemsLean.IrProgram`.

**How much faster or slower:** not comparable, because Slake cannot run this closed-set typecheck as the compiler yet. Do not say which arm is faster. The first ELF dest `out/slake-produced-elf/slake-hello` is clang-linked generator SSA, not Slake compiling Slake.

| Arm | Result |
|-----|--------|
| **Closed-set Lake** | Measured on **surmount-1**, tree `/home/nixbuilder/iso/src/systems`, niced `nice -n 19`, `LEAN_NUM_THREADS=16`. First pass EXIT 0, wall **2.60 s**, Max RSS **811360 KiB** (about 0.77 GiB). Idle-hot second pass EXIT 0, wall **0.92 s**, Max RSS **803528 KiB**. RSS is mill-class, not OccupancyProbe. Log `/tmp/systems-lean-bench-closed-set-20260920T033252Z.log`. Coordinator report `/home/hunter/.agents/reports/grok-impl-summary-lake-coord-closed-set-bench.md`. This is **not** `just bench-same-job`. Full-package idle-hot **0.459 s** on **horizon** 2026-08-13 is a different job. |
| **Closed-set Slake** | Slake cannot typecheck this closed set as the compiler yet. No Slake wall-clock for this job. Do not invent one. |

### Closed-set Lake passes (surmount-1, 2026-09-20)

| Pass | Exit | real (s) | Max RSS (KiB) |
|------|------|----------|---------------|
| first | 0 | 2.60 | 811360 |
| second (idle hot) | 0 | 0.92 | 803528 |

**FullHost** stays **false**. **slakeOwnsPackageTypecheck** stays **false**. Occupancy stays 49. Mill stays 69 of 69. Do not claim Lake-gone. OccupancyProbe was not run for this sample.

## Non-claims

- No "provably fastest C" claim.
- **PROVABLY** is a CompCert product seal, **not** a speed claim.
- **FullHostElaborateRemains** stays **false**.
- Lake does not emit that wire (freestanding product C).
- free / complete / PROVABLY are **not** flipped by these benches.
- The 2026-09-20 closed-set addendum does **not** overwrite the 2026-08-13 full-package **0.459 s** / **0.447 s** / **29.613 s** cells. Closed-set Lake is measured on surmount-1. Closed-set Slake has no wall-clock. How much faster: not comparable.

## Paths

| What | Path |
|------|------|
| This report | `doc/BENCH-SAME-JOB-latest.md` |
| Suite living report | `doc/BENCH-latest.md` (`just bench` owns it) |
| Full transcript | `/tmp/systems-lean-bench-same-job-20260813T164543Z.log` |
| Research note | `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` |
| Recipes | `just/bench.just` |
| Closed-set Lake queue | `/home/hunter/.agents/reports/lake-queue-closed-set-bench.md` |
| Closed-set Lake log | `/tmp/systems-lean-bench-closed-set-20260920T033252Z.log` |
| Closed-set Lake coordinator report | `/home/hunter/.agents/reports/grok-impl-summary-lake-coord-closed-set-bench.md` |

## Overall exit

**ok** (Lake arm timed; Slake cannot do this job yet)

