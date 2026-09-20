# Modular just: just/first-host-tool.just -- compile+link inventory host tools
# without Lake on the step (lean + leanc). Not a prebuilt ELF run. Not product C
# emit. Not a horizon Lake skip. Count source: src/systems/host-tools-inventory.md
# (69 lean_exe rows). First GREEN stays slake-runtime-bench-fail-closed-shape /
# SystemsLean.RuntimeBenchFailClosedShapeMain. Second row is
# slake-runtime-bench-stack-twin / SystemsLean.RuntimeBenchStackTwinMain
# (prelude-only body, same import class as the first). Third row is
# slake-read-product-ssot / SystemsLean.ProductPathReadSsotMain (0-import body).
# Fourth row is slake-freestanding-capable-full-bar / SystemsLean.CapableFullBarMain
# (0-import body CapableFullBar). Fifth row is slake-freestanding-capable-gap /
# SystemsLean.CapableMain (0-import body Capable). Sixth row is
# slake-freestanding-capable-step-contract /
# SystemsLean.CapableStepContractMain (0-import body CapableStepContract).
# Seventh row is slake-freestanding-capable-read /
# SystemsLean.CapableReadMain (0-import body CapableRead).
# Eighth row is slake-freestanding-capable-compose /
# SystemsLean.CapableComposeMain (0-import body CapableCompose).
# Ninth row is slake-freestanding-capable-install-out /
# SystemsLean.InstallOutMain (0-import body InstallOut).
# Tenth row is slake-ownership-regenerate /
# SystemsLean.ProductPathOwnershipRegenerateMain (0-import body
# ProductPathOwnershipRegenerate).
# Eleventh row is slake-freestanding-perform-evidence /
# SystemsLean.PerformEvidenceMain (0-import body PerformEvidence).
# Twelfth row is slake-freestanding-perform-official-path /
# SystemsLean.OfficialPathMain (0-import body OfficialPath).
# Thirteenth row is slake-freestanding-perform-official-path-alternate /
# SystemsLean.OfficialPathAlternateMain (0-import body OfficialPathAlternate).
# Fourteenth row is slake-freestanding-perform-dual-equality-write-parity /
# SystemsLean.DualEqWriteParityMain (0-import body DualEqWriteParity).
# Fifteenth row is slake-freestanding-perform-dual-equality-write-close-path /
# SystemsLean.DualEqWriteClosePathMain (0-import body DualEqWriteClosePath).
# Sixteenth row is slake-freestanding-perform-dual-equality-write-capable-gap /
# SystemsLean.DualEqWriteCapableGapMain (0-import body DualEqWriteCapableGap).
# DualEqWriteApi is skipped (that body imports).
# Seventeenth row is slake-freestanding-retire-official /
# SystemsLean.OfficialRetireMain (0-import body OfficialRetire).
# Eighteenth row is slake-freestanding-perform-claimed /
# SystemsLean.PerformClaimedMain (0-import body PerformClaimed).
# Nineteenth row is slake-freestanding-ownership-claimed /
# SystemsLean.OwnershipClaimedMain (0-import body OwnershipClaimed).
# Twentieth row is slake-freestanding-step-contract-full /
# SystemsLean.StepContractFullMain (0-import body StepContractFull).
# DualEqWriteApi stays skipped (that body imports).
# Twenty-first row is slake-compose-product-plan /
# SystemsLean.ProductPathComposePlanMain (0-import body ProductPathComposePlan).
# DualEqWriteApi stays skipped (that body imports).
# SelfHostComplete stays skipped (0-import body, no Main file).
# Twenty-second row is slake-host-package-roots /
# SystemsLean.HostPackageRootsMain (0-import body HostPackageRoots).
# DualEqWriteApi stays skipped (that body imports).
# SelfHostComplete stays skipped (0-import body, no Main file).
# ProductPathWriteHc stays skipped (that body imports).
# Twenty-third row is slake-mult-fs-write-tool /
# SystemsLean.MultFsWriteToolMain (1-import body MultFsWriteTool;
# imports MultSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through MultSubsetEmit).
# DualEqWriteApi stays skipped (that body imports).
# SelfHostComplete stays skipped (0-import body, no Main file).
# ProductPathWriteHc stays skipped (that body imports).
# Twenty-fourth row is slake-first-surface /
# SystemsLean.FirstSurfaceMain (1-import body FirstSurface;
# imports CompilePathMult). Extra helper args compile that closed import
# chain before body and Main (Mult through CompilePathMult).
# Twenty-fifth row is slake-program-subset-rebuild /
# SystemsLean.ProgramSubsetRebuildMain (1-import body ProgramSubsetRebuild;
# imports ProgramSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through ProgramSubsetEmit).
# Twenty-sixth row is slake-extract-subset-rebuild /
# SystemsLean.ExtractSubsetRebuildMain (1-import body ExtractSubsetRebuild;
# imports ExtractSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through ExtractSubsetEmit).
# Twenty-seventh row is slake-erasure-subset-rebuild /
# SystemsLean.ErasureSubsetRebuildMain (1-import body ErasureSubsetRebuild;
# imports ErasureSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through ErasureSubsetEmit).
# Twenty-eighth row is slake-graph-subset-rebuild /
# SystemsLean.GraphSubsetRebuildMain (1-import body GraphSubsetRebuild;
# imports GraphSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through GraphSubsetEmit).
# Twenty-ninth row is slake-compose-subset-rebuild /
# SystemsLean.ComposeSubsetRebuildMain (1-import body ComposeSubsetRebuild;
# imports ComposeSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through ComposeSubsetEmit).
# Thirtieth row is slake-linear-subset-rebuild /
# SystemsLean.LinearSubsetRebuildMain (1-import body LinearSubsetRebuild;
# imports LinearSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through LinearSubsetEmit).
# Thirty-first row is slake-types-subset-rebuild /
# SystemsLean.TypesSubsetRebuildMain (1-import body TypesSubsetRebuild;
# imports TypesSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through TypesSubsetEmit).
# Thirty-second row is slake-mult-subset-rebuild /
# SystemsLean.MultSubsetRebuildMain (1-import body MultSubsetRebuild;
# imports MultSubsetEmit). Extra helper args compile that closed import
# chain before body and Main (Mult through MultSubsetEmit).
# Thirty-third row is slake-host-fragment-check /
# SystemsLean.HostCheckMain (1-import body HostCheck;
# imports HostFront). Extra helper args compile that closed import
# chain before body and Main (Mult HostTerm HostFrontGoldens HostFront).
# Thirty-fourth row is slake-host-graph /
# SystemsLean.HostGraphMain (1-import body HostGraph;
# imports HostFront and HostTerm). Extra helper args compile the
# HostFront closed import chain before body and Main
# (Mult HostTerm HostFrontGoldens HostFront).
# Thirty-fifth row is slake-host-front /
# SystemsLean.HostFrontMain (1-import body HostFront;
# HostFrontMain imports HostFront). Extra helper args compile the
# HostFront closed import chain before body and Main
# (Mult HostTerm HostFrontGoldens).
# Thirty-sixth row is slake-compose-subset-emit /
# SystemsLean.ComposeSubsetEmitMain (2-import body ComposeSubsetEmit;
# imports CompilePathCompose and EmitCompose). Extra helper args compile
# the ComposeSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitComposeScaffold EmitCompose CompilePathCompose).
# Thirty-seventh row is slake-graph-subset-emit /
# SystemsLean.GraphSubsetEmitMain (2-import body GraphSubsetEmit;
# imports CompilePathGraph and EmitGraph). Extra helper args compile
# the GraphSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitGraphScaffold EmitGraph CompilePathGraph).
# Thirty-eighth row is slake-mult-subset-emit /
# SystemsLean.MultSubsetEmitMain (2-import body MultSubsetEmit;
# imports FirstSurface and EmitMult). Extra helper args compile
# the MultSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose
# EmitMultScaffold EmitMult CompilePath CompilePathMult FirstSurface).
# Thirty-ninth row is slake-erasure-subset-emit /
# SystemsLean.ErasureSubsetEmitMain (2-import body ErasureSubsetEmit;
# imports CompilePathErasure and EmitErasure). Extra helper args compile
# the ErasureSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitErasureScaffold EmitErasure CompilePathErasure).
# Fortieth row is slake-extract-subset-emit /
# SystemsLean.ExtractSubsetEmitMain (2-import body ExtractSubsetEmit;
# imports CompilePathExtract and EmitExtract). Extra helper args compile
# the ExtractSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitMultScaffold EmitMult CompilePathMult EmitProgramScaffold EmitProgram
# CompilePathProgram EmitExtractScaffold EmitExtract CompilePathExtract).
# Forty-first row is slake-types-subset-emit /
# SystemsLean.TypesSubsetEmitMain (2-import body TypesSubsetEmit;
# imports CompilePathTypes and EmitTypes). Extra helper args compile
# the TypesSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitTypesScaffold EmitTypes CompilePathTypes).
# Forty-second row is slake-program-subset-emit /
# SystemsLean.ProgramSubsetEmitMain (2-import body ProgramSubsetEmit;
# imports CompilePathProgram and EmitProgram). Extra helper args compile
# the ProgramSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitProgramScaffold EmitProgram CompilePathProgram).
# Forty-third row is slake-linear-subset-emit /
# SystemsLean.LinearSubsetEmitMain (2-import body LinearSubsetEmit;
# imports CompilePathLinear and EmitLinear). Extra helper args compile
# the LinearSubsetEmit closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitLinearScaffold EmitLinear CompilePathLinear).
# Forty-fourth row is slake-product-wire-fs-write-tool /
# SystemsLean.ProductWireWriteToolMain (2-import body ProductWireWriteTool;
# imports CapableWriteHc and InstallOut). Extra helper args compile
# the ProductWireWriteTool closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose
# EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult
# EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure
# EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes
# EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph
# EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan
# EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody
# CapableWriteHcLoad CapableWriteHc InstallOut).
# Forty-fifth row is slake-runtime-bench-lean /
# SystemsLean.RuntimeBenchLeanMain (2-import body RuntimeBenchLean;
# imports HostCost and HostCostTheorems). Extra helper args compile
# the RuntimeBenchLean closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose
# ErasureTheorems ExtractTheorems IrGraphTheorems HostComposeTheorems
# Linear LinearTheorems HostCost HostCostTheorems).
# Forty-sixth row is slake-front-mult-package /
# SystemsLean.FrontMultPackageMain (3-import body FrontMultPackage;
# imports SubsetFront, MultSubsetEmit, and MultSubsetRebuild). Extra
# helper args compile the FrontMultPackage closed import chain before
# body and Main (Mult Types Erasure Extract IrProgram IrGraph
# HostCompose CompilePath EmitMultScaffold EmitMult CompilePathMult
# FirstSurface SubsetFront MultSubsetEmit MultSubsetRebuild).
# Forty-seventh row is slake-llvm-mult-text /
# SystemsLean.LlvmMultTextMain (3-import body LlvmMultText;
# imports Mult, LlvmHold, and LlvmEmitPath). Extra helper args compile
# the LlvmMultText closed import chain before body and Main
# (Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
# EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear
# KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold
# EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold
# LlvmEmitPath).
# Forty-eighth row is slake-freestanding-capable-regenerate /
# SystemsLean.CapableRegenerateMain (4-import body CapableRegenerate;
# imports CapableRead, CapableCompose, CapableWriteHc, and InstallOut).
# Extra helper args compile the CapableRegenerate closed import chain
# before body and Main (Mult Types Erasure Extract IrProgram IrGraph
# HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult
# EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure
# EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes
# EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph
# EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan
# EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody
# CapableWriteHcLoad CapableWriteHc CapableRead CapableCompose
# InstallOut).
# Forty-ninth row is slake-llvm-linear-text /
# SystemsLean.LlvmLinearTextMain (4-import body LlvmLinearText;
# imports Linear, LlvmHold, LlvmEmitPath, and LlvmMultText). Extra
# helper args compile the LlvmLinearText closed import chain before
# body and Main (Mult Types Erasure Extract IrProgram IrGraph
# HostCompose CompilePath EmitMultScaffold EmitMult KernelMult
# ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold
# EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody
# KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText).
# Fiftieth row is slake-subset-front /
# SystemsLean.SubsetFrontMain (4-import body SubsetFront;
# imports CompilePath, IrProgram, Types, and Mult). Extra
# helper args compile the SubsetFront closed import chain before
# body and Main (Mult Types Erasure Extract IrProgram IrGraph
# HostCompose CompilePath).
# Fifty-first row is slake-llvm-mult-ssa /
# SystemsLean.LlvmMultSsaMain (5-import body LlvmMultSsa;
# imports Mult, KernelMult, LlvmHold, LlvmEmitPath, and LlvmMultText).
# Extra helper args compile the LlvmMultSsa closed import chain before
# body and Main (Mult Types Erasure Extract IrProgram IrGraph
# HostCompose CompilePath EmitMultScaffold EmitMult KernelMult
# ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold
# EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody
# KernelEmit SelfApply LlvmHold LlvmEmitPath LlvmMultText).
# Fifty-second row is slake-llvm-types-text /
# SystemsLean.LlvmTypesTextMain (6-import body LlvmTypesText;
# imports Types, Mult, LlvmHold, LlvmEmitPath, LlvmMultText, and
# LlvmLinearText). Extra helper args compile the LlvmTypesText closed
# import chain before body and Main (Mult Types Erasure Extract
# IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult
# KernelMult ParityMult KernelLinear KernelTypes KernelProgram
# EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply
# EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath
# Linear LlvmMultText LlvmLinearText).
# DualEqWriteApi stays skipped (that body imports).
# SelfHostComplete stays skipped (0-import body, no Main file).
# ProductPathWriteHc stays skipped (that body imports).
# Output: build/first-host-tool/
# (not .lake/build/bin). Fail closed: recorded argv must not contain lake; ELF must exist.
# Greppable: log_run lean, log_run leanc, host-tools-inventory.md.

