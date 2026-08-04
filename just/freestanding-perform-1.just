# Modular just: just/freestanding-perform-1.just -- role recipes (import into root justfile).
# Partial B31: freestanding product path PERFORM EVIDENCE beyond B30 authority.
# Perform framing (not ownership authority rebrand): freestanding-capable
# performers for FREESTANDING-PERFORM-GAP-* with AuthorityNotEmit + Capable*
# Lake-free depth + install + ordered pipeline cite. Lake-free: no lake build/exe.
# productPathFreestandingPerformEvidenceClaimed true; productPathFreestandingPerformClaimed
# stays false (DependsOnLake true; land-time B31 FreestandingEmit official pin;
# living tip B38 FreestandingEmit retired).
# Greppable: freestanding-perform-evidence,
# productPathFreestandingPerformEvidenceClaimed,
# FREESTANDING-PERFORM-EVIDENCE,
# FREESTANDING-PERFORM-EVIDENCE-READ-SSOT,
# FREESTANDING-PERFORM-EVIDENCE-COMPOSE,
# FREESTANDING-PERFORM-EVIDENCE-WRITE-HC,
# FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT,
# FREESTANDING-PERFORM-EVIDENCE-ORDERED,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE
freestanding-perform-evidence:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    echo "== freestanding-perform-evidence (B31 freestanding perform evidence; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    echo "  token: FREESTANDING-PERFORM-EVIDENCE"
    echo "  framing: perform evidence (freestanding-capable performers); not ownership authority"
    echo "  pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    echo "  Lake-free: no lake build/exe; freestanding-capable Capable* depth + install (perform framing)"
    echo "  distinct from B30 ownership-regenerate-product-path-authority (ownership framing)"
    echo "  distinct from B29 ownership-regenerate-lake-free join"
    echo "  evidence claimed true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Perform-evidence authority modules must not import FreestandingEmit.
    ev_modules=(
      "CapableRead.lean"
      "CapableCompose.lean"
      "CapableWriteHc.lean"
      "CapableRegenerate.lean"
      "InstallOut.lean"
      "PerformEvidence.lean"
    )
    for m in "${ev_modules[@]}"; do
      path="$lean_dir/$m"
      if [[ ! -f "$path" ]]; then
        echo "error: missing perform-evidence module $path" >&2
        exit 1
      fi
      if grep -q 'import SystemsLean.FreestandingEmit' "$path"; then
        echo "error: perform-evidence module imports FreestandingEmit: $path" >&2
        exit 1
      fi
    done
    # AuthorityNotEmit pins true on freestanding-capable path modules.
    auth_pins=(
      "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
    )
    pin_files=(
      "CapableRead.lean"
      "CapableCompose.lean"
      "CapableWriteHc.lean"
      "CapableRegenerate.lean"
      "InstallOut.lean"
    )
    i=0
    for pin in "${auth_pins[@]}"; do
      path="$lean_dir/${pin_files[$i]}"
      if ! grep -qF "$pin" "$path"; then
        echo "error: missing AuthorityNotEmit pin in $path: $pin" >&2
        exit 1
      fi
      i=$((i + 1))
    done
    # Freestanding-capable perform API cites present (B16..B20 real performers).
    api_checks=(
      "CapableRead.lean:freestandingCapableReadDualSsot"
      "CapableCompose.lean:freestandingCapableComposePlanApplyBody"
      "CapableWriteHc.lean:freestandingCapableWriteFreestandingHc"
      "InstallOut.lean:freestandingCapableInstallFreestandingOut"
      "CapableRegenerate.lean:freestandingCapableOrderedRegenerate"
      "CapableRegenerate.lean:FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    )
    for pair in "${api_checks[@]}"; do
      file="${pair%%:*}"
      token="${pair#*:}"
      path="$lean_dir/$file"
      if ! grep -qF "$token" "$path"; then
        echo "error: missing perform API/token $token in $path" >&2
        exit 1
      fi
    done
    # Evidence module honesty pins: evidence claimed true; perform claimed false.
    ev_mod="$lean_dir/PerformEvidence.lean"
    if ! grep -qF 'def productPathFreestandingPerformEvidenceClaimed : Bool := true' "$ev_mod"; then
      echo "error: missing productPathFreestandingPerformEvidenceClaimed true in $ev_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$ev_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $ev_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$ev_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $ev_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-EVIDENCE" \
      "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT" \
      "FREESTANDING-PERFORM-EVIDENCE-COMPOSE" \
      "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC" \
      "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT" \
      "FREESTANDING-PERFORM-EVIDENCE-ORDERED" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "FREESTANDING-PERFORM-GAP-READ-SSOT" \
      "FREESTANDING-PERFORM-GAP-COMPOSE" \
      "FREESTANDING-PERFORM-GAP-WRITE-HC"; do
      if ! grep -qF "$tok" "$ev_mod"; then
        echo "error: missing perform-evidence token $tok in $ev_mod" >&2
        exit 1
      fi
    done
    # Perform evidence path: freestanding-capable Lake-free depth + install (no lake).
    # Does NOT invoke ownership-regenerate-*-only path pieces (those are ownership framing).
    just freestanding-capable-read-lake-free
    just freestanding-capable-compose-lake-free
    just freestanding-capable-write-hc-lake-free
    just install-freestanding-c-out
    echo "freestanding-perform-evidence: GREEN (B31 freestanding perform evidence claimed; perform claimed false; DependsOnLake true)"

# Partial B31 measure print (Lake diagnostic; optional). Evidence is Lake-free recipe above.
# Greppable: freestanding-perform-evidence-measure, slake-freestanding-perform-evidence,
# PerformEvidence
freestanding-perform-evidence-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-evidence-measure (B31 perform evidence measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    echo "  evidence claimed true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/PerformEvidence.lean" ]]; then
      echo "error: missing SystemsLean PerformEvidence / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-evidence-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-evidence
      lake exe slake-freestanding-perform-evidence
    )
    echo "freestanding-perform-evidence-measure: GREEN (evidence claimed true; perform claimed false; Full false)"

