# Modular just: just/bench-runtime-report.just -- suite + living report writer.
# Kind: measurement process glue. Not residual invent. Not claim flips.
# Arms and N defaults live in just/bench-runtime.just (shared namespace).
# Primary: just bench-runtime -> doc/BENCH-RUNTIME-latest.md
# Metrics TSV: doc/BENCH-RUNTIME-metrics.tsv (overwrites each suite)
# Snapshot (T5): just bench-runtime-snapshot -> doc/bench-history/<stamp>/
# Flag matrix (T3): just bench-runtime-flag-matrix (timing-link CFLAGS only)
# Regression (T6): just bench-runtime-regress (opt-in; suite never fails by default)
# Perf attach (T7): just bench-runtime-perf-mint | bench-runtime-perf-compose
# Compose micro (T9): BENCH_RUNTIME_COMPOSE_MICRO=1 or bench-runtime-freestanding-compose-micro
# Greppable: bench-runtime, BENCH-RUNTIME, How much faster, bench-runtime-snapshot

# ---------------------------------------------------------------------------
# Full suite + living report
# Greppable: bench-runtime, BENCH-RUNTIME
# Report: doc/BENCH-RUNTIME-latest.md | Log: /tmp/systems-lean-bench-runtime-*.log
# ---------------------------------------------------------------------------
bench-runtime:
    #!/usr/bin/env bash
    set -uo pipefail
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    stamp_human=$(date -u +'%Y-%m-%d %H:%M:%S UTC')
    log="/tmp/systems-lean-bench-runtime-${stamp}.log"
    report="$root/doc/BENCH-RUNTIME-latest.md"
    cap=$(mktemp -d /tmp/systems-lean-bench-runtime-cap-XXXXXX)
    n="{{_bench_rt_n}}"
    cn="{{_bench_rt_compose_n}}"
    ln="{{_bench_rt_lean_n}}"
    runs="{{_bench_rt_runs}}"
    overall=0
    skip_no_cc=0
    bt=$'\x60'
    free_st=0; gc_st=0; stack_st=0; fcomp_st=0; gcomp_st=0; shape_st=0; boehm_st=0; lean_st=0
    skip_boehm=0
    skip_lean=0
    : >"$log"
    echo "== just bench-runtime: freestanding linear vs GC baselines (operator question) ==" | tee -a "$log"
    echo "stamp: $stamp_human | log: $log | report: $report" | tee -a "$log"
    echo "N_mint=$n N_compose=$cn N_lean=$ln runs=$runs" | tee -a "$log"
    echo | tee -a "$log"
    if ! command -v cc >/dev/null 2>&1; then
      skip_no_cc=1
      echo "soft skip: no cc; writing skip report" | tee -a "$log"
    fi
    if [[ "$skip_no_cc" -eq 0 ]]; then
      emit_c=src/systems/emit/slake_freestanding.c
      if [[ ! -f "$emit_c" || ! -f src/systems/emit/slake_freestanding.h || ! -f out/freestanding-c/slake_freestanding.c ]]; then
        echo "-- just build (wire missing) --" | tee -a "$log"
        set +e
        just build >>"$log" 2>&1
        st=$?
        set -u
        if [[ $st -ne 0 ]]; then
          echo "error: just build failed" | tee -a "$log"
          overall=1
        fi
      fi
    fi
    free_out="$cap/free.out"; gc_out="$cap/gc.out"; stack_out="$cap/stack.out"
    fcomp_out="$cap/fcomp.out"; gcomp_out="$cap/gcomp.out"; shape_out="$cap/shape.out"
    boehm_out="$cap/boehm.out"; lean_out="$cap/lean.out"
    free_time="$cap/free.time"; gc_time="$cap/gc.time"; stack_time="$cap/stack.time"
    fcomp_time="$cap/fcomp.time"; gcomp_time="$cap/gcomp.time"; shape_time="$cap/shape.time"
    boehm_time="$cap/boehm.time"; lean_time="$cap/lean.time"
    run_arm() {
      local name="$1" recipe="$2" outf="$3" timef="$4" stvar="$5"
      echo "-- $recipe --" | tee -a "$log"
      TIMEFORMAT='{{_bench_rt_timeformat}}'
      set +e
      { time just "$recipe" >"$outf" 2>&1; } 2>"$timef"
      local st=$?
      set -u
      cat "$outf" >>"$log"
      echo "(outer TIMEFORMAT for just $recipe)" >>"$log"
      cat "$timef" >>"$log"
      echo >>"$log"
      eval "$stvar=$st"
      if [[ $st -ne 0 ]]; then
        # Soft-skip arms exit 0 with status=skip_*; hard fail only non-zero.
        overall=1
        echo "  $name FAIL exit=$st" | tee -a "$log"
      else
        if grep -q 'status=skip_no_boehm' "$outf" 2>/dev/null; then
          skip_boehm=1
          echo "  $name soft-skip skip_no_boehm" | tee -a "$log"
        elif grep -Eq 'status=skip_no_lake|status=skip_lean_build' "$outf" 2>/dev/null; then
          skip_lean=1
          echo "  $name soft-skip lean" | tee -a "$log"
        else
          echo "  $name ok" | tee -a "$log"
        fi
      fi
    }
    if [[ "$skip_no_cc" -eq 0 && "$overall" -eq 0 ]]; then
      run_arm freestanding bench-runtime-freestanding "$free_out" "$free_time" free_st
      run_arm gcshape bench-runtime-gcshape "$gc_out" "$gc_time" gc_st
      run_arm stack-twin bench-runtime-stack-twin "$stack_out" "$stack_time" stack_st
      run_arm free-compose bench-runtime-freestanding-compose "$fcomp_out" "$fcomp_time" fcomp_st
      run_arm gc-compose bench-runtime-gcshape-compose "$gcomp_out" "$gcomp_time" gcomp_st
      run_arm fail-closed-shape bench-runtime-fail-closed-shape "$shape_out" "$shape_time" shape_st
      run_arm boehm bench-runtime-boehm "$boehm_out" "$boehm_time" boehm_st
    fi
    # Lean arm does not need cc; always attempt (soft-skip skip_no_lake / skip_lean_build).
    run_arm lean bench-runtime-lean "$lean_out" "$lean_time" lean_st
    host_name=$(hostname 2>/dev/null || echo unknown)
    uname_srm=$(uname -srm 2>/dev/null || echo unknown)
    nproc_n=$(nproc 2>/dev/null || echo "?")
    cc_v="(missing)"
    if command -v cc >/dev/null 2>&1; then
      cc_v=$(cc --version 2>/dev/null | head -n1 || echo "(error)")
    fi
    scrape_arm() {
      local file="$1"
      local prefix="$2"
      # Stats: median/mean (prior) plus min/max/stdev (T2). First sample dropped
      # when 2+ ns_per_op lines (outer discard align). Sample stdev when cnt>=2.
      awk -v p="$prefix" '
        /^ns_per_op=/ { sub(/^ns_per_op=/,""); ns[++nn]=$0+0 }
        /^wall_seconds=/ { sub(/^wall_seconds=/,""); ws[++ww]=$0+0 }
        /^ops_per_s=/ { sub(/^ops_per_s=/,""); os[++oo]=$0+0 }
        /^N=/ { sub(/^N=/,""); nval=$0 }
        /^link line:/ { link=$0 }
        /^structural freestanding-first compile:/ { mode=$0 }
        /^structural binary bytes:/ { bbytes=$0 }
        /^structural no leanshared/ { nort=$0 }
        /^structural libgc present/ { hasgc=$0 }
        /^structural ldd: \(tool missing/ { nort="structural ldd: skipped" }
        /^status=skip_no_boehm/ { skipb=1 }
        /^status=skip_no_cc/ { skipc=1 }
        /^status=skip_no_lake/ { skipl=1; skipmsg="skip_no_lake" }
        /^status=skip_lean_build/ { skipl=1; skipmsg="skip_lean_build" }
        /^structural Lean runtime present/ { haslean=$0 }
        /^structural Lean runtime embedded/ { haslean=$0 }
        /^structural lean_rt=/ { haslean=$0 }
        /^stage_ns_per_op_init=/ { sub(/^stage_ns_per_op_init=/,""); st_init=$0 }
        /^stage_ns_per_op_push_nodes=/ { sub(/^stage_ns_per_op_push_nodes=/,""); st_push=$0 }
        /^stage_ns_per_op_edges=/ { sub(/^stage_ns_per_op_edges=/,""); st_edges=$0 }
        /^stage_ns_per_op_mint=/ { sub(/^stage_ns_per_op_mint=/,""); st_mint=$0 }
        /^stage_ns_per_op_mark=/ { sub(/^stage_ns_per_op_mark=/,""); st_mark=$0 }
        /^stage_ns_per_op_well_typed=/ { sub(/^stage_ns_per_op_well_typed=/,""); st_wt=$0 }
        /^stage_ns_per_op_check_fail_closed=/ { sub(/^stage_ns_per_op_check_fail_closed=/,""); st_cfc=$0 }
        /^stage_ns_per_op_extract=/ { sub(/^stage_ns_per_op_extract=/,""); st_ext=$0 }
        /^stage_ns_per_op_consume=/ { sub(/^stage_ns_per_op_consume=/,""); st_con=$0 }
        /^stage_ns_per_op_post_check=/ { sub(/^stage_ns_per_op_post_check=/,""); st_post=$0 }
        /^stage_group_ns_per_op_setup=/ { sub(/^stage_group_ns_per_op_setup=/,""); st_gsetup=$0 }
        /^stage_group_ns_per_op_mint_mark=/ { sub(/^stage_group_ns_per_op_mint_mark=/,""); st_gmint=$0 }
        /^stage_group_ns_per_op_check=/ { sub(/^stage_group_ns_per_op_check=/,""); st_gcheck=$0 }
        /^stage_group_ns_per_op_extract_consume=/ { sub(/^stage_group_ns_per_op_extract_consume=/,""); st_gex=$0 }
        /^stage_N=/ { sub(/^stage_N=/,""); st_n=$0 }
        /^stage_timers=/ { sub(/^stage_timers=/,""); st_on=$0 }
        END {
          print p "_n=" (nval==""?"?":nval)
          print p "_ns_count=" nn
          start = (nn >= 2 ? 2 : 1)
          cnt = 0
          for (i = start; i <= nn; i++) { vals[++cnt] = ns[i] }
          if (cnt == 0) {
            print p "_ns_median=?"
            print p "_ns_mean=?"
            print p "_ns_min=?"
            print p "_ns_max=?"
            print p "_ns_stdev=?"
            print p "_wall_median=?"
            print p "_ops_mean=?"
          } else {
            for (i = 2; i <= cnt; i++) {
              v = vals[i]; j = i - 1
              while (j >= 1 && vals[j] > v) { vals[j+1] = vals[j]; j-- }
              vals[j+1] = v
            }
            if (cnt % 2) med = vals[int(cnt/2)+1]
            else med = (vals[cnt/2] + vals[cnt/2+1]) / 2
            sum = 0; for (i = 1; i <= cnt; i++) sum += vals[i]
            mean = sum / cnt
            vmin = vals[1]; vmax = vals[cnt]
            printf "%s_ns_median=%.4f\n", p, med
            printf "%s_ns_mean=%.4f\n", p, mean
            printf "%s_ns_min=%.4f\n", p, vmin
            printf "%s_ns_max=%.4f\n", p, vmax
            if (cnt >= 2) {
              ss = 0
              for (i = 1; i <= cnt; i++) {
                d = vals[i] - mean
                ss += d * d
              }
              stdev = sqrt(ss / (cnt - 1))
              printf "%s_ns_stdev=%.4f\n", p, stdev
            } else {
              print p "_ns_stdev=?"
            }
            wcnt = 0
            for (i = start; i <= ww; i++) { wvals[++wcnt] = ws[i] }
            for (i = 2; i <= wcnt; i++) {
              v = wvals[i]; j = i - 1
              while (j >= 1 && wvals[j] > v) { wvals[j+1] = wvals[j]; j-- }
              wvals[j+1] = v
            }
            if (wcnt % 2) wmed = wvals[int(wcnt/2)+1]
            else if (wcnt > 0) wmed = (wvals[wcnt/2] + wvals[wcnt/2+1]) / 2
            else wmed = 0
            printf "%s_wall_median=%.6f\n", p, wmed
            osum = 0; oc = 0
            for (i = start; i <= oo; i++) { osum += os[i]; oc++ }
            if (oc > 0) printf "%s_ops_mean=%.2f\n", p, osum/oc
            else print p "_ops_mean=?"
          }
          if (link != "") print p "_link=" link
          if (mode != "") print p "_mode=" mode
          if (bbytes != "") print p "_bin=" bbytes
          if (nort != "") print p "_nort=" nort
          if (hasgc != "") print p "_hasgc=" hasgc
          if (haslean != "") print p "_haslean=" haslean
          if (skipb) print p "_skip=skip_no_boehm"
          if (skipc) print p "_skip=skip_no_cc"
          if (skipl) print p "_skip=" skipmsg
          if (st_on != "") print p "_stage_timers=" st_on
          if (st_n != "") print p "_stage_N=" st_n
          if (st_init != "") print p "_st_init=" st_init
          if (st_push != "") print p "_st_push=" st_push
          if (st_edges != "") print p "_st_edges=" st_edges
          if (st_mint != "") print p "_st_mint=" st_mint
          if (st_mark != "") print p "_st_mark=" st_mark
          if (st_wt != "") print p "_st_wt=" st_wt
          if (st_cfc != "") print p "_st_cfc=" st_cfc
          if (st_ext != "") print p "_st_ext=" st_ext
          if (st_con != "") print p "_st_con=" st_con
          if (st_post != "") print p "_st_post=" st_post
          if (st_gsetup != "") print p "_st_gsetup=" st_gsetup
          if (st_gmint != "") print p "_st_gmint=" st_gmint
          if (st_gcheck != "") print p "_st_gcheck=" st_gcheck
          if (st_gex != "") print p "_st_gex=" st_gex
        }
      ' "$file" 2>/dev/null || true
    }
    free_m=""; gc_m=""; stack_m=""; fcomp_m=""; gcomp_m=""; shape_m=""; boehm_m=""; lean_m=""
    if [[ -f "$free_out" ]]; then free_m=$(scrape_arm "$free_out" free); fi
    if [[ -f "$gc_out" ]]; then gc_m=$(scrape_arm "$gc_out" gc); fi
    if [[ -f "$stack_out" ]]; then stack_m=$(scrape_arm "$stack_out" stack); fi
    if [[ -f "$fcomp_out" ]]; then fcomp_m=$(scrape_arm "$fcomp_out" fcomp); fi
    if [[ -f "$gcomp_out" ]]; then gcomp_m=$(scrape_arm "$gcomp_out" gcomp); fi
    if [[ -f "$shape_out" ]]; then shape_m=$(scrape_arm "$shape_out" shape); fi
    if [[ -f "$boehm_out" ]]; then boehm_m=$(scrape_arm "$boehm_out" boehm); fi
    if [[ -f "$lean_out" ]]; then lean_m=$(scrape_arm "$lean_out" lean); fi
    free_ns="?"; free_ns_mean="?"; free_ns_min="?"; free_ns_max="?"; free_ns_stdev="?"
    free_wall="?"; free_ops="?"; free_n="$n"
    free_link="(see log)"; free_mode="?"; free_bin="?"; free_nort="?"
    gc_ns="?"; gc_ns_mean="?"; gc_ns_min="?"; gc_ns_max="?"; gc_ns_stdev="?"
    gc_wall="?"; gc_ops="?"; gc_n="$n"
    stack_ns="?"; stack_ns_mean="?"; stack_ns_min="?"; stack_ns_max="?"; stack_ns_stdev="?"
    stack_wall="?"; stack_ops="?"; stack_n="$n"
    fcomp_ns="?"; fcomp_ns_mean="?"; fcomp_ns_min="?"; fcomp_ns_max="?"; fcomp_ns_stdev="?"
    fcomp_wall="?"; fcomp_ops="?"; fcomp_n="$cn"
    fcomp_link="(see log)"; fcomp_mode="?"; fcomp_bin="?"; fcomp_nort="?"
    fcomp_st_init="?"; fcomp_st_push="?"; fcomp_st_edges="?"; fcomp_st_mint="?"
    fcomp_st_mark="?"; fcomp_st_wt="?"; fcomp_st_cfc="?"; fcomp_st_ext="?"
    fcomp_st_con="?"; fcomp_st_post="?"; fcomp_st_n="?"; fcomp_stage_timers="?"
    fcomp_st_gsetup="?"; fcomp_st_gmint="?"; fcomp_st_gcheck="?"; fcomp_st_gex="?"
    gcomp_ns="?"; gcomp_ns_mean="?"; gcomp_ns_min="?"; gcomp_ns_max="?"; gcomp_ns_stdev="?"
    gcomp_wall="?"; gcomp_ops="?"; gcomp_n="$cn"
    shape_ns="?"; shape_ns_mean="?"; shape_ns_min="?"; shape_ns_max="?"; shape_ns_stdev="?"
    shape_wall="?"; shape_ops="?"; shape_n="$cn"
    boehm_ns="?"; boehm_ns_mean="?"; boehm_ns_min="?"; boehm_ns_max="?"; boehm_ns_stdev="?"
    boehm_wall="?"; boehm_ops="?"; boehm_n="$n"
    boehm_hasgc="?"; boehm_skip=""
    lean_ns="?"; lean_ns_mean="?"; lean_ns_min="?"; lean_ns_max="?"; lean_ns_stdev="?"
    lean_wall="?"; lean_ops="?"; lean_n="$ln"
    lean_hasrt="?"; lean_skip=""; lean_bin="?"
    while IFS= read -r line; do
      case "$line" in
        free_ns_median=*) free_ns="${line#free_ns_median=}" ;;
        free_ns_mean=*) free_ns_mean="${line#free_ns_mean=}" ;;
        free_ns_min=*) free_ns_min="${line#free_ns_min=}" ;;
        free_ns_max=*) free_ns_max="${line#free_ns_max=}" ;;
        free_ns_stdev=*) free_ns_stdev="${line#free_ns_stdev=}" ;;
        free_wall_median=*) free_wall="${line#free_wall_median=}" ;;
        free_ops_mean=*) free_ops="${line#free_ops_mean=}" ;;
        free_n=*) free_n="${line#free_n=}" ;;
        free_link=*) free_link="${line#free_link=}" ;;
        free_mode=*) free_mode="${line#free_mode=}" ;;
        free_bin=*) free_bin="${line#free_bin=}" ;;
        free_nort=*) free_nort="${line#free_nort=}" ;;
      esac
    done <<< "$free_m"
    while IFS= read -r line; do
      case "$line" in
        gc_ns_median=*) gc_ns="${line#gc_ns_median=}" ;;
        gc_ns_mean=*) gc_ns_mean="${line#gc_ns_mean=}" ;;
        gc_ns_min=*) gc_ns_min="${line#gc_ns_min=}" ;;
        gc_ns_max=*) gc_ns_max="${line#gc_ns_max=}" ;;
        gc_ns_stdev=*) gc_ns_stdev="${line#gc_ns_stdev=}" ;;
        gc_wall_median=*) gc_wall="${line#gc_wall_median=}" ;;
        gc_ops_mean=*) gc_ops="${line#gc_ops_mean=}" ;;
        gc_n=*) gc_n="${line#gc_n=}" ;;
      esac
    done <<< "$gc_m"
    while IFS= read -r line; do
      case "$line" in
        stack_ns_median=*) stack_ns="${line#stack_ns_median=}" ;;
        stack_ns_mean=*) stack_ns_mean="${line#stack_ns_mean=}" ;;
        stack_ns_min=*) stack_ns_min="${line#stack_ns_min=}" ;;
        stack_ns_max=*) stack_ns_max="${line#stack_ns_max=}" ;;
        stack_ns_stdev=*) stack_ns_stdev="${line#stack_ns_stdev=}" ;;
        stack_wall_median=*) stack_wall="${line#stack_wall_median=}" ;;
        stack_ops_mean=*) stack_ops="${line#stack_ops_mean=}" ;;
        stack_n=*) stack_n="${line#stack_n=}" ;;
      esac
    done <<< "$stack_m"
    while IFS= read -r line; do
      case "$line" in
        fcomp_ns_median=*) fcomp_ns="${line#fcomp_ns_median=}" ;;
        fcomp_ns_mean=*) fcomp_ns_mean="${line#fcomp_ns_mean=}" ;;
        fcomp_ns_min=*) fcomp_ns_min="${line#fcomp_ns_min=}" ;;
        fcomp_ns_max=*) fcomp_ns_max="${line#fcomp_ns_max=}" ;;
        fcomp_ns_stdev=*) fcomp_ns_stdev="${line#fcomp_ns_stdev=}" ;;
        fcomp_wall_median=*) fcomp_wall="${line#fcomp_wall_median=}" ;;
        fcomp_ops_mean=*) fcomp_ops="${line#fcomp_ops_mean=}" ;;
        fcomp_n=*) fcomp_n="${line#fcomp_n=}" ;;
        fcomp_link=*) fcomp_link="${line#fcomp_link=}" ;;
        fcomp_mode=*) fcomp_mode="${line#fcomp_mode=}" ;;
        fcomp_bin=*) fcomp_bin="${line#fcomp_bin=}" ;;
        fcomp_nort=*) fcomp_nort="${line#fcomp_nort=}" ;;
        fcomp_stage_timers=*) fcomp_stage_timers="${line#fcomp_stage_timers=}" ;;
        fcomp_stage_N=*) fcomp_st_n="${line#fcomp_stage_N=}" ;;
        fcomp_st_init=*) fcomp_st_init="${line#fcomp_st_init=}" ;;
        fcomp_st_push=*) fcomp_st_push="${line#fcomp_st_push=}" ;;
        fcomp_st_edges=*) fcomp_st_edges="${line#fcomp_st_edges=}" ;;
        fcomp_st_mint=*) fcomp_st_mint="${line#fcomp_st_mint=}" ;;
        fcomp_st_mark=*) fcomp_st_mark="${line#fcomp_st_mark=}" ;;
        fcomp_st_wt=*) fcomp_st_wt="${line#fcomp_st_wt=}" ;;
        fcomp_st_cfc=*) fcomp_st_cfc="${line#fcomp_st_cfc=}" ;;
        fcomp_st_ext=*) fcomp_st_ext="${line#fcomp_st_ext=}" ;;
        fcomp_st_con=*) fcomp_st_con="${line#fcomp_st_con=}" ;;
        fcomp_st_post=*) fcomp_st_post="${line#fcomp_st_post=}" ;;
        fcomp_st_gsetup=*) fcomp_st_gsetup="${line#fcomp_st_gsetup=}" ;;
        fcomp_st_gmint=*) fcomp_st_gmint="${line#fcomp_st_gmint=}" ;;
        fcomp_st_gcheck=*) fcomp_st_gcheck="${line#fcomp_st_gcheck=}" ;;
        fcomp_st_gex=*) fcomp_st_gex="${line#fcomp_st_gex=}" ;;
      esac
    done <<< "$fcomp_m"
    while IFS= read -r line; do
      case "$line" in
        gcomp_ns_median=*) gcomp_ns="${line#gcomp_ns_median=}" ;;
        gcomp_ns_mean=*) gcomp_ns_mean="${line#gcomp_ns_mean=}" ;;
        gcomp_ns_min=*) gcomp_ns_min="${line#gcomp_ns_min=}" ;;
        gcomp_ns_max=*) gcomp_ns_max="${line#gcomp_ns_max=}" ;;
        gcomp_ns_stdev=*) gcomp_ns_stdev="${line#gcomp_ns_stdev=}" ;;
        gcomp_wall_median=*) gcomp_wall="${line#gcomp_wall_median=}" ;;
        gcomp_ops_mean=*) gcomp_ops="${line#gcomp_ops_mean=}" ;;
        gcomp_n=*) gcomp_n="${line#gcomp_n=}" ;;
      esac
    done <<< "$gcomp_m"
    while IFS= read -r line; do
      case "$line" in
        shape_ns_median=*) shape_ns="${line#shape_ns_median=}" ;;
        shape_ns_mean=*) shape_ns_mean="${line#shape_ns_mean=}" ;;
        shape_ns_min=*) shape_ns_min="${line#shape_ns_min=}" ;;
        shape_ns_max=*) shape_ns_max="${line#shape_ns_max=}" ;;
        shape_ns_stdev=*) shape_ns_stdev="${line#shape_ns_stdev=}" ;;
        shape_wall_median=*) shape_wall="${line#shape_wall_median=}" ;;
        shape_ops_mean=*) shape_ops="${line#shape_ops_mean=}" ;;
        shape_n=*) shape_n="${line#shape_n=}" ;;
      esac
    done <<< "$shape_m"
    while IFS= read -r line; do
      case "$line" in
        boehm_ns_median=*) boehm_ns="${line#boehm_ns_median=}" ;;
        boehm_ns_mean=*) boehm_ns_mean="${line#boehm_ns_mean=}" ;;
        boehm_ns_min=*) boehm_ns_min="${line#boehm_ns_min=}" ;;
        boehm_ns_max=*) boehm_ns_max="${line#boehm_ns_max=}" ;;
        boehm_ns_stdev=*) boehm_ns_stdev="${line#boehm_ns_stdev=}" ;;
        boehm_wall_median=*) boehm_wall="${line#boehm_wall_median=}" ;;
        boehm_ops_mean=*) boehm_ops="${line#boehm_ops_mean=}" ;;
        boehm_n=*) boehm_n="${line#boehm_n=}" ;;
        boehm_hasgc=*) boehm_hasgc="${line#boehm_hasgc=}" ;;
        boehm_skip=*) boehm_skip="${line#boehm_skip=}" ;;
      esac
    done <<< "$boehm_m"
    while IFS= read -r line; do
      case "$line" in
        lean_ns_median=*) lean_ns="${line#lean_ns_median=}" ;;
        lean_ns_mean=*) lean_ns_mean="${line#lean_ns_mean=}" ;;
        lean_ns_min=*) lean_ns_min="${line#lean_ns_min=}" ;;
        lean_ns_max=*) lean_ns_max="${line#lean_ns_max=}" ;;
        lean_ns_stdev=*) lean_ns_stdev="${line#lean_ns_stdev=}" ;;
        lean_wall_median=*) lean_wall="${line#lean_wall_median=}" ;;
        lean_ops_mean=*) lean_ops="${line#lean_ops_mean=}" ;;
        lean_n=*) lean_n="${line#lean_n=}" ;;
        lean_haslean=*) lean_hasrt="${line#lean_haslean=}" ;;
        lean_bin=*) lean_bin="${line#lean_bin=}" ;;
        lean_skip=*) lean_skip="${line#lean_skip=}" ;;
      esac
    done <<< "$lean_m"
    scrape_outer() {
      local tf="$1"
      local r="?" u="?" s="?"
      if [[ -s "$tf" ]]; then
        local line
        line=$(grep -E '^real ' "$tf" | tail -n1 || true)
        if [[ -n "${line:-}" ]]; then set -- $line; r="${2:-?}"; u="${4:-?}"; s="${6:-?}"; fi
      fi
      printf '%s %s %s' "$r" "$u" "$s"
    }
    read -r free_real free_user free_sys <<< "$(scrape_outer "$free_time")"
    read -r gc_real gc_user gc_sys <<< "$(scrape_outer "$gc_time")"
    read -r stack_real stack_user stack_sys <<< "$(scrape_outer "$stack_time")"
    read -r fcomp_real fcomp_user fcomp_sys <<< "$(scrape_outer "$fcomp_time")"
    read -r gcomp_real gcomp_user gcomp_sys <<< "$(scrape_outer "$gcomp_time")"
    read -r shape_real shape_user shape_sys <<< "$(scrape_outer "$shape_time")"
    read -r boehm_real boehm_user boehm_sys <<< "$(scrape_outer "$boehm_time")"
    read -r lean_real lean_user lean_sys <<< "$(scrape_outer "$lean_time")"
    ratio_of() {
      local a="$1" b="$2"
      a="$a" b="$b" awk '
        function isnum(x) { return (x ~ /^[0-9]+(\.[0-9]+)?$/) }
        BEGIN {
          fs = ENVIRON["a"]; gs = ENVIRON["b"]
          f = fs + 0; g = gs + 0
          if (isnum(fs) && isnum(gs) && f > 0) printf "%.3f", g / f
          else print "?"
        }'
    }
    ratio_mint=$(ratio_of "$free_ns" "$gc_ns")
    ratio_stack=$(ratio_of "$free_ns" "$stack_ns")
    ratio_compose=$(ratio_of "$fcomp_ns" "$gcomp_ns")
    ratio_shape=$(ratio_of "$fcomp_ns" "$shape_ns")
    ratio_boehm=$(ratio_of "$free_ns" "$boehm_ns")
    # Lean ratio only when both measured; N may differ -- label N in report.
    ratio_lean=$(ratio_of "$free_ns" "$lean_ns")
    # Plain English: freestanding vs baseline (lower ns/op = faster). ASCII "x".
    phrase_vs() {
      local free_s="$1" base_s="$2"
      free_s="$free_s" base_s="$base_s" awk '
        function isnum(x) { return (x ~ /^[0-9]+(\.[0-9]+)?$/) }
        BEGIN {
          fs = ENVIRON["free_s"]; bs = ENVIRON["base_s"]
          f = fs + 0; b = bs + 0
          if (!isnum(fs) || !isnum(bs) || f <= 0 || b <= 0) { print "not measured"; exit }
          if (f < b) printf "~%.1fx faster", b / f
          else if (f > b) printf "~%.1fx slower", f / b
          else print "~same speed"
        }'
    }
    phrase_boehm=$(phrase_vs "$free_ns" "$boehm_ns")
    phrase_lean=$(phrase_vs "$free_ns" "$lean_ns")
    phrase_heap=$(phrase_vs "$free_ns" "$gc_ns")
    phrase_stack=$(phrase_vs "$free_ns" "$stack_ns")
    phrase_compose=$(phrase_vs "$fcomp_ns" "$gcomp_ns")
    phrase_shape=$(phrase_vs "$fcomp_ns" "$shape_ns")
    # Data-driven honesty note for mint vs heap_churn (no forged "often loses").
    heap_honest_note="Honest: compare freestanding and heap_churn under the same timing-link CFLAGS (default -O3 -flto)."
    if [[ "$free_ns" != "?" && "$gc_ns" != "?" ]]; then
      heap_cmp=$(awk -v fs="$free_ns" -v gs="$gc_ns" 'BEGIN {
        f = fs + 0; g = gs + 0
        if (f <= 0 || g <= 0) { print "na"; exit }
        if (f < g) print "beats"
        else if (f > g) print "loses"
        else print "ties"
      }')
      case "$heap_cmp" in
        beats) heap_honest_note="Honest: freestanding mint median <= heap_churn under this run's timing-link flags (default -O3 -flto)." ;;
        loses) heap_honest_note="Honest: freestanding mint median still loses pure malloc/free microchurn under this run's flags." ;;
        ties) heap_honest_note="Honest: freestanding mint median ties heap_churn under this run's timing-link flags." ;;
      esac
    fi
    ex_label() {
      local st="$1" skip="$2"
      if [[ "$skip_no_cc" -eq 1 ]]; then echo "skip_no_cc"; return; fi
      if [[ -n "$skip" ]]; then echo "$skip"; return; fi
      if [[ "${st:-1}" -ne 0 ]]; then echo "fail"; else echo "ok"; fi
    }
    free_ex=$(ex_label "${free_st:-1}" "")
    gc_ex=$(ex_label "${gc_st:-1}" "")
    stack_ex=$(ex_label "${stack_st:-1}" "")
    fcomp_ex=$(ex_label "${fcomp_st:-1}" "")
    gcomp_ex=$(ex_label "${gcomp_st:-1}" "")
    shape_ex=$(ex_label "${shape_st:-1}" "")
    if [[ -n "$boehm_skip" ]]; then
      boehm_ex="$boehm_skip"
    elif [[ "$skip_boehm" -eq 1 ]]; then
      boehm_ex="skip_no_boehm"
    else
      boehm_ex=$(ex_label "${boehm_st:-1}" "")
    fi
    if [[ -n "$lean_skip" ]]; then
      lean_ex="$lean_skip"
    elif [[ "$skip_lean" -eq 1 ]]; then
      lean_ex="skip_no_lake"
    else
      # Lean arm does not depend on cc.
      if [[ -n "$lean_skip" ]]; then lean_ex="$lean_skip"
      elif [[ "${lean_st:-1}" -ne 0 ]]; then lean_ex="fail"
      else lean_ex="ok"; fi
    fi
    if [[ $skip_no_cc -eq 1 && "$lean_ex" != "ok" ]]; then
      overall_line="**soft skip** (no cc; Lean arm ${lean_ex})"
    elif [[ $overall -eq 0 ]]; then
      overall_line="**ok** (measured arms exit 0; Boehm/Lean may soft-skip)"
    else
      overall_line="**fail** (one or more arms non-zero; partial report still useful)"
    fi
    size_rows=""
    for f in src/systems/emit/slake_freestanding.c src/systems/emit/slake_freestanding.h \
             out/freestanding-c/slake_freestanding.c out/freestanding-c/slake_freestanding.h; do
      if [[ -f "$root/$f" ]]; then
        b=$(wc -c <"$root/$f" | tr -d ' ')
        size_rows+="| $b | ${bt}${f}${bt} |"$'\n'
      fi
    done
    size_block="No freestanding .c/.h under emit/ or out/."
    if [[ -n "$size_rows" ]]; then
      size_block=$(printf '%s\n' "| Bytes | Path |" "|------:|------|" "${size_rows%$'\n'}")
    fi
    {
      echo "# Runtime freestanding bench -- operator question"
      echo
      echo "Generated: **${stamp_human}**"
      echo
      echo "Kind: **runtime** wall-clock + structural link honesty. Not a residual claim flip."
      echo "Not the compile-path suite (${bt}just bench${bt} / ${bt}doc/BENCH-latest.md${bt})."
      echo
      echo "## Question"
      echo
      echo "> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?"
      echo
      echo "## How much faster (this run)"
      echo
      echo "Plain American English from **median ns/op** this run. **Freestanding product path** is our approach (linear ownership; no GC library; no Lean managed runtime on the consumer link). Lower ns/op is faster. Multipliers use \"Nx faster\" / \"Nx slower\" (not bare ratios alone)."
      echo
      echo "### Mint/consume class"
      echo
      echo "- Freestanding is **${phrase_boehm}** than Boehm GC (free **${free_ns}** ns/op vs Boehm **${boehm_ns}** ns/op; exit **${boehm_ex}**)."
      echo "- Freestanding is **${phrase_lean}** than Lean managed runtime (free **${free_ns}** ns/op vs lean **${lean_ns}** ns/op; free N=**${free_n}**, lean N=**${lean_n}**; exit **${lean_ex}**). Labeled contrast only; not the same C IR."
      echo "- Freestanding is **${phrase_heap}** than heap_churn (malloc/free **allocator** baseline) on this mint microbench (free **${free_ns}** ns/op vs heap **${gc_ns}** ns/op). ${heap_honest_note}"
      echo "- Freestanding is **${phrase_stack}** than the smoke-only **stack live-flag twin** (same id+live+state protocol; **not product wire**) (free **${free_ns}** ns/op vs stack-twin **${stack_ns}** ns/op). This is the protocol C bar, not malloc."
      echo
      echo "### Compose class"
      echo
      echo "- Freestanding compose is **${phrase_compose}** than compose heap_churn (allocator) (free-compose **${fcomp_ns}** ns/op vs gcomp **${gcomp_ns}** ns/op). Do **not** merge compose ns/op with mint ns/op. Do **not** treat heap_churn as the same fail-closed protocol."
      echo "- Freestanding compose is **${phrase_shape}** than the smoke-only **fail_closed_shape** twin (stack 8+16, same 3+2 graph, well-typed + pre-scan + extract + post; **not product wire**) (free-compose **${fcomp_ns}** ns/op vs fail_closed_shape **${shape_ns}** ns/op)."
      echo
      echo "### Flags (this suite vs contrast)"
      echo
      echo "- Default suite timing-link CFLAGS: **${bt}-O3 -flto${bt}** (this table). Structural freestanding-first ${bt}-c${bt} stays **${bt}-O2 -ffreestanding -nostdlib${bt}** (not ${bt}BENCH_RUNTIME_CFLAGS${bt})."
      echo "- ${bt}-O3${bt} (no LTO) mint+compose cells: recipe ${bt}just bench-runtime-flag-matrix-honesty${bt} or ${bt}BENCH_RUNTIME_CFLAGS=\"-O3\"${bt} on named arms. Table below when ${bt}doc/bench-history/flag-matrix-honesty-latest.tsv${bt} is present. Not the consumer default. Not ${bt}just build${bt}."
      echo
      echo "### Headline"
      echo
      echo "| Baseline | Freestanding vs baseline | median ns/op free | median ns/op baseline |"
      echo "|----------|--------------------------|------------------:|----------------------:|"
      echo "| Boehm GC | **${phrase_boehm}** | ${free_ns} | ${boehm_ns} |"
      echo "| Lean managed runtime | **${phrase_lean}** | ${free_ns} | ${lean_ns} |"
      echo "| heap_churn (malloc allocator) | **${phrase_heap}** | ${free_ns} | ${gc_ns} |"
      echo "| stack live-flag twin (protocol; not product wire) | **${phrase_stack}** | ${free_ns} | ${stack_ns} |"
      echo "| compose heap_churn (allocator) | **${phrase_compose}** | ${fcomp_ns} | ${gcomp_ns} |"
      echo "| compose fail_closed_shape (protocol; not product wire) | **${phrase_shape}** | ${fcomp_ns} | ${shape_ns} |"
      echo
      echo "## Short answer (structure)"
      echo
      echo "- **No GC / no Lean runtime** on freestanding consumer paths: R-free and R-free-compose link product wire C + small smoke only. Structural freestanding-first ${bt}-c${bt}; ${bt}ldd${bt}/${bt}nm${bt} without leanshared/libgc when tools exist."
      echo "- **PROVABLY is not speed:** CompCert product seal (${bt}just product-compcert-matrix${bt}) is wire correctness, not \"fastest C on Earth.\""
      echo "- Full number tables below. Speed is empirical per job class, N, and machine. Raw ratios (baseline/free): mint heap **${ratio_mint}**, mint stack-twin **${ratio_stack}**, Boehm **${ratio_boehm}**, lean **${ratio_lean}**, compose heap **${ratio_compose}**, compose fail_closed_shape **${ratio_shape}**."
      echo "- **HostCost** Nat bounds (extract fuse, grade looks) are **not** nanoseconds. **PROVABLY** is CompCert wire correctness, not speed."
      echo
      echo "## Verdict (one sentence)"
      echo
      echo "Freestanding is **${phrase_boehm}** than Boehm and **${phrase_lean}** than Lean managed on mint-class this run, with **no GC and no Lean RT** on the freestanding link; vs heap_churn (allocator) **${phrase_heap}** (mint) and **${phrase_compose}** (compose); vs protocol twins **${phrase_stack}** (stack live-flag) and **${phrase_shape}** (fail_closed_shape). PROVABLY seals correctness only."
      echo
      echo "## Numbers -- mint/consume v1"
      echo
      echo "Job class: acquire/release-once token protocol. N default **${n}** (override ${bt}BENCH_RUNTIME_N${bt}). Measured runs per arm **${runs}** after one outer discard + in-driver warmup. Spread columns: **min/max/stdev** of ns/op across measured runs (first sample dropped when multi-run; sample stdev when runs>=2 after drop)."
      echo
      echo "| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |"
      echo "|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|"
      if [[ $skip_no_cc -eq 1 ]]; then
        echo "| R-free (linear freestanding) | skip_no_cc | - | - | - | - | - | - | - | - |"
        echo "| R-gc-shape (malloc/free heap_churn) | skip_no_cc | - | - | - | - | - | - | - | - |"
        echo "| R-stack-twin (stack live-flag; not product wire) | skip_no_cc | - | - | - | - | - | - | - | - |"
        echo "| R-boehm (GC_MALLOC/GC_FREE) | skip_no_cc | - | - | - | - | - | - | - | - |"
      else
        echo "| R-free (linear freestanding) | ${free_ex} | ${free_ns} | ${free_ns_mean} | ${free_ns_min} | ${free_ns_max} | ${free_ns_stdev} | ${free_wall} | ${free_ops} | ${free_real} |"
        echo "| R-gc-shape (malloc/free heap_churn) | ${gc_ex} | ${gc_ns} | ${gc_ns_mean} | ${gc_ns_min} | ${gc_ns_max} | ${gc_ns_stdev} | ${gc_wall} | ${gc_ops} | ${gc_real} |"
        echo "| R-stack-twin (stack live-flag; not product wire) | ${stack_ex} | ${stack_ns} | ${stack_ns_mean} | ${stack_ns_min} | ${stack_ns_max} | ${stack_ns_stdev} | ${stack_wall} | ${stack_ops} | ${stack_real} |"
        echo "| R-boehm (GC_MALLOC/GC_FREE) | ${boehm_ex} | ${boehm_ns} | ${boehm_ns_mean} | ${boehm_ns_min} | ${boehm_ns_max} | ${boehm_ns_stdev} | ${boehm_wall} | ${boehm_ops} | ${boehm_real} |"
      fi
      echo
      echo "| Comparison (mint/consume only) | Value |"
      echo "|--------------------------------|-------|"
      echo "| Ratio heap_churn / freestanding ns/op (allocator) | **${ratio_mint}** |"
      echo "| Ratio stack_twin / freestanding ns/op (protocol) | **${ratio_stack}** |"
      echo "| Ratio boehm_gc / freestanding ns/op | **${ratio_boehm}** |"
      echo "| N (ops per timed process) | free=${free_n} / gc-shape=${gc_n} / stack-twin=${stack_n} / boehm=${boehm_n} |"
      echo
      echo "## Numbers -- Lean managed runtime contrast"
      echo
      echo "Job class: mint_consume-class **logical** protocol under classic Lean managed runtime (allocate small structure, discard; GC path). **Not** the same C IR as freestanding. N default **${ln}** (override ${bt}BENCH_RUNTIME_LEAN_N${bt}). Timed step is **process run** after untimed warm ${bt}lake build${bt} (not cold full-package elaborate)."
      echo
      echo "| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |"
      echo "|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|"
      echo "| R-lean (Lean managed runtime) | ${lean_ex} | ${lean_ns} | ${lean_ns_mean} | ${lean_ns_min} | ${lean_ns_max} | ${lean_ns_stdev} | ${lean_wall} | ${lean_ops} | ${lean_real} |"
      echo
      echo "| Comparison (mint-class labeled) | Value |"
      echo "|----------------------------------|-------|"
      echo "| Ratio lean_managed / freestanding ns/op | **${ratio_lean}** |"
      echo "| N freestanding mint | ${free_n} |"
      echo "| N Lean managed | ${lean_n} |"
      echo "| Note | Do **not** merge ns/op across different N without labels; not freestanding C |"
      echo
      echo "## Numbers -- compose-class"
      echo
      echo "Job class: build small IR/host-compose graph each op (push nodes, edges, mint, mark, check, extract, consume) vs malloc node-list + free. N default **${cn}** (override ${bt}BENCH_RUNTIME_COMPOSE_N${bt}). **Different job from mint/consume; do not merge ns/op.**"
      echo
      echo "| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |"
      echo "|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|"
      if [[ $skip_no_cc -eq 1 ]]; then
        echo "| R-free-compose (host_compose freestanding) | skip_no_cc | - | - | - | - | - | - | - | - |"
        echo "| R-gc-shape-compose (malloc node list) | skip_no_cc | - | - | - | - | - | - | - | - |"
        echo "| R-fail-closed-shape (stack protocol; not product wire) | skip_no_cc | - | - | - | - | - | - | - | - |"
      else
        echo "| R-free-compose (host_compose freestanding) | ${fcomp_ex} | ${fcomp_ns} | ${fcomp_ns_mean} | ${fcomp_ns_min} | ${fcomp_ns_max} | ${fcomp_ns_stdev} | ${fcomp_wall} | ${fcomp_ops} | ${fcomp_real} |"
        echo "| R-gc-shape-compose (malloc node list) | ${gcomp_ex} | ${gcomp_ns} | ${gcomp_ns_mean} | ${gcomp_ns_min} | ${gcomp_ns_max} | ${gcomp_ns_stdev} | ${gcomp_wall} | ${gcomp_ops} | ${gcomp_real} |"
        echo "| R-fail-closed-shape (stack protocol; not product wire) | ${shape_ex} | ${shape_ns} | ${shape_ns_mean} | ${shape_ns_min} | ${shape_ns_max} | ${shape_ns_stdev} | ${shape_wall} | ${shape_ops} | ${shape_real} |"
      fi
      echo
      echo "| Comparison (compose only) | Value |"
      echo "|---------------------------|-------|"
      echo "| Ratio heap_churn_compose / freestanding_compose ns/op (allocator) | **${ratio_compose}** |"
      echo "| Ratio fail_closed_shape / freestanding_compose ns/op (protocol) | **${ratio_shape}** |"
      echo "| N (ops per timed process) | free-compose=${fcomp_n} / gc-compose=${gcomp_n} / fail_closed_shape=${shape_n} |"
      echo "| Primary cold arm | unchanged (full re-init each op; extract not skipped) |"
      echo
      echo "### Compose stage timers (R-free-compose attribution)"
      echo
      echo "Smoke-side only (separate pass after primary whole-op timing). Product wire has **no** always-on timers. Default ON; set ${bt}BENCH_RUNTIME_STAGE_TIMERS=0${bt} to skip. Cap stage N with ${bt}BENCH_RUNTIME_STAGE_N${bt} (default min(compose N, 200000)). Stage keys: init, push_nodes, edges, mint, mark, well_typed, check_fail_closed, extract, consume, post_check."
      echo
      echo "| Stage / group | ns/op (stage pass) |"
      echo "|---------------|-------------------:|"
      echo "| stage_N | ${fcomp_st_n} |"
      echo "| init | ${fcomp_st_init} |"
      echo "| push_nodes | ${fcomp_st_push} |"
      echo "| edges | ${fcomp_st_edges} |"
      echo "| mint | ${fcomp_st_mint} |"
      echo "| mark | ${fcomp_st_mark} |"
      echo "| well_typed | ${fcomp_st_wt} |"
      echo "| check_fail_closed | ${fcomp_st_cfc} |"
      echo "| extract | ${fcomp_st_ext} |"
      echo "| consume | ${fcomp_st_con} |"
      echo "| post_check | ${fcomp_st_post} |"
      echo "| group setup (init+push+edges) | ${fcomp_st_gsetup} |"
      echo "| group mint_mark | ${fcomp_st_gmint} |"
      echo "| group check (well_typed+fail_closed+post) | ${fcomp_st_gcheck} |"
      echo "| group extract_consume | ${fcomp_st_gex} |"
      echo
      echo "stage_timers flag from last measured process: **${fcomp_stage_timers}**. Stage ns includes ${bt}clock_gettime${bt} overhead; use for relative attribution, not absolute product claim."
      echo
      echo "## Structural evidence (R-free mint + compose)"
      echo
      echo "| Check | R-free (mint) | R-free-compose |"
      echo "|-------|---------------|----------------|"
      echo "| Freestanding-first wire ${bt}-c${bt} | ${free_mode} | ${fcomp_mode} |"
      echo "| Link line | ${free_link} | ${fcomp_link} |"
      echo "| Binary size note | ${free_bin} | ${fcomp_bin} |"
      echo "| No Lean runtime / no libgc | ${free_nort} | ${fcomp_nort} |"
      echo "| Linear / compose contract | in-driver untimed | in-driver untimed |"
      echo
      echo "### Boehm structural contrast"
      echo
      echo "| Check | Result |"
      echo "|-------|--------|"
      echo "| Boehm arm exit | ${boehm_ex} |"
      echo "| libgc in Boehm binary ldd | ${boehm_hasgc} |"
      echo "| R-free still no libgc | ${free_nort} |"
      echo "| Baseline name | ${bt}boehm_gc${bt} (not heap_churn) |"
      echo
      echo "### Lean managed runtime structural contrast"
      echo
      echo "| Check | Result |"
      echo "|-------|--------|"
      echo "| Lean arm exit | ${lean_ex} |"
      echo "| Lean RT evidence (ldd shared or embedded lean_*) | ${lean_hasrt} |"
      echo "| R-lean binary size note | ${lean_bin} |"
      echo "| R-free still no leanshared/libgc | ${free_nort} |"
      echo "| Baseline name | ${bt}lean_managed_runtime${bt} (not freestanding C IR) |"
      echo
      echo "### Product wire sizes"
      echo
      printf '%s\n' "$size_block"
      echo
      echo "## How to re-run"
      echo
      echo "${bt}${bt}${bt}bash"
      echo "just bench-runtime"
      echo "# arms: just bench-runtime-freestanding | just bench-runtime-gcshape"
      echo "#        just bench-runtime-stack-twin"
      echo "#        just bench-runtime-freestanding-compose | just bench-runtime-gcshape-compose"
      echo "#        just bench-runtime-fail-closed-shape"
      echo "#        just bench-runtime-boehm | just bench-runtime-lean"
      echo "# calibrate mint: BENCH_RUNTIME_N=10000000 BENCH_RUNTIME_RUNS=5 just bench-runtime"
      echo "# calibrate compose: BENCH_RUNTIME_COMPOSE_N=5000000 just bench-runtime"
      echo "# calibrate lean: BENCH_RUNTIME_LEAN_N=5000000 just bench-runtime"
      echo "# stage timers off: BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose"
      echo "# stage N cap: BENCH_RUNTIME_STAGE_N=50000 just bench-runtime-freestanding-compose"
      echo "# timing-link flags (default -O3 -flto E4+LTO): BENCH_RUNTIME_CFLAGS=\"-O3\" just bench-runtime-freestanding"
      echo "# flag matrix (T3 mint R-free): just bench-runtime-flag-matrix"
      echo "# flag matrix honesty (mint+compose -O3 and -O3 -flto): just bench-runtime-flag-matrix-honesty"
      echo "#   BENCH_RUNTIME_CFLAGS=\"-O3\" just bench-runtime-freestanding"
      echo "# snapshot history (T5): just bench-runtime-snapshot"
      echo "# regression vs tip baseline (T6 opt-in; default suite never fails CI):"
      echo "#   just bench-runtime-regress"
      echo "#   BENCH_RUNTIME_REGRESS=1 just bench-runtime"
      echo "#   BENCH_RUNTIME_REGRESS_PCT=10 BENCH_RUNTIME_REGRESS_MODE=warn just bench-runtime-regress"
      echo "# host perf attach (T7; soft-skip no perf): just bench-runtime-perf-mint | bench-runtime-perf-compose"
      echo "# compose micro hot path (T9; cold remains primary): just bench-runtime-freestanding-compose-micro"
      echo "#   BENCH_RUNTIME_COMPOSE_MICRO=1 just bench-runtime-freestanding-compose"
      echo "${bt}${bt}${bt}"
      echo
      echo "## Machine"
      echo
      echo "| Item | Value |"
      echo "|------|-------|"
      echo "| Hostname | ${host_name} |"
      echo "| uname -srm | ${uname_srm} |"
      echo "| nproc | ${nproc_n} |"
      echo "| cc --version | ${cc_v} |"
      echo "| CFLAGS | ${bt}-std=c11${bt} + ${bt}BENCH_RUNTIME_CFLAGS${bt} (default ${bt}-O3 -flto${bt} E4+LTO; hosted timing link only; freestanding-first ${bt}-c${bt} separate fixed) |"
      echo
      echo "## Methods (short)"
      echo
      echo "| Arm | Job class | Workload | Link |"
      echo "|-----|-----------|----------|------|"
      echo "| R-free | mint_consume | ${bt}slake_consume_token_mint${bt} then ${bt}slake_consume_token_consume${bt} | emit + smoke |"
      echo "| R-gc-shape | mint_consume | malloc payload then free (heap_churn allocator) | driver only |"
      echo "| R-stack-twin | mint_consume | stack id+live+state mint/consume (protocol twin; **not product wire**) | driver only |"
      echo "| R-boehm | mint_consume | ${bt}GC_MALLOC${bt} then ${bt}GC_FREE${bt} (boehm_gc) | driver + ${bt}-lgc${bt} |"
      echo "| R-lean | mint_consume | Lean mint ByteArray discard (lean_managed_runtime) | lake exe; Lean RT shared or embedded |"
      echo "| R-free-compose | compose | host_compose init/push/edge/mint/mark/check/extract/consume (primary cold) | emit + smoke |"
      echo "| R-gc-shape-compose | compose | malloc node list + edges + token; free all each op (heap_churn) | driver only |"
      echo "| R-fail-closed-shape | compose | stack 8+16 well-typed + pre-scan + extract + post (**fail_closed_shape**; not product wire) | driver only |"
      echo
      echo "Baselines are named honestly: **heap_churn** (allocator), **stack live-flag twin** / **fail_closed_shape** (protocol; not product wire), **boehm_gc**, **lean_managed_runtime**. Lean is not freestanding C IR."
      echo
      echo "**Spread formula (T2):** for each arm, collect ${bt}ns_per_op=${bt} lines; if 2+ samples drop the first (outer discard noise); report min, max, median, mean, and sample standard deviation (sqrt of sum((x-mean)^2)/(n-1) when n>=2 after drop). Default ${bt}BENCH_RUNTIME_RUNS=3${bt}; raise for tighter stdev."
      echo
      echo "**Stage timers (T1):** freestanding compose driver only; separate stage pass after primary whole-op loop; keys ${bt}stage_ns_per_op_*${bt} and group rollups; product wire never always-on."
      echo
      echo "**Machine-readable metrics (T4):** suite also writes ${bt}doc/BENCH-RUNTIME-metrics.tsv${bt} (tab-separated; one row per arm; soft-skips as exit status). Human markdown remains primary."
      echo
      echo "**Flag matrix (T3) / E4+LTO policy:** ${bt}just bench-runtime-flag-matrix${bt} or ${bt}BENCH_RUNTIME_CFLAGS${bt} on arms. Compares timing-link ${bt}-O2${bt} vs ${bt}-O3${bt} vs ${bt}-O3 -flto${bt} for R-free mint. **Honesty cells (mint+compose):** ${bt}just bench-runtime-flag-matrix-honesty${bt} writes ${bt}doc/bench-history/flag-matrix-honesty-latest.tsv${bt} (${bt}-O3${bt} and ${bt}-O3 -flto${bt} for R-free, heap, stack-twin, compose, heap compose, fail_closed_shape). Structural freestanding-first ${bt}-c${bt} unchanged (${bt}-O2 -ffreestanding -nostdlib${bt}). **Default suite timing link is ${bt}-O3 -flto${bt}**. Override ${bt}BENCH_RUNTIME_CFLAGS=\"-O3\"${bt} if LTO link fails. Not ${bt}just build${bt}. Research: ${bt}doc/dev/research/runtime-flag-matrix-2026-08-12.md${bt}."
      echo
      echo "### Flag-matrix honesty cells (${bt}-O3${bt} and ${bt}-O3 -flto${bt})"
      echo
      echo "Reproduce: ${bt}just bench-runtime-flag-matrix-honesty${bt} (calibrate ${bt}BENCH_RUNTIME_FLAG_MATRIX_N${bt} / ${bt}BENCH_RUNTIME_FLAG_MATRIX_COMPOSE_N${bt}). Default suite numbers above are **${bt}-O3 -flto${bt}** only."
      hon_tsv="$root/doc/bench-history/flag-matrix-honesty-latest.tsv"
      if [[ -f "$hon_tsv" ]]; then
        echo
        echo "| stamp | flags | arm | exit | N | ns_median | ns_mean | ns_min | ns_max | status |"
        echo "|-------|-------|-----|------|--:|----------:|--------:|-------:|-------:|--------|"
        tail -n +2 "$hon_tsv" | awk -F'\t' '{printf "| %s | `%s` | %s | %s | %s | %s | %s | %s | %s | %s |\n", $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}'
      else
        echo
        echo "No ${bt}flag-matrix-honesty-latest.tsv${bt} yet. Run ${bt}just bench-runtime-flag-matrix-honesty${bt} once to publish ${bt}-O3${bt} contrast cells next to this suite."
      fi
      echo
      echo "**Baseline snapshot (T5):** living latest and metrics still **overwrite** on each suite. Durable stamped copies: ${bt}just bench-runtime-snapshot${bt} -> ${bt}doc/bench-history/<stamp>/${bt} plus tip ${bt}doc/BENCH-RUNTIME-baseline.tsv${bt}. Refresh: re-run suite then snapshot."
      echo
      echo "**Structural no-GC gate (T8):** freestanding arms print ${bt}structural_gate=pass${bt} (or ${bt}fail_ldd${bt}/${bt}fail_nm${bt} with matched lines). Soft-skip ldd/nm when tools missing. Not part of default ${bt}just check${bt}."
      echo
      echo "**Runtime regression (T6):** compare living ${bt}doc/BENCH-RUNTIME-metrics.tsv${bt} median ns/op to tip ${bt}doc/BENCH-RUNTIME-baseline.tsv${bt} (or ${bt}BENCH_RUNTIME_REGRESS_BASELINE${bt}). Recipe ${bt}just bench-runtime-regress${bt}. Defaults: ${bt}BENCH_RUNTIME_REGRESS_PCT=10${bt} (fail if current > baseline by more than 10%); ${bt}BENCH_RUNTIME_REGRESS_MODE=fail${bt} or ${bt}warn${bt}. Soft-skip if baseline missing. **Default ${bt}just bench-runtime${bt} does not run this and never hard-fails CI on regression**; set ${bt}BENCH_RUNTIME_REGRESS=1${bt} to opt in after the suite writes metrics. Not in ${bt}just check${bt}."
      echo
      echo "**Host perf attach (T7):** ${bt}just bench-runtime-perf-mint${bt} / ${bt}just bench-runtime-perf-compose${bt} run ${bt}perf stat${bt} on freestanding binaries; optional ${bt}BENCH_RUNTIME_PERF_RECORD=1${bt} for ${bt}perf record -g${bt}. Soft-skip ${bt}skip_no_perf${bt}. No always-on product wire."
      echo
      echo "**Compose micro (T9):** ${bt}BENCH_RUNTIME_COMPOSE_MICRO=1${bt} or ${bt}just bench-runtime-freestanding-compose-micro${bt} reuses the compose shell (setup once; remint/check/extract/consume hot loop). **Cold full re-init each op remains the primary product-shape arm** in the default suite. Micro is hot-path measurement only; do not merge cold vs micro ns/op without labels. Research: ${bt}doc/dev/research/runtime-regression-perf-micro-2026-08-12.md${bt}."
      echo
      echo "## Limits"
      echo
      echo "- Not \"fastest C on Earth\" or all programs. Workloads are mint/consume, compose-class, and Lean managed mint-class only."
      echo "- Lean arm is **not** the same C IR as freestanding; it answers cost of a similar logical protocol under Lean managed runtime."
      echo "- Lean arm times process **run** after untimed warm lake build -- not cold full-package elaborate (that is compile-path secondary)."
      echo "- Speed is empirical on this machine; re-run for your host. Document N per arm; never merge unlabeled N."
      echo "- **PROVABLY** (CompCert seal) is **correctness**, not a speed proof."
      echo "- free / complete / FullHost / full parity are **not** flipped by this bench."
      echo "- Never merge ns/op across mint/consume vs compose without labels."
      echo
      echo "## Secondary suite (different question)"
      echo
      echo "Compile-path wall-clock (emit vs Lake elaborate) lives under ${bt}just bench${bt} and ${bt}doc/BENCH-latest.md${bt}. That suite **does not answer** the linear / no-GC / fastest **runtime** question."
      echo
      echo "## Paths"
      echo
      echo "| What | Path |"
      echo "|------|------|"
      echo "| This report | ${bt}doc/BENCH-RUNTIME-latest.md${bt} |"
      echo "| Machine-readable metrics (TSV) | ${bt}doc/BENCH-RUNTIME-metrics.tsv${bt} |"
      echo "| Baseline tip (T5 snapshot) | ${bt}doc/BENCH-RUNTIME-baseline.tsv${bt} |"
      echo "| Stamped history | ${bt}doc/bench-history/${bt} |"
      echo "| Flag matrix TSV | ${bt}doc/bench-history/flag-matrix-latest.tsv${bt} |"
      echo "| Full transcript | ${bt}${log}${bt} |"
      echo "| Research note | ${bt}doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md${bt} |"
      echo "| Flag matrix research | ${bt}doc/dev/research/runtime-flag-matrix-2026-08-12.md${bt} |"
      echo "| T6/T7/T9 research | ${bt}doc/dev/research/runtime-regression-perf-micro-2026-08-12.md${bt} |"
      echo "| Recipes | ${bt}just/bench-runtime.just${bt} (arms + flag matrix + regress + perf + micro) + ${bt}just/bench-runtime-twins.just${bt} (stack twin, fail_closed_shape, honesty matrix) + ${bt}just/bench-runtime-report.just${bt} (suite/report/snapshot) |"
      echo "| Drivers | ${bt}src/systems/smoke/slake_runtime_bench_*.c${bt} |"
      echo "| Lean measurement | ${bt}SystemsLean.RuntimeBenchLean${bt} / ${bt}slake-runtime-bench-lean${bt} |"
      echo "| Secondary compile report | ${bt}doc/BENCH-latest.md${bt} |"
      echo
      echo "## Overall exit"
      echo
      echo "$overall_line"
      echo
    } >"$report"
    # T4: stable machine-readable metrics beside living markdown (soft-skip arms ok).
    metrics="$root/doc/BENCH-RUNTIME-metrics.tsv"
    {
      printf '%s\n' "stamp	arm	exit	job_class	N	ns_median	ns_mean	ns_min	ns_max	ns_stdev	wall_median	ops_mean	outer_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-free" "$free_ex" "mint_consume" "$free_n" \
        "$free_ns" "$free_ns_mean" "$free_ns_min" "$free_ns_max" "$free_ns_stdev" \
        "$free_wall" "$free_ops" "$free_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-gc-shape" "$gc_ex" "mint_consume" "$gc_n" \
        "$gc_ns" "$gc_ns_mean" "$gc_ns_min" "$gc_ns_max" "$gc_ns_stdev" \
        "$gc_wall" "$gc_ops" "$gc_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-stack-twin" "$stack_ex" "mint_consume" "$stack_n" \
        "$stack_ns" "$stack_ns_mean" "$stack_ns_min" "$stack_ns_max" "$stack_ns_stdev" \
        "$stack_wall" "$stack_ops" "$stack_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-boehm" "$boehm_ex" "mint_consume" "$boehm_n" \
        "$boehm_ns" "$boehm_ns_mean" "$boehm_ns_min" "$boehm_ns_max" "$boehm_ns_stdev" \
        "$boehm_wall" "$boehm_ops" "$boehm_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-lean" "$lean_ex" "mint_consume" "$lean_n" \
        "$lean_ns" "$lean_ns_mean" "$lean_ns_min" "$lean_ns_max" "$lean_ns_stdev" \
        "$lean_wall" "$lean_ops" "$lean_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-free-compose" "$fcomp_ex" "compose" "$fcomp_n" \
        "$fcomp_ns" "$fcomp_ns_mean" "$fcomp_ns_min" "$fcomp_ns_max" "$fcomp_ns_stdev" \
        "$fcomp_wall" "$fcomp_ops" "$fcomp_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-gc-shape-compose" "$gcomp_ex" "compose" "$gcomp_n" \
        "$gcomp_ns" "$gcomp_ns_mean" "$gcomp_ns_min" "$gcomp_ns_max" "$gcomp_ns_stdev" \
        "$gcomp_wall" "$gcomp_ops" "$gcomp_real"
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$stamp" "R-fail-closed-shape" "$shape_ex" "compose" "$shape_n" \
        "$shape_ns" "$shape_ns_mean" "$shape_ns_min" "$shape_ns_max" "$shape_ns_stdev" \
        "$shape_wall" "$shape_ops" "$shape_real"
    } >"$metrics"
    echo | tee -a "$log"
    echo "bench-runtime: wrote $report" | tee -a "$log"
    echo "bench-runtime: wrote $metrics" | tee -a "$log"
    echo "bench-runtime: full log $log" | tee -a "$log"
    if [[ $skip_no_cc -eq 1 ]]; then
      echo "bench-runtime: soft skip (no cc)" | tee -a "$log"
      rm -rf "$cap"
      exit 0
    fi
    # T6 opt-in only: default suite never hard-fails on regression vs baseline.
    if [[ "${BENCH_RUNTIME_REGRESS:-0}" == "1" ]]; then
      echo "-- opt-in T6 bench-runtime-regress (BENCH_RUNTIME_REGRESS=1) --" | tee -a "$log"
      set +e
      just bench-runtime-regress >>"$log" 2>&1
      reg_st=$?
      set -u
      if [[ $reg_st -ne 0 ]]; then
        overall=1
        echo "bench-runtime: regression check FAILED exit=$reg_st" | tee -a "$log"
      else
        echo "bench-runtime: regression check ok or soft-skip" | tee -a "$log"
      fi
    fi
    if [[ $overall -eq 0 ]]; then echo "bench-runtime: overall ok" | tee -a "$log"
    else echo "bench-runtime: overall fail (see results table)" | tee -a "$log"; fi
    rm -rf "$cap"
    exit "$overall"