# Private: compile+link one inventory ELF (lean + leanc).
# name = Lake executable; body = Lean module basename under SystemsLean/.
# Optional extra args are imported module basenames. Helper compiles them
# in topological waves (independent extras concurrent; cap min(wave_width,
# floor(free_GiB/2), 8)), then body, then Main, then leanc. Never lake.
# OccupancyProbe stays LEAN_NUM_THREADS=1 on Lake recipes, not this helper.
# 0-import recipes pass none.
# File extras: first extra token --extras-file PATH, or env SLAKE_MILL_EXTRAS_FILE.
# One SystemsLean basename per line. Skip empty lines and # comments.
# Packed *deps still works for mills 1-66 and mill 68 (16 extras) and mill 69
# (0 extras). Do not pack HostModuleCheck extras as argv. Living mill metric
# is 69 of 69 after mill 69 ELF GREEN. Do not mill mill 69 again. Helper
# file(1) PATH miss on mill 67 fire is sibling residual. FILE on the same
# just line as mill 68 and mill 69 helpers. Do not mill HostModuleCheck.
# Do not mill MultFsWrite. Do not mill SelfHostComplete.
_compile-inventory-exe name body log_name *deps:
    #!/usr/bin/env bash
    set -euo pipefail
    name="{{name}}"
    body="{{body}}"
    log_name="{{log_name}}"
    extra_mods="{{deps}}"
    extras_file="${SLAKE_MILL_EXTRAS_FILE:-}"
    if [[ -z "$extras_file" ]]; then
      extras_file_next=0
      for dep in $extra_mods; do
        if (( extras_file_next )); then
          extras_file="$dep"
          extras_file_next=0
          break
        fi
        if [[ "$dep" == "--extras-file" ]]; then
          extras_file_next=1
        fi
      done
      if (( extras_file_next )); then
        echo "error: --extras-file needs a path" >&2
        exit 1
      fi
    fi
    root="$(pwd)"
    src="$root/src/systems"
    out_dir="$root/build/first-host-tool"
    log="$out_dir/$log_name"
    elf="$out_dir/$name"
    body_c="$out_dir/SystemsLean/${body}.c"
    main_c="$out_dir/SystemsLean/${body}Main.c"
    body_olean="$out_dir/SystemsLean/${body}.olean"
    main_olean="$out_dir/SystemsLean/${body}Main.olean"
    body_src="$src/SystemsLean/${body}.lean"
    main_src="$src/SystemsLean/${body}Main.lean"
    echo "== compile-inventory-exe (lean + leanc; no lake) =="
    echo "  inventory: $name"
    echo "  main: SystemsLean.${body}Main"
    echo "  log: $log"
    echo "  elf: $elf"
    if [[ ! -f "$body_src" || ! -f "$main_src" ]]; then
      echo "error: missing Lean main or body under $src/SystemsLean" >&2
      exit 1
    fi
    if ! command -v lean >/dev/null 2>&1; then
      echo "error: lean not on PATH" >&2
      exit 1
    fi
    if ! command -v leanc >/dev/null 2>&1; then
      echo "error: leanc not on PATH" >&2
      exit 1
    fi
    # file(1) is not on nixbuilder login PATH. Honor FILE= (path to file).
    # Else PATH. Else mill-known Nix store file-5.48 (mill 65/66 wrappers).
    mill_file="${FILE:-}"
    if [[ -z "$mill_file" || ! -x "$mill_file" ]]; then
      mill_file="$(command -v file 2>/dev/null || true)"
    fi
    if [[ -z "$mill_file" || ! -x "$mill_file" ]]; then
      mill_file="/nix/store/36cxvi2s369aw85pp7fyzq2dqv459d7c-file-5.48/bin/file"
    fi
    if [[ ! -x "$mill_file" ]]; then
      echo "error: file(1) not found (set FILE= or put file on PATH)" >&2
      exit 1
    fi
    export FILE="$mill_file"
    export PATH="$(dirname "$mill_file"):${PATH}"
    mkdir -p "$out_dir/SystemsLean"
    : > "$log"
    log_run() {
      {
        printf '%q ' "$@"
        printf '\n'
      } >> "$log"
      "$@"
    }
    # Mill Lean threads. Default 16. OccupancyProbe / lake stay 1.
    # later-host-tools mills 55-66 pass LEAN_NUM_THREADS=16.
    : "${LEAN_NUM_THREADS:=16}"
    export LEAN_NUM_THREADS
    export LEAN_PATH="$out_dir"
    mill_ram_cap() {
      local free_gib ram
      free_gib=$(free -g | awk '/^Mem:/ { print $7; exit }')
      if [[ -z "${free_gib}" ]]; then
        free_gib=16
      fi
      ram=$((free_gib / 2))
      if (( ram < 1 )); then ram=1; fi
      if (( ram > 8 )); then ram=8; fi
      printf '%s\n' "$ram"
    }
    compile_extra_mod() {
      local dep="$1"
      local j="$2"
      local dep_src="$src/SystemsLean/${dep}.lean"
      local dep_olean="$out_dir/SystemsLean/${dep}.olean"
      local dep_c="$out_dir/SystemsLean/${dep}.c"
      {
        printf '%q ' lean -j"$j" -R "$src" -o "$dep_olean" -c "$dep_c" "$dep_src"
        printf '\n'
      } >> "$log"
      lean -j"$j" -R "$src" -o "$dep_olean" -c "$dep_c" "$dep_src"
    }
    c_files=()
    extra_list=()
    declare -A is_extra
    add_extra() {
      local dep="$1"
      if [[ -z "$dep" ]]; then
        return 0
      fi
      if [[ "${dep:0:1}" == "#" ]]; then
        return 0
      fi
      if [[ -n "${is_extra[$dep]:-}" ]]; then
        return 0
      fi
      local dep_src="$src/SystemsLean/${dep}.lean"
      if [[ ! -f "$dep_src" ]]; then
        echo "error: missing Lean dep $dep_src" >&2
        exit 1
      fi
      is_extra[$dep]=1
      extra_list+=("$dep")
    }
    if [[ -n "$extras_file" ]]; then
      if [[ ! -f "$extras_file" ]]; then
        echo "error: missing extras file $extras_file" >&2
        exit 1
      fi
      while IFS= read -r dep || [[ -n "$dep" ]]; do
        add_extra "$dep"
      done < "$extras_file"
    elif [[ -n "$extra_mods" ]]; then
      for dep in $extra_mods; do
        add_extra "$dep"
      done
    fi
    if (( ${#extra_list[@]} > 0 )); then
      declare -A extra_need
      for dep in "${extra_list[@]}"; do
        need=""
        while IFS= read -r base; do
          [[ -z "$base" ]] && continue
          [[ "$base" == "$dep" ]] && continue
          if [[ -n "${is_extra[$base]:-}" ]]; then
            need+="$base "
          fi
        done < <(sed -n 's/^import[[:space:]]\{1,\}SystemsLean\.\([A-Za-z0-9_]*\).*/\1/p' "$src/SystemsLean/${dep}.lean")
        extra_need[$dep]="$need"
      done
      declare -A remaining
      for dep in "${extra_list[@]}"; do
        remaining[$dep]=1
      done
      wave_n=0
      while (( ${#remaining[@]} > 0 )); do
        wave=()
        for dep in "${extra_list[@]}"; do
          [[ -z "${remaining[$dep]:-}" ]] && continue
          ready=1
          for need in ${extra_need[$dep]}; do
            if [[ -n "${remaining[$need]:-}" ]]; then
              ready=0
              break
            fi
          done
          if (( ready )); then
            wave+=("$dep")
          fi
        done
        if (( ${#wave[@]} == 0 )); then
          echo "error: extra-mod import cycle among: ${!remaining[*]}" >&2
          exit 1
        fi
        wave_n=$((wave_n + 1))
        idx=0
        n=${#wave[@]}
        echo "  extra wave $wave_n: ${wave[*]} (width $n)"
        while (( idx < n )); do
          ram=$(mill_ram_cap)
          left=$((n - idx))
          cap=$ram
          if (( cap > left )); then cap=$left; fi
          j="$LEAN_NUM_THREADS"
          if (( cap > 1 )); then
            j=$((LEAN_NUM_THREADS / cap))
            if (( j < 2 )); then j=2; fi
            if (( j > 4 )); then j=4; fi
          fi
          pids=()
          b=0
          while (( b < cap )); do
            compile_extra_mod "${wave[$idx]}" "$j" &
            pids+=($!)
            idx=$((idx + 1))
            b=$((b + 1))
          done
          fail=0
          for pid in "${pids[@]}"; do
            wait "$pid" || fail=1
          done
          if (( fail )); then
            echo "error: extra wave $wave_n lean failed" >&2
            exit 1
          fi
        done
        for dep in "${wave[@]}"; do
          unset "remaining[$dep]"
        done
      done
      for dep in "${extra_list[@]}"; do
        c_files+=("$out_dir/SystemsLean/${dep}.c")
      done
    fi
    log_run lean -j"$LEAN_NUM_THREADS" -R "$src" -o "$body_olean" -c "$body_c" "$body_src"
    log_run lean -j"$LEAN_NUM_THREADS" -R "$src" -o "$main_olean" -c "$main_c" "$main_src"
    log_run leanc -o "$elf" "${c_files[@]}" "$body_c" "$main_c"
    if grep -E '(^|[[:space:]/])lake([[:space:]]|$)' "$log"; then
      echo "error: command log contains lake" >&2
      exit 1
    fi
    if [[ ! -x "$elf" ]]; then
      echo "error: missing ELF $elf" >&2
      exit 1
    fi
    if ! "$FILE" -b "$elf" | grep -q ELF; then
      echo "error: not an ELF: $elf" >&2
      exit 1
    fi
    echo "compile-inventory-exe: GREEN $elf"

first-host-tool:
    just _compile-inventory-exe slake-runtime-bench-fail-closed-shape RuntimeBenchFailClosedShape command.log
    echo "first-host-tool: GREEN $PWD/build/first-host-tool/slake-runtime-bench-fail-closed-shape"

# Second inventory ELF. Depends on first so one recipe yields both prior ELFs.
second-host-tool: first-host-tool
    just _compile-inventory-exe slake-runtime-bench-stack-twin RuntimeBenchStackTwin command-stack-twin.log
    echo "second-host-tool: GREEN $PWD/build/first-host-tool/slake-runtime-bench-stack-twin"

# Third inventory ELF. Depends on second so one recipe yields 3 of 69.
third-host-tool: second-host-tool
    just _compile-inventory-exe slake-read-product-ssot ProductPathReadSsot command-read-product-ssot.log
    echo "third-host-tool: GREEN $PWD/build/first-host-tool/slake-read-product-ssot"

# Fourth inventory ELF. Depends on third so one recipe yields 4 of 69.
fourth-host-tool: third-host-tool
    just _compile-inventory-exe slake-freestanding-capable-full-bar CapableFullBar command-capable-full-bar.log
    echo "fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-full-bar"

# Fifth inventory ELF. Depends on fourth so one recipe yields 5 of 69.
fifth-host-tool: fourth-host-tool
    just _compile-inventory-exe slake-freestanding-capable-gap Capable command-capable-gap.log
    echo "fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-gap"

# Sixth inventory ELF. Depends on fifth so one recipe yields 6 of 69.
sixth-host-tool: fifth-host-tool
    just _compile-inventory-exe slake-freestanding-capable-step-contract CapableStepContract command-capable-step-contract.log
    echo "sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-step-contract"

# Seventh inventory ELF. Depends on sixth so one recipe yields 7 of 69.
seventh-host-tool: sixth-host-tool
    just _compile-inventory-exe slake-freestanding-capable-read CapableRead command-capable-read.log
    echo "seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-read"

# Eighth inventory ELF. Depends on seventh so one recipe yields 8 of 69.
eighth-host-tool: seventh-host-tool
    just _compile-inventory-exe slake-freestanding-capable-compose CapableCompose command-capable-compose.log
    echo "eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-compose"

# Ninth inventory ELF. Depends on eighth so one recipe yields 9 of 69.
ninth-host-tool: eighth-host-tool
    just _compile-inventory-exe slake-freestanding-capable-install-out InstallOut command-capable-install-out.log
    echo "ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-install-out"

# Tenth inventory ELF. Depends on ninth so one recipe yields 10 of 69.
tenth-host-tool: ninth-host-tool
    just _compile-inventory-exe slake-ownership-regenerate ProductPathOwnershipRegenerate command-ownership-regenerate.log
    echo "tenth-host-tool: GREEN $PWD/build/first-host-tool/slake-ownership-regenerate"

# Eleventh inventory ELF. Depends on tenth so one recipe yields 11 of 69.
eleventh-host-tool: tenth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-evidence PerformEvidence command-perform-evidence.log
    echo "eleventh-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-evidence"

# Twelfth inventory ELF. Depends on eleventh so one recipe yields 12 of 69.
twelfth-host-tool: eleventh-host-tool
    just _compile-inventory-exe slake-freestanding-perform-official-path OfficialPath command-perform-official-path.log
    echo "twelfth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-official-path"

# Thirteenth inventory ELF. Depends on twelfth so one recipe yields 13 of 69.
thirteenth-host-tool: twelfth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-official-path-alternate OfficialPathAlternate command-perform-official-path-alternate.log
    echo "thirteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-official-path-alternate"

# Fourteenth inventory ELF. Depends on thirteenth so one recipe yields 14 of 69.
fourteenth-host-tool: thirteenth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-dual-equality-write-parity DualEqWriteParity command-perform-dual-equality-write-parity.log
    echo "fourteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-dual-equality-write-parity"

# Fifteenth inventory ELF. Depends on fourteenth so one recipe yields 15 of 69.
fifteenth-host-tool: fourteenth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-dual-equality-write-close-path DualEqWriteClosePath command-perform-dual-equality-write-close-path.log
    echo "fifteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-dual-equality-write-close-path"

# Sixteenth inventory ELF. Depends on fifteenth so one recipe yields 16 of 69.
sixteenth-host-tool: fifteenth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-dual-equality-write-capable-gap DualEqWriteCapableGap command-perform-dual-equality-write-capable-gap.log
    echo "sixteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-dual-equality-write-capable-gap"

# Seventeenth inventory ELF. Depends on sixteenth so one recipe yields 17 of 69.
seventeenth-host-tool: sixteenth-host-tool
    just _compile-inventory-exe slake-freestanding-retire-official OfficialRetire command-retire-official.log
    echo "seventeenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-retire-official"

# Eighteenth inventory ELF. Depends on seventeenth so one recipe yields 18 of 69.
eighteenth-host-tool: seventeenth-host-tool
    just _compile-inventory-exe slake-freestanding-perform-claimed PerformClaimed command-perform-claimed.log
    echo "eighteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-perform-claimed"

# Nineteenth inventory ELF. Depends on eighteenth so one recipe yields 19 of 69.
nineteenth-host-tool: eighteenth-host-tool
    just _compile-inventory-exe slake-freestanding-ownership-claimed OwnershipClaimed command-ownership-claimed.log
    echo "nineteenth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-ownership-claimed"

# Twentieth inventory ELF. Depends on nineteenth so one recipe yields 20 of 69.
twentieth-host-tool: nineteenth-host-tool
    just _compile-inventory-exe slake-freestanding-step-contract-full StepContractFull command-step-contract-full.log
    echo "twentieth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-step-contract-full"

# Twenty-first inventory ELF. Depends on twentieth so one recipe yields 21 of 69.
twenty-first-host-tool: twentieth-host-tool
    just _compile-inventory-exe slake-compose-product-plan ProductPathComposePlan command-compose-product-plan.log
    echo "twenty-first-host-tool: GREEN $PWD/build/first-host-tool/slake-compose-product-plan"

# Twenty-second inventory ELF. Depends on twenty-first so one recipe yields 22 of 69.
twenty-second-host-tool: twenty-first-host-tool
    just _compile-inventory-exe slake-host-package-roots HostPackageRoots command-host-package-roots.log
    echo "twenty-second-host-tool: GREEN $PWD/build/first-host-tool/slake-host-package-roots"

# Twenty-third inventory ELF. Depends on twenty-second so one recipe yields 23 of 69.
# 1-import MultFsWriteTool: compile MultSubsetEmit closed import chain first.
twenty-third-host-tool: twenty-second-host-tool
    just _compile-inventory-exe slake-mult-fs-write-tool MultFsWriteTool command-mult-fs-write-tool.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitMultScaffold EmitMult CompilePath CompilePathMult FirstSurface MultSubsetEmit
    echo "twenty-third-host-tool: GREEN $PWD/build/first-host-tool/slake-mult-fs-write-tool"

# Twenty-fourth inventory ELF. Depends on twenty-third so one recipe yields 24 of 69.
# 1-import FirstSurface: compile CompilePathMult closed import chain first.
twenty-fourth-host-tool: twenty-third-host-tool
    just _compile-inventory-exe slake-first-surface FirstSurface command-first-surface.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitMultScaffold EmitMult CompilePath CompilePathMult
    echo "twenty-fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-first-surface"

# Twenty-fifth inventory ELF. Depends on twenty-fourth so one recipe yields 25 of 69.
# 1-import ProgramSubsetRebuild: compile ProgramSubsetEmit closed import chain first.
twenty-fifth-host-tool: twenty-fourth-host-tool
    just _compile-inventory-exe slake-program-subset-rebuild ProgramSubsetRebuild command-program-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitProgramScaffold EmitProgram CompilePathProgram ProgramSubsetEmit
    echo "twenty-fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-program-subset-rebuild"

# Twenty-sixth inventory ELF. Depends on twenty-fifth so one recipe yields 26 of 69.
# 1-import ExtractSubsetRebuild: compile ExtractSubsetEmit closed import chain first.
twenty-sixth-host-tool: twenty-fifth-host-tool
    just _compile-inventory-exe slake-extract-subset-rebuild ExtractSubsetRebuild command-extract-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult CompilePathMult EmitProgramScaffold EmitProgram CompilePathProgram EmitExtractScaffold EmitExtract CompilePathExtract ExtractSubsetEmit
    echo "twenty-sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-extract-subset-rebuild"

# Twenty-seventh inventory ELF. Depends on twenty-sixth so one recipe yields 27 of 69.
# 1-import ErasureSubsetRebuild: compile ErasureSubsetEmit closed import chain first.
twenty-seventh-host-tool: twenty-sixth-host-tool
    just _compile-inventory-exe slake-erasure-subset-rebuild ErasureSubsetRebuild command-erasure-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitErasureScaffold EmitErasure CompilePathErasure ErasureSubsetEmit
    echo "twenty-seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-erasure-subset-rebuild"

# Twenty-eighth inventory ELF. Depends on twenty-seventh so one recipe yields 28 of 69.
# 1-import GraphSubsetRebuild: compile GraphSubsetEmit closed import chain first.
twenty-eighth-host-tool: twenty-seventh-host-tool
    just _compile-inventory-exe slake-graph-subset-rebuild GraphSubsetRebuild command-graph-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitGraphScaffold EmitGraph CompilePathGraph GraphSubsetEmit
    echo "twenty-eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-graph-subset-rebuild"

# Twenty-ninth inventory ELF. Depends on twenty-eighth so one recipe yields 29 of 69.
# 1-import ComposeSubsetRebuild: compile ComposeSubsetEmit closed import chain first.
twenty-ninth-host-tool: twenty-eighth-host-tool
    just _compile-inventory-exe slake-compose-subset-rebuild ComposeSubsetRebuild command-compose-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitComposeScaffold EmitCompose CompilePathCompose ComposeSubsetEmit
    echo "twenty-ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-compose-subset-rebuild"

# Thirtieth inventory ELF. Depends on twenty-ninth so one recipe yields 30 of 69.
# 1-import LinearSubsetRebuild: compile LinearSubsetEmit closed import chain first.
thirtieth-host-tool: twenty-ninth-host-tool
    just _compile-inventory-exe slake-linear-subset-rebuild LinearSubsetRebuild command-linear-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitLinearScaffold EmitLinear CompilePathLinear LinearSubsetEmit
    echo "thirtieth-host-tool: GREEN $PWD/build/first-host-tool/slake-linear-subset-rebuild"

# Thirty-first inventory ELF. Depends on thirtieth so one recipe yields 31 of 69.
# 1-import TypesSubsetRebuild: compile TypesSubsetEmit closed import chain first.
thirty-first-host-tool: thirtieth-host-tool
    just _compile-inventory-exe slake-types-subset-rebuild TypesSubsetRebuild command-types-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitTypesScaffold EmitTypes CompilePathTypes TypesSubsetEmit
    echo "thirty-first-host-tool: GREEN $PWD/build/first-host-tool/slake-types-subset-rebuild"

# Thirty-second inventory ELF. Depends on thirty-first so one recipe yields 32 of 69.
# 1-import MultSubsetRebuild: compile MultSubsetEmit closed import chain first.
thirty-second-host-tool: thirty-first-host-tool
    just _compile-inventory-exe slake-mult-subset-rebuild MultSubsetRebuild command-mult-subset-rebuild.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitMultScaffold EmitMult CompilePath CompilePathMult FirstSurface MultSubsetEmit
    echo "thirty-second-host-tool: GREEN $PWD/build/first-host-tool/slake-mult-subset-rebuild"

# Thirty-third inventory ELF. Depends on thirty-second so one recipe yields 33 of 69.
# 1-import HostCheck: compile HostFront closed import chain first.
thirty-third-host-tool: thirty-second-host-tool
    just _compile-inventory-exe slake-host-fragment-check HostCheck command-host-fragment-check.log Mult HostTerm HostFrontGoldens HostFront
    echo "thirty-third-host-tool: GREEN $PWD/build/first-host-tool/slake-host-fragment-check"

# Thirty-fourth inventory ELF. Depends on thirty-third so one recipe yields 34 of 69.
# 1-import HostGraph: compile HostFront closed import chain first.
thirty-fourth-host-tool: thirty-third-host-tool
    just _compile-inventory-exe slake-host-graph HostGraph command-host-graph.log Mult HostTerm HostFrontGoldens HostFront
    echo "thirty-fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-host-graph"

# Thirty-fifth inventory ELF. Depends on thirty-fourth so one recipe yields 35 of 69.
# 1-import body HostFront; HostFrontMain imports HostFront.
thirty-fifth-host-tool: thirty-fourth-host-tool
    just _compile-inventory-exe slake-host-front HostFront command-host-front.log Mult HostTerm HostFrontGoldens
    echo "thirty-fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-host-front"

# Thirty-sixth inventory ELF. Depends on thirty-fifth so one recipe yields 36 of 69.
# 2-import ComposeSubsetEmit: compile ComposeSubsetEmit closed import chain first.
thirty-sixth-host-tool: thirty-fifth-host-tool
    just _compile-inventory-exe slake-compose-subset-emit ComposeSubsetEmit command-compose-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitComposeScaffold EmitCompose CompilePathCompose
    echo "thirty-sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-compose-subset-emit"

# Thirty-seventh inventory ELF. Depends on thirty-sixth so one recipe yields 37 of 69.
# 2-import GraphSubsetEmit: compile GraphSubsetEmit closed import chain first.
thirty-seventh-host-tool: thirty-sixth-host-tool
    just _compile-inventory-exe slake-graph-subset-emit GraphSubsetEmit command-graph-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitGraphScaffold EmitGraph CompilePathGraph
    echo "thirty-seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-graph-subset-emit"

# Thirty-eighth inventory ELF. Depends on thirty-seventh so one recipe yields 38 of 69.
# 2-import MultSubsetEmit: compile MultSubsetEmit closed import chain first.
thirty-eighth-host-tool: thirty-seventh-host-tool
    just _compile-inventory-exe slake-mult-subset-emit MultSubsetEmit command-mult-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitMultScaffold EmitMult CompilePath CompilePathMult FirstSurface
    echo "thirty-eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-mult-subset-emit"

# Thirty-ninth inventory ELF. Depends on thirty-eighth so one recipe yields 39 of 69.
# 2-import ErasureSubsetEmit: compile ErasureSubsetEmit closed import chain first.
thirty-ninth-host-tool: thirty-eighth-host-tool
    just _compile-inventory-exe slake-erasure-subset-emit ErasureSubsetEmit command-erasure-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitErasureScaffold EmitErasure CompilePathErasure
    echo "thirty-ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-erasure-subset-emit"

# Fortieth inventory ELF. Depends on thirty-ninth so one recipe yields 40 of 69.
# 2-import ExtractSubsetEmit: compile ExtractSubsetEmit closed import chain first.
fortieth-host-tool: thirty-ninth-host-tool
    just _compile-inventory-exe slake-extract-subset-emit ExtractSubsetEmit command-extract-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult CompilePathMult EmitProgramScaffold EmitProgram CompilePathProgram EmitExtractScaffold EmitExtract CompilePathExtract
    echo "fortieth-host-tool: GREEN $PWD/build/first-host-tool/slake-extract-subset-emit"

# Forty-first inventory ELF. Depends on fortieth so one recipe yields 41 of 69.
# 2-import TypesSubsetEmit: compile TypesSubsetEmit closed import chain first.
forty-first-host-tool: fortieth-host-tool
    just _compile-inventory-exe slake-types-subset-emit TypesSubsetEmit command-types-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitTypesScaffold EmitTypes CompilePathTypes
    echo "forty-first-host-tool: GREEN $PWD/build/first-host-tool/slake-types-subset-emit"

# Forty-second inventory ELF. Depends on forty-first so one recipe yields 42 of 69.
# 2-import ProgramSubsetEmit: compile ProgramSubsetEmit closed import chain first.
forty-second-host-tool: forty-first-host-tool
    just _compile-inventory-exe slake-program-subset-emit ProgramSubsetEmit command-program-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitProgramScaffold EmitProgram CompilePathProgram
    echo "forty-second-host-tool: GREEN $PWD/build/first-host-tool/slake-program-subset-emit"

# Forty-third inventory ELF. Depends on forty-second so one recipe yields 43 of 69.
# 2-import LinearSubsetEmit: compile LinearSubsetEmit closed import chain first.
forty-third-host-tool: forty-second-host-tool
    just _compile-inventory-exe slake-linear-subset-emit LinearSubsetEmit command-linear-subset-emit.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitLinearScaffold EmitLinear CompilePathLinear
    echo "forty-third-host-tool: GREEN $PWD/build/first-host-tool/slake-linear-subset-emit"

# Forty-fourth inventory ELF. Depends on forty-third so one recipe yields 44 of 69.
# 2-import ProductWireWriteTool: compile CapableWriteHc and InstallOut closed
# import chain first.
forty-fourth-host-tool: forty-third-host-tool
    just _compile-inventory-exe slake-product-wire-fs-write-tool ProductWireWriteTool command-product-wire-fs-write-tool.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody CapableWriteHcLoad CapableWriteHc InstallOut
    echo "forty-fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-product-wire-fs-write-tool"

# Forty-fifth inventory ELF. Depends on forty-fourth so one recipe yields 45 of 69.
# 2-import RuntimeBenchLean: compile HostCost and HostCostTheorems closed
# import chain first.
forty-fifth-host-tool: forty-fourth-host-tool
    just _compile-inventory-exe slake-runtime-bench-lean RuntimeBenchLean command-runtime-bench-lean.log Mult Types Erasure Extract IrProgram IrGraph HostCompose ErasureTheorems ExtractTheorems IrGraphTheorems HostComposeTheorems Linear LinearTheorems HostCost HostCostTheorems
    echo "forty-fifth-host-tool: GREEN $PWD/build/first-host-tool/slake-runtime-bench-lean"

# Forty-sixth inventory ELF. Depends on forty-fifth so one recipe yields 46 of 69.
# 3-import FrontMultPackage: compile SubsetFront, MultSubsetEmit, and
# MultSubsetRebuild closed import chain first.
forty-sixth-host-tool: forty-fifth-host-tool
    just _compile-inventory-exe slake-front-mult-package FrontMultPackage command-front-mult-package.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult CompilePathMult FirstSurface SubsetFront MultSubsetEmit MultSubsetRebuild
    echo "forty-sixth-host-tool: GREEN $PWD/build/first-host-tool/slake-front-mult-package"

# Forty-seventh inventory ELF. Depends on forty-sixth so one recipe yields 47 of 69.
# 3-import LlvmMultText: compile Mult, LlvmHold, and LlvmEmitPath closed
# import chain first (LlvmHold imports SelfApply).
forty-seventh-host-tool: forty-sixth-host-tool
    just _compile-inventory-exe slake-llvm-mult-text LlvmMultText command-llvm-mult-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath
    echo "forty-seventh-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-mult-text"

# Forty-eighth inventory ELF. Depends on forty-seventh so one recipe yields 48 of 69.
# 4-import CapableRegenerate: compile CapableRead, CapableCompose,
# CapableWriteHc, and InstallOut closed import chain first.
forty-eighth-host-tool: forty-seventh-host-tool
    just _compile-inventory-exe slake-freestanding-capable-regenerate CapableRegenerate command-capable-regenerate.log Mult Types Erasure Extract IrProgram IrGraph HostCompose EmitBannerScaffold EmitBanner EmitMultScaffold EmitMult EmitLinearScaffold EmitLinear EmitErasureScaffold EmitErasure EmitExtractScaffold EmitExtract EmitTypesScaffold EmitTypes EmitProgramScaffold EmitProgram EmitGraphScaffold EmitGraph EmitComposeScaffold EmitCompose EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody CapableWriteHcLoad CapableWriteHc CapableRead CapableCompose InstallOut
    echo "forty-eighth-host-tool: GREEN $PWD/build/first-host-tool/slake-freestanding-capable-regenerate"

# Forty-ninth inventory ELF. Depends on forty-eighth so one recipe yields 49 of 69.
# 4-import LlvmLinearText: compile Linear, LlvmHold, LlvmEmitPath, and
# LlvmMultText closed import chain first.
forty-ninth-host-tool: forty-eighth-host-tool
    just _compile-inventory-exe slake-llvm-linear-text LlvmLinearText command-llvm-linear-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText
    echo "forty-ninth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-linear-text"

# Fiftieth inventory ELF. Depends on forty-ninth so one recipe yields 50 of 69.
# 4-import SubsetFront: compile CompilePath, IrProgram, Types, and Mult
# closed import chain first.
fiftieth-host-tool: forty-ninth-host-tool
    just _compile-inventory-exe slake-subset-front SubsetFront command-subset-front.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath
    echo "fiftieth-host-tool: GREEN $PWD/build/first-host-tool/slake-subset-front"

# Fifty-first inventory ELF. Depends on fiftieth so one recipe yields 51 of 69.
# 5-import LlvmMultSsa: compile Mult, KernelMult, LlvmHold, LlvmEmitPath, and
# LlvmMultText closed import chain first.
fifty-first-host-tool: fiftieth-host-tool
    just _compile-inventory-exe slake-llvm-mult-ssa LlvmMultSsa command-llvm-mult-ssa.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath LlvmMultText
    echo "fifty-first-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-mult-ssa"

# Fifty-second inventory ELF. Depends on fifty-first so one recipe yields 52 of 69.
# 6-import LlvmTypesText: compile Types, Mult, LlvmHold, LlvmEmitPath,
# LlvmMultText, and LlvmLinearText closed import chain first.
fifty-second-host-tool: fifty-first-host-tool
    just _compile-inventory-exe slake-llvm-types-text LlvmTypesText command-llvm-types-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText
    echo "fifty-second-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-types-text"

# Fifty-third inventory ELF. Depends on fifty-second so one recipe yields 53 of 69.
# 6-import LlvmProgramText: compile IrProgram, LlvmHold, LlvmEmitPath,
# LlvmMultText, LlvmLinearText, and LlvmTypesText closed import chain first.
fifty-third-host-tool: fifty-second-host-tool
    just _compile-inventory-exe slake-llvm-program-text LlvmProgramText command-llvm-program-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText
    echo "fifty-third-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-program-text"

# Fifty-fourth inventory ELF. Depends on fifty-third so one recipe yields 54 of 69.
# 7-import LlvmGraphText: compile IrGraph, LlvmHold, LlvmEmitPath,
# LlvmMultText, LlvmLinearText, LlvmTypesText, and LlvmProgramText closed
# import chain first.
fifty-fourth-host-tool: fifty-third-host-tool
    just _compile-inventory-exe slake-llvm-graph-text LlvmGraphText command-llvm-graph-text.log Mult Types Erasure Extract IrProgram IrGraph HostCompose CompilePath EmitMultScaffold EmitMult KernelMult ParityMult KernelLinear KernelTypes KernelProgram EmitPlanScaffold EmitPlan EmitApplyScaffold EmitApply EmitBodyScaffold EmitBody KernelEmit SelfApply LlvmHold LlvmEmitPath Linear LlvmMultText LlvmLinearText LlvmTypesText LlvmProgramText
    echo "fifty-fourth-host-tool: GREEN $PWD/build/first-host-tool/slake-llvm-graph-text"
