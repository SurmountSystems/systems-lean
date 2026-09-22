# Modular just: just/slake-typecheck-closed-productpathcomposeplantheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathComposePlanTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathcomposeplantheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
#
# Unique needles (own lines; THEOREMS suffix so they are not a prefix of the library wrap):
# HostFrontLiveProductPathComposePlanTheorems
# PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
# HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
# SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0
# SlakeTypecheckProductPathComposePlanTheorems
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
# SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0
# slake-typecheck-productpathcomposeplantheorems

# Driver: SystemsLean/SlakeTypecheckProductPathComposePlanTheorems.lean
# Greppable: slake-typecheck-productpathcomposeplantheorems, SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS, PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS, SKELETON.

slake-typecheck-productpathcomposeplantheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathComposePlanTheorems.lean"
    live="$src_root/SystemsLean/ProductPathComposePlanTheorems.lean"
    modroot="$root/build/slake-typecheck-productpathcomposeplantheorems"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathcomposeplantheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathcomposeplantheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathcomposeplantheorems RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathComposePlanTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathComposePlanTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathComposePlanTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathComposePlanTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
