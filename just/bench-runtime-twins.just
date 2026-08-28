# Modular just: just/bench-runtime-twins.just -- protocol twins + flag honesty.
# Kind: measurement process glue. Not residual invent. Not claim flips.
# Smoke-only C twins (not product wire). Shared N/CFLAGS from bench-runtime.just.
# Greppable: bench-runtime-stack-twin, bench-runtime-stack-twin-generated,
# bench-runtime-stack-twin-hand,
# bench-runtime-fail-closed-shape, bench-runtime-fail-closed-shape-generated,
# bench-runtime-fail-closed-shape-hand,
# bench-runtime-twin-contract, bench-runtime-flag-matrix-honesty,
# bench-runtime-compose-isolate-contract, bench-runtime-compose-isolate,
# bench-runtime-freestanding-compose-reset, isolate_ns_per_op_well_typed,
# R-stack-twin, fail_closed_shape, not_product_wire

# ---------------------------------------------------------------------------
# TDD contract: suite/report must name stack twin + fail_closed_shape + flags.
# Run first (red: missing twins / labels). Then add arms. Do not weaken.
# ---------------------------------------------------------------------------
bench-runtime-twin-contract:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    fail=0
    stack="$root/src/systems/smoke/slake_runtime_bench_stack_twin.c"
    shape="$root/src/systems/smoke/slake_runtime_bench_fail_closed_shape.c"
    report="$root/doc/BENCH-RUNTIME-latest.md"
    just_twins="$root/just/bench-runtime-twins.just"
    just_rt="$root/just/bench-runtime.just"
    just_rep="$root/just/bench-runtime-report.just"
    echo "== bench-runtime-twin-contract (suite/report labels) =="
    if [[ ! -f "$stack" ]]; then
      echo "FAIL: missing $stack" >&2
      fail=1
    else
      if ! grep -q 'arm=R-stack-twin' "$stack"; then
        echo "FAIL: $stack must print arm=R-stack-twin" >&2
        fail=1
      fi
      if ! grep -Eq 'not product wire|not_product_wire' "$stack"; then
        echo "FAIL: $stack must label not product wire" >&2
        fail=1
      fi
      if grep -Eq '#include[[:space:]]*[<"]slake_freestanding\.h[>"]' "$stack"; then
        echo "FAIL: $stack must not include product header" >&2
        fail=1
      fi
      if grep -Eq '(^|[^[:alnum:]_])(malloc|calloc|realloc|free)[[:space:]]*\(' "$stack"; then
        echo "FAIL: $stack must not malloc (stack live-flag only)" >&2
        fail=1
      fi
    fi
    if [[ ! -f "$shape" ]]; then
      echo "FAIL: missing $shape" >&2
      fail=1
    else
      if ! grep -q 'fail_closed_shape' "$shape"; then
        echo "FAIL: $shape must label fail_closed_shape" >&2
        fail=1
      fi
      if ! grep -Eq 'not product wire|not_product_wire' "$shape"; then
        echo "FAIL: $shape must label not product wire" >&2
        fail=1
      fi
      if grep -Eq '#include[[:space:]]*[<"]slake_freestanding\.h[>"]' "$shape"; then
        echo "FAIL: $shape must not include product header" >&2
        fail=1
      fi
      if grep -q 'arm=R-gc-shape-compose' "$shape"; then
        echo "FAIL: $shape must not reuse heap_churn arm name" >&2
        fail=1
      fi
    fi
    if ! grep -q '^bench-runtime-stack-twin:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-stack-twin" >&2
      fail=1
    fi
    if ! grep -q '^bench-runtime-stack-twin-generated:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-stack-twin-generated" >&2
      fail=1
    fi
    if ! grep -q '^bench-runtime-stack-twin-hand:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-stack-twin-hand" >&2
      fail=1
    fi
    lean_twin="$root/src/systems/SystemsLean/RuntimeBenchStackTwin.lean"
    if [[ ! -f "$lean_twin" ]]; then
      echo "FAIL: missing $lean_twin" >&2
      fail=1
    else
      if ! grep -q 'stackTwinProtocolOk_true' "$lean_twin"; then
        echo "FAIL: $lean_twin must name stackTwinProtocolOk_true" >&2
        fail=1
      fi
      if ! grep -q 'remint_after_spent' "$lean_twin"; then
        echo "FAIL: $lean_twin must name remint_after_spent" >&2
        fail=1
      fi
      if ! grep -F -q 'malloc(' "$lean_twin"; then
        echo "FAIL: $lean_twin must name malloc( as a forbidden token" >&2
        fail=1
      fi
      if ! grep -q 'slake_' "$lean_twin"; then
        echo "FAIL: $lean_twin must name slake_ as a forbidden stem" >&2
        fail=1
      fi
    fi
    if ! grep -q '^bench-runtime-fail-closed-shape:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-fail-closed-shape" >&2
      fail=1
    fi
    if ! grep -q '^bench-runtime-fail-closed-shape-generated:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-fail-closed-shape-generated" >&2
      fail=1
    fi
    if ! grep -q '^bench-runtime-fail-closed-shape-hand:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-fail-closed-shape-hand" >&2
      fail=1
    fi
    lean_shape="$root/src/systems/SystemsLean/RuntimeBenchFailClosedShape.lean"
    if [[ ! -f "$lean_shape" ]]; then
      echo "FAIL: missing $lean_shape" >&2
      fail=1
    else
      if ! grep -q 'failClosedShapeProtocolOk_true' "$lean_shape"; then
        echo "FAIL: $lean_shape must name failClosedShapeProtocolOk_true" >&2
        fail=1
      fi
      if ! grep -q 'extract_shape' "$lean_shape"; then
        echo "FAIL: $lean_shape must name extract_shape (extract not skipped)" >&2
        fail=1
      fi
      if ! grep -F -q 'malloc(' "$lean_shape"; then
        echo "FAIL: $lean_shape must name malloc( as a forbidden token" >&2
        fail=1
      fi
      if ! grep -q 'slake_' "$lean_shape"; then
        echo "FAIL: $lean_shape must name slake_ as a forbidden stem" >&2
        fail=1
      fi
    fi
    if ! grep -q '^bench-runtime-flag-matrix-honesty:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-flag-matrix-honesty" >&2
      fail=1
    fi
    if [[ ! -f "$report" ]]; then
      echo "FAIL: missing living report $report" >&2
      fail=1
    else
      if ! grep -Eq 'R-stack-twin|stack twin|stack live-flag' "$report"; then
        echo "FAIL: living report must show mint vs stack twin" >&2
        fail=1
      fi
      if ! grep -Eq 'heap_churn|R-gc-shape' "$report"; then
        echo "FAIL: living report must still show mint vs heap" >&2
        fail=1
      fi
      if ! grep -q 'fail_closed_shape' "$report"; then
        echo "FAIL: living report must publish vs fail_closed_shape" >&2
        fail=1
      fi
      if ! grep -q -- '-O3 -flto' "$report"; then
        echo "FAIL: living report must name timing-link -O3 -flto" >&2
        fail=1
      fi
      if ! grep -Eq -- '-O3' "$report"; then
        echo "FAIL: living report must name -O3 contrast" >&2
        fail=1
      fi
      if ! grep -Eq 'not product wire|not_product_wire' "$report"; then
        echo "FAIL: living report must label twins not product wire" >&2
        fail=1
      fi
    fi
    if ! grep -q -- '-O2 -ffreestanding -nostdlib' "$just_rt"; then
      echo "FAIL: structural -c must stay -O2 -ffreestanding -nostdlib" >&2
      fail=1
    fi
    if grep -q 'BENCH_RUNTIME_CFLAGS' "$just_rt" | head -n0; then
      true
    fi
    # Suite must invoke the new arms (not only document them).
    if ! grep -q 'bench-runtime-stack-twin' "$just_rep"; then
      echo "FAIL: suite must run bench-runtime-stack-twin" >&2
      fail=1
    fi
    if ! grep -q 'bench-runtime-fail-closed-shape' "$just_rep"; then
      echo "FAIL: suite must run bench-runtime-fail-closed-shape" >&2
      fail=1
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "bench-runtime-twin-contract: FAIL" >&2
      exit 1
    fi
    echo "bench-runtime-twin-contract: ok"
    echo "status=ok"

