# Modular just: just/bench-runtime.just -- runtime freestanding vs GC baselines.
# Kind: measurement process glue. Not residual invent. Not claim flips.
# Answers operator question: linear types / no GC / no runtime libs / fastest C.
# Primary: just bench-runtime -> doc/BENCH-RUNTIME-latest.md
# Secondary compile path: just bench / doc/BENCH-latest.md (different question).
# Drivers: src/systems/smoke/slake_runtime_bench_{freestanding,gcshape,
#   stack_twin,freestanding_compose,gcshape_compose,fail_closed_shape,boehm}.c
# Protocol twins: just/bench-runtime-twins.just (not product wire).
# Lean arm: SystemsLean.RuntimeBenchLean / lake exe slake-runtime-bench-lean
# Soft skip if no cc (exit 0). Boehm soft-skip if no gc.h/libgc.
# Lean soft-skip skip_no_lake / skip_lean_build. Note: no backtick chars.
# Greppable: bench-runtime, bench-runtime-freestanding, bench-runtime-gcshape,
# bench-runtime-freestanding-compose, bench-runtime-gcshape-compose,
# bench-runtime-boehm, bench-runtime-lean, BENCH-RUNTIME, R-free, R-gc-shape,
# R-boehm, R-lean, compose, lean_managed_runtime, skip_no_lake

# Default N: mint/consume class ~0.5-2 s under -O2. Compose class is heavier.
# Lean N is smaller (managed RT slower); never merge ns/op across unlabeled N.
# Override: BENCH_RUNTIME_N=400000000 just bench-runtime
# Compose: BENCH_RUNTIME_COMPOSE_N=10000000 just bench-runtime
# Lean: BENCH_RUNTIME_LEAN_N=5000000 just bench-runtime
# Timing-link CFLAGS only (hosted link of driver+wire). Default -O3 -flto (E4 + LTO).
# Structural freestanding-first -c stays fixed (-O2 -ffreestanding -nostdlib).
# Override: BENCH_RUNTIME_CFLAGS="-O3" or "-O2" (no LTO) if link fails or for contrast.
# Matrix: just bench-runtime-flag-matrix (see doc/dev/research/runtime-flag-matrix-2026-08-12.md)
# T6 regress: just bench-runtime-regress (BENCH_RUNTIME_REGRESS_PCT=10; not default suite fail)
# T7 perf: just bench-runtime-perf-mint | bench-runtime-perf-compose (soft-skip no perf)
# T9 micro: BENCH_RUNTIME_COMPOSE_MICRO=1 or just bench-runtime-freestanding-compose-micro
# Research T6/T7/T9: doc/dev/research/runtime-regression-perf-micro-2026-08-12.md
# Greppable: BENCH_RUNTIME_CFLAGS, bench-runtime-flag-matrix, structural_gate,
# BENCH_RUNTIME_REGRESS, BENCH_RUNTIME_COMPOSE_MICRO, bench-runtime-perf
_bench_rt_n := env("BENCH_RUNTIME_N", "200000000")
_bench_rt_compose_n := env("BENCH_RUNTIME_COMPOSE_N", "10000000")
_bench_rt_lean_n := env("BENCH_RUNTIME_LEAN_N", "50000000")
_bench_rt_runs := env("BENCH_RUNTIME_RUNS", "3")
# E4 + Runtime LTO timing default (2026-08-12 Wave 4b): production-N fair mint
# freestanding median <= heap_churn under -O3 -flto on this host. Timing link only.
# Structural freestanding-first -c remains -O2 -ffreestanding -nostdlib (fixed).
# If LTO link fails on a host, override BENCH_RUNTIME_CFLAGS="-O3".
_bench_rt_cflags := env("BENCH_RUNTIME_CFLAGS", "-O3 -flto")
_bench_rt_timeformat := 'real %R user %U sys %S'

# ---------------------------------------------------------------------------
# Arm recipes (individual)
# ---------------------------------------------------------------------------

