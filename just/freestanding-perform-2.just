# Modular just: just/freestanding-perform-2.just -- role recipes (import into root justfile).
freestanding-perform-dual-equality-write-close-path:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-dual-equality-write-close-path (B35 dual-equality WRITE close path; not gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    echo "  framing: ordered close-path steps named; gap stays open; close path named != gap closed"
    echo "  distinct from B34 freestanding-perform-dual-equality-write-parity (parity dual-pin, not close path)"
    echo "  close path measured true; named true; not gap closed true; gap open true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Close-path module must not import FreestandingEmit (measure only).
    close_mod="$lean_dir/DualEqWriteClosePath.lean"
    if [[ ! -f "$close_mod" ]]; then
      echo "error: missing dual-equality WRITE close-path module $close_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$close_mod"; then
      echo "error: dual-equality WRITE close-path module imports FreestandingEmit: $close_mod" >&2
      exit 1
    fi
    # Close-path module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteClosePathMeasured true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNamed : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteClosePathNamed true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNotGapClosed : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteClosePathNotGapClosed true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$close_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$close_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$close_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$close_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $close_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$close_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteParityMeasured true in $close_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL" \
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "DUAL-SSOT-EQUALITY" \
      "requireDualSsotEqual" \
      "freestandingCapableWriteFreestandingHc" \
      "CapableWriteHc"; do
      if ! grep -qF "$tok" "$close_mod"; then
        echo "error: missing dual-equality WRITE close-path token $tok in $close_mod" >&2
        exit 1
      fi
    done
    # Capable WRITE module present (structural side still residual).
    write_mod="$lean_dir/CapableWriteHc.lean"
    if [[ ! -f "$write_mod" ]]; then
      echo "error: missing freestanding-capable WRITE-HC module $write_mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingCapableWriteFreestandingHc' "$write_mod"; then
      echo "error: missing freestandingCapableWriteFreestandingHc in $write_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$write_mod"; then
      echo "error: freestanding-capable WRITE-HC imports FreestandingEmit (must stay AuthorityNotEmit): $write_mod" >&2
      exit 1
    fi
    # Land-time dual-pin: FreestandingEmit still cited; living tip B38 dual-eq official.
    if [[ ! -f justfile && ! -f "$root/justfile" ]]; then
      echo "error: missing root justfile" >&2
      exit 1
    fi
    if ! grep -qF 'build:' "${just_sources[@]}"; then
      echo "error: missing build recipe in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: official path missing lake build slake-emit-freestanding-c in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: official path missing lake exe slake-emit-freestanding-c in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "${just_sources[@]}"; then
      echo "error: official path missing SystemsLean.FreestandingEmit cite in modular just tree" >&2
      exit 1
    fi
    # Official path must not call freestanding-capable WRITE as dual-equality retirement.
    # Living tip after B38: official path uses freestanding-capable-regenerate.
    if ! awk '
      /^build:/ { in_rec=1; next }
      in_rec && /^[a-zA-Z0-9_-]+:/ { exit }
      in_rec { print }
    ' "$product_wire_just" | grep -qF 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: close path measured true + named true + gap closed after B37 next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNamed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path named true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE close path not gap closed false pin (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE parity gap open false pin (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs Capable WRITE structural not dual-equality false pin (B37 dual-eq)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B34 dual-equality WRITE parity still green (Lake-free).
    just freestanding-perform-dual-equality-write-parity
    echo "freestanding-perform-dual-equality-write-close-path: GREEN (B35 dual-equality WRITE close path measured; named; gap closed after B37; perform claimed false; DependsOnLake true; living tip B38 FreestandingEmit retired)"

# Partial B35 measure print (Lake diagnostic; optional). Close path is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-close-path-measure,
# slake-freestanding-perform-dual-equality-write-close-path,
# DualEqWriteClosePath
freestanding-perform-dual-equality-write-close-path-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-close-path-measure (B35 dual-equality WRITE close path measure; not gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    echo "  close path measured true; named true; not gap closed true; gap open true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteClosePath.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteClosePath / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-close-path-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-close-path
      lake exe slake-freestanding-perform-dual-equality-write-close-path
    )
    echo "freestanding-perform-dual-equality-write-close-path-measure: GREEN (close path measured true; named true; not gap closed true; gap open true; perform claimed false; Full false)"

# Partial B36 dual-equality freestanding WRITE API (beyond B35 close path;
# close-path step DUAL-EQUALITY-API). Lake-free dual-pin: real freestanding
# dual-equality WRITE API present (Emit* + requireDualSsotEqual + write; not
# FreestandingEmit authority); land-time API not official just build;
# land-time API module may pin gap open; SelfApplyFs gap closed after B37
# CAPABLE-GAP (Capable dual-eq live); living tip B38 FreestandingEmit retired;
# B35 close path re-green. Does NOT flip perform claimed from API alone.
# productPathFreestandingPerformDualEqualityWriteApiMeasured true;
# productPathDualEqualityWriteApiPresent true;
# productPathDualEqualityWriteApiAuthorityNotEmit true;
# productPathDualEqualityWriteApiNotOfficial true;
# productPathDualEqualityWriteApiStepAdvanced true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-api,
# productPathFreestandingPerformDualEqualityWriteApiMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED,
# freestandingDualEqualityWriteFreestandingHc,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API
freestanding-perform-dual-equality-write-api:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-dual-equality-write-api (B36 dual-equality WRITE API; land-time API module may pin gap open; SelfApplyFs gap closed after B37; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    echo "  framing: real freestanding dual-equality WRITE (Emit* + requireDualSsotEqual + write); SelfApplyFs gap closed after B37 (historical API module may pin gap open)"
    echo "  distinct from B35 freestanding-perform-dual-equality-write-close-path (close-path naming, not dual-equality WRITE API)"
    echo "  API measured true; present true; authority not emit; not official; step advanced; SelfApplyFs gap closed after B37; perform claimed false; DependsOnLake true; not Full; not complete"
    # Dual-equality WRITE API module must not import FreestandingEmit (Emit* only).
    api_mod="$lean_dir/DualEqWriteApi.lean"
    if [[ ! -f "$api_mod" ]]; then
      echo "error: missing dual-equality WRITE API module $api_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$api_mod"; then
      echo "error: dual-equality WRITE API module imports FreestandingEmit: $api_mod" >&2
      exit 1
    fi
    # Must import Emit* fragments for real dual-equality (not structural-only theater).
    for emit_mod in EmitBanner EmitMult EmitLinear EmitErasure EmitExtract EmitTypes EmitProgram EmitGraph EmitCompose EmitPlan EmitApply EmitBody; do
      if ! grep -q "import SystemsLean.${emit_mod}" "$api_mod"; then
        echo "error: dual-equality WRITE API module missing import SystemsLean.${emit_mod}: $api_mod" >&2
        exit 1
      fi
    done
    # API module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true' "$api_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiMeasured true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiPresent : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiPresent true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiAuthorityNotEmit true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiNotOfficial : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiNotOfficial true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiStepAdvanced : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteApiStepAdvanced true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$api_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$api_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$api_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$api_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$api_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def freestandingDualEqualityWriteFreestandingHc' "$api_mod"; then
      echo "error: missing freestandingDualEqualityWriteFreestandingHc API def in $api_mod" >&2
      exit 1
    fi
    # requireDualSsotEqual / dualSsotBlockEqual defs live on DualEqWriteLoad (long-file peel).
    _api_load="${api_mod%DualEqWriteApi.lean}DualEqWriteLoad.lean"
    if ! grep -qF 'def requireDualSsotEqual' "$api_mod" \
        && ! { [[ -f "$_api_load" ]] && grep -qF 'def requireDualSsotEqual' "$_api_load"; }; then
      echo "error: missing requireDualSsotEqual in $api_mod or $_api_load" >&2
      exit 1
    fi
    if ! grep -qF 'def dualSsotBlockEqual' "$api_mod" \
        && ! { [[ -f "$_api_load" ]] && grep -qF 'def dualSsotBlockEqual' "$_api_load"; }; then
      echo "error: missing dualSsotBlockEqual in $api_mod or $_api_load" >&2
      exit 1
    fi
    if ! grep -qF 'DUAL-SSOT-EQUALITY' "$api_mod"; then
      echo "error: missing DUAL-SSOT-EQUALITY in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API' "$api_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API in $api_mod" >&2
      exit 1
    fi
    if ! grep -qF 'IO.FS.writeFile' "$api_mod"; then
      echo "error: missing IO.FS.writeFile (real write) in $api_mod" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: B36 measured true + perform claimed false + gap open.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiPresent : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiPresent true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiAuthorityNotEmit true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiNotOfficial : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiNotOfficial true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteApiStepAdvanced : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteApiStepAdvanced true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $self_fs (B37 closed)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$self_fs"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $self_fs (B37 dual-eq)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingPerformDualEqualityWriteApiPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteApiPartialReady in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe pins; living tip B38 dual-eq official.
    if ! grep -qF 'freestanding-perform-dual-equality-write-api' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-dual-equality-write-api in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-dual-equality-write-api-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-dual-equality-write-api-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-dual-equality-write-api' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-perform-dual-equality-write-api in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'DualEqWriteApi' "${just_sources[@]}"; then
      echo "error: missing DualEqWriteApi in modular just tree" >&2
      exit 1
    fi
    # Diagnostic FreestandingEmit Lake path remains (B13 write-freestanding-hc).
    if ! grep -qF 'lake build slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake build slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake exe slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    # Living tip after B38: official just build uses freestanding dual-eq WRITE.
    if ! grep -q 'build:' "${just_sources[@]}"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$product_wire_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (B38 expects FreestandingEmit retired as official)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-api'; then
      echo "error: build cites freestanding-perform-dual-equality-write-api (measure path, not official writer)" >&2
      exit 1
    fi
    # Prerequisite: B35 dual-equality WRITE close path still green (Lake-free).
    just freestanding-perform-dual-equality-write-close-path
    echo "freestanding-perform-dual-equality-write-api: GREEN (B36 dual-equality WRITE API measured; living tip B38 official dual-eq path; land-time module perform claimed false; SelfApplyFs living tip true after B39; DependsOnLake true)"

# Partial B36 measure print + real dual-equality write (Lake diagnostic; optional).
# API dual-pin is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-api-measure,
# slake-freestanding-perform-dual-equality-write-api,
# DualEqWriteApi
freestanding-perform-dual-equality-write-api-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    root="$(pwd)"
    echo "== freestanding-perform-dual-equality-write-api-measure (B36 dual-equality WRITE API measure + write; gap closed after B37; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    echo "  API measured true; present true; authority not emit; not official; gap closed after B37; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteApi.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteApi / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-api-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-api
      # Pass repo root (justfile cwd) so emit/ SSOT resolves under root/src/systems/emit.
      lake exe slake-freestanding-perform-dual-equality-write-api -- "$root"
    )
    echo "freestanding-perform-dual-equality-write-api-measure: GREEN (API measured true; present true; dual-equality write exercised; gap closed after B37; perform claimed false; Full false)"

# Partial B37: freestanding product path PERFORM DUAL-EQUALITY WRITE CAPABLE-GAP beyond B36 API.
# Closes productPathDualEqualityWriteParityGapOpen with real Capable dual-equality WRITE
# evidence (freestandingCapableWriteFreestandingHc is dual-eq via Emit* + requireDualSsotEqual;
# productPathCapableWriteDualEqualityLive). Does NOT flip perform claimed. Does NOT switch
# just build / retire FreestandingEmit (RETIRE-OFFICIAL next).
# productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true;
# productPathDualEqualityWriteCapableGapClosed true;
# productPathCapableWriteDualEqualityLive true;
# productPathDualEqualityWriteCapableGapStepAdvanced true;
# productPathDualEqualityWriteParityGapOpen false;
# productPathCapableWriteStructuralNotDualEquality false;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-capable-gap,
# productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
# productPathCapableWriteDualEqualityLive,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP
freestanding-perform-dual-equality-write-capable-gap:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-dual-equality-write-capable-gap (B37 CAPABLE-GAP close; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    echo "  framing: Capable WRITE dual-eq (Emit* + requireDualSsotEqual); parity gap closed; land-time FreestandingEmit official pin; living tip B38 retired"
    echo "  distinct from B36 freestanding-perform-dual-equality-write-api (API present, not CAPABLE-GAP close)"
    echo "  CAPABLE-GAP measured true; gap closed true; dual-eq live true; step advanced; perform claimed false; DependsOnLake true; not Full; not complete"
    # CAPABLE-GAP module must not import FreestandingEmit.
    gap_mod="$lean_dir/DualEqWriteCapableGap.lean"
    if [[ ! -f "$gap_mod" ]]; then
      echo "error: missing dual-equality WRITE CAPABLE-GAP module $gap_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$gap_mod"; then
      echo "error: dual-equality WRITE CAPABLE-GAP module imports FreestandingEmit: $gap_mod" >&2
      exit 1
    fi
    # CAPABLE-GAP module honesty pins (gap closed / dual-eq live).
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapClosed : Bool := true' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteCapableGapClosed true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$gap_mod"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteCapableGapStepAdvanced true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$gap_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$gap_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$gap_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $gap_mod" >&2
      exit 1
    fi
    if ! grep -qF 'FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP' "$gap_mod"; then
      echo "error: missing FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP in $gap_mod" >&2
      exit 1
    fi
    # Capable WRITE module must have dual-eq live + Emit* imports + requireDualSsotEqual.
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
    if ! grep -qF 'DUAL-SSOT-EQUALITY' "$capable_mod"; then
      echo "error: missing DUAL-SSOT-EQUALITY in $capable_mod" >&2
      exit 1
    fi
    for emit_mod in EmitBanner EmitMult EmitLinear EmitErasure EmitExtract EmitTypes EmitProgram EmitGraph EmitCompose EmitPlan EmitApply EmitBody; do
      if ! grep -q "import SystemsLean.${emit_mod}" "$capable_mod"; then
        echo "error: Capable WRITE module missing import SystemsLean.${emit_mod}: $capable_mod" >&2
        exit 1
      fi
    done
    # SelfApplyFs dual-pin: CAPABLE-GAP measured + gap closed + dual-eq live + perform claimed false.
    self_fs="$lean_dir/SelfApplyFs.lean"
    if [[ ! -f "$self_fs" ]]; then
      echo "error: missing SelfApplyFs $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapMeasured true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapClosed : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteCapableGapClosed true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteDualEqualityLive : Bool := true' "$self_fs"; then
      echo "error: missing productPathCapableWriteDualEqualityLive true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteCapableGapStepAdvanced true in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := false' "$self_fs"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := false' "$self_fs"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality false in $self_fs" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformClaimed true in $self_fs (B39 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady' "$self_fs"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady in $self_fs" >&2
      exit 1
    fi
    # justfile: Lake-free recipe + measure + Lake exe pins; living tip B38 FreestandingEmit retired.
    if ! grep -qF 'freestanding-perform-dual-equality-write-capable-gap' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-dual-equality-write-capable-gap in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-perform-dual-equality-write-capable-gap-measure' "${just_sources[@]}"; then
      echo "error: missing freestanding-perform-dual-equality-write-capable-gap-measure in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'slake-freestanding-perform-dual-equality-write-capable-gap' "${just_sources[@]}"; then
      echo "error: missing slake-freestanding-perform-dual-equality-write-capable-gap in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'DualEqWriteCapableGap' "${just_sources[@]}"; then
      echo "error: missing DualEqWriteCapableGap in modular just tree" >&2
      exit 1
    fi
    # Diagnostic FreestandingEmit Lake path remains (B13 write-freestanding-hc).
    if ! grep -qF 'lake build slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake build slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake exe slake-emit-freestanding-c (diagnostic FreestandingEmit path)" >&2
      exit 1
    fi
    if ! grep -q 'build:' "${just_sources[@]}"; then
      echo "error: missing build recipe" >&2
      exit 1
    fi
    # Living tip after B38: official just build uses freestanding dual-eq WRITE.
    out_body="$(awk '/^build:/{p=1;next} p && /^[a-zA-Z0-9_-]+:/{exit} p' "$product_wire_just")"
    if ! printf '%s\n' "$out_body" | grep -q 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'slake-emit-freestanding-c'; then
      echo "error: build still uses slake-emit-freestanding-c (B38 expects FreestandingEmit retired as official)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-capable-gap'; then
      echo "error: build cites freestanding-perform-dual-equality-write-capable-gap (measure path, not official writer)" >&2
      exit 1
    fi
    if printf '%s\n' "$out_body" | grep -q 'freestanding-perform-dual-equality-write-api'; then
      echo "error: build cites freestanding-perform-dual-equality-write-api (measure path, not official writer)" >&2
      exit 1
    fi
    # SelfApplyFs living tip after B38: StillUsesFreestandingEmit false.
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$self_fs"; then
      echo "error: missing SelfApplyFs StillUsesFreestandingEmit false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$self_fs"; then
      echo "error: missing SelfApplyFs DualEqualityBlocksRetirement false pin (B38 living tip)" >&2
      exit 1
    fi
    # Prerequisite: B36 dual-equality WRITE API still green (Lake-free).
    just freestanding-perform-dual-equality-write-api
    echo "freestanding-perform-dual-equality-write-capable-gap: GREEN (B37 CAPABLE-GAP closed; living tip B38 FreestandingEmit retired; land-time module perform claimed false; SelfApplyFs living tip true after B39; DependsOnLake true)"

# Partial B37 measure print (Lake diagnostic; optional). CAPABLE-GAP dual-pin is Lake-free above.
# Greppable: freestanding-perform-dual-equality-write-capable-gap-measure,
# slake-freestanding-perform-dual-equality-write-capable-gap,
# DualEqWriteCapableGap
freestanding-perform-dual-equality-write-capable-gap-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-capable-gap-measure (B37 CAPABLE-GAP measure; gap closed; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    echo "  CAPABLE-GAP measured true; gap closed true; dual-eq live true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteCapableGap.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteCapableGap / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-capable-gap-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-capable-gap
      lake exe slake-freestanding-perform-dual-equality-write-capable-gap
    )
    echo "freestanding-perform-dual-equality-write-capable-gap-measure: GREEN (CAPABLE-GAP measured true; gap closed; dual-eq live; perform claimed false; Full false)"

# Partial B38: freestanding product path PERFORM RETIRE-OFFICIAL beyond B37 CAPABLE-GAP.
# Official just build uses freestanding dual-eq WRITE
# (freestanding-capable-regenerate / freestandingCapableWriteFreestandingHc Emit* +
# requireDualSsotEqual) as product authority -- NOT FreestandingEmit.
# productPathOfficialPathRetireOfficialMeasured true;
# productPathOfficialPathUsesDualEqualityWrite true;
# productPathOfficialPathStillUsesFreestandingEmit false (SelfApplyFs living tip);
# productPathOfficialPathDualEqualityBlocksRetirement false;
# productPathOfficialPathRetireFreestandingEmitRequired false;
# productPathOfficialPathStillUsesLake true; productPathFreestandingPerformClaimed false;
# DependsOnLake true; CAPABLE-GAP stays closed; complete stays false.
# Greppable: freestanding-retire-official,
# productPathOfficialPathRetireOfficialMeasured,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE,
# FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# productPathOfficialPathUsesDualEqualityWrite,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL
