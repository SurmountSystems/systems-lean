# Modular just: just/slake-typecheck-closed-productpathperformstep.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathPerformStep product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathperformstep then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Not ProductPathPerformStepTheorems. Do not use that wrap's build directory.
#
# Unique needles (own lines; no THEOREMS suffix):
# HostFrontLiveProductPathPerformStep
# PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP
# HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP
# SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0
# SlakeTypecheckProductPathPerformStep
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP
# SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_V0
# slake-typecheck-productpathperformstep

# Driver: SystemsLean/SlakeTypecheckProductPathPerformStep.lean
# Greppable: slake-typecheck-productpathperformstep, SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP, PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP, SKELETON.

slake-typecheck-productpathperformstep:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathPerformStep.lean"
    live="$src_root/SystemsLean/ProductPathPerformStep.lean"
    modroot="$root/build/slake-typecheck-productpathperformstep"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathperformstep RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathperformstep RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathperformstep RED: miss $live" >&2
      exit 1
    fi
    unset LEAN_PATH || true
    leanlib="$(lean --print-libdir)"
    case "$leanlib" in
      *"/build/slake-typecheck-"*|*"/.lake/"*)
        echo "slake-typecheck-productpathperformstep RED: lean libdir is a module build tree: $leanlib" >&2
        exit 1
        ;;
    esac
    export LEAN_PATH="${modroot}:${leanlib}"
    export LEAN_NUM_THREADS=1
    echo "LEAN_NUM_THREADS=${LEAN_NUM_THREADS}"
    echo "LEAN_PATH=${LEAN_PATH}"
    echo "build=${modroot}"
    echo "liveRel=ProductPathPerformStep.lean"
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
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathPerformStepSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathPerformStepSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathPerformStep.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathPerformStep.lean"
    nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