# Partial B32: freestanding product path PERFORM OFFICIAL-PATH GAP beyond B31 evidence.
# Measures that official regenerate (just build) still uses Lake
# elaborating FreestandingEmit while B31 perform evidence claimed true.
# Gap measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit). Lake-free dual-pin
# checks + B31 evidence re-green; no lake build/exe on gap recipe itself.
# productPathFreestandingPerformOfficialPathGapMeasured true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-official-path,
# productPathFreestandingPerformOfficialPathGapMeasured,
# FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
# FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT,
# FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT,
# FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER,
# FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH
freestanding-perform-official-path:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-official-path (B32 official-path gap; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    echo "  token: FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    echo "  framing: land-time B32 Lake FreestandingEmit official pin; living tip B38 FreestandingEmit retired; B31 evidence remains"
    echo "  distinct from B31 freestanding-perform-evidence (evidence substrate, not gap measure)"
    echo "  gap measured true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Official-path gap module must not import FreestandingEmit (gap measure only).
    gap_mod="$lean_dir/OfficialPath.lean"
    if [[ ! -f "$gap_mod" ]]; then
      echo "error: missing official-path gap module $gap_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$gap_mod"; then
      echo "error: official-path gap module imports FreestandingEmit: $gap_mod" >&2
      exit 1
    fi
    # Gap module honesty pins: gap measured true; perform claimed false; still emit+lake.
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathGapMeasured true in $gap_mod" >&2
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
    if ! grep -qF 'def productPathFreestandingPerformEvidenceClaimed : Bool := true' "$gap_mod"; then
      echo "error: missing productPathFreestandingPerformEvidenceClaimed true in $gap_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c"; do
      if ! grep -qF "$tok" "$gap_mod"; then
        echo "error: missing official-path gap token $tok in $gap_mod" >&2
        exit 1
      fi
    done
    # Official path justfile still cites Lake FreestandingEmit (proved residual).
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
    # SelfApplyFs dual-pin: gap measured true next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs gap measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B31 freestanding perform evidence still green (Lake-free).
    just freestanding-perform-evidence
    echo "freestanding-perform-official-path: GREEN (B32 official-path gap measured; perform claimed false; DependsOnLake true; land-time FreestandingEmit official pin; living tip B38 FreestandingEmit retired)"

# Partial B32 measure print (Lake diagnostic; optional). Gap is Lake-free recipe above.
# Greppable: freestanding-perform-official-path-measure,
# slake-freestanding-perform-official-path,
# OfficialPath
freestanding-perform-official-path-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-official-path-measure (B32 official-path gap measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    echo "  gap measured true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialPath.lean" ]]; then
      echo "error: missing SystemsLean OfficialPath / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-official-path-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-official-path
      lake exe slake-freestanding-perform-official-path
    )
    echo "freestanding-perform-official-path-measure: GREEN (gap measured true; perform claimed false; Full false)"

