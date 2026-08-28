stamp: 20260812T181558Z
source_metrics: doc/BENCH-RUNTIME-metrics.tsv
source_report: doc/BENCH-RUNTIME-latest.md
tip_baseline: doc/BENCH-RUNTIME-baseline.tsv

Living latest and metrics still overwrite on each just bench-runtime.
This directory is a durable snapshot of medians at stamp time.

Refresh:
  just bench-runtime
  just bench-runtime-snapshot

Not part of default just check. Optional for T6 regression later.