# Structural + freestanding mint/consume (v1). Greppable: bench-runtime-freestanding
bench-runtime-freestanding:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    out_c=out/freestanding-c/slake_freestanding.c
    drv=src/systems/smoke/slake_runtime_bench_freestanding.c
    n="{{_bench_rt_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-free-$$"
    mkdir -p "$work"
    echo "== bench-runtime-freestanding (R-free linear mint/consume) =="
    echo "N=$n measured_runs=$runs (plus 1 warmup inside driver + outer serial)"
    echo "timing_link_cflags=$tcflags (structural -c fixed; not BENCH_RUNTIME_CFLAGS)"
    if [[ ! -f "$emit_c" || ! -f "$emit_h" || ! -f "$out_c" ]]; then
      echo "wire missing; running just build"
      just build
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "error: emit product missing after build" >&2
      exit 1
    fi
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip; structural only not measured)"
      echo "status=skip_no_cc"
      exit 0
    fi
    inc=$(dirname "$emit_c")
    o="$work/slake_fs.o"
    mode=""
    # Structural freestanding-first -c: fixed flags (not timing-link CFLAGS).
    if cc -c -std=c11 -O2 -ffreestanding -nostdlib -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
      mode=ffreestanding-nostdlib
    elif cc -c -std=c11 -O2 -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
      mode=hosted-fallback
    fi
    if [[ -z "$mode" ]]; then
      echo "error: freestanding-first -c failed (need -ffreestanding -nostdlib or hosted fallback)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural freestanding-first compile: $mode"
    if [[ -f "$o" ]]; then
      echo "structural wire .o bytes: $(wc -c <"$o" | tr -d ' ')"
    fi
    bin="$work/r-free"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -I${inc} -o ${bin} ${drv} ${emit_c}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -I"$inc" -o "$bin" "$drv" "$emit_c"; then
      echo "error: link R-free failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    if command -v size >/dev/null 2>&1; then
      size "$bin" || true
    fi
    # T8 structural no-GC / no Lean RT gate (hard fail arm; soft-skip tools missing).
    gate_fail=0
    if command -v ldd >/dev/null 2>&1; then
      ldd_out=$(ldd "$bin" 2>/dev/null || true)
      echo "structural ldd:"
      printf '%s\n' "$ldd_out" | sed 's/^/  /'
      bad=$(printf '%s\n' "$ldd_out" | grep -Ei 'leanshared|libleanshared|libgc\.|boehm' || true)
      if [[ -n "$bad" ]]; then
        echo "error: structural_gate=fail_ldd arm=R-free" >&2
        echo "error: freestanding mint binary must not link Lean RT or GC; matched ldd lines:" >&2
        printf '%s\n' "$bad" | sed 's/^/  /' >&2
        echo "error: expected: no leanshared / libleanshared / libgc / boehm in ldd" >&2
        gate_fail=1
      else
        echo "structural no leanshared/libgc in ldd: ok"
        echo "structural_gate_ldd=pass"
      fi
    else
      echo "structural ldd: (tool missing; soft-skip gate step)"
      echo "structural_gate_ldd=skip_no_ldd"
    fi
    if command -v nm >/dev/null 2>&1; then
      nm_hits=$( { nm -D "$bin" 2>/dev/null || true; nm "$bin" 2>/dev/null || true; } | grep -Ei 'leanshared|GC_malloc|GC_free|GC_init|boehm' || true)
      if [[ -n "$nm_hits" ]]; then
        echo "error: structural_gate=fail_nm arm=R-free" >&2
        echo "error: freestanding mint nm saw Lean/GC symbols; sample:" >&2
        printf '%s\n' "$nm_hits" | head -n 20 | sed 's/^/  /' >&2
        echo "error: expected: no leanshared / GC_malloc / GC_free / GC_init / boehm symbols" >&2
        gate_fail=1
      else
        echo "structural nm no Lean/GC symbols: ok"
        echo "structural_gate_nm=pass"
      fi
    else
      echo "structural nm: (tool missing; soft-skip gate step)"
      echo "structural_gate_nm=skip_no_nm"
    fi
    if [[ "$gate_fail" -ne 0 ]]; then
      echo "error: structural_gate=fail arm=R-free (no-GC / no Lean RT honesty)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural_gate=pass arm=R-free"
    echo "-- R-free outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-free measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-freestanding: done"
    rm -rf "$work"

# GC-shaped heap churn baseline (malloc+free every op). Not Boehm, not Lean GC.
# Greppable: bench-runtime-gcshape
bench-runtime-gcshape:
    #!/usr/bin/env bash
    set -euo pipefail
    drv=src/systems/smoke/slake_runtime_bench_gcshape.c
    n="{{_bench_rt_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-gc-$$"
    mkdir -p "$work"
    echo "== bench-runtime-gcshape (R-gc-shape malloc/free churn) =="
    echo "N=$n measured_runs=$runs"
    echo "timing_link_cflags=$tcflags"
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    bin="$work/r-gcshape"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link R-gc-shape failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- R-gc-shape outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-gc-shape measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-gcshape: done"
    rm -rf "$work"

