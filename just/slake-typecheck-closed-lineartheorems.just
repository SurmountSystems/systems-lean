# Modular just: just/slake-typecheck-closed-lineartheorems.just. Thin wrapper.
# Closed-subset Slake typecheck driver for live LinearTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-lineartheorems then lean --run. Not mill leanc. Not lake on the step.
# This wrap parses LinearTheorems.lean only. Not the Linear.lean library.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
#
# Unique needles (own lines; THEOREMS suffix so they are not a prefix of a shorter name):
# HostFrontLiveLinearTheorems
# PARSE-LIVE-LINEAR-THEOREMS
# HOST-FRONT-LIVE-LINEAR-THEOREMS
# SLAKE_HOST_FRONT_LIVE_LINEAR_THEOREMS_V0
# SlakeTypecheckLinearTheorems
# HOST-SLAKE-TYPECHECK-LINEAR-THEOREMS
# SLAKE_TYPECHECK_LINEAR_THEOREMS_V0
# slake-typecheck-lineartheorems

# Driver: SystemsLean/SlakeTypecheckLinearTheorems.lean
# Greppable: slake-typecheck-lineartheorems, SLAKE_TYPECHECK_LINEAR_THEOREMS_V0, HOST-SLAKE-TYPECHECK-LINEAR-THEOREMS, PARSE-LIVE-LINEAR-THEOREMS, SKELETON.

slake-typecheck-lineartheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckLinearTheorems.lean"
    live="$src_root/SystemsLean/LinearTheorems.lean"
    modroot="$root/build/slake-typecheck-lineartheorems"
    echo "SLAKE_TYPECHECK_LINEAR_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-LINEAR-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-lineartheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-lineartheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-lineartheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLinearTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveLinearTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLinearTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveLinearTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
