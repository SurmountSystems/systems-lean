# Modular just: just/slake-typecheck-closed-productpathownershipinputs.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathOwnershipInputs product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathownershipinputs then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Not ProductPathOwnershipInputsTheorems. Do not use that wrap's build directory.
#
# Unique needles (own lines; no THEOREMS suffix):
# HostFrontLiveProductPathOwnershipInputs
# PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
# HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
# SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_V0
# SlakeTypecheckProductPathOwnershipInputs
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS
# SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_V0
# slake-typecheck-productpathownershipinputs

# Driver: SystemsLean/SlakeTypecheckProductPathOwnershipInputs.lean
# Greppable: slake-typecheck-productpathownershipinputs, SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS, PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS, SKELETON.

slake-typecheck-productpathownershipinputs:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathOwnershipInputs.lean"
    live="$src_root/SystemsLean/ProductPathOwnershipInputs.lean"
    modroot="$root/build/slake-typecheck-productpathownershipinputs"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathownershipinputs RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathownershipinputs RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathownershipinputs RED: miss $live" >&2
      exit 1
    fi
    unset LEAN_PATH || true
    leanlib="$(lean --print-libdir)"
    case "$leanlib" in
      *"/build/slake-typecheck-"*|*"/.lake/"*)
        echo "slake-typecheck-productpathownershipinputs RED: lean libdir is a module build tree: $leanlib" >&2
        exit 1
        ;;
    esac
    export LEAN_PATH="${modroot}:${leanlib}"
    export LEAN_NUM_THREADS=1
    echo "LEAN_NUM_THREADS=${LEAN_NUM_THREADS}"
    echo "LEAN_PATH=${LEAN_PATH}"
    echo "build=${modroot}"
    echo "liveRel=ProductPathOwnershipInputs.lean"
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
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipInputsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipInputsSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipInputs.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipInputs.lean"
    nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