# Partial B33: freestanding product path PERFORM OFFICIAL-PATH ALTERNATE beyond B32 gap.
# Measures freestanding-capable ordered regenerate as non-FreestandingEmit alternate
# writer that is NOT official just build, and dual-equality / structural WRITE
# embed honesty still blocks retiring FreestandingEmit as official writer.
# Alternate measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit with dual-equality evidence).
# Lake-free dual-pin checks + B32 gap re-green; no lake build/exe on alternate recipe itself.
# productPathFreestandingPerformOfficialPathAlternateMeasured true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true;
# productPathOfficialPathDualEqualityBlocksRetirement true.
# Greppable: freestanding-perform-official-path-alternate,
# productPathFreestandingPerformOfficialPathAlternateMeasured,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER,
# FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL,
# FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE
freestanding-perform-official-path-alternate:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-official-path-alternate (B33 official-path alternate; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    echo "  token: FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    echo "  framing: freestanding-capable-regenerate alternate present; land-time not official; dual-equality blocks at B33 land; living tip B38 same writer official"
    echo "  distinct from B32 freestanding-perform-official-path (gap measure, not alternate dual-pin)"
    echo "  alternate measured true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Alternate module must not import FreestandingEmit (measure only).
    alt_mod="$lean_dir/OfficialPathAlternate.lean"
    if [[ ! -f "$alt_mod" ]]; then
      echo "error: missing official-path alternate module $alt_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$alt_mod"; then
      echo "error: official-path alternate module imports FreestandingEmit: $alt_mod" >&2
      exit 1
    fi
    # Alternate module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathAlternateMeasured true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$alt_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateWriterPresent : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathAlternateWriterPresent true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateNotOfficial : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathAlternateNotOfficial true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$alt_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $alt_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true' "$alt_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathGapMeasured true in $alt_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "freestanding-capable-regenerate" \
      "freestandingCapableOrderedRegenerate" \
      "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE" \
      "CapableRegenerate"; do
      if ! grep -qF "$tok" "$alt_mod"; then
        echo "error: missing official-path alternate token $tok in $alt_mod" >&2
        exit 1
      fi
    done
    # Alternate freestanding-capable regenerate module + just recipe present.
    regen_mod="$lean_dir/CapableRegenerate.lean"
    if [[ ! -f "$regen_mod" ]]; then
      echo "error: missing freestanding-capable regenerate alternate $regen_mod" >&2
      exit 1
    fi
    if ! grep -qF 'freestandingCapableOrderedRegenerate' "$regen_mod"; then
      echo "error: missing freestandingCapableOrderedRegenerate in $regen_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$regen_mod"; then
      echo "error: freestanding-capable regenerate imports FreestandingEmit (must stay AuthorityNotEmit): $regen_mod" >&2
      exit 1
    fi
    if [[ ! -f justfile && ! -f "$root/justfile" ]]; then
      echo "error: missing root justfile" >&2
      exit 1
    fi
    if ! grep -qF 'freestanding-capable-regenerate:' "${just_sources[@]}"; then
      echo "error: missing freestanding-capable-regenerate recipe in modular just tree" >&2
      exit 1
    fi
    # Land-time B33: FreestandingEmit still in justfile (historical dual-pin).
    # Living tip B38: official just build uses freestanding-capable-regenerate.
    if ! grep -qF 'build:' "${just_sources[@]}"; then
      echo "error: missing build recipe in modular just tree" >&2
      exit 1
    fi
    if ! grep -qF 'lake build slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake build slake-emit-freestanding-c cite in modular just tree (land-time B33 dual-pin)" >&2
      exit 1
    fi
    if ! grep -qF 'lake exe slake-emit-freestanding-c' "${just_sources[@]}"; then
      echo "error: missing lake exe slake-emit-freestanding-c cite in modular just tree (land-time B33 dual-pin)" >&2
      exit 1
    fi
    if ! grep -qF 'SystemsLean.FreestandingEmit' "${just_sources[@]}"; then
      echo "error: missing SystemsLean.FreestandingEmit cite in modular just tree (land-time B33 dual-pin)" >&2
      exit 1
    fi
    # Living tip after B38: official path uses freestanding-capable-regenerate
    # (historical B33 land-time: alternate not official yet; dual-equality blocked).
    # Extract build recipe body until next top-level recipe.
    if ! awk '
      /^build:/ { in_rec=1; next }
      in_rec && /^[a-zA-Z0-9_-]+:/ { exit }
      in_rec { print }
    ' "$product_wire_just" | grep -qF 'freestanding-capable-regenerate'; then
      echo "error: build missing freestanding-capable-regenerate (B38 RETIRE-OFFICIAL living tip)" >&2
      exit 1
    fi
    # SelfApplyFs dual-pin: alternate measured true next to perform claimed false.
    # Living tip after B38: dual-equality blocks retirement false (retired).
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs alternate measured true pin" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality blocks false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs StillUsesFreestandingEmit false pin (B38 living tip)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathAlternateNotOfficial : Bool := false' "$host_pin"; then
      echo "error: missing SelfApplyFs AlternateNotOfficial false pin (B38 living tip; same writer official)" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs perform claimed false pin" >&2
      exit 1
    fi
    # Prerequisite: B32 official-path gap still green (Lake-free).
    just freestanding-perform-official-path
    echo "freestanding-perform-official-path-alternate: GREEN (B33 alternate measured; living tip B38 same writer official; AlternateNotOfficial false; perform claimed false; DependsOnLake true)"

# Partial B33 measure print (Lake diagnostic; optional). Alternate is Lake-free recipe above.
# Greppable: freestanding-perform-official-path-alternate-measure,
# slake-freestanding-perform-official-path-alternate,
# OfficialPathAlternate
freestanding-perform-official-path-alternate-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-official-path-alternate-measure (B33 official-path alternate measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    echo "  alternate measured true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/OfficialPathAlternate.lean" ]]; then
      echo "error: missing SystemsLean OfficialPathAlternate / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-official-path-alternate-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-official-path-alternate
      lake exe slake-freestanding-perform-official-path-alternate
    )
    echo "freestanding-perform-official-path-alternate-measure: GREEN (alternate measured true; perform claimed false; Full false)"

