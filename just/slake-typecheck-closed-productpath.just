# Modular just: just/slake-typecheck-closed-productpath.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPath product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpath then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not an LLVM backend.
# This wrap is ProductPath.lean. It is not ProductPathBars.lean.
# It is not ProductPathTheorems.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckProductPath.lean
# Live: SystemsLean/ProductPath.lean
# Greppable: slake-typecheck-productpath, SLAKE_TYPECHECK_PRODUCT_PATH, HOST-SLAKE-TYPECHECK-PRODUCT-PATH, PARSE-LIVE-PRODUCT-PATH.

slake-typecheck-productpath:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckProductPath.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckProductPath.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPath.lean"
    live="$src_root/SystemsLean/ProductPath.lean"
    modroot="$root/build/slake-typecheck-productpath"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH / HOST-SLAKE-TYPECHECK-PRODUCT-PATH"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpath RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpath RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpath RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPath.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPath.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
