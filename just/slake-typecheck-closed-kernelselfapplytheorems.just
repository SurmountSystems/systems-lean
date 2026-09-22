# Modular just: just/slake-typecheck-closed-kernelselfapplytheorems.just -- thin wrapper.
# Closed-subset Slake typecheck driver for live KernelSelfApplyTheorems product wrap
# (not occupancy Term). Compiles the import chain to oleans under
# build/slake-typecheck-closed-kernelselfapplytheorems then lean --run. Not mill leanc. Not lake on the step.
# FullHost false. slakeOwnsPackageTypecheck false. Mill 69 of 69. Occupancy 49.
# Root justfile does not import this module (dests skipped this slice).
# Do not grow just/slake-typecheck-closed-kernelselfapply.just (owned by KernelSelfApply wrap).
# Do not grow just/slake-typecheck-closed-kernellinear.just (owned by KernelLinear wrap).
# Do not grow just/slake-typecheck-closed-kernel.just (owned by KernelMult).
# Compile dependencies into this build directory only. Do not copy another wrap's oleans.
# Not HostFrontLiveKernelSelfApply (that wrap parses KernelSelfApply.lean).
#
# Unique needles (own lines; trailing newline so they are not a prefix of KernelSelfApply wrap):
# HostFrontLiveKernelSelfApplyTheorems
# PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS
# HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS
# SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0
# SlakeTypecheckKernelSelfApplyTheorems
# HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS
# SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0
# slake-typecheck-kernelselfapplytheorems
# HostFrontLiveKernelSelfApplyTheoremsMain

# Driver: SystemsLean/SlakeTypecheckKernelSelfApplyTheorems.lean
# Greppable: slake-typecheck-kernelselfapplytheorems, SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0, HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS, PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS, SKELETON.

slake-typecheck-kernelselfapplytheorems:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(cd "{{justfile_directory()}}/.." && pwd)"
    src_root="$root/src/systems"
    src="$src_root/SystemsLean/SlakeTypecheckKernelSelfApplyTheorems.lean"
    live="$src_root/SystemsLean/KernelSelfApplyTheorems.lean"
    modroot="$root/build/slake-typecheck-closed-kernelselfapplytheorems"
    echo "SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0 / HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS"
    if ! command -v lean >/dev/null 2>&1; then
      if [[ -x /var/lib/elan/bin/lean ]]; then
        export ELAN_HOME="${ELAN_HOME:-/var/lib/elan}"
        export PATH="/var/lib/elan/bin:${PATH}"
      elif [[ -x "${HOME}/.elan/bin/lean" ]]; then
        export PATH="${HOME}/.elan/bin:${PATH}"
      fi
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "slake-typecheck-kernelselfapplytheorems RED: miss lean not on PATH" >&2
      exit 1
    fi
    if [[ ! -f "$src" ]]; then
      echo "slake-typecheck-kernelselfapplytheorems RED: miss $src" >&2
      exit 1
    fi
    if [[ ! -f "$live" ]]; then
      echo "slake-typecheck-kernelselfapplytheorems RED: miss $live" >&2
      exit 1
    fi
    : "${LEAN_NUM_THREADS:=1}"
    export LEAN_NUM_THREADS
    mkdir -p "$modroot/SystemsLean"
    echo "LEAN_PATH=$modroot"
    echo "lean_libdir=$(lean --print-libdir)"
    recd="-D maxRecDepth=8192"
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
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveKernelSelfApplyTheoremsSource.olean" \
      "$src_root/SystemsLean/HostFrontLiveKernelSelfApplyTheoremsSource.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd -o "$modroot/SystemsLean/HostFrontLiveKernelSelfApplyTheorems.olean" \
      "$src_root/SystemsLean/HostFrontLiveKernelSelfApplyTheorems.lean"
    LEAN_PATH="$modroot" nice -n 19 lean -R "$src_root" $recd --run "$src" "$root"
