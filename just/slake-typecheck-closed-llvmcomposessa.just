# Modular just: just/slake-typecheck-closed-llvmcomposessa.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live LlvmComposeSsa product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-llvmcomposessa then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not an LLVM backend.
# This wrap is LlvmComposeSsa.lean. It is not LlvmComposeSsaTheorems.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckLlvmComposeSsa.lean
# Live: SystemsLean/LlvmComposeSsa.lean
# Greppable: slake-typecheck-llvmcomposessa, SLAKE_TYPECHECK_LLVM_COMPOSE_SSA, HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA, PARSE-LIVE-LLVM-COMPOSE-SSA, LLVM-COMPOSE-SSA-THEOREM.

slake-typecheck-llvmcomposessa:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckLlvmComposeSsa.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckLlvmComposeSsa.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckLlvmComposeSsa.lean"
    live="$src_root/SystemsLean/LlvmComposeSsa.lean"
    modroot="$root/build/slake-typecheck-llvmcomposessa"
    echo "SLAKE_TYPECHECK_LLVM_COMPOSE_SSA / HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-SSA"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-llvmcomposessa RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-llvmcomposessa RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-llvmcomposessa RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveLlvmComposeSsaSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmComposeSsaSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveLlvmComposeSsa.olean" \
      "$src_root/SystemsLean/HostFrontLiveLlvmComposeSsa.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
