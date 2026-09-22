# Modular just: just/slake-typecheck-closed-typessubsetrebuildmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live TypesSubsetRebuildMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-typessubsetrebuildmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 35 remill. Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# This wrap is not TypesSubsetEmitMain.

# Driver: SystemsLean/SlakeTypecheckTypesSubsetRebuildMain.lean
# Greppable: slake-typecheck-typessubsetrebuildmain, SLAKE_TYPECHECK_TYPES_SUBSET_REBUILD_MAIN_V0, HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD-MAIN, PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN, TYPES-SUBSET-REBUILD-MAIN, HOST-TYPES-SUBSET-REBUILD-MAIN, SKELETON.

slake-typecheck-typessubsetrebuildmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckTypesSubsetRebuildMain.lean"
    live="$src_root/SystemsLean/TypesSubsetRebuildMain.lean"
    modroot="$root/build/slake-typecheck-typessubsetrebuildmain"
    echo "SLAKE_TYPECHECK_TYPES_SUBSET_REBUILD_MAIN_V0 / HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-typessubsetrebuildmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-typessubsetrebuildmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-typessubsetrebuildmain RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypesSubsetRebuildMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypesSubsetRebuildMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypesSubsetRebuildMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypesSubsetRebuildMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