# Compose-class freestanding (host_compose push/mint/check/extract/consume).
# Stage timers (T1): driver separate pass default ON; BENCH_RUNTIME_STAGE_TIMERS=0 off;
# BENCH_RUNTIME_STAGE_N caps stage pass (default min(N,200000)). Smoke only.
# Greppable: bench-runtime-freestanding-compose, stage_ns_per_op, BENCH_RUNTIME_STAGE
bench-runtime-freestanding-compose:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    out_c=out/freestanding-c/slake_freestanding.c
    drv=src/systems/smoke/slake_runtime_bench_freestanding_compose.c
    n="{{_bench_rt_compose_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-free-compose-$$"
    mkdir -p "$work"
    echo "== bench-runtime-freestanding-compose (R-free-compose host_compose) =="
    echo "N=$n measured_runs=$runs job_class=compose"
    echo "timing_link_cflags=$tcflags (structural -c fixed; not BENCH_RUNTIME_CFLAGS)"
    if [[ ! -f "$emit_c" || ! -f "$emit_h" || ! -f "$out_c" ]]; then
      echo "wire missing; running just build"
      just build
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "error: emit product missing after build" >&2
      exit 1
    fi
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    inc=$(dirname "$emit_c")
    o="$work/slake_fs.o"
    mode=""
    # Structural freestanding-first -c: fixed flags (not timing-link CFLAGS).
    if cc -c -std=c11 -O2 -ffreestanding -nostdlib -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
      mode=ffreestanding-nostdlib
    elif cc -c -std=c11 -O2 -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
      mode=hosted-fallback
    fi
    if [[ -z "$mode" ]]; then
      echo "error: freestanding-first -c failed (need -ffreestanding -nostdlib or hosted fallback)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural freestanding-first compile: $mode"
    if [[ -f "$o" ]]; then
      echo "structural wire .o bytes: $(wc -c <"$o" | tr -d ' ')"
    fi
    bin="$work/r-free-compose"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -I${inc} -o ${bin} ${drv} ${emit_c}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -I"$inc" -o "$bin" "$drv" "$emit_c"; then
      echo "error: link R-free-compose failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    if command -v size >/dev/null 2>&1; then
      size "$bin" || true
    fi
    # T8 structural no-GC / no Lean RT gate (hard fail arm; soft-skip tools missing).
    gate_fail=0
    if command -v ldd >/dev/null 2>&1; then
      ldd_out=$(ldd "$bin" 2>/dev/null || true)
      echo "structural ldd:"
      printf '%s\n' "$ldd_out" | sed 's/^/  /'
      bad=$(printf '%s\n' "$ldd_out" | grep -Ei 'leanshared|libleanshared|libgc\.|boehm' || true)
      if [[ -n "$bad" ]]; then
        echo "error: structural_gate=fail_ldd arm=R-free-compose" >&2
        echo "error: freestanding compose binary must not link Lean RT or GC; matched ldd lines:" >&2
        printf '%s\n' "$bad" | sed 's/^/  /' >&2
        echo "error: expected: no leanshared / libleanshared / libgc / boehm in ldd" >&2
        gate_fail=1
      else
        echo "structural no leanshared/libgc in ldd: ok"
        echo "structural_gate_ldd=pass"
      fi
    else
      echo "structural ldd: (tool missing; soft-skip gate step)"
      echo "structural_gate_ldd=skip_no_ldd"
    fi
    if command -v nm >/dev/null 2>&1; then
      nm_hits=$( { nm -D "$bin" 2>/dev/null || true; nm "$bin" 2>/dev/null || true; } | grep -Ei 'leanshared|GC_malloc|GC_free|GC_init|boehm' || true)
      if [[ -n "$nm_hits" ]]; then
        echo "error: structural_gate=fail_nm arm=R-free-compose" >&2
        echo "error: freestanding compose nm saw Lean/GC symbols; sample:" >&2
        printf '%s\n' "$nm_hits" | head -n 20 | sed 's/^/  /' >&2
        echo "error: expected: no leanshared / GC_malloc / GC_free / GC_init / boehm symbols" >&2
        gate_fail=1
      else
        echo "structural nm no Lean/GC symbols: ok"
        echo "structural_gate_nm=pass"
      fi
    else
      echo "structural nm: (tool missing; soft-skip gate step)"
      echo "structural_gate_nm=skip_no_nm"
    fi
    if [[ "$gate_fail" -ne 0 ]]; then
      echo "error: structural_gate=fail arm=R-free-compose (no-GC / no Lean RT honesty)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural_gate=pass arm=R-free-compose"
    echo "-- R-free-compose outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-free-compose measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-freestanding-compose: done"
    rm -rf "$work"

# Compose-class GC-shaped heap churn. Greppable: bench-runtime-gcshape-compose
bench-runtime-gcshape-compose:
    #!/usr/bin/env bash
    set -euo pipefail
    drv=src/systems/smoke/slake_runtime_bench_gcshape_compose.c
    n="{{_bench_rt_compose_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-gc-compose-$$"
    mkdir -p "$work"
    echo "== bench-runtime-gcshape-compose (R-gc-shape-compose malloc node list) =="
    echo "N=$n measured_runs=$runs job_class=compose"
    echo "timing_link_cflags=$tcflags"
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    bin="$work/r-gcshape-compose"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} -o ${bin} ${drv}"
    echo "link line: $link_cmd"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -o "$bin" "$drv"; then
      echo "error: link R-gc-shape-compose failed (timing_link_cflags=$tcflags)" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    echo "-- R-gc-shape-compose outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-gc-shape-compose measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-gcshape-compose: done"
    rm -rf "$work"

