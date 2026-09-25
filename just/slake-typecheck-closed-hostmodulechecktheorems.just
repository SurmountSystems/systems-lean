# Modular just: just/slake-typecheck-closed-hostmodulechecktheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live HostModuleCheckTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-hostmodulechecktheorems then lean --run. Not mill leanc. Not lake on the step.
# Stage id is HOST-MODULE-CHECK-THEOREMS.
# FullHost false. FullBackend false. Not a claim-bool flip. Not HostModuleCheck.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49. Lake is not gone.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckHostModuleCheckTheorems.lean
# Live: SystemsLean/HostModuleCheckTheorems.lean
# Greppable: slake-typecheck-hostmodulechecktheorems, HOST-MODULE-CHECK-THEOREMS, SLAKE_TYPECHECK_HOST_MODULE_CHECK_THEOREMS, HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-THEOREMS, PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS.

slake-typecheck-hostmodulechecktheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckHostModuleCheckTheorems.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckHostModuleCheckTheorems.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckHostModuleCheckTheorems.lean"
    live="$src_root/SystemsLean/HostModuleCheckTheorems.lean"
    modroot="$root/build/slake-typecheck-hostmodulechecktheorems"
    echo "HOST-MODULE-CHECK-THEOREMS / SLAKE_TYPECHECK_HOST_MODULE_CHECK_THEOREMS / HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-hostmodulechecktheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-hostmodulechecktheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-hostmodulechecktheorems RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostModuleCheckTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostModuleCheckTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 -o "$modroot/SystemsLean/HostFrontLiveHostModuleCheckTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostModuleCheckTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=8192 --run "$src" "$root"
