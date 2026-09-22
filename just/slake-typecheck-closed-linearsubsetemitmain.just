# Modular just: just/slake-typecheck-closed-linearsubsetemitmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live LinearSubsetEmitMain product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-linearsubsetemitmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 32 remill. Not mill 69 remill. Root justfile does not import this module (dests skipped this slice).
# This wrap parses LinearSubsetEmitMain.lean only. Do not wrap LinearSubsetEmit.lean.
# Do not invent HostFrontLiveLinearSubsetEmit. Do not wrap Linear.lean.
# Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.

# Driver: SystemsLean/SlakeTypecheckLinearSubsetEmitMain.lean
# Greppable: slake-typecheck-linearsubsetemitmain, SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT_MAIN_V0, HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT-MAIN, PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN, LINEAR-SUBSET-EMIT-MAIN, HOST-LINEAR-SUBSET-EMIT-MAIN, SKELETON.

slake-typecheck-linearsubsetemitmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckLinearSubsetEmitMain.lean"
    live="$src_root/SystemsLean/LinearSubsetEmitMain.lean"
    modroot="$root/build/slake-typecheck-linearsubsetemitmain"
    echo "SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT_MAIN_V0 / HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-linearsubsetemitmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-linearsubsetemitmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-linearsubsetemitmain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    shared="$root/build/slake-typecheck-typessubsetemitmain/SystemsLean"
    if [[ -f "$shared/HostFrontLiveHostTerm.olean" ]]; then
      cp -a "$shared/Mult.olean" \
        "$shared/HostTerm.olean" \
        "$shared/HostFrontGoldens.olean" \
        "$shared/HostFront.olean" \
        "$shared/HostKernel.olean" \
        "$shared/HostFrontLiveMult.olean" \
        "$shared/HostFrontLiveTypes.olean" \
        "$shared/HostFrontLiveExtract.olean" \
        "$shared/HostFrontLiveHostTermSource.olean" \
        "$shared/HostFrontLiveHostTerm.olean" \
        "$modroot/SystemsLean/"
    else
      nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/Mult.olean" \
        "$src_root/SystemsLean/Mult.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostTerm.olean" \
        "$src_root/SystemsLean/HostTerm.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
        "$src_root/SystemsLean/HostFrontGoldens.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFront.olean" \
        "$src_root/SystemsLean/HostFront.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostKernel.olean" \
        "$src_root/SystemsLean/HostKernel.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
        "$src_root/SystemsLean/HostFrontLiveMult.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
        "$src_root/SystemsLean/HostFrontLiveTypes.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
        "$src_root/SystemsLean/HostFrontLiveExtract.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
        "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
        "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    fi
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLinearSubsetEmitMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveLinearSubsetEmitMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveLinearSubsetEmitMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveLinearSubsetEmitMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