# ---------------------------------------------------------------------------
# Living stack live-flag twin: Lean writes out/runtime-bench/stack_twin.c,
# then this recipe compiles that driver (C stopwatch). Hand file stays.
# Soft-skip no lake / no cc. Greppable: bench-runtime-stack-twin, R-stack-twin
# ---------------------------------------------------------------------------
bench-runtime-stack-twin:
    #!/usr/bin/env bash
    set -euo pipefail
    n="{{_bench_rt_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    drv=out/runtime-bench/stack_twin.c
    work="${TMPDIR:-/tmp}/slake-rt-stack-twin-$$"
    mkdir -p "$work"
    echo "== bench-runtime-stack-twin (Lean-owned R-stack-twin) =="
    echo "N=$n measured_runs=$runs"
    echo "timing_link_cflags=$tcflags"
    echo "honesty=not_product_wire (generated stack automaton; not emit/out product)"
    if ! command -v lake >/dev/null 2>&1; then
      echo "skip: no lake on PATH"
      echo "status=skip_no_lake"
      rm -rf "$work"
      exit 0
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      rm -rf "$work"
      exit 0
    fi
    echo "-- lake write generated stack twin --"
    set +e
    (cd src/systems && lake exe slake-runtime-bench-stack-twin -- ../..)
    write_st=$?
    set -e
    if [[ $write_st -ne 0 ]]; then
      echo "error: lake write generated stack twin failed" >&2
      rm -rf "$work"
      exit 1
    fi
    if [[ ! -f "$drv" ]]; then
      echo "error: missing generated $drv" >&2
      rm -rf "$work"
      exit 1
    fi
    bin="$work/r-stack-twin"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link R-stack-twin failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- R-stack-twin outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-stack-twin measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-stack-twin: done"
    rm -rf "$work"