# ---------------------------------------------------------------------------
# T5: living baseline snapshot store
# Living doc/BENCH-RUNTIME-latest.md and metrics.tsv still overwrite on suite.
# This recipe copies current metrics (+ optional latest markdown) to a stamped
# durable path under doc/bench-history/ and refreshes the tip baseline TSV.
# Greppable: bench-runtime-snapshot, BENCH-RUNTIME-baseline, bench-history
# Refresh: just bench-runtime && just bench-runtime-snapshot
# ---------------------------------------------------------------------------
bench-runtime-snapshot:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    dest="$root/doc/bench-history/${stamp}"
    metrics="$root/doc/BENCH-RUNTIME-metrics.tsv"
    latest="$root/doc/BENCH-RUNTIME-latest.md"
    tip="$root/doc/BENCH-RUNTIME-baseline.tsv"
    mkdir -p "$dest" "$root/doc/bench-history"
    if [[ ! -f "$metrics" ]]; then
      echo "error: missing $metrics; run just bench-runtime first" >&2
      exit 1
    fi
    cp -a "$metrics" "$dest/BENCH-RUNTIME-metrics.tsv"
    cp -a "$metrics" "$tip"
    if [[ -f "$latest" ]]; then
      cp -a "$latest" "$dest/BENCH-RUNTIME-latest.md"
    fi
    {
      echo "stamp: $stamp"
      echo "source_metrics: doc/BENCH-RUNTIME-metrics.tsv"
      echo "source_report: doc/BENCH-RUNTIME-latest.md"
      echo "tip_baseline: doc/BENCH-RUNTIME-baseline.tsv"
      echo
      echo "Living latest and metrics still overwrite on each just bench-runtime."
      echo "This directory is a durable snapshot of medians at stamp time."
      echo
      echo "Refresh:"
      echo "  just bench-runtime"
      echo "  just bench-runtime-snapshot"
      echo
      echo "Not part of default just check. Optional for T6 regression later."
    } >"$dest/README.txt"
    if [[ ! -f "$root/doc/bench-history/README.md" ]]; then
      {
        echo "# Runtime bench history"
        echo
        echo "Stamped snapshots of freestanding runtime suite metrics."
        echo
        echo "| Path | Role |"
        echo "|------|------|"
        echo "| \`doc/BENCH-RUNTIME-latest.md\` | Living human report (overwrites each suite) |"
        echo "| \`doc/BENCH-RUNTIME-metrics.tsv\` | Living arm medians TSV (overwrites each suite) |"
        echo "| \`doc/BENCH-RUNTIME-baseline.tsv\` | Tip baseline (last snapshot) |"
        echo "| \`doc/bench-history/<stamp>/\` | Durable copy of metrics (+ report when present) |"
        echo "| \`doc/bench-history/flag-matrix-*.tsv\` | T3 flag matrix cells |"
        echo
        echo "Refresh snapshot: \`just bench-runtime && just bench-runtime-snapshot\`."
        echo "Flag matrix: \`just bench-runtime-flag-matrix\`."
        echo
        echo "Not gated by default \`just check\`. Speed is empirical; not PROVABLY."
      } >"$root/doc/bench-history/README.md"
    fi
    echo "bench-runtime-snapshot: wrote $dest"
    echo "bench-runtime-snapshot: tip baseline $tip"
    echo "bench-runtime-snapshot: done"
