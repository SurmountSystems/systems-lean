# Modular just: just/slake-typecheck-closed-slakehosttoolelfmeasurefieldsx86.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live SlakeHostToolElfMeasureFieldsX86
# product wrap (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-slakehosttoolelfmeasurefieldsx86 then lean --run.
# Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not an LLVM backend.
# This wrap is SlakeHostToolElfMeasureFieldsX86.lean.
# It is not SlakeHostToolElfMeasure.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Split so this module stays under 1000 lines.
# Not imported from the root justfile.

# Driver: SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFieldsX86.lean
# Live: SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean
# Greppable: slake-typecheck-slakehosttoolelfmeasurefieldsx86, SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86, PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86, HOST-HOST-TOOL-MEASURE-FIELDS-X86.

slake-typecheck-slakehosttoolelfmeasurefieldsx86:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFieldsX86.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFieldsX86.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckSlakeHostToolElfMeasureFieldsX86.lean"
    live="$src_root/SystemsLean/SlakeHostToolElfMeasureFieldsX86.lean"
    modroot="$root/build/slake-typecheck-slakehosttoolelfmeasurefieldsx86"
    echo "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86 / HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-slakehosttoolelfmeasurefieldsx86 RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurefieldsx86 RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-slakehosttoolelfmeasurefieldsx86 RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsX86Source.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsX86Source.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsX86.olean" \
      "$src_root/SystemsLean/HostFrontLiveSlakeHostToolElfMeasureFieldsX86.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
