# Modular just: just/slake-typecheck-closed-productpathownershipregeneratemain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live ProductPathOwnershipRegenerateMain mill Main wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-productpathownershipregeneratemain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 10 remill (just tenth-host-tool / inventory row 13). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses ProductPathOwnershipRegenerateMain.lean only. Do not wrap ProductPathOwnershipRegenerate.lean.
# Short name is free because HostFrontLiveProductPathOwnershipRegenerate (library wrap) does not exist.
# Do not mint HostFrontLiveHostProductPathOwnershipRegenerateMain.
# Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
# Not CapableComposeMain. Not ProductPathComposePlanMain. Not LlvmMultSsaMain.
# Not MultSubsetRebuildMain.
# Do not copy sibling mill-Main wrap dest oleans (StepContractFullMain /
# OwnershipClaimedMain / PerformClaimedMain / OfficialRetireMain /
# DualEqWriteApiMain) as this mill parser.
# Do not copy HostFrontLiveProductPathOwnershipRegenerate library oleans (they do not exist).

# Driver: SystemsLean/SlakeTypecheckProductPathOwnershipRegenerateMain.lean
# Greppable: slake-typecheck-productpathownershipregeneratemain, SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_MAIN_V0, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN, PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN, PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN, HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN, SKELETON.

slake-typecheck-productpathownershipregeneratemain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckProductPathOwnershipRegenerateMain.lean"
    live="$src_root/SystemsLean/ProductPathOwnershipRegenerateMain.lean"
    modroot="$root/build/slake-typecheck-productpathownershipregeneratemain"
    echo "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_MAIN_V0 / HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-productpathownershipregeneratemain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-productpathownershipregeneratemain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-productpathownershipregeneratemain RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    prefix_mod=""
    if [[ -d "$root/build/slake-typecheck-installoutmain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-installoutmain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-dualeqwriteapimain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-dualeqwriteapimain/SystemsLean"
    elif [[ -d "$root/build/slake-typecheck-officialretiremain/SystemsLean" ]]; then
      prefix_mod="$root/build/slake-typecheck-officialretiremain/SystemsLean"
    fi
    if [[ -n "$prefix_mod" ]]; then
      for o in Mult HostTerm HostFrontGoldens HostFront HostKernel \
        HostFrontLiveMult HostFrontLiveTypes HostFrontLiveExtract \
        HostFrontLiveHostTermSource HostFrontLiveHostTerm; do
        if [[ -f "$prefix_mod/${o}.olean" ]]; then
          cp -f "$prefix_mod/${o}.olean" "$modroot/SystemsLean/${o}.olean"
        fi
      done
    fi
    recd="-D maxRecDepth=131072 -D maxHeartbeats=4000000"
    compile_one() {
      local name="$1"
      local srcf="$src_root/SystemsLean/${name}.lean"
      local ole="$modroot/SystemsLean/${name}.olean"
      if [[ -f "$ole" && "$ole" -nt "$srcf" ]]; then
        return 0
      fi
      if [[ "$name" == "Mult" ]]; then
        nice -n 19 lean -R "$src_root" $recd -o "$ole" "$srcf"
      else
        LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$ole" "$srcf"
      fi
    }
    compile_one Mult
    compile_one HostTerm
    compile_one HostFrontGoldens
    compile_one HostFront
    compile_one HostKernel
    compile_one HostFrontLiveMult
    compile_one HostFrontLiveTypes
    compile_one HostFrontLiveExtract
    compile_one HostFrontLiveHostTermSource
    compile_one HostFrontLiveHostTerm
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveProductPathOwnershipRegenerateMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
