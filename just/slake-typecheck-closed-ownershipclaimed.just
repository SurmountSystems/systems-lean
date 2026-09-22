# Modular just: just/slake-typecheck-closed-ownershipclaimed.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live OwnershipClaimed product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-ownershipclaimed then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).

# Driver: SystemsLean/SlakeTypecheckOwnershipClaimed.lean
# Unique needles (trailing newline so slake-typecheck-ownershipclaimed is not a prefix):
# slake-typecheck-ownershipclaimed
# SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_V0
# HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED
# PARSE-LIVE-OWNERSHIP-CLAIMED
# OWNERSHIP-CLAIMED
# SKELETON.

slake-typecheck-ownershipclaimed:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckOwnershipClaimed.lean"
    live="$src_root/SystemsLean/OwnershipClaimed.lean"
    modroot="$root/build/slake-typecheck-ownershipclaimed"
    echo "SLAKE_TYPECHECK_OWNERSHIP_CLAIMED_V0 / HOST-SLAKE-TYPECHECK-OWNERSHIP-CLAIMED"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-ownershipclaimed RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-ownershipclaimed RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-ownershipclaimed RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    # Live OwnershipClaimed.lean is ~19k chars; skip-fold tokenize is
    # per-char fuel. 8192 is enough for HostCostTheorems and not this file.
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    reused=""
    for cand in \
      "$root/build/slake-typecheck-officialretire/SystemsLean" \
      "$root/build/slake-typecheck-hostresidualshrinktheorems/SystemsLean" \
      "$root/build/slake-typecheck-hostresidualshrink/SystemsLean"
    do
      if [[ -f "$cand/HostFrontLiveHostTerm.olean" && -f "$cand/HostKernel.olean" ]]; then
        reused="$cand"
        break
      fi
    done
    if [[ -n "$reused" ]]; then
      cp -a "$reused/." "$modroot/SystemsLean/"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveOwnershipClaimedSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveOwnershipClaimedSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveOwnershipClaimed.olean" \
      "$src_root/SystemsLean/HostFrontLiveOwnershipClaimed.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveOwnershipClaimedMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveOwnershipClaimedMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
