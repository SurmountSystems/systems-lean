# Modular just: just/dual-side.just -- role recipes (import into root justfile).
idris-elaborate:
    #!/usr/bin/env bash
    set -euo pipefail
    fail=0
    ex=src/idris2/examples
    # idris2 --check drops build/*.ttc next to duals; always remove before exit.
    cleanup_idris_build() {
      rm -rf "$ex/build"
    }
    trap cleanup_idris_build EXIT
    if command -v idris2 >/dev/null 2>&1; then
      echo "== idris2 --check (optional when binary present; JOIN-ALG + EDGE-AFFINE duals) =="
      # JOIN-ALG algorithm ids + EDGE-AFFINE duals: keep list in sync with
      # src/idris2/examples/*.idr duals.
      for f in \
        ConsumeToken.idr \
        ErasedIndex.idr \
        UnrestrictedShare.idr \
        FailClosedGrade.idr \
        LinearPairSwap.idr \
        RuntimeExtract.idr \
        AffineDrop.idr \
        AffineOwn.idr
      do
        if ! (cd "$ex" && idris2 --check "$f"); then
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
# Lake host is surmount-1. On any other hostname (including the laptop
# horizon) skip GREEN so just check cannot start lake build locally.
# Override: SYSTEMS_LEAN_LAKE_FORCE=1.
_lake-if-pin dir label:
    #!/usr/bin/env bash
    set -euo pipefail
    here="{{dir}}"
    label="{{label}}"
    host=$(hostname -s 2>/dev/null || hostname 2>/dev/null || echo unknown)
    host=${host%%.*}
    if [[ "${SYSTEMS_LEAN_LAKE_FORCE:-}" != "1" && "$host" != "surmount-1" ]]; then
      echo "skip $label elaborator (host $host is not surmount-1; set SYSTEMS_LEAN_LAKE_FORCE=1 to run lake here)"
      exit 0
    fi
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
# Named isolation prove is not this recipe. Use one serial niced
# lake build of the current probe only, LEAN_NUM_THREADS=1.
# Never lake build SystemsLean.ElabMeetTheorems or SystemsLean.ElabMeet.
# MemoryMax 192 GiB. floor(192/167)=1 fat Lean. Do not set jobs from
# core count (64 * 10 GiB = 640 GiB is not a budget we have).
systems-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    just _lake-if-pin src/systems systems
    echo "systems-lake GREEN (static: just systems-host / systems-emit-wire)"

# Apply MemoryMax (GiB) + nice 19 to the named kernel walk. Fail closed
# if neither systemd-run --user --scope MemoryMax nor prlimit/ulimit -v
# can be applied. Do not run unbounded. OccupancyProbe 192 GiB is not
# this helper. One L2 owns the builder walk (local or remote).
_capped-nice-typecheck mem_g:
    #!/usr/bin/env bash
    set -euo pipefail
    mem="{{mem_g}}"
    if ! [[ "$mem" =~ ^[0-9]+$ ]] || [[ "$mem" -lt 1 ]]; then
      echo "_capped-nice-typecheck RED: mem_g must be a positive integer GiB (got $mem)" >&2
      exit 1
    fi
    as_bytes=$((mem * 1024 * 1024 * 1024))
    as_kb=$((mem * 1024 * 1024))
    walk=(env LEAN_NUM_THREADS="${LEAN_NUM_THREADS:-1}" just slake-typecheck-src-systems)
    if command -v systemd-run >/dev/null 2>&1 \
       && systemd-run --user --scope -p "MemoryMax=${mem}G" --quiet -- /bin/true; then
      echo "_capped-nice-typecheck: systemd-run --user --scope MemoryMax=${mem}G; nice 19"
      systemd-run --user --scope -p "MemoryMax=${mem}G" --quiet -- nice -n 19 "${walk[@]}"
      exit $?
    fi
    if command -v prlimit >/dev/null 2>&1 \
       && prlimit --as="$as_bytes" -- /bin/true; then
      echo "_capped-nice-typecheck: prlimit --as ${mem}G; nice 19"
      prlimit --as="$as_bytes" -- nice -n 19 "${walk[@]}"
      exit $?
    fi
    if ulimit -v "$as_kb" 2>/dev/null; then
      echo "_capped-nice-typecheck: ulimit -v ${mem}G; nice 19"
      nice -n 19 "${walk[@]}"
      exit $?
    fi
    echo "_capped-nice-typecheck RED: cannot apply ${mem} GiB cap (no systemd-run MemoryMax, prlimit, or ulimit -v)" >&2
    echo "fail closed: will not run unbounded" >&2
    exit 1

