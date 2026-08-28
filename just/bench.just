# Modular just: just/bench.just -- wall-clock timing (thin only).
# Kind: measurement process glue. Not residual invent. Not claim flips.
# No Python. No multi-hundred-line bash farms. No script/ mills.
# Timer: bash TIMEFORMAT matching time -p (real / user / sys).
# Greppable: bench, bench-hot-freestanding, bench-cold-freestanding,
# bench-without-lake-host, bench-lake-host, bench-compcert-matrix,
# bench-same-job, bench-same-job-contract, bench-phase-m, PHASE-M-BENCH.
# Secondary compile path: just bench -> doc/BENCH-latest.md + /tmp/systems-lean-bench-*.log
# Living report leads with one named job (host package elaborate) and both arms.
# Slake cannot do that job yet (full host package elaborate). Related times stay below.
# Does NOT answer operator runtime question (linear / no GC / fastest C).
# Primary runtime: just bench-runtime -> doc/BENCH-RUNTIME-latest.md (just/bench-runtime.just).
# Phase 2: suite runs hot lake twice (B-hot first + second pass).
# Research: doc/dev/research/hot-cold-benchmarks-2026-08-08.md
# Non-claims: freestanding C != classic Lean AOT; without-Lake != full elaborator;
# free/complete/PROVABLY not flipped by benches; Mult SSA partial != full backend.
# Note: no backtick chars in this justfile (just parses them as command sub).

_bench_timeformat := 'real %R user %U sys %S'

# Hot freestanding product wire (prebuilt writers; no lake on hot path).
# Greppable: bench-hot-freestanding
bench-hot-freestanding:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-hot-freestanding (just build; prebuilt writers; hot product wire) =="
    echo "non-claim: freestanding product wire != classic Lean managed-runtime AOT C"
    TIMEFORMAT='{{_bench_timeformat}}'
    { time just build; } 2>&1
    echo "bench-hot-freestanding: done"

# Cold freestanding: trash generated wire under emit/ and out/, then rebuild.
# Dated trash under /tmp (move, not rimraf). just build rewrites wire.
# Greppable: bench-cold-freestanding
bench-cold-freestanding:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    trash="/tmp/systems-lean-bench-cold-fs-${stamp}"
    mkdir -p "$trash/emit" "$trash/out"
    echo "== bench-cold-freestanding (trash generated wire; then just build) =="
    echo "trash: $trash (move only; not rimraf project trees)"
    for base in slake_freestanding.c slake_freestanding.h; do
      for dir in src/systems/emit out/freestanding-c; do
        path="$root/$dir/$base"
        if [[ -f "$path" ]]; then
          if [[ "$dir" == *emit* ]]; then mv -f "$path" "$trash/emit/$base"
          else mv -f "$path" "$trash/out/$base"; fi
          echo "  moved $dir/$base -> trash"
        else echo "  skip missing $dir/$base"; fi
      done
    done
    if [[ ! -f "$root/out/freestanding-c/README.md" ]]; then
      echo "error: missing out/freestanding-c/README.md (do not trash consumer README)" >&2
      exit 1
    fi
    TIMEFORMAT='{{_bench_timeformat}}'
    { time just build; } 2>&1
    echo "bench-cold-freestanding: done (wire restored by build; trash at $trash)"

# Hot without-Lake host tools (day-to-day develop; not full elaborator).
# Greppable: bench-without-lake-host
bench-without-lake-host:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-without-lake-host (import-graph + module-check + package-roots; no lake) =="
    echo "non-claim: without-Lake tools != full elaborator parity / FullHostElaborateRemains false"
    TIMEFORMAT='{{_bench_timeformat}}'
    echo "-- host-import-graph-without-lake --"
    { time just host-import-graph-without-lake; } 2>&1
    echo "-- host-module-check-without-lake --"
    { time just host-module-check-without-lake; } 2>&1
    echo "-- host-package-roots-without-lake --"
    { time just host-package-roots-without-lake; } 2>&1
    echo "bench-without-lake-host: done"

# Classic Lake host package probe (not a total wipe).
# First call may rebuild if package is stale; true idle hot is a second call
# when already Built (suite runs this recipe twice for B-hot first+second pass).
# Cold wipe: bench-lake-host-cold (optional; long).
# Greppable: bench-lake-host
bench-lake-host:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-lake-host (cd src/systems && lake build; first call may rebuild; second is idle hot when Built) =="
    echo "non-claim: classic Lake elaborates host Lean; freestanding C is a different product"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH" >&2; exit 1
    fi
    TIMEFORMAT='{{_bench_timeformat}}'
    { time (cd src/systems && lake build); } 2>&1
    echo "bench-lake-host: done"

