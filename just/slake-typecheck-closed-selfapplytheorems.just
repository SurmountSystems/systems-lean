# Modular just: just/slake-typecheck-closed-selfapplytheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live SelfApplyTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-selfapplytheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Do not grow just/slake-typecheck-closed-selfapplyfsclose.just (owned by SelfApplyFsClose wrap).
# Compile dependencies into this build directory only. Do not copy another wrap's oleans.
# Not HostFrontLiveSelfApplyFsClose (that wrap parses SelfApplyFsClose.lean).
# LEAN_PATH is only build/slake-typecheck-selfapplytheorems. Never another module build tree.
#
# Unique needles (own lines; THEOREMS suffix so they are not a prefix of a shorter name):
# HostFrontLiveSelfApplyTheorems
# PARSE-LIVE-SELF-APPLY-THEOREMS
# HOST-FRONT-LIVE-SELF-APPLY-THEOREMS
# SLAKE_HOST_FRONT_LIVE_SELF_APPLY_THEOREMS_V0
# SlakeTypecheckSelfApplyTheorems
# HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS
# SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0
# slake-typecheck-selfapplytheorems
# HostFrontLiveSelfApplyTheoremsMain

# Driver: SystemsLean/SlakeTypecheckSelfApplyTheorems.lean
# Greppable: slake-typecheck-selfapplytheorems, SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0, HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS, PARSE-LIVE-SELF-APPLY-THEOREMS, SKELETON.

slake-typecheck-selfapplytheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckSelfApplyTheorems.lean"
    live="$src_root/SystemsLean/SelfApplyTheorems.lean"
    modroot="$root/build/slake-typecheck-selfapplytheorems"
    unset LEAN_PATH || true
    echo "SLAKE_TYPECHECK_SELF_APPLY_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-SELF-APPLY-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-selfapplytheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-selfapplytheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-selfapplytheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    echo "LEAN_PATH=$modroot"
    echo "lean_libdir=$(lean --print-libdir)"
    recd="-D maxRecDepth=8192"
    compile_one() {
      local name="$1"
      local srcf="$src_root/SystemsLean/${name}.lean"
      local ole="$modroot/SystemsLean/${name}.olean"
      if [[ -f "$ole" && "$ole" -nt "$srcf" ]]; then
        return 0
      fi
      if [[ "$name" == "Mult" ]]; then
        nice -n 19 lean -R "$src_root" $recd -o "$ole" "$srcf"
      else
        LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$ole" "$srcf"
      fi
    }
    compile_one Mult
    compile_one HostTerm
    compile_one HostFrontGoldens
    compile_one HostFront
    compile_one HostKernel
    compile_one HostFrontLiveMult
    compile_one HostFrontLiveTypes
    compile_one HostFrontLiveExtract
    compile_one HostFrontLiveHostTermSource
    compile_one HostFrontLiveHostTerm
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSelfApplyTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveSelfApplyTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSelfApplyTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveSelfApplyTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
