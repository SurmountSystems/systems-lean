# Modular just: just/slake-typecheck-closed-productpathownershipregenerate.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathOwnershipRegenerate
# product wrap (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathownershipregenerate then lean --run.
# Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not a backend.
# This wrap is ProductPathOwnershipRegenerate.lean.
# It is not ProductPathOwnershipRegenerateTheorems.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckProductPathOwnershipRegenerate.lean
# Live: SystemsLean/ProductPathOwnershipRegenerate.lean
# Greppable: slake-typecheck-productpathownershipregenerate,
# SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE,
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE,
# PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
# PRODUCT-PATH-OWNERSHIP-REGENERATE.

slake-typecheck-productpathownershipregenerate:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckProductPathOwnershipRegenerate.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckProductPathOwnershipRegenerate.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathOwnershipRegenerate.lean"
    live="$src_root/SystemsLean/ProductPathOwnershipRegenerate.lean"
    modroot="$root/build/slake-typecheck-productpathownershipregenerate"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathownershipregenerate RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathownershipregenerate RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathownershipregenerate RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerate.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerate.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