# Optional cold Lake: trash src/systems/.lake to dated /tmp, then full lake build.
# Long. Trash/mv only (not rimraf). Not in default suite. Not CI gate.
# Greppable: bench-lake-host-cold
bench-lake-host-cold:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir=src/systems
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    trash="/tmp/systems-lean-bench-lake-cold-${stamp}"
    echo "== bench-lake-host-cold (trash .lake; full lake build; long) =="
    echo "trash: $trash (mv .lake only; not rimraf)"
    echo "recovery: (cd src/systems && lake build); just host-foundation-tools-clean-bootstrap"
    echo "  + just host-develop-tools-clean-bootstrap if needed; see wipe-recovery research"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH" >&2; exit 1
    fi
    if [[ ! -d "$systems_dir/.lake" ]]; then
      echo "warn: $systems_dir/.lake missing; measuring cold build on empty tree" >&2
    else
      mkdir -p "$trash"
      mv "$systems_dir/.lake" "$trash/.lake"
      echo "  moved $systems_dir/.lake -> $trash/.lake"
    fi
    TIMEFORMAT='{{_bench_timeformat}}'
    { time (cd "$systems_dir" && lake build); } 2>&1
    echo "bench-lake-host-cold: done (trash kept at $trash)"

# CompCert product matrix wall-clock (ccomp smoke + full wire + Mult).
# Greppable: bench-compcert-matrix
bench-compcert-matrix:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "== bench-compcert-matrix (just product-compcert-matrix) =="
    TIMEFORMAT='{{_bench_timeformat}}'
    { time just product-compcert-matrix; } 2>&1
    if [[ -f out/freestanding-c/slake_freestanding.c ]]; then
      echo "-- sizes --"
      wc -c out/freestanding-c/slake_freestanding.c out/freestanding-c/slake_freestanding.h \
        src/systems/emit/slake_freestanding.c src/systems/emit/slake_freestanding.h 2>/dev/null || true
    fi
    echo "bench-compcert-matrix: done"