# Alias: same living generated path. Kept so the generated name still works.
# Greppable: bench-runtime-stack-twin-generated, RuntimeBenchStackTwin
bench-runtime-stack-twin-generated:
    just bench-runtime-stack-twin

# Hand smoke compile path (kept; not the living suite arm).
# Greppable: bench-runtime-stack-twin-hand
bench-runtime-stack-twin-hand:
    #!/usr/bin/env bash
    set -euo pipefail
    drv=src/systems/smoke/slake_runtime_bench_stack_twin.c
    n="{{_bench_rt_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-stack-twin-hand-$$"
    mkdir -p "$work"
    echo "== bench-runtime-stack-twin-hand (hand smoke; not living arm) =="
    echo "N=$n measured_runs=$runs"
    echo "timing_link_cflags=$tcflags"
    echo "honesty=not_product_wire (hand stack automaton; not emit/out)"
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    bin="$work/r-stack-twin-hand"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link hand R-stack-twin failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- hand R-stack-twin outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- hand R-stack-twin measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-stack-twin-hand: done"
    rm -rf "$work"

# ---------------------------------------------------------------------------
# Living fail-closed-shape twin: Lean writes out/runtime-bench/fail_closed_shape.c,
# then this recipe compiles that driver (C stopwatch). Hand file stays.
# Soft-skip no lake / no cc. Greppable: bench-runtime-fail-closed-shape,
# R-fail-closed-shape, fail_closed_shape, not_product_wire
# ---------------------------------------------------------------------------
bench-runtime-fail-closed-shape:
    #!/usr/bin/env bash
    set -euo pipefail
    n="{{_bench_rt_compose_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    drv=out/runtime-bench/fail_closed_shape.c
    work="${TMPDIR:-/tmp}/slake-rt-fail-closed-$$"
    mkdir -p "$work"
    echo "== bench-runtime-fail-closed-shape (Lean-owned R-fail-closed-shape) =="
    echo "N=$n measured_runs=$runs job_class=compose"
    echo "timing_link_cflags=$tcflags"
    echo "honesty=fail_closed_shape not_product_wire (generated; not heap_churn)"
    if ! command -v lake >/dev/null 2>&1; then
      echo "skip: no lake on PATH"
      echo "status=skip_no_lake"
      rm -rf "$work"
      exit 0
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      rm -rf "$work"
      exit 0
    fi
    echo "-- lake write generated fail-closed-shape twin --"
    set +e
    (cd src/systems && lake exe slake-runtime-bench-fail-closed-shape -- ../..)
    write_st=$?
    set -e
    if [[ $write_st -ne 0 ]]; then
      echo "error: lake write generated fail-closed-shape twin failed" >&2
      rm -rf "$work"
      exit 1
    fi
    if [[ ! -f "$drv" ]]; then
      echo "error: missing generated $drv" >&2
      rm -rf "$work"
      exit 1
    fi
    bin="$work/r-fail-closed-shape"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link R-fail-closed-shape failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- R-fail-closed-shape outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-fail-closed-shape measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-fail-closed-shape: done"
    rm -rf "$work"

