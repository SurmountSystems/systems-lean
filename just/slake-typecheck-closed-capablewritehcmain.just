# Modular just: just/slake-typecheck-closed-capablewritehcmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live CapableWriteHcMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-capablewritehcmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Root justfile does not import this module (dests skipped this slice).

# Driver: SystemsLean/SlakeTypecheckCapableWriteHcMain.lean
# Greppable: slake-typecheck-capablewritehcmain, SLAKE_TYPECHECK_CAPABLE_WRITE_HC_MAIN_V0, HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-MAIN, PARSE-LIVE-CAPABLE-WRITE-HC-MAIN, CAPABLE-WRITE-HC-MAIN, SKELETON.

slake-typecheck-capablewritehcmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckCapableWriteHcMain.lean"
    live="$src_root/SystemsLean/CapableWriteHcMain.lean"
    modroot="$root/build/slake-typecheck-capablewritehcmain"
    echo "SLAKE_TYPECHECK_CAPABLE_WRITE_HC_MAIN_V0 / HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-capablewritehcmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-capablewritehcmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-capablewritehcmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-capablefullbarmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablefullbarmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-capablereadmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablereadmain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCapableWriteHcMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveCapableWriteHcMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCapableWriteHcMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveCapableWriteHcMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
