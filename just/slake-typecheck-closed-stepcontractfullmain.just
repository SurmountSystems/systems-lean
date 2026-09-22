# Modular just: just/slake-typecheck-closed-stepcontractfullmain.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live StepContractFullMain mill Main wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-stepcontractfullmain then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Not mill 20 remill (just twentieth-host-tool / inventory row 24). Not mill 69 remill.
# Root justfile does not import this module (dests skipped this slice).
# This wrap parses StepContractFullMain.lean only. Do not wrap StepContractFull.lean.
# Short name is free because HostFrontLiveStepContractFull (library wrap) does not exist.
# Do not mint HostFrontLiveHostStepContractFullMain.
# Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
# Do not copy sibling PerformClaimedMain / OwnershipClaimedMain wrap dest oleans.
# Do not copy HostFrontLiveStepContractFull library oleans (they do not exist).
# Do not copy OfficialRetireMain or DualEqWriteApiMain wrap dest oleans as this mill parser.

# Driver: SystemsLean/SlakeTypecheckStepContractFullMain.lean
# Greppable: slake-typecheck-stepcontractfullmain, SLAKE_TYPECHECK_STEP_CONTRACT_FULL_MAIN_V0, HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-MAIN, PARSE-LIVE-STEP-CONTRACT-FULL-MAIN, STEP-CONTRACT-FULL-MAIN, HOST-STEP-CONTRACT-FULL-MAIN, SKELETON.

slake-typecheck-stepcontractfullmain:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckStepContractFullMain.lean"
    live="$src_root/SystemsLean/StepContractFullMain.lean"
    modroot="$root/build/slake-typecheck-stepcontractfullmain"
    echo "SLAKE_TYPECHECK_STEP_CONTRACT_FULL_MAIN_V0 / HOST-SLAKE-TYPECHECK-STEP-CONTRACT-FULL-MAIN"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-stepcontractfullmain RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-stepcontractfullmain RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-stepcontractfullmain RED: miss $live" >&2
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveStepContractFullMainSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveStepContractFullMainSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveStepContractFullMain.olean" \
      "$src_root/SystemsLean/HostFrontLiveStepContractFullMain.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
