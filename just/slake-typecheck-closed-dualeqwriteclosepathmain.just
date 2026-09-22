# Modular just: just/slake-typecheck-closed-dualeqwriteclosepathmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live DualEqWriteClosePathMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-dualeqwriteclosepathmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 15 remill (just fifteenth-host-tool). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses DualEqWriteClosePathMain.lean only. Do not wrap DualEqWriteClosePath.lean.
# Do not invent HostFrontLiveDualEqWriteClosePath. Do not wrap Linear.lean.
# Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain. Not CapableComposeMain.
# Do not copy sibling DualEqWriteParityMain wrap oleans as this wrap.
# Do not copy DualEqWriteApiMain wrap dest oleans as this wrap dest (prefix chain only).
# Do not wrap DualEqWriteApiMain. DualEqWrite.lean does not exist.

# Driver: SystemsLean/SlakeTypecheckDualEqWriteClosePathMain.lean
# Greppable: slake-typecheck-dualeqwriteclosepathmain, SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-MAIN, PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN, DUAL-EQ-WRITE-CLOSE-PATH-MAIN, HOST-DUAL-EQ-WRITE-CLOSE-PATH-MAIN, SKELETON.

slake-typecheck-dualeqwriteclosepathmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckDualEqWriteClosePathMain.lean"
    live="$src_root/SystemsLean/DualEqWriteClosePathMain.lean"
    modroot="$root/build/slake-typecheck-dualeqwriteclosepathmain"
    echo "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0 / HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CLOSE-PATH-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-dualeqwriteclosepathmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-dualeqwriteclosepathmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-dualeqwriteclosepathmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-llvmgraphssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmgraphssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-linearsubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-linearsubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmtypesssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmtypesssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostimportgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostimportgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteapimain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteapimain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteClosePathMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteClosePathMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteClosePathMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteClosePathMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
