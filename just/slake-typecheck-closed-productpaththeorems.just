# Modular just: just/slake-typecheck-closed-productpaththeorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathTheorems product wrap.
# Compiles the import chain to oleans under
# build/slake-typecheck-productpaththeorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not imported from the root justfile. Lake is not gone.

# Driver: SystemsLean/SlakeTypecheckProductPathTheorems.lean
# Greppable: slake-typecheck-productpaththeorems, SLAKE_TYPECHECK_PRODUCT_PATH_THEOREMS_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-THEOREMS, PARSE-LIVE-PRODUCTPATHTHEOREMS, PRODUCT-PATH-THEOREM, PRODUCT-PATH-SMOKE, SKELETON.

slake-typecheck-productpaththeorems:
    #!/usr/bin/env bash
    set -euo pipefail
    # just -f runs the shell in the justfile directory. The repo root is
    # the parent. Stay put when the shell is already at the repo root.
    if [[ ! -f src/systems/SystemsLean/ProductPathTheorems.lean && -f ../src/systems/SystemsLean/ProductPathTheorems.lean ]]; then
      cd ..
    fi
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathTheorems.lean"
    live="$src_root/SystemsLean/ProductPathTheorems.lean"
    modroot="$root/build/slake-typecheck-productpaththeorems"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpaththeorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpaththeorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpaththeorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveProductPathTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveProductPathTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
