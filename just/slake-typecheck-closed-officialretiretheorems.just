# Modular just: just/slake-typecheck-closed-officialretiretheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live OfficialRetireTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-officialretiretheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
#
# Unique needles (own lines; THEOREMS suffix so they are not a prefix of the library wrap):
# HostFrontLiveOfficialRetireTheorems
# PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS
# HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS
# SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_THEOREMS_V0
# SlakeTypecheckOfficialRetireTheorems
# HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-THEOREMS
# SLAKE_TYPECHECK_OFFICIAL_RETIRE_THEOREMS_V0
# slake-typecheck-officialretiretheorems

# Driver: SystemsLean/SlakeTypecheckOfficialRetireTheorems.lean
# Greppable: slake-typecheck-officialretiretheorems, SLAKE_TYPECHECK_OFFICIAL_RETIRE_THEOREMS_V0, HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-THEOREMS, PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS, SKELETON.

slake-typecheck-officialretiretheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckOfficialRetireTheorems.lean"
    live="$src_root/SystemsLean/OfficialRetireTheorems.lean"
    modroot="$root/build/slake-typecheck-officialretiretheorems"
    echo "SLAKE_TYPECHECK_OFFICIAL_RETIRE_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-officialretiretheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-officialretiretheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-officialretiretheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    # Prefer cached HostFrontLiveHostTerm chain oleans when present.
    for o in Mult HostTerm HostFrontGoldens HostFront HostKernel \
        HostFrontLiveMult HostFrontLiveTypes HostFrontLiveExtract \
        HostFrontLiveHostTermSource HostFrontLiveHostTerm; do
      if [[ ! -f "$modroot/SystemsLean/${o}.olean" ]]; then
        donor=""
        for d in build/slake-typecheck-productpathwritehctheorems \
                 build/slake-typecheck-officialretire \
                 build/slake-typecheck-hostresidualshrinktermok; do
          if [[ -f "$root/$d/SystemsLean/${o}.olean" ]]; then
            donor="$root/$d/SystemsLean/${o}.olean"
            break
          fi
        done
        if [[ -n "$donor" ]]; then
          cp -f "$donor" "$modroot/SystemsLean/${o}.olean"
        fi
      fi
    done
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    if [[ ! -f "$modroot/SystemsLean/Mult.olean" ]]; then
      nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/Mult.olean" \
        "$src_root/SystemsLean/Mult.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostTerm.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostTerm.olean" \
        "$src_root/SystemsLean/HostTerm.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontGoldens.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontGoldens.olean" \
        "$src_root/SystemsLean/HostFrontGoldens.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFront.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFront.olean" \
        "$src_root/SystemsLean/HostFront.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostKernel.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostKernel.olean" \
        "$src_root/SystemsLean/HostKernel.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontLiveMult.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveMult.olean" \
        "$src_root/SystemsLean/HostFrontLiveMult.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontLiveTypes.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveTypes.olean" \
        "$src_root/SystemsLean/HostFrontLiveTypes.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontLiveExtract.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveExtract.olean" \
        "$src_root/SystemsLean/HostFrontLiveExtract.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTermSource.olean" \
        "$src_root/SystemsLean/HostFrontLiveHostTermSource.lean"
    fi
    if [[ ! -f "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" ]]; then
      LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveHostTerm.olean" \
        "$src_root/SystemsLean/HostFrontLiveHostTerm.lean"
    fi
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveOfficialRetireTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveOfficialRetireTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveOfficialRetireTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveOfficialRetireTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
