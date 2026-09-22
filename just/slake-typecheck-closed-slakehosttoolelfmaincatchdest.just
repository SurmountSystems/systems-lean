# Modular just: just/slake-typecheck-closed-slakehosttoolelfmaincatchdest.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live SlakeHostToolElfMainCatchDest parse
# plus HostKernel.kernelCheck (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-slakehosttoolelfmaincatchdest then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. FullBackend false. Mill 69 of 69. Occupancy 49.
# Not mill 61 remill. Not mill 69 remill. Root justfile does not import this module.
# This wrap is the live SlakeHostToolElfMainCatchDest dest catch bytes, not an LLVM parse.
# Not SlakeHostToolElfLink. Not SlakeHostToolElfMeasureGreen. Not SlakeHostToolElfMeasureFields.
# Not the SlakeHostToolElfMainCatch IR wrap.
# LEAN_PATH is only this wrap's build directory. Do not reuse another wrap's oleans.

# Driver: SystemsLean/SlakeTypecheckSlakeHostToolElfMainCatchDest.lean
# Greppable: slake-typecheck-slakehosttoolelfmaincatchdest, SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST.

slake-typecheck-slakehosttoolelfmaincatchdest:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckSlakeHostToolElfMainCatchDest.lean"
    live="$src_root/SystemsLean/SlakeHostToolElfMainCatchDest.lean"
    modroot="$root/build/slake-typecheck-slakehosttoolelfmaincatchdest"
    echo "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_DEST_V0 / HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-DEST"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-slakehosttoolelfmaincatchdest RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-slakehosttoolelfmaincatchdest RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-slakehosttoolelfmaincatchdest RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDestSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDestSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDest.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDest.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDestMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMainCatchDestMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
