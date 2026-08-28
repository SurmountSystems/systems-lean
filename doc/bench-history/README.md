# Runtime bench history

Stamped snapshots of freestanding runtime suite metrics.

| Path | Role |
|------|------|
| `doc/BENCH-RUNTIME-latest.md` | Living human report (overwrites each suite) |
| `doc/BENCH-RUNTIME-metrics.tsv` | Living arm medians TSV (overwrites each suite) |
| `doc/BENCH-RUNTIME-baseline.tsv` | Tip baseline (last snapshot) |
| `doc/bench-history/<stamp>/` | Durable copy of metrics (+ report when present) |
| `doc/bench-history/flag-matrix-*.tsv` | T3 flag matrix cells |

Refresh snapshot: `just bench-runtime && just bench-runtime-snapshot`.
Flag matrix: `just bench-runtime-flag-matrix`.
Regression vs tip baseline (T6, opt-in): `just bench-runtime-regress`
  (defaults `BENCH_RUNTIME_REGRESS_PCT=10`, mode fail; soft-skip no baseline).
  Default suite never hard-fails CI; use `BENCH_RUNTIME_REGRESS=1 just bench-runtime`
  only when you want the suite to invoke regress after metrics write.
Host perf (T7): `just bench-runtime-perf-mint` / `just bench-runtime-perf-compose`
  (soft-skip if no `perf`).
Compose micro hot path (T9): `just bench-runtime-freestanding-compose-micro`
  (cold remains primary product-shape in default suite).

Not gated by default `just check`. Speed is empirical; not PROVABLY.
Research: `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md`.
