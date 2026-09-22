# Modular just: just/slake-typecheck-closed-compilepathplan.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live CompilePathPlan product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-compilepathplan then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).

# Driver: SystemsLean/SlakeTypecheckCompilePathPlan.lean
# Greppable: slake-typecheck-compilepathplan, SLAKE_TYPECHECK_COMPILE_PATH_PLAN_V0, HOST-SLAKE-TYPECHECK-COMPILE-PATH-PLAN, PARSE-LIVE-COMPILE-PATH-PLAN, COMPILE-PATH-PLAN, SKELETON.

slake-typecheck-compilepathplan:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckCompilePathPlan.lean"
    live="$src_root/SystemsLean/CompilePathPlan.lean"
    modroot="$root/build/slake-typecheck-compilepathplan"
    echo "SLAKE_TYPECHECK_COMPILE_PATH_PLAN_V0 / HOST-SLAKE-TYPECHECK-COMPILE-PATH-PLAN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-compilepathplan RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-compilepathplan RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-compilepathplan RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCompilePathPlanSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveCompilePathPlanSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCompilePathPlan.olean" \
      "$src_root/SystemsLean/HostFrontLiveCompilePathPlan.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
