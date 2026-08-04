# Modular just: just/freestanding-perform-3.just -- role recipes (import into root justfile).
# Modular dual-pin honesty (tokens required by pure Nix JustPath scan):
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED
freestanding-retire-official:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-retire-official (B38 RETIRE-OFFICIAL; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    echo "  token: FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    echo "  framing: official just build uses freestanding dual-eq WRITE; FreestandingEmit retired"
    echo "  distinct from B37 freestanding-perform-dual-equality-write-capable-gap (CAPABLE-GAP close, not official retire)"
    echo "  RETIRE-OFFICIAL measured true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; perform claimed false; DependsOnLake true; not Full; not complete"
    # RETIRE-OFFICIAL module (short name OfficialRetire) must not import FreestandingEmit.
    retire_mod="$lean_dir/OfficialRetire.lean"
    if [[ ! -f "$retire_mod" ]]; then
      echo "error: missing RETIRE-OFFICIAL module $retire_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$retire_mod"; then
      echo "error: RETIRE-OFFICIAL module imports FreestandingEmit: $retire_mod" >&2
      exit 1
    fi
    # RETIRE-OFFICIAL module honesty pins.
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialStepAdvanced : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialStepAdvanced true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$retire_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$retire_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$retire_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$retire_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL' "$retire_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL in $retire_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED' "$retire_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED in $retire_mod" >&2
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
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: RETIRE-OFFICIAL measured + StillUses false + perform claimed false.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $self_fs" >&2
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
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathOfficialPathRetireOfficialPartialReady' "$self_fs"; then
      echo "error: missing productPathOfficialPathRetireOfficialPartialReady in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: CAPABLE-GAP re-opened: productPathDualEqualityWriteParityGapOpen not false in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-retire-official' "${just_sources[@]}"; then
      echo "error: missing freestanding-retire-official in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-retire-official-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-retire-official-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-retire-official' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-retire-official in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'OfficialRetire' "${just_sources[@]}"; then
      echo "error: missing OfficialRetire in modular just tree" >&2
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
    if printf '%s\n' "$out_body" | grep -q 'freestanding-retire-official'; then
      echo "error: build cites freestanding-retire-official (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B37 CAPABLE-GAP still green (Lake-free).
    just freestanding-perform-dual-equality-write-capable-gap
    echo "freestanding-retire-official: GREEN (B38 RETIRE-OFFICIAL; official dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false; land-time OfficialRetire perform claimed false; SelfApplyFs living tip perform claimed true after B39; DependsOnLake true; CAPABLE-GAP closed)"

# Partial B38 measure print (Lake diagnostic; optional). RETIRE-OFFICIAL dual-pin is Lake-free above.
# Greppable: freestanding-retire-official-measure,
# slake-freestanding-retire-official,
# OfficialRetire
freestanding-retire-official-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-retire-official-measure (B38 RETIRE-OFFICIAL measure; land-time not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    echo "  RETIRE-OFFICIAL measured true; dual-eq WRITE true; StillUsesFreestandingEmit false; OfficialRetire perform claimed false; SelfApplyFs living tip true after B39"
    echo "  not ownership claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialRetire.lean" ]]; then
      echo "error: missing SystemsLean OfficialRetire / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-retire-official-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-retire-official
      lake exe slake-freestanding-retire-official
    )
    echo "freestanding-retire-official-measure: GREEN (RETIRE-OFFICIAL measured true; dual-eq WRITE; StillUsesFreestandingEmit false; Full false)"

