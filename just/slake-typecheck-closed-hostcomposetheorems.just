# Modular just: just/slake-typecheck-closed-hostcomposetheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live HostComposeTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-hostcomposetheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. FullBackend false. Not an LLVM backend. Not LlvmHold.lean.
# slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Split so this module stays under 1000 lines.

# Driver: SystemsLean/SlakeTypecheckHostComposeTheorems.lean
# Live: SystemsLean/HostComposeTheorems.lean
# Greppable: slake-typecheck-hostcomposetheorems, SLAKE_TYPECHECK_HOST_COMPOSE_THEOREMS, HOST-SLAKE-TYPECHECK-HOST-COMPOSE-THEOREMS, PARSE-LIVE-HOST-COMPOSE-THEOREMS, HOST-COMPOSE-THEOREM.

slake-typecheck-hostcomposetheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckHostComposeTheorems.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckHostComposeTheorems.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckHostComposeTheorems.lean"
    live="$src_root/SystemsLean/HostComposeTheorems.lean"
    modroot="$root/build/slake-typecheck-hostcomposetheorems"
    echo "SLAKE_TYPECHECK_HOST_COMPOSE_THEOREMS / HOST-SLAKE-TYPECHECK-HOST-COMPOSE-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-hostcomposetheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-hostcomposetheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-hostcomposetheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    unset LEAN_PATH || true
    leanlib="$(lean --print-libdir)"
    case "$leanlib" in
      *"/build/slake-typecheck-"*|*"/.lake/"*)
        echo "slake-typecheck-hostcomposetheorems RED: lean libdir is a module build tree: $leanlib" >&2
        exit 1
        ;;
    esac
    export LEAN_PATH="${modroot}:${leanlib}"
    echo "LEAN_NUM_THREADS=${LEAN_NUM_THREADS}"
    echo "LEAN_PATH=${LEAN_PATH}"
    echo "lean_libdir=${leanlib}"
    echo "build=${modroot}"
    mkdir -p "$modroot/SystemsLean"
    recd="-D maxRecDepth=8192"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostComposeTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostComposeTheoremsSource.lean"
    nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostComposeTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostComposeTheorems.lean"
    nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
