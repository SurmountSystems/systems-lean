# Modular just: just/slake-typecheck-closed-traitobjectvtable.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live TraitObjectVtable product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-traitobjectvtable then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# This wrap is TraitObjectVtable.lean. It is not a theorems peel.
# Split so closed-traitobjectvtable stays under 1000 lines. Root justfile does not import this module.

# Driver: SystemsLean/SlakeTypecheckTraitObjectVtable.lean
# Live: SystemsLean/TraitObjectVtable.lean
# Greppable: slake-typecheck-traitobjectvtable, SLAKE_TYPECHECK_TRAIT_OBJECT_VTABLE_V0, HOST-SLAKE-TYPECHECK-TRAIT-OBJECT-VTABLE, PARSE-LIVE-TRAIT-OBJECT-VTABLE, SKELETON.

slake-typecheck-traitobjectvtable:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    if [[ ! -f "$root/src/systems/SystemsLean/SlakeTypecheckTraitObjectVtable.lean" && -f "$root/../src/systems/SystemsLean/SlakeTypecheckTraitObjectVtable.lean" ]]; then
      root="$(cd "$root/.." && pwd)"
    fi
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckTraitObjectVtable.lean"
    live="$src_root/SystemsLean/TraitObjectVtable.lean"
    modroot="$root/build/slake-typecheck-traitobjectvtable"
    echo "SLAKE_TYPECHECK_TRAIT_OBJECT_VTABLE_V0 / HOST-SLAKE-TYPECHECK-TRAIT-OBJECT-VTABLE"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-traitobjectvtable RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-traitobjectvtable RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-traitobjectvtable RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/Mult.olean" \
      "$src_root/SystemsLean/Mult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostTerm.olean" \
      "$src_root/SystemsLean/HostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
      "$src_root/SystemsLean/HostFrontGoldens.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFront.olean" \
      "$src_root/SystemsLean/HostFront.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostKernel.olean" \
      "$src_root/SystemsLean/HostKernel.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
      "$src_root/SystemsLean/HostFrontLiveMult.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
      "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
      "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
      "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource01.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource01.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource02.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource02.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource03.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource03.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource04.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource04.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource05.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource05.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource06.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource06.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource07.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource07.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource08.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource08.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtableSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtableSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 -o "$modroot/SystemsLean/HostFrontLiveTraitObjectVtable.olean" \
      "$src_root/SystemsLean/HostFrontLiveTraitObjectVtable.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" -D maxRecDepth=65536 --run "$src" "$root"
