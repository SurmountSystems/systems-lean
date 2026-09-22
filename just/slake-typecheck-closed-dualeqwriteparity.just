# Modular just: just/slake-typecheck-closed-dualeqwriteparity.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live DualEqWriteParity product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-dualeqwriteparity then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Root justfile does not import this module (dests skipped this slice).
# Mill wrap HostFrontLiveDualEqWriteParityMain parses DualEqWriteParityMain.lean only.
# Do not compile mill HostFrontLiveDualEqWriteParityMain into this chain.
#
# Unique needles (own lines; trailing newline so they are not a prefix of mill wrap):
# HostFrontLiveDualEqWriteParity
# PARSE-LIVE-DUAL-EQ-WRITE-PARITY
# HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY
# SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_V0
# SlakeTypecheckDualEqWriteParity
# HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY
# SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_V0
# slake-typecheck-dualeqwriteparity
# HostFrontLiveDualEqWriteParityParserMain

# Driver: SystemsLean/SlakeTypecheckDualEqWriteParity.lean
# Greppable: slake-typecheck-dualeqwriteparity, SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_V0, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY, PARSE-LIVE-DUAL-EQ-WRITE-PARITY, SKELETON.

slake-typecheck-dualeqwriteparity:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckDualEqWriteParity.lean"
    live="$src_root/SystemsLean/DualEqWriteParity.lean"
    modroot="$root/build/slake-typecheck-dualeqwriteparity"
    echo "SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_V0 / HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-dualeqwriteparity RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-dualeqwriteparity RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-dualeqwriteparity RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-dualeqwriteparitymain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteparitymain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteParitySource.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteParitySource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteParity.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteParity.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
