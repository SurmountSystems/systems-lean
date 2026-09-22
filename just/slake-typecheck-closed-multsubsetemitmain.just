# Modular just: just/slake-typecheck-closed-multsubsetemitmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live MultSubsetEmitMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-multsubsetemitmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Root justfile does not import this module (dests skipped this slice).

# Driver: SystemsLean/SlakeTypecheckMultSubsetEmitMain.lean
# Greppable: slake-typecheck-multsubsetemitmain, SLAKE_TYPECHECK_MULT_SUBSET_EMIT_MAIN_V0, HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT-MAIN, PARSE-LIVE-MULT-SUBSET-EMIT-MAIN, MULT-SUBSET-EMIT-MAIN, HOST-MULT-SUBSET-EMIT-MAIN, SKELETON.

slake-typecheck-multsubsetemitmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckMultSubsetEmitMain.lean"
    live="$src_root/SystemsLean/MultSubsetEmitMain.lean"
    modroot="$root/build/slake-typecheck-multsubsetemitmain"
    echo "SLAKE_TYPECHECK_MULT_SUBSET_EMIT_MAIN_V0 / HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-multsubsetemitmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-multsubsetemitmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-multsubsetemitmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-graphsubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-graphsubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostgraphmain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMultSubsetEmitMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveMultSubsetEmitMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMultSubsetEmitMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveMultSubsetEmitMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