# Real Boehm GC baseline (mint-class job matching v1). Soft-skip if no bdw-gc.
# Greppable: bench-runtime-boehm, skip_no_boehm
bench-runtime-boehm:
    #!/usr/bin/env bash
    set -euo pipefail
    drv=src/systems/smoke/slake_runtime_bench_boehm.c
    n="{{_bench_rt_n}}"
    runs="{{_bench_rt_runs}}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-boehm-$$"
    mkdir -p "$work"
    echo "== bench-runtime-boehm (R-boehm GC_MALLOC/GC_FREE) =="
    echo "N=$n measured_runs=$runs baseline=boehm_gc job_class=mint_consume"
    echo "timing_link_cflags=$tcflags"
    if [[ ! -f "$drv" ]]; then
      echo "error: missing $drv" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)"
      echo "status=skip_no_cc"
      exit 0
    fi
    # Soft-skip when Boehm headers / library missing.
    if [[ ! -f /usr/include/gc.h && ! -f /usr/local/include/gc.h ]]; then
      if ! echo '#include <gc.h>' | cc -E - >/dev/null 2>&1; then
        echo "skip: no gc.h (Boehm bdw-gc not installed)"
        echo "status=skip_no_boehm"
        rm -rf "$work"
        exit 0
      fi
    fi
    gc_cflags=""
    gc_libs="-lgc"
    if command -v pkg-config >/dev/null 2>&1 && pkg-config --exists bdw-gc 2>/dev/null; then
      gc_cflags=$(pkg-config --cflags bdw-gc 2>/dev/null || true)
      gc_libs=$(pkg-config --libs bdw-gc 2>/dev/null || echo "-lgc")
    fi
    bin="$work/r-boehm"
    # shellcheck disable=SC2086
    link_cmd="cc -std=c11 ${tcflags} ${gc_cflags} -o ${bin} ${drv} ${gc_libs}"
    echo "link line: $link_cmd"
    set +e
    # shellcheck disable=SC2086
    cc -std=c11 $tcflags $gc_cflags -o "$bin" "$drv" $gc_libs
    link_st=$?
    set -e
    if [[ $link_st -ne 0 ]]; then
      echo "skip: link with libgc failed (status=skip_no_boehm)"
      echo "status=skip_no_boehm"
      rm -rf "$work"
      exit 0
    fi
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    if command -v ldd >/dev/null 2>&1; then
      ldd_out=$(ldd "$bin" 2>/dev/null || true)
      echo "structural ldd:"
      printf '%s\n' "$ldd_out" | sed 's/^/  /'
      if printf '%s\n' "$ldd_out" | grep -Eiq 'libgc'; then
        echo "structural libgc present in ldd: ok (Boehm contrast)"
      else
        echo "warn: libgc not visible in ldd (static link or unusual layout)"
      fi
    else
      echo "structural ldd: (tool missing; skipped)"
    fi
    echo "-- R-boehm outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-boehm measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-boehm: done"
    rm -rf "$work"

