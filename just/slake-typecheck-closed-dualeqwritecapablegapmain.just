# Modular just: just/slake-typecheck-closed-dualeqwritecapablegapmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live DualEqWriteCapableGapMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-dualeqwritecapablegapmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 16 remill (just sixteenth-host-tool / inventory row 20). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses DualEqWriteCapableGapMain.lean only. Do not wrap DualEqWriteCapableGap.lean.
# Do not invent HostFrontLiveDualEqWriteCapableGap. Do not wrap Linear.lean.
# Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain. Not CapableComposeMain.
# Do not copy sibling DualEqWriteParityMain wrap dest oleans.
# Do not copy sibling DualEqWriteClosePathMain wrap dest oleans.
# Do not copy HostFrontLiveDualEqWriteCapableGap library oleans (that file must not exist).
# Do not steal DualEqWriteApiMain wrap dest oleans as this wrap.

# Driver: SystemsLean/SlakeTypecheckDualEqWriteCapableGapMain.lean
# Greppable: slake-typecheck-dualeqwritecapablegapmain, SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_MAIN_V0, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN, PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN, DUAL-EQ-WRITE-CAPABLE-GAP-MAIN, HOST-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN, SKELETON.

slake-typecheck-dualeqwritecapablegapmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckDualEqWriteCapableGapMain.lean"
    live="$src_root/SystemsLean/DualEqWriteCapableGapMain.lean"
    modroot="$root/build/slake-typecheck-dualeqwritecapablegapmain"
    echo "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_MAIN_V0 / HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-dualeqwritecapablegapmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-dualeqwritecapablegapmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-dualeqwritecapablegapmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-installoutmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-installoutmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-llvmgraphssamain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-llvmgraphssamain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteapi/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteapi/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-capableregeneratemain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capableregeneratemain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteCapableGapMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteCapableGapMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteCapableGapMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteCapableGapMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
