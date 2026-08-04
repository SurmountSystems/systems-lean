# Modular just: just/freestanding-complete.just -- role recipes (import into root justfile).
# Modular dual-pin honesty (tokens required by pure Nix JustPath scan):
# FREESTANDING-STEP-CONTRACT-FULL-MEASURED
# FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED
freestanding-step-contract-full:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-step-contract-full (Full step-contract; not complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    echo "  token: FREESTANDING-STEP-CONTRACT-FULL"
    echo "  framing: ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs stepContractFull true; complete true after claim B"
    echo "  distinct from B40 freestanding-ownership-claimed (OWNERSHIP-CLAIMED, land-time Full long-name false)"
    echo "  Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; complete true after claim B"
    # Full module (short name StepContractFull) must not import FreestandingEmit.
    full_mod="$lean_dir/StepContractFull.lean"
    if [[ ! -f "$full_mod" ]]; then
      echo "error: missing Full module $full_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$full_mod"; then
      echo "error: Full module imports FreestandingEmit: $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullMeasured : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFullMeasured true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullStepAdvanced : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFullStepAdvanced true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$full_mod"; then
      echo "error: missing stepContractFull true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$full_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$full_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$full_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$full_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$full_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$full_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$full_mod"; then
      echo "error: missing freestandingProductSelfHostComplete true in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL' "$full_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE' "$full_mod"; then
      echo "error: missing FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE in $full_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE' "$full_mod"; then
      echo "error: missing FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE in $full_mod" >&2
      exit 1
    fi
    # Capable WRITE dual-eq remains live (B37 evidence substrate).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$capable_mod" ]]; then
      echo "error: missing Capable WRITE module $capable_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$capable_mod"; then
      echo "error: Capable WRITE module imports FreestandingEmit: $capable_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel); parent cites API name.
    capable_load="$lean_dir/CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: Full measured + stepContractFull true + B40 ownership + B39 perform.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFullMeasured : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFullMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'stepContractFullPartialReady' "$self_fs"; then
      echo "error: missing stepContractFullPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-step-contract-full' "${just_sources[@]}"; then
      echo "error: missing freestanding-step-contract-full in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-step-contract-full-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-step-contract-full-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-step-contract-full' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-step-contract-full in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'StepContractFull' "${just_sources[@]}"; then
      echo "error: missing StepContractFull in modular just tree" >&2
      exit 1
    fi
    if ! grep -q 'build:' "${just_sources[@]}"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$product_wire_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (official dual-eq WRITE)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (FreestandingEmit not retired)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-step-contract-full'; then
      echo "error: build cites freestanding-step-contract-full (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B40 OWNERSHIP-CLAIMED still green (Lake-free; re-greens B39/B38).
    just freestanding-ownership-claimed
    echo "freestanding-step-contract-full: GREEN (Full step-contract; ownership-claimed + perform-claimed + official dual-eq WRITE evidence; stepContractFull true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; complete true after claim B; CAPABLE-GAP closed)"

# Full measure print (Lake diagnostic; optional). Full dual-pin is Lake-free above.
# Greppable: freestanding-step-contract-full-measure,
# slake-freestanding-step-contract-full,
# StepContractFull
freestanding-step-contract-full-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-step-contract-full-measure (Full measure; not complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    echo "  Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false"
    echo "  not complete; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/StepContractFull.lean" ]]; then
      echo "error: missing SystemsLean StepContractFull / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-step-contract-full-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-step-contract-full
      lake exe slake-freestanding-step-contract-full
    )
    echo "freestanding-step-contract-full-measure: GREEN (Full measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE; complete true after claim B)"

# Partial B14 ordered host pipeline join (B6 plan order). Still Lake for middle steps.
# Orchestrates existing entrypoints: read -> compose -> write-hc -> install.
# Honest: NOT freestanding-capable close; productPathFreestandingPerformClaimed stays false.
# Greppable: regenerate-product-path, productPathFreestandingCapableOrderedPipelineRecipe,
# SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP, WRITER-PATH-STEP-READ-SSOT,
# WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
# WRITER-PATH-STEP-INSTALL-OUT