# Primary suite: short scenarios + two-arm compile path report + full log.
# Scenario order fixed: hot freestanding, without-Lake host, hot lake first
# pass, hot lake second pass (true idle hot when package already Built),
# CompCert matrix, cold freestanding. Skips bench-lake-host-cold.
# Greppable: bench, PHASE-M-BENCH, B-hot, second pass
# Report: doc/BENCH-latest.md | Log: /tmp/systems-lean-bench-<UTC-stamp>.log
bench:
    #!/usr/bin/env bash
    set -uo pipefail
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    stamp_human=$(date -u +'%Y-%m-%d %H:%M:%S UTC')
    log="/tmp/systems-lean-bench-${stamp}.log"
    report="$root/doc/BENCH-latest.md"
    cap=$(mktemp -d /tmp/systems-lean-bench-cap-XXXXXX)
    overall=0
    bt=$'\x60'
    : >"$log"
    echo "== just bench: host package elaborate (same named job) plus related different-job times ==" | tee -a "$log"
    echo "stamp: $stamp_human | log: $log | report: $report" | tee -a "$log"
    echo "skip: bench-lake-host-cold (run explicitly; trash .lake + long rebuild)" | tee -a "$log"
    echo | tee -a "$log"
    # Indexes: 0 hot-fs Arm A | 1 without-Lake Arm A
    #          2 hot lake first (Arm B; may be rebuild-heavy)
    #          3 hot lake second (Arm B true idle hot) | 4 CompCert seal | 5 cold-fs Arm A
    recipes=(bench-hot-freestanding bench-without-lake-host bench-lake-host bench-lake-host bench-compcert-matrix bench-cold-freestanding)
    labels=("hot freestanding" "without-Lake host" "hot lake first pass" "hot lake second pass" "CompCert matrix" "cold freestanding")
    ids=(hot-freestanding without-lake-host lake-host-first lake-host-second compcert-matrix cold-freestanding)
    status_list=(); real_list=(); user_list=(); sys_list=()
    for i in "${!ids[@]}"; do
      id="${ids[$i]}"; recipe="${recipes[$i]}"; label="${labels[$i]}"
      out="$cap/$id.out"; tfile="$cap/$id.time"
      echo "-- $recipe ($label) --" | tee -a "$log"
      TIMEFORMAT='{{_bench_timeformat}}'
      set +e
      { time just "$recipe" >"$out" 2>&1; } 2>"$tfile"
      st=$?
      set -u
      cat "$out" >>"$log"
      echo "(outer TIMEFORMAT for just $recipe)" >>"$log"
      cat "$tfile" >>"$log"
      echo >>"$log"
      if [[ $st -eq 0 ]]; then st_s=ok; else st_s=fail; overall=1; fi
      status_list+=("$st_s")
      real_v="?"; user_v="?"; sys_v="?"
      if [[ -s "$tfile" ]]; then
        line=$(grep -E '^real ' "$tfile" | tail -n1 || true)
        if [[ -n "${line:-}" ]]; then
          set -- $line
          real_v="${2:-?}"; user_v="${4:-?}"; sys_v="${6:-?}"
        fi
      fi
      real_list+=("$real_v"); user_list+=("$user_v"); sys_list+=("$sys_v")
      echo "  result: $st_s real=$real_v user=$user_v sys=$sys_v" | tee -a "$log"
    done
    host_name=$(hostname 2>/dev/null || echo unknown)
    uname_srm=$(uname -srm 2>/dev/null || echo unknown)
    nproc_n=$(nproc 2>/dev/null || echo "?")
    lake_v="(missing)"; lean_v="(missing)"
    if command -v lake >/dev/null 2>&1; then lake_v=$(lake --version 2>/dev/null | head -n1 || echo "(error)"); fi
    if command -v lean >/dev/null 2>&1; then lean_v=$(lean --version 2>/dev/null | head -n1 || echo "(error)"); fi
    wol_block="No nested real lines scraped under -- host- headers. See full log for per-tool nested times."
    if [[ -f "$cap/without-lake-host.out" ]]; then
      scraped=$(awk -v bt="$bt" '/^-- host-/ { hdr=$0; next } /^real / {
        if (hdr!="") { print "| " bt hdr bt " | " bt $0 bt " |"; hdr="" }
      }' "$cap/without-lake-host.out" 2>/dev/null || true)
      if [[ -n "${scraped:-}" ]]; then
        wol_block=$(printf '%s\n' "| Host recipe header | Nested time line |" "|--------------------|------------------|" "$scraped")
      fi
    fi
    size_block="No freestanding .c/.h under emit/ or out/ after suite."
    size_rows=""
    for f in src/systems/emit/slake_freestanding.c src/systems/emit/slake_freestanding.h \
             out/freestanding-c/slake_freestanding.c out/freestanding-c/slake_freestanding.h; do
      if [[ -f "$root/$f" ]]; then
        b=$(wc -c <"$root/$f" | tr -d ' ')
        size_rows+="| $b | ${bt}${f}${bt} |"$'\n'
      fi
    done
    if [[ -n "$size_rows" ]]; then
      size_block=$(printf '%s\n' "| Bytes | Path |" "|------:|------|" "${size_rows%$'\n'}")
    fi
    # Arm index map: 0 hot freestanding, 1 without-Lake, 2 lake first, 3 lake second, 4 CompCert, 5 cold freestanding
    a_hot_r="${real_list[0]}"; a_hot_u="${user_list[0]}"; a_hot_s="${sys_list[0]}"; a_hot_st="${status_list[0]}"
    a_wol_r="${real_list[1]}"; a_wol_u="${user_list[1]}"; a_wol_s="${sys_list[1]}"; a_wol_st="${status_list[1]}"
    b1_r="${real_list[2]}"; b1_u="${user_list[2]}"; b1_s="${sys_list[2]}"; b1_st="${status_list[2]}"
    b2_r="${real_list[3]}"; b2_u="${user_list[3]}"; b2_s="${sys_list[3]}"; b2_st="${status_list[3]}"
    seal_r="${real_list[4]}"; seal_u="${user_list[4]}"; seal_s="${sys_list[4]}"; seal_st="${status_list[4]}"
    a_cold_r="${real_list[5]}"; a_cold_u="${user_list[5]}"; a_cold_s="${sys_list[5]}"; a_cold_st="${status_list[5]}"
    if [[ $overall -eq 0 ]]; then overall_line="**ok** (all scenarios exit 0)"
    else overall_line="**fail** (one or more scenarios non-zero; partial report still useful)"; fi
    # Interpretation: same-job honesty only. Do not compute emit-versus-elaborate B/A.
    interp_lines=$(a_hot_r="$a_hot_r" a_cold_r="$a_cold_r" a_wol_r="$a_wol_r"       b1_r="$b1_r" b2_r="$b2_r" awk '
      function isnum(x) { return (x ~ /^[0-9]+(\.[0-9]+)?$/) }
      BEGIN {
        ah = ENVIRON["a_hot_r"]; ac = ENVIRON["a_cold_r"]
        aw = ENVIRON["a_wol_r"]
        b1 = ENVIRON["b1_r"]; b2 = ENVIRON["b2_r"]
        print "- Freestanding emit and Lake host elaborate are **different jobs**. This suite records both. It does not compute a B/A winner or multiplier across them."
        # First vs second Lake pass honesty (same named job)
        if (isnum(b1) && isnum(b2)) {
          printf "- **B-hot first pass** real %s s vs **B-hot second pass** real %s s. Second pass is the true idle hot package probe when the first pass already Built the package.\n", b1, b2
          if ((b1 + 0) > 10) {
            print "- **B-hot first pass looks rebuild-heavy** (real > 10 s). First pass is not a pure idle hot probe."
          }
        } else if (isnum(b1)) {
          printf "- **B-hot first pass** real %s s (second pass non-numeric: %s).\n", b1, b2
          if ((b1 + 0) > 10) {
            print "- **B-hot first pass looks rebuild-heavy** (real > 10 s)."
          }
        }
        # A-cold vs A-hot
        if (isnum(ac) && isnum(ah) && ah + 0 > 0) {
          cr = ac / ah
          printf "- **A-cold real** %s s vs **A-hot real** %s s (cold/hot = %.2f). Cold trashes generated wire then rebuilds; hot assumes writers already present.\n", ac, ah, cr
        } else if (isnum(ac) && isnum(ah)) {
          printf "- **A-cold real** %s s vs **A-hot real** %s s (ratio omitted: A-hot is zero).\n", ac, ah
        } else {
          printf "- A-cold / A-hot comparison skipped (non-numeric real: cold=%s hot=%s).\n", ac, ah
        }
        # without-Lake develop surface
        if (isnum(aw)) {
          printf "- **Without-Lake host total real** %s s is the day-to-day **develop surface** cost (import-graph + module-check + package-roots). It is **not** full elaborator parity.\n", aw
        } else {
          printf "- Without-Lake total skipped (non-numeric real: %s).\n", aw
        }
        print "- **Linear freestanding matter:** the product is garbage-collection-free freestanding C. Compile wall-clock does **not** prove runtime fastest C."
      }
    ')
    # Write report (no backticks in just source; bt is ASCII 0x60).
    if [[ "$b2_st" == "ok" && "$b2_r" != "?" ]]; then
      lake_same_r="$b2_r"; lake_same_u="$b2_u"; lake_same_s="$b2_s"; lake_same_note="hot second pass"
    else
      lake_same_r="$b1_r"; lake_same_u="$b1_u"; lake_same_s="$b1_s"; lake_same_note="first pass (second pass missing)"
    fi
    {
      echo "# Lake versus Slake -- same named job"
      echo
      echo "Generated: **${stamp_human}**"
      echo
      echo "Kind: wall-clock **same named job** on the compile-path develop-step, plus related different-job times. Not a residual claim flip. Not a token microbench."
      echo
      echo "## Same named job"
      echo
      echo "**Named job:** host package elaborate under ${bt}src/systems${bt} (hot ${bt}lake build${bt} when the package is already Built). This is the compile-path develop-step Lake actually runs for day-to-day host work."
      echo
      echo "| Arm | Result |"
      echo "|-----|--------|"
      echo "| **Lake** | ${lake_same_r} s real (user ${lake_same_u}, sys ${lake_same_s}; ${lake_same_note}; ${bt}just bench-lake-host${bt}) |"
      echo "| **Slake** | Slake cannot do this job yet: full host package elaborate. Missing classic Lean elaborator parity. ${bt}FullHostElaborateRemains${bt} stays false. |"
      echo
      echo "Slake day-to-day tools (import-graph, structural module-check, package-roots) are a **different job**. Freestanding product C emit (${bt}just build${bt}) is a product speed story. Lake does not emit that wire. This report does **not** claim Slake is faster than Lake on unlike jobs."
      echo
      echo "## Question"
      echo
      echo "The same named job is host package elaborate. Related tables below still record freestanding emit and without-Lake tools as **different jobs**, not as Lake-versus-Slake on that elaborate step. Not \"provably fastest C.\" Not full elaborator without Lake."
      echo
      echo "## Two arms defined (related; not the same named job)"
      echo
      echo "### Arm A -- Systems Lean product path"
      echo
      echo "| Scenario | Recipe | What it measures |"
      echo "|----------|--------|------------------|"
      echo "| hot freestanding | ${bt}just bench-hot-freestanding${bt} | Hot ${bt}just build${bt}: emit freestanding product wire with prebuilt writers (no lake on the step) |"
      echo "| without-Lake host | ${bt}just bench-without-lake-host${bt} | Day-to-day host tools without Lake (import-graph, module-check, package-roots) |"
      echo "| cold freestanding | ${bt}just bench-cold-freestanding${bt} | Trash generated wire under emit/ and out/, then ${bt}just build${bt} |"
      echo
      echo "### Arm B -- classic Lean 4 + Lake"
      echo
      echo "| Scenario | Recipe | What it measures |"
      echo "|----------|--------|------------------|"
      echo "| B-hot first pass | ${bt}just bench-lake-host${bt} | First suite ${bt}lake build${bt}; may be rebuild-heavy if package was stale |"
      echo "| B-hot second pass | ${bt}just bench-lake-host${bt} (again) | True idle hot when package already Built after first pass |"
      echo
      echo "### Seal (related, not either arm's compile-product synonym)"
      echo
      echo "| Scenario | Recipe | What it measures |"
      echo "|----------|--------|------------------|"
      echo "| CompCert matrix | ${bt}just bench-compcert-matrix${bt} | Wall-clock of ${bt}just product-compcert-matrix${bt} (ccomp smoke + full wire + Mult). PROVABLY seal path, not \"compile product\" synonym for Arm A or B. |"
      echo
      echo "## How to re-run"
      echo
      echo "${bt}${bt}${bt}bash"
      echo "just bench-same-job"
      echo "just bench"
      echo "# individual: just bench-hot-freestanding | bench-without-lake-host |"
      echo "#   bench-lake-host (run twice for true hot) | bench-compcert-matrix |"
      echo "#   bench-cold-freestanding"
      echo "# smallest same-job arms: just bench-same-job"
      echo "# suite runs bench-lake-host twice (first + second pass)"
      echo "# optional long wipe (not in default suite): just bench-lake-host-cold"
      echo "# alias: just bench-phase-m  ->  just bench"
      echo "${bt}${bt}${bt}"
      echo
      echo "## Machine"
      echo
      echo "| Item | Value |"
      echo "|------|-------|"
      echo "| Hostname | ${host_name} |"
      echo "| uname -srm | ${uname_srm} |"
      echo "| nproc | ${nproc_n} |"
      echo "| lake --version | ${lake_v} |"
      echo "| lean --version | ${lean_v} |"
      echo
      echo "## Results by arm (related; different jobs)"
      echo
      echo "Times are outer ${bt}just bench-*${bt} invocations (bash TIMEFORMAT real/user/sys)."
      echo "Scenario run order is fixed: 1 hot freestanding, 2 without-Lake host, 3 B-hot first pass, 4 B-hot second pass, 5 CompCert matrix, 6 cold freestanding."
      echo
      echo "### Arm A -- Systems Lean product path"
      echo
      echo "| Scenario | Exit | real (s) | user (s) | sys (s) |"
      echo "|----------|------|----------|----------|---------|"
      echo "| hot freestanding | ${a_hot_st} | ${a_hot_r} | ${a_hot_u} | ${a_hot_s} |"
      echo "| without-Lake host | ${a_wol_st} | ${a_wol_r} | ${a_wol_u} | ${a_wol_s} |"
      echo "| cold freestanding | ${a_cold_st} | ${a_cold_r} | ${a_cold_u} | ${a_cold_s} |"
      echo
      echo "### Arm B -- classic Lean 4 + Lake"
      echo
      echo "| Scenario | Exit | real (s) | user (s) | sys (s) |"
      echo "|----------|------|----------|----------|---------|"
      echo "| B-hot first pass | ${b1_st} | ${b1_r} | ${b1_u} | ${b1_s} |"
      echo "| B-hot second pass | ${b2_st} | ${b2_r} | ${b2_u} | ${b2_s} |"
      echo
      echo "### Seal (related)"
      echo
      echo "| Scenario | Exit | real (s) | user (s) | sys (s) |"
      echo "|----------|------|----------|----------|---------|"
      echo "| CompCert matrix | ${seal_st} | ${seal_r} | ${seal_u} | ${seal_s} |"
      echo
      echo "## Skipped"
      echo
      echo "- ${bt}just bench-lake-host-cold${bt} (destructive long wipe of ${bt}src/systems/.lake${bt}; run separately)"
      echo
      echo "## Output honesty"
      echo
      echo "### Arm A output -- freestanding product wire"
      echo
      echo "Freestanding is **runtimeless product C** (no garbage collection, no Lean managed runtime on the wire). It is **not** classic Lean ahead-of-time managed-runtime C under ${bt}.lake${bt}."
      echo
      printf '%s\n' "$size_block"
      echo
      echo "### Arm B output -- host build tree"
      echo
      echo "Lake elaborates host Lean under ${bt}src/systems${bt}. Output is the host build tree (${bt}src/systems/.lake${bt}), **not** ${bt}out/freestanding-c${bt}."
      echo
      echo "## Interpretation"
      echo
      printf '%s\n' "$interp_lines"
      echo
      echo "## Detail: without-Lake nested times"
      echo
      printf '%s\n' "$wol_block"
      echo
      echo "## Non-claims"
      echo
      echo "- No \"provably fastest C\" claim. Wall-clock compile path comparison only."
      echo "- **PROVABLY** is a CompCert product seal, **not** a speed claim. CompCert matrix times wall-clock when ccomp is present; it does not prove runtime fastest C."
      echo "- **FullHostElaborateRemains** stays **false**. Without-Lake host tools are **not** full elaborator parity."
      echo "- Freestanding product C is **not** classic Lean managed-runtime AOT C, and freestanding is **not** the same job as Lake host elaborate. Lake does not emit that wire."
      echo "- This report does **not** claim Slake is faster than Lake unless both arms ran the same named job. Slake cannot do host package elaborate yet."
      echo "- free / complete / PROVABLY are **not** flipped by these benches (living residual owns claims)."
      echo "- Mult SSA lower **partial** is **not** a full LLVM backend."
      echo "- Cold full Lake wall-clock is **not** re-measured in this default suite (use ${bt}just bench-lake-host-cold${bt})."
      echo "- Arm B **second pass** is the preferred idle hot probe; first pass may still rebuild."
      echo
      echo "## Paths"
      echo
      echo "| What | Path |"
      echo "|------|------|"
      echo "| This report | ${bt}doc/BENCH-latest.md${bt} |"
      echo "| Same-job sibling | ${bt}doc/BENCH-SAME-JOB-latest.md${bt} |"
      echo "| Full transcript | ${bt}${log}${bt} |"
      echo "| Research note | ${bt}doc/dev/research/hot-cold-benchmarks-2026-08-08.md${bt} |"
      echo "| Recipes | ${bt}just/bench.just${bt} |"
      echo
      echo "## Overall exit"
      echo
      echo "$overall_line"
      echo
    } >"$report"
    echo | tee -a "$log"
    echo "bench: wrote $report" | tee -a "$log"
    echo "bench: full log $log" | tee -a "$log"
    if [[ $overall -eq 0 ]]; then echo "bench: overall ok" | tee -a "$log"
    else echo "bench: overall fail (see results table)" | tee -a "$log"; fi
    rm -rf "$cap"
    exit "$overall"

# Smallest same-job arms: time Lake host package elaborate; record Slake cannot-run.
# Prefers a hot second pass. Writes sibling doc/BENCH-SAME-JOB-latest.md.
# Does not overwrite the suite living report (just bench owns doc/BENCH-latest.md).
# Greppable: bench-same-job
bench-same-job:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    stamp_human=$(date -u +'%Y-%m-%d %H:%M:%S UTC')
    log="/tmp/systems-lean-bench-same-job-${stamp}.log"
    report="$root/doc/BENCH-SAME-JOB-latest.md"
    suite_report="$root/doc/BENCH-latest.md"
    bt=$'\x60'
    : >"$log"
    echo "== just bench-same-job: host package elaborate (same named job) ==" | tee -a "$log"
    echo "stamp: $stamp_human | log: $log | report: $report" | tee -a "$log"
    echo "suite report unchanged: $suite_report (just bench owns it)" | tee -a "$log"
    echo "named job: host package elaborate under src/systems (hot lake build)" | tee -a "$log"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH" >&2
      exit 1
    fi
    TIMEFORMAT='{{_bench_timeformat}}'
    echo "-- Lake first pass (may rebuild) --" | tee -a "$log"
    set +e
    { time just bench-lake-host; } >"$log.first" 2>"$log.first.time"
    st1=$?
    set -e
    cat "$log.first" >>"$log"
    cat "$log.first.time" >>"$log"
    echo "-- Lake second pass (idle hot when Built) --" | tee -a "$log"
    set +e
    { time just bench-lake-host; } >"$log.second" 2>"$log.second.time"
    st2=$?
    set -e
    cat "$log.second" >>"$log"
    cat "$log.second.time" >>"$log"
    parse_t() {
      local f="$1" r="?" u="?" s="?"
      if [[ -s "$f" ]]; then
        local line
        line=$(grep -E '^real ' "$f" | tail -n1 || true)
        if [[ -n "${line:-}" ]]; then
          set -- $line
          r="${2:-?}"; u="${4:-?}"; s="${6:-?}"
        fi
      fi
      echo "$r $u $s"
    }
    set -- $(parse_t "$log.first.time")
    b1_r="$1"; b1_u="$2"; b1_s="$3"
    set -- $(parse_t "$log.second.time")
    b2_r="$1"; b2_u="$2"; b2_s="$3"
    if [[ $st2 -eq 0 && "$b2_r" != "?" ]]; then
      lake_r="$b2_r"; lake_u="$b2_u"; lake_s="$b2_s"; lake_note="hot second pass"; lake_st=ok
    elif [[ $st1 -eq 0 && "$b1_r" != "?" ]]; then
      lake_r="$b1_r"; lake_u="$b1_u"; lake_s="$b1_s"; lake_note="first pass (second pass missing)"; lake_st=ok
    else
      lake_r="?"; lake_u="?"; lake_s="?"; lake_note="lake failed"; lake_st=fail
    fi
    host_name=$(hostname 2>/dev/null || echo unknown)
    uname_srm=$(uname -srm 2>/dev/null || echo unknown)
    nproc_n=$(nproc 2>/dev/null || echo "?")
    lake_v=$(lake --version 2>/dev/null | head -n1 || echo "(error)")
    lean_v="(missing)"
    if command -v lean >/dev/null 2>&1; then lean_v=$(lean --version 2>/dev/null | head -n1 || echo "(error)"); fi
    echo | tee -a "$log"
    echo "Lake arm: $lake_st real=$lake_r user=$lake_u sys=$lake_s ($lake_note)" | tee -a "$log"
    echo "Slake cannot do this job yet: full host package elaborate" | tee -a "$log"
    {
      echo "# Lake versus Slake -- same named job"
      echo
      echo "Generated: **${stamp_human}**"
      echo
      echo "Kind: wall-clock **same named job** on the compile-path develop-step. Not a residual claim flip. Not a token microbench."
      echo
      echo "## Same named job"
      echo
      echo "**Named job:** host package elaborate under ${bt}src/systems${bt} (hot ${bt}lake build${bt} when the package is already Built). This is the compile-path develop-step Lake actually runs for day-to-day host work."
      echo
      echo "| Arm | Result |"
      echo "|-----|--------|"
      echo "| **Lake** | ${lake_r} s real (user ${lake_u}, sys ${lake_s}; ${lake_note}; ${bt}just bench-lake-host${bt}) |"
      echo "| **Slake** | Slake cannot do this job yet: full host package elaborate. Missing classic Lean elaborator parity. ${bt}FullHostElaborateRemains${bt} stays false. |"
      echo
      echo "Slake day-to-day tools (import-graph, structural module-check, package-roots) are a **different job**. Freestanding product C emit (${bt}just build${bt}) is a product speed story. Lake does not emit that wire. This report does **not** claim Slake is faster than Lake on unlike jobs."
      echo
      echo "## How to re-run"
      echo
      echo "${bt}${bt}${bt}bash"
      echo "just bench-same-job"
      echo "just bench"
      echo "# contract: just bench-same-job-contract"
      echo "${bt}${bt}${bt}"
      echo
      echo "## Machine"
      echo
      echo "| Item | Value |"
      echo "|------|-------|"
      echo "| Hostname | ${host_name} |"
      echo "| uname -srm | ${uname_srm} |"
      echo "| nproc | ${nproc_n} |"
      echo "| lake --version | ${lake_v} |"
      echo "| lean --version | ${lean_v} |"
      echo
      echo "## Lake passes this recipe"
      echo
      echo "| Pass | Exit | real (s) | user (s) | sys (s) |"
      echo "|------|------|----------|----------|---------|"
      echo "| first | $([[ $st1 -eq 0 ]] && echo ok || echo fail) | ${b1_r} | ${b1_u} | ${b1_s} |"
      echo "| second (idle hot) | $([[ $st2 -eq 0 ]] && echo ok || echo fail) | ${b2_r} | ${b2_u} | ${b2_s} |"
      echo
      echo "## Related different jobs (not this comparison)"
      echo
      echo "A full ${bt}just bench${bt} still times freestanding emit, without-Lake host tools, and CompCert. Those are **not** Lake-versus-Slake on host package elaborate. Runtime freestanding C is a product speed story (${bt}just bench-runtime${bt})."
      echo
      echo "## Non-claims"
      echo
      echo "- No \"provably fastest C\" claim."
      echo "- **PROVABLY** is a CompCert product seal, **not** a speed claim."
      echo "- **FullHostElaborateRemains** stays **false**."
      echo "- Lake does not emit that wire (freestanding product C)."
      echo "- free / complete / PROVABLY are **not** flipped by these benches."
      echo
      echo "## Paths"
      echo
      echo "| What | Path |"
      echo "|------|------|"
      echo "| This report | ${bt}doc/BENCH-SAME-JOB-latest.md${bt} |"
      echo "| Suite living report | ${bt}doc/BENCH-latest.md${bt} (${bt}just bench${bt} owns it) |"
      echo "| Full transcript | ${bt}${log}${bt} |"
      echo "| Research note | ${bt}doc/dev/research/hot-cold-benchmarks-2026-08-08.md${bt} |"
      echo "| Recipes | ${bt}just/bench.just${bt} |"
      echo
      echo "## Overall exit"
      echo
      if [[ "$lake_st" == "ok" ]]; then
        echo "**ok** (Lake arm timed; Slake cannot do this job yet)"
      else
        echo "**fail** (Lake arm failed; Slake cannot do this job yet)"
      fi
      echo
    } >"$report"
    rm -f "$log.first" "$log.first.time" "$log.second" "$log.second.time"
    echo "bench-same-job: wrote $report" | tee -a "$log"
    echo "bench-same-job: full log $log" | tee -a "$log"
    if [[ "$lake_st" == "ok" ]]; then
      echo "bench-same-job: overall ok"
      exit 0
    fi
    echo "bench-same-job: overall fail" >&2
    exit 1

# TDD contract: living same-job reports + writer emit (not this recipe body).
# Idle-hot Lake cell must match the second-pass row. Do not hard-code a wall time.
# Greppable: bench-same-job-contract
bench-same-job-contract:
    #!/usr/bin/env bash
    set -euo pipefail
    root=$(pwd)
    suite_report="$root/doc/BENCH-latest.md"
    same_report="$root/doc/BENCH-SAME-JOB-latest.md"
    just_b="$root/just/bench.just"
    fail=0
    echo "== bench-same-job-contract (same named job; idle-hot Lake; writer emit) =="
    isnum() { [[ "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]]; }
    check_same_job_report() {
      local report="$1"
      local first_h2 lake_row lake_real hot_real first_real slake_row slake_real
      if [[ ! -f "$report" ]]; then
        echo "FAIL: missing living report $report" >&2
        fail=1
        return
      fi
      first_h2=$(grep -E '^## ' "$report" | head -n1 || true)
      if [[ "$first_h2" != "## Same named job" ]]; then
        echo "FAIL: $report first ## heading must be ## Same named job (got: ${first_h2:-none})" >&2
        fail=1
      fi
      if ! grep -q 'Named job:' "$report"; then
        echo "FAIL: $report must name the job (Named job:)" >&2
        fail=1
      fi
      if ! grep -q 'host package elaborate' "$report"; then
        echo "FAIL: $report must name host package elaborate" >&2
        fail=1
      fi
      lake_row=$(grep -E '^\| \*\*Lake\*\*' "$report" | head -n1 || true)
      if [[ -z "$lake_row" ]]; then
        echo "FAIL: $report must label the Lake arm as a table row" >&2
        fail=1
      fi
      lake_real=$(printf '%s\n' "$lake_row" | sed -n 's/.*\*\*Lake\*\*[[:space:]]*|[[:space:]]*\([0-9][0-9.]*\).*/\1/p')
      hot_real=$(awk -F'|' '
        $2 ~ /second \(idle hot\)/ { gsub(/ /, "", $4); print $4; exit }
      ' "$report")
      if [[ -z "${hot_real:-}" ]]; then
        hot_real=$(awk -F'|' '
          $2 ~ /B-hot second pass/ { gsub(/ /, "", $4); print $4; exit }
        ' "$report")
      fi
      first_real=$(awk -F'|' '
        $2 ~ /^ first $/ { gsub(/ /, "", $4); print $4; exit }
      ' "$report")
      if [[ -z "${first_real:-}" ]]; then
        first_real=$(awk -F'|' '
          $2 ~ /B-hot first pass/ { gsub(/ /, "", $4); print $4; exit }
        ' "$report")
      fi
      if [[ -n "${hot_real:-}" ]] && isnum "$hot_real"; then
        if ! printf '%s\n' "$lake_row" | grep -q 'hot second pass'; then
          echo "FAIL: $report Lake cell must say hot second pass when an idle-hot row exists" >&2
          fail=1
        fi
        if ! isnum "${lake_real:-}"; then
          echo "FAIL: $report Lake cell must have a parsed real time" >&2
          fail=1
        elif [[ "$lake_real" != "$hot_real" ]]; then
          echo "FAIL: $report Lake cell real ($lake_real) must match idle-hot row ($hot_real)" >&2
          fail=1
        fi
        if isnum "${first_real:-}" && isnum "${lake_real:-}" && [[ "$lake_real" == "$first_real" && "$first_real" != "$hot_real" ]]; then
          echo "FAIL: $report Lake cell uses first-pass real ($first_real) while idle-hot ($hot_real) exists" >&2
          fail=1
        fi
      else
        if ! printf '%s\n' "$lake_row" | grep -q 'first pass (second pass missing)'; then
          echo "FAIL: $report Lake cell must say first pass (second pass missing) when no idle-hot row" >&2
          fail=1
        fi
        if printf '%s\n' "$lake_row" | grep -q 'hot second pass'; then
          echo "FAIL: $report Lake cell claims hot second pass but no idle-hot row is present" >&2
          fail=1
        fi
      fi
      slake_row=$(grep -E '^\| \*\*Slake\*\*' "$report" | head -n1 || true)
      if [[ -z "$slake_row" ]]; then
        echo "FAIL: $report must label the Slake arm as a table row" >&2
        fail=1
      else
        slake_real=$(printf '%s\n' "$slake_row" | sed -n 's/.*\*\*Slake\*\*[[:space:]]*|[[:space:]]*\([0-9][0-9.]*\).*/\1/p')
        if printf '%s\n' "$slake_row" | grep -q 'Slake cannot do this job yet'; then
          if ! grep -q 'full host package elaborate' "$report"; then
            echo "FAIL: $report cannot-run arm must name full host package elaborate" >&2
            fail=1
          fi
          if isnum "${slake_real:-}"; then
            echo "FAIL: $report Slake cell cannot both invent a time and say cannot-run" >&2
            fail=1
          fi
          if grep -q 'Slake is faster than Lake' "$report" && ! grep -q 'does \*\*not\*\* claim Slake is faster' "$report"; then
            echo "FAIL: $report must not claim Slake is faster than Lake while Slake cannot run" >&2
            fail=1
          fi
        elif isnum "${slake_real:-}"; then
          if printf '%s\n' "$slake_row" | grep -q 'Slake cannot do this job yet'; then
            echo "FAIL: $report timed Slake cell must not also say cannot-run" >&2
            fail=1
          fi
        else
          echo "FAIL: $report Slake cell must be cannot-run or a parsed real time on this job" >&2
          fail=1
        fi
      fi
      if ! grep -q 'Lake does not emit that wire' "$report"; then
        echo "FAIL: $report must say Lake does not emit the freestanding product wire" >&2
        fail=1
      fi
    }
    saw_report=0
    if [[ -f "$same_report" ]]; then
      check_same_job_report "$same_report"
      saw_report=1
    fi
    if [[ -f "$suite_report" ]]; then
      check_same_job_report "$suite_report"
      saw_report=1
    fi
    if [[ "$saw_report" -eq 0 ]]; then
      echo "FAIL: missing $same_report and $suite_report" >&2
      fail=1
    fi
    if [[ ! -f "$just_b" ]]; then
      echo "FAIL: missing $just_b" >&2
      fail=1
    else
      if ! grep -q '^bench-same-job:' "$just_b"; then
        echo "FAIL: missing recipe bench-same-job" >&2
        fail=1
      fi
      writers=$(awk '
        /^[A-Za-z_][A-Za-z0-9_-]*:/ {
          name=$1
          sub(/:.*/, "", name)
          keep=(name=="bench" || name=="bench-same-job")
        }
        keep { print }
      ' "$just_b")
      if ! printf '%s\n' "$writers" | grep -qE 'echo +"## Same named job"'; then
        echo "FAIL: writer recipes bench / bench-same-job must echo ## Same named job" >&2
        fail=1
      fi
      if ! printf '%s\n' "$writers" | grep -qE 'echo +".*Slake cannot do this job yet'; then
        echo "FAIL: writer recipes bench / bench-same-job must echo the cannot-run Slake template" >&2
        fail=1
      fi
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "bench-same-job-contract: FAIL" >&2
      exit 1
    fi
    echo "bench-same-job-contract: ok"
    echo "status=ok"

# Thin alias for backcompat (PHASE-M-BENCH menu name). Greppable: bench-phase-m
bench-phase-m:
    just bench
