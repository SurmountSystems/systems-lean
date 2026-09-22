# Modular just: just/slake-typecheck-closed-productpathperform.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathPerform product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathperform then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Not ProductPathPerformTheorems. Do not use that wrap's build directory.
#
# Unique needles (own lines; no THEOREMS suffix):
# HostFrontLiveProductPathPerform
# PARSE-LIVE-PRODUCT-PATH-PERFORM
# HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM
# SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_V0
# SlakeTypecheckProductPathPerform
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM
# SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_V0
# slake-typecheck-productpathperform

# Driver: SystemsLean/SlakeTypecheckProductPathPerform.lean
# Greppable: slake-typecheck-productpathperform, SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM, PARSE-LIVE-PRODUCT-PATH-PERFORM, SKELETON.

slake-typecheck-productpathperform:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathPerform.lean"
    live="$src_root/SystemsLean/ProductPathPerform.lean"
    modroot="$root/build/slake-typecheck-productpathperform"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathperform RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathperform RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathperform RED: miss $live" >&2
      exit 1
    fi
    unset LEAN_PATH || true
    leanlib="$(lean --print-libdir)"
    case "$leanlib" in
      *"/build/slake-typecheck-"*|*"/.lake/"*)
        echo "slake-typecheck-productpathperform RED: lean libdir is a module build tree: $leanlib" >&2
        exit 1
        ;;
    esac
    export LEAN_PATH="${modroot}:${leanlib}"
    export LEAN_NUM_THREADS=1
    echo "LEAN_NUM_THREADS=${LEAN_NUM_THREADS}"
    echo "LEAN_PATH=${LEAN_PATH}"
    echo "build=${modroot}"
    echo "liveRel=ProductPathPerform.lean"
    mkdir -p "$modroot/SystemsLean"
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathPerformSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathPerformSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathPerform.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathPerform.lean"
    nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