# Partial B34: freestanding product path PERFORM DUAL-EQUALITY WRITE PARITY beyond B33 alternate.
# Measures parity gap: freestandingCapableWriteFreestandingHc is structural HEADER/BODY
# embed only (not DUAL-SSOT-EQUALITY vs Lean Mult..Body fragments / requireDualSsotEqual);
# gap stays open; dual-equality still blocks retiring FreestandingEmit as official writer.
# Parity measured true is NOT perform claimed (FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE
# stays open until official path retires FreestandingEmit with dual-equality evidence).
# Lake-free dual-pin checks + B33 alternate re-green; no lake build/exe on parity recipe itself.
# productPathFreestandingPerformDualEqualityWriteParityMeasured true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-parity,
# productPathFreestandingPerformDualEqualityWriteParityMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY
freestanding-perform-dual-equality-write-parity:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=(justfile just/*.just)
    product_wire_just="just/product-wire.just"
    echo "== freestanding-perform-dual-equality-write-parity (B34 dual-equality WRITE parity; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    echo "  token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    echo "  framing: Capable WRITE structural embed != FreestandingEmit DUAL-SSOT-EQUALITY; gap open"
    echo "  distinct from B33 freestanding-perform-official-path-alternate (alternate dual-pin, not WRITE parity)"
    echo "  parity measured true; gap open true; perform claimed false; DependsOnLake true; not Full; not complete"
    # Parity module must not import FreestandingEmit (measure only).
    parity_mod="$lean_dir/DualEqWriteParity.lean"
    if [[ ! -f "$parity_mod" ]]; then
      echo "error: missing dual-equality WRITE parity module $parity_mod" >&2
      exit 1
    fi
    if grep -q 'import SystemsLean.FreestandingEmit' "$parity_mod"; then
      echo "error: dual-equality WRITE parity module imports FreestandingEmit: $parity_mod" >&2
      exit 1
    fi
    # Parity module honesty pins.
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformDualEqualityWriteParityMeasured true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathDualEqualityWriteParityGapOpen : Bool := true' "$parity_mod"; then
      echo "error: missing productPathDualEqualityWriteParityGapOpen true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathCapableWriteStructuralNotDualEquality : Bool := true' "$parity_mod"; then
      echo "error: missing productPathCapableWriteStructuralNotDualEquality true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformClaimed : Bool := false' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformClaimed false in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathPerformDependsOnLake : Bool := true' "$parity_mod"; then
      echo "error: missing productPathPerformDependsOnLake true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesFreestandingEmit : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathStillUsesFreestandingEmit true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathStillUsesLake : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathStillUsesLake true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathRetireFreestandingEmitRequired true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true' "$parity_mod"; then
      echo "error: missing productPathOfficialPathDualEqualityBlocksRetirement true in $parity_mod" >&2
      exit 1
    fi
    if ! grep -qF 'def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true' "$parity_mod"; then
      echo "error: missing productPathFreestandingPerformOfficialPathAlternateMeasured true in $parity_mod" >&2
      exit 1
    fi
    for tok in \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL" \
      "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT" \
      "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT" \
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" \
      "build" \
      "FreestandingEmit" \
      "slake-emit-freestanding-c" \
      "DUAL-SSOT-EQUALITY" \
      "requireDualSsotEqual" \
      "freestandingCapableWriteFreestandingHc" \
      "CapableWriteHc"; do
      if ! grep -qF "$tok" "$parity_mod"; then
        echo "error: missing dual-equality WRITE parity token $tok in $parity_mod" >&2
        exit 1
      fi
    done
    # Capable WRITE module present (structural side of parity).
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
    # SelfApplyFs dual-pin: parity measured true + gap closed after B37 next to perform claimed false.
    host_pin="$lean_dir/SelfApplyFs.lean"
    if ! grep -qF 'def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true' "$host_pin"; then
      echo "error: missing SelfApplyFs dual-equality WRITE parity measured true pin" >&2
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
    # Prerequisite: B33 official-path alternate still green (Lake-free).
    just freestanding-perform-official-path-alternate
    echo "freestanding-perform-dual-equality-write-parity: GREEN (B34 dual-equality WRITE parity measured; gap closed after B37; perform claimed false; DependsOnLake true; living tip B38 FreestandingEmit retired)"

# Partial B34 measure print (Lake diagnostic; optional). Parity is Lake-free recipe above.
# Greppable: freestanding-perform-dual-equality-write-parity-measure,
# slake-freestanding-perform-dual-equality-write-parity,
# DualEqWriteParity
freestanding-perform-dual-equality-write-parity-measure:
    #!/usr/bin/env bash
    set -euo pipefail
    systems_dir="src/systems"
    echo "== freestanding-perform-dual-equality-write-parity-measure (B34 dual-equality WRITE parity measure; not perform claimed) =="
    echo "  stage: SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    echo "  parity measured true; gap open true; perform claimed false; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open"
    echo "  not freestanding perform claimed; not residual free; not PROVABLY"
    if [[ ! -f "$systems_dir/lakefile.lean" || ! -f "$systems_dir/SystemsLean/DualEqWriteParity.lean" ]]; then
      echo "error: missing SystemsLean DualEqWriteParity / lakefile under $systems_dir" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; freestanding-perform-dual-equality-write-parity-measure requires host Lean pin" >&2
      echo "  install elan pin from $systems_dir/lean-toolchain then retry." >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-freestanding-perform-dual-equality-write-parity
      lake exe slake-freestanding-perform-dual-equality-write-parity
    )
    echo "freestanding-perform-dual-equality-write-parity-measure: GREEN (parity measured true; gap open true; perform claimed false; Full false)"

# Partial B35 dual-equality WRITE close path (beyond B34 parity). Lake-free dual-pin:
# ordered close-path steps named; land-time not gap closed / gap open / Capable
# structural; living tip B37 gap closed + B38 FreestandingEmit retired; B34 parity
# re-green. Does NOT flip perform claimed. Does NOT close dual-equality gap from
# B35 land alone. Living tip just build is freestanding-capable-regenerate.
# productPathFreestandingPerformDualEqualityWriteClosePathMeasured true;
# productPathDualEqualityWriteClosePathNamed true;
# productPathDualEqualityWriteClosePathNotGapClosed true;
# productPathDualEqualityWriteParityGapOpen true;
# productPathCapableWriteStructuralNotDualEquality true;
# productPathFreestandingPerformClaimed stays false; DependsOnLake true.
# Greppable: freestanding-perform-dual-equality-write-close-path,
# productPathFreestandingPerformDualEqualityWriteClosePathMeasured,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED,
# FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL,
# FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
# FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
# SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH
