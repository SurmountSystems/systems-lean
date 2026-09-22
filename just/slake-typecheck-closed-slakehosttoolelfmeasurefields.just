# Modular just: just/slake-typecheck-closed-slakehosttoolelfmeasurefields.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live SlakeHostToolElfMeasureFields string-def wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-slakehosttoolelfmeasurefields then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. FullBackend false. Mill 69 of 69. Occupancy 49.
# Not mill 61 remill. Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# This wrap is the live SlakeHostToolElfMeasureFields helper, not an LLVM parse.
# Not the mill Main wrap (slake-typecheck-llvmmultssamain). Not LlvmLinearSsa. Not IrGraph.
# LEAN_PATH is only this wrap's build directory. Do not reuse another wrap's oleans.

# Driver: SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFields.lean
# Greppable: slake-typecheck-slakehosttoolelfmeasurefields, SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS.

slake-typecheck-slakehosttoolelfmeasurefields:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFields.lean"
    live="$src_root/SystemsLean/SlakeHostToolElfMeasureFields.lean"
    modroot="$root/build/slake-typecheck-slakehosttoolelfmeasurefields"
    echo "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0 / HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-slakehosttoolelfmeasurefields RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurefields RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurefields RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFields.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFields.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
