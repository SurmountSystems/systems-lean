# Modular just: just/slake-typecheck-closed-dualeqwriteparitymain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live DualEqWriteParityMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-dualeqwriteparitymain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 14 remill (fourteenth-host-tool ELF already exists; inventory row 17).
# Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# This wrap parses DualEqWriteParityMain.lean only. Do not wrap DualEqWriteParity.lean.
# Do not invent HostFrontLiveDualEqWriteParity. Do not steal DualEqWriteApi companions.
# DualEqWrite.lean does not exist. Not Linear. Not IrGraph. Not ComposeSubsetEmit.
# Not CapableComposeMain. Not HostModuleCheckMain.
# Do not copy DualEqWriteApi or DualEqWriteApiMain oleans as this wrap's parser.
# Reuse prefix oleans HostFrontLiveHostTerm chain ONLY: Mult, HostTerm,
# HostFrontGoldens, HostFront, HostKernel, HostFrontLiveMult, HostFrontLiveTypes,
# HostFrontLiveExtract, HostFrontLiveHostTermSource, HostFrontLiveHostTerm.

# Driver: SystemsLean/SlakeTypecheckDualEqWriteParityMain.lean
# Greppable: slake-typecheck-dualeqwriteparitymain, SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_MAIN_V0, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-MAIN, PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN, DUAL-EQ-WRITE-PARITY-MAIN, HOST-DUAL-EQ-WRITE-PARITY-MAIN, SKELETON.

slake-typecheck-dualeqwriteparitymain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckDualEqWriteParityMain.lean"
    live="$src_root/SystemsLean/DualEqWriteParityMain.lean"
    modroot="$root/build/slake-typecheck-dualeqwriteparitymain"
    echo "SLAKE_TYPECHECK_DUAL_EQ_WRITE_PARITY_MAIN_V0 / HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-PARITY-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-dualeqwriteparitymain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-dualeqwriteparitymain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-dualeqwriteparitymain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-productpathreadssotmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-productpathreadssotmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-linearsubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-linearsubsetemitmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteapi/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteapi/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteParityMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteParityMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveDualEqWriteParityMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveDualEqWriteParityMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
