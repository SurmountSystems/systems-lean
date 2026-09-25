# Modular just: just/slake-typecheck-closed-llvmcfgunitdf.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live LlvmCfgUnitDf product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-llvmcfgunitdf then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not an LLVM backend.
# This wrap is LlvmCfgUnitDf.lean. It is not LlvmCfg.lean.
# It is not LlvmCfgGeneral.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# The root justfile does not import this module.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckLlvmCfgUnitDf.lean
# Live: SystemsLean/LlvmCfgUnitDf.lean
# Greppable: slake-typecheck-llvmcfgunitdf, SLAKE_TYPECHECK_LLVM_CFG_UNIT_DF, HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-DF, PARSE-LIVE-LLVM-CFG-UNIT-DF.

slake-typecheck-llvmcfgunitdf:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckLlvmCfgUnitDf.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckLlvmCfgUnitDf.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckLlvmCfgUnitDf.lean"
    live="$src_root/SystemsLean/LlvmCfgUnitDf.lean"
    modroot="$root/build/slake-typecheck-llvmcfgunitdf"
    echo "SLAKE_TYPECHECK_LLVM_CFG_UNIT_DF / HOST-SLAKE-TYPECHECK-LLVM-CFG-UNIT-DF"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-llvmcfgunitdf RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-llvmcfgunitdf RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-llvmcfgunitdf RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveLlvmCfgUnitDfSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmCfgUnitDfSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveLlvmCfgUnitDf.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmCfgUnitDf.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