# Alias: same living generated path. Kept so the generated name still works.
# Greppable: bench-runtime-fail-closed-shape-generated, RuntimeBenchFailClosedShape
bench-runtime-fail-closed-shape-generated:
    just bench-runtime-fail-closed-shape

# Hand smoke compile path (kept; not the living suite arm).
# Greppable: bench-runtime-fail-closed-shape-hand
bench-runtime-fail-closed-shape-hand:
    #!/usr/bin/env bash
    set -euo pipefail
    drv=src/systems/smoke/slake_runtime_bench_fail_closed_shape.c
    n="{{_bench_rt_compose_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-fail-closed-hand-$$"
    mkdir -p "$work"
    echo "== bench-runtime-fail-closed-shape-hand (hand smoke; not living arm) =="
    echo "N=$n measured_runs=$runs job_class=compose"
    echo "timing_link_cflags=$tcflags"
    echo "honesty=fail_closed_shape not_product_wire (hand; not heap_churn)"
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    bin="$work/r-fail-closed-shape-hand"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link hand R-fail-closed-shape failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- hand R-fail-closed-shape outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- hand R-fail-closed-shape measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-fail-closed-shape-hand: done"
    rm -rf "$work"

# ---------------------------------------------------------------------------
# Flag-matrix honesty: mint + compose cells for -O3 and -O3 -flto.
# Timing link only. Structural freestanding-first -c stays fixed.
# Does not change just build / probe compile. LTO cell soft-skips on link fail.
# Greppable: bench-runtime-flag-matrix-honesty, BENCH_RUNTIME_CFLAGS
# Research: doc/dev/research/runtime-flag-matrix-2026-08-12.md
# Calibrate: BENCH_RUNTIME_FLAG_MATRIX_N=20000000
#            BENCH_RUNTIME_FLAG_MATRIX_COMPOSE_N=2000000
#            BENCH_RUNTIME_FLAG_MATRIX_RUNS=2
# ---------------------------------------------------------------------------
bench-runtime-flag-matrix-honesty:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    n="${BENCH_RUNTIME_FLAG_MATRIX_N:-20000000}"
    cn="${BENCH_RUNTIME_FLAG_MATRIX_COMPOSE_N:-2000000}"
    runs="${BENCH_RUNTIME_FLAG_MATRIX_RUNS:-2}"
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    hist_dir="$root/doc/bench-history"
    mkdir -p "$hist_dir"
    tsv="$hist_dir/flag-matrix-honesty-latest.tsv"
    stamped_tsv="$hist_dir/flag-matrix-honesty-${stamp}.tsv"
    log="/tmp/systems-lean-bench-runtime-flag-matrix-honesty-${stamp}.log"
    note="$root/doc/dev/research/runtime-flag-matrix-2026-08-12.md"
    echo "== bench-runtime-flag-matrix-honesty (mint+compose -O3 and -O3 -flto) ==" | tee "$log"
    echo "N_mint=$n N_compose=$cn runs=$runs stamp=$stamp" | tee -a "$log"
    echo "structural freestanding-first -c stays fixed (-O2 -ffreestanding -nostdlib)" | tee -a "$log"
    echo "cells: -O3 and -O3 -flto (timing link only; not just build / probe)" | tee -a "$log"
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)" | tee -a "$log"
      echo "status=skip_no_cc"
      exit 0
    fi
    cells=("-O3" "-O3 -flto")
    {
      printf '%s\n' "stamp	flags	arm	exit	N	ns_median	ns_mean	ns_min	ns_max	status"
    } >"$tsv"
    scrape_cell() {
      local cap="$1"
      local stamp_v="$2"
      local flags="$3"
      local arm="$4"
      local n_v="$5"
      local st="$6"
      local ns_med="?" ns_mean="?" ns_min="?" ns_max="?"
      local status="ok"
      if [[ "$st" -ne 0 ]]; then
        if printf '%s' "$flags" | grep -Eq -- '-flto|-fuse-linker-plugin'; then
          echo "cell soft-skip: $arm flags=[$flags] exit=$st" | tee -a "$log"
          printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
            "$stamp_v" "$flags" "$arm" "fail" "$n_v" "?" "?" "?" "?" "skip_link_or_run" >>"$tsv"
          return 0
        fi
        echo "error: required cell $arm flags=[$flags] failed exit=$st" | tee -a "$log"
        return 1
      fi
      if grep -q 'status=skip_no_cc' "$cap" 2>/dev/null; then
        printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
          "$stamp_v" "$flags" "$arm" "skip" "$n_v" "?" "?" "?" "?" "skip_no_cc" >>"$tsv"
        return 0
      fi
      mapfile -t raw_ns < <(grep -oE 'ns_per_op=[0-9.eE+-]+' "$cap" | sed 's/ns_per_op=//' || true)
      if [[ ${#raw_ns[@]} -ge 1 ]]; then
        local use_ns
        if [[ ${#raw_ns[@]} -ge 2 ]]; then
          use_ns=("${raw_ns[@]:1}")
        else
          use_ns=("${raw_ns[@]}")
        fi
        mapfile -t sorted_ns < <(printf '%s\n' "${use_ns[@]}" | sort -n)
        local m=${#sorted_ns[@]}
        if [[ "$m" -ge 1 ]]; then
          ns_min="${sorted_ns[0]}"
          ns_max="${sorted_ns[$((m-1))]}"
          local sum=0 v
          for v in "${sorted_ns[@]}"; do
            sum=$(awk -v a="$sum" -v b="$v" 'BEGIN { printf "%.10f", a+b }')
          done
          ns_mean=$(awk -v s="$sum" -v n="$m" 'BEGIN { printf "%.4f", s/n }')
          local mid=$((m / 2))
          if (( m % 2 == 1 )); then
            ns_med=$(awk -v x="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", x+0 }')
          else
            ns_med=$(awk -v a="${sorted_ns[$((mid-1))]}" -v b="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", (a+b)/2 }')
          fi
          ns_min=$(awk -v x="$ns_min" 'BEGIN { printf "%.4f", x+0 }')
          ns_max=$(awk -v x="$ns_max" 'BEGIN { printf "%.4f", x+0 }')
        fi
      fi
      echo "cell ok $arm flags=[$flags] ns_median=$ns_med" | tee -a "$log"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp_v" "$flags" "$arm" "ok" "$n_v" "$ns_med" "$ns_mean" "$ns_min" "$ns_max" "$status" >>"$tsv"
      return 0
    }
    for flags in "${cells[@]}"; do
      echo | tee -a "$log"
      echo "-- cell flags=[$flags] --" | tee -a "$log"
      # Mint-class: product, heap, stack twin.
      for spec in "R-free:bench-runtime-freestanding:$n" \
                  "R-gc-shape:bench-runtime-gcshape:$n" \
                  "R-stack-twin:bench-runtime-stack-twin:$n" \
                  "R-free-compose:bench-runtime-freestanding-compose:$cn" \
                  "R-gc-shape-compose:bench-runtime-gcshape-compose:$cn" \
                  "R-fail-closed-shape:bench-runtime-fail-closed-shape:$cn"; do
        arm="${spec%%:*}"
        rest="${spec#*:}"
        recipe="${rest%%:*}"
        nn="${rest##*:}"
        cap=$(mktemp /tmp/slake-rt-flag-hon-XXXXXX.out)
        set +e
        BENCH_RUNTIME_CFLAGS="$flags" BENCH_RUNTIME_N="$n" \
          BENCH_RUNTIME_COMPOSE_N="$cn" BENCH_RUNTIME_RUNS="$runs" \
          BENCH_RUNTIME_STAGE_TIMERS=0 \
          just "$recipe" >"$cap" 2>&1
        st=$?
        set -e
        cat "$cap" >>"$log"
        if ! scrape_cell "$cap" "$stamp" "$flags" "$arm" "$nn" "$st"; then
          rm -f "$cap"
          exit 1
        fi
        rm -f "$cap"
      done
    done
    cp -a "$tsv" "$stamped_tsv"
    echo | tee -a "$log"
    echo "bench-runtime-flag-matrix-honesty: wrote $tsv" | tee -a "$log"
    echo "bench-runtime-flag-matrix-honesty: stamped $stamped_tsv" | tee -a "$log"
    echo "bench-runtime-flag-matrix-honesty: log $log" | tee -a "$log"
    echo "bench-runtime-flag-matrix-honesty: research $note" | tee -a "$log"
    echo "bench-runtime-flag-matrix-honesty: done"
    echo
    echo "Flag matrix honesty (mint + compose; timing link only):"
    column -t -s $'\t' "$tsv" 2>/dev/null || cat "$tsv"

# ---------------------------------------------------------------------------
# TDD contract: leftover isolate + reset-path honesty (Name 3 + Name 4).
# Red first: missing isolate keys / recipes. Green after driver + recipes.
# Do not weaken. Extract must stay on the primary cold arm.
# Greppable: bench-runtime-compose-isolate-contract, isolate_extract_skipped
# ---------------------------------------------------------------------------
bench-runtime-compose-isolate-contract:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    fail=0
    drv="$root/src/systems/smoke/slake_runtime_bench_freestanding_compose.c"
    just_twins="$root/just/bench-runtime-twins.just"
    just_rt="$root/just/bench-runtime.just"
    report="$root/doc/BENCH-RUNTIME-latest.md"
    echo "== bench-runtime-compose-isolate-contract (leftover isolate + reset) =="
    if [[ ! -f "$drv" ]]; then
      echo "FAIL: missing $drv" >&2
      fail=1
    else
      if ! grep -q 'isolate_ns_per_op_well_typed' "$drv"; then
        echo "FAIL: $drv must print isolate_ns_per_op_well_typed" >&2
        fail=1
      fi
      if ! grep -q 'isolate_ns_per_op_extract' "$drv"; then
        echo "FAIL: $drv must print isolate_ns_per_op_extract" >&2
        fail=1
      fi
      if ! grep -q 'isolate_ns_per_op_init' "$drv"; then
        echo "FAIL: $drv must print isolate_ns_per_op_init" >&2
        fail=1
      fi
      if ! grep -q 'isolate_extract_skipped=0' "$drv"; then
        echo "FAIL: $drv must print isolate_extract_skipped=0" >&2
        fail=1
      fi
      if ! grep -q 'slake_host_compose_extract' "$drv"; then
        echo "FAIL: $drv must still call slake_host_compose_extract" >&2
        fail=1
      fi
      if ! grep -q 'BENCH_RUNTIME_COMPOSE_RESET' "$drv"; then
        echo "FAIL: $drv must honor BENCH_RUNTIME_COMPOSE_RESET" >&2
        fail=1
      fi
      if ! grep -q 'well_typed_is_bench_only_not_product_Out' "$drv"; then
        echo "FAIL: $drv must label well_typed as bench-only (not product Out)" >&2
        fail=1
      fi
      # Default cold: empty/unset RESET must not enable reset.
      if ! grep -q 'cached = 0' "$drv"; then
        echo "FAIL: $drv reset path must default off (cached = 0)" >&2
        fail=1
      fi
    fi
    if ! grep -q '^bench-runtime-freestanding-compose-reset:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-freestanding-compose-reset" >&2
      fail=1
    else
      if ! grep -A20 '^bench-runtime-freestanding-compose-reset:' "$just_twins" | grep -q 'BENCH_RUNTIME_COMPOSE_RESET=1'; then
        echo "FAIL: reset recipe must set BENCH_RUNTIME_COMPOSE_RESET=1" >&2
        fail=1
      fi
      if ! grep -A20 '^bench-runtime-freestanding-compose-reset:' "$just_twins" | grep -Eq 'cold remains|default cold|cold is primary'; then
        echo "FAIL: reset recipe must say default cold stays primary" >&2
        fail=1
      fi
    fi
    if ! grep -q '^bench-runtime-compose-isolate:' "$just_twins"; then
      echo "FAIL: missing recipe bench-runtime-compose-isolate" >&2
      fail=1
    else
      if ! awk '/^bench-runtime-compose-isolate:/{p=1} p && /^bench-runtime-[a-z0-9-]+:/{if($0 !~ /^bench-runtime-compose-isolate:/) exit} p' "$just_twins" | grep -q 'bench-runtime-gcshape-compose'; then
        echo "FAIL: isolate recipe must rebench vs heap (gcshape-compose)" >&2
        fail=1
      fi
      if ! awk '/^bench-runtime-compose-isolate:/{p=1} p && /^bench-runtime-[a-z0-9-]+:/{if($0 !~ /^bench-runtime-compose-isolate:/) exit} p' "$just_twins" | grep -q 'bench-runtime-fail-closed-shape'; then
        echo "FAIL: isolate recipe must rebench vs fail_closed_shape" >&2
        fail=1
      fi
      if ! awk '/^bench-runtime-compose-isolate:/{p=1} p && /^bench-runtime-[a-z0-9-]+:/{if($0 !~ /^bench-runtime-compose-isolate:/) exit} p' "$just_twins" | grep -q 'bench-runtime-freestanding-compose-reset'; then
        echo "FAIL: isolate recipe must measure reset vs default cold" >&2
        fail=1
      fi
    fi
    if ! grep -q -- '-O2 -ffreestanding -nostdlib' "$just_rt"; then
      echo "FAIL: structural -c must stay -O2 -ffreestanding -nostdlib" >&2
      fail=1
    fi
    if [[ -f "$report" ]]; then
      if grep -Eq 'compose beats heap|compose is faster than heap_churn' "$report"; then
        echo "FAIL: living report must not claim compose beats heap" >&2
        fail=1
      fi
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "bench-runtime-compose-isolate-contract: FAIL" >&2
      exit 1
    fi
    echo "bench-runtime-compose-isolate-contract: ok"
    echo "status=ok"

# ---------------------------------------------------------------------------
# E3 opt-in reset path vs default cold. Does not change default cold honesty.
# Greppable: bench-runtime-freestanding-compose-reset, BENCH_RUNTIME_COMPOSE_RESET
# ---------------------------------------------------------------------------
bench-runtime-freestanding-compose-reset:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-runtime-freestanding-compose-reset (E3 opt-in reset) =="
    echo "compose_init_mode=reset (count-only re-init after first full init)"
    echo "honesty: reset is optional compare; cold is primary product-shape"
    echo "default suite arm remains cold (BENCH_RUNTIME_COMPOSE_RESET unset)"
    echo "extract still runs; default cold unchanged"
    export BENCH_RUNTIME_COMPOSE_RESET=1
    just bench-runtime-freestanding-compose

# ---------------------------------------------------------------------------
# Focused leftover isolate: cold compose vs heap vs fail_closed_shape vs reset.
# Writes doc/bench-history/compose-isolate-latest.tsv. Does not run mint suite.
# Does not overwrite living mint numbers. Extract stays on the cold arm.
# Greppable: bench-runtime-compose-isolate, isolate_ns_per_op_well_typed
# ---------------------------------------------------------------------------
bench-runtime-compose-isolate:
    #!/usr/bin/env bash
    set -euo pipefail
    # Arms: bench-runtime-gcshape-compose, bench-runtime-fail-closed-shape,
    # bench-runtime-freestanding-compose-reset (vs default cold).
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    hist="$root/doc/bench-history"
    mkdir -p "$hist"
    tsv="$hist/compose-isolate-latest.tsv"
    stamped="$hist/compose-isolate-${stamp}.tsv"
    log="/tmp/systems-lean-bench-runtime-compose-isolate-${stamp}.log"
    cn="{{_bench_rt_compose_n}}"
    echo "== bench-runtime-compose-isolate (leftover + reset vs heap/shape) ==" | tee "$log"
    echo "stamp=$stamp N_compose=$cn" | tee -a "$log"
    echo "honesty: default cold stays full init; extract not skipped" | tee -a "$log"
    echo "honesty: well_typed is bench-only (not product Out)" | tee -a "$log"
    just bench-runtime-compose-isolate-contract | tee -a "$log"
    {
      printf '%s\n' "stamp	arm	exit	N	ns_median	iso_well_typed	iso_extract	iso_init	iso_reset	note"
    } >"$tsv"
    scrape_iso() {
      local cap="$1"
      local arm="$2"
      local nn="$3"
      local st="$4"
      local note="$5"
      local ns_med="?" wt="?" ext="?" ini="?" rst="?"
      if [[ "$st" -ne 0 ]]; then
        echo "error: arm $arm exit=$st" | tee -a "$log"
        printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
          "$stamp" "$arm" "fail" "$nn" "?" "?" "?" "?" "?" "$note" >>"$tsv"
        return 1
      fi
      mapfile -t raw_ns < <(grep -oE 'ns_per_op=[0-9.eE+-]+' "$cap" | sed 's/ns_per_op=//' || true)
      if [[ ${#raw_ns[@]} -ge 1 ]]; then
        local use_ns
        if [[ ${#raw_ns[@]} -ge 2 ]]; then
          use_ns=("${raw_ns[@]:1}")
        else
          use_ns=("${raw_ns[@]}")
        fi
        mapfile -t sorted_ns < <(printf '%s\n' "${use_ns[@]}" | sort -n)
        local m=${#sorted_ns[@]}
        if [[ "$m" -ge 1 ]]; then
          local mid=$((m / 2))
          if (( m % 2 == 1 )); then
            ns_med=$(awk -v x="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", x+0 }')
          else
            ns_med=$(awk -v a="${sorted_ns[$((mid-1))]}" -v b="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", (a+b)/2 }')
          fi
        fi
      fi
      wt=$(grep -E '^isolate_ns_per_op_well_typed=' "$cap" | tail -n1 | sed 's/^isolate_ns_per_op_well_typed=//' || true)
      ext=$(grep -E '^isolate_ns_per_op_extract=' "$cap" | tail -n1 | sed 's/^isolate_ns_per_op_extract=//' || true)
      ini=$(grep -E '^isolate_ns_per_op_init=' "$cap" | tail -n1 | sed 's/^isolate_ns_per_op_init=//' || true)
      rst=$(grep -E '^isolate_ns_per_op_reset=' "$cap" | tail -n1 | sed 's/^isolate_ns_per_op_reset=//' || true)
      [[ -z "$wt" ]] && wt="?"
      [[ -z "$ext" ]] && ext="?"
      [[ -z "$ini" ]] && ini="?"
      [[ -z "$rst" ]] && rst="?"
      echo "arm=$arm ns_median=$ns_med wt=$wt extract=$ext init=$ini reset=$rst" | tee -a "$log"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "$arm" "ok" "$nn" "$ns_med" "$wt" "$ext" "$ini" "$rst" "$note" >>"$tsv"
      return 0
    }
    unset BENCH_RUNTIME_COMPOSE_RESET || true
    cap=$(mktemp /tmp/slake-rt-iso-XXXXXX.out)
    set +e
    BENCH_RUNTIME_COMPOSE_RESET=0 just bench-runtime-freestanding-compose >"$cap" 2>&1
    st=$?
    set -e
    cat "$cap" >>"$log"
    scrape_iso "$cap" "R-free-compose-cold" "$cn" "$st" "default_cold extract_not_skipped"
    rm -f "$cap"
    cap=$(mktemp /tmp/slake-rt-iso-XXXXXX.out)
    set +e
    just bench-runtime-gcshape-compose >"$cap" 2>&1
    st=$?
    set -e
    cat "$cap" >>"$log"
    scrape_iso "$cap" "R-gc-shape-compose" "$cn" "$st" "heap_churn allocator"
    rm -f "$cap"
    cap=$(mktemp /tmp/slake-rt-iso-XXXXXX.out)
    set +e
    just bench-runtime-fail-closed-shape >"$cap" 2>&1
    st=$?
    set -e
    cat "$cap" >>"$log"
    scrape_iso "$cap" "R-fail-closed-shape" "$cn" "$st" "protocol_twin not_product_wire"
    rm -f "$cap"
    cap=$(mktemp /tmp/slake-rt-iso-XXXXXX.out)
    set +e
    just bench-runtime-freestanding-compose-reset >"$cap" 2>&1
    st=$?
    set -e
    cat "$cap" >>"$log"
    scrape_iso "$cap" "R-free-compose-reset" "$cn" "$st" "opt_in_reset not_default"
    rm -f "$cap"
    cp -a "$tsv" "$stamped"
    echo | tee -a "$log"
    echo "bench-runtime-compose-isolate: wrote $tsv" | tee -a "$log"
    echo "bench-runtime-compose-isolate: stamped $stamped" | tee -a "$log"
    echo "bench-runtime-compose-isolate: log $log" | tee -a "$log"
    echo "default cold unchanged; extract not skipped; do not claim compose beats heap" | tee -a "$log"
    echo
    echo "Compose leftover isolate (cold vs heap vs fail_closed_shape vs reset):"
    column -t -s $'\t' "$tsv" 2>/dev/null || cat "$tsv"
    echo "status=ok"
