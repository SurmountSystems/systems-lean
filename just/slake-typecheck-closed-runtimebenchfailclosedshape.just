# Modular just: just/slake-typecheck-closed-runtimebenchfailclosedshape.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live RuntimeBenchFailClosedShape product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-runtimebenchfailclosedshape then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not a runtime benchmark claim. Not a new measurement C file.
# Split so this module stays under 1000 lines.
# Not imported by the root justfile.

# Driver: SystemsLean/SlakeTypecheckRuntimeBenchFailClosedShape.lean
# Live: SystemsLean/RuntimeBenchFailClosedShape.lean
# Greppable: slake-typecheck-runtimebenchfailclosedshape, SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0, HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE, PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE, SKELETON.

slake-typecheck-runtimebenchfailclosedshape:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckRuntimeBenchFailClosedShape.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckRuntimeBenchFailClosedShape.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckRuntimeBenchFailClosedShape.lean"
    live="$src_root/SystemsLean/RuntimeBenchFailClosedShape.lean"
    modroot="$root/build/slake-typecheck-runtimebenchfailclosedshape"
    echo "SLAKE_TYPECHECK_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0 / HOST-SLAKE-TYPECHECK-RUNTIME-BENCH-FAIL-CLOSED-SHAPE"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-runtimebenchfailclosedshape RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-runtimebenchfailclosedshape RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-runtimebenchfailclosedshape RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveRuntimeBenchFailClosedShapeSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveRuntimeBenchFailClosedShapeSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveRuntimeBenchFailClosedShape.olean" \
      "$src_root/SystemsLean/HostFrontLiveRuntimeBenchFailClosedShape.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
