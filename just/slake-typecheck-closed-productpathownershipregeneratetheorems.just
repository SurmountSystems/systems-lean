# Modular just: just/slake-typecheck-closed-productpathownershipregeneratetheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathOwnershipRegenerateTheorems
# product wrap (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathownershipregeneratetheorems then lean --run.
# Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Do not grow just/slake-typecheck-closed-productpathownershipregeneratemain.just
# (owned by the ProductPathOwnershipRegenerateMain wrap).
# Not ProductPathOwnershipRegenerate.lean. Not ProductPathOwnershipInputsTheorems.
# Not ProductPathPerformTheorems.
#
# Unique needles (own lines; trailing newline so they are not a prefix of the
# ProductPathOwnershipRegenerateMain wrap):
# HostFrontLiveProductPathOwnershipRegenerateTheorems
# PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
# HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
# SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0
# SlakeTypecheckProductPathOwnershipRegenerateTheorems
# HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
# SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0
# slake-typecheck-productpathownershipregeneratetheorems
# HostFrontLiveProductPathOwnershipRegenerateTheoremsMain

# Driver: SystemsLean/SlakeTypecheckProductPathOwnershipRegenerateTheorems.lean
# Greppable: slake-typecheck-productpathownershipregeneratetheorems, SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS, PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS, SKELETON.

slake-typecheck-productpathownershipregeneratetheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathOwnershipRegenerateTheorems.lean"
    live="$src_root/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean"
    modroot="$root/build/slake-typecheck-productpathownershipregeneratetheorems"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathownershipregeneratetheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathownershipregeneratetheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathownershipregeneratetheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-kernellineartheorems/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-kernellineartheorems/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-kerneltypestheorems/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-kerneltypestheorems/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-kernellinear/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-kernellinear/SystemsLean"
    fi
    if [[ -n "$prefix_mod" ]]; then
      for o in Mult HostTerm HostFrontGoldens HostFront HostKernel \
        HostFrontLiveMult HostFrontLiveTypes HostFrontLiveExtract \
        HostFrontLiveHostTermSource HostFrontLiveHostTerm; do
        if [[ -f "$prefix_mod/${o}.olean" ]]; then
          cp -f "$prefix_mod/${o}.olean" "$modroot/SystemsLean/${o}.olean"
        fi
      done
    fi
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