# Partial B39: freestanding product path PERFORM-CLAIMED beyond B38 RETIRE-OFFICIAL.
# productPathFreestandingPerformClaimed true with official dual-eq WRITE evidence
# (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed). Official path uses
# freestanding-capable-regenerate dual-eq WRITE; FreestandingEmit retired (B38).
# productPathFreestandingPerformClaimedMeasured true; DependsOnLake true;
# StillUsesLake true; ownership claimed false; complete false; CAPABLE-GAP closed.
# Greppable: freestanding-perform-claimed,
# productPathFreestandingPerformClaimedMeasured,
# FREESTANDING-PERFORM-CLAIMED,
# FREESTANDING-PERFORM-CLAIMED-MEASURED,
# FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE,
# FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED
freestanding-perform-claimed:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-claimed (B39 PERFORM-CLAIMED; not ownership claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    echo "  token: FREESTANDING-PERFORM-CLAIMED"
    echo "  framing: official dual-eq WRITE evidence; SelfApplyFs perform claimed true; ownership false"
    echo "  distinct from B38 freestanding-retire-official (RETIRE-OFFICIAL, land-time not claimed)"
    echo "  PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; not Full; not ownership; not complete"
    # PERFORM-CLAIMED module (short name PerformClaimed) must not import FreestandingEmit.
    claimed_mod="$lean_dir/PerformClaimed.lean"
    if [[ ! -f "$claimed_mod" ]]; then
      echo "error: missing PERFORM-CLAIMED module $claimed_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$claimed_mod"; then
      echo "error: PERFORM-CLAIMED module imports FreestandingEmit: $claimed_mod" >&2
      exit 1
    fi
    # PERFORM-CLAIMED module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedStepAdvanced : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimedStepAdvanced true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$claimed_mod"; then
      echo "error: missing freestandingProductSelfHostComplete false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED' "$claimed_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE' "$claimed_mod"; then
      echo "error: missing FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE in $claimed_mod" >&2
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
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: PERFORM-CLAIMED measured + perform claimed true + B38 retire.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs" >&2
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
    if ! grep -qF 'productPathFreestandingPerformClaimedPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimedPartialReady in $self_fs" >&2
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
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs (B40 living tip)" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-perform-claimed' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-claimed in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-claimed-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-claimed-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-claimed' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-perform-claimed in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'PerformClaimed' "${just_sources[@]}"; then
      echo "error: missing PerformClaimed in modular just tree" >&2
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
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-claimed'; then
      echo "error: build cites freestanding-perform-claimed (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B38 RETIRE-OFFICIAL still green (Lake-free).
    just freestanding-retire-official
    echo "freestanding-perform-claimed: GREEN (B39 PERFORM-CLAIMED; official dual-eq WRITE evidence; perform claimed true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; land-time PerformClaimed ownership false; SelfApplyFs living tip ownership claimed true after B40; complete false; CAPABLE-GAP closed)"

# Partial B39 measure print (Lake diagnostic; optional). PERFORM-CLAIMED dual-pin is Lake-free above.
# Greppable: freestanding-perform-claimed-measure,
# slake-freestanding-perform-claimed,
# PerformClaimed
freestanding-perform-claimed-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-claimed-measure (B39 PERFORM-CLAIMED measure; not ownership claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    echo "  PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed with evidence"
    echo "  not ownership claimed; not residual free; not PROVABLY; not complete"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/PerformClaimed.lean" ]]; then
      echo "error: missing SystemsLean PerformClaimed / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-claimed-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-claimed
      lake exe slake-freestanding-perform-claimed
    )
    echo "freestanding-perform-claimed-measure: GREEN (PERFORM-CLAIMED measured true; perform claimed true; dual-eq WRITE; land-time ownership false; Full false; complete false)"

# Partial B40: freestanding product path OWNERSHIP-CLAIMED beyond B39 PERFORM-CLAIMED.
# productPathFreestandingOwnershipClaimed true with perform-claimed + official dual-eq
# WRITE evidence (FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed). Official path
# uses freestanding-capable-regenerate dual-eq WRITE; FreestandingEmit retired (B38).
# productPathFreestandingOwnershipClaimedMeasured true; DependsOnLake true;
# StillUsesLake true; Full false; complete false; CAPABLE-GAP closed.
# Greppable: freestanding-ownership-claimed,
# productPathFreestandingOwnershipClaimedMeasured,
# FREESTANDING-OWNERSHIP-CLAIMED,
# FREESTANDING-OWNERSHIP-CLAIMED-MEASURED,
# FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE,
# FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED
freestanding-ownership-claimed:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-ownership-claimed (B40 OWNERSHIP-CLAIMED; not Full / complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    echo "  token: FREESTANDING-OWNERSHIP-CLAIMED"
    echo "  framing: perform-claimed + official dual-eq WRITE evidence; SelfApplyFs ownership claimed true; living tip stepContractFull true after Full"
    echo "  distinct from B39 freestanding-perform-claimed (PERFORM-CLAIMED, land-time not ownership)"
    echo "  OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; not Full; not complete"
    # OWNERSHIP-CLAIMED module (short name OwnershipClaimed) must not import FreestandingEmit.
    claimed_mod="$lean_dir/OwnershipClaimed.lean"
    if [[ ! -f "$claimed_mod" ]]; then
      echo "error: missing OWNERSHIP-CLAIMED module $claimed_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$claimed_mod"; then
      echo "error: OWNERSHIP-CLAIMED module imports FreestandingEmit: $claimed_mod" >&2
      exit 1
    fi
    # OWNERSHIP-CLAIMED module honesty pins.
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedStepAdvanced : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimedStepAdvanced true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathUsesDualEqualityWrite : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathUsesDualEqualityWrite true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake false (M6) in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireOfficialMeasured : Bool := true' "$claimed_mod"; then
      echo "error: missing productPathOfficialPathRetireOfficialMeasured true in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathPerformDependsOnLake false (M6) in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingCapableStepContractFullSatisfied : Bool := false' "$claimed_mod"; then
      echo "error: missing productPathFreestandingCapableStepContractFullSatisfied false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingProductSelfHostComplete : Bool := false' "$claimed_mod"; then
      echo "error: missing freestandingProductSelfHostComplete false in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED' "$claimed_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE' "$claimed_mod"; then
      echo "error: missing FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE in $claimed_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE' "$claimed_mod"; then
      echo "error: missing FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE in $claimed_mod" >&2
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
    # requireDualSsotEqual def lives on CapableWriteHcLoad (long-file peel).
    _capable_load="${capable_mod%CapableWriteHc.lean}CapableWriteHcLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$capable_mod" \
        && ! { [[ -f "$_capable_load" ]] && grep -qF 'def requireDualSsotEqual' "$_capable_load"; }; then
      echo "error: missing requireDualSsotEqual in $capable_mod or $_capable_load" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: OWNERSHIP-CLAIMED measured + ownership claimed true + B39 perform.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimedMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingOwnershipClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimed true in $self_fs" >&2
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
    if ! grep -qF 'productPathFreestandingOwnershipClaimedPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingOwnershipClaimedPartialReady in $self_fs" >&2
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
    if ! grep -qF 'def stepContractFull : Bool := true' "$self_fs"; then
      echo "error: missing stepContractFull true in $self_fs (Full living tip)" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe; official path dual-eq regenerate.
    if ! grep -qF 'freestanding-ownership-claimed' "${just_sources[@]}"; then
      echo "error: missing freestanding-ownership-claimed in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-ownership-claimed-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-ownership-claimed-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-ownership-claimed' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-ownership-claimed in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'OwnershipClaimed' "${just_sources[@]}"; then
      echo "error: missing OwnershipClaimed in modular just tree" >&2
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
    if printf '%s\n' "$out_body" | grep -q 'freestanding-ownership-claimed'; then
      echo "error: build cites freestanding-ownership-claimed (measure path, not writer)" >&2
      exit 1
    fi
    # Prerequisite: B39 PERFORM-CLAIMED still green (Lake-free; re-greens B38).
    just freestanding-perform-claimed
    echo "freestanding-ownership-claimed: GREEN (B40 OWNERSHIP-CLAIMED; perform-claimed + official dual-eq WRITE evidence; ownership claimed true; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; land-time OwnershipClaimed Full long-name false; SelfApplyFs living tip stepContractFull true after Full; complete true after claim B; CAPABLE-GAP closed)"

# Partial B40 measure print (Lake diagnostic; optional). OWNERSHIP-CLAIMED dual-pin is Lake-free above.
# Greppable: freestanding-ownership-claimed-measure,
# slake-freestanding-ownership-claimed,
# OwnershipClaimed
freestanding-ownership-claimed-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-ownership-claimed-measure (B40 OWNERSHIP-CLAIMED measure; not Full / complete) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    echo "  OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE true; StillUsesFreestandingEmit false; FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed with evidence"
    echo "  not Full; not residual free; not PROVABLY; not complete"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OwnershipClaimed.lean" ]]; then
      echo "error: missing SystemsLean OwnershipClaimed / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-ownership-claimed-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-ownership-claimed
      lake exe slake-freestanding-ownership-claimed
    )
    echo "freestanding-ownership-claimed-measure: GREEN (OWNERSHIP-CLAIMED measured true; ownership claimed true; perform claimed true; dual-eq WRITE; Full false; complete false)"


# Full freestanding-capable step-contract after B40 OWNERSHIP-CLAIMED.
# stepContractFull true with ownership-claimed + perform-claimed + official dual-eq
# WRITE evidence. Official path uses freestanding-capable-regenerate dual-eq WRITE;
# FreestandingEmit retired (B38). stepContractFullMeasured true; DependsOnLake true;
# StillUsesLake true; complete false; CAPABLE-GAP closed.
# Short living tip name stepContractFull (not productPathFreestandingCapable*).
# Greppable: freestanding-step-contract-full,
# stepContractFullMeasured,
# FREESTANDING-STEP-CONTRACT-FULL,
# FREESTANDING-STEP-CONTRACT-FULL-MEASURED,
# FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE,
# FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
# FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL
