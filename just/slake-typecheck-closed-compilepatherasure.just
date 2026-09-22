# Modular just: just/slake-typecheck-closed-compilepatherasure.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live CompilePathErasure product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-compilepatherasure then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).

# Driver: SystemsLean/SlakeTypecheckCompilePathErasure.lean
# Greppable: slake-typecheck-compilepatherasure, SLAKE_TYPECHECK_COMPILE_PATH_ERASURE_V0, HOST-SLAKE-TYPECHECK-COMPILE-PATH-ERASURE, PARSE-LIVE-COMPILE-PATH-ERASURE, COMPILE-PATH-ERASURE, SKELETON.

slake-typecheck-compilepatherasure:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckCompilePathErasure.lean"
    live="$src_root/SystemsLean/CompilePathErasure.lean"
    modroot="$root/build/slake-typecheck-compilepatherasure"
    echo "SLAKE_TYPECHECK_COMPILE_PATH_ERASURE_V0 / HOST-SLAKE-TYPECHECK-COMPILE-PATH-ERASURE"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-compilepatherasure RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-compilepatherasure RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-compilepatherasure RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    graph_mod="$root/build/slake-typecheck-compilepathgraph/SystemsLean"
    if [[ -d "$graph_mod" ]]; then
      for o in Mult HostTerm HostFrontGoldens HostFront HostKernel \
        HostFrontLiveMult HostFrontLiveTypes HostFrontLiveExtract \
        HostFrontLiveHostTermSource HostFrontLiveHostTerm; do
        if [[ -f "$graph_mod/${o}.olean" ]]; then
          cp -f "$graph_mod/${o}.olean" "$modroot/SystemsLean/${o}.olean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCompilePathErasureSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveCompilePathErasureSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCompilePathErasure.olean" \
      "$src_root/SystemsLean/HostFrontLiveCompilePathErasure.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
