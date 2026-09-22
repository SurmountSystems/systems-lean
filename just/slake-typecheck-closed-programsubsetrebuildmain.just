# Modular just: just/slake-typecheck-closed-programsubsetrebuildmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProgramSubsetRebuildMain mill Main wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-programsubsetrebuildmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill (just twenty-fifth-host-tool / inventory table row 37). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses ProgramSubsetRebuildMain.lean only. Do not wrap ProgramSubsetRebuild.lean.
# Do not steal HostFrontLiveProgramMain. Do not invent HostFrontLiveProgram.
# This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
# Not Linear. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain. Not CapableComposeMain.
# Do not copy TypesSubsetRebuildMain wrap dest oleans.
# Do not copy ProgramSubsetEmitMain wrap dest oleans (HostFrontLiveProgramSubsetEmitMain*.olean)
# as this mill parser. Shared Host* oleans from that prefix dir are OK.

# Driver: SystemsLean/SlakeTypecheckProgramSubsetRebuildMain.lean
# Greppable: slake-typecheck-programsubsetrebuildmain, SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD_MAIN_V0, HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD-MAIN, PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN, PROGRAM-SUBSET-REBUILD-MAIN, HOST-PROGRAM-SUBSET-REBUILD-MAIN, SKELETON.

slake-typecheck-programsubsetrebuildmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProgramSubsetRebuildMain.lean"
    live="$src_root/SystemsLean/ProgramSubsetRebuildMain.lean"
    modroot="$root/build/slake-typecheck-programsubsetrebuildmain"
    echo "SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD_MAIN_V0 / HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-programsubsetrebuildmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-programsubsetrebuildmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-programsubsetrebuildmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-programsubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-programsubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-productpathownershipregeneratemain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-productpathownershipregeneratemain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProgramSubsetRebuildMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProgramSubsetRebuildMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProgramSubsetRebuildMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveProgramSubsetRebuildMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