# Local Lean while SSH to nixbuilder@surmount-1 is down.
# Forces one Lean 4 thread (LEAN_NUM_THREADS=1), nice 19 process group,
# 96 GiB cap, then the named kernel walk.
# slake-typecheck-src-systems defaults mill-class 16 unless this export wins.
# GREEN here is not OccupancyProbe, mill, or the surmount-1 typecheck Done when.
# Horizon skip-GREEN on just check / just systems-lake is still not that Done when.
# FullHost false. slakeOwnsPackageTypecheck false. Not Lake-gone. Do not remill.
# Do not OccupancyProbe. OccupancyProbe MemoryMax 192 GiB is not this recipe.
# One L2 owns this local builder walk. Policy: AGENTS.md (Local Lean while
# builder SSH is down).
check-local:
    #!/usr/bin/env bash
    set -euo pipefail
    export LEAN_NUM_THREADS=1
    echo "check-local: one Lean 4 thread (LEAN_NUM_THREADS=1)"
    echo "check-local: MemoryMax 96 GiB; nice 19 (process group)"
    echo "GREEN is not surmount-1 package typecheck Done when"
    echo "not mill; not OccupancyProbe (OccupancyProbe MemoryMax 192 GiB is not this recipe); not Lake-gone"
    echo "FullHost false; slakeOwnsPackageTypecheck false"
    echo "one L2 owns this local builder walk"
    just _capped-nice-typecheck 96

