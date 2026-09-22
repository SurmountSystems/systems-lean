# Modular just: just/slake-typecheck-closed-productoutkerneltheorems.just. Thin wrapper.
# Closed-subset Slake typecheck driver for live ProductOutKernelTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productoutkerneltheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
#
# Unique needles (own lines; THEOREMS suffix so they are not a prefix of a shorter name):
# HostFrontLiveProductOutKernelTheorems
# PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
# HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
# SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_THEOREMS_V0
# SlakeTypecheckProductOutKernelTheorems
# HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL-THEOREMS
# SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL_THEOREMS_V0
# slake-typecheck-productoutkerneltheorems

# Driver: SystemsLean/SlakeTypecheckProductOutKernelTheorems.lean
# Greppable: slake-typecheck-productoutkerneltheorems, SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL_THEOREMS_V0, HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL-THEOREMS, PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS, SKELETON.

slake-typecheck-productoutkerneltheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductOutKernelTheorems.lean"
    live="$src_root/SystemsLean/ProductOutKernelTheorems.lean"
    modroot="$root/build/slake-typecheck-productoutkerneltheorems"
    echo "SLAKE_TYPECHECK_PRODUCT_OUT_KERNEL_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-OUT-KERNEL-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productoutkerneltheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productoutkerneltheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productoutkerneltheorems RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductOutKernelTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductOutKernelTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductOutKernelTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductOutKernelTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
