# Modular just: just/slake-typecheck-closed-dualeqwritecapablegap.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live DualEqWriteCapableGap product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-dualeqwritecapablegap then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Root justfile does not import this module (dests skipped this slice).
# Mill wrap HostFrontLiveDualEqWriteCapableGapMain parses DualEqWriteCapableGapMain.lean only.
# Do not compile mill HostFrontLiveDualEqWriteCapableGapMain into this chain.
#
# Unique needles (own lines; trailing newline so they are not a prefix of mill wrap):
# HostFrontLiveDualEqWriteCapableGap
# PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP
# HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP
# SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_V0
# SlakeTypecheckDualEqWriteCapableGap
# HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP
# SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_V0
# slake-typecheck-dualeqwritecapablegap
# HostFrontLiveDualEqWriteCapableGapParserMain

# Driver: SystemsLean/SlakeTypecheckDualEqWriteCapableGap.lean
# Greppable: slake-typecheck-dualeqwritecapablegap, SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_V0, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP, PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP, SKELETON.

slake-typecheck-dualeqwritecapablegap:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckDualEqWriteCapableGap.lean"
    live="$src_root/SystemsLean/DualEqWriteCapableGap.lean"
    modroot="$root/build/slake-typecheck-dualeqwritecapablegap"
    echo "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_V0 / HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-dualeqwritecapablegap RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-dualeqwritecapablegap RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-dualeqwritecapablegap RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-dualeqwritecapablegapmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwritecapablegapmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteparity/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteparity/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-capablewritehc/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablewritehc/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteCapableGapSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteCapableGapSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteCapableGap.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteCapableGap.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
