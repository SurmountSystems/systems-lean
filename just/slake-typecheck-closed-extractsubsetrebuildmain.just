# Modular just: just/slake-typecheck-closed-extractsubsetrebuildmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ExtractSubsetRebuildMain mill Main wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-extractsubsetrebuildmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill (just twenty-sixth-host-tool / inventory table row 39). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses ExtractSubsetRebuildMain.lean only. Do not wrap ExtractSubsetRebuild.lean.
# Do not steal HostFrontLiveExtractMain. Do not steal HostFrontLiveExtract.
# Do not invent HostFrontLiveExtractSubsetRebuild (library wrap).
# This wrap is not ExtractSubsetEmitMain. This wrap is not Extract.lean.
# Not Linear. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain. Not CapableComposeMain.
# Do not copy GraphSubsetRebuildMain wrap dest oleans.
# Do not copy ErasureSubsetRebuildMain wrap dest oleans
# (HostFrontLiveGraphSubsetRebuildMain*.olean, HostFrontLiveErasureSubsetRebuildMain*.olean)
# as this mill parser. Shared Host* oleans from prefix dirs are OK.
# Do not copy ExtractSubsetEmitMain wrap dest oleans (HostFrontLiveExtractSubsetEmitMain*.olean)
# as this mill parser.

# Driver: SystemsLean/SlakeTypecheckExtractSubsetRebuildMain.lean
# Greppable: slake-typecheck-extractsubsetrebuildmain, SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD_MAIN_V0, HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD-MAIN, PARSE-LIVE-EXTRACT-SUBSET-REBUILD-MAIN, EXTRACT-SUBSET-REBUILD-MAIN, HOST-EXTRACT-SUBSET-REBUILD-MAIN, SKELETON.

slake-typecheck-extractsubsetrebuildmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckExtractSubsetRebuildMain.lean"
    live="$src_root/SystemsLean/ExtractSubsetRebuildMain.lean"
    modroot="$root/build/slake-typecheck-extractsubsetrebuildmain"
    echo "SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD_MAIN_V0 / HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-extractsubsetrebuildmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-extractsubsetrebuildmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-extractsubsetrebuildmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-extractsubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-extractsubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-programsubsetrebuildmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-programsubsetrebuildmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-installoutmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-installoutmain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtractSubsetRebuildMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtractSubsetRebuildMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtractSubsetRebuildMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtractSubsetRebuildMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