# Classic Lean managed-runtime contrast (mint-class logical job). Soft-skip
# if no lake or warm build fails. Times process run only after untimed build.
# Greppable: bench-runtime-lean, skip_no_lake, skip_lean_build, R-lean
bench-runtime-lean:
    #!/usr/bin/env bash
    set -euo pipefail
    n="{{_bench_rt_lean_n}}"
    runs="{{_bench_rt_runs}}"
    echo "== bench-runtime-lean (R-lean managed runtime mint/consume) =="
    echo "N=$n measured_runs=$runs baseline=lean_managed_runtime job_class=mint_consume"
    echo "note: N separate from freestanding mint; do not merge ns/op without labels"
    if ! command -v lake >/dev/null 2>&1; then
      echo "skip: no lake on PATH"
      echo "status=skip_no_lake"
      exit 0
    fi
    echo "-- untimed warm lake build slake-runtime-bench-lean --"
    set +e
    (cd src/systems && lake build slake-runtime-bench-lean)
    build_st=$?
    set -e
    if [[ $build_st -ne 0 ]]; then
      echo "skip: lake build failed (status=skip_lean_build)"
      echo "status=skip_lean_build"
      exit 0
    fi
    bin="src/systems/.lake/build/bin/slake-runtime-bench-lean"
    if [[ ! -x "$bin" ]]; then
      bin=$(find src/systems/.lake/build -name slake-runtime-bench-lean -type f 2>/dev/null | head -n1 || true)
    fi
    if [[ -z "${bin:-}" || ! -x "$bin" ]]; then
      echo "skip: binary missing after build (status=skip_lean_build)"
      echo "status=skip_lean_build"
      exit 0
    fi
    echo "binary=$bin"
    echo "structural binary bytes: $(wc -c <"$bin" | tr -d ' ')"
    has_lean_rt=0
    if command -v ldd >/dev/null 2>&1; then
      ldd_out=$(ldd "$bin" 2>/dev/null || true)
      echo "structural ldd:"
      printf '%s\n' "$ldd_out" | sed 's/^/  /'
      if printf '%s\n' "$ldd_out" | grep -Eiq 'leanshared|libleanshared'; then
        echo "structural Lean runtime present in ldd: ok (R-lean contrast)"
        has_lean_rt=1
      fi
    else
      echo "structural ldd: (tool missing; skipped)"
    fi
    # Static Lean layouts embed RT (no libleanshared in ldd). Pipe nm; no huge vars.
    if [[ "$has_lean_rt" -eq 0 ]] && command -v nm >/dev/null 2>&1; then
      if nm -D "$bin" 2>/dev/null | grep -Eiq 'lean_initialize_runtime|lean_run_main|_lean_main'; then
        echo "structural Lean runtime embedded (lean_* nm -D; static RT): ok"
        has_lean_rt=1
      elif nm "$bin" 2>/dev/null | grep -Eiq 'lean_initialize_runtime|lean_run_main|_lean_main'; then
        echo "structural Lean runtime embedded (lean_* nm; static RT): ok"
        has_lean_rt=1
      fi
    fi
    if [[ "$has_lean_rt" -eq 0 ]] && grep -aEq 'lean_initialize_runtime_module|lean_run_main' "$bin" 2>/dev/null; then
      echo "structural Lean runtime embedded (lean_* in binary bytes; static RT): ok"
      has_lean_rt=1
    fi
    if [[ "$has_lean_rt" -eq 1 ]]; then
      echo "structural lean_rt=present"
    else
      echo "warn: Lean runtime not obvious in ldd/nm/bytes (unusual layout)"
      echo "structural lean_rt=unknown"
    fi
    echo "-- R-lean outer warmup (discard) --"
    TIMEFORMAT='{{_bench_rt_timeformat}}'
    { time "$bin" "$n"; } 2>&1
    i=1
    while [[ "$i" -le "$runs" ]]; do
      echo "-- R-lean measured run $i/$runs --"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      { time "$bin" "$n"; } 2>&1
      i=$((i + 1))
    done
    echo "bench-runtime-lean: done"