# Remote fat walk on nixbuilder@surmount-1. MemoryMax 256 GiB, nice 19,
# one Lean 4 thread (this is a fat PackageTypecheck walk, not mill-class RSS).
# Do not skip-GREEN because this laptop is horizon. SSH down is fail closed.
# OccupancyProbe MemoryMax 192 GiB is not this recipe. Not mill. Not Lake-gone.
# One L2 owns this remote builder walk.
# Lean must be a nix-store ELF (PT_INTERP /nix/store/.../ld-linux). Elan
# toolchain lean is stub-ld (/lib64/ld-linux); fail closed if no real ELF.
# User slice MemoryMax must be 256 GiB or the 256G scope loses to
# user-<uid>.slice (last PackageTypecheck exit 143 at 46/747, OOM at 192 GiB).
# Probe systemd-run with PATH true; NixOS has no /bin/true.
check-remote:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "check-remote: SSH nixbuilder@surmount-1; MemoryMax 256 GiB; nice 19; LEAN_NUM_THREADS=1"
    echo "GREEN is not skip-GREEN on horizon; SSH down is fail closed"
    echo "not mill; not OccupancyProbe (OccupancyProbe MemoryMax 192 GiB is not this recipe); not Lake-gone"
    echo "one L2 owns this remote builder walk"
    echo "FullHost false; slakeOwnsPackageTypecheck false"
    echo "check-remote: user slice MemoryMax must be 256 GiB or the 256G scope is a lie (OOM at about 192 GiB; last walk exit 143 at 46/747)"
    ssh -o BatchMode=yes -o ConnectTimeout=15 nixbuilder@surmount-1 bash -s <<'REMOTE'
    set -euo pipefail
    cd /home/nixbuilder/iso
    export PATH="${HOME}/.elan/bin:/var/lib/elan/bin:${HOME}/.cargo/bin:${PATH}"
    export LEAN_NUM_THREADS=1
    if ! command -v just >/dev/null 2>&1; then
      echo "check-remote RED: miss just on nixbuilder PATH" >&2
      exit 1
    fi
    # ELF64 little-endian PT_INTERP. file(1)/readelf/patchelf may be missing.
    _elf64_interp() {
      local f="$1"
      [[ -f "$f" ]] || return 1
      local mag class data
      mag=$(od -An -tx1 -N4 "$f" | tr -d ' \n')
      [[ "$mag" == "7f454c46" ]] || return 1
      class=$(od -An -tu1 -N1 -j4 "$f" | tr -d ' ')
      data=$(od -An -tu1 -N1 -j5 "$f" | tr -d ' ')
      [[ "$class" == "2" && "$data" == "1" ]] || return 1
      local phoff phentsize phnum
      phoff=$(od -An -tu8 -N8 -j32 "$f" | tr -d ' ')
      phentsize=$(od -An -tu2 -N2 -j54 "$f" | tr -d ' ')
      phnum=$(od -An -tu2 -N2 -j56 "$f" | tr -d ' ')
      local i=0 off ptype poffset pfilesz
      while [[ "$i" -lt "$phnum" ]]; do
        off=$((phoff + i * phentsize))
        ptype=$(od -An -tu4 -N4 -j"$off" "$f" | tr -d ' ')
        if [[ "$ptype" == "3" ]]; then
          poffset=$(od -An -tu8 -N8 -j$((off + 8)) "$f" | tr -d ' ')
          pfilesz=$(od -An -tu8 -N8 -j$((off + 32)) "$f" | tr -d ' ')
          if [[ "$pfilesz" -gt 1 && "$pfilesz" -lt 512 ]]; then
            dd if="$f" bs=1 skip="$poffset" count=$((pfilesz - 1)) 2>/dev/null
            echo
            return 0
          fi
        fi
        i=$((i + 1))
      done
      return 1
    }
    _is_nix_store_ld() {
      local interp="$1"
      case "$interp" in
        /nix/store/*/ld-linux*) return 0 ;;
        *) return 1 ;;
      esac
    }
    shopt -s nullglob
    cands=()
    if command -v lean >/dev/null 2>&1; then
      cands+=("$(readlink -f "$(command -v lean)")")
    fi
    cands+=(/tmp/patched-lean-*/bin/lean)
    cands+=("${HOME}/.elan/toolchains/"*/bin/lean)
    cands+=(/var/lib/elan/toolchains/*/bin/lean)
    cands+=(/nix/store/*-lean4-4.32.0/bin/lean)
    cands+=(/nix/store/*-lean4-4.32.0/bin/.lean-wrapped)
    lean_elf=""
    lean_interp=""
    for cand in "${cands[@]}"; do
      [[ -n "$cand" && -x "$cand" ]] || continue
      interp=$(_elf64_interp "$cand" || true)
      interp=${interp//$'\n'/}
      if _is_nix_store_ld "$interp"; then
        lean_elf="$cand"
        lean_interp="$interp"
        break
      fi
    done
    if [[ -z "$lean_elf" ]]; then
      echo "check-remote RED: no nix-store ELF lean (elan toolchain is stub-ld /lib64/ld-linux)" >&2
      echo "fail closed: will not invoke elan stub-ld" >&2
      exit 1
    fi
    lean_dir=$(dirname "$lean_elf")
    export PATH="${lean_dir}:${PATH}"
    echo "check-remote: nix-store ELF lean=${lean_elf}"
    echo "check-remote: PT_INTERP=${lean_interp}"
    uid=$(id -u)
    slice_max=$(systemctl show "user-${uid}.slice" -p MemoryMax --value 2>/dev/null || echo unknown)
    echo "check-remote: user-${uid}.slice MemoryMax=${slice_max} (256 GiB is 274877906944; 192 GiB is 206158430208)"
    echo "check-remote: user slice must be 256 GiB or the 256G scope loses (OOM at about 192 GiB; last walk exit 143 at 46/747)"
    as_bytes=$((256 * 1024 * 1024 * 1024))
    as_kb=$((256 * 1024 * 1024))
    walk=(env LEAN_NUM_THREADS=1 just slake-typecheck-src-systems)
    if command -v systemd-run >/dev/null 2>&1 \
       && systemd-run --user --scope -p MemoryMax=256G --quiet -- true; then
      echo "check-remote: systemd-run --user --scope MemoryMax=256G; nice 19"
      systemd-run --user --scope -p MemoryMax=256G --quiet -- nice -n 19 "${walk[@]}"
      exit $?
    fi
    if command -v prlimit >/dev/null 2>&1 \
       && prlimit --as="$as_bytes" -- true; then
      echo "check-remote: prlimit --as 256G; nice 19"
      prlimit --as="$as_bytes" -- nice -n 19 "${walk[@]}"
      exit $?
    fi
    if ulimit -v "$as_kb" 2>/dev/null; then
      echo "check-remote: ulimit -v 256G; nice 19"
      nice -n 19 "${walk[@]}"
      exit $?
    fi
    echo "check-remote RED: cannot apply 256 GiB cap on nixbuilder (no systemd-run MemoryMax, prlimit, or ulimit -v)" >&2
    echo "fail closed: will not run unbounded" >&2
    exit 1
    REMOTE

# Slake-owned replacement for (cd src/systems && lake build) / just bench-lake-host.
# Runs SystemsLean.PackageTypecheck via lean --run (chunked kernel compile of
# product modules; oleans durable under build/package-typecheck, not temp;
# leftover isolation-test Lean files omitted; occupancy living omitted;
# kitchen-sink barrel SystemsLean omitted; one Lean process per module).
# slakeOwnsPackageTypecheck stays false. FullHost stays false. Not Lake-gone.
# Not occupancy count. Not mill 69. Do not skip-GREEN on hostname horizon.
# Do not fold into just check. Do not invoke lake. Do not remill. Do not
# OccupancyProbe. Lean orchestrates chunks (no bash for-loop mill here).
# Greppable: slake-typecheck-src-systems, slakeOwnsPackageTypecheck
slake-typecheck-src-systems:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "slake-typecheck-src-systems: Slake kernel walk of lean_lib SystemsLean"
    echo "slakeOwnsPackageTypecheck false"
    echo "FullHost false"
    echo "not occupancy count; not mill 69; not Lake-gone"
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/PackageTypecheck.lean"
    # nixbuilder login PATH may omit elan. Not skip-GREEN: still fail if
    # no host Lean. Horizon without Lean stays red.
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-src-systems RED: miss lean not on PATH" >&2
      echo "package is not owned" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-src-systems RED: miss $src" >&2
      echo "package is not owned" >&2
      exit 1
    fi
    # Mill-class threads. OccupancyProbe stays 1 and is not this job.
    : "${LEAN_NUM_THREADS:=16}"
    export LEAN_NUM_THREADS
    # Durable oleans. Never IO.FS.createTempDir. Never under src/systems
    # sources. /build/ is gitignored.
    : "${SLAKE_OLEAN_DIR:=$root/build/package-typecheck}"
    # Library walk: named subset probes skip nested live compiles.
    # Prefix-only: do not export SLAKE_PACKAGE_TYPECHECK. A leftover
    # export would plant Lake probe builds if a later lake inherited
    # this env. Lake build of a probe leaves this unset. Not skip-GREEN.
    SLAKE_PACKAGE_TYPECHECK=1 SLAKE_OLEAN_DIR="$SLAKE_OLEAN_DIR" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src"

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
