# Modular just: just/slake-typecheck-closed-llvmlinearssa.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live LlvmLinearSsa library wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-llvmlinearssa then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. FullBackend false. Mill 69 of 69. Occupancy 49.
# Not mill 62 remill. Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# This wrap is not an LLVM backend claim. Do not emit LLVM IR. Do not create backend dest files.
# Modroot contains llvmlinearssa and does not contain llvmmultssa.
# Do not copy mill-entry HostFrontLiveLlvmLinearSsaMain oleans.
# Do not copy LlvmMultSsa wrap oleans. Do not import those modules.
# Do not wrap IrGraph.lean. Do not wrap Linear.lean (QTT Linear module).
# Do not wrap ComposeSubsetEmit.lean. Not a mill remill.

# Driver: SystemsLean/SlakeTypecheckLlvmLinearSsa.lean
# Greppable: slake-typecheck-llvmlinearssa, LLVM-LINEAR-SSA, HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA, PARSE-LIVE-LLVM-LINEAR-SSA, SKELETON.
# liveRel: src/systems/SystemsLean/LlvmLinearSsa.lean

slake-typecheck-llvmlinearssa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckLlvmLinearSsa.lean"
    live="$src_root/SystemsLean/LlvmLinearSsa.lean"
    modroot="$root/build/slake-typecheck-llvmlinearssa"
    echo "LLVM-LINEAR-SSA / HOST-SLAKE-TYPECHECK-LLVM-LINEAR-SSA"
    echo "dests skipped"
    echo "liveRel=src/systems/SystemsLean/LlvmLinearSsa.lean"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-llvmlinearssa RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-llvmlinearssa RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-llvmlinearssa RED: miss $live" >&2
      exit 1
    fi
    case "$modroot" in
      *llvmmultssa*)
        echo "slake-typecheck-llvmlinearssa RED: modroot must not contain llvmmultssa" >&2
        exit 1
        ;;
    esac
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-llvmlinearssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmlinearssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmtypesssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmtypesssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmprogramssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmprogramssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostimportgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostimportgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostcheckmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostcheckmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-productpathwritehcmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-productpathwritehcmain/SystemsLean"
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
    recd="-D maxRecDepth=131072 -D maxHeartbeats=8000000"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLlvmLinearSsaSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmLinearSsaSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLlvmLinearSsa.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmLinearSsa.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLlvmLinearSsaParserMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmLinearSsaParserMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
