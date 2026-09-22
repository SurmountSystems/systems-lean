# Modular just: just/slake-typecheck-closed-bootstraphonestytheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live BootstrapHonestyTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-bootstraphonestytheorems then lean --run. Not mill leanc. Not lake on the step.
# Horizon only. FullHost false. FullBackend false. Not an LLVM backend.
# This wrap is BootstrapHonestyTheorems.lean. It is not BootstrapHonesty.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckBootstrapHonestyTheorems.lean
# Live: SystemsLean/BootstrapHonestyTheorems.lean
# Greppable: slake-typecheck-bootstraphonestytheorems, SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_THEOREMS, HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY-THEOREMS, PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS, BOOTSTRAP-THEOREM.

slake-typecheck-bootstraphonestytheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckBootstrapHonestyTheorems.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckBootstrapHonestyTheorems.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckBootstrapHonestyTheorems.lean"
    live="$src_root/SystemsLean/BootstrapHonestyTheorems.lean"
    modroot="$root/build/slake-typecheck-bootstraphonestytheorems"
    echo "SLAKE_TYPECHECK_BOOTSTRAP_HONESTY_THEOREMS / HOST-SLAKE-TYPECHECK-BOOTSTRAP-HONESTY-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-bootstraphonestytheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-bootstraphonestytheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-bootstraphonestytheorems RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveBootstrapHonestyTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveBootstrapHonestyTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveBootstrapHonestyTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveBootstrapHonestyTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
