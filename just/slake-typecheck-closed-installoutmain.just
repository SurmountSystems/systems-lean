# Modular just: just/slake-typecheck-closed-installoutmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live InstallOutMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-installoutmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 9 remill (just ninth-host-tool / inventory row 11). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses InstallOutMain.lean only. Do not wrap InstallOut.lean.
# Do not invent HostFrontLiveInstallOut. Do not wrap Linear.lean.
# Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
# Do not copy sibling ProductPathReadSsotMain wrap oleans.
# Do not copy sibling LlvmComposeTextMain wrap oleans.
# Do not copy HostFrontLiveInstallOut library oleans (that file must not exist).
# Do not steal HostFrontLiveCapableRegenerateMain wrap dest oleans as this wrap.

# Driver: SystemsLean/SlakeTypecheckInstallOutMain.lean
# Greppable: slake-typecheck-installoutmain, SLAKE_TYPECHECK_INSTALL_OUT_MAIN_V0, HOST-SLAKE-TYPECHECK-INSTALL-OUT-MAIN, PARSE-LIVE-INSTALL-OUT-MAIN, INSTALL-OUT-MAIN, HOST-INSTALL-OUT-MAIN, SKELETON.

slake-typecheck-installoutmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckInstallOutMain.lean"
    live="$src_root/SystemsLean/InstallOutMain.lean"
    modroot="$root/build/slake-typecheck-installoutmain"
    echo "SLAKE_TYPECHECK_INSTALL_OUT_MAIN_V0 / HOST-SLAKE-TYPECHECK-INSTALL-OUT-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-installoutmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-installoutmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-installoutmain RED: miss $live" >&2
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
    elif [[ -d "$root/build/slake-typecheck-capableregeneratemain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-capableregeneratemain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostimportgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostimportgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostgraphmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostgraphmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-hostcheckmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-hostcheckmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-erasuresubsetemitmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-erasuresubsetemitmain/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveInstallOutMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveInstallOutMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveInstallOutMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveInstallOutMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
