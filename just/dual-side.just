# Modular just: just/dual-side.just -- role recipes (import into root justfile).
idris-elaborate:
    #!/usr/bin/env bash
    set -euo pipefail
    fail=0
    if command -v idris2 >/dev/null 2>&1; then
      echo "== idris2 --check (optional when binary present) =="
      for f in ConsumeToken.idr ErasedIndex.idr UnrestrictedShare.idr; do
        if ! (cd src/idris2/examples && idris2 --check "$f"); then
          echo "RED: idris2 --check failed on $f" >&2
          fail=1
        else
          echo "ok idris2 --check $f"
        fi
      done
    else
      echo "skip idris2 --check (not on PATH; pure Nix idris-side presence still required via just idris-side)"
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "idris-elaborate RED" >&2
      exit 1
    fi
    echo "idris-elaborate GREEN (static presence: just idris-side)"

# Shared: return 0 if elan lists the wanted toolchain (strips " (default)" suffixes).
_elan-has-toolchain want:
    #!/usr/bin/env bash
    set -euo pipefail
    want="{{want}}"
    while IFS= read -r line; do
      [[ -z "$line" ]] && continue
      base=${line%% (*}
      base=${base%"${base##*[![:space:]]}"}
      if [[ "$base" == "$want" ]]; then
        exit 0
      fi
    done < <(elan toolchain list 2>/dev/null || true)
    exit 1

# Shared: optional lake build under dir when lean+lake and pin ready (or SYSTEMS_LEAN_LAKE=1).
# Skip is GREEN. Avoids network toolchain download when pin not installed.
_lake-if-pin dir label:
    #!/usr/bin/env bash
    set -euo pipefail
    here="{{dir}}"
    label="{{label}}"
    run_lake=0
    if command -v lean >/dev/null 2>&1 && command -v lake >/dev/null 2>&1; then
      want=$(tr -d '[:space:]' < "$here/lean-toolchain")
      if command -v elan >/dev/null 2>&1; then
        if just _elan-has-toolchain "$want"; then
          run_lake=1
        else
          echo "skip $label elaborator (toolchain $want not installed; avoid network download)"
        fi
      elif [[ "${SYSTEMS_LEAN_LAKE:-}" == "1" ]]; then
        echo "$label elaborator: no elan; SYSTEMS_LEAN_LAKE=1 set -- running PATH lake build"
        run_lake=1
      else
        echo "skip $label elaborator (elan not on PATH; set SYSTEMS_LEAN_LAKE=1 to force PATH lake build)"
      fi
    else
      echo "skip $label elaborator (lean and/or lake not on PATH)"
    fi
    if [[ "$run_lake" -eq 1 ]]; then
      echo "== lake build ($label) =="
      if ! (cd "$here" && lake build); then
        echo "RED: lake build failed for $here" >&2
        exit 1
      fi
      echo "ok lake build ($label)"
    fi

# Optional lake build in src/lean4 (dual examples). Same elan pin / SYSTEMS_LEAN_LAKE rules.
# Static presence: just lean-side.
lean-elaborate:
    #!/usr/bin/env bash
    set -euo pipefail
    just _lake-if-pin src/lean4 lean-side
    echo "lean-elaborate GREEN (static presence: just lean-side)"

# Optional lake build in src/systems (host bootstrap elaborator). Same elan skip rules.
# CompilePath presence is pure Nix (just systems-host); not re-checked here.
systems-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    just _lake-if-pin src/systems systems
    echo "systems-lake GREEN (static: just systems-host / systems-emit-wire)"

# Freestanding-first cc -c on emit + link/run behavioral probe.
# Under just check, SYSTEMS_PRODUCT_WIRE_FRESH=1 skips second just build (build already ran).
# Solo: runs just build unless FRESH=1. Soft GREEN if no cc; RED if emit missing or tests fail.
# Static probe path: just systems-emit-wire. Not residual free; not PROVABLY.
systems-cc-probe:
    #!/usr/bin/env bash
    set -euo pipefail
    fail=0
    emit_c=src/systems/emit/slake_freestanding.c
    emit_h=src/systems/emit/slake_freestanding.h
    probe=src/systems/smoke/slake_behavioral_probe.c
    echo "== systems-cc-probe (product wire exercise) =="
    if [[ "${SYSTEMS_PRODUCT_WIRE_FRESH:-}" == "1" ]]; then
      echo "ok product wire already fresh from just check/build (SYSTEMS_PRODUCT_WIRE_FRESH=1; skip regenerate)"
    elif ! just build; then
      echo "RED: just build non-zero" >&2
      fail=1
    else
      echo "ok just build GREEN"
    fi
    if [[ ! -f "$emit_c" || ! -f "$emit_h" ]]; then
      echo "RED: emit product missing ($emit_c / $emit_h)" >&2
      fail=1
    else
      echo "ok emit product .c/.h"
    fi
    if [[ ! -f out/freestanding-c/slake_freestanding.c || ! -f out/freestanding-c/slake_freestanding.h ]]; then
      echo "RED: out/freestanding-c product missing" >&2
      fail=1
    else
      echo "ok release surface"
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "systems-cc-probe RED (product wire missing)" >&2
      exit 1
    fi
    if ! command -v cc >/dev/null 2>&1; then
      echo "ok compile + behavioral tests skipped (no cc)"
    else
      o="${TMPDIR:-/tmp}/slake_fs_smoke.o"
      inc=$(dirname "$emit_c")
      mode=""
      if cc -c -std=c11 -ffreestanding -nostdlib -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
        mode=ffreestanding-nostdlib
      elif cc -c -std=c11 -I"$inc" -o "$o" "$emit_c" 2>/dev/null; then
        mode=hosted-fallback
      fi
      rm -f "$o"
      if [[ -n "$mode" ]]; then
        echo "ok freestanding-first compile ($mode)"
      else
        echo "RED: freestanding-first compile failed" >&2
        fail=1
      fi
      if [[ ! -f "$probe" ]]; then
        echo "RED: missing $probe" >&2
        fail=1
      else
        d="${TMPDIR:-/tmp}/slake_beh_$$"
        mkdir -p "$d"
        if ! cc -std=c11 -I"$inc" -o "$d/probe" "$probe" "$emit_c" 2>/dev/null; then
          echo "RED: behavioral tests failed to link" >&2
          fail=1
        else
          rc=0
          "$d/probe" || rc=$?
          if [[ "$rc" -eq 0 ]]; then
            echo "ok behavioral tests ($probe)"
          else
            echo "RED: behavioral tests assert code=$rc" >&2
            fail=1
          fi
        fi
        rm -rf "$d"
      fi
    fi
    if [[ "$fail" -ne 0 ]]; then
      echo "systems-cc-probe RED" >&2
      exit 1
    fi
    echo "systems-cc-probe GREEN (process glue; static pure Nix; not residual free)"

# Poll: meters + scc + hygiene. Interval is loop sleep, not cycle cost.
# Override: WATCH_INTERVAL=60 just watch
watch:
    #!/usr/bin/env bash
    set -euo pipefail
    INTERVAL="${WATCH_INTERVAL:-300}"
    LOG="${WATCH_LOG:-doc/progress-log.md}"
    mkdir -p doc .cache
    if [[ ! -s "$LOG" ]]; then
      printf '%s\n' \
        '# Fork progress log' \
        '' \
        'Append-only cycle notes from just watch.' \
        'Each cycle: pure Nix progress meters + scc . + just hygiene (source-hygiene + professional-tone).' \
        'ASCII only. Tooling is pure Nix modules under nix/; just orchestrates.' \
        '' >"$LOG"
    fi
    echo "systems-lean watch: interval=${INTERVAL}s log=$LOG"
    echo "note: process elapsed time is loop uptime, not cycle cost"
    cycle=0
    while true; do
      cycle=$((cycle + 1))
      ts=$(date -Is 2>/dev/null || date)
      echo ""
      echo "======== watch cycle $cycle @ $ts ========"
      just progress-scc || true
      set +e
      just hygiene
      hyg_rc=$?
      set -e
      {
        echo "## cycle $cycle -- $ts"
        echo ""
        echo "- progress: just progress-scc"
        echo "- hygiene rc=$hyg_rc"
        echo "- see doc/PROGRESS.md and doc/PROGRESS-scc.txt"
        echo ""
      } >>"$LOG"
      echo "sleeping ${INTERVAL}s..."
      sleep "$INTERVAL"
    done
