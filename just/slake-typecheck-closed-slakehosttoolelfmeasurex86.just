# Modular just: just/slake-typecheck-closed-slakehosttoolelfmeasurex86.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live SlakeHostToolElfMeasureX86 parse
# plus HostKernel.kernelCheck (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-slakehosttoolelfmeasurex86 then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. FullBackend false. Mill 69 of 69. Occupancy 49.
# Not mill 61 remill. Not mill 69 remill. Root justfile does not import this module.
# This wrap is the live SlakeHostToolElfMeasureX86 helper, not an LLVM parse.
# Not SlakeHostToolElfMeasureGreen. Not SlakeHostToolElfMeasureFields.
# Not the mill Main wrap (slake-typecheck-llvmmultssamain). Not LlvmLinearSsa. Not IrGraph.
# LEAN_PATH is only this wrap's build directory. Do not reuse another wrap's oleans.

# Driver: SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureX86.lean
# Greppable: slake-typecheck-slakehosttoolelfmeasurex86, SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-X86, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86, HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86.

slake-typecheck-slakehosttoolelfmeasurex86:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureX86.lean"
    live="$src_root/SystemsLean/SlakeHostToolElfMeasureX86.lean"
    modroot="$root/build/slake-typecheck-slakehosttoolelfmeasurex86"
    echo "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0 / HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-X86"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-slakehosttoolelfmeasurex86 RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurex86 RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurex86 RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86Source.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86Source.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86Main.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureX86Main.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