# ---------------------------------------------------------------------------
# freestanding-self-host-complete -- claim B freestanding product self-host complete
# after Full. Grep dual-pin + host elaborator proof while bootstrapping:
# SelfApplyFs complete true + SelfHostComplete + stepContractFull true +
# ownership/perform true + StillUsesFreestandingEmit false + residual free true
# (claim A) + llvm/PROVABLY false, then lake build/exe
# slake-freestanding-self-host-complete (fail closed if lake missing -- claim flip
# cannot GREEN on greps alone).
# Honesty: product path StillUsesLake / DependsOnLake false after M6 (living tip).
# Host elaborator residual may remain (DualResidual). Short role module
# SelfHostComplete. Measure recipe remains a lake-only claim-proof path.
# Greppable: freestanding-self-host-complete,
# freestandingProductSelfHostCompleteMeasured,
# SELF-HOST-FREESTANDING-PRODUCT-COMPLETE,
# FREESTANDING-PRODUCT-SELF-HOST-COMPLETE,
# SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0
# ---------------------------------------------------------------------------
freestanding-self-host-complete:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    lean_dir="$root/src/systems/SystemsLean"
    echo "== freestanding-self-host-complete (claim B complete after Full) =="
    echo "  framing: Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs freestandingProductSelfHostComplete true; product residual free claimed (claim A)"
    echo "  complete measured true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake false; StillUsesLake false (M6); residual free true; llvm/PROVABLY false"
    complete_mod="$lean_dir/SelfHostComplete.lean"
    if [[ ! -f "$complete_mod" ]]; then
      echo "error: missing $complete_mod" >&2
      exit 1
    fi
    if grep -qF 'import SystemsLean.FreestandingEmit' "$complete_mod"; then
      echo "error: SelfHostComplete must not import FreestandingEmit" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteMeasured : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostCompleteMeasured true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteStepAdvanced : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostCompleteStepAdvanced true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$complete_mod"; then
      echo "error: missing freestandingProductSelfHostComplete true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$complete_mod"; then
      echo "error: missing stepContractFull true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing ownership claimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing perform claimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$complete_mod"; then
      echo "error: missing dual-eq WRITE true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$complete_mod"; then
      echo "error: missing StillUsesFreestandingEmit false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$complete_mod"; then
      echo "error: missing StillUsesLake false (M6) in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$complete_mod"; then
      echo "error: missing DependsOnLake false (M6) in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def residualFreeClaimed : Bool := true' "$complete_mod"; then
      echo "error: missing residualFreeClaimed true in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def llvmUnlocked : Bool := false' "$complete_mod"; then
      echo "error: missing llvmUnlocked false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def provablyUnlocked : Bool := false' "$complete_mod"; then
      echo "error: missing provablyUnlocked false in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0' "$complete_mod"; then
      echo "error: missing stage id in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-PRODUCT-SELF-HOST-COMPLETE' "$complete_mod"; then
      echo "error: missing FREESTANDING-PRODUCT-SELF-HOST-COMPLETE in $complete_mod" >&2
      exit 1
    fi
    if ! grep -qF 'SELF-HOST-FREESTANDING-PRODUCT-COMPLETE' "$complete_mod"; then
      echo "error: missing SELF-HOST-FREESTANDING-PRODUCT-COMPLETE in $complete_mod" >&2
      exit 1
    fi
    if grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$complete_mod"; then
      echo "error: SelfHostComplete must not pin complete false" >&2
      exit 1
    fi
    # Capable WRITE dual-eq live remains (requireDualSsotEqual def on Load peel).
    capable_mod="$lean_dir/CapableWriteHc.lean"
    capable_load="$lean_dir/CapableWriteHcLoad.lean"
    if [[ -f "$capable_mod" ]]; then
      if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$capable_mod"; then
        echo "error: missing productPathCapableWriteDualEqualityLive true in $capable_mod" >&2
        exit 1
      fi
      if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
          && ! { [[ -f "$capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$capable_load"; }; then
        echo "error: missing requireDualSsotEqual in $capable_mod or $capable_load" >&2
        exit 1
      fi
    fi
    # SelfApplyFs dual-pin living tip
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostCompleteMeasured : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostCompleteMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := true' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostComplete true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing ownership claimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing perform claimed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$self_fs"; then
      echo "error: missing dual-eq WRITE true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing StillUsesFreestandingEmit false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$self_fs"; then
      echo "error: missing StillUsesLake false (M6) in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$self_fs"; then
      echo "error: missing DependsOnLake false (M6) in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingProductSelfHostCompletePartialReady' "$self_fs"; then
      echo "error: missing freestandingProductSelfHostCompletePartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'stepContractFullPartialReady' "$self_fs"; then
      echo "error: missing stepContractFullPartialReady in $self_fs" >&2
      exit 1
    fi
    if grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$self_fs"; then
      echo "error: SelfApplyFs must not pin complete false after claim B complete" >&2
      exit 1
    fi
    # justfile self-cites
    just_sources=("$root/justfile" "$root"/just/*.just)
    product_wire_just="$root/just/product-wire.just"
    if ! grep -qF 'freestanding-self-host-complete' "${just_sources[@]}"; then
      echo "error: missing freestanding-self-host-complete in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-self-host-complete-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-self-host-complete-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-self-host-complete' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-self-host-complete in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'SelfHostComplete' "${just_sources[@]}"; then
      echo "error: missing SelfHostComplete cite in modular just tree" >&2
      exit 1
    fi
    # official path still dual-eq regenerate; not complete recipe as writer
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$product_wire_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build must use freestanding-capable-regenerate" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-self-host-complete'; then
      echo "error: build cites freestanding-self-host-complete (measure path, not writer)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build must not use slake-emit-freestanding-c as writer" >&2
      exit 1
    fi
    # Re-green Full (prerequisite)
    just freestanding-step-contract-full
    # Claim flip requires lake elaboration when lake is on PATH (not grep-only GREEN).
    # Fail closed if lake missing so agents cannot treat incomplete proof as done.
    if command -v lake >/dev/null 2>&1; then
      echo "  lake on PATH: building slake-freestanding-self-host-complete (claim elaborator proof)"
      (
        cd "$root/src/systems"
        lake build slake-freestanding-self-host-complete
        lake exe slake-freestanding-self-host-complete
      )
      echo "  lake claim proof: GREEN"
    else
      echo "warning: lake not on PATH; grep pins only -- claim elaborator proof BLOCKED (not full GREEN for claim flip)" >&2
      echo "error: freestanding-self-host-complete requires lake on PATH for claim-B complete proof" >&2
      exit 1
    fi
    echo "freestanding-self-host-complete: GREEN (claim B complete; Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; freestandingProductSelfHostComplete true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake false; StillUsesLake false (M6); residual free true; llvm/PROVABLY false; CAPABLE-GAP closed; lake claim proof ran)"

# Greppable: freestanding-self-host-complete-measure,
# slake-freestanding-self-host-complete,
freestanding-self-host-complete-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    echo "== freestanding-self-host-complete-measure (claim B complete measure) =="
    echo "  complete measured true; freestandingProductSelfHostComplete true; stepContractFull true"
    echo "  ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false"
    echo "  residual free true (claim A); llvm/PROVABLY false"
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-self-host-complete-measure requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$root/src/systems"
      lake build slake-freestanding-self-host-complete
      lake exe slake-freestanding-self-host-complete
    )
    echo "freestanding-self-host-complete-measure: GREEN (complete measured true; freestandingProductSelfHostComplete true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE; residual free true; llvm false)"
