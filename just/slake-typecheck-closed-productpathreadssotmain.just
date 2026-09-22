# Modular just: just/slake-typecheck-closed-productpathreadssotmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathReadSsotMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathreadssotmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# Do not copy sibling ProductPathWriteHcMain wrap oleans as this wrap's parser.
# Do not copy HostFrontLiveProductPathReadSsot library oleans (that file must not exist).
# Do not wrap ProductPathReadSsot.lean. Do not wrap ProductPathReadSsotTheorems.lean.

# Driver: SystemsLean/SlakeTypecheckProductPathReadSsotMain.lean
# Greppable: slake-typecheck-productpathreadssotmain, SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_MAIN_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-MAIN, PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN, PRODUCT-PATH-READ-SSOT-MAIN, HOST-PRODUCT-PATH-READ-SSOT-MAIN, SKELETON.

slake-typecheck-productpathreadssotmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathReadSsotMain.lean"
    live="$src_root/SystemsLean/ProductPathReadSsotMain.lean"
    modroot="$root/build/slake-typecheck-productpathreadssotmain"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_MAIN_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathreadssotmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathreadssotmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathreadssotmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-productpathwritehcmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-productpathwritehcmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmgraphssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmgraphssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmtypesssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmtypesssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostimportgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostimportgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostcheckmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostcheckmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-capablewritehcmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablewritehcmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-erasuresubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-erasuresubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-multfswritemain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-multfswritemain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-capablefullbarmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablefullbarmain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathReadSsotMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathReadSsotMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathReadSsotMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathReadSsotMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
