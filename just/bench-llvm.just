# Modular just: just/bench-llvm.just -- LLVM IR assemble / object / execute timing.
# Kind: measurement process glue. Not residual invent. Not claim flips.
# Primary: just bench-llvm -> doc/BENCH-LLVM-latest.md
# Times existing out/llvm-ir/*_ssa.ll (skip-honest if a file is absent).
# Soft skip (exit 0) if llvm-as / llc / clang / lli missing. Print why.
# Not CompCert. Not PROVABLY. Not the C product wire. Not FullBackend.
# Not a C-vs-LLVM headline (this recipe does not run the C suite).
# No product C growth. No src/ Rust. Tiny execute driver lives under TMPDIR.
# Greppable: bench-llvm, BENCH-LLVM, skip_no_llvm_as, skip_no_llc, skip_absent
# Note: no backtick chars in this justfile (just parses them as command sub).

_bench_llvm_runs := env("BENCH_LLVM_RUNS", "3")
_bench_llvm_exec_n := env("BENCH_LLVM_EXEC_N", "20000000")
_bench_llvm_timeformat := 'real %R user %U sys %S'

# LLVM assemble / object / tiny execute. Living report: doc/BENCH-LLVM-latest.md
# Greppable: bench-llvm, BENCH-LLVM-latest
bench-llvm:
    #!/usr/bin/env bash
    set -uo pipefail
    root=$(pwd)
    ir_dir="$root/out/llvm-ir"
    stamp=$(date -u +%Y%m%dT%H%M%SZ)
    stamp_human=$(date -u +'%Y-%m-%d %H:%M:%S UTC')
    log="/tmp/systems-lean-bench-llvm-${stamp}.log"
    report="$root/doc/BENCH-LLVM-latest.md"
    work="${TMPDIR:-/tmp}/slake-bench-llvm-$$"
    mkdir -p "$work"
    trap 'rm -rf "$work"' EXIT
    runs="{{_bench_llvm_runs}}"
    exec_n="{{_bench_llvm_exec_n}}"
    bt=$'\x60'
    : >"$log"
    echo "== just bench-llvm: assemble / object / tiny execute of generator SSA IR ==" | tee -a "$log"
    echo "stamp: $stamp_human | log: $log | report: $report" | tee -a "$log"
    echo "runs=$runs exec_N=$exec_n (not the C product wire; not CompCert)" | tee -a "$log"
    echo | tee -a "$log"
    have_as=0; have_llc=0; have_clang=0; have_lli=0; have_link=0
    as_v="(missing)"; llc_v="(missing)"; clang_v="(missing)"; lli_v="(missing)"
    if command -v llvm-as >/dev/null 2>&1; then
      have_as=1
      as_v=$(llvm-as --version 2>/dev/null | awk '/LLVM version/{gsub(/^[ \t]+/,""); print; exit}' || echo present)
    fi
    if command -v llc >/dev/null 2>&1; then
      have_llc=1
      llc_v=$(llc --version 2>/dev/null | awk '/LLVM version/{gsub(/^[ \t]+/,""); print; exit}' || echo present)
    fi
    if command -v clang >/dev/null 2>&1; then
      have_clang=1
      clang_v=$(clang --version 2>/dev/null | head -n1 || echo present)
    fi
    if command -v lli >/dev/null 2>&1; then
      have_lli=1
      lli_v=$(lli --version 2>/dev/null | awk '/LLVM version/{gsub(/^[ \t]+/,""); print; exit}' || echo present)
    fi
    if command -v llvm-link >/dev/null 2>&1; then have_link=1; fi
    echo "tools: llvm-as=$have_as llc=$have_llc clang=$have_clang lli=$have_lli llvm-link=$have_link" | tee -a "$log"
    if [[ "$have_as" -eq 0 && "$have_llc" -eq 0 && "$have_clang" -eq 0 && "$have_lli" -eq 0 ]]; then
      echo "skip: no llvm-as / llc / clang / lli on PATH (soft skip)" | tee -a "$log"
      echo "status=skip_no_llvm_tools" | tee -a "$log"
    fi
    candidates=( slake_mult_ssa.ll slake_linear_ssa.ll slake_types_ssa.ll slake_program_ssa.ll slake_graph_ssa.ll slake_compose_ssa.ll )
    time_median() {
      local name="$1"; shift
      local tfdir="$work/t_$name"
      mkdir -p "$tfdir"
      set +e
      "$@" >/dev/null 2>"$tfdir/warm.err"
      local wst=$?
      set +u
      if [[ $wst -ne 0 ]]; then
        echo "fail ? ? ?"
        return 0
      fi
      local i=1 rec="$tfdir/reals"
      : >"$rec"
      while [[ "$i" -le "$runs" ]]; do
        TIMEFORMAT='{{_bench_llvm_timeformat}}'
        set +e
        { time "$@" >/dev/null 2>"$tfdir/r$i.err"; } 2>"$tfdir/r$i.time"
        local st=$?
        set +u
        if [[ $st -ne 0 ]]; then
          echo "fail ? ? ?"
          return 0
        fi
        grep -E '^real ' "$tfdir/r$i.time" | tail -n1 | awk '{print $2}' >>"$rec"
        i=$((i + 1))
      done
      sort -n "$rec" | awk '
        { a[NR]=$1+0 }
        END {
          if (NR==0) { print "ok ? ? ?"; exit }
          min=a[1]; max=a[NR]
          if (NR%2) med=a[int(NR/2)+1]
          else med=(a[NR/2]+a[NR/2+1])/2
          printf "ok %.6f %.6f %.6f\n", med, min, max
        }'
    }
    as_rows=""; obj_rows=""
    echo "-- assemble (llvm-as) --" | tee -a "$log"
    for f in "${candidates[@]}"; do
      path="$ir_dir/$f"
      if [[ ! -f "$path" ]]; then
        echo "  $f skip_absent" | tee -a "$log"
        as_rows+="| ${bt}${f}${bt} | skip_absent | - | - | - | - |"$'\n'
        continue
      fi
      bytes=$(wc -c <"$path" | tr -d ' ')
      if [[ "$have_as" -eq 0 ]]; then
        echo "  $f skip_no_llvm_as ($bytes bytes)" | tee -a "$log"
        as_rows+="| ${bt}${f}${bt} | skip_no_llvm_as | $bytes | - | - | - |"$'\n'
        continue
      fi
      read -r ast as_med as_min as_max <<< "$(time_median "as_$f" llvm-as "$path" -o /dev/null)"
      echo "  $f $ast median=${as_med}s min=${as_min} max=${as_max} bytes=$bytes" | tee -a "$log"
      as_rows+="| ${bt}${f}${bt} | $ast | $bytes | ${as_med} | ${as_min} | ${as_max} |"$'\n'
    done
    echo "-- object (llc -filetype=obj) --" | tee -a "$log"
    for f in "${candidates[@]}"; do
      path="$ir_dir/$f"
      base="${f/.ll/}"
      if [[ ! -f "$path" ]]; then
        echo "  $f skip_absent" | tee -a "$log"
        obj_rows+="| ${bt}${f}${bt} | skip_absent | - | - | - | - |"$'\n'
        continue
      fi
      bytes=$(wc -c <"$path" | tr -d ' ')
      if [[ "$have_llc" -eq 0 ]]; then
        echo "  $f skip_no_llc ($bytes bytes)" | tee -a "$log"
        obj_rows+="| ${bt}${f}${bt} | skip_no_llc | $bytes | - | - | - |"$'\n'
        continue
      fi
      read -r ost o_med o_min o_max <<< "$(time_median "llc_$f" llc -filetype=obj -o "$work/${base}.o" "$path")"
      obytes="-"
      if [[ -f "$work/${base}.o" ]]; then obytes=$(wc -c <"$work/${base}.o" | tr -d ' '); fi
      echo "  $f $ost median=${o_med}s min=${o_min} max=${o_max} obj_bytes=$obytes" | tee -a "$log"
      obj_rows+="| ${bt}${f}${bt} | $ost | $obytes | ${o_med} | ${o_min} | ${o_max} |"$'\n'
    done
    exec_status="skip_not_attempted"
    exec_path="(none)"
    exec_med="-"; exec_min="-"; exec_max="-"
    exec_note="IR has no @main; tiny TMPDIR wrapper calls Mult SSA grade_tag + kernel_band_ready."
    mult="$ir_dir/slake_mult_ssa.ll"
    echo "-- execute (tiny TMPDIR wrapper; not product C) --" | tee -a "$log"
    if [[ ! -f "$mult" ]]; then
      exec_status="skip_no_mult_ssa"
      echo "  skip: slake_mult_ssa.ll absent" | tee -a "$log"
    elif [[ "$have_clang" -eq 0 && ( "$have_lli" -eq 0 || "$have_link" -eq 0 ) ]]; then
      exec_status="skip_no_execute_tools"
      echo "  skip: need clang, or lli+llvm-link (IR has no main)" | tee -a "$log"
    else
      # Just interpolates { } [ ] % in recipe bodies. Build wrap.ll via hex bytes.
      pct=$'\x25'
      ob=$'\x7b'
      cb=$'\x7d'
      lb=$'\x5b'
      rb=$'\x5d'
      {
        echo "declare i32 @slake_mult_ssa_grade_tag(i32)"
        echo "declare i1 @slake_mult_ssa_kernel_band_ready()"
        echo "define i32 @main() ${ob}"
        echo "entry:"
        echo "  ${pct}ok = call i1 @slake_mult_ssa_kernel_band_ready()"
        echo "  br i1 ${pct}ok, label ${pct}loop, label ${pct}fail"
        echo "fail:"
        echo "  ret i32 1"
        echo "loop:"
        echo "  ${pct}i = phi i32 ${lb} 0, ${pct}entry ${rb}, ${lb} ${pct}i2, ${pct}body ${rb}"
        echo "  ${pct}c = icmp ult i32 ${pct}i, ${exec_n}"
        echo "  br i1 ${pct}c, label ${pct}body, label ${pct}done"
        echo "body:"
        echo "  ${pct}t = call i32 @slake_mult_ssa_grade_tag(i32 1)"
        echo "  ${pct}i2 = add i32 ${pct}i, 1"
        echo "  br label ${pct}loop"
        echo "done:"
        echo "  ret i32 0"
        echo "${cb}"
      } >"$work/wrap.ll"
      if [[ "$have_clang" -eq 1 ]]; then
        set +e
        clang -O2 -Wno-override-module -o "$work/exec" "$work/wrap.ll" "$mult" >>"$log" 2>&1
        cl_st=$?
        set +u
        if [[ $cl_st -eq 0 && -x "$work/exec" ]]; then
          read -r est e_med e_min e_max <<< "$(time_median exec_native "$work/exec")"
          exec_status="$est"
          exec_path="clang -O2 wrap.ll + slake_mult_ssa.ll (native)"
          exec_med="$e_med"; exec_min="$e_min"; exec_max="$e_max"
          echo "  native $est median=${e_med}s N=$exec_n" | tee -a "$log"
        else
          exec_status="skip_cannot_link"
          echo "  clang link failed (status=skip_cannot_link)" | tee -a "$log"
        fi
      fi
      if [[ "$exec_status" != "ok" && "$have_lli" -eq 1 && "$have_link" -eq 1 ]]; then
        set +e
        llvm-link "$work/wrap.ll" "$mult" -o "$work/combined.bc" >>"$log" 2>&1
        lk_st=$?
        set +u
        if [[ $lk_st -eq 0 ]]; then
          read -r est e_med e_min e_max <<< "$(time_median exec_lli lli "$work/combined.bc")"
          exec_status="$est"
          exec_path="llvm-link + lli (interpreter)"
          exec_med="$e_med"; exec_min="$e_min"; exec_max="$e_max"
          echo "  lli $est median=${e_med}s N=$exec_n" | tee -a "$log"
        else
          exec_status="skip_cannot_link"
          echo "  llvm-link failed (status=skip_cannot_link)" | tee -a "$log"
        fi
      fi
    fi
    host_name=$(hostname 2>/dev/null || echo unknown)
    uname_srm=$(uname -srm 2>/dev/null || echo unknown)
    nproc_n=$(nproc 2>/dev/null || echo "?")
    {
      echo "# LLVM IR assemble / object / execute bench"
      echo
      echo "Generated: **${stamp_human}**"
      echo
      echo "Kind: wall-clock of generator LLVM IR under ${bt}out/llvm-ir/${bt}."
      echo "**Not** CompCert. **Not** PROVABLY. **Not** the C product wire"
      echo "(${bt}just bench-runtime${bt} / ${bt}doc/BENCH-RUNTIME-latest.md${bt})."
      echo "**Not** a production backend claim. Band ${bt}*FullBackendClaimed${bt} stays false."
      echo
      echo "## What was timed (this run)"
      echo
      echo "- **Assemble:** ${bt}llvm-as${bt} of existing generator ${bt}*_ssa.ll${bt} (skip-honest if a file is absent)."
      echo "- **Object:** ${bt}llc -filetype=obj${bt} into a ${bt}TMPDIR${bt} work dir (deleted after), when ${bt}llc${bt} is on PATH."
      echo "- **Execute:** tiny ${bt}TMPDIR${bt} LLVM wrapper over Mult SSA (${bt}slake_mult_ssa_grade_tag${bt} + ${bt}slake_mult_ssa_kernel_band_ready${bt}); native ${bt}clang${bt} or ${bt}lli${bt}. Soft-skip if the IR has no main and cannot link."
      echo
      echo "## How much faster / slower"
      echo
      echo "This suite reports LLVM wall times **on their own**. It does **not** claim LLVM is faster or slower than the C product wire. Those are different surfaces. This recipe did not run ${bt}just bench-runtime${bt}, so there is no paired C-vs-LLVM headline."
      echo
      echo "## Numbers -- assemble (llvm-as)"
      echo
      echo "Measured runs per file: **${runs}** after one warmup. Times are outer wall seconds for ${bt}llvm-as FILE -o /dev/null${bt}."
      echo
      echo "| File | Status | bytes | median wall (s) | min | max |"
      echo "|------|--------|------:|----------------:|----:|----:|"
      printf '%s' "$as_rows"
      echo
      echo "## Numbers -- object (llc -filetype=obj)"
      echo
      echo "Measured runs per file: **${runs}** after one warmup. Object files live only under ${bt}TMPDIR${bt} and are deleted after the suite."
      echo
      echo "| File | Status | obj bytes | median wall (s) | min | max |"
      echo "|------|--------|----------:|----------------:|----:|----:|"
      printf '%s' "$obj_rows"
      echo
      echo "## Numbers -- execute"
      echo
      echo "${exec_note}"
      echo
      echo "| Item | Value |"
      echo "|------|-------|"
      echo "| Status | ${exec_status} |"
      echo "| Path | ${exec_path} |"
      echo "| N (loop trips) | ${exec_n} |"
      echo "| median wall (s) | ${exec_med} |"
      echo "| min / max (s) | ${exec_min} / ${exec_max} |"
      echo
      echo "## Tools"
      echo
      echo "| Tool | Present | Version line |"
      echo "|------|---------|--------------|"
      echo "| llvm-as | ${have_as} | ${as_v} |"
      echo "| llc | ${have_llc} | ${llc_v} |"
      echo "| clang | ${have_clang} | ${clang_v} |"
      echo "| lli | ${have_lli} | ${lli_v} |"
      echo "| llvm-link | ${have_link} | (used only for lli path) |"
      echo
      echo "## How to re-run"
      echo
      echo "${bt}${bt}${bt}bash"
      echo "just bench-llvm"
      echo "# calibrate: BENCH_LLVM_RUNS=5 BENCH_LLVM_EXEC_N=50000000 just bench-llvm"
      echo "${bt}${bt}${bt}"
      echo
      echo "## Machine"
      echo
      echo "| Item | Value |"
      echo "|------|-------|"
      echo "| Hostname | ${host_name} |"
      echo "| uname -srm | ${uname_srm} |"
      echo "| nproc | ${nproc_n} |"
      echo
      echo "## Methods (short)"
      echo
      echo "| Stage | Command | Soft-skip |"
      echo "|-------|---------|-----------|"
      echo "| assemble | ${bt}llvm-as FILE -o /dev/null${bt} | ${bt}skip_no_llvm_as${bt} / ${bt}skip_absent${bt} |"
      echo "| object | ${bt}llc -filetype=obj -o TMPDIR/FILE.o FILE${bt} | ${bt}skip_no_llc${bt} / ${bt}skip_absent${bt} |"
      echo "| execute | ${bt}clang -O2${bt} wrapper + Mult SSA, else ${bt}llvm-link${bt}+${bt}lli${bt} | ${bt}skip_no_execute_tools${bt} / ${bt}skip_cannot_link${bt} / ${bt}skip_no_mult_ssa${bt} |"
      echo
      echo "Candidates (existing files only): Mult, Linear, Types, Program, Graph, Compose ${bt}*_ssa.ll${bt}."
      echo "Compose SSA is skip-honest if the sibling writer has not landed it yet."
      echo
      echo "## Limits / non-claims"
      echo
      echo "- **Not CompCert. Not PROVABLY.** PROVABLY stays C-only. LLVM assemble success is not a correctness seal."
      echo "- **Not the C product wire.** Freestanding C lives under ${bt}emit/${bt} and ${bt}out/freestanding-c/${bt}. This report is not ${bt}doc/BENCH-RUNTIME-latest.md${bt}."
      echo "- **Not FullBackend.** Band ${bt}*FullBackendClaimed${bt} stays false. Not a production LLVM backend."
      echo "- **Not \"LLVM is faster than C.\"** No paired C measurement in this recipe."
      echo "- **Not product Rust** under ${bt}src/${bt}. Execute driver is TMPDIR-only and is deleted."
      echo "- Speed is empirical on this machine. Re-run for your host."
      echo
      echo "## Paths"
      echo
      echo "| What | Path |"
      echo "|------|------|"
      echo "| This report | ${bt}doc/BENCH-LLVM-latest.md${bt} |"
      echo "| Full transcript | ${bt}${log}${bt} |"
      echo "| Recipes | ${bt}just/bench-llvm.just${bt} |"
      echo "| IR inputs (read-only) | ${bt}out/llvm-ir/*_ssa.ll${bt} |"
      echo "| C runtime suite (different question) | ${bt}just bench-runtime${bt} |"
      echo
      echo "## Overall"
      echo
      if [[ "$have_as" -eq 0 && "$have_llc" -eq 0 && "$have_clang" -eq 0 && "$have_lli" -eq 0 ]]; then
        echo "**soft skip** (no llvm-as / llc / clang / lli on PATH)"
      else
        echo "**ok** (measured what tools allowed; missing files and tools soft-skip)"
      fi
      echo
    } >"$report"
    echo | tee -a "$log"
    echo "bench-llvm: wrote $report" | tee -a "$log"
    echo "bench-llvm: full log $log" | tee -a "$log"
    echo "bench-llvm: done (not CompCert; not C product wire; not FullBackend)" | tee -a "$log"
    exit 0
