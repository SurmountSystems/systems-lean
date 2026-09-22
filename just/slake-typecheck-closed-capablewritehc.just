# Modular just: just/slake-typecheck-closed-capablewritehc.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live CapableWriteHc product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-capablewritehc then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill remill. Root justfile does not import this module (dests skipped this slice).
# Mill wrap HostFrontLiveCapableWriteHcMain parses CapableWriteHcMain.lean only.
# Do not compile mill HostFrontLiveCapableWriteHcMain into this chain.
#
# Unique needles (own lines; trailing newline so they are not a prefix of mill wrap):
# HostFrontLiveCapableWriteHc
# PARSE-LIVE-CAPABLE-WRITE-HC
# HOST-FRONT-LIVE-CAPABLE-WRITE-HC
# SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_V0
# SlakeTypecheckCapableWriteHc
# HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC
# SLAKE_TYPECHECK_CAPABLE_WRITE_HC_V0
# slake-typecheck-capablewritehc
# HostFrontLiveCapableWriteHcParserMain

# Driver: SystemsLean/SlakeTypecheckCapableWriteHc.lean
# Greppable: slake-typecheck-capablewritehc, SLAKE_TYPECHECK_CAPABLE_WRITE_HC_V0, HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC, PARSE-LIVE-CAPABLE-WRITE-HC, SKELETON.

slake-typecheck-capablewritehc:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckCapableWriteHc.lean"
    live="$src_root/SystemsLean/CapableWriteHc.lean"
    modroot="$root/build/slake-typecheck-capablewritehc"
    echo "SLAKE_TYPECHECK_CAPABLE_WRITE_HC_V0 / HOST-SLAKE-TYPECHECK-CAPABLE-WRITE-HC"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-capablewritehc RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-capablewritehc RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-capablewritehc RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-capablewritehcmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capablewritehcmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteapi/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteapi/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostresidualshrinktermok/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostresidualshrinktermok/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCapableWriteHcSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveCapableWriteHcSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveCapableWriteHc.olean" \
      "$src_root/SystemsLean/HostFrontLiveCapableWriteHc.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