# ---------------------------------------------------------------------------
# T3: timing-link flag matrix (hosted link only; structural -c fixed).
# Default suite still -O2. Optional LTO cell soft-skips on link failure.
# Greppable: bench-runtime-flag-matrix, BENCH_RUNTIME_CFLAGS, flag-matrix
# Research: doc/dev/research/runtime-flag-matrix-2026-08-12.md
# Calibrate: BENCH_RUNTIME_FLAG_MATRIX_N=20000000 BENCH_RUNTIME_FLAG_MATRIX_RUNS=2
# ---------------------------------------------------------------------------
bench-runtime-flag-matrix:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    n="${BENCH_RUNTIME_FLAG_MATRIX_N:-20000000}"
    runs="${BENCH_RUNTIME_FLAG_MATRIX_RUNS:-2}"
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    hist_dir="$root/doc/bench-history"
    mkdir -p "$hist_dir"
    tsv="$hist_dir/flag-matrix-latest.tsv"
    stamped_tsv="$hist_dir/flag-matrix-${stamp}.tsv"
    log="/tmp/systems-lean-bench-runtime-flag-matrix-${stamp}.log"
    note="$root/doc/dev/research/runtime-flag-matrix-2026-08-12.md"
    echo "== bench-runtime-flag-matrix (timing-link CFLAGS only) ==" | tee "$log"
    echo "N=$n runs=$runs stamp=$stamp" | tee -a "$log"
    echo "structural freestanding-first -c stays fixed (-O2 -ffreestanding -nostdlib)" | tee -a "$log"
    echo "default suite BENCH_RUNTIME_CFLAGS is -O3 -flto (E4+LTO policy); matrix still compares cells" | tee -a "$log"
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH (soft skip)" | tee -a "$log"
      echo "status=skip_no_cc"
      exit 0
    fi
    # Cells: required -O2 and -O3; optional LTO (may soft-skip).
    cells=("-O2" "-O3" "-O3 -flto")
    {
      printf '%s\n' "stamp	flags	arm	exit	N	ns_median	ns_mean	ns_min	ns_max	status"
    } >"$tsv"
    for flags in "${cells[@]}"; do
      echo | tee -a "$log"
      echo "-- cell flags=[$flags] --" | tee -a "$log"
      cap=$(mktemp /tmp/slake-rt-flag-cell-XXXXXX.out)
      set +e
      BENCH_RUNTIME_CFLAGS="$flags" BENCH_RUNTIME_N="$n" BENCH_RUNTIME_RUNS="$runs" \
        just bench-runtime-freestanding >"$cap" 2>&1
      st=$?
      set -e
      cat "$cap" >>"$log"
      if [[ $st -ne 0 ]]; then
        # LTO / odd flags: soft-skip cell (do not fail whole matrix).
        if printf '%s' "$flags" | grep -Eq -- '-flto|-fuse-linker-plugin'; then
          echo "cell soft-skip: link or run failed under flags=[$flags] exit=$st" | tee -a "$log"
          printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
            "$stamp" "$flags" "R-free" "fail" "$n" "?" "?" "?" "?" "skip_link_or_run" >>"$tsv"
          rm -f "$cap"
          continue
        fi
        echo "error: required cell flags=[$flags] failed exit=$st" | tee -a "$log"
        rm -f "$cap"
        exit 1
      fi
      if grep -q 'status=skip_no_cc' "$cap" 2>/dev/null; then
        printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
          "$stamp" "$flags" "R-free" "skip" "$n" "?" "?" "?" "?" "skip_no_cc" >>"$tsv"
        rm -f "$cap"
        continue
      fi
      # Scrape ns_per_op after first sample drop (portable; no gawk asort).
      mapfile -t raw_ns < <(grep -oE 'ns_per_op=[0-9.eE+-]+' "$cap" | sed 's/ns_per_op=//' || true)
      ns_med="?"; ns_mean="?"; ns_min="?"; ns_max="?"
      if [[ ${#raw_ns[@]} -ge 1 ]]; then
        if [[ ${#raw_ns[@]} -ge 2 ]]; then
          use_ns=("${raw_ns[@]:1}")
        else
          use_ns=("${raw_ns[@]}")
        fi
        mapfile -t sorted_ns < <(printf '%s\n' "${use_ns[@]}" | sort -n)
        m=${#sorted_ns[@]}
        if [[ "$m" -ge 1 ]]; then
          ns_min="${sorted_ns[0]}"
          ns_max="${sorted_ns[$((m-1))]}"
          sum=0
          for v in "${sorted_ns[@]}"; do
            sum=$(awk -v a="$sum" -v b="$v" 'BEGIN { printf "%.10f", a+b }')
          done
          ns_mean=$(awk -v s="$sum" -v n="$m" 'BEGIN { printf "%.4f", s/n }')
          mid=$((m / 2))
          if (( m % 2 == 1 )); then
            ns_med=$(awk -v x="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", x+0 }')
          else
            ns_med=$(awk -v a="${sorted_ns[$((mid-1))]}" -v b="${sorted_ns[$mid]}" 'BEGIN { printf "%.4f", (a+b)/2 }')
          fi
          ns_min=$(awk -v x="$ns_min" 'BEGIN { printf "%.4f", x+0 }')
          ns_max=$(awk -v x="$ns_max" 'BEGIN { printf "%.4f", x+0 }')
        fi
      fi
      gate=$(grep -E '^structural_gate=' "$cap" | tail -n1 || echo "structural_gate=?")
      echo "cell ok flags=[$flags] ns_median=$ns_med $gate" | tee -a "$log"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "$flags" "R-free" "ok" "$n" "$ns_med" "$ns_mean" "$ns_min" "$ns_max" "ok" >>"$tsv"
      rm -f "$cap"
    done
    cp -a "$tsv" "$stamped_tsv"
    echo | tee -a "$log"
    echo "bench-runtime-flag-matrix: wrote $tsv" | tee -a "$log"
    echo "bench-runtime-flag-matrix: stamped $stamped_tsv" | tee -a "$log"
    echo "bench-runtime-flag-matrix: log $log" | tee -a "$log"
    echo "bench-runtime-flag-matrix: research $note" | tee -a "$log"
    echo "bench-runtime-flag-matrix: done"
    # Print human table
    echo
    echo "Flag matrix (R-free mint; timing link only):"
    column -t -s $'\t' "$tsv" 2>/dev/null || cat "$tsv"

# ---------------------------------------------------------------------------
# T9: compose microbench mode (hot path; cold remains primary product-shape).
# Env BENCH_RUNTIME_COMPOSE_MICRO=1 on freestanding-compose arm, or recipe below.
# Greppable: bench-runtime-freestanding-compose-micro, BENCH_RUNTIME_COMPOSE_MICRO
# ---------------------------------------------------------------------------
bench-runtime-freestanding-compose-micro:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-runtime-freestanding-compose-micro (T9 hot path) =="
    echo "compose_mode=micro (setup once; remint/check/extract/consume loop)"
    echo "honesty: micro is hot-path measurement; cold is primary product-shape"
    echo "default suite arm remains cold (BENCH_RUNTIME_COMPOSE_MICRO unset)"
    export BENCH_RUNTIME_COMPOSE_MICRO=1
    just bench-runtime-freestanding-compose

# ---------------------------------------------------------------------------
# T6: runtime regression vs tip baseline (opt-in; default suite never fails).
# Compares living doc/BENCH-RUNTIME-metrics.tsv to tip baseline (or path override).
# Env:
#   BENCH_RUNTIME_REGRESS=1          -- suite may call this; standalone always runs
#   BENCH_RUNTIME_REGRESS_PCT=10     -- fail if current median > baseline * (1+pct/100)
#   BENCH_RUNTIME_REGRESS_MODE=fail  -- fail (default) | warn (print only, exit 0)
#   BENCH_RUNTIME_REGRESS_BASELINE   -- override baseline path
# Soft-skip exit 0 if baseline missing. Not in default just check.
# Greppable: bench-runtime-regress, BENCH_RUNTIME_REGRESS, BENCH_RUNTIME_REGRESS_PCT
# Research: doc/dev/research/runtime-regression-perf-micro-2026-08-12.md
# ---------------------------------------------------------------------------
bench-runtime-regress:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    metrics="$root/doc/BENCH-RUNTIME-metrics.tsv"
    baseline="${BENCH_RUNTIME_REGRESS_BASELINE:-$root/doc/BENCH-RUNTIME-baseline.tsv}"
    pct="${BENCH_RUNTIME_REGRESS_PCT:-10}"
    mode="${BENCH_RUNTIME_REGRESS_MODE:-fail}"
    echo "== bench-runtime-regress (T6 optional vs tip baseline) =="
    echo "metrics=$metrics"
    echo "baseline=$baseline"
    echo "threshold_pct=$pct mode=$mode"
    echo "policy: default just bench-runtime does NOT hard-fail CI; this recipe is opt-in"
    echo "policy: BENCH_RUNTIME_REGRESS=1 on suite may invoke this after metrics write"
    if [[ ! -f "$metrics" ]]; then
      echo "skip: missing living metrics (run just bench-runtime first)"
      echo "status=skip_no_metrics"
      exit 0
    fi
    if [[ ! -f "$baseline" ]]; then
      echo "skip: no previous baseline at $baseline (run just bench-runtime-snapshot)"
      echo "status=skip_no_baseline"
      exit 0
    fi
    # Compare ok arms present in both; same arm name; use ns_median column (6).
    # Header: stamp arm exit job_class N ns_median ns_mean ns_min ns_max ns_stdev ...
    # File order: baseline first, living metrics second (is_base flag).
    set +e
    awk -v pct="$pct" -v mode="$mode" -v OFS=' ' '
      BEGIN {
        FS = "\t"
        fail = 0
        compared = 0
        file_i = 0
        print "arm baseline_ns current_ns delta_pct limit_pct result"
      }
      FNR == 1 {
        file_i++
        next
      }
      {
        arm = $2
        ex = $3
        n = $5
        ns = $6 + 0
        if (ex != "ok" || ns <= 0) next
        if (file_i == 1) {
          b_ns[arm] = ns
          b_n[arm] = n
        } else {
          c_ns[arm] = ns
          c_n[arm] = n
          c_seen[arm] = 1
        }
      }
      END {
        for (arm in c_seen) {
          if (!(arm in b_ns)) {
            print arm, "?", c_ns[arm], "?", pct, "skip_no_baseline_arm"
            continue
          }
          bn = b_ns[arm]
          cn = c_ns[arm]
          if (bn <= 0) {
            print arm, bn, cn, "?", pct, "skip_bad_baseline"
            continue
          }
          delta = 100.0 * (cn - bn) / bn
          limit = pct + 0
          res = "ok"
          if (delta > limit) {
            res = "regress"
            fail = 1
          } else if (delta < -limit) {
            res = "improved"
          }
          compared++
          printf "%s %.4f %.4f %.2f %s %s\n", arm, bn, cn, delta, pct, res
          if (b_n[arm] != c_n[arm]) {
            printf "note: %s N baseline=%s current=%s (ns/op still compared)\n", arm, b_n[arm], c_n[arm] > "/dev/stderr"
          }
        }
        print ""
        print "compared_arms=" compared
        if (compared == 0) {
          print "status=skip_no_overlap"
          exit 0
        }
        if (fail) {
          print "status=regress"
          if (mode == "warn" || mode == "warn_only") {
            print "mode=warn: regression reported but exit 0"
            exit 0
          }
          exit 1
        }
        print "status=ok"
        exit 0
      }
    ' "$baseline" "$metrics"
    st=$?
    set -e
    if [[ $st -eq 0 ]]; then
      echo "bench-runtime-regress: done"
    else
      echo "bench-runtime-regress: FAILED (threshold ${pct}% slower vs baseline)" >&2
    fi
    exit $st

# ---------------------------------------------------------------------------
# T7: host perf attach (soft-skip if perf missing). Measurement only.
# Builds freestanding mint or compose binary then perf stat (optional record).
# Env:
#   BENCH_RUNTIME_PERF_N       -- ops for timed binary (default 2000000 mint / 500000 compose)
#   BENCH_RUNTIME_PERF_RECORD=1 -- also perf record -g to /tmp (default off; stat only)
# Greppable: bench-runtime-perf-mint, bench-runtime-perf-compose, skip_no_perf
# ---------------------------------------------------------------------------
bench-runtime-perf-mint:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    drv=src/systems/smoke/slake_runtime_bench_freestanding.c
    n="${BENCH_RUNTIME_PERF_N:-2000000}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-perf-mint-$$"
    mkdir -p "$work"
    echo "== bench-runtime-perf-mint (T7 host perf attach) =="
    echo "N=$n timing_link_cflags=$tcflags"
    if ! command -v perf >/dev/null 2>&1; then
      echo "skip: no perf on PATH (install linux-perf / perf tools)"
      echo "status=skip_no_perf"
      exit 0
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH"
      echo "status=skip_no_cc"
      exit 0
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "wire missing; running just build"
      just build
    fi
    if [[ ! -f "$emit_c" || ! -f "$drv" ]]; then
      echo "error: missing emit or driver" >&2
      exit 1
    fi
    inc=$(dirname "$emit_c")
    bin="$work/r-free-perf"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -I"$inc" -o "$bin" "$drv" "$emit_c"; then
      echo "error: link failed" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "binary=$bin"
    echo "-- perf stat (mint) --"
    set +e
    perf stat -d "$bin" "$n"
    st=$?
    set -e
    if [[ $st -ne 0 ]]; then
      echo "warn: perf stat exit=$st (permissions? try: echo 0 | sudo tee /proc/sys/kernel/perf_event_paranoid)"
    fi
    if [[ "${BENCH_RUNTIME_PERF_RECORD:-0}" == "1" ]]; then
      out="/tmp/slake-rt-perf-mint-$$.data"
      echo "-- perf record -g -> $out --"
      set +e
      perf record -g -o "$out" -- "$bin" "$n"
      set -e
      echo "perf_data=$out"
      echo "hint: perf report -i $out"
    fi
    echo "bench-runtime-perf-mint: done"
    echo "status=ok"
    rm -rf "$work"

bench-runtime-perf-compose:
    #!/usr/bin/env bash
    set -euo pipefail
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    drv=src/systems/smoke/slake_runtime_bench_freestanding_compose.c
    n="${BENCH_RUNTIME_PERF_N:-500000}"
    tcflags="{{_bench_rt_cflags}}"
    work="${TMPDIR:-/tmp}/slake-rt-perf-compose-$$"
    mkdir -p "$work"
    echo "== bench-runtime-perf-compose (T7 host perf attach) =="
    echo "N=$n timing_link_cflags=$tcflags"
    echo "note: cold compose_mode by default; set BENCH_RUNTIME_COMPOSE_MICRO=1 for hot path"
    if ! command -v perf >/dev/null 2>&1; then
      echo "skip: no perf on PATH (install linux-perf / perf tools)"
      echo "status=skip_no_perf"
      exit 0
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "skip: no cc on PATH"
      echo "status=skip_no_cc"
      exit 0
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "wire missing; running just build"
      just build
    fi
    if [[ ! -f "$emit_c" || ! -f "$drv" ]]; then
      echo "error: missing emit or driver" >&2
      exit 1
    fi
    inc=$(dirname "$emit_c")
    bin="$work/r-free-compose-perf"
    # shellcheck disable=SC2086
    if ! cc -std=c11 $tcflags -I"$inc" -o "$bin" "$drv" "$emit_c"; then
      echo "error: link failed" >&2
      rm -rf "$work"
      exit 1
    fi
    echo "binary=$bin"
    echo "compose_micro=${BENCH_RUNTIME_COMPOSE_MICRO:-0}"
    echo "-- perf stat (compose) --"
    set +e
    # Pass stage timers off for cleaner attach unless caller set them.
    BENCH_RUNTIME_STAGE_TIMERS="${BENCH_RUNTIME_STAGE_TIMERS:-0}" \
      perf stat -d "$bin" "$n"
    st=$?
    set -e
    if [[ $st -ne 0 ]]; then
      echo "warn: perf stat exit=$st (permissions? try: echo 0 | sudo tee /proc/sys/kernel/perf_event_paranoid)"
    fi
    if [[ "${BENCH_RUNTIME_PERF_RECORD:-0}" == "1" ]]; then
      out="/tmp/slake-rt-perf-compose-$$.data"
      echo "-- perf record -g -> $out --"
      set +e
      BENCH_RUNTIME_STAGE_TIMERS="${BENCH_RUNTIME_STAGE_TIMERS:-0}" \
        perf record -g -o "$out" -- "$bin" "$n"
      set -e
      echo "perf_data=$out"
      echo "hint: perf report -i $out"
    fi
    echo "bench-runtime-perf-compose: done"
    echo "status=ok"
    rm -rf "$work"

# Full suite + living report: just/bench-runtime-report.just (recipe bench-runtime).
# Shared vars above (_bench_rt_*) are used by the suite via same just namespace.
# Snapshot history: just bench-runtime-snapshot (T5).
# Regression opt-in: just bench-runtime-regress (T6); not default suite fail.
# Perf attach: just bench-runtime-perf-mint | bench-runtime-perf-compose (T7).
# Compose micro: just bench-runtime-freestanding-compose-micro (T9).
